Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851D80A27F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910F10E278;
	Fri,  8 Dec 2023 11:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C10610E275;
 Fri,  8 Dec 2023 11:44:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cb20b965dbso8671221fa.1; 
 Fri, 08 Dec 2023 03:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702035890; x=1702640690; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=84AQRl0IH6Nw4VunHVxTTXfmzWVVV/53BGZ6iHHbBZk=;
 b=VcYMDFLylKIL1HqfTaHbAUH21utSbowYZ0DYSNa2W27rHSsDbCIcNznJy8vBsWmdW+
 +2UCiZjbvcuY9t4ho8MeSspF+xWCWStsZ8X1dAxM+jbYOvvNaSQIrVW8LQN5fQttzPtv
 BxPajP2ELuqzT9OpezQKo+Q+NOYBtioxxky0RKe54wOAf9N8PQZCBjoNOfJjSpMlpgb7
 tHnkOKA3umEk3MzAokHmx+6sHjtj7BQcxQPDGA50UsniLqxNjYyBHepQIFjg1omO63tk
 n6+XZcnTHKwwFZ7+LzvNs2zLwxXz8qaj7CgkQPnZ25bcPh+lqPSwFDK8wm6Ih/uDsodX
 BEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035890; x=1702640690;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84AQRl0IH6Nw4VunHVxTTXfmzWVVV/53BGZ6iHHbBZk=;
 b=fbF1P1Pk3D3/M6IjD8YSNTI74JDI4cyWMHvO8ODEw+5UJEz4dF9lhTGM+z3wCVN+U0
 z9mgQsBIFpHQfLz8Jpfhc11kMrktUmbR5+9mLqY6DqJ203uOv8UuGW6+KShAd6PqrtCp
 ZV6w/C1aGfh0fyl9VGXQFk5zzUBMdjZtG3hiS76VwDFJHViHMn2ViC1ogMH14MCse/kD
 d3bD5WNQAZoZTZfgoQk7g4sscFKx2QQl4Sa20qVlkYtDTgeT8SIhhjQgSmkF9I27TPMN
 ihd+Yt2O+pspvbLGJzkgFUv2jzutcnZrRmxGbdD0TDvYqFzKTKV5I4E9DLksNpY+KdeA
 ho+g==
X-Gm-Message-State: AOJu0YyJn36u8nK5qLovP++qyUEEg9eueKZY4SD3a4PzAV2r+N0FMgzE
 bGWevUCMUfIYnrxUZNZnew8=
X-Google-Smtp-Source: AGHT+IHRJWThw3HQEhbkobkGZh2/LAf1fyVN8P4HwlnevAwS9aN0twp2pjWQvH1Lyuf3WB9gYdc+Rg==
X-Received: by 2002:a2e:9d94:0:b0:2c9:fda2:9ffc with SMTP id
 c20-20020a2e9d94000000b002c9fda29ffcmr1185872ljj.36.1702035889469; 
 Fri, 08 Dec 2023 03:44:49 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a13-20020a2e980d000000b002c9e7ce85ccsm196894ljj.104.2023.12.08.03.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:44:49 -0800 (PST)
Date: Fri, 8 Dec 2023 13:44:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 09/23] drm/color: Add 1D Curve subtype
Message-ID: <20231208134445.761ec4a5@eldfell>
In-Reply-To: <20231108163647.106853-10-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-10-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kXI7wH566YB=CveBld9hXbx";
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

--Sig_/kXI7wH566YB=CveBld9hXbx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:28 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++----
>  drivers/gpu/drm/drm_colorop.c     | 39 +++++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         | 20 ++++++++++++++++
>  3 files changed, 72 insertions(+), 5 deletions(-)
>=20

...

> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 902b13e300fd..b1c271f90a16 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -36,6 +36,11 @@ static const struct drm_prop_enum_list drm_colorop_typ=
e_enum_list[] =3D {
>  	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
>  };
> =20
> +static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_li=
st[] =3D {
> +	{ DRM_COLOROP_1D_CURVE_SRGB_EOTF, "sRGB EOTF" },
> +	{ DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF, "sRGB Inverse EOTF" },
> +};
> +
>  /* Init Helpers */
> =20
>  int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> @@ -73,6 +78,20 @@ int drm_colorop_init(struct drm_device *dev, struct dr=
m_colorop *colorop,
>  				   colorop->type_property,
>  				   colorop->type);
> =20
> +	/* curve_1d_type */
> +	/* TODO move to mode_config? */
> +	prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"CURVE_1D_TYPE",
> +					drm_colorop_curve_1d_type_enum_list,
> +					ARRAY_SIZE(drm_colorop_curve_1d_type_enum_list));
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->curve_1d_type_property =3D prop;
> +	drm_object_attach_property(&colorop->base,
> +				   colorop->curve_1d_type_property,
> +				   0);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_colorop_init);
> @@ -177,6 +196,11 @@ static const char * const colorop_type_name[] =3D {
>  	[DRM_COLOROP_1D_CURVE] =3D "1D Curve",
>  };
> =20
> +static const char * const colorop_curve_1d_type_name[] =3D {
> +	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
> +	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
> +};

Can't you use drm_colorop_curve_1d_type_enum_list to avoid duplicating the =
same?


> +
>  /**
>   * drm_get_colorop_type_name - return a string for colorop type
>   * @type: colorop type to compute name of
> @@ -191,3 +215,18 @@ const char *drm_get_colorop_type_name(enum drm_color=
op_type type)
> =20
>  	return colorop_type_name[type];
>  }
> +
> +/**
> + * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
> + * @range: 1d curve type to compute name of
> + *
> + * In contrast to the other drm_get_*_name functions this one here retur=
ns a
> + * const pointer and hence is threadsafe.
> + */
> +const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d=
_type type)
> +{
> +	if (WARN_ON(type >=3D ARRAY_SIZE(colorop_curve_1d_type_name)))
> +		return "unknown";
> +
> +	return colorop_curve_1d_type_name[type];
> +}
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 0386440afe40..965db7ec488f 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -30,6 +30,11 @@
>  #include <drm/drm_mode.h>
>  #include <drm/drm_property.h>
> =20
> +enum drm_colorop_curve_1d_type {
> +	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
> +	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF
> +};

...


Thanks,
pq

--Sig_/kXI7wH566YB=CveBld9hXbx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzAa0ACgkQI1/ltBGq
qqf1TxAAlu8tDWgGMvcEigR+cc8zW6FlJ/ouiqFL+ht5ABsfQAm5Jv1lcvRjMpNh
FiTaA3zeEUaBJZbKvm2l2NRJDrQ8Ga20tCeQKs8M472JHjrnMgEOLXajMn2j9bE4
U1uoCg52p5LVayzwK1Yj3c3NEoDdJPPsnvdWy9JbpNEjyWH+5uZB1i0ISGqNK2Nd
0hWFNtbNwFNOCR50bSWaiktkM4TI1XjDgkNUO4xTd/0zjHCj4FuJcizLM1Hm3nve
1kJv9lUcCGrl1xuPBN9egy8mOcCNDeDhXRShoWciWmqDWRG+NDlSl2T6gpkjH+Gw
vJR5tbGHsLOz5j19u7mfJ63B81AuLrrG8nND/bxGG7/pc4934gosxTiJYcq4mbR5
QjvIqClWigPkeIc6hELjWNNzR9ys8KmH1no2DxPiMd4jITBnWzIlX16f4ImqDwOY
hZnJW6J5MY7YDYDET8Hddzu2NATXZ2yt36d1PplMLaeeZ11OlRHcdwXg/MumqKan
cEaO5u/fBUURUFwt3CfoGGn1dfWMEh9TTdhPxXQpRw4XjwVJayyZtr3l36epEWko
V3TRvH+hPyjPTCeVzuPCdAtG9pieap0WoWrWqO8+rRPdHCbNV63T0R8WOR3IN8sY
wNZ58UGBcVUQqmT6EJXE6fts+8zwbkDAZBzeiY96NStMdNT9TAM=
=1wLc
-----END PGP SIGNATURE-----

--Sig_/kXI7wH566YB=CveBld9hXbx--
