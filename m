Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0080A345
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 13:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA92A10E180;
	Fri,  8 Dec 2023 12:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D6210E180;
 Fri,  8 Dec 2023 12:33:37 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so28906161fa.3; 
 Fri, 08 Dec 2023 04:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702038815; x=1702643615; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=29MfOv2++yAxGSFuNF/LKvYevCLd1LpJ2H0rSF1CR2k=;
 b=TWF7GCpX6zdzOQAQIiVdnYbKV7bHJN3/31vmRwVNheqt2zX/kpVGphuu2qkyovyGY5
 Acibl039tlS4momSD3cMWdatAU3Cvbp66RhONENIp0ryJlHJ2p94qa7qkNzCdcZF9RnV
 3EOJ8QFPznAKbVC6Br0sILzDBOwEvfZqsLi5IQOmTT9E/WZdJqJ7rDXj6g7ChMdjIZ/P
 N1QZB8PW6nYEASFHVesjKpmSjA0fnHX7ospkUEliVvKiehHi9qliBMDBBPtdrrv03teQ
 Pqel43LdJqhIkAH+99y/DjRwHzmU/7H3wK4Fnqy6yOpMuf0y3sJlegi/fWY8WsrNeNDA
 iRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702038815; x=1702643615;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29MfOv2++yAxGSFuNF/LKvYevCLd1LpJ2H0rSF1CR2k=;
 b=B44pW/HxsqJzTGGj5dPZS8TIRaQFFGEkofvKOymWqmqn1yNpR+hj9D3N2egD/udeQH
 VbXhkjT1W/Ej1ifbKO20csrQVGEQIlOCKq/pz5d1HM+IhR/BFi078w3SU3byq2uciO8N
 HsaHmM9QRVOxXYUwyCh+ovx9nKVsbVqe+KIkygiHJf1kUnsq39uoqy9ZEtDaIQCRo3TN
 wxPyqI6vpqTC9/YJrdJme12a+btoL4lqM3pPoFvqzkOECl9PhnGEHNnrJE7DiV/8XbKf
 Hb0OCiqm0y3mdVzMBor3xZjEGgK1M87FsqgegEiKBLjf34L/80f5Pi1aR1vgFkvqbhnU
 kTPg==
X-Gm-Message-State: AOJu0Yx526JZtCJqv1sVrngAHvpMtvhKfgMqZpyMScAnzYKv2l+YURlw
 8WUcwoXyZyIqCu31BdVjxz4=
X-Google-Smtp-Source: AGHT+IENS25qla7KVWQVebhERJ5a11PERfk3cGgZgbxZjdEsl+YiG7Vo8N6UtA2WinoAouR4LHaNVQ==
X-Received: by 2002:a05:651c:237:b0:2cb:20b4:38a1 with SMTP id
 z23-20020a05651c023700b002cb20b438a1mr612857ljn.64.1702038815027; 
 Fri, 08 Dec 2023 04:33:35 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s10-20020a2e81ca000000b002c9f8439894sm218222ljg.45.2023.12.08.04.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 04:33:34 -0800 (PST)
Date: Fri, 8 Dec 2023 14:33:30 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 17/23] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Message-ID: <20231208143330.30b58da8@eldfell>
In-Reply-To: <20231108163647.106853-18-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-18-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_L+fHxCz1OS0k8AndUknxOV";
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

