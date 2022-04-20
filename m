Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C050891D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD610E70B;
	Wed, 20 Apr 2022 13:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B171410E70B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 13:20:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b21so2955434lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zcEsnh5yyAyD+kHDlv0EPCJ0RW8naOJqKxsVk/vIogY=;
 b=m+fpFcEjHc99nhXxXPzJ2iQBaxWtxhktIQbk2ckm7oC4fGAjKkj630jZN48fDOolAQ
 BsZiLhwTeiN07Ut4gVGZvkE03CVKedxczQbDpe9YFbknZIIOOmHlYzyi1NuZH3otfP5s
 N0VS7rUx8An8CVjQV3SJDz5H4FecerutIyKgSBA7COC4G8jmsrEpRaN8exMSenCHBXMb
 gWBjUXEyEG2rkr2qkyAYOld4rMhghvsHtbbWQkGmoFRvcLu7KTPejaFsffWd+JC32EY2
 fHlgF5IkGxsgKyz10XUmiCiscR4HJNANd79JrTkAfgnO/ObRCgINMvBklV9C9E60h4xo
 K5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zcEsnh5yyAyD+kHDlv0EPCJ0RW8naOJqKxsVk/vIogY=;
 b=wNrVO5kM+1Se0/wRKK9OKqzPt8UVo27s4Ip/+5i3I9spI0qGdqhW/4twpsuP/nEfrP
 W0fZo9SoWZGw5jaySX8SC9zSlY4tZkRWB7V3LeMEgBp2VSmwVjZ+YcnjC2yZRcovrzLM
 vYCGyCkKGpJLcbCn4zSRvoxZzl5XHHYsWx2YAH6L76K0sjEHnUEgEr5MnHjv1iehAPRo
 lkUo2/KLS5PthYqWaTAePzUyWplxiECAS7odkUdpIiWLRZvbSMDWYLgmQqKk/c1PoaGu
 Z0TuijYL17Uxus4QZPia8KZ/Ijr6TR5Za+Frr7pzglZl6WFolqglFZixkSAAAwyE2CVa
 KySA==
X-Gm-Message-State: AOAM531kT1mfvmlrHTipVDO7+ff3CbcHtoSNFxfg52FVOXhA9uQmMvlU
 ANtsVTeVPLLVz4nM8I1QOqM=
X-Google-Smtp-Source: ABdhPJynJ9GtSYZ11GLvQvwl25GnmORSv00LTddpXKwLqV320SDc5CbUkhlIjm++uygoAa9pcLbOlw==
X-Received: by 2002:ac2:4202:0:b0:444:14bf:86dc with SMTP id
 y2-20020ac24202000000b0044414bf86dcmr14509879lfh.126.1650460801801; 
 Wed, 20 Apr 2022 06:20:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bi32-20020a05651c232000b0024dba831e9bsm980588ljb.135.2022.04.20.06.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:20:01 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:19:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 8/9] drm: vkms: Adds XRGB_16161616 and
 ARGB_1616161616 formats
Message-ID: <20220420161958.6b81e7b7@eldfell>
In-Reply-To: <20220404204515.42144-9-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-9-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YHZ/LwM6PcuwhjPxWyemI4k";
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

--Sig_/YHZ/LwM6PcuwhjPxWyemI4k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Apr 2022 17:45:14 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> This will be useful to write tests that depends on these formats.
>=20
> ARGB and XRGB follows the a similar implementation of the former formats.
> Just adjusting for 16 bits per channel.
>=20
> V3: Adapt the handlers to the new format introduced in patch 7 V3.
> V5: Minor improvements
>     Added le16_to_cpu/cpu_to_le16 to the 16 bits color read/writes.
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c   | 77 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c     |  5 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  2 +
>  3 files changed, 83 insertions(+), 1 deletion(-)

Hi,

