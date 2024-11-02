Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B989B9EF5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 11:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F8810E308;
	Sat,  2 Nov 2024 10:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e7Hj9kQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2019310E308
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 10:40:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2ED035C04A3;
 Sat,  2 Nov 2024 10:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B95C4CEC3;
 Sat,  2 Nov 2024 10:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730544013;
 bh=G8vSms3QEx81BYdaYQQ8p7yFlT3/ZisDZT7QefotGeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7Hj9kQV0Pip3OJRBxCAdDBjZx/M1ic//FsZX3RalJAf0XwbhGL6VJQLq2+hk5IuB
 O67lTdWUk/f0XCCKlx2THddKAJy+p9B9x0PQ426lDVXfOIsXI9ju1PmIptt1fhSisp
 TKwqRNrBx9UEEpCc8RDDqR0RdUX087FCPIvLr/DgdEj/aKcCIb1IBhC4fhBbBAt/DQ
 Jt8Vnc+Y57nuww7BZex/hhA84ZKSKo/XvvGkVRajg9ZV3MPtUkGDF7LWWvIHGX6otg
 4oOtFA3q8No0jTBwXaWcBVgORZZYX7M6cCX8786BqbLkrBn7nNc7YegMjhx04p4oYO
 RXT0TwHw5awig==
Date: Sat, 2 Nov 2024 11:39:37 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, cjwatson@debian.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241102103937.ose4y72a7yl3dcmz@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5cmlld5whomfrgvl"
Content-Disposition: inline
In-Reply-To: <20241102100837.anfonowxfx4ekn3d@illithid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5cmlld5whomfrgvl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Branden,

On Sat, Nov 02, 2024 at 05:08:37AM -0500, G. Branden Robinson wrote:
> [adding Colin Watson to CC; and the groff list because I started musing]
>=20
> Hi Alex,
>=20
> At 2024-11-01T21:07:29+0100, Alejandro Colomar wrote:
> > > > > -/proc/pid/fdinfo/ \- information about file descriptors
> > > > > +.IR /proc/ pid /fdinfo " \- information about file descriptors"
> > > >
> > > > I wouldn't add formatting here for now.  That's something I prefer
> > > > to be cautious about, and if we do it, we should do it in a
> > > > separate commit.
> > >=20
> > > I'll move it to a separate patch. Is the caution due to a lack of
> > > test infrastructure? That could be something to get resolved,
> > > perhaps through Google summer-of-code and the like.
> >=20
> > That change might be controversial.
>=20
> Then let those with objections step forward and make them!

Sure!  But that in itself (and the length of your mail) makes a strong
reason to have this in a separate commit.  :)

I'm not opposed to the change.  Only cautious.

>=20
> (I may be one of them; see below.)
>=20
> > We'd first need to check that all software that reads the NAME section
> > would behave well for this.
>=20
> Not _all_ software, surely.  Anybody can write a craptastic man(7)
> scraper, and several have, mainly back when Web 1.0 was going to eat the
> world.  Most of those have withered on the vine.

Ahh, yeah, I committed the same mistake I criticise in others every now
and then.  $all does not really mean "all".  (-Wall, `make all`, ...)

I meant all [of which I care], which is basically groff(1) and
mandoc(1).  :)

> This is the _Linux_ man-pages project, so what matters are (1) man page
> formatters and (2) man page indexers that GNU/Linux systems actually
> use.  Where people get nervous with the "NAME" section is because of the
> indexer; if one's man(7) _formatter_ can't handle an `IR` call, it
> hasn't earned the name.

Yup.

