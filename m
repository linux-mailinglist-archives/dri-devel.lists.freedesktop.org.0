Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E0978C0C9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 10:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1110E172;
	Tue, 29 Aug 2023 08:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2779210E181;
 Tue, 29 Aug 2023 08:51:20 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9FBBB66071F1;
 Tue, 29 Aug 2023 09:51:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693299078;
 bh=pyvbKnlVXnJ6dRBWnI/+Gi2JxQb5bks6sIJ+pba2X0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iN6J0+tpaF3eqObD7PGMugdHxZNffOecf4xxfkqQ/Un2R+PStu9ZL7eAd7a+ei15Y
 Z3bqgeTNZM1hkFm1dpdX7D2I4p0kyNaDisc94t4Lagpq7Ky4riNd91nCNIsj8LV4ET
 7ZCDdDI4MLQbSMNF9KuN47XG0kciZq4sscXP4cW6FaCBEzbMCRvk5lsFat52uPUZvo
 UiLrtLWbphYV0/TjhuPaczUGEE7RSGYOgDWeiEONG45FlOVGIKH2lHdcV3rXiiH3ws
 HAbHSpbSxfKVXsM44ceeGt23zgUa5ZHGuK7/fnpxEfPGojn2aDAGQdbzdh0vgrouB3
 Xw/pLdG7vk2eQ==
Date: Tue, 29 Aug 2023 11:51:13 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping
 CRTC degamma to DC plane
Message-ID: <20230829115113.7bba24b3.pekka.paalanen@collabora.com>
In-Reply-To: <20230828135604.ixuwnyo6d3xqgtjp@mail.igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
 <20230828132355.21a8fd89.pekka.paalanen@collabora.com>
 <20230828135604.ixuwnyo6d3xqgtjp@mail.igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SF6xh5rAi.ZUOgSK_NWtFI.";
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

--Sig_/SF6xh5rAi.ZUOgSK_NWtFI.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Aug 2023 12:56:04 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 08/28, Pekka Paalanen wrote:
> > On Mon, 28 Aug 2023 09:45:44 +0100
> > Joshua Ashton <joshua@froggi.es> wrote:
> >  =20
> > > Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has act=
ually
> > > just been applying it to every plane pre-blend. =20
> >=20
> > I've never seen that documented anywhere.
> >=20
> > It has seemed obvious, that since we have KMS objects for planes and
> > CRTCs, stuff on the CRTC does not do plane stuff before blending. That
> > also has not been documented in the past, but it seemed the most
> > logical choice.
> >=20
> > Even today
> > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-=
properties
> > make no mention of whether they apply before or after blending. =20
>=20
> It's mentioned in the next section:
> https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.h=
tml#dc-color-capabilities-between-dcn-generations
> In hindsight, maybe it isn't the best place...

That is driver-specific documentation. As a userspace dev, I'd never
look at driver-specific documentation, because I'm interested in the
KMS UAPI which is supposed to be generic, and therefore documented with
the DRM "core".

Maybe kernel reviewers also never look at driver-specific docs to find
attempts at redefining common KMS properties?

