Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119664AD5D1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE5110E732;
	Tue,  8 Feb 2022 10:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9A510E740
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BP9fjF0hk5eNKzL9ByuRKmIJLSCzvRI5/ZptxKNTQC8=; b=ckdyMyALy3fxsq7kthS8xSAm5B
 Vx71yp96jjAacj5RtYISu7Jot+LDDcDYRu+FzoNzzY6doQ0MN6QXqI282qLsgFepl3jLj8zyQOGKg
 bU01beyqoJL08tVZJv2BAboWisRWoVJYZ/gey6g2lwYu8AP6Py8xaIRvG1irj+fX+XKeAtjj+9gwK
 qUenwUBSzADsBlT8RR/ilAdigELvidLg3TyTpgDDwoFvvMGB9vQvtN0ajMKJ3nXMsgXtY8FMdl3H6
 RtsV78dHLS4e6OkkuQkajUnR/3lBuVDUs15KMh7HHANtlwd67CB8b8TNuwQV1AslR8Q3yM75DK9Yg
 R6lXAIAQ==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHO4h-000749-Vw; Tue, 08 Feb 2022 11:50:20 +0100
Date: Tue, 8 Feb 2022 09:50:07 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220208105007.4apfxd5cdjfxvkes@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-10-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fkoztdzonx2mp32o"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-10-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fkoztdzonx2mp32o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> Adds this common format to vkms.
>=20
> This commit also adds new helper macros to deal with fixed-point
> arithmetic.
>=20
> It was done to improve the precision of the conversion to ARGB16161616
> since the "conversion ratio" is not an integer.
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V3: Adapt the handlers to the new format introduced in patch 7 V3.
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c   | 74 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  6 +++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
>  4 files changed, 86 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 661da39d1276..dc612882dd8c 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,6 +11,8 @@ format_transform_func get_fmt_transform_function(u32 fo=
rmat)
>  		return &get_ARGB16161616;
>  	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
>  		return &XRGB16161616_to_ARGB16161616;
> +	else if (format =3D=3D DRM_FORMAT_RGB565)
> +		return &RGB565_to_ARGB16161616;
>  	else
>  		return &XRGB8888_to_ARGB16161616;
>  }
> @@ -23,6 +25,8 @@ format_transform_func get_wb_fmt_transform_function(u32=
 format)
>  		return &convert_to_ARGB16161616;
>  	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
>  		return &convert_to_XRGB16161616;
> +	else if (format =3D=3D DRM_FORMAT_RGB565)
> +		return &convert_to_RGB565;
>  	else
>  		return &convert_to_XRGB8888;
>  }
> @@ -33,6 +37,26 @@ static int pixel_offset(struct vkms_frame_info *frame_=
info, int x, int y)
>  				  + (x * frame_info->cpp);
>  }
> =20
> +/*
> + * FP stands for _Fixed Point_ and **not** _Float Point_
> + * LF stands for Long Float (i.e. double)
> + * The following macros help doing fixed point arithmetic.
> + */
> +/*
> + * With FP scale 15 we have 17 and 15 bits of integer and fractional par=
ts
> + * respectively.
> + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> + * 31                                          0
> + */
> +#define FP_SCALE 15
> +
> +#define LF_TO_FP(a) ((a) * (u64)(1 << FP_SCALE))
> +#define INT_TO_FP(a) ((a) << FP_SCALE)
> +#define FP_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FP_SCALE))
> +#define FP_DIV(a, b) ((s32)(((s64)(a) << FP_SCALE) / (b)))
> +/* This macro converts a fixed point number to int, and round half up it=
 */
> +#define FP_TO_INT_ROUND_UP(a) (((a) + (1 << (FP_SCALE - 1))) >> FP_SCALE)
> +
>  /*
>   * packed_pixels_addr - Get the pointer to pixel of a given pair of coor=
dinates
>   *
> @@ -125,6 +149,33 @@ void XRGB16161616_to_ARGB16161616(struct vkms_frame_=
info *frame_info, int y,
>  	}
>  }
> =20
> +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			    struct line_buffer *stage_buffer)
> +{
> +	u16 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D drm_rect_width(&frame_info->dst);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels++) {
> +		u16 rgb_565 =3D le16_to_cpu(*src_pixels);
> +		int fp_r =3D INT_TO_FP((rgb_565 >> 11) & 0x1f);
> +		int fp_g =3D INT_TO_FP((rgb_565 >> 5) & 0x3f);
> +		int fp_b =3D INT_TO_FP(rgb_565 & 0x1f);
> +
> +		/*
> +		 * The magic constants is the "conversion ratio" and is calculated
> +		 * dividing 65535(2^16 - 1) by 31(2^5 -1) and 63(2^6 - 1)
> +		 * respectively.
> +		 */
> +		int fp_rb_ratio =3D LF_TO_FP(2114.032258065);
> +		int fp_g_ratio =3D LF_TO_FP(1040.238095238);
> +
> +		stage_buffer[x].a =3D (u16)0xffff;
> +		stage_buffer[x].r =3D FP_TO_INT_ROUND_UP(FP_MUL(fp_r, fp_rb_ratio));
> +		stage_buffer[x].g =3D FP_TO_INT_ROUND_UP(FP_MUL(fp_g, fp_g_ratio));
> +		stage_buffer[x].b =3D FP_TO_INT_ROUND_UP(FP_MUL(fp_b, fp_rb_ratio));
> +	}
> +}
> +
I don't know if there is a testcase in IGT check this conversion, did
you use anyone here? Does it enables any other testcase?

