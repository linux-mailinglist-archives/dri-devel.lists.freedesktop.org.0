Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4009E7313
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3E310F112;
	Fri,  6 Dec 2024 15:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VE/V8grY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E1110F112
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:16:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6E245A44069;
 Fri,  6 Dec 2024 15:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA82FC4CEDE;
 Fri,  6 Dec 2024 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733498193;
 bh=AXWafu2UFfU53xHrtDLaK77qXXnP8ZGKITovm66pVOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VE/V8grY0VWfhD6olBZQXlCerdKHBoPmG2n5tXW+gU/1WpbEoy+SaEDChRWasCbHW
 1U8znSqB1TU+5HJbaj8Ygk3Xyz37NPnEEqVRUq5gE3DHfAoxf2xc109QlOTksnduTt
 PeR6vEjvHLTKAkH23rlglw1BiE9cW778kdm8VToq4kzAOCyAqaI4QO3JZPs2A7n2+u
 LjsSC6Zb5dy94XByrgv7HbAgUNSijX3voF1Mu8rxf+Elf5HruG6d32dR3FxiQnXszp
 t6uq9yikR6NuMoynq5reUQ/Ki0bSoTVnbgHO9MJY8A4r1jaPJHX7ClABxGgbtgkhXC
 uE85rELRx8imQ==
Date: Fri, 6 Dec 2024 16:16:28 +0100
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
Subject: Re: [PATCH v5 1/4] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241206151628.heqirro4hmfvwl5h@devuan>
References: <20241206073828.1119464-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wy7xndtnclfzjif3"
Content-Disposition: inline
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
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


--wy7xndtnclfzjif3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Ian,

On Thu, Dec 05, 2024 at 11:38:25PM -0800, Ian Rogers wrote:
> When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> sense. As a standalone man page the indentation doesn't need to be so
> far over to the right. Remove the initial tagged pragraph, move the
> "since Linux 2.6.22" to a new history subsection.
>=20
> Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>

Thanks!  I've applied it, and amended with some minor tweaks.
<https://www.alejandro-colomar.es/src/alx/linux/man-pages/man-pages.git/com=
mit/?h=3Dcontrib&id=3Dd70b07b4f820ad801f57952cae984c07d73dee1c>

Have a lovely day!
Alex

> ---
> v5. Remove the word Since.
> v4. Since from Alejandro Colomar <alx@kernel.org> review comment.
> ---
>  man/man5/proc_pid_fdinfo.5 | 51 +++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 26 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 1e23bbe02..1c6c38423 100644
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
> +Linux 2.6.22.
>  .SH SEE ALSO
>  .BR proc (5)
> --=20
> 2.47.0.338.g60cca15819-goog
>=20
>=20

--=20
<https://www.alejandro-colomar.es/>

--wy7xndtnclfzjif3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmdTFUwACgkQnowa+77/
2zJBOw//R5gkc6BqGMfc7rVFgCwT9pCZYT5trDkIN5zPqKpLP6wLuha1rc69Tn4B
/tuWUgbv9iOrh0UAOMYlyMPcKwGslYB2xa12FSQR8lesNyO8FBcRnwMI2+lWrKQu
fpsisaAG2Z2VRhEbdahe1ZHtN7iwyL8wz2sTPIH+G2hGllN6Ev4cYMh0lXa16qAB
UEW2Wcyuv8D4UzKkkezFdKyyW6L94ApDTcQBvDpUJ2w6smycciwvIMct7KDpihUk
Gf8yKota7coLhAD6uriTEyADo9c8ROEuPEj23FfxCFi8yowC74w/Js3v5cJCOY8S
spcFsz2hUCt8S7gZTQfjU+cNm1eWOJRsOSQD3KNHN9wgF3sRMksDRktxfKRAw/d3
sRmKmzQEfRhuT8KZoizw7/EXS05NwAFKKs04oTt/LCnGP0Cr3yrcdXVRs2UPc31U
XR3zLDKmXdAZJNp3upu4PGT9txo/cPrnDHFr4L8SjKCEpRerfpc1NJfCORSV4uGs
ttCEjI1rZ4pcpiXVLVkjlfEEwSXWj7vfHyaroyBa6pDkn7yoLznK3Afjh353xkqx
O/DdImu4N48c1tGwRmboS8ZGbZIuM/2N+23BxiPyTkrHHpM96N+fgi4WtiSQp2NU
thWE2KQlmCLhrh8XYBOdkzTicvLntKVK8O7nsZPA/qb4t0J6DWM=
=7pID
-----END PGP SIGNATURE-----

--wy7xndtnclfzjif3--
