Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E171C571DAB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 17:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E5394E34;
	Tue, 12 Jul 2022 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234794E31;
 Tue, 12 Jul 2022 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sUdzXIOb5QTJp7oJJOeQgMHDT6aqk8oDRmcip7FgZmo=; b=KeO4FmoGc6b6RNJXUVqPjqLVig
 fkS24TjL1QlNqwdzEDp4U6X9s4QSAKOCQn0rCCMqjCkkGLfeiKMIT4P1p/qjgxFzANkEGTx7ZexNH
 ma0vuAtqmNn2xtMK/osaxOG6jyHWhLb3wpwn3+I+ztUPf3HNSL/DcQnpuamqtQDU99LEwR8L2iv1q
 ZKhbFK1rxd8wR3puwjWL5DWL0yeYoEJCEKtgqFwU16rZkLq777/iyDyFvxuSY28oBEPxhNxBucFE/
 uUAEcKgQSJOWMYDblgRtP93hOKWK9GgX2fN7rvYnER621T25q7Pgx7jtTmLiCYEabTnqP9HsZefHO
 1Mo0lLdg==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oBHOO-00DgEU-OT; Tue, 12 Jul 2022 17:01:40 +0200
Date: Tue, 12 Jul 2022 14:01:26 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Message-ID: <20220712150109.nv7kzh2hykxfd3qq@mail.igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com>
 <1266f666-1f58-a099-0d80-0826e1b69802@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hwrsfhlkkuchwrg6"
Content-Disposition: inline
In-Reply-To: <1266f666-1f58-a099-0d80-0826e1b69802@amd.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, nikola.cornij@amd.com,
 bhawanpreet.lakha@amd.com, sunpeng.li@amd.com, alex.hung@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 seanpaul@chromium.org, nicholas.kazlauskas@amd.com, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hwrsfhlkkuchwrg6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/28, Harry Wentland wrote:
