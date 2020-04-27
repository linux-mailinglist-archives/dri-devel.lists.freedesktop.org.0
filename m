Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5A1B96E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 07:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8CA89CB9;
	Mon, 27 Apr 2020 05:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B4589CB9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 05:58:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CC27680487;
 Mon, 27 Apr 2020 07:58:01 +0200 (CEST)
Date: Mon, 27 Apr 2020 07:57:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] get_maintainer: Add email addresses from .yaml files
Message-ID: <20200427055755.GA21898@ravnborg.org>
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
 <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
 <9a32f150f85f851d04afd148b2a9a5cf203f7ce1.camel@perches.com>
 <7beaedfd63017973b910dd21cac13ecb42dbe503.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7beaedfd63017973b910dd21cac13ecb42dbe503.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=IJv9LcIfAAAA:8 a=7gkXJVJtAAAA:8
 a=e66IHeAwct5_nrS6dCUA:9 a=wPNLvfGTeEIA:10 a=cmr4hm9N53k6aw-X_--Q:22
 a=E9Po1WZjFZOl8hwRPBS3:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe.

On Sun, Apr 26, 2020 at 10:40:52PM -0700, Joe Perches wrote:
> .yaml files can contain maintainer/author addresses and it seems
> unlikely or unnecessary that individual MAINTAINER file section
> entries for each .yaml file will be created.
> =

> So dd the email addresses found in .yaml files to the default
     ^
     add

> get_maintainer output.
> =

> The email addresses are marked with "(in file)" when using the
> "--roles" or "--rolestats" options.
> =

> Miscellanea:
> =

> o Change $file_emails to $email_file_emails to avoid visual
>   naming conflicts with @file_emails
> =

> Signed-off-by: Joe Perches <joe@perches.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sam Ravnborg <sam@ravnborg.org>

The patch did not apply on top of -rc3, but it was trivial to fix.
Tested and works like a charm.
Thanks for doing this!

	Sam

> ---
>  scripts/get_maintainer.pl | 44 +++++++++++++++++++++++++++++------------=
---
>  1 file changed, 29 insertions(+), 15 deletions(-)
> =

> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 6cbcd1..6d973f 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -57,7 +57,7 @@ my $status =3D 0;
>  my $letters =3D "";
>  my $keywords =3D 1;
>  my $sections =3D 0;
> -my $file_emails =3D 0;
> +my $email_file_emails =3D 0;
>  my $from_filename =3D 0;
>  my $pattern_depth =3D 0;
>  my $self_test =3D undef;
> @@ -69,6 +69,12 @@ my $vcs_used =3D 0;
>  =

>  my $exit =3D 0;
>  =

> +my @files =3D ();
> +my @fixes =3D ();			# If a patch description includes Fixes: lines
> +my @range =3D ();
> +my @keyword_tvi =3D ();
> +my @file_emails =3D ();
> +
>  my %commit_author_hash;
>  my %commit_signer_hash;
>  =

> @@ -266,7 +272,7 @@ if (!GetOptions(
>  		'pattern-depth=3Di' =3D> \$pattern_depth,
>  		'k|keywords!' =3D> \$keywords,
>  		'sections!' =3D> \$sections,
> -		'fe|file-emails!' =3D> \$file_emails,
> +		'fe|file-emails!' =3D> \$email_file_emails,
>  		'f|file' =3D> \$from_filename,
>  		'find-maintainer-files' =3D> \$find_maintainer_files,
>  		'mpath|maintainer-path=3Ds' =3D> \$maintainer_path,
> @@ -424,6 +430,22 @@ sub read_all_maintainer_files {
>      }
>  }
>  =

> +sub maintainers_in_file {
> +    my ($file) =3D @_;
> +
> +    return if ($file =3D~ m@\bMAINTAINERS$@);
> +
> +    if (-f $file && ($email_file_emails || $file =3D~ /\.yaml$/)) {
> +	open(my $f, '<', $file)
> +	    or die "$P: Can't open $file: $!\n";
> +	my $text =3D do { local($/) ; <$f> };
> +	close($f);
> +
> +	my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*[=
\(\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$=
g;
> +	push(@file_emails, clean_file_emails(@poss_addr));
> +    }
> +}
> +
>  #
>  # Read mail address map
>  #
> @@ -504,12 +526,6 @@ sub read_mailmap {
>  =

>  ## use the filenames on the command line or find the filenames in the pa=
tchfiles
>  =

> -my @files =3D ();
> -my @fixes =3D ();			# If a patch description includes Fixes: lines
> -my @range =3D ();
> -my @keyword_tvi =3D ();
> -my @file_emails =3D ();
> -
>  if (!@ARGV) {
>      push(@ARGV, "&STDIN");
>  }
> @@ -527,7 +543,7 @@ foreach my $file (@ARGV) {
>  	$file =3D~ s/^\Q${cur_path}\E//;	#strip any absolute path
>  	$file =3D~ s/^\Q${lk_path}\E//;	#or the path to the lk tree
>  	push(@files, $file);
> -	if ($file ne "MAINTAINERS" && -f $file && ($keywords || $file_emails)) {
> +	if ($file ne "MAINTAINERS" && -f $file && $keywords) {
>  	    open(my $f, '<', $file)
>  		or die "$P: Can't open $file: $!\n";
>  	    my $text =3D do { local($/) ; <$f> };
> @@ -539,10 +555,6 @@ foreach my $file (@ARGV) {
>  		    }
>  		}
>  	    }
> -	    if ($file_emails) {
> -		my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*=
[\(\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}=
$g;
> -		push(@file_emails, clean_file_emails(@poss_addr));
> -	    }
>  	}
>      } else {
>  	my $file_cnt =3D @files;
> @@ -923,6 +935,8 @@ sub get_maintainers {
>  		print("\n");
>  	    }
>  	}
> +
> +	maintainers_in_file($file);
>      }
>  =

>      if ($keywords) {
> @@ -1835,7 +1849,7 @@ tm toggle maintainers
>  tg toggle git entries
>  tl toggle open list entries
>  ts toggle subscriber list entries
> -f  emails in file       [$file_emails]
> +f  emails in file       [$email_file_emails]
>  k  keywords in file     [$keywords]
>  r  remove duplicates    [$email_remove_duplicates]
>  p# pattern match depth  [$pattern_depth]
> @@ -1960,7 +1974,7 @@ EOT
>  		bool_invert(\$email_git_all_signature_types);
>  		$rerun =3D 1;
>  	    } elsif ($sel eq "f") {
> -		bool_invert(\$file_emails);
> +		bool_invert(\$email_file_emails);
>  		$rerun =3D 1;
>  	    } elsif ($sel eq "r") {
>  		bool_invert(\$email_remove_duplicates);
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
