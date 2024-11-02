Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6349B9E69
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 10:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77710E0A8;
	Sat,  2 Nov 2024 09:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aYBfr6Md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4589810E0A8
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 09:48:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AEB95A402E3;
 Sat,  2 Nov 2024 09:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299E4C4CEC3;
 Sat,  2 Nov 2024 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730540912;
 bh=jd28hCvXGoTqrGluJ1YGAvzXlDy9P1YJIaXnpIhXrVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYBfr6MdRQY25x9hdTXkNbkPmhm1rXGvVexpYuulyHz5g2qu7gWS7tMPO0d0dMyEd
 gaLs0aQX3IMZOP+YiQo9+bYWaejfxNHfFXc08tOL5fOIungIlQolZtkzaHwv2w2Dlp
 xoqsau3zU3dXcVSQiqlBhc4zCRsvaaZCIOG956FWC/1H2K1nCiPvPbr1R+qDlF3EoF
 TjAkyOdKQfAIXq1cB9KkbxkG8ELGhep9VlAEa6Vx3HvuErTxZfLiiA8Uby925x89Ry
 eQE3SVwp+3D0w/sGKMXDnyDiTHypJGNuW+9h6Kr7ljUozt6u3r7e8ilVUekG2tD6YW
 Jr6cs25a9E25w==
Date: Sat, 2 Nov 2024 10:48:16 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: "G . Branden Robinson" <g.branden.robinson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v4 1/4] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241102094816.rpxwjv4wnfsepg3x@devuan>
References: <20241101211830.1298073-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="77xwxs3hqc5jfuto"
Content-Disposition: inline
In-Reply-To: <20241101211830.1298073-1-irogers@google.com>
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


--77xwxs3hqc5jfuto
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/4] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Ian,

On Fri, Nov 01, 2024 at 02:18:27PM -0700, Ian Rogers wrote:
> When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> sense. As a standalone man page the indentation doesn't need to be so
> far over to the right. Remove the initial tagged pragraph, move the
> "since Linux 2.6.22" to a new history subsection.
>=20
> Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v4. Move since to history from Alejandro Colomar's <alx@kernel.org> review
>     comment.
>=20
> ---
>  man/man5/proc_pid_fdinfo.5 | 51 +++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 26 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 1e23bbe02..ad739bd84 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
> @@ -8,8 +8,6 @@
>  .SH NAME
>  /proc/pid/fdinfo/ \- information about file descriptors
>  .SH DESCRIPTION
> -.TP
> -.IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
>  This is a subdirectory containing one entry for each file which the
>  process has open, named by its file descriptor.
>  The files in this directory are readable only by the owner of the proces=
s.
> @@ -17,9 +15,9 @@ The contents of each file can be read to obtain informa=
tion
>  about the corresponding file descriptor.
>  The content depends on the type of file referred to by the
>  corresponding file descriptor.
> -.IP
> +.P
>  For regular files and directories, we see something like:
> -.IP
> +.P
>  .in +4n
>  .EX
>  .RB "$" " cat /proc/12015/fdinfo/4"
> @@ -28,7 +26,7 @@ flags:  01002002
>  mnt_id: 21
>  .EE
>  .in
> -.IP
> +.P
>  The fields are as follows:
>  .RS
>  .TP
> @@ -51,7 +49,6 @@ this field incorrectly displayed the setting of
>  at the time the file was opened,
>  rather than the current setting of the close-on-exec flag.
>  .TP
> -.I
>  .I mnt_id
>  This field, present since Linux 3.15,
>  .\" commit 49d063cb353265c3af701bab215ac438ca7df36d
> @@ -59,13 +56,13 @@ is the ID of the mount containing this file.
>  See the description of
>  .IR /proc/ pid /mountinfo .
>  .RE
> -.IP
> +.P
>  For eventfd file descriptors (see
>  .BR eventfd (2)),
>  we see (since Linux 3.8)
>  .\" commit cbac5542d48127b546a23d816380a7926eee1c25
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:	0
> @@ -74,16 +71,16 @@ mnt_id:	10
>  eventfd\-count:               40
>  .EE
>  .in
> -.IP
> +.P
>  .I eventfd\-count
>  is the current value of the eventfd counter, in hexadecimal.
> -.IP
> +.P
>  For epoll file descriptors (see
>  .BR epoll (7)),
>  we see (since Linux 3.8)
>  .\" commit 138d22b58696c506799f8de759804083ff9effae
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:	0
> @@ -93,7 +90,7 @@ tfd:        9 events:       19 data: 74253d2500000009
>  tfd:        7 events:       19 data: 74253d2500000007
>  .EE
>  .in
> -.IP
> +.P
>  Each of the lines beginning
>  .I tfd
>  describes one of the file descriptors being monitored via
> @@ -110,13 +107,13 @@ descriptor.
>  The
>  .I data
>  field is the data value associated with this file descriptor.
> -.IP
> +.P
>  For signalfd file descriptors (see
>  .BR signalfd (2)),
>  we see (since Linux 3.8)
>  .\" commit 138d22b58696c506799f8de759804083ff9effae
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:	0
> @@ -125,7 +122,7 @@ mnt_id:	10
>  sigmask:	0000000000000006
>  .EE
>  .in
> -.IP
> +.P
>  .I sigmask
>  is the hexadecimal mask of signals that are accepted via this
>  signalfd file descriptor.
> @@ -135,12 +132,12 @@ and
>  .BR SIGQUIT ;
>  see
>  .BR signal (7).)
> -.IP
> +.P
>  For inotify file descriptors (see
>  .BR inotify (7)),
>  we see (since Linux 3.8)
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:	0
> @@ -150,7 +147,7 @@ inotify wd:2 ino:7ef82a sdev:800001 mask:800afff igno=
red_mask:0 fhandle\-bytes:8
>  inotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandle\=
-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73
>  .EE
>  .in
> -.IP
> +.P
>  Each of the lines beginning with "inotify" displays information about
>  one file or directory that is being monitored.
>  The fields in this line are as follows:
> @@ -168,19 +165,19 @@ The ID of the device where the target file resides =
(in hexadecimal).
>  .I mask
>  The mask of events being monitored for the target file (in hexadecimal).
>  .RE
> -.IP
> +.P
>  If the kernel was built with exportfs support, the path to the target
>  file is exposed as a file handle, via three hexadecimal fields:
>  .IR fhandle\-bytes ,
>  .IR fhandle\-type ,
>  and
>  .IR f_handle .
> -.IP
> +.P
>  For fanotify file descriptors (see
>  .BR fanotify (7)),
>  we see (since Linux 3.8)
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:	0
> @@ -190,7 +187,7 @@ fanotify flags:0 event\-flags:88002
>  fanotify ino:19264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-=
bytes:8 fhandle\-type:1 f_handle:4f261900a82dfd73
>  .EE
>  .in
> -.IP
> +.P
>  The fourth line displays information defined when the fanotify group
>  was created via
>  .BR fanotify_init (2):
> @@ -210,7 +207,7 @@ argument given to
>  .BR fanotify_init (2)
>  (expressed in hexadecimal).
>  .RE
> -.IP
> +.P
>  Each additional line shown in the file contains information
>  about one of the marks in the fanotify group.
>  Most of these fields are as for inotify, except:
> @@ -228,16 +225,16 @@ The events mask for this mark
>  The mask of events that are ignored for this mark
>  (expressed in hexadecimal).
>  .RE
> -.IP
> +.P
>  For details on these fields, see
>  .BR fanotify_mark (2).
> -.IP
> +.P
>  For timerfd file descriptors (see
>  .BR timerfd (2)),
>  we see (since Linux 3.17)
>  .\" commit af9c4957cf212ad9cf0bee34c95cb11de5426e85
>  the following fields:
> -.IP
> +.P
>  .in +4n
>  .EX
>  pos:    0
> @@ -296,5 +293,7 @@ fields contain the values that
>  .BR timerfd_gettime (2)
>  on this file descriptor would return.)
>  .RE
> +.SH HISTORY
> +Since Linux 2.6.22.

