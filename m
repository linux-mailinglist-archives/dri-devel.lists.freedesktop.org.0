Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5227249EF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1809510E39D;
	Tue,  6 Jun 2023 17:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4292910E393;
 Tue,  6 Jun 2023 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rOMfYn1yzLIrgXyrlJNj6N4rT+9nDeEh96LUHLrnKkg=; b=T1OrGtA8Xsp3vfPqaYPn7jeyIq
 O45vaVv684v0+Nj7Jlzj6LDW3eiPxntgQNfpfyVYt1S+vu1qISFPEjbWt2XAB6YpQEmIE9BgBO6sU
 X6ju/D5SMZ/zS2r+hNkHRv5YxcLCskSyzqimfrTM6p7Jmf50VW+MJ+qUO3NeJcMPdoFDEvAMzn2+p
 auAEKl+WuuUE6+2wZuYmk1+gKEjyMk13uXPYfBGlrCZvLv9rZH32vJB3M4Sy7HaZK9rOn/SqR//9z
 5Wd2S974BEmOeZidpiC9YZu/K0k8iOgTN/r09VfkeeQm1YQoUbkk9HARoqY9BzPVYft8H+kRYj4B9
 Tvyr+cFg==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1q6aH8-009cI7-0j; Tue, 06 Jun 2023 19:15:18 +0200
Date: Tue, 6 Jun 2023 16:15:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 07/36] drm/amd/display: add plane driver-specific
 properties for degamma LUT
Message-ID: <20230606171513.6u3vhfnpri7pduqz@mail.igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-8-mwen@igalia.com>
 <717f0e53-4e38-7ffe-3ea7-84d4bb6c284e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3cmnfypjsp2gb3p2"
Content-Disposition: inline
In-Reply-To: <717f0e53-4e38-7ffe-3ea7-84d4bb6c284e@amd.com>
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


