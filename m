Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B7B94E41
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 09:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8D110E58E;
	Tue, 23 Sep 2025 07:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D+MPi2/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A2F10E58E;
 Tue, 23 Sep 2025 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758614387;
 bh=3ua7MjVN60F0PornDgkO2tRMSlC4RwSl7hiGmcZHIHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D+MPi2/74E1PxTZ7NBaZ/UWssh05hNgAzY6Zzx7o8TLwpTvZjh0A1bP7K+037T5+v
 rf/mprmVvU/2P8PrCX1TAmWyQoOXd7VXqcAqNnicSUTtsbTjD9RXoFrC2JRcixjcSF
 zIqmVGbkyYnMLEVdP3OXJWVqEOi8Uy0uiCTNidvtAGEmzW4eBHW8tCTlMlJx5e4Nb0
 12LK8v6tKE6Xr+nlwBTL/uXQN+oO8z+x3glFcsE1Q42xrytAJgAjDOQf+zBVlMcNqf
 37CCGeKNCiVb6MhEb86ca+0ccVpKh/tdAcpZSAiU71RUEIGCOewNwE4mdbgP/Sejdv
 CuIkCC0ioBc8Q==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E466C17E00A3;
 Tue, 23 Sep 2025 09:59:45 +0200 (CEST)
Date: Tue, 23 Sep 2025 10:59:18 +0300
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
Message-ID: <20250923105918.41f832c2@eldfell>
In-Reply-To: <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A_KO/Wzkq0uRXNO=EUKd.ld";
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

--Sig_/A_KO/Wzkq0uRXNO=EUKd.ld
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Sep 2025 21:16:45 -0600
Alex Hung <alex.hung@amd.com> wrote:

> On 9/18/25 02:40, Pekka Paalanen wrote:
> > On Tue, 16 Sep 2025 17:01:07 -0600
> > Alex Hung <alex.hung@amd.com> wrote:
> >  =20
> >> On 8/26/25 03:03, Pekka Paalanen wrote: =20
> >>> On Thu, 21 Aug 2025 11:54:32 -0600
> >>> Alex Hung <alex.hung@amd.com> wrote:
> >>>     =20
> >>>> On 8/21/25 06:23, Xaver Hugl wrote: =20
> >>>>>> We user space folks have been convinced at this point that the sRG=
B EOTF
> >>>>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
> >>>>>> hardware is actually the piece-wise, then that's what should be ex=
posed,
> >>>>>> but I'm a bit unsure if we should do that under the name sRGB EOTF=
. =20
> >>>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
> >>>>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
> >>>>> of confusion, it's better to be explicit about it where possible. =
=20
> >>>>
> >>>> I will leave this to Harry to comment. He is taking a few days off s=
o I
> >>>> will check with him later.
> >>>>    =20
> >>>
> >>> "sRGB inverse OETF"?
> >>>
> >>> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
> >>>
> >>>
> >>> Thanks,
> >>> pq =20
> >>
> >> If an extension in future after this proposal is merged, can it be GAM=
MA
> >> 2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] =3D "GAMMA 2.2" so it won't
> >> conflict with current name?
> >>
> >> Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as
> >> the following? or do we still want to add "piece-wise"? =20
> >=20
> > Hi Alex,
> >=20
> > since my previous comment, things have muddied further again. FWIW, we
> > intend to remove the use of the name "srgb" transfer function
> > completely from the Wayland protocol as confusing:
> >=20
> > https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reques=
ts/442
> >=20
> > I would recommend the KMS UAPI to similarly avoid the term. I would
> > recommend "gamma 2.2" or even "power 2.2" and "compound power 2.4" or
> > such. These names would hopefully not trigger intuition and make people
> > look at the definition harder. Or any other name you can come up with.
> >=20
> > I agree that "piece-wise sRGB EOTF" would be intuitively clear, but it
> > may provoke people debating what does IEC 61966-2-1 actually define.
> > We've had these kind of discussions for Wayland already, and it was
> > suggested that it is better to define the actual mathematical function
> > in our specification that to leave it for interpretation from standards.
> >=20
> > For KMS, this should be even easier than for Wayland, because the
> > hardware implements a specific mathematical function regardless of
> > where it might have originated or what it is being used for.
> >  =20
>=20
> Do you mean the following changes? Userspace use Gamma 2.2, and display=20
> driver can decide to use either sRGB piece-wise EOTF or Gamma 2.2 itself.

Sorry, the driver cannot choose. The UAPI needs to define the curves
explicitly, and the drivers need to implement those curves exactly(*) or
not at all. What I propose is, let's not use "sRGB" in any of the names
for the curves, because that name triggers different assumptions in
different people.