aside from the comments I already gave on the other patch adding the
*RGB8888 variants that apply here too, this looks good to me, with or
without those changes.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index 931a61405d6a..8d913fa7dbde 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -78,6 +78,41 @@ static void XRGB8888_to_argb_u16(struct line_buffer *s=
tage_buffer,
>  	}
>  }
> =20
> +static void ARGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> +				     const struct vkms_frame_info *frame_info,
> +				     int y)
> +{
> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> +	u16 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			       stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		out_pixels[x].a =3D le16_to_cpu(src_pixels[3]);
> +		out_pixels[x].r =3D le16_to_cpu(src_pixels[2]);
> +		out_pixels[x].g =3D le16_to_cpu(src_pixels[1]);
> +		out_pixels[x].b =3D le16_to_cpu(src_pixels[0]);
> +	}
> +}
> +
> +static void XRGB16161616_to_argb_u16(struct line_buffer *stage_buffer,
> +				     const struct vkms_frame_info *frame_info,
> +				     int y)
> +{
> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> +	u16 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			       stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		out_pixels[x].a =3D (u16)0xffff;
> +		out_pixels[x].r =3D le16_to_cpu(src_pixels[2]);
> +		out_pixels[x].g =3D le16_to_cpu(src_pixels[1]);
> +		out_pixels[x].b =3D le16_to_cpu(src_pixels[0]);
> +	}
> +}
> +
> +
>  /*
>   * The following  functions take an line of argb_u16 pixels from the
>   * src_buffer, convert them to a specific format, and store them in the
> @@ -130,12 +165,50 @@ static void argb_u16_to_XRGB8888(struct vkms_frame_=
info *frame_info,
>  	}
>  }
> =20
> +static void argb_u16_to_ARGB16161616(struct vkms_frame_info *frame_info,
> +				     const struct line_buffer *src_buffer, int y)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u16 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    src_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> +		dst_pixels[3] =3D cpu_to_le16(in_pixels[x].a);
> +		dst_pixels[2] =3D cpu_to_le16(in_pixels[x].r);
> +		dst_pixels[1] =3D cpu_to_le16(in_pixels[x].g);
> +		dst_pixels[0] =3D cpu_to_le16(in_pixels[x].b);
> +	}
> +}
> +
> +static void argb_u16_to_XRGB16161616(struct vkms_frame_info *frame_info,
> +				     const struct line_buffer *src_buffer, int y)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u16 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    src_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> +		dst_pixels[3] =3D (u8)0xffff;
> +		dst_pixels[2] =3D cpu_to_le16(in_pixels[x].r);
> +		dst_pixels[1] =3D cpu_to_le16(in_pixels[x].g);
> +		dst_pixels[0] =3D cpu_to_le16(in_pixels[x].b);
> +	}
> +}
> +
>  plane_format_transform_func get_plane_fmt_transform_function(u32 format)
>  {
>  	if (format =3D=3D DRM_FORMAT_ARGB8888)
>  		return &ARGB8888_to_argb_u16;
>  	else if (format =3D=3D DRM_FORMAT_XRGB8888)
>  		return &XRGB8888_to_argb_u16;
> +	else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> +		return &ARGB16161616_to_argb_u16;
> +	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
> +		return &XRGB16161616_to_argb_u16;
>  	else
>  		return NULL;
>  }
> @@ -146,6 +219,10 @@ wb_format_transform_func get_wb_fmt_transform_functi=
on(u32 format)
>  		return &argb_u16_to_ARGB8888;
>  	else if (format =3D=3D DRM_FORMAT_XRGB8888)
>  		return &argb_u16_to_XRGB8888;
> +	else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> +		return &argb_u16_to_ARGB16161616;
> +	else if (format =3D=3D DRM_FORMAT_XRGB16161616)
> +		return &argb_u16_to_XRGB16161616;
>  	else
>  		return NULL;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 798243837fd0..60054a85204a 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -14,11 +14,14 @@
> =20
>  static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB16161616
>  };
> =20
>  static const u32 vkms_plane_formats[] =3D {
>  	DRM_FORMAT_ARGB8888,
> -	DRM_FORMAT_XRGB8888
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB16161616,
> +	DRM_FORMAT_ARGB16161616
>  };
> =20
>  static struct drm_plane_state *
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 97f71e784bbf..cb63a5da9af1 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -15,6 +15,8 @@
> =20
>  static const u32 vkms_wb_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XRGB16161616,
> +	DRM_FORMAT_ARGB16161616
>  };
> =20
>  static const struct drm_connector_funcs vkms_wb_connector_funcs =3D {

--Sig_/YHZ/LwM6PcuwhjPxWyemI4k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJgCH4ACgkQI1/ltBGq
qqd5Xw/6A//R2fpjRJg5Nqjinloz12Hniu985ZStg6YHpdEVo8KZ4S9fU0isLywb
28k0+kD/89z4i5Nq1MTNjeM6nUlK3Yf6zHQIwjlc2Y/TVEwNU6Hyal/VP5cmshG0
XMkTeSPSLrLwr9/XgeUf+DfQJ4luhpNF+B1KZa+Q5nJ/V85xpEbVMGrvv75AaQLt
txPsV/mYyYFfnnSXk4hfgoVN5yBJsy1meZ6PYBWJgwtSUpFA+myOxQAsv4QGi4D/
Lc+ripwQD1ELQuDffA3tYQFO1kIehS6YP4gnpi107XTYi5YdNCfxHUf9MqFFoTyW
hZIJFnJm+Nk2sZV6CHJwDwKzyBBHtao3Z4EpCqWzj3BuuUHDqShHTaSH1dWnJu/B
ZQAHw06NjEm0wMVn7fiAP4JcMmzsT2CxbJ97dPBK3KLB/bVyejlQRzXkzf3xzRox
+7ZP8da82jenyXT0VXcfH2ux88DuT6LAY7TXxaXuDb8YlLiACSG+AqCDT7BQVTgn
/dSp8UqTeXtKSmHhLJK7OXJmPmlrYPXhx7pIlb4OB6i7LBTBSXCX8auej+q8JMZx
kb0piDw8gl3VPhy9TyPZ7EzA0EakAcX6bLIvvFdcvQHDg4betFtHcxb+2Y5SFRUW
IOoOJIoXd50vMSHDTkFXhEqrEsp2zbMaMn9+9w6VZZ2GkNJoEks=
=jzm8
-----END PGP SIGNATURE-----

--Sig_/YHZ/LwM6PcuwhjPxWyemI4k--
