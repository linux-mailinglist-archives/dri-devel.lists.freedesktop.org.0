Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CE743716
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 10:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391710E21F;
	Fri, 30 Jun 2023 08:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10C610E1AD;
 Fri, 30 Jun 2023 08:27:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso2559327e87.3; 
 Fri, 30 Jun 2023 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688113624; x=1690705624;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0XbcdTiPrb21JlOewjXLO2DttF7WpWx1HgGldFwOllE=;
 b=PZVb+GOx1xsPHUAy2J2FiRRk34vkRad1pddwMcwuoe42cnrlXO7heFlx9trOKqfoiJ
 q/ZhFzg8+XgQ7d3Fvyd8fC48vKcmpP0h52ccaD1yDmaNFPotoHM/aowooog075z27wCs
 mpUCzinS/6rBnya+BnPET7/QdmH9vz8RXzfICJeR3WoD6kj3Xi63uUX80qyHRgfN4vG6
 S9lAEd7tMSPqalQWu2U1wvEFRtF2l4htFvGdatVuDrur9N1fNSR0jSspBQkUNhbE/i5z
 /NLwEEwnxWFc3PXlOfPshY3tFtDyMVHQTATwyQdv5Kz38G8XOfzFTLLhXNsIYlcNCqdw
 HmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688113624; x=1690705624;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0XbcdTiPrb21JlOewjXLO2DttF7WpWx1HgGldFwOllE=;
 b=RvOGtoOpl+gpw0LTATx3kHy8ZTIPkcEWyN+8gozpgchyfms+K4s+VhalYTtHsMXjkq
 VEKhoMUXdu0idI5WMROiYDW0KgsOoYWTHhm1sWRXC8AmcIw8gwnLp32Y2jY1dT9UYhvD
 iAU5esYrX5RVOymhrKMSugfi9wb0QHWpSEM+n2MWAbf4+HFIR/wlI9dafDUZyzB8eHih
 QpF6TzXZJFgHENDndoOCghgLzNlZZtI2/CW8PBtbTQkohkJAiWiflf1HTNeDQfxXQnBj
 sl4sa6efCXQqopFj9Q2DkCn7Nbnyy/hQIhnR6NLF9/uVdsK/tdEF8BvNZb5NL6GWxyoB
 ISQg==
X-Gm-Message-State: ABy/qLaP28WtJlrORCN6fAJ6QXxi7+NDyMgwJNCn5J268xzvv9eQt3Vp
 vyWe/Ksvk6HGiy/Nhz7Ln74=
X-Google-Smtp-Source: APBJJlG7ZYyAHnzk8uupnhJuzKGbXcb2MP81PBa5XH5J3DmNUoQAYluCCMkvCf2UqHrRkfV6DnTJ/g==
X-Received: by 2002:a05:6512:693:b0:4f8:7513:8cb0 with SMTP id
 t19-20020a056512069300b004f875138cb0mr1813919lfe.2.1688113624412; 
 Fri, 30 Jun 2023 01:27:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w14-20020ac2598e000000b004fb7d1149e1sm1567131lfn.290.2023.06.30.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 01:27:04 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH RFC v4 1/7] drm: Introduce solid fill DRM plane property
Message-ID: <20230630112700.53d79343@eldfell>
In-Reply-To: <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gk+kjtdh1d943WG7QpLclJT";
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gk+kjtdh1d943WG7QpLclJT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jun 2023 17:25:00 -0700
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>=20
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>=20
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;
> };
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Hi Jessica,