>=20
> Here's a sample input.
>=20
> $ cat /tmp/proc_pid_fdinfo_mini.5
> .TH proc_pid_fdinfo_mini 5 2024-11-02 "example"
> .SH Name
> .IR /proc/ pid /fdinfo " \- information about file descriptors"
> .SH Description
> Text text text text.
>=20
> Starting with formatters, let's see how they do.
>=20
> $ nroff -man /tmp/proc_pid_fdinfo_mini.5
> proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mi=
ni(5)
>=20
> Name
>        /proc/pid/fdinfo - information about file descriptors
>=20
> Description
>        Text text text text.
>=20
> example                           2024=E2=80=9011=E2=80=9002           pr=
oc_pid_fdinfo_mini(5)
> $ mandoc /tmp/proc_pid_fdinfo_mini.5 | ul
> proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mi=
ni(5)
>=20
> Name
>        /proc/pid/fdinfo - information about file descriptors
>=20
> Description
>        Text text text text.
>=20
> example                           2024-11-02           proc_pid_fdinfo_mi=
ni(5)
> $ ~/heirloom/bin/nroff -man /tmp/proc_pid_fdinfo_mini.5 | ul
> proc_pid_fdinfo_mini(5)       File Formats Manual      proc_pid_fdinfo_mi=
ni(5)
>=20
>=20
>=20
> Name
>        /proc/pid/fdinfo - information about file descriptors
>=20
> Description
>        Text text text text.
>=20
>=20
>=20
> example                           2024-11-02           proc_pid_fdinfo_mi=
ni(5)
> $ DWBHOME=3D~/dwb ~/dwb/bin/nroff -man /tmp/proc_pid_fdinfo_mini.5 | cat =
-s | ul
>=20
>        proc_pid_fdinfo_mini(5)example (2024-11-02)roc_pid_fdinfo_mini(5)
>=20
>        Name
>             /proc/pid/fdinfo - information about file descriptors
>=20
>        Description
>             Text text text text.
>=20
>        Page 1                                        (printed 11/2/2024)
>=20
> I leave the execution of these to perceive the correct font style
> changes as an exercise for the reader, but they all get the
> "/proc/pid/fdinfo" line right.
>=20
> On GNU/Linux systems, the only man page indexer I know of is Colin
> Watson's man-db--specifically, its mandb(8) program.  But it's nicely
> designed so that the "topic and summary description extraction" task is
> delegated to a standalone tool, lexgrog(1), and we can use that.
>=20
> $ lexgrog /tmp/proc_pid_fdinfo_mini.5
> /tmp/proc_pid_fdinfo_mini.5: parse failed
>=20
> Oh, damn.  I wasn't expecting that.  Maybe this is what defeats Michael
> Kerrisk's scraper with respect to groff's man pages.[1]
>=20
> Well, I can find a silver lining here, because it gives me an even
> better reason than I had to pitch an idea I've been kicking around for a
> while.  Why not enhance groff man(7) to support a mode where _it_ will
> spit out the "Name"/"NAME" section, and only that, _for_ you?
>=20
> This would be as easy as checking for an option, say '-d EXTRACT=3DName',
> and having the package's "TH" and "SH" macro definitions divert
> (literally, with the `di` request) everything _except_ the section of
> interest to a diversion that is then never called/output.  (This is
> similar to an m4 feature known as the "black hole diversion".)

Sounds good.  And then lexgrog(1) would be a one-liner that calls
groff(1) with the appropriate flag, right?

> All of the features necessary to implement this[2] were part of troff as
> far as back as the birth of the man(7) package itself.  It's not clear
> to me why it wasn't done back in the 1980s.

Not enough energy of activation, probably, as with most stuff.

> lexgrog(1) itself will of course have to stay around for years to come,

You can make it a wrapper around groff(1) with flags, no?

> but this could take a significant distraction off of Colin's plate--I
> believe I have seen him grumble about how much *roff syntax he has to
> parse to have the feature be workable, and that's without upstart groff
> maintainers exploring up to every boundary that existed even in 1979 and
> cheerfully exercising their findings in man pages.
>=20
> I also of course have ideas for generalizing the feature, so that you
> can request any (sub)section by name, and, with a bit more ambition,[4]
> paragraph tags (`TP`) too.
>=20
> So you could do things like:
>=20
> nroff -man -d EXTRACT=3D"RETURN VALUE" man3/bsearch.3

I certainly use this.

	#  man_section()  prints specific manual page sections (DESCRIPTION, SYNOP=
