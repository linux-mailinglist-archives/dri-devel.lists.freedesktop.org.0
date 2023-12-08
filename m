Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C5180A267
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6019B10EA87;
	Fri,  8 Dec 2023 11:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8259C10E04B;
 Fri,  8 Dec 2023 11:38:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so2282277e87.3; 
 Fri, 08 Dec 2023 03:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702035479; x=1702640279; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=LgKqLrmpL8DkbxTP/Gn/pM7bsT40A3uR3Fi4Lycun3Y=;
 b=fnGeYyW6nEdXn3DkO0mioLxKQISnXMHUsex6+slww3YPjdcBvPVWsbjKAYUQ3a2f/R
 svRvWHqKBsiQqiBOV0jKGzKC26FIM8s9Wcv+isMXDihk0Yt2nqPLXEK2NZyp8nla3qOa
 vxRbC2G4562sor3OmrFgI5HHpcC35aklIZtC1z8ol3Q+0qp+En3HNLFvA4EIu5fpljRW
 GJa8MLQEk+F9bRTQoMU2MYHTir8JS/cIug5qzWdUYl9NNTUovFX9Q5KCxwO6D/CotvP5
 lgQJlQQcyAYjYQ32Drh7e49vXF1qCCqYootAQLjKj5+/TM4XYQP3W54zzjDTCsstOPv/
 gQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035479; x=1702640279;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LgKqLrmpL8DkbxTP/Gn/pM7bsT40A3uR3Fi4Lycun3Y=;
 b=LrwZClb1VGzpbQI19+UdiRirKEzivW0bqDFhwf9fXtieq2Hi7pC5e4ibpPO1xGSJIh
 kSRCw3O96v26iGDiWs3Gwg66ZMvquXHkUpjkcdlevhIBSAKjdL2l3Pzd+JPA0yi/tdvA
 6RcT9+jrTtJQixKb7am3tvesEr4gQ6Q/8wTt5CusPAoCIYLmNIAKakQzUUmMYBDetL5s
 RpK0bphRx74qOZ87IetE/3ieFJJVo893F74LUmkQP9Y0Bh3KrzwaOsw1Mko+E4FRtEHi
 lKccR5YItur7VIRLJI2gJqn3PFZNSUU9Nm5AiOShrA115xQNWT2dRUw+tWNKJffsz/xZ
 OzBg==
X-Gm-Message-State: AOJu0Yzp8cOxR7c28FELuRrTtkFS6D45IDduzCr2B3I/YPg7zEPDsqtK
 K6V4Zi1oB+JmmAKEWpzQk2E=
X-Google-Smtp-Source: AGHT+IFddjBE3PbdEukLb1rx5xQ88oFx1tmWQgZSqidsCCxr7OGAY7VNbU9mqZdjF/oqAxFHNWUECg==
X-Received: by 2002:a05:6512:3a91:b0:50b:d298:2d5b with SMTP id
 q17-20020a0565123a9100b0050bd2982d5bmr2822650lfu.37.1702035478391; 
 Fri, 08 Dec 2023 03:37:58 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u3-20020ac258c3000000b0050c09fc40e0sm189837lfo.243.2023.12.08.03.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:37:58 -0800 (PST)
Date: Fri, 8 Dec 2023 13:37:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v3 08/23] drm/colorop: Add TYPE property
Message-ID: <20231208133753.0f196faa@eldfell>
In-Reply-To: <20231108163647.106853-9-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-9-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=U3V8mw4FSL+LL_lHJlUd.P";
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

--Sig_/=U3V8mw4FSL+LL_lHJlUd.P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Nov 2023 11:36:27 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Add a read-only TYPE property. The TYPE specifies the colorop
> type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
> etc.
>=20
> v3:
>  - Make TYPE a range property
>  - Move enum drm_colorop_type to uapi header
>  - Fix drm_get_colorop_type_name description
>=20
> For now we're only introducing an enumerated 1D LUT type to
> illustrate the concept.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  4 +--
>  drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++-
>  drivers/gpu/drm/drm_colorop.c     | 43 ++++++++++++++++++++++++++++++-
>  include/drm/drm_colorop.h         | 17 +++++++++++-
>  include/uapi/drm/drm_mode.h       |  4 +++
>  5 files changed, 71 insertions(+), 5 deletions(-)
>=20