I've left some general UAPI related comments here.

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>  5 files changed, 141 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 784e63d70a42..fe14be2bd2b2 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -253,6 +253,11 @@ void __drm_atomic_helper_plane_state_reset(struct dr=
m_plane_state *plane_state,
>  	plane_state->alpha =3D DRM_BLEND_ALPHA_OPAQUE;
>  	plane_state->pixel_blend_mode =3D DRM_MODE_BLEND_PREMULTI;
> =20
> +	if (plane_state->solid_fill_blob) {
> +		drm_property_blob_put(plane_state->solid_fill_blob);
> +		plane_state->solid_fill_blob =3D NULL;
> +	}
> +
>  	if (plane->color_encoding_property) {
>  		if (!drm_object_property_get_default_value(&plane->base,
>  							   plane->color_encoding_property,
> @@ -335,6 +340,9 @@ void __drm_atomic_helper_plane_duplicate_state(struct=
 drm_plane *plane,
>  	if (state->fb)
>  		drm_framebuffer_get(state->fb);
> =20
> +	if (state->solid_fill_blob)
> +		drm_property_blob_get(state->solid_fill_blob);
> +
>  	state->fence =3D NULL;
>  	state->commit =3D NULL;
>  	state->fb_damage_clips =3D NULL;
> @@ -384,6 +392,7 @@ void __drm_atomic_helper_plane_destroy_state(struct d=
rm_plane_state *state)
>  		drm_crtc_commit_put(state->commit);
> =20
>  	drm_property_blob_put(state->fb_damage_clips);
> +	drm_property_blob_put(state->solid_fill_blob);
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
> =20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index d867e7f9f2cd..a28b4ee79444 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -316,6 +316,51 @@ drm_atomic_set_crtc_for_connector(struct drm_connect=
or_state *conn_state,
>  }
>  EXPORT_SYMBOL(drm_atomic_set_crtc_for_connector);
> =20
> +static int drm_atomic_set_solid_fill_prop(struct drm_plane_state *state,
> +		struct drm_property_blob *blob)
> +{
> +	int ret =3D 0;
> +	int blob_version;
> +
> +	if (blob =3D=3D state->solid_fill_blob)
> +		return 0;
> +
> +	drm_property_blob_put(state->solid_fill_blob);
> +	state->solid_fill_blob =3D NULL;

Is it ok to destroy old state before it is guaranteed that the new
state is accepted?

> +
> +	memset(&state->solid_fill, 0, sizeof(state->solid_fill));
> +
> +	if (blob) {
> +		struct drm_solid_fill_info *user_info =3D (struct drm_solid_fill_info =
*)blob->data;
> +
> +		if (blob->length !=3D sizeof(struct drm_solid_fill_info)) {
> +			drm_dbg_atomic(state->plane->dev,
> +				       "[PLANE:%d:%s] bad solid fill blob length: %zu\n",
> +				       state->plane->base.id, state->plane->name,
> +				       blob->length);
> +			return -EINVAL;
> +		}
> +
> +		blob_version =3D user_info->version;
> +
> +		/* Add more versions if necessary */
> +		if (blob_version =3D=3D 1) {
> +			state->solid_fill.r =3D user_info->r;
> +			state->solid_fill.g =3D user_info->g;
> +			state->solid_fill.b =3D user_info->b;
> +		} else {
> +			drm_dbg_atomic(state->plane->dev,
> +				       "[PLANE:%d:%s] failed to set solid fill (ret=3D%d)\n",
> +				       state->plane->base.id, state->plane->name,
> +				       ret);
> +			return -EINVAL;

Btw. how does the atomic check machinery work here?

I expect that a TEST_ONLY atomic commit will do all the above checks
and return failure if anything is not right. Right?

> +		}
> +		state->solid_fill_blob =3D drm_property_blob_get(blob);
> +	}
> +
> +	return ret;
> +}
> +
>  static void set_out_fence_for_crtc(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc, s32 __user *fence_ptr)
>  {
> @@ -544,6 +589,13 @@ static int drm_atomic_plane_set_property(struct drm_=
plane *plane,
>  		state->src_w =3D val;
>  	} else if (property =3D=3D config->prop_src_h) {
>  		state->src_h =3D val;
> +	} else if (property =3D=3D plane->solid_fill_property) {
> +		struct drm_property_blob *solid_fill =3D drm_property_lookup_blob(dev,=
 val);
> +
> +		ret =3D drm_atomic_set_solid_fill_prop(state, solid_fill);
> +		drm_property_blob_put(solid_fill);
> +
> +		return ret;
>  	} else if (property =3D=3D plane->alpha_property) {
>  		state->alpha =3D val;
>  	} else if (property =3D=3D plane->blend_mode_property) {
> @@ -616,6 +668,9 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val =3D state->src_w;
>  	} else if (property =3D=3D config->prop_src_h) {
>  		*val =3D state->src_h;
> +	} else if (property =3D=3D plane->solid_fill_property) {
> +		*val =3D state->solid_fill_blob ?
> +			state->solid_fill_blob->base.id : 0;
>  	} else if (property =3D=3D plane->alpha_property) {
>  		*val =3D state->alpha;
>  	} else if (property =3D=3D plane->blend_mode_property) {
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6e74de833466..38c3c5d6453a 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,10 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> + * solid_fill:
> + *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
> + *	contains pixel data that drivers can use to fill a plane.

This is a nice start, but I feel it needs to explain much more about
how userspace should go about making use of this.

Yeah, the pixel_source property comes in the next patch, but I feel
that it is harder to review if the doc is built over multiple patches.
My personal approach would be to write the doc in full and referring to
pixel_source property already, and explain in the commit message that
the next patch will add pixel_source so people don't wonder about
referring to a non-existing property.

I mean just a reference to pixel_source, and leave the actual
pixel_source doc for the patch adding the property like it already is.

Dmitry's suggestion of swapping the patch order is good too.

> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).
> @@ -615,3 +619,32 @@ int drm_plane_create_blend_mode_property(struct drm_=
plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
> +
> +/**
> + * drm_plane_create_solid_fill_property - create a new solid_fill proper=
ty
> + * @plane: drm plane
> + *
> + * This creates a new property that holds pixel data for solid fill plan=
es. This
> + * property is exposed to userspace as a property blob called "solid_fil=
l".
> + *
> + * For information on what the blob contains, see `drm_solid_fill_info`.

I think you should be more explicit here. For example: the blob must
contain exactly one struct drm_solid_fill_info.

It's better to put this content spec with the UAPI doc rather than in this
kerner-internal function doc that userspace programmers won't know to
look at.

> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +
> +	prop =3D drm_property_create(plane->dev,
> +			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
> +			"solid_fill", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +	plane->solid_fill_property =3D prop;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_solid_fill_property);
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..0338a860b9c8 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -58,4 +58,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
>  			      struct drm_atomic_state *state);
>  int drm_plane_create_blend_mode_property(struct drm_plane *plane,
>  					 unsigned int supported_modes);
> +int drm_plane_create_solid_fill_property(struct drm_plane *plane);
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..f6ab313cb83e 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -40,6 +40,25 @@ enum drm_scaling_filter {
>  	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
>  };
> =20
> +/**
> + * struct drm_solid_fill_info - User info for solid fill planes
> + */
> +struct drm_solid_fill_info {
> +	__u8 version;
> +	__u32 r, g, b;
> +};

Shouldn't UAPI structs be in UAPI headers?

Shouldn't UAPI structs use explicit padding to not leave any gaps when
it's unavoidable? And the kernel to check that the gaps are indeed
zeroed?

It also needs more UAPI doc, like a link to the property doc that uses
this and an explanation of what the values mean.


Thanks,
pq

> +
> +/**
> + * struct solid_fill_property - RGB values for solid fill plane
> + *
> + * Note: This is the V1 for this feature
> + */
> +struct drm_solid_fill {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +};
> +
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> @@ -116,6 +135,23 @@ struct drm_plane_state {
>  	/** @src_h: height of visible portion of plane (in 16.16) */
>  	uint32_t src_h, src_w;
> =20
> +	/**
> +	 * @solid_fill_blob:
> +	 *
> +	 * Blob containing relevant information for a solid fill plane
> +	 * including pixel format and data. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_property_blob *solid_fill_blob;
> +
> +	/**
> +	 * @solid_fill:
> +	 *
> +	 * Pixel data for solid fill planes. See
> +	 * drm_plane_create_solid_fill_property() for more details.
> +	 */
> +	struct drm_solid_fill solid_fill;
> +
>  	/**
>  	 * @alpha:
>  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -699,6 +735,13 @@ struct drm_plane {
>  	 */
>  	struct drm_plane_state *state;
> =20
> +	/*
> +	 * @solid_fill_property:
> +	 * Optional solid_fill property for this plane. See
> +	 * drm_plane_create_solid_fill_property().
> +	 */
> +	struct drm_property *solid_fill_property;
> +
>  	/**
>  	 * @alpha_property:
>  	 * Optional alpha property for this plane. See
>=20


--Sig_/gk+kjtdh1d943WG7QpLclJT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSekdQACgkQI1/ltBGq
qqecQg//Vhds+6YY1Cd5asJ9ECmm4BMq/yl8W13HNRqr7dZ2HCEOBm8Zng6MrKy/
4M6QgDkV8kXLF4QIOkGUKVwz1zYThLQO16zevmHxe/vUd3OPSmPsaiREsk0FlRHh
MchzreSSUkX65uRkxVMpKJ6rpnjembFzgHX94GnDRJh5f25qkH/RDqRmfIgSLwdh
NM6t9bsrEb8HPpo8KRK42+ChwF3ficcAJjCmNNicqJzfEOInps03Ku4MhNdPN16W
TZf9bmMUQ9UMXIHvQ+1IZp2LzPSXOKB8E7JAg7LhVCDAISvHy+hXDbKJN0CD2Nf7
mK/oO1wCDVv+08/ar0tbrokjL2+G040g9WxatljwVCg9Y9nbv9LcMrmMy42/fEwL
jZuNzCvxjF7z7kGrNZHdSiVFAInYpQhOXorE481AH74GKzWdRojeVApHR0CeDI4o
wJc0W1xF4OuGu5PbSWkWUjUYVrDCjKiB2BaGxYP3P9qr4jxAEIKgnmVhwr+o1cXp
tCC3rKkaggbwEFj9KdMEhDutg3KRLw6yglfZ0xA370UMRFTLrrdqaTmQWaHJwKyT
THfeNOOTyGtSdkk4n7dy65LBIH0HXOJzoFukEiwFRwDk3/aqhIjWJUX6IiV21NOL
VycA2DCNRwyveCa0TWn+++WQp2dv5fTImX/BOw2RGaT49XdnOyU=
=Zzxf
-----END PGP SIGNATURE-----

--Sig_/gk+kjtdh1d943WG7QpLclJT--