--Sig_/_L+fHxCz1OS0k8AndUknxOV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:36 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> With the introduction of the pre-blending color pipeline we
> can no longer have color operations that don't have a clear
> position in the color pipeline. We deprecate all existing
> plane properties. For upstream drivers those are:
>  - COLOR_ENCODING
>  - COLOR_RANGE
>=20
> Userspace that registers with the
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will be permitted to set
> the COLOR_PIPELINE plane property and drm_colorop properties.
> But it won't be allowed to set COLOR_ENCODING and
> COLOR_RANGE. Userspace that does not set this client cap
> will not be permitted to touch the color pipeline.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
>  include/drm/drm_file.h            |  7 +++++++
>  include/uapi/drm/drm.h            | 15 +++++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index c6629fdaa114..69c56982e2d0 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -610,10 +610,26 @@ static int drm_atomic_plane_set_property(struct drm=
_plane *plane,
>  	} else if (property =3D=3D plane->zpos_property) {
>  		state->zpos =3D val;
>  	} else if (property =3D=3D plane->color_encoding_property) {
> +		if (file_priv->plane_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				       "Setting COLOR_PIPELINE plane property not permitted when DRM=
_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
> +			return -EINVAL;
> +		}
>  		state->color_encoding =3D val;
>  	} else if (property =3D=3D plane->color_range_property) {
> +		if (file_priv->plane_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				       "Setting COLOR_PIPELINE plane property not permitted when DRM=
_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
> +			return -EINVAL;
> +		}
>  		state->color_range =3D val;

The above two cases mention COLOR_PIPELINE when they should probably
refer to something else.


Thanks,
pq

>  	} else if (property =3D=3D plane->color_pipeline_property) {
> +		if (!file_priv->plane_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				       "Setting COLOR_PIPELINE plane property not permitted unless D=
RM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
> +			return -EINVAL;
> +		}
> +
>  		/* find DRM colorop object */
>  		struct drm_colorop *colorop =3D NULL;
>  		colorop =3D drm_colorop_find(dev, file_priv, val);
> @@ -1158,6 +1174,12 @@ int drm_atomic_set_property(struct drm_atomic_stat=
e *state,
>  		break;
>  	}
>  	case DRM_MODE_OBJECT_COLOROP: {
> +		if (!file_priv->plane_color_pipeline) {
> +			drm_dbg_atomic(prop->dev,
> +				       "[OBJECT:%d] is a colorop but DRM_CLIENT_CAP_PLANE_COLOR_PIPE=
LINE not set\n",
> +				       obj->id);
> +			ret =3D -EINVAL;
> +		}
>  		struct drm_colorop *colorop =3D obj_to_colorop(obj);
>  		struct drm_colorop_state *colorop_state;
> =20
> @@ -1170,7 +1192,6 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  		ret =3D drm_atomic_colorop_set_property(colorop,
>  				colorop_state, file_priv,
>  				prop, prop_value);
> -
>  		break;
>  	}
>  	default:
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 44fda68c28ae..0d869658e13e 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -361,6 +361,13 @@ drm_setclientcap(struct drm_device *dev, void *data,=
 struct drm_file *file_priv)
>  			return -EINVAL;
>  		file_priv->writeback_connectors =3D req->value;
>  		break;
> +	case DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE:
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->plane_color_pipeline =3D req->value;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index e1b5b4282f75..bf11b646c898 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -204,6 +204,13 @@ struct drm_file {
>  	 */
>  	bool writeback_connectors;
> =20
> +	/**
> +	 * @plane_color_pipeline:
> +	 *
> +	 * True if client understands plane color pipelines
> +	 */
> +	bool plane_color_pipeline;
> +
>  	/**
>  	 * @was_master:
>  	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 841d393fb84e..2576b170e8d0 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -842,6 +842,21 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20
> +/**
> + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> + *
> + * If set to 1, the DRM core will
> + * - expose plane COLOR_PIPELINE properties for pre-blending color manag=
ement.
> + * - reject setting of these plane properties:
> + *   - COLOR_ENCODING
> + *   - COLOR_RANGE
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is currently in development.
> + */
> +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;


--Sig_/_L+fHxCz1OS0k8AndUknxOV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzDRoACgkQI1/ltBGq
qqfOCQ/9E7dAAd14SduZAGaHkIDdQcApNswELu4RZqTxaOhnULXiRCbvtb6UO57F
1DqJkIl9FgYZEZ4sfAJX3dNbUg3oJCBmoXfR3NJRmzCrKMUNgV1AsTyiVZBNiAMb
g66lYLrAr+lwdrzr0rpG9I1smwHUrgqRp1txNUKLKVANr8jAJ4s71bj/4CvkRsue
qDHNBaDykZgkiqN2TEgLSXO2utTuzdgLzLOB5Qo5PEw27Tzsk9OIqsxUDYbrXfhG
Gr4Cnd2uoOufVgwXSSqwmuH6kut0J6wqfanUF6wgX9J+nPtWN2NpkJ5D5Z6OcuPm
AIkSG/p1bNBxXw7jdJcYclnauFQL1GgF2JL9xvoOMNznx7ARFd+efcNoj/rYu65I
wUPminY1NDqONKoXU0v1jOxVLbmLQSb0ifZM+PDray7qP1xKXU8T2eSy4a/PxKhY
kiqbVWAA6J8Xbfo7ZXchudY91IV2KtD+ZbFlRUd52GaHIXGQ341IuNKkjKgOE5M0
L7w+yf4waeciwM/IMUu/JH5/qe7BDzR99WKLtI0LbZQ4GoBl9UgZe+SNXd6ikLeI
aHpYzN6+meJ0qz9D0elRKkuX6aNdoiLAJpO6/L+XvepUVll1TKSe6wCuQI/H8cy9
DeBitFbh3krYw3Jv/hbBX3ZNmopzssn+0dTzz7TCWQNhQqn7uAY=
=oMsk
-----END PGP SIGNATURE-----

--Sig_/_L+fHxCz1OS0k8AndUknxOV--