--3cmnfypjsp2gb3p2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/01, Harry Wentland wrote:
>=20
>=20
> On 5/23/23 18:14, Melissa Wen wrote:
> > Create and attach driver-private properties for plane color management.
> > First add plane degamma LUT properties that means user-blob and its
> > size. We will add more plane color properties in the next commits. In
> > addition, we keep these driver-private plane properties limited by
> > defining AMD_PRIVATE_COLOR.
> >=20
> > Co-developed-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 14 ++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 ++
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++
> >  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 77 +++++++++++++++++++
> >  4 files changed, 108 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index 88af075e6c18..fa67c84f5994 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -1275,6 +1275,20 @@ amdgpu_display_create_color_properties(struct am=
dgpu_device *adev)
> >  		return -ENOMEM;
> >  	adev->mode_info.regamma_tf_property =3D prop;
> > =20
> > +	prop =3D drm_property_create(adev_to_drm(adev),
> > +				   DRM_MODE_PROP_BLOB,
> > +				   "AMD_PLANE_DEGAMMA_LUT", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_degamma_lut_property =3D prop;
> > +
> > +	prop =3D drm_property_create_range(adev_to_drm(adev),
> > +					 DRM_MODE_PROP_IMMUTABLE,
> > +					 "AMD_PLANE_DEGAMMA_LUT_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	adev->mode_info.plane_degamma_lut_size_property =3D prop;
> > +
>=20
> Same as with previous patch and the following ones... Would be
> great to have this sit in amdgpu_dm_color.c.

Ack

>=20
> Harry
>=20
> >  	return 0;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_mode.h
> > index 881446c51b36..6c165ad9bdf0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> > @@ -352,6 +352,14 @@ struct amdgpu_mode_info {
> >  	 * drm_transfer_function`.
> >  	 */
> >  	struct drm_property *regamma_tf_property;
> > +	/* @plane_degamma_lut_property: Plane property to set a degamma LUT to
> > +	 * convert color space before blending.
> > +	 */
> > +	struct drm_property *plane_degamma_lut_property;
> > +	/* @plane_degamma_lut_size_property: Plane property to define the max
> > +	 * size of degamma LUT as supported by the driver (read-only).
> > +	 */
> > +	struct drm_property *plane_degamma_lut_size_property;
> >  };
> > =20
> >  #define AMDGPU_MAX_BL_LEVEL 0xFF
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > index ad5ee28b83dc..22e126654767 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> > @@ -716,6 +716,15 @@ enum drm_transfer_function {
> >  struct dm_plane_state {
> >  	struct drm_plane_state base;
> >  	struct dc_plane_state *dc_state;
> > +
> > +	/* Plane color mgmt */
> > +	/**
> > +	 * @degamma_lut:
> > +	 *
> > +	 * LUT for converting plane pixel data before going into plane merger.
> > +	 * The blob (if not NULL) is an array of &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *degamma_lut;
> >  };
> > =20
> >  struct dm_crtc_state {
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 322668973747..e9cedc4068f1 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1338,6 +1338,9 @@ dm_drm_plane_duplicate_state(struct drm_plane *pl=
ane)
> >  		dc_plane_state_retain(dm_plane_state->dc_state);
> >  	}
> > =20
> > +	if (dm_plane_state->degamma_lut)
> > +		drm_property_blob_get(dm_plane_state->degamma_lut);
> > +
> >  	return &dm_plane_state->base;
> >  }
> > =20
> > @@ -1405,12 +1408,79 @@ static void dm_drm_plane_destroy_state(struct d=
rm_plane *plane,
> >  {
> >  	struct dm_plane_state *dm_plane_state =3D to_dm_plane_state(state);
> > =20
> > +	if (dm_plane_state->degamma_lut)
> > +		drm_property_blob_put(dm_plane_state->degamma_lut);
> > +
> >  	if (dm_plane_state->dc_state)
> >  		dc_plane_state_release(dm_plane_state->dc_state);
> > =20
> >  	drm_atomic_helper_plane_destroy_state(plane, state);
> >  }
> > =20
> > +#ifdef AMD_PRIVATE_COLOR
> > +static void
> > +dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_man=
ager *dm,
> > +					     struct drm_plane *plane)
> > +{
> > +	if (dm->dc->caps.color.dpp.dgam_ram || dm->dc->caps.color.dpp.gamma_c=
orr ) {
> > +		drm_object_attach_property(&plane->base,
> > +					   dm->adev->mode_info.plane_degamma_lut_property, 0);
> > +		drm_object_attach_property(&plane->base,
> > +					   dm->adev->mode_info.plane_degamma_lut_size_property,
> > +					   MAX_COLOR_LUT_ENTRIES);
> > +	}
> > +}
> > +
> > +static int
> > +dm_atomic_plane_set_property(struct drm_plane *plane,
> > +			     struct drm_plane_state *state,
> > +			     struct drm_property *property,
> > +			     uint64_t val)
> > +{
> > +	struct dm_plane_state *dm_plane_state =3D to_dm_plane_state(state);
> > +	struct amdgpu_device *adev =3D drm_to_adev(plane->dev);
> > +	bool replaced =3D false;
> > +	int ret;
> > +
> > +	if (property =3D=3D adev->mode_info.plane_degamma_lut_property) {
> > +		ret =3D drm_property_replace_blob_from_id(plane->dev,
> > +							&dm_plane_state->degamma_lut,
> > +							val,
> > +							-1, sizeof(struct drm_color_lut),
> > +							&replaced);
> > +		dm_plane_state->base.color_mgmt_changed |=3D replaced;
> > +		return ret;
> > +	} else {
> > +		drm_dbg_atomic(plane->dev,
> > +			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> > +			       plane->base.id, plane->name,
> > +			       property->base.id, property->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +dm_atomic_plane_get_property(struct drm_plane *plane,
> > +			     const struct drm_plane_state *state,
> > +			     struct drm_property *property,
> > +			     uint64_t *val)
> > +{
> > +	struct dm_plane_state *dm_plane_state =3D to_dm_plane_state(state);
> > +	struct amdgpu_device *adev =3D drm_to_adev(plane->dev);
> > +
> > +	if (property =3D=3D adev->mode_info.plane_degamma_lut_property) {
> > +		*val =3D (dm_plane_state->degamma_lut) ?
> > +			dm_plane_state->degamma_lut->base.id : 0;
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> >  static const struct drm_plane_funcs dm_plane_funcs =3D {
> >  	.update_plane	=3D drm_atomic_helper_update_plane,
> >  	.disable_plane	=3D drm_atomic_helper_disable_plane,
> > @@ -1419,6 +1489,10 @@ static const struct drm_plane_funcs dm_plane_fun=
cs =3D {
> >  	.atomic_duplicate_state =3D dm_drm_plane_duplicate_state,
> >  	.atomic_destroy_state =3D dm_drm_plane_destroy_state,
> >  	.format_mod_supported =3D dm_plane_format_mod_supported,
> > +#ifdef AMD_PRIVATE_COLOR
> > +	.atomic_set_property =3D dm_atomic_plane_set_property,
> > +	.atomic_get_property =3D dm_atomic_plane_get_property,
> > +#endif
> >  };
> > =20
> >  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
> > @@ -1489,6 +1563,9 @@ int amdgpu_dm_plane_init(struct amdgpu_display_ma=
nager *dm,
> > =20
> >  	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
> > =20
> > +#ifdef AMD_PRIVATE_COLOR
> > +	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
> > +#endif
> >  	/* Create (reset) the plane state */
> >  	if (plane->funcs->reset)
> >  		plane->funcs->reset(plane);
>=20

--3cmnfypjsp2gb3p2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmR/aaEACgkQwqF3j0dL
ehw05A/+OAbpSmKapjIjWNs243a7Jjr2rA2Ya/qgC6Gh5UNeWUEyx8qEvynDaGv9
FhLoks7ZcJVKyvTVveLlvA5bOh++e8dUVrFTrENbYSLgX1/rjBPfqLJrC5fNaCtv
GOlICpw5AGU4wUFJ9HJFQzEjKTkaTTrymDdswXHbSbQLGf4It9u6o1CF+IlP98A+
U6yn8TFIgvh14lDOGAUEtnOxaPogSYGFnX57fjGMOG29xACIGaJSJQcGXtXC/0/p
gvBT14aJI0IzNtWffnniqgvzDk+oAg0AWKbTgPUrY8Pd+8nWwJUlkSGWjkIVlW+Z
D/1aAypzj5CiCFLtR9rdlPyt5kUtkPSffw1yce0qHJs97eRQja15VdLbkqfdFHN/
NxGYGmAGJhiGVFelGGXwtaNPt7TzhYkYBwp2letqrlNP5q/PyYhpIBMuIGQZizz9
YcLKan1JGYk3eiq6522+aEuruKbf3vbSerQIey95iYbLFxHtRvw2aqpPaZkYkxA3
ruyJYw6mKgHeZ/MtkC2Nwf8iucFXfvxb/rNMoptCiUdwBi+/VS0Hw7ARASbrn6Nl
42S5hVFF1EUrsDBvBO8jnpCywvLbdiV///sQ+q2uNjgINXbkViMFLReS/Ly9hnw7
eh95+3JicY3qPZKfF/mmcaXYurtxtW2vhooCeXKWz0MdyXtrJgE=
=eRZ7
-----END PGP SIGNATURE-----

--3cmnfypjsp2gb3p2--
