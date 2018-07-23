class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, db)
    # pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
    # expect(pikachu_from_db).to eq([[1, "Pikachu", "electric"]])
    sql = <<-SQL
     INSERT INTO pokemon (name, type)
     VALUES (?, ?)
   SQL

   db.execute(sql, name, type)
  end

  def self.find(id, db)
    # Pokemon.save("Pikachu", "electric", @db)
    #
    # pikachu_from_db = Pokemon.find(1, @db)
    # expect(pikachu_from_db.id).to eq(1)
    # expect(pikachu_from_db.name).to eq("Pikachu")
    # expect(pikachu_from_db.type).to eq("electric")
    sql = <<-SQL
     SELECT * FROM pokemon
       WHERE id = ?
    SQL

   pokemon_with_id = db.execute(sql,id).first


   return self.new(name: pokemon_with_id[1], type: pokemon_with_id[2], id: pokemon_with_id[0], db: db)
 end
end
