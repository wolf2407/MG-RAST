package MGRAST::WebPage::Support;

use base qw( WebPage );

use strict;
use warnings;

1;

=pod

=head1 NAME

Support - an instance of WebPage which supports

=head1 DESCRIPTION

Display an support page

=head1 METHODS

=over 4

=item * B<init> ()

Called when the web page is instanciated.

=cut

sub init {
  my ($self) = @_;

  $self->title('Support - Frequently Asked Questions (FAQ)');
  $self->{icon} = "<img src='./Html/mg-help.png' style='width: 20px; height: 20px; padding-right: 5px; position: relative; top: -3px;'>";
  
  return 1;
}


=pod

=item * B<output> ()

Returns the html output of the Support page.

=cut

sub output {
  my ($self) = @_;

  my $content = "";

  my $contact = "metagenomics.cgi?page=Contact";
  if ($self->application->session->user) {
    $contact = "mailto:mg-rast.mcs.anl.gov";
  }

  $content .= "<p width=800px align=justify>This page will try to offer answeres to frequently asked questions. If you do not find a question that you have answered here, please contact our <a href='$contact'>MG-RAST support team</a>. Your questions will help us expand this page, and improve our services.</p>";

  $content .= "<p width=800px align=justify>For detailed guides and news about MG-RAST features, you can also check out the <a href='http://blog.metagenomics.anl.gov/' target=_blank>MG-RAST Blog</a>.</p>";

  $content .= "<div style='border: 1px solid #8FBC3F; width: 600px; padding-left: 5px; padding-bottom: 5px; margin-top: 35px; margin-bottom: 35px;'>";
  $content .= "<p style='color: #8FBC3F; font-weight: bold; font-size: 11pt; margin-top: 4px;'>Table of Contents</>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question1' style='color: black; font-weight: bold;'>&middot; What is MG-RAST</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question2' style='color: black; font-weight: bold;'>&middot; What kinds of data sets does MG-RAST analyze</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question3' style='color: black; font-weight: bold;'>&middot; What type of sequences should I upload</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question4' style='color: black; font-weight: bold;'>&middot; How long does it take to analyze a metagenome</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question5' style='color: black; font-weight: bold;'>&middot; How many metagenomes can I submit</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question6' style='color: black; font-weight: bold;'>&middot; I just submitted a job, but I don't see it in my jobs list</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question7' style='color: black; font-weight: bold;'>&middot; How  frequently do you update the underlying BLAST databases (NR and Phylogeny)</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question8' style='color: black; font-weight: bold;'>&middot; Will my jobs ever be deleted</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question9' style='color: black; font-weight: bold;'>&middot; Who should I contact regarding questions about or problems using MG-RAST</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question10' style='color: black; font-weight: bold;'>&middot; Who can access my uploaded data</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question11' style='color: black; font-weight: bold;'>&middot; Who should I cite when I use this service</a></p>";
  $content .= "<p style='padding-left: 8px; margin-top: 4px; margin-bottom: 4px;'><a href='#question12' style='color: black; font-weight: bold;'>&middot; Why do I need to register for this service</a></p>";
  $content .= "</div>";

  $content .= "<a name='question1'></a><p><b>Q. What is MG-RAST?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. The MG-RAST server is an open source system for annotation and comparative analysis of metagenomes. Users can upload raw sequence data in fasta format; the sequences will be normalized and processed and summaries automatically generated. The server provides several methods to access the different data types, including phylogenetic and metabolic reconstructions, and the ability to compare the metabolism and annotations of one or more metagenomes and genomes. In addition, the server offers a comprehensive search capability. Access to the data is password protected, and all data generated by the automated pipeline is available for download in variety of common formats.</p>";

  $content .= "<a name='question2'></a><p><b>Q. What kinds of data sets does MG-RAST analyze?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. MG-RAST is designed to annotate a large set of short nucleotide sequences--not a complete genome and not amino acid sequences. The <a href='http://rast.nmpdr.org' target=_blank>RAST</a> server should be used if you want complete, or nearly complete prokaryotic genomes to be annotated.</p>";

  $content .= "<a name='question3'></a><p><b>Q. What type of sequences should I upload?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. MG-RAST will accept 454 and Solexa ouput files directly if compressed together in one archive using tar or gzip. All reads for one metagenome should be in one file. Several metagenomes that constitute one project (e.g. a time series) may be uploaded at once by compressing all metagenome files together in one archive using tar or gzip. All sequence reads must be DNA.</p>";

  $content .= "<a name='question4'></a><p><b>Q. How long does it take to analyze a metagenome?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. The answer depends on two factors (1) the size of your dataset and (2) the current server load. Under optimal conditions, it would take about 18 hours to run a 100 million bp through the pipeline.</p>";

  $content .= "<a name='question5'></a><p><b>Q. How many metagenomes can I submit?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. We do not restrict user submission of samples. However, the computation required is massive and samples are processed on a first-come, first-serve basis.</p>";

  $content .= "<a name='question6'></a><p><b>Q. I just submitted a job, but I don't see it in my jobs list?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. We do not restrict user submission of samples. However, the computation required is massive and samples are processed on a first-come, first-serve basis.</p>";

  $content .= "<a name='question7'></a><p><b>Q. How frequently do you update the underlying BLAST databases (NR and Phylogeny)?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. For version 3.0, updates will be every 3-4 months. Information regarding the databases used in the automated analyses can be found in the Help section.</p>";
  
  $content .= "<a name='question8'></a><p><b>Q. Will my jobs ever be deleted?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. Currently MG-RAST policy is that jobs will not be deleted for 120 days.</p>";

  $content .= "<a name='question9'></a><p><b>Q. Who should I contact regarding questions about or problems using MG-RAST?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. All questions, comments or problems regarding MG-RAST should be directed to <a href='$contact'>our support team</a>.</p>";

  $content .= "<a name='question10'></a><p><b>Q. Who can access my uploaded data?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. Your uploaded data will remain confidetial. You will have the ability to share the data with individuals or make it public to the MG-RAST community.</p>";

  $content .= "<a name='question11'></a><p><b>Q. Who should I cite when I use this service?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. If you use our service, please cite:</strong><br/><em>The Metagenomics RAST server - A public resource for the automatic phylogenetic and functional analysis of metagenomes</em> F. Meyer, D. Paarmann, M. D\'Souza, R. Olson , E. M. Glass, M. Kubal, T. Paczian , A. Rodriguez , R. Stevens, A. Wilke, J. Wilkening, R. A. Edwards<br/><em>BMC Bioinformatics 2008, 9:386, [<a href='http://www.biomedcentral.com/1471-2105/9/386' target='_blank'>article</a>]</em></p>";

$content .= "<a name='question12'></a><p><b>Q. Why do I need to register for this service?</b></p><p width=800px align=justify style='margin-bottom: 40px;'>A. We request that users register with a valid email address so we can contact you once the computation is finished or in case user intervention is required.</p>";

  $content .= "<div style='height: 100px;'>&nbsp;</div>";

  return $content;
}