Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACCC509E24
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 12:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA6A10E7A1;
	Thu, 21 Apr 2022 10:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD50110E706
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:59:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so8007153lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=SEtzp/NcukPqfuNyBrocr1mCAd8o+qa80cSE+JqVsZ8=;
 b=kleol6i2EmCeNDy8huPOL5ktwqPxtKXreth5suszmJ81+iJQJE6yOyQMApy+oOZ9uH
 bVGI7zWWBf3iIrA4XqM67EojFqLOVYjVJN2GrRVraMebnosjXlI6ySR140ErUC6tHJ16
 LqV33orWUreRl4YjvwdWW1EdViZJIrAeVlDoXJNzjhCdix12iO20V0npO3Cwg7arJPsP
 2EH2pKHbNMES7kufgXg0sjFOfND/pvix0rxGQ4GWamMkCV/VxIG4QmdEmue3gNvV3+87
 GLxi6q2VCbyvNicUwD6qWRTjoXzeeAoYl8Vqut3BiuiX9JGJrF3B3eP9qXVnyEcNBwvO
 e2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=SEtzp/NcukPqfuNyBrocr1mCAd8o+qa80cSE+JqVsZ8=;
 b=3og67dotfJEKNjQET7ry9IZz8wMFn+l41alMCI+azR8XuJmKPEIYoF+EACMQEiazxF
 FNG+EI7AyPJDEqTK7/H8CMD1cK7tEnl6slHKPWePC1HSR9iliJgNI5LJ9kvxaZa0K1To
 ouLZk6sNzaNWtN4W3OFGBpElIdM+/iPQ/svn4iV1G4kIAavM05nj1Yzv3fiVTe0D/PmM
 tckQG+VwI5hf+y/bV+8/5nM9NwC58qH6JBJQE8oLZJhgRsq99OZajQ64BJC/SOvVneRX
 NNETvMtlL0t4WRLRdeMh+mAA/jki5adt1O/a+vV6dMmR/vHIMNR3O5i2/aR19a3zDRaO
 tPCA==
X-Gm-Message-State: AOAM530BnSeXhs2smRDgbSoJ/rTLlzAmcAs3ip6HrffRQcKcy5RVs3MT
 rcIzj4mo0TCIPfMG3smVMdg=
X-Google-Smtp-Source: ABdhPJy5GLoaNjSaFF1zGEdXBYeDXHSd1HKxA67QoJ5TeCbfpWXxzAO0lUrQ/spz/zqCO4xh4u4HkA==
X-Received: by 2002:a05:6512:12d3:b0:471:a3f7:f68e with SMTP id
 p19-20020a05651212d300b00471a3f7f68emr9905856lfg.75.1650538750608; 
 Thu, 21 Apr 2022 03:59:10 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b0024dc752c8basm756580ljj.48.2022.04.21.03.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 03:59:10 -0700 (PDT)
Date: Thu, 21 Apr 2022 13:58:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220421135859.3403f0ce@eldfell>
In-Reply-To: <20220404204515.42144-10-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-10-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5P_WdP4Jg/5n_bTMEjtxjJM";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/5P_WdP4Jg/5n_bTMEjtxjJM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Apr 2022 17:45:15 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Adds this common format to vkms.
>=20
> This commit also adds new helper macros to deal with fixed-point
> arithmetic.
>=20
> It was done to improve the precision of the conversion to ARGB16161616
> since the "conversion ratio" is not an integer.
>=20
> V3: Adapt the handlers to the new format introduced in patch 7 V3.
> V5: Minor improvements
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c   | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>  3 files changed, 76 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 8d913fa7dbde..4af8b295f31e 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -5,6 +5,23 @@
> =20
>  #include "vkms_formats.h"
> =20
> +/* The following macros help doing fixed point arithmetic. */
> +/*
> + * With Fixed-Point scale 15 we have 17 and 15 bits of integer and fract=
ional
> + * parts respectively.
> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> + * 31                                          0
> + */
> +#define FIXED_SCALE 15

