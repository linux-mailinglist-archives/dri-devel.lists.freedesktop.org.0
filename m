Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D843B9DFF6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 10:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962E610E880;
	Thu, 25 Sep 2025 08:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eTMxrMfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B71210E880;
 Thu, 25 Sep 2025 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758787924;
 bh=9B5Yz8ZIVg94icgQC5VlcqN0NKZl5hlh3O3RV3Lza3k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eTMxrMfr9ZvM8ZutKyszMimmLTA1vi/E084b+mpZ+TrY5poGWE2AgXWoW1xyhewAw
 Y/5E//FBusMj8GMyxEGb4+6uZ0HY81jgdpe8EbID2/K3S+45VLarCJeKS/7hpyhHVX
 uZ0s7/FC5sd8Y4FcYP1W9QjjpYqkpL/FXu5ZzqUWrTNU+R2pqniuAF8t0/WRR6QHGy
 YYP9bdrSTOpcmi8NALJHQlHY1K94njGVZRAMDuxyiHuZfKCqKgmHQpqrec4fT8N/Vh
 fduWDlHaY97epf/SSKgpP38MmTpLF2J8Ff3yqp5y2EmRWkLGqMw9dVbQ8nLmbFkGm8
 fwrYwp1bTO8qw==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8058017E12C9;
 Thu, 25 Sep 2025 10:12:03 +0200 (CEST)
Date: Thu, 25 Sep 2025 11:11:36 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com, Daniel Stone
 <daniels@collabora.com>
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
Message-ID: <20250925110238.5f872e69@eldfell>
In-Reply-To: <b8abcab1-3953-410a-b639-5a74f9d2819e@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
 <20250923105918.41f832c2@eldfell>
 <1c7158fc-db72-4ba0-81d2-8bfecf36a2c2@amd.com>
 <b8abcab1-3953-410a-b639-5a74f9d2819e@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KXiq_KWo/kqRPCHvIVV_=48";
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

--Sig_/KXiq_KWo/kqRPCHvIVV_=48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Sep 2025 11:41:24 -0600
Alex Hung <alex.hung@amd.com> wrote:

> On 9/23/25 10:16, Alex Hung wrote:
> >=20
> >=20
> > On 9/23/25 01:59, Pekka Paalanen wrote: =20
> >> On Mon, 22 Sep 2025 21:16:45 -0600
> >> Alex Hung <alex.hung@amd.com> wrote:
> >> =20
> >>> On 9/18/25 02:40, Pekka Paalanen wrote: =20

...

> >> The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
> >> the sRGB curve means different things for different people (two-piece
> >> vs. power-2.2).
> >>
> >> The difference is minor but visible, and therefore I would not make
> >> two-piece and power-2.2 equivalent nor have one approximated by the
> >> other.
> >>
> >> They both need their own entries in the enum. Let's leave any decision
> >> about whether substituting one for the other is ok to the userspace.
> >> =20
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_COLOROP_1D=
_CURVE_SRGB_EOTF,
> >>>
> >>>
> >>> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise
> >>> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF m=
ay
> >>> not be used at all, right? =20
> >>
> >> If hardware implements the two-piece curve, then there is reason to
> >> expose it, especially when it does not implement power-2.2. Userspace
> >> can choose to use it as an approximation when that is appropriate.
> >>
> >>
> >> Thanks,
> >> pq
> >> =20
> >=20
> > Does the following diff make sense?

Yes.


