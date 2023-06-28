Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E47409C3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 09:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B6E10E366;
	Wed, 28 Jun 2023 07:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7763910E0C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 07:41:13 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so7700283e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687938071; x=1690530071;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yr6l4F6WZxetE9W4eZcm17geyOdwe6AXe/J8WT0k2M8=;
 b=mch8hGaDowhSAOxJbrc9gR/3DXKk+eI8i0myfk3cBnDQ7qeRb+s+YbRV+Bp/moZE+h
 ryHH6Bb7EGvINbJO2FF1yveFqf1KgGFMI0x6rIHLx6uTXdWRXzMc/eY4LTGXeWMqgkQZ
 X1AeQrbwW+7RB1VDR9D9lJOfQVU+qEUqkZRtU8iWICynOAw3nBfIKgt5PkLL1RgZoGez
 ocz+JQ8KDhX4xlMa9ClfphF7Z+9QnvpvXegffmJ2grNvbBXzelsy5eNM/hDpzFYrRnvo
 52x2yrAvQpOJagfR7FduLV4TjcB2La0KPrE4QJc8fcQ4yxOpCNwbd1fN3NsvU3SfuGKt
 jtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687938071; x=1690530071;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yr6l4F6WZxetE9W4eZcm17geyOdwe6AXe/J8WT0k2M8=;
 b=l4wLyqUIKETh212YgpKZo3fFAsYw1SzntHBo2BYwc8ZBUmxtvMIO7ht+12AE7aF9wB
 pbJhXUx+gVXl4GGzt8+XPskV4pP8jhD9yN2jVIIUHwnjVKQJvNyB81AoiqH7LW8+EfPo
 CkiL8f0kifi7o+g8SlbP+v3x8myZhcMSYF0oCReOCOtiS8BtqmziuMlpcsKaLIKZEZJC
 m/+4uLMl+IcffITwIe5S78BYgqwP6gL3RTERR4WAYtD5HYvBy4+eYyfI3nATRrI61QTX
 L5d5oACmoh/Kd+gHpzuMsf53TP0z/phKWi7wpFAFDUeth2Eujj20iVxg6KZR4fXW+r2j
 gboQ==
X-Gm-Message-State: AC+VfDwnO6Ghx4KNHHoUrfEV7/WMIHopdWPjm+e7JaG7NN+NUNcFM87M
 Fxjt0LqdzXNewUfFkj/sOp4=
X-Google-Smtp-Source: ACHHUZ5zEkLpdkP2BQL/trl2dvreJA+IXz8TE2D4BofSnEbetV27YbPpzL7yxcykMiRee734H+H5zw==
X-Received: by 2002:a05:6512:2308:b0:4fb:85b2:cf78 with SMTP id
 o8-20020a056512230800b004fb85b2cf78mr3833228lfu.37.1687938071074; 
 Wed, 28 Jun 2023 00:41:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 22-20020ac24856000000b004fb79feb289sm905390lfy.227.2023.06.28.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 00:41:10 -0700 (PDT)
Date: Wed, 28 Jun 2023 10:41:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230628104106.30360b55@eldfell>
In-Reply-To: <20230628052133.553154-3-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5o.RNmv9I=q5+imvyvbJsi1";
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, javierm@redhat.com,
 krastevm@vmware.com, dri-devel@lists.freedesktop.org, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/5o.RNmv9I=q5+imvyvbJsi1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jun 2023 01:21:27 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Atomic modesetting code lacked support for specifying mouse cursor
> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> the hotspot but the functionality was not implemented in the new atomic
> paths.
>=20
> Due to the lack of hotspots in the atomic paths userspace compositors
> completely disable atomic modesetting for drivers that require it (i.e.
> all paravirtualized drivers).
>=20
> This change adds hotspot properties to the atomic codepaths throughtout
> the DRM core and will allow enabling atomic modesetting for virtualized
> drivers in the userspace.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Hi Zack,

