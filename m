Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56563AB4CF8
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 09:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F24810E32E;
	Tue, 13 May 2025 07:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oWHmfKA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206910E16C;
 Tue, 13 May 2025 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747122163;
 bh=lfE9Fx0YxcY7+yid9yq30xLGb7KlsukHQPwIvTdg3sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oWHmfKA2raFKnyFoK3lyWorBRxA55B585Yzbh1aCtbgVMXhY93+4VWjcSo8epFozE
 92KQ9lCcZ/wZMdMqTPwW1aQnetVeIft8lH7WwmTKKYiKGISnfEF61i5jHkKvVzDeTD
 ryw5fI53phe0igoxbTyrm8XObgoxTy3+0HWLeqOxajLywKZQVzjT3/HAsqFuJNZSDG
 +rTPJZMp/uR6MYVfFcl/lUpOJ++Ouqouamcu1T2x4mJeUgvprBH4PXCqUqpO+wRNcv
 PybfxoUMLk+lWxqZ11GVg3J14DE/wVGkoN14SlFhWkjmj6astem0F3YeuMKMabrTj0
 10HMqbmLghG4g==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B5E9417E1220;
 Tue, 13 May 2025 09:42:42 +0200 (CEST)
Date: Tue, 13 May 2025 10:42:12 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 26/43] drm/amd/display: Add support for sRGB EOTF in
 DEGAM block
Message-ID: <20250513104213.1c5d905a@eldfell>
In-Reply-To: <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-27-alex.hung@amd.com>
 <twwndnvjm6rmxdt4cs747fixvplpeuy3yh3ho6d4yq3y3prhub@fag4kafh2xct>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A0x/3fzY+c_Yy3jqOjxoPnx";
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

--Sig_/A0x/3fzY+c_Yy3jqOjxoPnx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 15:50:17 -0300
Melissa Wen <mwen@igalia.com> wrote:

