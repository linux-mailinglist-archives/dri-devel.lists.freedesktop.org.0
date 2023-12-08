Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7F80A2B4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F19510EA97;
	Fri,  8 Dec 2023 11:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F8810E150;
 Fri,  8 Dec 2023 11:53:59 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50bee606265so2049531e87.2; 
 Fri, 08 Dec 2023 03:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702036438; x=1702641238; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pdeA3b3/0PsOexhmM9BS+1Krk2ZD58n85Te8kaYmuOQ=;
 b=RAZ3pS/bwrYDu+Sy6RT66ddCURHK8HXj5wM6HAh28KpYX3SWjrUTAfGVAJBhA2oJUA
 bcLxcEF98XEqtNmGMGerSktH6/yRL/trzKpaUUvNJwUd/rIOoPvMweJ9DMrE7sfJwids
 YZ3W2oEyr9rFuagxVP246/0D0mH5WwdEv6rcPMvXIv+KT+rt9Nb0q4O9ASWJvZHYmnv9
 4PRGBA2kkHqfK8UVPYMw/QRKQBjvD3baTa0b2CzRsoTncEEjx1bNw4RzRLbWU62Tmr7a
 BNrbbQLxyaqV3AY/U+tpu6n1ivIazDRhAYs6sQMVNObYFdAf0HprkfWCIAJ3u/cB4ueU
 s26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702036438; x=1702641238;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdeA3b3/0PsOexhmM9BS+1Krk2ZD58n85Te8kaYmuOQ=;
 b=HSYToRvb6400nHuhANTfx8jT8+vdsmGxDnA144VtnqOzV95aGP1IctYiu4qSdxq5Zo
 3kWhAvTS/pS6Vq1qagm1fHvhILMj9TpYgC6f7fHIPOKHwZErFjJzarPI62FS4qVRtbJq
 533VxXq22t4iOXKpTdXNll6Y0phXR/6rAZZ2tH9iynbAeD9epPNlz9Wctgrdf2EshOBt
 AQECszchnsi8EPtVBw7NGoCrJfuBu6I59Fxhu2h3EBbvzVUB+xIVzmQYgpk4r6S2ouli
 QUbtEEVMkLYYGARFWhB7orwtDnJ8I+JPq2E4aOATO5o6H5AtsrU6l87tr/otwLz8/EAo
 Dzvw==
X-Gm-Message-State: AOJu0Ywnz/5mmswIF/1Y4w6vpmf8Xobgsagd3pBl7ncfKf59zJ7jM5OG
 W2AkfMljfOV+5TNWwNuClm8=
X-Google-Smtp-Source: AGHT+IH0rVF6/Y1ZkUmD4m/xkRCOJi0/OjDTejTJQTDS38d65A9Qo+qmzn3El9HPx0sG1oz23kAS6g==
X-Received: by 2002:a05:6512:31c3:b0:50d:13cb:9838 with SMTP id
 j3-20020a05651231c300b0050d13cb9838mr503468lfe.116.1702036437627; 
 Fri, 08 Dec 2023 03:53:57 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g42-20020a0565123baa00b0050bfe7a602csm195889lfv.74.2023.12.08.03.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:53:56 -0800 (PST)
Date: Fri, 8 Dec 2023 13:53:52 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 13/23] drm/plane: Add COLOR PIPELINE property
Message-ID: <20231208135352.0f94f72e@eldfell>
In-Reply-To: <20231108163647.106853-14-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-14-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TFm9gs4SBBt6r55bZLYNLFV";
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TFm9gs4SBBt6r55bZLYNLFV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:32 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> We're adding a new enum COLOR PIPELINE property. This
> property will have entries for each COLOR PIPELINE by
> referencing the DRM object ID of the first drm_colorop
> of the pipeline. 0 disables the entire COLOR PIPELINE.

I didn't find the call that actually creates that property, where is it?


