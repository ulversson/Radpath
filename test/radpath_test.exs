Code.require_file "test_helper.exs", __DIR__

defmodule RadpathTest do
  use ExUnit.CaseTemplate
  import PathHelpers

  using do
    quote do
      import PathHelpers
    end
  end

  setup do
    File.mkdir_p!(tmp_path)
    :ok
  end
  
  teardown do
    File.rm_rf(tmp_path)
    :ok
  end
end

defmodule RadpathTestReal do
  use ExUnit.Case
  import PathHelpers

  import Radpath
  test :test_listing_of_files do
    files = Radpath.files(fixture_path, "txt") |> Enum.map(&Path.basename(&1))
    assert files == ["file1.txt", "file2.txt"]
  end
  
  test :test_listing_of_dirs do
    dirs = Radpath.dirs(fixture_path) |> Enum.map(&Path.basename(&1))
    assert dirs == ["testdir3", "testdir2", "testdir1"]
  end
end

