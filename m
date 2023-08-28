Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370678B253
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80E810E2C6;
	Mon, 28 Aug 2023 13:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99A10E2C6;
 Mon, 28 Aug 2023 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b7lsiQN12Cp0n4O7wk1SApUfWpR18hrnKe0CbX2vM1Y=; b=fnLETdNuj9BVB+w3PEVWpjv59e
 fZTV5o4xadg5MyId79rH0z2TMkFRHQA3AazEbXz0SWRh2M4YIgNmbNG89mjd8zMuosUEulEj2Y9YE
 jWTQZPQ30AzGXfh+yH8jg64mkV3XtRMMwFMp7gvWaK+FizcZJjgnWLjhtKVp3oXvJbhrdBxg1pmTF
 faVfEdRbAatxpDoEBM+J43gyeohTBxB8XHPPVAfdEUkgaw8thYV4kD3zdkaBLZ/GgPUTCUJ3N8uj2
 +oCIxV7mKmgfTtfuRgor539j37uWeEWXiwYpOSFugvgD3E54UIZPzuOwVgqB1PBXi3CUmDiwn5NMt
 Mn3QPFbg==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qacj6-00GTZl-L2; Mon, 28 Aug 2023 15:56:20 +0200
Date: Mon, 28 Aug 2023 12:56:04 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230828135604.ixuwnyo6d3xqgtjp@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
 <20230828132355.21a8fd89.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="coeswm67tuzzpu2n"
Content-Disposition: inline
In-Reply-To: <20230828132355.21a8fd89.pekka.paalanen@collabora.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>,
 "sungjoon.kim@amd.com" <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--coeswm67tuzzpu2n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/28, Pekka Paalanen wrote:
> On Mon, 28 Aug 2023 09:45:44 +0100
> Joshua Ashton <joshua@froggi.es> wrote:
>=20
> > Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has actua=
lly
> > just been applying it to every plane pre-blend.
>=20
> I've never seen that documented anywhere.
>=20
> It has seemed obvious, that since we have KMS objects for planes and
> CRTCs, stuff on the CRTC does not do plane stuff before blending. That
> also has not been documented in the past, but it seemed the most
> logical choice.
>=20
> Even today
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-pr=
operties
> make no mention of whether they apply before or after blending.

It's mentioned in the next section:
https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.htm=
l#dc-color-capabilities-between-dcn-generations
In hindsight, maybe it isn't the best place...

>=20
> > Degamma makes no sense after blending anyway.
>=20
> If the goal is to allow blending in optical or other space, you are
> correct. However, APIs do not need to make sense to exist, like most of
> the options of "Colorspace" connector property.
>=20
> I have always thought the CRTC DEGAMMA only exists to allow the CRTC
> CTM to work in linear or other space.
>=20
> I have at times been puzzled by what the DEGAMMA and CTM are actually
> good for.
>=20
> > The entire point is for it to happen before blending to blend in linear
> > space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are the exact same thing...
>=20
> The CRTC CTM is between CRTC DEGAMMA and CRTC GAMMA, meaning they are
> not interchangeable.
>=20
> I have literally believed that DRM KMS UAPI simply does not support
> blending in optical space, unless your framebuffers are in optical
> which no-one does, until the color management properties are added to
> KMS planes. This never even seemed weird, because non-linear blending
> is so common.
>=20
> So I have been misunderstanding the CRTC DEGAMMA property forever. Am I
> the only one? Do all drivers agree today at what point does CRTC
> DEGAMMA apply, before blending on all planes or after blending?
>=20

I'd like to know current userspace cases on Linux of this CRTC DEGAMMA
LUT.

> Does anyone know of any doc about that?

=46rom what I retrieved about the introduction of CRTC color props[1], it
seems the main concern at that point was getting a linear space for
CTM[2] and CRTC degamma property seems to have followed intel
requirements, but didn't find anything about the blending space.

AFAIU, we have just interpreted that all CRTC color properties for DRM
interface are after blending[3]. Can this be seen in another way?

