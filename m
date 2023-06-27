Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DDD73F70E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DA210E2A7;
	Tue, 27 Jun 2023 08:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA9110E2A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:26:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5712924e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687854412; x=1690446412;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sYejRCVfSbkuGSiZUSJHtu+E/qd1H2FujspVKMH9bjM=;
 b=I3EZUr5C7a8AnYBZk2bQxHZZcp8fjSCmSyySg489fKrM/aLY/T5xOEGPscnFBRaKLz
 4A1jrsz8Ko/mBKWCPFQqkVnExuqXhuCZhLA1xbVOPWfxPNgQalOkayRi0X8VwpLPMnrr
 8Xam3kKhcMDY4KZCb8pkH5x/4R+7GpvO5GfD9tf2F4YscXWqWeXbySgC8tadDGCDHz6/
 hZQnrSuuinEYpV2SKqIY9/6brcAYoz7fLKaPtmJ06X1ybcowWByBNEQXKbbrXW8TsU9v
 WKY9OrKNbST7LxIIjtk7n1wLsgZs54QgbLx89VEiCzLFO2kRIvqp3VikZTPjxAhaPode
 7Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687854412; x=1690446412;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYejRCVfSbkuGSiZUSJHtu+E/qd1H2FujspVKMH9bjM=;
 b=FBlU18Taj9ZxXCqFvsP2RKpMs7xJBr+mnPIvoUF2euhSg4dTSGx7wRFT2j3/K6Dacq
 +kjQj0O+qy2owA+iosasd0RGMla466OXMcgGIEMmZfPnZhN7d2+9ga/6H4kxwvEEQ3bP
 LlhRbYlBhGIjdDz8QwsruXtAzl0H+Kjxx9t/mAoRKs1P2rhzXOG4xVZLa7cmp1az8PsW
 lnKCXSwG/FnpeK9U8H6YzL5uNkmBLsmGOKw80XL2EXycJGSYFEuhMtLSZWs24Ugh42j7
 fmi85xh4aTMQiCxWeR4p7n5hKOeFNxj10dLfJg528N1M1Pdbzin0GTnxL1znXQqk0or+
 UxHg==
X-Gm-Message-State: AC+VfDxFpY0Asnyc/rbqR5cxXaT81PJH+IE3E1sx/dirp+LMVdm3pWw9
 ZUSdjURwHhhR/Jboxt9msdw=
X-Google-Smtp-Source: ACHHUZ6gwT4pTYeuw8IjwZ5Pi28nyGlaDPQRv57AsVTT20UErerGmxFSD25M4pCFqZfUE5NV1vONTw==
X-Received: by 2002:a19:5f1c:0:b0:4f7:6a40:9fd7 with SMTP id
 t28-20020a195f1c000000b004f76a409fd7mr18995828lfb.47.1687854411795; 
 Tue, 27 Jun 2023 01:26:51 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 i28-20020a056512007c00b004fb680fd3d7sm995115lfo.291.2023.06.27.01.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:26:51 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:26:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v3 2/8] drm/atomic: Add support for mouse hotspots
Message-ID: <20230627112647.175ec323@eldfell>
In-Reply-To: <20230627035839.496399-3-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-3-zack@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zvGMgx3/mt7iq56nCPCX5a=";
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

--Sig_/zvGMgx3/mt7iq56nCPCX5a=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 23:58:33 -0400
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
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
>  drivers/gpu/drm/drm_plane.c               | 51 +++++++++++++++++++++++
>  include/drm/drm_plane.h                   | 15 +++++++
>  4 files changed, 100 insertions(+)

Hi Zack,

where is the UAPI documentation for these new properties? I mean
something ending up in the HTML docs like what other properties have in
e.g. https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-composit=
ion-properties

Otherwise looks fine to me. Could drm_plane_create_hotspot_properties()
perhaps assert that the plane type is CURSOR?


Thanks,
pq

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
> index a4a39f4834e2..ff1cc810d8f8 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -348,6 +348,10 @@ static int __drm_universal_plane_init(struct drm_dev=
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
> @@ -1067,6 +1071,11 @@ static int drm_mode_cursor_universal(struct drm_cr=
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
> @@ -1595,3 +1604,45 @@ int drm_plane_create_scaling_filter_property(struc=
t drm_plane *plane,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +/**
> + * drm_plane_create_hotspot_properties - creates the mouse hotspot
> + * properties and attaches them to the given cursor plane
> + *
> + * @plane: drm cursor plane
> + *
> + * This function lets driver to enable the mouse hotspot property on a g=
iven
> + * cursor plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_create_hotspot_properties(struct drm_plane *plane)
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
> +EXPORT_SYMBOL(drm_plane_create_hotspot_properties);
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..cf269d5de278 100644
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
> @@ -945,5 +959,6 @@ drm_plane_get_damage_clips(const struct drm_plane_sta=
te *state);
> =20
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> +int drm_plane_create_hotspot_properties(struct drm_plane *plane);
> =20
>  #endif


--Sig_/zvGMgx3/mt7iq56nCPCX5a=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSanUgACgkQI1/ltBGq
qqfHYA/5AZJhxVmmrlMuVEPpMtHxfaOtyios977sL5e7g/6g4jEVvEyICT5c+nkY
tBvq3/FVHUCyg3N4o+ZFB3HMQ6vxEF3Jeaje4AYen3Rlzr54TIO4TMZ5MzbU+i/K
+Qv9wBXsjhOOJoUw7v2ef/R006wC8tNnfXG3yRgC+BvPBsYhktwiuhJwv2M3427L
Ii7Kjq0XxKt+6UPV2kfJRprTWUDEnmQLUBswqNp7oDQ1NNuXAHj5DLW7+uxfBjX6
/x3V6/XVim6yd9MZQows/8zHVBUTpG0Mwc8IPJg6+kC5/VwJjfyK5A2HrS8goSAs
PvzR+1iqo9kGUvCst8KCKwNIB6woW+mdtqirNIp5ilEg5hp1IIlHCtnbzFhQsvbV
e5RqBkb9EU0xV7jSCf+1e3DxRcEn7CuqmCPMW3QymAjgn4gi1jNaQq2u1RpedM9H
Zt8BeTVRgFyyh8aWh46klaOK5Gz+96rUObbIA1Cxb2iogaFxup2WCQdhYIpatcX1
dBK0ImDTdlEvRHr73JLsxlXFPCwALQq29aRZJ0px1V4K1Wr/olmHOfIccyCx1OF6
gUGudHSfhLCyhMkN6kkUhGA8Qj6aZ1OaXM5di2zhcL4nlNg3niSzxjgCLKbP7RBt
GZeogjTB13yTQqFsNmLTk3POmYRuxmj/VxKzlK7XECj0Am14l3c=
=kfT3
-----END PGP SIGNATURE-----

--Sig_/zvGMgx3/mt7iq56nCPCX5a=--