>=20
>=20
> On 6/19/22 18:31, Melissa Wen wrote:
> > Add 3D LUT for gammar correction using a 3D lookup table.  The position
> > in the color correction pipeline where 3D LUT is applied depends on hw
> > design, being after CTM or gamma. If just after CTM, a shaper lut must
> > be set to shape the content for a non-linear space. That details should
> > be handled by the driver according to its color capabilities.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_state_helper.c |  3 ++
> >  drivers/gpu/drm/drm_atomic_uapi.c         | 14 +++++-
> >  drivers/gpu/drm/drm_color_mgmt.c          | 58 +++++++++++++++++++++++
> >  drivers/gpu/drm/drm_fb_helper.c           |  2 +
> >  drivers/gpu/drm/drm_mode_config.c         | 14 ++++++
> >  include/drm/drm_color_mgmt.h              |  4 ++
> >  include/drm/drm_crtc.h                    | 12 ++++-
> >  include/drm/drm_mode_config.h             | 13 +++++
> >  8 files changed, 117 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index cf0545bb6e00..64800bc41365 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -141,6 +141,8 @@ void __drm_atomic_helper_crtc_duplicate_state(struc=
t drm_crtc *crtc,
> >  		drm_property_blob_get(state->ctm);
> >  	if (state->shaper_lut)
> >  		drm_property_blob_get(state->shaper_lut);
> > +	if (state->lut3d)
> > +		drm_property_blob_get(state->lut3d);
> >  	if (state->gamma_lut)
> >  		drm_property_blob_get(state->gamma_lut);
> > =20
> > @@ -216,6 +218,7 @@ void __drm_atomic_helper_crtc_destroy_state(struct =
drm_crtc_state *state)
> >  	drm_property_blob_put(state->degamma_lut);
> >  	drm_property_blob_put(state->ctm);
> >  	drm_property_blob_put(state->shaper_lut);
> > +	drm_property_blob_put(state->lut3d);
> >  	drm_property_blob_put(state->gamma_lut);
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_destroy_state);
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index 6468f2a080bc..1896c0422f73 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -472,6 +472,14 @@ static int drm_atomic_crtc_set_property(struct drm=
_crtc *crtc,
> >  					&replaced);
> >  		state->color_mgmt_changed |=3D replaced;
> >  		return ret;
> > +	} else if (property =3D=3D config->lut3d_property) {
> > +		ret =3D drm_atomic_replace_property_blob_from_id(dev,
> > +					&state->lut3d,
> > +					val,
> > +					-1, sizeof(struct drm_color_lut),
> > +					&replaced);
> > +		state->color_mgmt_changed |=3D replaced;
> > +		return ret;
> >  	} else if (property =3D=3D config->gamma_lut_property) {
> >  		ret =3D drm_atomic_replace_property_blob_from_id(dev,
> >  					&state->gamma_lut,
> > @@ -523,10 +531,12 @@ drm_atomic_crtc_get_property(struct drm_crtc *crt=
c,
> >  		*val =3D (state->degamma_lut) ? state->degamma_lut->base.id : 0;
> >  	else if (property =3D=3D config->ctm_property)
> >  		*val =3D (state->ctm) ? state->ctm->base.id : 0;
> > -	else if (property =3D=3D config->gamma_lut_property)
> > -		*val =3D (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> >  	else if (property =3D=3D config->shaper_lut_property)
> >  		*val =3D (state->shaper_lut) ? state->shaper_lut->base.id : 0;
> > +	else if (property =3D=3D config->lut3d_property)
> > +		*val =3D (state->lut3d) ? state->lut3d->base.id : 0;
> > +	else if (property =3D=3D config->gamma_lut_property)
> > +		*val =3D (state->gamma_lut) ? state->gamma_lut->base.id : 0;
> >  	else if (property =3D=3D config->prop_out_fence_ptr)
> >  		*val =3D 0;
> >  	else if (property =3D=3D crtc->scaling_filter_property)
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_col=
or_mgmt.c
> > index 4f57dc60fe03..696fe1e37801 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -87,6 +87,25 @@
> >   *	publish the largest size, and sub-sample smaller sized LUTs
> >   *	appropriately.
> >   *
> > + * =E2=80=9CLUT3D=E2=80=9D:
> > + *	Blob property to set the 3D LUT mapping pixel data after the color
> > + *	transformation matrix and before gamma 1D lut correction. The
> > + *	data is interpreted as an array of &struct drm_color_lut elements.
> > + *	Hardware might choose not to use the full precision of the LUT
> > + *	elements.
> > + *
> > + *	Setting this to NULL (blob property value set to 0) means a the out=
put
> > + *	color is identical to the input color. This is generally the driver
> > + *	boot-up state too. Drivers can access this blob through
> > + *	&drm_crtc_state.gamma_lut.
> > + *
> > + * =E2=80=9CLUT3D_SIZE=E2=80=9D:
> > + *	Unsigned range property to give the size of the 3D lookup table to =
be
> > + *	set on the LUT3D property (the size depends on the underlying
> > + *	hardware). If drivers support multiple LUT sizes then they should
> > + *	publish the largest size, and sub-sample smaller sized LUTs
> > + *	appropriately.
> > + *
> >   * =E2=80=9CGAMMA_LUT=E2=80=9D:
> >   *	Blob property to set the gamma lookup table (LUT) mapping pixel data
> >   *	after the transformation matrix to data sent to the connector. The
> > @@ -204,6 +223,45 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *c=
rtc,
> >  }
> >  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
> > =20
> > +/**
> > + * drm_crtc_enable_lut3d - enable 3D LUT properties
> > + * @crtc: DRM CRTC
> > + * @shaper_lut_size: the size of shaper lut
> > + * @lut3d_size: the size of 3D lut
> > + *
> > + * This function lets the driver enable the 3D LUT color correction pr=
operty
> > + * on a CRTC. This includes 3D LUT and also a shaper LUT, if set. The =
shaper
> > + * LUT property is only attached if its size is not 0 and 3D LUT is se=
t, being
> > + * therefore optional.
> > + */
> > +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> > +			   uint shaper_lut_size,
> > +			   uint lut3d_size)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_mode_config *config =3D &dev->mode_config;
> > +
> > +	if (!lut3d_size)
> > +		return;
> > +
> > +	drm_object_attach_property(&crtc->base,
> > +				   config->lut3d_property, 0);
> > +	drm_object_attach_property(&crtc->base,
> > +				   config->lut3d_size_property,
> > +				   lut3d_size);
> > +	if (!shaper_lut_size)
> > +		return;
> > +
> > +	drm_object_attach_property(&crtc->base,
> > +				   config->shaper_lut_property, 0);
> > +	drm_object_attach_property(&crtc->base,
> > +				   config->shaper_lut_size_property,
> > +				   lut3d_size);
> > +
> > +}
> > +EXPORT_SYMBOL(drm_crtc_enable_lut3d);
> > +
> > +
> >  /**
> >   * drm_mode_crtc_set_gamma_size - set the gamma table size
> >   * @crtc: CRTC to set the gamma table size for
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index bdd33817d968..358c528c7c80 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1069,6 +1069,8 @@ static int setcmap_atomic(struct fb_cmap *cmap, s=
truct fb_info *info)
> >  		replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
> >  		replaced |=3D drm_property_replace_blob(&crtc_state->shaper_lut,
> >  						      NULL);
> > +		replaced |=3D drm_property_replace_blob(&crtc_state->lut3d,
> > +						      NULL);
> >  		replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut,
> >  						      gamma_lut);
> > =20
> > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mo=
de_config.c
> > index 4ba2a95b88e8..5458a7dfbe63 100644
> > --- a/drivers/gpu/drm/drm_mode_config.c
> > +++ b/drivers/gpu/drm/drm_mode_config.c
> > @@ -364,6 +364,20 @@ static int drm_mode_create_standard_properties(str=
uct drm_device *dev)
> >  		return -ENOMEM;
> >  	dev->mode_config.shaper_lut_size_property =3D prop;
> > =20
> > +	prop =3D drm_property_create(dev,
> > +			DRM_MODE_PROP_BLOB,
> > +			"LUT3D", 0);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.lut3d_property =3D prop;
> > +
> > +	prop =3D drm_property_create_range(dev,
> > +			DRM_MODE_PROP_IMMUTABLE,
> > +			"LUT3D_SIZE", 0, UINT_MAX);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +	dev->mode_config.lut3d_size_property =3D prop;
> > +
> >  	prop =3D drm_property_create(dev,
> >  			DRM_MODE_PROP_BLOB,
> >  			"GAMMA_LUT", 0);
> > diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> > index 81c298488b0c..a4f054e0108f 100644
> > --- a/include/drm/drm_color_mgmt.h
> > +++ b/include/drm/drm_color_mgmt.h
> > @@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crt=
c,
> >  				bool has_ctm,
> >  				uint gamma_lut_size);
> > =20
> > +void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
> > +			   uint shaper_lut_size,
> > +			   uint lut3d_size);
> > +
> >  int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
> >  				 int gamma_size);
> > =20
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index a318d5feb44b..c22ffcc4d7aa 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -165,7 +165,7 @@ struct drm_crtc_state {
> >  	bool zpos_changed : 1;
> >  	/**
> >  	 * @color_mgmt_changed: Color management properties have changed
> > -	 * (@shaper_lut, @gamma_lut, @degamma_lut or @ctm). Used by
> > +	 * (@shaper_lut, @lut3d, @gamma_lut, @degamma_lut or @ctm). Used by
> >  	 * the atomic helpers and drivers to steer the atomic commit control
> >  	 * flow.
> >  	 */
> > @@ -298,6 +298,16 @@ struct drm_crtc_state {
> >  	 */
> >  	struct drm_property_blob *shaper_lut;
> > =20
> > +	/**
> > +	 * @lut3d:
> > +	 *
> > +	 * 3D Lookup table for converting pixel data. Position where it takes
> > +	 * place depends on hw design, after @ctm or @gamma_lut. See
> > +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
> > +	 * &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *lut3d;
> > +
> >  	/**
> >  	 * @target_vblank:
> >  	 *
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_confi=
g.h
> > index 2df7e171add9..87280694e70d 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -812,6 +812,19 @@ struct drm_mode_config {
> >  	 */
> >  	struct drm_property *shaper_lut_size_property;
> > =20
> > +	/**
> > +	 * @lut3d_property: Optional CRTC property to set the 3D LUT used to
> > +	 * convert colors; before or after gamma conversion depends on hw
> > +	 * design. A shaper LUT can be used to delinearize content before app=
ly
> > +	 * 3D LUT correction.
> > +	 */
> > +	struct drm_property *lut3d_property;
> > +	/**
> > +	 * @lut3d_size_property: Optional CRTC property for the size of the
> > +	 * 3D LUT as supported by the driver (read-only).
> > +	 */
> > +	struct drm_property *lut3d_size_property;
>=20
> I wonder if we need caps to describe more than the size of the 3DLUT,
> i.e. something like what vaapi does:
>=20
> https://intel.github.io/libva/structVAProcFilterCap3DLUT.html

Makes sense. I'll keep it in mind when working on a next version.

Thanks,

Melissa
>=20
> Harry
>=20
> > +
> >  	/**
> >  	 * @gamma_lut_property: Optional CRTC property to set the LUT used to
> >  	 * convert the colors, after the CTM matrix, to the gamma space of the

--hwrsfhlkkuchwrg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLNjMYACgkQwqF3j0dL
ehyKOg/9FKz7lqv2mkqcpVtooB94z3C3nFr51TEna6/CAlmFN7bW/+QhhLx/sLQR
FKcK9Z/HGRCdGWVlIDUokXHMSMLAd2jy7UvcdbhLvgaqcoSVx9iAc5nQWz42kyry
o83fz9/+4+uUUuBTEoit8bcWzLIMQM3Jf/1IW3KVGNBJ9tOn3y6koyj7p5vehbkS
FiHbZJS9YBqdZryuNbhoeSYJPBkSnqVNC+BguGI2AOVq3BV6QjGzoZ7Ma5n/7g7W
YeK4hSuF0/MyyLWPaO6hXlNbJwFOq/fT3YU0nAqL39qrSeSC8eHH+dWdXLdkriJJ
DuGrURzve2NQG7OW3QHBgw2IMoR6Yd+uVWPEgjxDK1Sog5XKRe9bCT8YjUcUBS5R
qu/w9I6yzhAwjS/5KYf1UYC3cHReNr+RAXrSO2fXlCaAHITTP6QkBgOzwAhqFtZu
p6xxTOatFW1Yz6lYU9JtN5mYFHdq3Ep6clpcojYN/dU5+dn0u4fBjamY96635UJk
Sjo/bR/BYWKvYCygJkM1OyPVJQHQiAjoObRq/zhulExybFvUo03vu0spmIBJU0i+
F8oqPj5E6eTE/cKTgpEhzKMj3w9hCB2r9LQ/NwEuzE64SbUGIBE1WJzS8OfkkHmR
SuLDwo+aa+FHfKxgT5uBzm/llPpxR9ir2hhg55ack7oorYPcPe8=
=eXVk
-----END PGP SIGNATURE-----

--hwrsfhlkkuchwrg6--
