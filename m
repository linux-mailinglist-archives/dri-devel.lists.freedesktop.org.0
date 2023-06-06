Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3721B7249ED
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2866710E38B;
	Tue,  6 Jun 2023 17:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B8510E387;
 Tue,  6 Jun 2023 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tDsGx+yCOgkCzRP7mhLKj0TyQtISVqkkZTfTDadTSgk=; b=DRCp0LBgzBvJzVSP9B+pUeom3Z
 6JAvlYzSw/AqEoJvl2ZVuXnCpN70yEGk785UsOmwXYeVdUMCr/2gDToNtTkI+AZa+9h3xUVehBTCv
 W6TUVp4+/yhSOXuzHjLUXoMeVTCV+D3L0h7TuKm2LQiphhrsEtlznZvYDrPp4puOjKoa12+9Zo2HJ
 qbc9gZuqJZBxVza4mGGp41X5optPSJ0Wkc0b8OPlTJa+NxYxC4fSxBbCiOSPh1s5etpUwdTNqCTBb
 yfoNL4qNq6w6vBzUwYlSfD5B2IV3SV5ZWE8Z+YDqItMsxzeROQJACKxYPFnq8ozRwuAXjKwJyx8kR
 BrD6/v7g==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q6aGI-009cGH-SL; Tue, 06 Jun 2023 19:14:27 +0200
Date: Tue, 6 Jun 2023 16:14:19 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property
 for gamma TF
Message-ID: <20230606171419.im2hf5z4ucc53f6f@mail.igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-7-mwen@igalia.com>
 <5ea0146c-19a2-58d9-4cc9-29af6d433915@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="74xf24ocxx6gmbbw"
