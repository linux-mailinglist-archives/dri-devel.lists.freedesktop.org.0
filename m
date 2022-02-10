Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3E54B09F2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8212510E7BB;
	Thu, 10 Feb 2022 09:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CA910E7BB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:50:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z19so9272051lfq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 01:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Ewo7UkcevXjNidde+OgkZTxEzMCxx+gzRJkKQoxCKtg=;
 b=lU/4G1h73gr5P+zt7v9yqa6e7V2ccxv1HVDXlcY18Dcyqei9JWcw28sJRfSYzSVTAn
 67A807eQTT4ArcASmUaRBwnVPlm2I21qJPO8RBgBiWctcMENFhThRpDj2Z+6vn4yQmZb
 Q+Wr0cPOuAjEZ9nZLrmEA+L2RDEFdsfgiFtwCvwA4MWwpmkdD+UBFW0OeC3pz9p9U/1f
 IJ1yPq8xU3Fxmpw+70iKqtXn9K7uD7zTGxtma4W3bgPzvi1/5/TIzA6toswRfBg7wVwu
 6rJTnPNQZrUA1cqoj9mWAkbI9o/EN06GTzKfV3gRYDKhxsTsEYhfZWtNuNJ9AEAuxVAs
 TqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ewo7UkcevXjNidde+OgkZTxEzMCxx+gzRJkKQoxCKtg=;
 b=sANNbYX/GonaXet4JPegIP27qx/TRdyq+MGBKMzEhMZyGFDd2SL/niUTZnFApc4Kuj
 LArFuzVvlwTTOpM6pfZHyQu8lpYBfhAHJYii6KGf2EoQCb4gwrdLfb0HxbvyLoQIivF0
 uDyO3Z2ImCr00EM66+qn0qoOB8NsIJvZwvDe+Ws8SfuhFWejT+G8f2Eqab5OP117Jdyd
 L7t0mLhi13wH1IXDEgsXcZLc7Q1SQoDLF04DTymB84Fmq2epvP3L9REVAUzSVsyRR9IF
 USz47VR2dOjHjf8/jofcVMWHPZ0L0avR9GiqCCpGA/3bBPhkmXPpCDBSo6WtrZKTJt16
 DcIA==
X-Gm-Message-State: AOAM531mBGK8ZwsGQZMV468clD83rvUEfNGqOGR1S9QmI4zAlfPDbYhc
 LrasZR88swtjmfiQAwpdIao=
X-Google-Smtp-Source: ABdhPJzoZQN4BcRv0RrHgNZ/Bj2YVVV2P0hEfoo2Uerq/5CoX5YVRAjhP6CDg+R5wWxsCiFUMSwScQ==
X-Received: by 2002:a05:6512:2289:: with SMTP id
 f9mr4422405lfu.537.1644486643168; 
 Thu, 10 Feb 2022 01:50:43 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x26sm2726927lfn.147.2022.02.10.01.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 01:50:42 -0800 (PST)
Date: Thu, 10 Feb 2022 11:50:39 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 9/9] drm: vkms: Add support to the RGB565 format
Message-ID: <20220210115039.588996bd@eldfell>
In-Reply-To: <20220121213831.47229-10-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-10-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yeE.tQ8RdL/ps.erEH.U42j";
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
 airlied@linux.ie, dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yeE.tQ8RdL/ps.erEH.U42j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jan 2022 18:38:31 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

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

Is it common in the kernel that FP always means fixed-point?

If there is any doubt about that, I'd suggest using "fixed" and "float"
to avoid misunderstandings.

And, since you are not supposed to use floats in the kernel unless you
really really must and you do all the preparations necessary (which you
don't here), maybe replace the "float" with a fraction.

In other words, write a macro that takes (65535, 31) as arguments
instead of a float, when converting to fixed-point. Then you don't have
to use those strange decimal constants either.

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

Are there any guarantees that this will not result in floating-point
CPU instructions being used? Like a compiler error if it did?

Yes, it's a constant expression, but I think there were some funny
rules in C that floating-point operations may not be evaluated at
compile time. Maybe I'm just paranoid?


Thanks,
pq

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


--Sig_/yeE.tQ8RdL/ps.erEH.U42j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIE3/AACgkQI1/ltBGq
qqcMlQ//XjyjaxKXs5/jfyzk6J+Iu/0o2nl6DqY7lusiqAayLdEfhTIZ3p6A9kyE
g+VTj572a+L6BR5//oHcLvwyvv7C00F+LyEBPqh8yWojBmx6wu/w2ZeaMgXj6V+6
k3vBo3UBdgVxnBZwpchok/Zhm70NW1SaHibiD7Uuhk2Dp3tB9oNheRyIpO3JpVqL
QtMI91zbiyBM1yGAtpqQ8VXVHnPTRkniPk/2P1qajWdc5+XxyjKcT6hiDS8E0TY6
giXqAxavgE+F412ft1zophrHBQATxDUXDWQEPcXf+Tmd5sB4WPEZL0QIfRz2lFfp
Trn7scsQF5jwvi64Kb3DqNtK2aMHiZ7C0cu7QpaDk16483DMuQduGiheWRA6tpmi
rHPJQ1Ai8iawQ27ryff2mrSxgz98a+N9YUwOCTVOXUrDBgHlhp/CmHB9Vy6CI0Oi
xD2vxDtdnaLnSIePydHrlec9PPzfSJQubCSXBil7pNtqTLQqGVvYkB5PlumhIWDQ
QnWc9AH6PcI2aVvzTXPTKLn64GqGlktda+ulOFyvW0ZrFJG2yANjbn9wrnumTrdS
EwArfAqbH0NUe6sCUHsv4TKVnkTFQ+vpnS86YUgGrvIXZGvD0RrQNBTV/JVv7+dk
5wj2lQKRQt/lQEZOlrL0NVMuTj3/OE18nEbh+Pao10h00EbvNcQ=
=PSc/
-----END PGP SIGNATURE-----

--Sig_/yeE.tQ8RdL/ps.erEH.U42j--
