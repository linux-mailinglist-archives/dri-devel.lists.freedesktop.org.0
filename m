Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED79BA290
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 22:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622110E074;
	Sat,  2 Nov 2024 21:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NUCkZeZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDBD10E074
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 21:41:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1276EA40696;
 Sat,  2 Nov 2024 21:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A134CC4CEC3;
 Sat,  2 Nov 2024 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730583671;
 bh=/c2O3YS/cOYDIPdqZPnfxaGOcF3uCPuJZI6+tQd9U6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUCkZeZtYEUmnJ1FDpk2ad7Kuh4S1hEJOITt9ITaaOICyRXZIgfZpGMbHLk+aOQmR
 KD0ElOZ9x71uBleV6yWa7e7xC4+p7Hewu+Bb2QbO59M7nz/jFqhq0fWYye3M4xej16
 cs/SFy4G1+jw+lkWRR/r4vwjdcfK8cxWUTmW3NnaqAt97UWtGZ+7Q1iSPIiXiWh7ev
 9CB4lx4s5faR+E+d0z+zHuo73ahaZQ1FeJmlQPmhTDLqGiNGnIST7PKccc7h2ZRqmM
 K3vcMM7pH9VfHMwe9NTDGVFccmXes2Wa2CgAwruOOIVIDdA1M7/kkEmvaizGnQn0i/
 Pqd+WUNzOisqw==
Date: Sat, 2 Nov 2024 22:36:20 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>, cjwatson@debian.org
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
Message-ID: <20241102213620.kfccilxvhihwmnld@devuan>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ptczkh6frrdnk65f"
Content-Disposition: inline
In-Reply-To: <20241102103937.ose4y72a7yl3dcmz@devuan>
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


--ptczkh6frrdnk65f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Branden, Colin,