> Userspace can use this to discover the available color
> pipelines, as well as set the desired one. The color
> pipelines are programmed via properties on the actual
> drm_colorop objects.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic.c              | 46 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 44 ++++++++++++++++++++++
>  include/drm/drm_atomic_uapi.h             |  2 +
>  include/drm/drm_plane.h                   |  8 ++++
>  5 files changed, 105 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ccf26b034433..cf3cb6d1239f 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1463,6 +1463,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_s=
tate *state,
>  }
>  EXPORT_SYMBOL(drm_atomic_add_affected_planes);
> =20
> +/**
> + * drm_atomic_add_affected_colorops - add colorops for plane
> + * @state: atomic state
> + * @plane: DRM plane
> + *
> + * This function walks the current configuration and adds all colorops
> + * currently used by @plane to the atomic configuration @state. This is =
useful
> + * when an atomic commit also needs to check all currently enabled color=
op on
> + * @plane, e.g. when changing the mode. It's also useful when re-enablin=
g a plane
> + * to avoid special code to force-enable all colorops.
> + *
> + * Since acquiring a colorop state will always also acquire the w/w mute=
x of the
> + * current plane for that colorop (if there is any) adding all the color=
op states for
> + * a plane will not reduce parallelism of atomic updates.
> + *
> + * Returns:
> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is =
EDEADLK
> + * then the w/w mutex code has detected a deadlock and the entire atomic
> + * sequence must be restarted. All other errors are fatal.
> + */
> +int
> +drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
> +				 struct drm_plane *plane)
> +{
> +	struct drm_colorop *colorop;
> +	struct drm_colorop_state *colorop_state;
> +
> +	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
> +
> +	drm_dbg_atomic(plane->dev,
> +		       "Adding all current colorops for [plane:%d:%s] to %p\n",
> +		       plane->base.id, plane->name, state);
> +
> +	drm_for_each_colorop(colorop, plane->dev) {
> +		if (colorop->plane !=3D plane)
> +			continue;
> +
> +		colorop_state =3D drm_atomic_get_colorop_state(state, colorop);
> +		if (IS_ERR(colorop_state))
> +			return PTR_ERR(colorop_state);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
> +
>  /**
>   * drm_atomic_check_only - check whether a given config would work
>   * @state: atomic configuration to check
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 784e63d70a42..3c5f2c8e33d0 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -267,6 +267,11 @@ void __drm_atomic_helper_plane_state_reset(struct dr=
m_plane_state *plane_state,
>  			plane_state->color_range =3D val;
>  	}
> =20
> +	if (plane->color_pipeline_property) {
> +		/* default is always NULL, i.e., bypass */
> +		plane_state->color_pipeline =3D NULL;
> +	}
> +
>  	if (plane->zpos_property) {
>  		if (!drm_object_property_get_default_value(&plane->base,
>  							   plane->zpos_property,
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a8f7a8a6639a..c6629fdaa114 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -256,6 +256,38 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *=
plane_state,
>  }
>  EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
> =20
> +
> +/**
> + * drm_atomic_set_colorop_for_plane - set colorop for plane
> + * @plane_state: atomic state object for the plane
> + * @colorop: colorop to use for the plane
> + *
> + * Changing the assigned framebuffer for a plane requires us to grab a r=
eference
> + * to the new fb and drop the reference to the old fb, if there is one. =
This
> + * function takes care of all these details besides updating the pointer=
 in the
> + * state object itself.

This paragraph does not seem to talk about this function.

> + */
> +void
> +drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
> +				 struct drm_colorop *colorop)
> +{
> +	struct drm_plane *plane =3D plane_state->plane;
> +
> +	if (colorop)
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
> +			       colorop->base.id, plane->base.id, plane->name,
> +			       plane_state);
> +	else
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [NOCOLOROP] for [PLANE:%d:%s] state %p\n",
> +			       plane->base.id, plane->name, plane_state);
> +
> +	plane_state->color_pipeline =3D colorop;
> +}
> +EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
> +
> +
>  /**
>   * drm_atomic_set_crtc_for_connector - set CRTC for connector
>   * @conn_state: atomic state object for the connector
> @@ -581,6 +613,16 @@ static int drm_atomic_plane_set_property(struct drm_=
plane *plane,
>  		state->color_encoding =3D val;
>  	} else if (property =3D=3D plane->color_range_property) {
>  		state->color_range =3D val;
> +	} else if (property =3D=3D plane->color_pipeline_property) {
> +		/* find DRM colorop object */
> +		struct drm_colorop *colorop =3D NULL;
> +		colorop =3D drm_colorop_find(dev, file_priv, val);
> +
> +		if (val && !colorop)
> +			return -EACCES;
> +
> +		/* set it on drm_plane_state */
> +		drm_atomic_set_colorop_for_plane(state, colorop);
>  	} else if (property =3D=3D config->prop_fb_damage_clips) {
>  		ret =3D drm_atomic_replace_property_blob_from_id(dev,
>  					&state->fb_damage_clips,
> @@ -647,6 +689,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>  		*val =3D state->color_encoding;
>  	} else if (property =3D=3D plane->color_range_property) {
>  		*val =3D state->color_range;
> +	} else if (property =3D=3D plane->color_pipeline_property) {
> +		*val =3D (state->color_pipeline) ? state->color_pipeline->base.id : 0;
>  	} else if (property =3D=3D config->prop_fb_damage_clips) {
>  		*val =3D (state->fb_damage_clips) ?
>  			state->fb_damage_clips->base.id : 0;
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 70a115d523cd..436315523326 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -50,6 +50,8 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *p=
lane_state,
>  			      struct drm_crtc *crtc);
>  void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>  				 struct drm_framebuffer *fb);
> +void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_stat=
e,
> +				      struct drm_colorop *colorop);
>  int __must_check
>  drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>  				  struct drm_crtc *crtc);
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 57bbd0cd73a9..e65074f266c0 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -745,6 +745,14 @@ struct drm_plane {
>  	 */
>  	struct drm_property *color_range_property;
> =20
> +	/**
> +	 * @color_pipeline_property:
> +	 *
> +	 * Optional "COLOR_PIPELINE" enum property for specifying
> +	 * a color pipeline to use on the plane.
> +	 */
> +	struct drm_property *color_pipeline_property;
> +
>  	/**
>  	 * @scaling_filter_property: property to apply a particular filter while
>  	 * scaling.


Thanks,
pq

--Sig_/TFm9gs4SBBt6r55bZLYNLFV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzA9EACgkQI1/ltBGq
qqeeCQ/8DwlZwFSllq+IvpbVNhbDRImJXV9cl03S2emo1Vmqohreoo4Q8JypGmkt
WpdpCMBNNSuauBXI+/82JpJNpuGPJod+MPX9Id42KObezCdJAVNM23k2MxiZqaZk
OVPozX+PeQ06hv8q2eQUcS+LUKBsHz5vwMgQtYrOSHqzc8MpDtHGa6j+2D3x6nlI
Fdq2cDQnr7H7HcVe+WklrLsyehRe8KMQoRSZI6xpsIFzWFOpcIa2ohQkxXBon1/N
2YcKOOIftnjbflHR17V/1brmzNszeNOhd+EIQBZhuXn0zDX2aAdHqNGfixCt13Cs
n0jY5aTKVl8Oe6FXhvZOG+rjU9iVJlp2t5Yrsxb11CLlCCS+eKH0HmnSQIxVFGko
4ut88bsCryfIkPNzY6lSsRq33C0M70riGTq+SVU2Uqp3E5gT9gVxlFZdi4yzy6P6
podCnlUwTM5nlNBtT4t8b65okIl/Yc09ty8lQXLF/de57EVo1eWr4GNemygGdFCP
4iuiFH62XOHuXsixKHhV2MWgNeyJSr1mvYmGn8/fXVWPqOHfgJa7hT7i5AHmtHrP
dpZ7D0LEhorx9GaqgGKBCVQ3DQPgw3Cj0FrS9lAXDaONrLp0wWP3H7kXa7NWcYec
yBYRdksVViRtvLIy/jD+Cfyyc0Vx99AQr4TShmP282OeFK4tWQ8=
=reKM
-----END PGP SIGNATURE-----

--Sig_/TFm9gs4SBBt6r55bZLYNLFV--