In the HISTORY section we don't add the "Since", since it's obvious.
Just

Linux x.y.z.

Have a lovely day!
Alex

>  .SH SEE ALSO
>  .BR proc (5)
> --=20
> 2.47.0.199.ga7371fff76-goog
>=20

--=20
<https://www.alejandro-colomar.es/>

--77xwxs3hqc5jfuto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmcl9WAACgkQnowa+77/
2zK29w//R+cB0ouFZ+/E9pIYrBoa9T+TtycqsBlrD5fv4IbJtwqmJGFvvTUbpBqB
AUT9Xda02pUM7Ppj6y4ZheWTCEp9sI87iI2QVZU6QwtPRr4Qk5MGd06uiAUQzi0K
Gj95Y4l+MqIVwBdWShDWjd25B3m8V7gBtOwLTUPDBO9x2ifbLkK+MM+Mj2JWFGC9
Y2jiq3MHB/O3ohR2u5meAbmTagpatvBrhvJ9aa4LC+8Hkiiu6yRKobX/+KlJ6o9L
Pn4FVwcGh+Tm6JlRKx0Q8Y98VIjO3Pzn7tP+cetUdHbmPnUw6ml0AAS/nCdhvA8b
sSrKU565Wc/AZRHEygvNXfhXTkYNfsXkqg6YQyCgMhGlyKVWC03xN/sJtk18/vaC
HL0sOxKziIgePEHJJAihD5UMCjNsQG7yJI639OAPQUudHvpmcpLq5EYanDuxnqyz
hCwFKUcfpomYpIv255X+E6e1DmO9tfenoLUy9OaTj/b6p+XHCcm1qV/n8sVJV/ia
+2edfKupQiq1FfkqEGWP4ac2C+1vd7MvpiQy30fRGeInW3Mk/6We8wrOWNoPd/Ox
spMYCmuCJGXY/bZVEC9CYEzTsZV2GdKTxUyVQXG7cuftPtLcumC4MzGbELL5hwID
xyNHHKjP5I3M8oFoZICC4s04c/Z9j8TApe/Y7nMT7fRxvIRfFBM=
=+0ZT
-----END PGP SIGNATURE-----

--77xwxs3hqc5jfuto--