I still do not see any UAPI docs for the new properties in this patch?


Thanks,
pq


> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
>  drivers/gpu/drm/drm_plane.c               | 50 +++++++++++++++++++++++
>  include/drm/drm_plane.h                   | 14 +++++++
>  4 files changed, 98 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/=
drm_atomic_state_helper.c
> index 784e63d70a42..54975de44a0e 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -275,6 +275,20 @@ void __drm_atomic_helper_plane_state_reset(struct dr=
m_plane_state *plane_state,
>  			plane_state->normalized_zpos =3D val;
>  		}
>  	}
> +
> +	if (plane->hotspot_x_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->hotspot_x_property,
> +							   &val))
> +			plane_state->hotspot_x =3D val;
> +	}
> +
> +	if (plane->hotspot_y_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->hotspot_y_property,
> +							   &val))
> +			plane_state->hotspot_y =3D val;
> +	}
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
> =20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 98d3b10c08ae..07a7b3f18df2 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -593,6 +593,22 @@ static int drm_atomic_plane_set_property(struct drm_=
plane *plane,
>  	} else if (plane->funcs->atomic_set_property) {
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
> +	} else if (property =3D=3D plane->hotspot_x_property) {
> +		if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +				       plane->base.id, plane->name, val);
> +			return -EINVAL;
> +		}
> +		state->hotspot_x =3D val;
> +	} else if (property =3D=3D plane->hotspot_y_property) {
> +		if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +				       plane->base.id, plane->name, val);
> +			return -EINVAL;
> +		}
> +		state->hotspot_y =3D val;
>  	} else {
>  		drm_dbg_atomic(plane->dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> @@ -653,6 +669,10 @@ drm_atomic_plane_get_property(struct drm_plane *plan=
e,
>  		*val =3D state->scaling_filter;
>  	} else if (plane->funcs->atomic_get_property) {
>  		return plane->funcs->atomic_get_property(plane, state, property, val);
> +	} else if (property =3D=3D plane->hotspot_x_property) {
> +		*val =3D state->hotspot_x;
> +	} else if (property =3D=3D plane->hotspot_y_property) {
> +		*val =3D state->hotspot_y;
>  	} else {
>  		drm_dbg_atomic(dev,
>  			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]\n",
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index c6bbb0c209f4..eaca367bdc7e 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -230,6 +230,47 @@ static int create_in_format_blob(struct drm_device *=
dev, struct drm_plane *plane
>  	return 0;
>  }
> =20
> +/**
> + * drm_plane_create_hotspot_properties - creates the mouse hotspot
> + * properties and attaches them to the given cursor plane
> + *
> + * @plane: drm cursor plane
> + *
> + * This function enables the mouse hotspot property on a given
> + * cursor plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +static int drm_plane_create_hotspot_properties(struct drm_plane *plane)
> +{
> +	struct drm_property *prop_x;
> +	struct drm_property *prop_y;
> +
> +	drm_WARN_ON(plane->dev,
> +		    !drm_core_check_feature(plane->dev,
> +					    DRIVER_CURSOR_HOTSPOT));
> +
> +	prop_x =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
> +						  INT_MIN, INT_MAX);
> +	if (IS_ERR(prop_x))
> +		return PTR_ERR(prop_x);
> +
> +	prop_y =3D drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
> +						  INT_MIN, INT_MAX);
> +	if (IS_ERR(prop_y)) {
> +		drm_property_destroy(plane->dev, prop_x);
> +		return PTR_ERR(prop_y);
> +	}
> +
> +	drm_object_attach_property(&plane->base, prop_x, 0);
> +	drm_object_attach_property(&plane->base, prop_y, 0);
> +	plane->hotspot_x_property =3D prop_x;
> +	plane->hotspot_y_property =3D prop_y;
> +
> +	return 0;
> +}
> +
>  __printf(9, 0)
>  static int __drm_universal_plane_init(struct drm_device *dev,
>  				      struct drm_plane *plane,
> @@ -348,6 +389,10 @@ static int __drm_universal_plane_init(struct drm_dev=
ice *dev,
>  		drm_object_attach_property(&plane->base, config->prop_src_w, 0);
>  		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
>  	}
> +	if (drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT) &&
> +	    type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +		drm_plane_create_hotspot_properties(plane);
> +	}
> =20
>  	if (format_modifier_count)
>  		create_in_format_blob(dev, plane);
> @@ -1067,6 +1112,11 @@ static int drm_mode_cursor_universal(struct drm_cr=
tc *crtc,
> =20
>  			fb->hot_x =3D req->hot_x;
>  			fb->hot_y =3D req->hot_y;
> +
> +			if (plane->hotspot_x_property && plane->state)
> +				plane->state->hotspot_x =3D req->hot_x;
> +			if (plane->hotspot_y_property && plane->state)
> +				plane->state->hotspot_y =3D req->hot_y;
>  		} else {
>  			fb =3D NULL;
>  		}
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..74e62f90a1ad 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -116,6 +116,10 @@ struct drm_plane_state {
>  	/** @src_h: height of visible portion of plane (in 16.16) */
>  	uint32_t src_h, src_w;
> =20
> +	/** @hotspot_x: x offset to mouse cursor hotspot */
> +	/** @hotspot_y: y offset to mouse cursor hotspot */
> +	int32_t hotspot_x, hotspot_y;
> +
>  	/**
>  	 * @alpha:
>  	 * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -748,6 +752,16 @@ struct drm_plane {
>  	 * scaling.
>  	 */
>  	struct drm_property *scaling_filter_property;
> +
> +	/**
> +	 * @hotspot_x_property: property to set mouse hotspot x offset.
> +	 */
> +	struct drm_property *hotspot_x_property;
> +
> +	/**
> +	 * @hotspot_y_property: property to set mouse hotspot y offset.
> +	 */
> +	struct drm_property *hotspot_y_property;
>  };
> =20
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)


--Sig_/5o.RNmv9I=q5+imvyvbJsi1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSb5BMACgkQI1/ltBGq
qqfM8Q/9Fyv9jTQkPp5mLb6BSWXDYtDFqd1YDwxK9JlmeCw/SCva4FeVuAiCLhxG
HUhPM/NBKcNlTUnUqyEfoy/l9gjtp/akINKW6zQ1ngai/OJC1JpHpKua0WU9DZNq
YRWWwXEIwv+TAmsYKSyQPblB0ikOGMp4UQSKQzf7QMXyMTRV67xAcOkBzn/TJy0L
A22dO/dL9JXSZiqT3961VBwxut1DEU7232mMurLsuyLhKNsZ8tWN+D22wNrMtTzW
P/ynx8W2JHk/95wuK2GdeatwptFfh9AgKTw6x9Eka+N8L1ezuaViKTa8o3H05Qvv
nAsIRHP7/99uVckHjL8obCmiu6A9IWyVGwVNNN4BBQgtEDoNXSaXlU5xF8ZcRtrN
mM/mU0wCkwDgYZla0cn4koFNp3FhZAxY4XSJjPQCpTRIDrymp5Vzptug9LFu7jK6
/fyYTNeR9lN3IelnXy+wMf5enUFYJP/NIYITwxU9vHWTw9H/i8K5zLJrrHDpief9
5QkVffJ00IhHy1VI0BIPiFQjQqzspjpOR5779R4LVthkn+p3G6MJK7xoRcGvuWbC
IfCCfMkP9T0tgr+R9KeEkZg2HOXv4fhpceE8PnahaSJ7o9C1NDq3Hxik+bLp+TUD
jaI3YL+Kc6/yvWJQJA9wSKpLVwDEetZzE5PGM0WbgAGThBGsZvM=
=ihbD
-----END PGP SIGNATURE-----

--Sig_/5o.RNmv9I=q5+imvyvbJsi1--