> >=20
> > 1. Change "sRGB EOTF" -> "Piece-wise EOTF"
> > 2. Add "Gamma 2.2"
> >=20
> > diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_coloro=
p.c
> > index e1b2b446faf2..823e39b8f3fe 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -71,12 +71,13 @@ static const struct drm_prop_enum_list=20
> > drm_colorop_type_enum_list[] =3D {
> >  =C2=A0};
> >=20
> >  =C2=A0static const char * const colorop_curve_1d_type_names[] =3D {
> > -=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> > +=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "Piece-wise EO=
TF",
> >  =C2=A0=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRG=
B Inverse EOTF",
> >  =C2=A0=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 12=
5 EOTF",
> >  =C2=A0=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "P=
Q 125 Inverse EOTF",
> >  =C2=A0=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] =3D "B=
T.2020 Inverse OETF",
> >  =C2=A0=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.20=
20 OETF",
> > +=C2=A0=C2=A0=C2=A0 [DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",

If I wanted to really nitpick, I'd propose "Power 2.2" instead of
"Gamma 2.2", but I suppose it's clear anyway. And Wayland already went
with GAMMA22.

> >  =C2=A0};
> >=20
> >  =C2=A0static const struct drm_prop_enum_list=20
> > drm_colorop_lut1d_interpolation_list[] =3D {
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index 3e70f66940e0..3428a27cd9ad 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.hsRGB EOTF
> > @@ -43,12 +43,9 @@ enum drm_colorop_curve_1d_type {
> >  =C2=A0=C2=A0=C2=A0=C2=A0 /**
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * enum string "sRGB EOTF"
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * enum string "Piece-wise EOTF"
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * sRGB piece-wise electro-optical transfer fu=
nction. Transfer
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * characteristics as defined by IEC 61966-2-1=
 sRGB. Equivalent
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * to H.273 TransferCharacteristics code point=
 13 with
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * MatrixCoefficients set to 0.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * sRGB piece-wise electro-optical transfer fu=
nction.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >  =C2=A0=C2=A0=C2=A0=C2=A0 DRM_COLOROP_1D_CURVE_SRGB_EOTF,
> >=20
> > @@ -108,6 +105,16 @@ enum drm_colorop_curve_1d_type {
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >  =C2=A0=C2=A0=C2=A0=C2=A0 DRM_COLOROP_1D_CURVE_BT2020_OETF,
> >=20
> > +=C2=A0=C2=A0=C2=A0 /**
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_COLOROP_1D_CURVE_GAMMA22:
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * enum string "Gamma 2.2"
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * A gamma 2.2 power function. This applies a =
power curve with
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * gamma value of 2.2 to the input values.

I'd prefer "exponent" rather than "gamma value" to be more explicit.
Just in case. There is quite some confusion around the term "gamma".
I've used to call this function a "pure power-low with exponent 2.2" to
explain that there are no offsets or multipliers or anything else.

For documentation it would best to write down the mathematical formula
rather than describe it in words. I understand that may be problematic
in kerneldoc, and we didn't do it in Wayland XML either but in a
proposed Gitlab-Markdown appendix.


> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 DRM_COLOROP_1D_CURVE_GAMMA22,
> > +
> >  =C2=A0=C2=A0=C2=A0=C2=A0 /**
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @DRM_COLOROP_1D_CURVE_COUNT:
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> >  =20
>=20
> Both DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_GAMMA22 are=
=20
> defined and it should be clear that sRGB EOTF are piece-wise TF and=20
> Gamma 2.2 is for power 2.2. Is it still a concern of using "sRGB" for as=
=20
> the original patch?

Not enough of a concern for me to continue nagging about it. :-)

> More precisely, adding DRM_COLOROP_1D_CURVE_GAMMA22 with "Gamma 2.2"=20
> string without touching "sRGB EOTF" should be sufficient. If a userspace=
=20
> need to choose one or another it can precisely do so.
>=20

As long as everyone reads the documentation, and the documentation is
clear. I failed at clarity in Wayland, so I'm perhaps a bit paranoid
here.


Thanks,
pq

--Sig_/KXiq_KWo/kqRPCHvIVV_=48
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjU+TgACgkQI1/ltBGq
qqclkQ/9GW/21Ro7P9Bm9MrLqirGgcU/yg+nkK5Ht2IrFBViXdCUGgDTUnG9ZyFS
N/RBmwI9PKtWnFTuRGNOypySZLtWXcaPYOj6azqzEfLZKL4xakr+VBqpI2Pai+le
Ez0OOKa1/QFvl8d2DXLt2C/1Ch2iUxN4qZ8p11esJk46DigRaQNjrEaOa8NydxGF
U6wS0U4pwd/TodT+ETREFs2eJNYYZQ984UmsDJofATAbuIP42q1Role5dDzuAQN+
wgw7Fsxz93XcWd+uvLkHi74dkFMJNJJBiBy/s73xxUbXssROLL8kcyjfnmqoGmzl
AkgtuKed8Sc3FzoCLhGEDePDZHF/bi9fxEj1CFJ+oGMVvEAOuoU/HD9DdpZlwwur
GXoN9dwkFZEP5h6BbxunRLMCtDfhA5L6WLKTCnCp+8rMCGIe2fHGZlRFUYtSQScw
4ykb+Ny0oLkMwqscxnYdyaDE7HYyNa5VAtLEPJkfdWrBHd8rPid+aPTlR0xn4k7d
Wz08oHayx2MJK2lMWsbQMTpDnMbs41Ouox7OBwU4jhZGitqRam7mD0FtwS3vwnGW
Oz4V4XA5UyCILrQQEz4qL0KXnemDYn80Yzkqzi3lGVRYq5zYMVrv6BGOVy3lLRW0
/YN3GCZSZ5fNOV9+i+kwCiX/SfBYbhxpthHV+x0M3KcJU08iE1Q=
=hUI4
-----END PGP SIGNATURE-----

--Sig_/KXiq_KWo/kqRPCHvIVV_=48--