(*) "Exactly" is a little vague here. I assume some error tolerance
needs to be allowed, e.g 1 bit on the electrical value. The maximum
difference between the two-piece and power-2.2 curves is several code
points for 8-bit electrical quantization, and that's too much error.

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index e1b2b446faf2..3a6c64285d9c 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list=20
> drm_colorop_type_enum_list[] =3D {
>   };
>=20
>   static const char * const colorop_curve_1d_type_names[] =3D {
> -       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> +       [DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "Gamma 2.2",
>          [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
>          [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 125 EOTF",
>          [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 3e70f66940e0..e39379f1a61c 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -48,7 +48,8 @@ enum drm_colorop_curve_1d_type {
>           * sRGB piece-wise electro-optical transfer function. Transfer
>           * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>           * to H.273 TransferCharacteristics code point 13 with
> -        * MatrixCoefficients set to 0.
> +        * MatrixCoefficients set to 0. This can also be approximated as
> +        * Gamma 2.2.

The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
the sRGB curve means different things for different people (two-piece
vs. power-2.2).

The difference is minor but visible, and therefore I would not make
two-piece and power-2.2 equivalent nor have one approximated by the
other.

They both need their own entries in the enum. Let's leave any decision
about whether substituting one for the other is ok to the userspace.

>           */
>          DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>=20
>=20
> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise=20
> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may=20
> not be used at all, right?

If hardware implements the two-piece curve, then there is reason to
expose it, especially when it does not implement power-2.2. Userspace
can choose to use it as an approximation when that is appropriate.


Thanks,
pq

> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -77,6 +77,7 @@ static const char * const=20
> colorop_curve_1d_type_names[] =3D {
>          [DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
>          [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
>          [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] =3D "BT.2020 Inverse OETF=
",
>          [DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
> +       [DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",
>   };
>=20
> Does anyone have comments or concerns if we use the first option?
>=20
> Alex H.
>=20
> >=20
> > Thanks,
> > pq
> >  =20
> >> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_color=
op.c
> >> index 1551b86471ce..90a216c0b6ac 100644
> >> --- a/drivers/gpu/drm/drm_colorop.c
> >> +++ b/drivers/gpu/drm/drm_colorop.c
> >> @@ -71,7 +71,7 @@ static const struct drm_prop_enum_list
> >> drm_colorop_type_enum_list[] =3D {
> >>    };
> >>
> >>    static const char * const colorop_curve_1d_type_names[] =3D {
> >> -	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> >> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB Inverse OETF",
> >>    	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
> >>    	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 125 EOTF",
> >>    	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
> >> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> >> index e4250b7d8de8..ce85c52c60c8 100644
> >> --- a/include/drm/drm_colorop.h
> >> +++ b/include/drm/drm_colorop.h
> >> @@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
> >>    	/**
> >>    	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> >>    	 *
> >> -	 * enum string "sRGB EOTF"
> >> +	 * enum string "sRGB Inverse OETF"
> >>    	 *
> >>    	 * sRGB piece-wise electro-optical transfer function. Transfer
> >>    	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
> >> =20
> >  =20
>=20


--Sig_/A_KO/Wzkq0uRXNO=EUKd.ld
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjSU1YACgkQI1/ltBGq
qqer0RAAiaoVlQ5QYTphtzDeCCIf0oK2APfCl/E1oqjxA3+yHMccAIx1kzktyJFx
gO577wO5nbYoA3T3a9pQ2Nq2Kw3ejdwp3+jl+iQeYWJy2mbkWyceJXg7VB2f9KI5
ei/9tDBfp0bHzZnmoPCrdwGE6ad+ulq8AjQAbsd717oslPhNkfIgz1Jdbj+71dGn
KySgJmLKxhkn0WZmuJSWRDOEHtLhAy9NkUjCxlDEczqTg+PEjhZAV3uDoKFkh2/a
zLvnkJXjnX+NRZPkF7ovlSx2d3oMCgXJ5BA5RQjuETjUWOu0LDh1/H+Vz45keV13
BlEufQiWmFhbMgO8ebj8gTGZskBJ6wTsbqGoT7f+BO8A/LrPwLGYF+OohLyGLxTz
cLthxIdcH1nnzrMZbP1/Ex5a4zDSNHVtswdIdT/QSes2CrMQbsihyUOughZeRW33
XUye2paFyasnRoW8zdU+pihSGWtVkOwpsxvslE2YcIGU0XfZ9p4cfxz4wxQJ98yM
16YEEakd1uwn5zfDZU9yeh9AWIwlvrS6BUEZwz87oVe9xpVofaTVSrmVGgii1usK
OAGzVv776qXucKmAWTGhiIWwlThVOmohmeJQnf8zs3Z+7An9xAe0qvK3yJZOA/ZO
bIW4TviCIsCl//mSsUiqo7xqlICxy3ZL3pf3oQMKTdQzCXQPfFc=
=fek9
-----END PGP SIGNATURE-----

--Sig_/A_KO/Wzkq0uRXNO=EUKd.ld--