...

>  static int drm_atomic_set_writeback_fb_for_connector(
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index a295ab96aee1..902b13e300fd 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -32,12 +32,17 @@
> =20
>  /* TODO big colorop doc, including properties, etc. */
> =20
> +static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D {
> +	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +};
> +
>  /* Init Helpers */
> =20
>  int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
> -		     struct drm_plane *plane)
> +		     struct drm_plane *plane, enum drm_colorop_type type)
>  {
>  	struct drm_mode_config *config =3D &dev->mode_config;
> +	struct drm_property *prop;
>  	int ret =3D 0;
> =20
>  	ret =3D drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLORO=
P);
> @@ -46,12 +51,28 @@ int drm_colorop_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> =20
>  	colorop->base.properties =3D &colorop->properties;
>  	colorop->dev =3D dev;
> +	colorop->type =3D type;
>  	colorop->plane =3D plane;
> =20
>  	list_add_tail(&colorop->head, &config->colorop_list);
>  	colorop->index =3D config->num_colorop++;
> =20
>  	/* add properties */
> +
> +	/* type */
> +	prop =3D drm_property_create_range(dev,
> +					DRM_MODE_PROP_IMMUTABLE,
> +					"TYPE", type, type);

Why was this made a range property?

My review comment for the doc patch is wrong, the doc should mention
enum drm_colorop_type.

> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->type_property =3D prop;
> +
> +	drm_object_attach_property(&colorop->base,
> +				   colorop->type_property,
> +				   colorop->type);
> +
>  	return ret;
>  }

...

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 4e3251ff894a..0ebf0f480dc8 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -858,6 +858,10 @@ struct drm_color_lut {
>  	__u16 reserved;
>  };
> =20
> +enum drm_colorop_type {
> +	DRM_COLOROP_1D_CURVE
> +};


Thanks,
pq

--Sig_/=U3V8mw4FSL+LL_lHJlUd.P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVzABEACgkQI1/ltBGq
qqerWA//VcNUtF0PMdlS+P8CaFcZqWv6iuIgXF+r5pCMaQPg9oMMRvqxtH8gKJWf
zz3erDfK1wq9oowlPSFIsW547nt5bjI4YiiCLm9ygR+ZnY9iDDJh0yclSIJNDHAQ
3mW91xHyrEMlpMbgTpk7vyBsqINshW/Y7oiD/ZAILMObg9SGkRrn4kqqZKtDqUeT
JaNh+eS09zn8h+uYe8IZERlCk7X6q94UPHbpLnbE9DhbfsT6S9qt2TvdHSF0cETa
WfIpmqaEIkf3gtlhCP+7g0eRZKDljByF+Sa24TZG3Rw+QuvpFug7MQSoZU4zxoGm
JoPTpPLNDhk6XUm8Xc8je1vNVmgUdHo/7xGWrTaFyyDc9vKFiHEjW5tX1OrtccV6
RWKDYHWwfslaL7WHPws6BN0+Wk+sQDGezJ5uVbrcgceoGpkV++wduYKqWvWf4vQm
PnSGZMy4COo+9Mi+66PNewd8Zr4AHBFwlgR3kGNuAjzVbn8FrcHw2HhDnhKy/noC
xUofbXqkA/nIx5xAq5kFCR2WI8P+X5BwZMBRxMFsXaTZ1stuDlk8oGPtlsCGrUYS
6suKg74VcgYrP5CKMC/08dDMJKYaiIqMtsU0H9c4BVvQvoCW2NR7k2b9t2Fm3kPZ
1q+gJ5hD7kOU3j9Z+cF4bA5NjJsEjvo+paQWPS824PA2JpqUbW4=
=r8oR
-----END PGP SIGNATURE-----

--Sig_/=U3V8mw4FSL+LL_lHJlUd.P--