SIS,
	# ...) of all manual pages in a directory (or in a single manual page file=
).
	# Usage example:  .../man-pages$ man_section man2 SYNOPSIS 'SEE ALSO';

	man_section()
	{
		if [ $# -lt 2 ]; then
			>&2 echo "Usage: ${FUNCNAME[0]} <dir> <section>...";
			return $EX_USAGE;
		fi

		local page=3D"$1";
		shift;
		local sect=3D"$*";

		find "$page" -type f \
		|xargs wc -l \
		|grep -v -e '\b1 ' -e '\btotal\b' \
		|awk '{ print $2 }' \
		|sort \
		|while read -r manpage; do
			(sed -n '/^\.TH/,/^\.SH/{/^\.SH/!p}' <"$manpage";
			 for s in $sect; do
				<"$manpage" \
				sed -n \
					-e "/^\.SH $s/p" \
					-e "/^\.SH $s/,/^\.SH/{/^\.SH/!p}";
			 done;) \
			|mandoc -Tutf8 2>/dev/null \
			|col -pbx;
		done;
	}

	#  man_lsfunc()  prints the name of all C functions declared in the SYNOPS=
IS
	# of all manual pages in a directory (or in a single manual page file).
	# Each name is printed in a separate line
	# Usage example:  .../man-pages$ man_lsfunc man2;

	man_lsfunc()
	{
		if [ $# -lt 1 ]; then
			>&2 echo "Usage: ${FUNCNAME[0]} <manpage|manNdir>...";
			return $EX_USAGE;
		fi

		for arg in "$@"; do
			man_section "$arg" 'SYNOPSIS';
		done \
		|sed_rm_ccomments \
		|pcregrep -Mn '(?s)^ [\w ]+ \**\w+\([\w\s(,)[\]*]*?(...)?\s*\); *$' \
		|grep '^[0-9]' \
		|sed -E 's/syscall\(SYS_(\w*),?/\1(/' \
		|sed -E 's/^[^(]+ \**(\w+)\(.*/\1/' \
		|uniq;
	}

	#  man_lsvar()  prints the name of all C variables declared in the SYNOPSIS
	# of all manual pages in a directory (or in a single manual page file).
	# Each name is printed in a separate line
	# Usage example:  .../man-pages$ man_lsvar man3;

	man_lsvar()
	{
		if [ $# -lt 1 ]; then
			>&2 echo "Usage: ${FUNCNAME[0]} <manpage|manNdir>...";
			return $EX_USAGE;
		fi

		for arg in "$@"; do
			man_section "$arg" 'SYNOPSIS';
		done \
		|sed_rm_ccomments \
		|pcregrep -Mv '(?s)^ [\w ]+ \**\w+\([\w\s(,)[\]*]+?(...)?\s*\); *$' \
		|pcregrep -Mn \
		  -e '(?s)^ +extern [\w ]+ \**\(\*+[\w ]+\)\([\w\s(,)[\]*]+?\s*\); *$' \
		  -e '^ +extern [\w ]+ \**[\w ]+; *$' \
		|grep '^[0-9]' \
		|grep -v 'typedef' \
		|sed -E 's/^[0-9]+: +extern [^(]+ \**\(\*+(\w* )?(\w+)\)\(.*/\2/' \
		|sed    's/^[0-9]\+: \+extern .* \**\(\w\+\); */\1/' \
		|uniq;
	}

Even grepc(1) derived from those scripts.

>=20
> and:
>=20
> nroff -man -d EXTRACT=3D"OPTIONS/-b" man8/zic.8

While I haven't used this yet, it's probably because it's quite complex
to implement with regexes, not because it wouldn't be useful.

>=20
> ...does this sound appetizing to anyone?

Certainly.

> > Also, many other pages might need to be changed accordingly for
> > consistency.
>=20
> I withdraw the suggestion until lexgrog(1) flexes its own muscles, or
> has groff(1) do the lifting.  I'm sorry for prompting churn, Ian.
>=20
> > No, this isn't outdated, since that reduces the quality of the diff.
> > Also, I review a lot of patches in the mail client, without running
> > git(1).  And it's not just for reviewing diffs, but also for writing
> > them.  Semantic newlines reduce the amount of work for producing the
> > diffs.
>=20
> It's a real win for diffs.

And diffs are a real win for text.  Thus, semantic newlines are a real
win for text.  "Write poems, not prose."  (Any chance we may get that
warning added to groff(1)?  :D)


Cheers,
Alex

>=20
> Here's a very recent example from groff.
>=20
> diff --git a/man/groff.7.man b/man/groff.7.man
> index 1fb635f2b..1d248b237 100644
> --- a/man/groff.7.man
> +++ b/man/groff.7.man
> @@ -1281,6 +1281,7 @@ .SH Identifiers
>  typeface,
>  color,
>  special character or character class,
> +hyphenation language code,
>  environment,
>  or stream.
>  .
>=20
>=20
> (So recent that in fact I haven't pushed that yet.)
>=20
> Lists like the foregoing are common in man pages.
>=20
> Regards,
> Branden
>=20
> [1] https://man7.org/linux/man-pages/dir_by_project.html#groff
> [2] String definitions, "string comparisons"[3], and diversions.
> [3] strictly, "formatted output comparisons"
>=20
>     https://www.gnu.org/software/groff/manual/groff.html.node/Operators-i=
n-Conditionals.html
>=20
>     You can do stricter string comparisons in GNU troff.  And I've
>     thought of some syntactic sugar for performing them that wouldn't
>     break backward compatibility.
>=20
> [4] To really land the feature, we need automatic tag generation from
>     input text (we don't want to make the man page author construct
>     their own tags).  Another reason we want the construction to be
>     automatic is to make the tags unique when multiple man pages are
>     formatted in one run, as one might do when making a book of man
>     pages.  Automatic tagging will also enable the slaying of two other
>     ancient dragons.
>=20
>     1.  deep internal links for PDF bookmarks
>     2.  pod2man's `IX`-happy output; the widespread use of this
>         nonstandard macro confuses way too many novice page authors, and
>         bloats document size.
>=20
>    Another feature we'll really want to do this right is improved string
>    processing facilities.  That, too, is something that will pay
>    dividends in several areas.  With a proper string iterator in the
>    formatter (and a couple more conditional operators),[5] it will be
>    possible to write a string library as a macro file, slimming down the
>    formatter itself a little and making macro writers' lives easier.
>    We're only two days into the month and this has already come up on
>    the groff list.
>=20
>    https://lists.gnu.org/archive/html/groff/2024-11/msg00002.html
>=20
> [5] https://savannah.gnu.org/bugs/?62264



--=20
<https://www.alejandro-colomar.es/>

--5cmlld5whomfrgvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmcmAWMACgkQnowa+77/
2zKjyA/41uXG5JULAGWPOTb33xWvPfeLnaPRlMLA0/9fRrciPgseMk2r75TPNfNj
wu492NCFElCTASpWu6WWpA7wSV5L84mNGglUn//qjfKNKsK8qM8R5UkZulPdlEH1
CKfMvTl/AkqS4qISSe+l4vA5SMNjRs+zhjL8qq17N/0ByiX+txjoqPcu7nYmgGUz
uxEfqhShcNXR/eEoFLP1v1MdMM+fM+Bkn1byB1NQH7uNsfm1yKZizCCYmL/1bNWq
MTaz/og/EEhzgAhqZ6TXlcjr0spDaPNETb1ZBRFvmNuU88Cq6mUxD5WGeOYzvcPY
o+nbidFj875u3KjFRzJENsbpkl0YHLpLPatXt88VgtY/cyqaQjxcz8LZLpwaYLHt
8k+S6deFDy1XW0nOoByLWYOIpaWY8XoFPMkrjQTeB1L7LCyjdKDkOu6jUwBBY1fi
LyIYIRzSCeJHKpxZEGrRTw/s7RxkPEcrgD1MS3h7rwFwFypiyzT8dRh2IIB/wXIB
vJ5OKRQly6vm1v/XyZ8qVEOdY/WcjZl1gso8PNZvLkygHpluXJntAS4rR5gh/HCJ
EPZV9g42FS8WOfSKwGnBSKWB6DlbfSOU07UFPMdYlSjfQR3tJLUkNAZSzncm9pD7
ZbCvY9gnnH/ByVef6kUP7ERlhTQgcf8Xbj9cUGx0I0Ht9bJ+LQ==
=pI2g
-----END PGP SIGNATURE-----

--5cmlld5whomfrgvl--