Thanks,

Melissa
> =20
>  /*
>   * The following  functions take an line of ARGB16161616 pixels from the
> @@ -203,3 +254,26 @@ void convert_to_XRGB16161616(struct vkms_frame_info =
*frame_info, int y,
>  		dst_pixels[0] =3D src_buffer[x].b;
>  	}
>  }
> +
> +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
> +		       struct line_buffer *src_buffer)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u16 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	int x_limit =3D drm_rect_width(&frame_info->dst);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels++) {
> +		int fp_r =3D INT_TO_FP(src_buffer[x].r);
> +		int fp_g =3D INT_TO_FP(src_buffer[x].g);
> +		int fp_b =3D INT_TO_FP(src_buffer[x].b);
> +
> +		int fp_rb_ratio =3D LF_TO_FP(2114.032258065);
> +		int fp_g_ratio =3D LF_TO_FP(1040.238095238);
> +
> +		u16 r =3D FP_TO_INT_ROUND_UP(FP_DIV(fp_r, fp_rb_ratio));
> +		u16 g =3D FP_TO_INT_ROUND_UP(FP_DIV(fp_g, fp_g_ratio));
> +		u16 b =3D FP_TO_INT_ROUND_UP(FP_DIV(fp_b, fp_rb_ratio));
> +
> +		*dst_pixels =3D cpu_to_le16(r << 11 | g << 5 | b);
> +	}
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> index 22358f3a33ab..836d6e43ea90 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -21,6 +21,9 @@ void get_ARGB16161616(struct vkms_frame_info *frame_inf=
o, int y,
>  void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info, in=
t y,
>  				  struct line_buffer *stage_buffer);
> =20
> +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			    struct line_buffer *stage_buffer);
> +
>  void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
>  			 struct line_buffer *src_buffer);
> =20
> @@ -33,6 +36,9 @@ void convert_to_ARGB16161616(struct vkms_frame_info *fr=
ame_info, int y,
>  void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
>  			     struct line_buffer *src_buffer);
> =20
> +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
> +		       struct line_buffer *src_buffer);
> +
>  typedef void (*format_transform_func)(struct vkms_frame_info *frame_info=
, int y,
>  				      struct line_buffer *buffer);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 1d70c9e8f109..4643eefcdf29 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -13,14 +13,16 @@
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
> index 393d3fc7966f..1aaa630090d3 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -15,7 +15,8 @@
>  static const u32 vkms_wb_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_XRGB16161616,
> -	DRM_FORMAT_ARGB16161616
> +	DRM_FORMAT_ARGB16161616,
> +	DRM_FORMAT_RGB565
>  };
> =20
>  static const struct drm_connector_funcs vkms_wb_connector_funcs =3D {
> --=20
> 2.30.2
>=20

--fkoztdzonx2mp32o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICSt4ACgkQwqF3j0dL
ehySMhAAih1kWsFWb6LimLSE0iTyZCjXk8nmucxJxmmZAgRDfafu7yHwkphZcCOr
uBqcKQYfMRSHRdNbkbr6ubMOdpOVBcQmeGPYZDYu0VH9Av+5sNFDHjYUtsqKiTrT
zUHdi64DXn/g8Q/Q3gCoMY+IJL3uXA8GC90KPMpdY4Jg2VgQZs+yldGgr6ne/XGk
IXr+wiSb6QokWcIzw5Vuj4gIB7iddT2zCmrthJ3SCbtLVfU9Ri2AYP+i8JgeNF4c
414RSFdAEI3QYlx9eBCqN9uMNTsAxQgGNeAd4Krdy4lIGOFfSwKSwCoMgh2K1J8b
9X7P2cpoik+f22ssJFFHrRUMZpgAt9ZyC/Kfz2Jykk3BuqO3gLyIvLmWoJ00R5Rh
hZzSn2cRJ4m7tVDK02YU6DZhmQBoJKKd4AU9jsFslM11cCHVJZ+8ZJrN8p9RRdIR
gEbIJpXAbSSJzEJvYHku2rKiDMkAme5HfCJ5WMXPt0h5OCx9zWzccpJSBN3++N72
yH2+y9OgWjHfP7u6jRTkM9rRkEryF95OoINHUR1i+1QRj/EZbYz0pFqd+zeJSYzG
wtBxH9OkANnvz3JUfo6UXFSHXfxU26E3p3WIqGZyBUTE1/brc3bdXVgSpHaH71gl
mZYUafbt/6wGD5cdw2p7pZptgM5+cOqIRSfggCi3NiEsnnaRuH0=
=kFLR
-----END PGP SIGNATURE-----

--fkoztdzonx2mp32o--