On Sat, Nov 02, 2024 at 11:40:13AM +0100, Alejandro Colomar wrote:
> > I also of course have ideas for generalizing the feature, so that you
> > can request any (sub)section by name, and, with a bit more ambition,[4]
> > paragraph tags (`TP`) too.
> >=20
> > So you could do things like:
> >=20
> > nroff -man -d EXTRACT=3D"RETURN VALUE" man3/bsearch.3
>=20
> I certainly use this.
>=20
> 	#  man_section()  prints specific manual page sections (DESCRIPTION, SYN=
OPSIS,
> 	# ...) of all manual pages in a directory (or in a single manual page fi=
le).
> 	# Usage example:  .../man-pages$ man_section man2 SYNOPSIS 'SEE ALSO';
>=20
> 	man_section()
> 	{
> 		if [ $# -lt 2 ]; then
> 			>&2 echo "Usage: ${FUNCNAME[0]} <dir> <section>...";
> 			return $EX_USAGE;
> 		fi
>=20
> 		local page=3D"$1";
> 		shift;
> 		local sect=3D"$*";
>=20
> 		find "$page" -type f \
> 		|xargs wc -l \
> 		|grep -v -e '\b1 ' -e '\btotal\b' \
> 		|awk '{ print $2 }' \
> 		|sort \
> 		|while read -r manpage; do
> 			(sed -n '/^\.TH/,/^\.SH/{/^\.SH/!p}' <"$manpage";
> 			 for s in $sect; do
> 				<"$manpage" \
> 				sed -n \
> 					-e "/^\.SH $s/p" \
> 					-e "/^\.SH $s/,/^\.SH/{/^\.SH/!p}";
> 			 done;) \
> 			|mandoc -Tutf8 2>/dev/null \
> 			|col -pbx;
> 		done;
> 	}

On the other hand, you may want to just package this small shell script
(or rather a part of it) as a program.

How about this?

	$ cat /usr/local/bin/mansect
	#!/bin/sh

	if [ $# -lt 1 ]; then
		>&2 echo "Usage: $0 SECTION [FILE ...]";
		return 1;
	fi

	s=3D"$1";
	shift;


	if test -z "$*"; then
		sed -n \
			-e '/^\.TH/,/^\.SH/{/^\.SH/!p}' \
			-e '/^\.SH '"$s"'$/p' \
			-e '/^\.SH '"$s"'$/,/^\.SH/{/^\.SH/!p}' \
			;
	else
		find "$@" -not -type d \
		| xargs wc -l \
		| sed '${/ total$/d}' \
		| grep -v '\b1 ' \
		| awk '{ print $2 }' \
		| xargs -L1 sed -n \
			-e '/^\.TH/,/^\.SH/{/^\.SH/!p}' \
			-e '/^\.SH '"$s"'$/p' \
			-e '/^\.SH '"$s"'$/,/^\.SH/{/^\.SH/!p}' \
			;
	fi;

This only filters the source of the page, producing output that's
suitable for the groff pipeline.

	alx@devuan:~$ man -w proc | xargs cat | mansect NAME
	.TH proc 5 2024-06-15 "Linux man-pages 6.9.1-158-g2ac94c631"
	.SH NAME
	proc \- process information, system information, and sysctl pseudo-filesys=
tem
	alx@devuan:~$ man -w strtol strtoul | xargs mansect 'NAME'
	.TH strtol 3 2024-07-23 "Linux man-pages 6.9.1-158-g2ac94c631"
	.SH NAME
	strtol, strtoll, strtoq \- convert a string to a long integer
	.TH strtoul 3 2024-07-23 "Linux man-pages 6.9.1-158-g2ac94c631"
	.SH NAME
	strtoul, strtoull, strtouq \- convert a string to an unsigned long integer

You can request several sections with a regex:

	$ man -w strtol strtoul | xargs mansect '\(NAME\|SEE ALSO\)'
	.TH strtol 3 2024-07-23 "Linux man-pages 6.9.1-158-g2ac94c631"
	.SH NAME
	strtol, strtoll, strtoq \- convert a string to a long integer
	.SH SEE ALSO
	.BR atof (3),
	.BR atoi (3),
	.BR atol (3),
	.BR strtod (3),
	.BR strtoimax (3),
	.BR strtoul (3)
	.TH strtoul 3 2024-07-23 "Linux man-pages 6.9.1-158-g2ac94c631"
	.SH NAME
	strtoul, strtoull, strtouq \- convert a string to an unsigned long integer
	.SH SEE ALSO
	.BR a64l (3),
	.BR atof (3),
	.BR atoi (3),
	.BR atol (3),
	.BR strtod (3),
	.BR strtol (3),
	.BR strtoumax (3)

And it can then be piped to groff(1) to format the entire set of pages:

	$ man -w strtol strtoul | xargs mansect '\(NAME\|SEE ALSO\)' | groff -man =
-Tutf8
	strtol(3)                  Library Functions Manual                  strto=
l(3)

	NAME
	     strtol, strtoll, strtoq - convert a string to a long integer

	SEE ALSO
	     atof(3), atoi(3), atol(3), strtod(3), strtoimax(3), strtoul(3)

	Linux man=E2=80=90pages 6.9.1=E2=80=90158=E2=80=90g2ac... 2024=E2=80=9007=
=E2=80=9023                         strtol(3)
	=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
	strtoul(3)                 Library Functions Manual                 strtou=
l(3)

	NAME
	     strtoul, strtoull, strtouq - convert a string to an unsigned long int=
eger

	SEE ALSO
	     a64l(3), atof(3), atoi(3), atol(3), strtod(3), strtol(3), strtoumax(3)

	Linux man=E2=80=90pages 6.9.1=E2=80=90158=E2=80=90g2ac... 2024=E2=80=9007=
=E2=80=9023                        strtoul(3)


This is quite naive, and will not work with pages that define their own
stuff, since this script is not groff(1).  But it should be as fast as
is possible, which is what Colin wants, is as simple as it can be (and
thus relatively safe), and should work with most pages (as far as
indexing is concerned, probably all?).


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es/>

--ptczkh6frrdnk65f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmcmm04ACgkQnowa+77/
2zI6oRAAmc4IuCUxorPruqbBwNoVvT87J8omNEjhQdrN2D4Qhofs94T+KPiBng4y
oOWZrYty05VOXOmVqFIXmwIZ5aW8yQNoTG0FAQo5DV65C+FDoi/aXLIpuETXza2C
SWA9Ebq8LHC/oFY6XArLd1l/DS4KaBsvyLnKj1ewiQ9IQbLiDaBcpLgmsEQnUiHJ
STzk/D2SBiEI5iUhMMkBDhsaTseTaGq83m7jn206JQA2g1NQ/8GeWV7LlXceRzhe
uSVTfhqw8qU+dPdSxCU/BXPr1jp0MqEe0ujYVdcSQMZsuk8qeIL07Bqvp23S8oMS
hM2dZIOOxG+IFb5S6saMFaUoRob0LkusNSXEu3FUy86iptBo5UAKy26pUNHaYxq1
g7eO5GxNZVPgnoNJGDtLD+QqIxTfSbogvuAbnNrTjRVxWRmwgTiUANo3U19nll4o
RG/u0ACkIH69KusTucHbbOp0o/JXAhTcZLen++Slg+/eSAy1o44FwjBoKy8rY7k1
K+Yp8Oi3idDVbG54sUu6kyooYge/a8C+Rj95KaFdi5ERo3FYF91tGba0eWfM/JBt
4wmGqCBcDYZTmuMSiVLZ5TCPTp7gewX4TIamKrqM/mgby585RkbqqWPkJckZtEMv
LNb1hws3RiQF0toeYJAmv3HLaFSpDeDp0BW4JdI9XRWXWnE81+Y=
=tWCc
-----END PGP SIGNATURE-----

--ptczkh6frrdnk65f--