> On 04/29, Alex Hung wrote:
> > Expose one 1D curve colorop with support for
> > DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> > the sRGB transform when the colorop is not in bypass.
> >=20
> > With this change the following IGT test passes:
> > kms_colorop --run plane-XR30-XR30-srgb_eotf
> >=20
> > The color pipeline now consists of a single colorop:
> > 1. 1D curve colorop w/ sRGB EOTF
> >=20
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Reviewed-by: Daniel Stone <daniels@collabora.com>
> > ---
> > V9:
> >  - Update function names by _plane_ (Chaitanya Kumar Borah)
> >  - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon S=
er)
> >=20
> > v8:
> >  - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)
> >=20
> > v7:
> >  - Fix checkpatch warnings
> >   - Change switch "{ }" position
> >   - Delete double ";"
> >   - Delete "{ }" for single-line if-statement
> >   - Add a new line at EOF
> >   - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */
> >=20
> > v6:
> >  - cleanup if colorop alloc or init fails
> >=20
> >  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 69 +++++++++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
> >  5 files changed, 201 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_col=
orop.c
> >  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_col=
orop.h
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/g=
pu/drm/amd/display/amdgpu_dm/Makefile
> > index ab2a97e354da..46158d67ab12 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> > @@ -38,7 +38,8 @@ AMDGPUDM =3D \
> >  	amdgpu_dm_pp_smu.o \
> >  	amdgpu_dm_psr.o \
> >  	amdgpu_dm_replay.o \
> > -	amdgpu_dm_wb.o
> > +	amdgpu_dm_wb.o \
> > +	amdgpu_dm_colorop.o
> > =20
> >  ifdef CONFIG_DRM_AMD_DC_FP
> >  AMDGPUDM +=3D dc_fpu.o
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index ebabfe3a512f..0b513ab5050f 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -668,6 +668,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function t=
f)
> >  	}
> >  }
> > =20
> > +static enum dc_transfer_func_predefined
> > +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> > +{
> > +	switch (tf) {
> > +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> > +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> > +		return TRANSFER_FUNCTION_SRGB;
> > +	default:
> > +		return TRANSFER_FUNCTION_LINEAR;
> > +	}
> > +}
> > +
> >  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
> >  				const struct drm_color_lut lut,
> >  				int bit_precision)
> > @@ -1137,6 +1149,59 @@ __set_dm_plane_degamma(struct drm_plane_state *p=
lane_state,
> >  	return 0;
> >  }
> > =20
> > +static int
> > +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> > +		       struct drm_colorop_state *colorop_state)
> > +{
> > +	struct dc_transfer_func *tf =3D &dc_plane_state->in_transfer_func;
> > +	struct drm_colorop *colorop =3D colorop_state->colorop;
> > +	struct drm_device *drm =3D colorop->dev;
> > +
> > +	if (colorop->type !=3D DRM_COLOROP_1D_CURVE ||
> > +	    colorop_state->curve_1d_type !=3D DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> > +		return -EINVAL;
> > +
> > +	if (colorop_state->bypass) {
> > +		tf->type =3D TF_TYPE_BYPASS;
> > +		tf->tf =3D TRANSFER_FUNCTION_LINEAR;
> > +		return 0;
> > +	}
> > +
> > +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> > +
> > +	tf->type =3D TF_TYPE_PREDEFINED;
> > +	tf->tf =3D amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> > +			       struct dc_plane_state *dc_plane_state,
> > +			       struct drm_colorop *colorop)
> > +{
> > +	struct drm_colorop *old_colorop;
> > +	struct drm_colorop_state *colorop_state =3D NULL, *new_colorop_state;
> > +	struct drm_atomic_state *state =3D plane_state->state;
> > +	int i =3D 0;
> > +
> > +	old_colorop =3D colorop;
> > +
> > +	/* 1st op: 1d curve - degamma */
> > +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> > +		if (new_colorop_state->colorop =3D=3D old_colorop &&
> > +		    new_colorop_state->curve_1d_type =3D=3D DRM_COLOROP_1D_CURVE_SRG=
B_EOTF) {
> > +			colorop_state =3D new_colorop_state;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!colorop_state)
> > +		return -EINVAL;
> > +
> > +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state); =
=20
>=20
> I wonder what will happen if plane degamma isn't set, but CRTC degamma
> LUT or legacy CRTC regamma LUT (with its implicity sRGB degamma) is used
> together with other plane color ops.
>=20
> I can imagine the mess, so I think CRTC degamma LUT and legacy CRTC
> regamma LUT should be somehow entirely disabled (or rejected) if plane
> color pipeline is in use.

Hi Melissa,

if using a plane color pipeline means that a CRTC LUT cannot be used, it
will severely limit the usefulness of the whole KMS color processing. In
Weston's case it would prohibit *all* KMS off-loading when color
management is in use.

Weston chooses to do composition and blending in an optical space. This
means that plane color pipelines are required to convert incoming
pixels into the optical space, and a CRTC LUT (a CRTC color pipeline in
the future) is required to convert from the optical space to the
monitor signalling (electrical space).

I don't know what "with its implicity sRGB degamma" means, but there
cannot be any implicit curves at all. The driver has no knowledge of
how the framebuffer pixels are encoded, nor about what the blending
space should be.


Thanks,
pq

--Sig_/A0x/3fzY+c_Yy3jqOjxoPnx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgi99UACgkQI1/ltBGq
qqcP7w//e9mBTAMdftuA5HbVW2htz/qP7+y50Sst2XG7y6OdP7NIkq8XRLvN+ug4
e1+GzFWMn2TunSfuf62SGk26V5jeaU3Uj3QIwZz1WPccHpRI0WE6g+7BkPNbwwnt
3TFljsw/t8hRZXYJKz02LRrkPb7+ZpgidDyOexIrothMjURtMsHb+wLOBYlmzEqC
C7hEFU17BertdhQzttiWZDghusZFE9247IBQxQ1qv5DyxZtgkVPrWrRaPvdhPSgX
U6zKHy6gDPna0528ILfR+Ivqg2Yy4wsIxRkSvHT2BnCqv/l5CxftnB2TyFdmgGlD
+ctGTr2oTNXKzDar1TKWktNvzZpS9tDbB9/kaoClu/eZYOeR02APVI3ulnsxsWj4
WwYNnyCQq5eIYgLLZB5n57bs7D61sJKm5cGyyQCH3cCTUyxUIK7mS30qNvmsAnBe
3XHT6RxjIowYDkh/jkg5D87CRlwJUVF+nARDoCU5jHGE2H/ig1CUXcLuZErrxHeF
MbYvY5xP4eIkhhfdDgEO5Xlaxjj0KS6B6g89SsRFdC0AjnegMJNevzlGicfhYHp8
RcYRyR4wVTopkA6onoq2UuGjw6Bh9Vu8JNAdoHh27im5ISsBEenUSV52Scbo2W0Z
3T8lM6qShNwh9BBhKM+VcOuxO4XxPBE0ttd7tpC90aYVZX0TPV4=
=TUkI
-----END PGP SIGNATURE-----

--Sig_/A0x/3fzY+c_Yy3jqOjxoPnx--
