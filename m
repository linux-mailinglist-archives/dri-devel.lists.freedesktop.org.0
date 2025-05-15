Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D86AB846D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7860110E83B;
	Thu, 15 May 2025 10:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fAIJSBAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9246210E845;
 Thu, 15 May 2025 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747306673;
 bh=tkUu0+LahIs3uGbYbOU/A9iAPr1R923nqkgKoJ83sWc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fAIJSBACu7TFc4ocGG/K/f6mup1hmOz8LXELgKiRGlo3SijK8ssBOyqo5od9rOwR9
 CBvSJaipDauLLUYrbsHUyDGO/U4c6W+RF5Z3QmsQ0YHQFA/G7zDuJx1Rapouz5jHxL
 ujDVTd8cE8MfWespxotCDcCmaHHXYBwM41eIQEQdkBRWkNxWtZh2/JzphEjY2D0yy1
 UmGM8cboQstYNm0HgFziZUtVVpqcNv19e9701MSRy7JG9JinCgSr5ALeICfoTPekFp
 kWc7y9X/m21MQFeM1muLJ+R+XrkVjjdG59lIea+abyVfiy7eCXylTVkVoBoAhVMiYz
 FXy50DyTZYWqQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AF58717E01FD;
 Thu, 15 May 2025 12:57:52 +0200 (CEST)
Date: Thu, 15 May 2025 13:57:29 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 26/43] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
Message-ID: <20250515135729.7daed13f@eldfell>
In-Reply-To: <13fffc5d-21e6-4207-9f65-ae2c4edba1c1@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-27-alex.hung@amd.com>
 <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
 <20250513104213.1c5d905a@eldfell>
 <sb544qlewpslcvcgofer762puac5bjd5w67ldisi6pkcpkuboj@33lwudjvd6xr>
 <13fffc5d-21e6-4207-9f65-ae2c4edba1c1@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xNr6Hkm+O86n+==OOiCOPGI";
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

--Sig_/xNr6Hkm+O86n+==OOiCOPGI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 May 2025 16:39:51 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2025-05-13 11:36, Melissa Wen wrote:
> > On 05/13, Pekka Paalanen wrote: =20
> >> On Mon, 12 May 2025 15:50:17 -0300
> >> Melissa Wen <mwen@igalia.com> wrote:
> >> =20
> >>> On 04/29, Alex Hung wrote: =20
> >>>> Expose one 1D curve colorop with support for
> >>>> DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> >>>> the sRGB transform when the colorop is not in bypass.
> >>>>
> >>>> With this change the following IGT test passes:
> >>>> kms_colorop --run plane-XR30-XR30-srgb_eotf
> >>>>
> >>>> The color pipeline now consists of a single colorop:
> >>>> 1. 1D curve colorop w/ sRGB EOTF
> >>>>
> >>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
> >>>> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> >>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
> >>>> ---
> >>>> V9:
> >>>>  - Update function names by _plane_ (Chaitanya Kumar Borah)
> >>>>  - Update replace cleanup code by drm_colorop_pipeline_destroy (Simo=
n Ser)
> >>>>
> >>>> v8:
> >>>>  - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)
> >>>>
> >>>> v7:
> >>>>  - Fix checkpatch warnings
> >>>>   - Change switch "{ }" position
> >>>>   - Delete double ";"
> >>>>   - Delete "{ }" for single-line if-statement
> >>>>   - Add a new line at EOF
> >>>>   - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
> >>>>
> >>>> v6:
> >>>>  - cleanup if colorop alloc or init fails
> >>>>
> >>>>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
> >>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 ++++++++++++++++=
+++
> >>>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 69 +++++++++++++++
> >>>>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
> >>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
> >>>>  5 files changed, 201 insertions(+), 1 deletion(-)
> >>>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_=
colorop.c
> >>>>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_=
colorop.h
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/driver=
s/gpu/drm/amd/display/amdgpu_dm/Makefile
> >>>> index ab2a97e354da..46158d67ab12 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> >>>> @@ -38,7 +38,8 @@ AMDGPUDM =3D \
> >>>>  	amdgpu_dm_pp_smu.o \
> >>>>  	amdgpu_dm_psr.o \
> >>>>  	amdgpu_dm_replay.o \
> >>>> -	amdgpu_dm_wb.o
> >>>> +	amdgpu_dm_wb.o \
> >>>> +	amdgpu_dm_colorop.o
> >>>> =20
> >>>>  ifdef CONFIG_DRM_AMD_DC_FP
> >>>>  AMDGPUDM +=3D dc_fpu.o
> >>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c=
 b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>>> index ebabfe3a512f..0b513ab5050f 100644
