Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48F6FCB50
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 18:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5210E16C;
	Tue,  9 May 2023 16:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB9810E16C;
 Tue,  9 May 2023 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mp8WHd6d928qQOX9CWPFdsX/EEp64P+t3Iil10Pcl6c=; b=lhE1jcKmi+tGn4NEm1qL0RAJTo
 hLSApWhbiw4lzSfV4luL+DHgrWuXP7n1zUqPxa2DzhvISYLzJo9VWA5ObpcfIVgy/4gOZkiiLeBYP
 nw9ObeBTfTJQp9xuvOXkfiCxyWR97/4DsWFluv37QvkXXuFf3Dy7C3OyJMzxnnZ5RErwzhS5Ea1rX
 /riXg6GXn8WlYvd76njep0r+ROaoPFoHTjIxH2zDb46lOEn7o7NJcvGOPTXZ4AVquOOijXctrp7tG
 VCOy7WycWlz+JYRi88CFmvFK6LufB1aCF2vtGibvJATcI6jdx5RHWkPAyxylis6Qs0zIwTIMF+PGG
 i6z0jadg==;
Received: from [38.44.72.37] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwQE7-0052WQ-Ub; Tue, 09 May 2023 18:30:12 +0200
Date: Tue, 9 May 2023 15:30:06 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 05/40] drm/amd/display: add shaper LUT driver-private
 props
Message-ID: <20230509163006.4gfxo6uzzdd7wakq@mail.igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-6-mwen@igalia.com>
 <40bcc490-4057-0d2b-466a-bd7ce11cfc74@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="luw2sap3czxitylx"
Content-Disposition: inline
In-Reply-To: <40bcc490-4057-0d2b-466a-bd7ce11cfc74@amd.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--luw2sap3czxitylx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/08, Harry Wentland wrote:
>=20
>=20
> On 4/23/23 10:10, Melissa Wen wrote:
> > CRTC shaper LUT shapes the content after blending, i.e., de-linearizes
> > or normalizes space before applying a 3D LUT color correction. In the
> > next patch, we add CRTC 3D LUT property to DRM color management after
> > this shaper LUT and before the current CRTC gamma LUT.
> >=20
>=20
> It might be good to describe the motivation behind the "de-linearization"
> of pixels. Since a 3DLUT has a limited number of entries in each dimension
> we want to use them in an optimal fashion. This means using the 3DLUT in
> a colorspace that is optimized for human vision, such as sRGB, PQ, or
> another non-linear space.

ack.

>=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  28 ++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  14 ++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  17 +++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 122 +++++++++++++++++-
> >  4 files changed, 179 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index 8632ab695a6c..44c22cb87dde 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -1247,6 +1247,30 @@ amdgpu_display_user_framebuffer_create(struct dr=
m_device *dev,
> >  	return &amdgpu_fb->base;
> >  }
> > =20
> > +#ifdef CONFIG_STEAM_DECK
>=20
> Something like AMD_PRIVATE_COLOR would be better.

Oh, I see your suggestion for my previous question here, so nvm.

>=20
> It might also be enough to guard only the bits that make the uAPI
> appear, such as drm_property_create, etc.

Makes sense. Joshie also suggested me this path.

Thanks!