(I still don't know which definition is prevalent.)

> >  =20
> > > Degamma makes no sense after blending anyway. =20
> >=20
> > If the goal is to allow blending in optical or other space, you are
> > correct. However, APIs do not need to make sense to exist, like most of
> > the options of "Colorspace" connector property.
> >=20
> > I have always thought the CRTC DEGAMMA only exists to allow the CRTC
> > CTM to work in linear or other space.
> >=20
> > I have at times been puzzled by what the DEGAMMA and CTM are actually
> > good for.
> >  =20
> > > The entire point is for it to happen before blending to blend in line=
ar
> > > space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are the exact same thing=
... =20
> >=20
> > The CRTC CTM is between CRTC DEGAMMA and CRTC GAMMA, meaning they are
> > not interchangeable.
> >=20
> > I have literally believed that DRM KMS UAPI simply does not support
> > blending in optical space, unless your framebuffers are in optical
> > which no-one does, until the color management properties are added to
> > KMS planes. This never even seemed weird, because non-linear blending
> > is so common.
> >=20
> > So I have been misunderstanding the CRTC DEGAMMA property forever. Am I
> > the only one? Do all drivers agree today at what point does CRTC
> > DEGAMMA apply, before blending on all planes or after blending?
> >  =20
>=20
> I'd like to know current userspace cases on Linux of this CRTC DEGAMMA
> LUT.

I don't know of any, but that doesn't mean anything.

> > Does anyone know of any doc about that? =20
>=20
> From what I retrieved about the introduction of CRTC color props[1], it
> seems the main concern at that point was getting a linear space for
> CTM[2] and CRTC degamma property seems to have followed intel
> requirements, but didn't find anything about the blending space.

Right. I've always thought CRTC props apply after blending.

> AFAIU, we have just interpreted that all CRTC color properties for DRM
> interface are after blending[3]. Can this be seen in another way?

Joshua did, and he has a logical point.

I guess if we really want to know, someone would need review all
drivers exposing these props, and even check if they changed in the
past.

FWIW, the usefulness of (RE)GAMMA (not DEGAMMA) LUT is limited by the
fact that attempting to represent 1/2.2 power function as a uniformly
distributed LUT is infeasible due to the approximation errors near zero.


Thanks,
pq

> [1] https://patchwork.freedesktop.org/series/2720/
> [2] https://codereview.chromium.org/1182063002
> [3] https://dri.freedesktop.org/docs/drm/_images/dcn3_cm_drm_current.svg
>=20
> >=20
> > If drivers do not agree on the behaviour of a KMS property, then that
> > property is useless for generic userspace.
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >  =20
> > > On Tuesday, 22 August 2023, Pekka Paalanen <pekka.paalanen@collabora.=
com>
> > > wrote: =20
> > > > On Thu, 10 Aug 2023 15:02:59 -0100
> > > > Melissa Wen <mwen@igalia.com> wrote:
> > > >   =20
> > > >> The next patch adds pre-blending degamma to AMD color mgmt pipelin=
e, but
> > > >> pre-blending degamma caps (DPP) is currently in use to provide DRM=
 CRTC
> > > >> atomic degamma or implict degamma on legacy gamma. Detach degamma =
usage
> > > >> regarging CRTC color properties to manage plane and CRTC color
> > > >> correction combinations.
> > > >>
> > > >> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > > >> Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > >> ---
> > > >>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++-=
-----
> > > >>  1 file changed, 41 insertions(+), 18 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color=
.c   =20
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c =20
> > > >> index 68e9f2c62f2e..74eb02655d96 100644
> > > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > > >> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct  =
 =20
> > > dm_crtc_state *crtc) =20
> > > >>       return 0;
> > > >>  }
> > > >>
> > > >> -/**
> > > >> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management t=
o DC   =20
> > > plane. =20
> > > >> - * @crtc: amdgpu_dm crtc state
> > > >> - * @dc_plane_state: target DC surface
> > > >> - *
> > > >> - * Update the underlying dc_stream_state's input transfer functio=
n   =20
> > > (ITF) in =20
> > > >> - * preparation for hardware commit. The transfer function used de=
pends   =20
> > > on =20
> > > >> - * the preparation done on the stream for color management.
> > > >> - *
> > > >> - * Returns:
> > > >> - * 0 on success. -ENOMEM if mem allocation fails.
> > > >> - */
> > > >> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > > >> -                                   struct dc_plane_state   =20
> > > *dc_plane_state) =20
> > > >> +static int
> > > >> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> > > >> +                          struct dc_plane_state *dc_plane_state)
> > > >>  {
> > > >>       const struct drm_color_lut *degamma_lut;
> > > >>       enum dc_transfer_func_predefined tf =3D TRANSFER_FUNCTION_SR=
GB;
> > > >> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct  =
 =20
> > > dm_crtc_state *crtc, =20
> > > >>                                                &degamma_size);
> > > >>               ASSERT(degamma_size =3D=3D MAX_COLOR_LUT_ENTRIES);
> > > >>
> > > >> -             dc_plane_state->in_transfer_func->type =3D
> > > >> -                     TF_TYPE_DISTRIBUTED_POINTS;
> > > >> +             dc_plane_state->in_transfer_func->type =3D   =20
> > > TF_TYPE_DISTRIBUTED_POINTS; =20
> > > >>
> > > >>               /*
> > > >>                * This case isn't fully correct, but also fairly
> > > >> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct  =
 =20
> > > dm_crtc_state *crtc, =20
> > > >>                                  degamma_lut, degamma_size);
> > > >>               if (r)
> > > >>                       return r;
> > > >> -     } else if (crtc->cm_is_degamma_srgb) {
> > > >> +     } else {
> > > >>               /*
> > > >>                * For legacy gamma support we need the regamma input
> > > >>                * in linear space. Assume that the input is sRGB.
> > > >> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct =
  =20
> > > dm_crtc_state *crtc, =20
> > > >>
> > > >>               if (tf !=3D TRANSFER_FUNCTION_SRGB &&
> > > >>                   !mod_color_calculate_degamma_params(NULL,
> > > >> -                         dc_plane_state->in_transfer_func, NULL, =
false))
> > > >> +   =20
> > >  dc_plane_state->in_transfer_func, =20
> > > >> +                                                     NULL, false))
> > > >>                       return -ENOMEM;
> > > >> +     }
> > > >> +
> > > >> +     return 0;
> > > >> +}
> > > >> +
> > > >> +/**
> > > >> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management t=
o DC   =20
> > > plane. =20
> > > >> + * @crtc: amdgpu_dm crtc state
> > > >> + * @dc_plane_state: target DC surface
> > > >> + *
> > > >> + * Update the underlying dc_stream_state's input transfer functio=
n   =20
> > > (ITF) in =20
> > > >> + * preparation for hardware commit. The transfer function used de=
pends   =20
> > > on =20
> > > >> + * the preparation done on the stream for color management.
> > > >> + *
> > > >> + * Returns:
> > > >> + * 0 on success. -ENOMEM if mem allocation fails.
> > > >> + */
> > > >> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
> > > >> +                                   struct dc_plane_state   =20
> > > *dc_plane_state) =20
> > > >> +{
> > > >> +     bool has_crtc_cm_degamma;
> > > >> +     int ret;
> > > >> +
> > > >> +     has_crtc_cm_degamma =3D (crtc->cm_has_degamma ||   =20
> > > crtc->cm_is_degamma_srgb); =20
> > > >> +     if (has_crtc_cm_degamma){
> > > >> +             /* AMD HW doesn't have post-blending degamma caps. W=
hen DRM
> > > >> +              * CRTC atomic degamma is set, we maps it to DPP deg=
amma   =20
> > > block =20
> > > >> +              * (pre-blending) or, on legacy gamma, we use DPP de=
gamma   =20
> > > to =20
> > > >> +              * linearize (implicit degamma) from sRGB/BT709 acco=
rding   =20
> > > to =20
> > > >> +              * the input space.   =20
> > > >
> > > > Uhh, you can't just move degamma before blending if KMS userspace
> > > > wants it after blending. That would be incorrect behaviour. If you
> > > > can't implement it correctly, reject it.
> > > >
> > > > I hope that magical unexpected linearization is not done with atomi=
c,
> > > > either.
> > > >
> > > > Or maybe this is all a lost cause, and only the new color-op pipeli=
ne
> > > > UAPI will actually work across drivers.
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > >   =20
> > > >> +              */
> > > >> +             ret =3D map_crtc_degamma_to_dc_plane(crtc, dc_plane_=
state);
> > > >> +             if (ret)
> > > >> +                     return ret;
> > > >>       } else {
> > > >>               /* ...Otherwise we can just bypass the DGM block. */
> > > >>               dc_plane_state->in_transfer_func->type =3D TF_TYPE_B=
YPASS;   =20
> > > >
> > > >   =20
> >  =20


--Sig_/SF6xh5rAi.ZUOgSK_NWtFI.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTtsYEACgkQI1/ltBGq
qqcc9g//aw0NW2pJxHaQFNAl47RN2H/hUzNxKxc2xL4bE/hVdlzTLhAgCxkErfml
QhiypCAfJVcBhldGJ1Ik90hkUJB0DB/hQBDOoyeLKHcsXRUDbfa6ZhJ2MgIsuNyK
ShLIstgYYVipayaBW/yMhjPoeryNboXqQ4L0jdomfFeW5tegdLYkU8+y4MSRd83o
jtyK9j160kqZKyOtDrHlb06+bWbOYiYcGfygCBR98MCC85sbjcHWdM2My3o3WgXe
6gFsFZO2dps5PSRM4+aFeT6pKJJ6hYLoeAsfb7THprYJjBgubhkglJrnDF2sT4aU
5j5hbS2BBad9UnCR0ZZ0sAJi2mj45rAt+KKOiNxw6I1IHb5sDOT6ynIMp3FcYZJa
8VofFOk1BYYGrFrsbcvspQbEkUqRIfwl+M36r1HdR5RFiO5jC6/Oi5tGYTwKmAGG
vkSOjh79D0BeZ5WocQscp5K8bOPg1X7cs9K3t5nsYDk+WCpkVGwKPbCQ0+rhcxgi
h6Q/AmIDVMSKg1g/SD9w2DhgXxERd5OR6uTY7Dn6eE3qGfRmpXqq8XEaGj6uuyUk
o/kTPnZ3TdZnAn3zwE5U66q6+pmOIPv8Xalr3ovywYTIy8ggwpJImBc1mH9BDljL
qgFwkXmJtB7uRqGdEjg6ttNXGZQw2SKiZzQBQejW8+R95gdobEk=
=DvOB
-----END PGP SIGNATURE-----

--Sig_/SF6xh5rAi.ZUOgSK_NWtFI.--