> >>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> >>>> @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_functio=
n tf)
> >>>>  	}
> >>>>  }
> >>>> =20
> >>>> +static enum dc_transfer_func_predefined
> >>>> +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> >>>> +{
> >>>> +	switch (tf) {
> >>>> +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> >>>> +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> >>>> +		return TRANSFER_FUNCTION_SRGB;
> >>>> +	default:
> >>>> +		return TRANSFER_FUNCTION_LINEAR;
> >>>> +	}
> >>>> +}
> >>>> +
> >>>>  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
> >>>>  				const struct drm_color_lut lut,
> >>>>  				int bit_precision)
> >>>> @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state=
 *plane_state,
> >>>>  	return 0;
> >>>>  }
> >>>> =20
> >>>> +static int
> >>>> +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> >>>> +		       struct drm_colorop_state *colorop_state)
> >>>> +{
> >>>> +	struct dc_transfer_func *tf =3D &dc_plane_state->in_transfer_func;
> >>>> +	struct drm_colorop *colorop =3D colorop_state->colorop;
> >>>> +	struct drm_device *drm =3D colorop->dev;
> >>>> +
> >>>> +	if (colorop->type !=3D DRM_COLOROP_1D_CURVE ||
> >>>> +	    colorop_state->curve_1d_type !=3D DRM_COLOROP_1D_CURVE_SRGB_EO=
TF)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (colorop_state->bypass) {
> >>>> +		tf->type =3D TF_TYPE_BYPASS;
> >>>> +		tf->tf =3D TRANSFER_FUNCTION_LINEAR;
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>> +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> >>>> +
> >>>> +	tf->type =3D TF_TYPE_PREDEFINED;
> >>>> +	tf->tf =3D amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type=
);
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> >>>> +			       struct dc_plane_state *dc_plane_state,
> >>>> +			       struct drm_colorop *colorop)
> >>>> +{
> >>>> +	struct drm_colorop *old_colorop;
> >>>> +	struct drm_colorop_state *colorop_state =3D NULL, *new_colorop_sta=
te;
> >>>> +	struct drm_atomic_state *state =3D plane_state->state;
> >>>> +	int i =3D 0;
> >>>> +
> >>>> +	old_colorop =3D colorop;
> >>>> +
> >>>> +	/* 1st op: 1d curve - degamma */
> >>>> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i=
) {
> >>>> +		if (new_colorop_state->colorop =3D=3D old_colorop &&
> >>>> +		    new_colorop_state->curve_1d_type =3D=3D DRM_COLOROP_1D_CURVE_=
SRGB_EOTF) {
> >>>> +			colorop_state =3D new_colorop_state;
> >>>> +			break;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	if (!colorop_state)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state)=
;   =20
> >>>
> >>> I wonder what will happen if plane degamma isn't set, but CRTC degamma
> >>> LUT or legacy CRTC regamma LUT (with its implicity sRGB degamma) is u=
sed
> >>> together with other plane color ops.
> >>>
> >>> I can imagine the mess, so I think CRTC degamma LUT and legacy CRTC
> >>> regamma LUT should be somehow entirely disabled (or rejected) if plane
> >>> color pipeline is in use. =20
> >>
> >> Hi Melissa,
> >>
> >> if using a plane color pipeline means that a CRTC LUT cannot be used, =
it
> >> will severely limit the usefulness of the whole KMS color processing. =
In
> >> Weston's case it would prohibit *all* KMS off-loading when color
> >> management is in use.
> >>
> >> Weston chooses to do composition and blending in an optical space. This
> >> means that plane color pipelines are required to convert incoming
> >> pixels into the optical space, and a CRTC LUT (a CRTC color pipeline in
> >> the future) is required to convert from the optical space to the
> >> monitor signalling (electrical space). =20
> >=20
> > Hi Pekka,
> >=20
> > IIRC, Weston needs one post-blending 1D LUT and with my suggestion the
> > atomic CRTC regamma LUT works fine and can be this 1D LUT.
> > So, instead of an atomic post-blending/CRTC color pipeline with:
> >=20
> > [blending] -> CRTC 1D LUT -> CRTC CTM -> CRTC 1D LUT
> >=20
> > when plane color pipeline is in use, the driver accepts only:
> >=20
> > [blending] -> CRTC CTM -> CRTC 1D LUT
> >=20

Hi Melissa,

sorry, that is fine. I misunderstood disabling both degamma LUT and
regamma LUT as no LUT stage being left available on a CRTC. After all,
only GAMMA_LUT and DEGAMMA_LUT exist upstream.

> > If AMD driver continues accepting/exposing CRTC degamma LUT plus plane
> > color pipeline, and userpace wants something like:
> >=20
> > Plane shaper LUT -> Plane 3D LUT -> Plane Blnd LUT -> [blending] -> **C=
RTC** degamma LUT
> >=20
> > I understand that this weird sequence is what will actually happen:
> >=20
> > **CRTC** degamma LUT -> Plane shaper LUT -> Plane 3D LUT -> Plane Blnd =
LUT -> [blending]
> >  =20
>=20
> Right, and this is quirky behavior by the AMD driver because
> historically we only had the CRTC LUTs and had to use the CRTC
> degamma LUT to program degamma, which technically needs to happen
> pre-blending, i.e., on the plane.
>=20
> The degamma LUT never really made sense on a crtc, but here
> we are.

Huh. I always assumed that CRTC DEGAMMA_LUT was something in the
hardware after blending and that someone just wanted to expose that
hardware feature. I'd never have guessed that it might have applied
before blending on purpose.

The position of the CRTC CTM before or after blending does not matter.
The positions are mathematically equivalent I think.

> > Because userspace doesn't care if this is a "degamma" or "regamma" LUT
> > and they will probably pick the first 1D LUT in the post-blending color
> > pipeline, which currently means CRTC degamma LUT. So, better if it take=
s =20
>=20
> Ideally a userspace implementation would be the correct LUT
> but not sure that would always happen.
>=20

FWIW, people who rely on ICC profile VCGT might be quite precise about
how the VCGT is applied. I've been essentially called ignorant for
applying VCGT anywhere else than in "the" hardware LUT.

> > the CRTC regamma LUT that is actually a post-blending 1D LUT. Where I
> > expected this result:
> >=20
> > Plane shaper LUT -> PLane 3D LUT -> PLane Blnd LUT -> [blending] -> CRT=
C regamma LUT
> >=20
> > You can vizualize better this degamma issue in this diagram:
> > https://raw.githubusercontent.com/melissawen/melissawen.github.io/maste=
r/img/xdc-2023-colors-talk/rainbow-treasure-xdc-2023-17.png
> >=20
> > In the current driver-specific implementation, driver rejects atomic co=
mmits
> > in case of collision, i.e., Plane degamma LUT + CRTC degamma LUT, but
> > IIRC, the driver doesn't handle it if it doesn't clash.
> >  =20
>=20
> Yeah, I agree the most straight-forward way to avoid problems
> going forward is to not advertise the CRTC degamma LUT for HW
> generations where we'll advertise the plane pipeline.
>=20
> I talked to Alex to make that change.

Sounds good to me.


Thanks,
pq

> >> I don't know what "with its implicity sRGB degamma" means, but there
> >> cannot be any implicit curves at all. The driver has no knowledge of
> >> how the framebuffer pixels are encoded, nor about what the blending
> >> space should be. =20
> >=20
> > It targets the legacy CRTC regamma LUT (256 size), not the atomic CRTC
> > color pipeline.
> >=20
> > Melissa
> >  =20
> >>
> >>
> >> Thanks,
> >> pq =20
> >=20
> >  =20
>=20


--Sig_/xNr6Hkm+O86n+==OOiCOPGI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmglyJkACgkQI1/ltBGq
qqfdeRAAgBVVrakVXi4ImsyTrsq+f0HqHhJQ3dY7U8vUfK/9PsuYtYFiMN0A59zi
k60z7eDBpBmr2ZyY5w97qjxL2IrgGqwyV1+gXbXomd9jSSkBSyLmFTWCv8bqf5e3
2DCZiI0luMScu8B1SB0DqtK0Fw8KLuQRgKyvE3HC5kIkYbsWALJ0wa+0CVL+kysg
Pr9/iVh1V7kwUBACBqGJgtxDCgJLhZBzEU5tgdOtdOmYYupPmt6/+nA6JMZaj9m5
954GgcCPAOjrldOMWXF5KqW+2tQjHGrxDaJvgDKjXYjnPZKI1XUv08z+W/i+dvt3
E6fVeJtXiy1k202rD+zl1SIg9pg/ymqdGaeNyeP1kqFLRo0ArsiCjONLvn3SwGdc
diNZQ412qWyohoJ/jJONTUMx5kwWamtOweIP8fWLT7n4EfJIydD2ABqhJuLo+Z/K
qer9tb+bpbt1MKUWaxMn4u2CWPizFpfdnrWc0h9aFnuB4wWoxWtbSG4T8o3O3+e+
UDHTPCUDSudUVfiFoBDWdTKJYyv0VPqbtuQ6+iXvkU8pRw8vncwfCRK7osUzVsM5
iAaBjQPzwppXqJeqlfXznp26DsjTVXyXO2Sw0bnMi/0hQy/xuvSParwSETtN9zaU
goLjjiyy40X6zgRiLSSuoYHTgSc+BCgY02r/OMe3gAVyZ+9miiA=
=WUpi
-----END PGP SIGNATURE-----

--Sig_/xNr6Hkm+O86n+==OOiCOPGI--
