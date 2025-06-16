Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEBADB1FC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC4310E38B;
	Mon, 16 Jun 2025 13:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bKNGXXHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4A10E38B;
 Mon, 16 Jun 2025 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750080746;
 bh=8k8I7nKGUakfQ6zb/kzp99Iekk+1EYDKSkxMrzwM4Lw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKNGXXHbCWVSanxrc7oomr3W6aNTAWUjw623pBavKgrUyNx9JZ7CAKmBrjqA4mV+x
 ym/XaK3rlOFKW3MVcQfu8xm2rmYdpBF414TroUaqMi7JekVjifNmUN2YnlDsPTCZBu
 n0yx8Ig55k5cZUifeAfI1E+A/ANxOHBp2n+5Q47dsYLunMBLa9skMMvN3q4lR6zy/N
 ELj2GLrFkY0pn1P2rTb8Pc6ewVYTUKC+GFyU+E0ChD5H2Am9PL0gkBAmoUNbvLvZCC
 9xXr7rY6mpIk9XG5GeV9bXbvMMQtkEpe5J8sDPjj+jfNEniVkCd6Q2DNoGdllnDm5Q
 lypsKWu443vYQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4081F17E0E8F;
 Mon, 16 Jun 2025 15:32:25 +0200 (CEST)
Date: Mon, 16 Jun 2025 16:32:12 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Shankar,
 Uma" <uma.shankar@intel.com>, "quic_naseer@quicinc.com"
 <quic_naseer@quicinc.com>, "quic_cbraga@quicinc.com"
 <quic_cbraga@quicinc.com>, "quic_abhinavk@quicinc.com"
 <quic_abhinavk@quicinc.com>, "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "sashamcintosh@google.com"
 <sashamcintosh@google.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Message-ID: <20250616163212.62361605@eldfell>
In-Reply-To: <SJ1PR11MB61298CC231B8739FD48E30E1B970A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-17-alex.hung@amd.com>
 <SJ1PR11MB61298CC231B8739FD48E30E1B970A@SJ1PR11MB6129.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T3duQgSDnptyMjxoNQll_bn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/T3duQgSDnptyMjxoNQll_bn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2025 11:30:23 +0000
"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:

> > -----Original Message-----
> > From: Alex Hung <alex.hung@amd.com>
> > Sent: Wednesday, April 30, 2025 6:41 AM
> > To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> > alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> > pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> > jadahl@redhat.com; sebastian.wick@redhat.com;
> > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> > <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> > Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya
> > Kumar <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com;
> > Daniel Stone <daniels@collabora.com>
> > Subject: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
> >=20
> > From: Harry Wentland <harry.wentland@amd.com>
> >=20
> > This type is used to support a 3x4 matrix in colorops. A 3x4 matrix use=
s the
> > last column as a "bias" column. Some HW exposes support for 3x4. The
> > calculation looks like:
> >=20
> >  out   matrix    in
> >  |R|   |0  1  2  3 |   | R |
> >  |G| =3D |4  5  6  7 | x | G |
> >  |B|   |8  9  10 11|   | B |
> >                        |1.0|
> >=20
> > This is also the first colorop where we need a blob property to program=
 the
> > property. For that we'll introduce a new DATA property that can be used=
 by all
> > colorop TYPEs requiring a blob. The way a DATA blob is read depends on =
the
> > TYPE of the colorop.
> >=20
> > We only create the DATA property for property types that need it. =20
>=20
> Is there any value to adding pre-offsets [1] in the uapi?=20
>=20
>  |R/Cr|    | c0 c1 c2 |   ( |R/Cr|   |preoff0| )   |postoff0|
>  |G/Y | =3D | c3 c4 c5 | x ( |G/Y | + |preoff1| ) + |postoff1|
>  |B/Cb|   | c6 c7 c8 |   ( |B/Cb|   |preoff2| )   |postoff2|
>=20
> Handling limited range values is one use case that I can think of. =20

Hi,

in the mathematical sense, no. A pre-offset can always be converted
into a post-offset by multiplying it with the 3x3 matrix (and adding to
the existing post-offset). This can be pre-computed, no need to do
it separately for every pixel.

For hardware reasons, I have no idea.

> [1] https://cgit.freedesktop.org/drm-tip/tree/drivers/gpu/drm/i915/displa=
y/intel_color.c#n112
>=20

Thanks,
pq

--Sig_/T3duQgSDnptyMjxoNQll_bn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmhQHNwACgkQI1/ltBGq
qqccYBAAj9hZL1XZgGR1bvYIXfjb500MXuAbnT1uyPSmsEs1gxhHH6G5I55vcgDI
sLn+ur+/KyGFrovN3qHFVhJM7TGPyeFJIfnV+cpapCNh12M0L8nQ80+IXtbjSjzR
TgaseaQAp4EYQFzOHn79qZvQQ+xkCfVXDIqgIOZBNd6VuRLKpWurlE5k2TuNgde0
ULopgVimIOUeI45qKaTGXmIrcUk20aU4LNcWzN9dJ12qtqnWTMIj/DJmUVYH9GSE
Lcb2mAzfgt75zgvZWJL+C/fJK96EtudqVnliiK/LCr4qynOq7ZHVT6FK8y0cK9rB
dqgUzDKPth130DyHMndIrkrcQ7obFxdisHNJHIKAe8BQsVMLxbJ8RVp5Il0eiAtP
8vAodv6TGioqOETMcKHtVlo6K4oSaQQvzBuQMoXxjdQTAhoTUl3DOZvZDMkR3MuS
T8g+LBLNg7xCg/dY5kPiQYbr+tq3Uga76Ktwdl3im0VAq5TEsm3wM8MWcQZgAmvv
7WvxdUKMdyFvSicELVM0GAnlSR8XKWa85tXbhZIsEEuqMArDvJTG4If995xZXBAf
VNpVLbF5muVSHWbuZqLDTJjpxG7MQDJ1ntUhkS/V7ZJ9cx53Gio0tqUmdJI7M187
MGL3nRJdcP1gUJvfb21ZLiVRHXj9lqTQgztNEAVdVKbLajMwazc=
=ONXQ
-----END PGP SIGNATURE-----

--Sig_/T3duQgSDnptyMjxoNQll_bn--