I think this would usually be called a "shift" since it's used in
bit-shifts.

> +
> +#define INT_TO_FIXED(a) ((a) << FIXED_SCALE)
> +#define FIXED_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FIXED_SCALE))
> +#define FIXED_DIV(a, b) ((s32)(((s64)(a) << FIXED_SCALE) / (b)))

A truncating div, ok.

> +/* This macro converts a fixed point number to int, and round half up it=
 */
> +#define FIXED_TO_INT_ROUND(a) (((a) + (1 << (FIXED_SCALE - 1))) >> FIXED=
_SCALE)

Yes.

> +/* Convert divisor and dividend to Fixed-Point and performs the division=
 */
> +#define INT_TO_FIXED_DIV(a, b) (FIXED_DIV(INT_TO_FIXED(a), INT_TO_FIXED(=
b)))

Ok, this is obvious to read, even though it's the same as FIXED_DIV()
alone. Not sure the compiler would optimize that extra bit-shift away...

If one wanted to, it would be possible to write type-safe functions for
these so that fixed and integer could not be mixed up.

> +
>  static int pixel_offset(const struct vkms_frame_info *frame_info, int x,=
 int y)
>  {
>  	return frame_info->offset + (y * frame_info->pitch)
> @@ -112,6 +129,30 @@ static void XRGB16161616_to_argb_u16(struct line_buf=
fer *stage_buffer,
>  	}
>  }
> =20
> +static void RGB565_to_argb_u16(struct line_buffer *stage_buffer,
> +			       const struct vkms_frame_info *frame_info, int y)
> +{
> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> +	u16 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			       stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels++) {
> +		u16 rgb_565 =3D le16_to_cpu(*src_pixels);
> +		int fp_r =3D INT_TO_FIXED((rgb_565 >> 11) & 0x1f);
> +		int fp_g =3D INT_TO_FIXED((rgb_565 >> 5) & 0x3f);
> +		int fp_b =3D INT_TO_FIXED(rgb_565 & 0x1f);
> +
> +		int fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
> +		int fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);

These two should be outside of the loop since they are constants.
Likely no difference for performance because the compiler is probably
doing that already, but I think it would read better.

> +
> +		out_pixels[x].a =3D (u16)0xffff;
> +		out_pixels[x].r =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_r, fp_rb_ratio));
> +		out_pixels[x].g =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_g, fp_g_ratio));
> +		out_pixels[x].b =3D FIXED_TO_INT_ROUND(FIXED_MUL(fp_b, fp_rb_ratio));

Looks good.