[1] https://patchwork.freedesktop.org/series/2720/
[2] https://codereview.chromium.org/1182063002
[3] https://dri.freedesktop.org/docs/drm/_images/dcn3_cm_drm_current.svg

>=20
> If drivers do not agree on the behaviour of a KMS property, then that
> property is useless for generic userspace.
>=20
>=20
> Thanks,
> pq
>=20
>=20
> > On Tuesday, 22 August 2023, Pekka Paalanen <pekka.paalanen@collabora.co=
m>
> > wrote:
> > > On Thu, 10 Aug 2023 15:02:59 -0100
> > > Melissa Wen <mwen@igalia.com> wrote:
> > > =20
> > >> The next patch adds pre-blending degamma to AMD color mgmt pipeline,=
 but
> > >> pre-blending degamma caps (DPP) is currently in use to provide DRM C=
RTC
> > >> atomic degamma or implict degamma on legacy gamma. Detach degamma us=
age
> > >> regarging CRTC color properties to manage plane and CRTC color
> > >> correction combinations.
> > >>
> > >> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > >> Signed-off-by: Melissa Wen <mwen@igalia.com>
> > >> ---
> > >>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++---=
---
> > >>  1 file changed, 41 insertions(+), 18 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c=
 =20
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > >> index 68e9f2c62f2e..74eb02655d96 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > >> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct =20
> > dm_crtc_state *crtc)
> > >>       return 0;
> > >>  }
> > >>
> > >> -/**
> > >> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to =
DC =20
> > plane.
> > >> - * @crtc: amdgpu_dm crtc state
> > >> - * @dc_plane_state: target DC surface
> > >> - *
> > >> - * Update the underlying dc_stream_state's input transfer function =
=20
> > (ITF) in
> > >> - * preparation for hardware commit. The transfer function used depe=
nds =20
> > on
> > >> - * the preparation done on the stream for color management.
> > >> - *
> > >> - * Returns:
> > >> - * 0 on success. -ENOMEM if mem allocation fails.
> > >> - */
> > >> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > >> -                                   struct dc_plane_state =20
> > *dc_plane_state)
> > >> +static int
> > >> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> > >> +                          struct dc_plane_state *dc_plane_state)
> > >>  {
> > >>       const struct drm_color_lut *degamma_lut;
> > >>       enum dc_transfer_func_predefined tf =3D TRANSFER_FUNCTION_SRGB;
> > >> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct =20
> > dm_crtc_state *crtc,
> > >>                                                &degamma_size);
> > >>               ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);
> > >>
> > >> -             dc_plane_state->in_transfer_func->type =3D
> > >> -                     TF_TYPE_DISTRIBUTED_POINTS;
> > >> +             dc_plane_state->in_transfer_func->type =3D =20
> > TF_TYPE_DISTRIBUTED_POINTS;
> > >>
> > >>               /*
> > >>                * This case isn't fully correct, but also fairly
> > >> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct =20
> > dm_crtc_state *crtc,
> > >>                                  degamma_lut, degamma_size);
> > >>               if (r)
> > >>                       return r;
> > >> -     } else if (crtc->cm_is_degamma_srgb) {
> > >> +     } else {
> > >>               /*
> > >>                * For legacy gamma support we need the regamma input
> > >>                * in linear space. Assume that the input is sRGB.
> > >> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct =
=20
> > dm_crtc_state *crtc,
> > >>
> > >>               if (tf !=3D TRANSFER_FUNCTION_SRGB &&
> > >>                   !mod_color_calculate_degamma_params(NULL,
> > >> -                         dc_plane_state->in_transfer_func, NULL, fa=
lse))
> > >> + =20
> >  dc_plane_state->in_transfer_func,
> > >> +                                                     NULL, false))
> > >>                       return -ENOMEM;
> > >> +     }
> > >> +
> > >> +     return 0;
> > >> +}
> > >> +
> > >> +/**
> > >> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to =
DC =20
> > plane.
> > >> + * @crtc: amdgpu_dm crtc state
> > >> + * @dc_plane_state: target DC surface
> > >> + *
> > >> + * Update the underlying dc_stream_state's input transfer function =
=20
> > (ITF) in
> > >> + * preparation for hardware commit. The transfer function used depe=
nds =20
> > on
> > >> + * the preparation done on the stream for color management.
> > >> + *
> > >> + * Returns:
> > >> + * 0 on success. -ENOMEM if mem allocation fails.
> > >> + */
> > >> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > >> +                                   struct dc_plane_state =20
> > *dc_plane_state)
> > >> +{
> > >> +     bool has_crtc_cm_degamma;
> > >> +     int ret;
> > >> +
> > >> +     has_crtc_cm_degamma =3D (crtc->cm_has_degamma || =20
> > crtc->cm_is_degamma_srgb);
> > >> +     if (has_crtc_cm_degamma){
> > >> +             /* AMD HW doesn't have post-blending degamma caps. Whe=
n DRM
> > >> +              * CRTC atomic degamma is set, we maps it to DPP degam=
ma =20
> > block
> > >> +              * (pre-blending) or, on legacy gamma, we use DPP dega=
mma =20
> > to
> > >> +              * linearize (implicit degamma) from sRGB/BT709 accord=
ing =20
> > to
> > >> +              * the input space. =20
> > >
> > > Uhh, you can't just move degamma before blending if KMS userspace
> > > wants it after blending. That would be incorrect behaviour. If you
> > > can't implement it correctly, reject it.
> > >
> > > I hope that magical unexpected linearization is not done with atomic,
> > > either.
> > >
> > > Or maybe this is all a lost cause, and only the new color-op pipeline
> > > UAPI will actually work across drivers.
> > >
> > >
> > > Thanks,
> > > pq
> > > =20
> > >> +              */
> > >> +             ret =3D map_crtc_degamma_to_dc_plane(crtc, dc_plane_st=
ate);
> > >> +             if (ret)
> > >> +                     return ret;
> > >>       } else {
> > >>               /* ...Otherwise we can just bypass the DGM block. */
> > >>               dc_plane_state->in_transfer_func->type =3D TF_TYPE_BYP=
ASS; =20
> > >
> > > =20
>=20

--coeswm67tuzzpu2n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTsp2sACgkQwqF3j0dL
ehzWFw/+JNqxc3s0q5jUPlKRZJfp00+RSXx0t+XdOFsTl2Dc/EMdCs/HpIuAuLNJ
oTL4O1XhyFUVvWWm4VUcogljk7EU0F9C7Mab2MuxMWiJxxx2y2jmk85sdAoApsGF
RyoQVaGhVXguHu+Ey5dLCOvkPGoKo0FK8BbDPRjXjtZW14yCvNQGgvur1eAknuZb
iC5rSF/CepA/PI+laS3WvI3e+ij+ojOreIIwj+fKdiqw6OiwskpmoeQYt5zLLKkU
7XO+DlHKMOeURxyyFSanQRmm4U6AGyWGzwxo4/eUtezVHcyehSVyfLOH1zQLbHGY
zvm9m+/NSwVZ4RzkQXhUN+ZjMJ9PopRbc08RrHCKFTQzge8gfZUI5VqR48mdBy6f
KFfyb0h7I/mynIaoDns8719DTLg0RFgEFPHz6P7p6KMLRcOLYBtPAwhgWoNxZu/A
O2OkY0E8uourBv2hPFUfCVJzV+4jBVweVsfLAz6diKR+zwbzxlYu+nOAgi61QD1q
fB3El7fYjFHLF2Nxn9HBRKk7dAavANZNh6Jb38StHw58+fqJhqqA/KYRSfQerI/N
lnQ83aB0PetDhWGxUOOZuxvNdeYwUIyJGU6T2Gkokx5Yt9wbO2wozmhEzm2eR8Oi
JeT3NTSVrhX5fWp3CSn41Ju+tX+/IgPvxIdNH9ZKQ7xRA6BdANM=
=fAcR
-----END PGP SIGNATURE-----

--coeswm67tuzzpu2n--