>=20
> Harry
>=20
> > +static int
> > +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
> > +{
> > +	struct drm_property *prop;
> > +
> > +	prop =3D drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_SHAPER_LUT", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.shaper_lut_property =3D prop;
> > +
> > +	prop =3D drm_property_create_range(adev_to_drm(adev),
> > +					 DRM_MODE_PROP_IMMUTABLE,
> > +					 "AMD_SHAPER_LUT_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.shaper_lut_size_property =3D prop;
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> >  const struct drm_mode_config_funcs amdgpu_mode_funcs =3D {
> >  	.fb_create =3D amdgpu_display_user_framebuffer_create,
> >  };
> > @@ -1323,6 +1347,10 @@ int amdgpu_display_modeset_create_props(struct a=
mdgpu_device *adev)
> >  			return -ENOMEM;
> >  	}
> > =20
> > +#ifdef CONFIG_STEAM_DECK
> > +	if (amdgpu_display_create_color_properties(adev))
> > +		return -ENOMEM;
> > +#endif
> >  	return 0;
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index b8633df418d4..1fd3497af3b5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -344,6 +344,20 @@ struct amdgpu_mode_info {
> >  	int			disp_priority;
> >  	const struct amdgpu_display_funcs *funcs;
> >  	const enum drm_plane_type *plane_type;
> > +
> > +	/* Driver-private color mgmt props */
> > +#ifdef CONFIG_STEAM_DECK
> > +	/**
> > +	 * @shaper_lut_property: CRTC property to set post-blending shaper LUT
> > +	 * that converts content before 3D LUT gamma correction.
> > +	 */
> > +	struct drm_property *shaper_lut_property;
> > +	/**
> > +	 * @shaper_lut_size_property: CRTC property for the size of
> > +	 * post-blending shaper LUT as supported by the driver (read-only).
> > +	 */
> > +	struct drm_property *shaper_lut_size_property;
> > +#endif
> >  };
> > =20
> >  #define AMDGPU_MAX_BL_LEVEL 0xFF
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index 2e2413fd73a4..de63455896cc 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -726,6 +726,23 @@ struct dm_crtc_state {
> >  	struct dc_info_packet vrr_infopacket;
> > =20
> >  	int abm_level;
> > +
> > +#ifdef CONFIG_STEAM_DECK
> > +	/* AMD driver-private color mgmt pipeline
> > +	 *
> > +	 * DRM provides CRTC degamma/ctm/gamma color mgmt features, but AMD HW
> > +	 * has a larger set of post-blending color calibration features, as
> > +	 * below:
> > +	 */
> > +	/**
> > +	 * @shaper_lut:
> > +	 *
> > +	 * Lookup table used to de-linearize pixel data for gamma correction.
> > +	 * See drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an arr=
ay
> > +	 * of &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *shaper_lut;
> > +#endif
> >  };
> > =20
> >  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index e3762e806617..503433e5cb38 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -229,7 +229,9 @@ static void dm_crtc_destroy_state(struct drm_crtc *=
crtc,
> >  	if (cur->stream)
> >  		dc_stream_release(cur->stream);
> > =20
> > -
> > +#ifdef CONFIG_STEAM_DECK
> > +	drm_property_blob_put(cur->shaper_lut);
> > +#endif
> >  	__drm_atomic_helper_crtc_destroy_state(state);
> > =20
> > =20
> > @@ -266,7 +268,12 @@ static struct drm_crtc_state *dm_crtc_duplicate_st=
ate(struct drm_crtc *crtc)
> >  	state->crc_skip_count =3D cur->crc_skip_count;
> >  	state->mpo_requested =3D cur->mpo_requested;
> >  	/* TODO Duplicate dc_stream after objects are stream object is flatte=
ned */
> > +#ifdef CONFIG_STEAM_DECK
> > +	state->shaper_lut =3D cur->shaper_lut;
> > =20
> > +	if (state->shaper_lut)
> > +		drm_property_blob_get(state->shaper_lut);
> > +#endif
> >  	return &state->base;
> >  }
> > =20
> > @@ -299,6 +306,111 @@ static int amdgpu_dm_crtc_late_register(struct dr=
m_crtc *crtc)
> >  }
> >  #endif
> > =20
> > +#ifdef CONFIG_STEAM_DECK
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
> > +	if (adev->dm.dc->caps.color.mpc.num_3dluts) {
> > +		drm_object_attach_property(&crtc->base,
> > +					   adev->mode_info.shaper_lut_property, 0);
> > +		drm_object_attach_property(&crtc->base,
> > +					   adev->mode_info.shaper_lut_size_property,
> > +					   MAX_COLOR_LUT_ENTRIES);
> > +	}
> > +}
> > +
> > +static int
> > +atomic_replace_property_blob_from_id(struct drm_device *dev,
> > +					 struct drm_property_blob **blob,
> > +					 uint64_t blob_id,
> > +					 ssize_t expected_size,
> > +					 ssize_t expected_elem_size,
> > +					 bool *replaced)
> > +{
> > +	struct drm_property_blob *new_blob =3D NULL;
> > +
> > +	if (blob_id !=3D 0) {
> > +		new_blob =3D drm_property_lookup_blob(dev, blob_id);
> > +		if (new_blob =3D=3D NULL)
> > +			return -EINVAL;
> > +
> > +		if (expected_size > 0 &&
> > +		    new_blob->length !=3D expected_size) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +		if (expected_elem_size > 0 &&
> > +		    new_blob->length % expected_elem_size !=3D 0) {
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	*replaced |=3D drm_property_replace_blob(blob, new_blob);
> > +	drm_property_blob_put(new_blob);
> > +
> > +	return 0;
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
> > +	bool replaced =3D false;
> > +	int ret;
> > +
> > +	if (property =3D=3D adev->mode_info.shaper_lut_property) {
> > +		ret =3D atomic_replace_property_blob_from_id(crtc->dev,
> > +					&acrtc_state->shaper_lut,
> > +					val,
> > +					-1, sizeof(struct drm_color_lut),
> > +					&replaced);
> > +		acrtc_state->base.color_mgmt_changed |=3D replaced;
> > +		return ret;
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
> > +	if (property =3D=3D adev->mode_info.shaper_lut_property)
> > +		*val =3D (acrtc_state->shaper_lut) ?
> > +			acrtc_state->shaper_lut->base.id : 0;
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
> > @@ -317,6 +429,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_=
funcs =3D {
> >  #if defined(CONFIG_DEBUG_FS)
> >  	.late_register =3D amdgpu_dm_crtc_late_register,
> >  #endif
> > +#ifdef CONFIG_STEAM_DECK
> > +	.atomic_set_property =3D amdgpu_dm_atomic_crtc_set_property,
> > +	.atomic_get_property =3D amdgpu_dm_atomic_crtc_get_property,
> > +#endif
> >  };
> > =20
> >  static void dm_crtc_helper_disable(struct drm_crtc *crtc)
> > @@ -477,9 +593,11 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_mana=
ger *dm,
> >  	is_dcn =3D dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> >  	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRI=
ES : 0,
> >  				   true, MAX_COLOR_LUT_ENTRIES);
> > -
> >  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRI=
ES);
> > =20
> > +#ifdef CONFIG_STEAM_DECK
> > +	dm_crtc_additional_color_mgmt(&acrtc->base);
> > +#endif
> >  	return 0;
> > =20
> >  fail:
>=20
>=20

--luw2sap3czxitylx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmRadQ4ACgkQwqF3j0dL
ehwXARAAjVDA2r1zAhLiIj7fE5c2XhzXFA62FBCGrYDh7xQP35EEIwhHkDtZqQrR
roSLlR+M6rnvK163/FdX0gdKPPT4PTk/cv7jPD/dET/51+fQDTOW/kvpiFv814pL
qXsKcNIY+H4rEz2ovbxN2mZqRbdHZ6dukmo5+nKif3bXs7yhfiQLJCxmdrUF6ufr
8RSXxnAk6rRG12J1O+FDyGCFNCXScVidhhja6+bPVbLV8+R6R1Fm8ujqLMPYNFcC
ChtqrKHjORP07mZ/sXnNmFo6OwaN2gUSUSU87l3q0V8dfM1KI/b83PPXAdlkBhO2
WqaUvtX9KN1+HsiSB5R0hpzoMdYnl2kR4ygqwbkZWJ1QZzGC6+My2pNUG8p42n4z
2pxP7n5guD2s45mXXyVE+0zKJcpakx7seYy0Y3CefHlP840+mlP2ELRH7msW6kdB
YBKaOtDZivAsfVpXKZm9eVr9DTmEEhw5UCZR82dGCL0voXyZq/V4gWhRkgNn6LNO
J5qSlYRt3dZLW8gMlnsv40hWX9qNQSRsFdTllqN0waAuTUwMAF4CZupytnzTogRV
B2rvi9R1ZSXqGI1lxmqSNg9A6jBgZ39ETbYSgVFdxe6K4l5bZKgZVtDZ65IPpV89
WEFlk/J8AoYP2gc6W42M5Q3xH8TsOLSDq1Rpd68a9PHGAPoGNL0=
=7QSL
-----END PGP SIGNATURE-----

--luw2sap3czxitylx--
