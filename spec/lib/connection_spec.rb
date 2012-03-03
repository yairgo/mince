require_relative '../../lib/mince/connection'

describe Mince::Connection do
  subject { described_class.instance }

  let(:mongo_connection) { mock 'a mongo connection object', :db => db }
  let(:db) { mock 'db'}

  it 'is a mongo connection' do
    Mongo::Connection.should_receive(:new).and_return(mongo_connection)
    mongo_connection.should_receive(:db).with("mince").and_return(db)

    subject.connection.should == mongo_connection
  end
end