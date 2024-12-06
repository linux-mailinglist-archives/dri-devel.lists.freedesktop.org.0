Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AF9E7374
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D539410F11B;
	Fri,  6 Dec 2024 15:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ll79epgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8D910F11B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:20:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D1080A442F0;
 Fri,  6 Dec 2024 15:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062CDC4CED1;
 Fri,  6 Dec 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733498433;
 bh=xmnhw1w/kA7zi/WZueCflEYTV5pXG/NKm9P31NiLJAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ll79epgB8II18DcmOeqd1uP32Tz8T3zUnd/Q2G2diLe5BZKF4x33Prp+VL07a7Vlx
 FiL55BScEBQdCVXgtasCF0vDKdAN7nGAKKlRQXXC2dTLUJqzGoILHnYZMThe3dtB6A
 YIPuEhn6F0RFCrWe+9dA5VkfSFoMSwSvw2qKPAU64JnGXkckSFR+xaZ9wo8FOGQzAZ
 LDyvBqz+lff48fVKd+9gUO7A/4xyYAlzt0Uqm2HFeD9nXR7STxh1NfInSxKvMWUp3C
 aIpnX55RtlGXl3t4Um+BJinJSsxi6vNm0FefBg0i4pmd8LaVlHZjT2BFN04N1kze1q
 4IUbpNttYA8dA==
Date: Fri, 6 Dec 2024 16:20:28 +0100
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
Subject: Re: [PATCH v5 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
Message-ID: <20241206152028.5hapc5temuzwgjhw@devuan>
References: <20241206073828.1119464-1-irogers@google.com>
 <20241206073828.1119464-3-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kbevydt2nmhcit32"
Content-Disposition: inline
In-Reply-To: <20241206073828.1119464-3-irogers@google.com>
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


--kbevydt2nmhcit32
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
MIME-Version: 1.0

Hi Ian,

On Thu, Dec 05, 2024 at 11:38:27PM -0800, Ian Rogers wrote:
> Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
> timerfd better separated with a clearer subsection header.
> ---
>  man/man5/proc_pid_fdinfo.5 | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 2797ae216..c4914f1f3 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
> @@ -57,6 +57,7 @@ is the ID of the mount containing this file.
>  See the description of
>  .IR /proc/ pid /mountinfo .
>  .RE
> +.SS eventfd
>  .P

=2EP after .SS is redundant, and triggers a warning.  Please remove them.

Cheers,
Alex

>  For eventfd file descriptors (see
>  .BR eventfd (2)),
> @@ -75,6 +76,7 @@ eventfd\-count:               40
>  .P
>  .I eventfd\-count
>  is the current value of the eventfd counter, in hexadecimal.
> +.SS epoll
>  .P
>  For epoll file descriptors (see
>  .BR epoll (7)),
> @@ -108,6 +110,7 @@ descriptor.
>  The
>  .I data
>  field is the data value associated with this file descriptor.
> +.SS signalfd
>  .P
>  For signalfd file descriptors (see
>  .BR signalfd (2)),
> @@ -133,6 +136,7 @@ and
>  .BR SIGQUIT ;
>  see
>  .BR signal (7).)
> +.SS inotify
>  .P
>  For inotify file descriptors (see
>  .BR inotify (7)),
> @@ -173,6 +177,7 @@ file is exposed as a file handle, via three hexadecim=
al fields:
>  .IR fhandle\-type ,
>  and
>  .IR f_handle .
> +.SS fanotify
>  .P
>  For fanotify file descriptors (see
>  .BR fanotify (7)),
> @@ -229,6 +234,7 @@ The mask of events that are ignored for this mark
>  .P
>  For details on these fields, see
>  .BR fanotify_mark (2).
> +.SS timerfd
>  .P
>  For timerfd file descriptors (see
>  .BR timerfd (2)),
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--=20
<https://www.alejandro-colomar.es/>

--kbevydt2nmhcit32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmdTFjwACgkQnowa+77/
2zINgg/9G5X1oXORdWlksBOcYNz08qtgUhUNgVIfXIst16RaSjqvxU1xAcT1/xMD
8JVnNgVo0B4bgkyJPJxhn4UhqfAmiwi4SqFDWg9cryzuqnogMWZsvQnjLtWACRgv
UPkexuyyxDloEVUIWnUqI4+WOx6IbUpw8ECnncd99dIDozZj0dQGcXxvOzTJZ+T2
AQGvgaAeZleCmEk0mtvnUyn/BoE5AbqYnnd7vP09xULafBXmZi4Bu2VMSvyZ1SQC
czwDqAenT4astqz0ESFtSqQTH3OnehpZ5SdK+/5H2Bqdtj3hSCDUHnXDizBppz7/
tdQmh72ODuY4mCOY3pPK8lnwLFSWGXQXdN7M3Xxo7zBIiH/Zt7F9ZrscugXlesFr
kXd+qyZoP2YhfcuO3s0FfFzPM6rqCBfx4CSSAxM76RiO1YKx+mV5DtFqqpTL8cMi
RXLX1sQK24k87wI19Z/SOm7VVhHmg4WZ4vUHp3vQUIUFEYghINoJxRL0q9zacd8y
M3qQupt6KFhB7d0pp5vwAhRT5xk9esTAn/FTSVm2jK2bt+n7kv0ZDcZggRtXReGb
GI9RhVs07U7F7IwadQ/4C8DI9cyNDJyQmyESbrreq5uwBLpeKo7J1x0Lk+zDWLzq
QPAvA1JYtdycqtjvVbsvuQFUH66/uMnok8YWhjqTwIhkqpKfkeU=
=yMy8
-----END PGP SIGNATURE-----

--kbevydt2nmhcit32--