Content-Disposition: inline
In-Reply-To: <5ea0146c-19a2-58d9-4cc9-29af6d433915@amd.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--74xf24ocxx6gmbbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/01, Harry Wentland wrote:
>=20
>=20
> On 5/23/23 18:14, Melissa Wen wrote:
> > Hook up driver-specific atomic operations for managing AMD color
> > properties and create AMD driver-specific color management properties
> > and attach them according to HW capabilities defined by `struct
> > dc_color_caps`. Add enumerated transfer function property to DRM CRTC
> > gamma to convert to wire encoding with or without a user gamma LUT.
> > Enumerated TFs are not supported yet by the DRM color pipeline,
> > therefore, create a DRM enum list with the predefined TFs supported by
> > the AMD display driver.
> >=20
> > Co-developed-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 ++++++++++++++++++-
> >  4 files changed, 137 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index 389396eac222..88af075e6c18 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct dr=
m_device *dev,
> >  	return &amdgpu_fb->base;
> >  }
> > =20
> > +static const struct drm_prop_enum_list drm_transfer_function_enum_list=
[] =3D {
> > +	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
> > +	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
> > +	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
> > +	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> > +	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
> > +	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
> > +	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> > +	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> > +};
>=20
> Let's not use the DRM_/drm_ prefix here. It might clash later when
> we introduce DRM_ core interfaces for enumerated transfer functions.
>=20
> We'll want to specify whether something is an EOTF or an inverse EOTF,
> or possibly an OETF. Of course that wouldn't apply to "Linear" or
> "Unity" (I'm assuming the two are the same?).
>=20
> EOTF =3D electro-optical transfer function
> This is the transfer function to go from the encoded value to an
> optical (linear) value.
>=20
> Inverse EOTF =3D simply the inverse of the EOTF
> This is usually intended to go from an optical/linear space (which
> might have been used for blending) back to the encoded values.
>=20
> OETF =3D opto-electronic transfer function
> This is usually used for converting optical signals into encoded
> values. Usually that's done on the camera side but I think HLG might
> define the OETF instead of the EOTF. A bit fuzzy on that. If you're
> unclear about HLG I recommend we don't include it yet.
>=20
> It would also be good to document a bit more what each of the TFs
> mean, but I'm fine if that comes later with a "driver-agnostic"
> API. The key thing to clarify is whether we have an EOTF or inv_EOTF,
> i.e. whether we use the TF to go from encoded to optical or vice
> versa.
>=20
> I know DC is sloppy and doesn't define those but it will still use
> them as either EOTF or inv_EOTF, based on which block they're being
> programmed, if I'm not mistaken.
>=20
> > +
> > +#ifdef AMD_PRIVATE_COLOR
> > +static int
> > +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> > +{
> > +	struct drm_property *prop;
> > +
> > +	prop =3D drm_property_create_enum(adev_to_drm(adev),
> > +					DRM_MODE_PROP_ENUM,
> > +					"AMD_REGAMMA_TF",
> > +					drm_transfer_function_enum_list,
> > +					ARRAY_SIZE(drm_transfer_function_enum_list));
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.regamma_tf_property =3D prop;
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
>=20
> It'd be nice if we have this function and the above enum_list
> in amdgpu_dm, possibly in amdgpu_dm_color.c. You could call it
> directly after the amdgpu_display_modeset_create_prop() call in=20
> amdgpu_dm_mode_config_init().

Ok. I'll move everything to amdgpu_dm_color.

>=20
> >  const struct drm_mode_config_funcs amdgpu_mode_funcs =3D {
> >  	.fb_create =3D amdgpu_display_user_framebuffer_create,
> >  };
> > @@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struct a=
mdgpu_device *adev)
> >  			return -ENOMEM;
> >  	}
> > =20
> > +#ifdef AMD_PRIVATE_COLOR
> > +	if (amdgpu_display_create_color_properties(adev))
> > +		return -ENOMEM;
> > +#endif
> >  	return 0;
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index b8633df418d4..881446c51b36 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -344,6 +344,14 @@ struct amdgpu_mode_info {
> >  	int			disp_priority;
> >  	const struct amdgpu_display_funcs *funcs;
> >  	const enum drm_plane_type *plane_type;
> > +
> > +	/* Driver-private color mgmt props */
> > +
> > +	/* @regamma_tf_property: Transfer function for CRTC regamma
> > +	 * (post-blending). Possible values are defined by `enum
> > +	 * drm_transfer_function`.
> > +	 */
> > +	struct drm_property *regamma_tf_property;
> >  };
> > =20
> >  #define AMDGPU_MAX_BL_LEVEL 0xFF
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 2e2413fd73a4..ad5ee28b83dc 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uint8_=
t *status,
> > =20
> >  extern const struct amdgpu_ip_block_version dm_ip_block;
> > =20
> > +enum drm_transfer_function {
> > +	DRM_TRANSFER_FUNCTION_DEFAULT,
> > +	DRM_TRANSFER_FUNCTION_SRGB,
> > +	DRM_TRANSFER_FUNCTION_BT709,
> > +	DRM_TRANSFER_FUNCTION_PQ,
> > +	DRM_TRANSFER_FUNCTION_LINEAR,
> > +	DRM_TRANSFER_FUNCTION_UNITY,
> > +	DRM_TRANSFER_FUNCTION_HLG,
> > +	DRM_TRANSFER_FUNCTION_GAMMA22,
> > +	DRM_TRANSFER_FUNCTION_GAMMA24,
> > +	DRM_TRANSFER_FUNCTION_GAMMA26,
> > +	DRM_TRANSFER_FUNCTION_MAX,
> > +};
> > +
> >  struct dm_plane_state {
> >  	struct drm_plane_state base;
> >  	struct dc_plane_state *dc_state;
> > @@ -726,6 +740,14 @@ struct dm_crtc_state {
> >  	struct dc_info_packet vrr_infopacket;
> > =20
> >  	int abm_level;
> > +
> > +        /**
> > +	 * @regamma_tf:
> > +	 *
> > +	 * Pre-defined transfer function for converting internal FB -> wire
> > +	 * encoding.
> > +	 */
> > +	enum drm_transfer_function regamma_tf;
>=20
> Again, let's avoid a drm_ prefix. Maybe name all this amdgpu_ instead.

Ack
>=20
> >  };
> > =20
> >  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index e3762e806617..1eb279d341c5 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crtc *=
crtc,
> >  	if (cur->stream)
> >  		dc_stream_release(cur->stream);
> > =20
> > -
>=20
> nit: stray newline

oh, random code cleanup.. I'll remove it in the next version >.< thanks!

>=20
> Harry
>=20
> >  	__drm_atomic_helper_crtc_destroy_state(state);
> > =20
> > =20
> > @@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_sta=
te(struct drm_crtc *crtc)
> >  	state->freesync_config =3D cur->freesync_config;
> >  	state->cm_has_degamma =3D cur->cm_has_degamma;
> >  	state->cm_is_degamma_srgb =3D cur->cm_is_degamma_srgb;
> > +	state->regamma_tf =3D cur->regamma_tf;
> >  	state->crc_skip_count =3D cur->crc_skip_count;
> >  	state->mpo_requested =3D cur->mpo_requested;
> >  	/* TODO Duplicate dc_stream after objects are stream object is flatte=
ned */
> > @@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct drm=
_crtc *crtc)
> >  }
> >  #endif
> > =20
> > +#ifdef AMD_PRIVATE_COLOR
> > +/**
> > + * drm_crtc_additional_color_mgmt - enable additional color properties
> > + * @crtc: DRM CRTC
> > + *
> > + * This function lets the driver enable the 3D LUT color correction pr=
operty
> > + * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The sha=
per
> > + * LUT and 3D LUT property is only attached if its size is not 0.
> > + */
> > +static void
> > +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
> > +{
> > +	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > +
> > +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
> > +		drm_object_attach_property(&crtc->base,
> > +					   adev->mode_info.regamma_tf_property,
> > +					   DRM_TRANSFER_FUNCTION_DEFAULT);
> > +}
> > +
> > +static int
> > +amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
> > +				   struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   uint64_t val)
> > +{
> > +	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > +	struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(state);
> > +
> > +	if (property =3D=3D adev->mode_info.regamma_tf_property) {
> > +		if (acrtc_state->regamma_tf !=3D val) {
> > +			acrtc_state->regamma_tf =3D val;
> > +			acrtc_state->base.color_mgmt_changed |=3D 1;
> > +		}
> > +	} else {
> > +		drm_dbg_atomic(crtc->dev,
> > +			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> > +			       crtc->base.id, crtc->name,
> > +			       property->base.id, property->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
> > +				   const struct drm_crtc_state *state,
> > +				   struct drm_property *property,
> > +				   uint64_t *val)
> > +{
> > +	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
> > +	struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(state);
> > +
> > +	if (property =3D=3D adev->mode_info.regamma_tf_property)
> > +		*val =3D acrtc_state->regamma_tf;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> >  /* Implemented only the options currently available for the driver */
> >  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
> >  	.reset =3D dm_crtc_reset_state,
> > @@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_=
funcs =3D {
> >  #if defined(CONFIG_DEBUG_FS)
> >  	.late_register =3D amdgpu_dm_crtc_late_register,
> >  #endif
> > +#ifdef AMD_PRIVATE_COLOR
> > +	.atomic_set_property =3D amdgpu_dm_atomic_crtc_set_property,
> > +	.atomic_get_property =3D amdgpu_dm_atomic_crtc_get_property,
> > +#endif
> >  };
> > =20
> >  static void dm_crtc_helper_disable(struct drm_crtc *crtc)
> > @@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manag=
er *dm,
> > =20
> >  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRI=
ES);
> > =20
> > +#ifdef AMD_PRIVATE_COLOR
> > +	dm_crtc_additional_color_mgmt(&acrtc->base);
> > +#endif
> >  	return 0;
> > =20
> >  fail:
>=20

--74xf24ocxx6gmbbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmR/aWQACgkQwqF3j0dL
ehz6Pw//afhDmHDRj431Zf8KAvMLiwIvs5MycD748tYWsfewXA0eCdc72/GuU0c7
KyxIhwSjPSC+uTMwfIoiujGgmL5Scor/w2g4P0gUFf0q0dTIw2lEzi5P6gLmlq9u
Q9yFFL+7/DtIkQB4jlIZo3/CPBHN+KYw5RAamy8KeNvGgmoc5A5dTjhtlidVxUFx
Mv2MdUf4GQxOlVJuBrzrmijw5wRCK7iHYBpmNfxfIM8hxj0LaSmK/KZhEr1sWb8s
49nOB4NOsIhnp7k0NW1t/Et4gVWMzmyzPUlzNVLCvcBU/ZLr8WDagic+IjG8fu3C
RgJMPlWiGrNAXvoTTQP02aMgTB3Leg4VPA/OiG3KjGPCAr1Jz4JUM8sYZxEcWRXd
mhagaaIaMEIz8lNXBWYBOvJWFACZNJ6vFcZQSfVafP9usMODs4dYm0Bttg63TH0u
RtDhpeg+hL/NKlt0FbTMusECOP0T72ATmzkzYEqMkKHR4BLBv3LtxqeD9dMS4UOo
PZxiGlpQgEkH+cSw8wT909lrbDJgTQAWaLAcu1HEbJJ5oyrTZ0xLMPhZXt6PZ3mC
6j3mueMIvG/WQAndAjx+WHy+EnZM5tOQvF/P7MUtT6Wn8qvtkoWAZvaXYHNcHovy
JXQIiRDXt2CtVHJzGR6B+SoarSFhZLde5x0FnEQKw4QXVyfLl5w=
=/2wz
-----END PGP SIGNATURE-----

--74xf24ocxx6gmbbw--