> +	}
> +}
> +
> =20
>  /*
>   * The following  functions take an line of argb_u16 pixels from the
> @@ -199,6 +240,31 @@ static void argb_u16_to_XRGB16161616(struct vkms_fra=
me_info *frame_info,
>  	}
>  }
> =20
> +static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
> +			       const struct line_buffer *src_buffer, int y)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u16 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    src_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels++) {
> +		int fp_r =3D INT_TO_FIXED(in_pixels[x].r);
> +		int fp_g =3D INT_TO_FIXED(in_pixels[x].g);
> +		int fp_b =3D INT_TO_FIXED(in_pixels[x].b);
> +
> +		int fp_rb_ratio =3D INT_TO_FIXED_DIV(65535, 31);
> +		int fp_g_ratio =3D INT_TO_FIXED_DIV(65535, 63);

Move these out of the loop.

> +
> +		u16 r =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
> +		u16 g =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
> +		u16 b =3D FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
> +
> +		*dst_pixels =3D cpu_to_le16(r << 11 | g << 5 | b);

Looks good.

You are using signed variables (int, s64, s32) when negative values
should never occur. It doesn't seem wrong, just unexpected.

The use of int in code vs. s32 in the macros is a bit inconsistent as
well.

> +	}
> +}
> +
>  plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>  {
>  	if (format =3D=3D DRM_FORMAT_ARGB8888)
> @@ -209,6 +275,8 @@ plane_format_transform_func get_plane_fmt_transform_f=
unction(u32 format)
>  		return &ARGB16161616_to_argb_u16;
>  	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
>  		return &XRGB16161616_to_argb_u16;
> +	else if (format =3D=3D DRM_FORMAT_RGB565)
> +		return &RGB565_to_argb_u16;
>  	else
>  		return NULL;
>  }
> @@ -223,6 +291,8 @@ wb_format_transform_func get_wb_fmt_transform_functio=
n(u32 format)
>  		return &argb_u16_to_ARGB16161616;
>  	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
>  		return &argb_u16_to_XRGB16161616;
> +	else if (format =3D=3D DRM_FORMAT_RGB565)
> +		return &argb_u16_to_RGB565;

Now it's starting to become clear that a switch statement would be nice.

>  	else
>  		return NULL;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 60054a85204a..94a8e412886f 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -14,14 +14,16 @@
> =20
>  static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_XRGB16161616
> +	DRM_FORMAT_XRGB16161616,
> +	DRM_FORMAT_RGB565
>  };
> =20
>  static const u32 vkms_plane_formats[] =3D {
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
> -	DRM_FORMAT_ARGB16161616
> +	DRM_FORMAT_ARGB16161616,
> +	DRM_FORMAT_RGB565
>  };
> =20
>  static struct drm_plane_state *
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index cb63a5da9af1..98da7bee0f4b 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -16,7 +16,8 @@
>  static const u32 vkms_wb_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
> -	DRM_FORMAT_ARGB16161616
> +	DRM_FORMAT_ARGB16161616,
> +	DRM_FORMAT_RGB565
>  };
> =20
>  static const struct drm_connector_funcs vkms_wb_connector_funcs =3D {

I wonder, would it be possible to add a unit test to make sure that
get_plane_fmt_transform_function() or get_wb_fmt_transform_function()
does not return NULL for any of the listed formats, respectively?
Or is that too paranoid?


Thanks,
pq

--Sig_/5P_WdP4Jg/5n_bTMEjtxjJM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJhOPMACgkQI1/ltBGq
qqfjhBAArEZZmEKRgM1zKTMPXfTxVRzdtldjm6G2RvP6u0bWGEH2qEyehZJ7toFc
/B/Ge0Z2j9FaKfEq7L67B/LlZEwJeyfnmyAmme3OrVG2rpHKNv7HXdq25b5oAb8+
t8AfXlu9hwGDutCKCXtMxV9DUxQYRf47iqkrTVMjgzYB8/ApLAG9o3u86m/peNgm
ew2zGHgtQ7V4Q7XOY/gIOS2ppxbli0AhmvAhG+aLeOMO1EpNHcmephx2yKUzqGpH
fEYghsKFDBB45mkZc/GhdpqF+1M9niUgqVVgQMTvHOp8XngznVuW+hmzGkKXWgmm
eMHV1tupTvHuH6YrQELVcPB5Uhk5GlfaExpjYMKaY2SoRTjuRqZC2pDwrvw9JFNP
ckKBRI74MnMF7f4/2tXPPlc07UdaSVDNeom4sZOqExHuFbpd7172yrqUXP1OTUVq
xvPg6RZRPrDcK9+/6xckRz3Kyu+HKP0T5Wq9VNlICrvx8x2IbSbB3wDjK7W39nrt
bcPlSX8IQoUcLdWN57J88f0wgtznXyx0fwOs6TAyL2bHM1UCu6pGZIuX/nO6kR4U
xbctAU4JppGtlNU6yok7LKqlMBo93wUiZG0Ip2gexs+bVpyuygLVAc6MoPHztoIU
v9pJKcfX1V+c7kS8i6QtrRR/P/C1sTjztAd9G5/XZ9fG7zVsynU=
=7Lim
-----END PGP SIGNATURE-----

--Sig_/5P_WdP4Jg/5n_bTMEjtxjJM--
