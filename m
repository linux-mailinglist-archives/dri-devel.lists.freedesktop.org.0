Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A236AF68
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 10:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD03A6E07D;
	Mon, 26 Apr 2021 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8256E07D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 08:03:20 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d15so11723651ljo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ibd5m0NVy+Q/WWEypLq65/u5FnE7hfTBxbEy1QdBFw0=;
 b=MJib50409toQ/oeKwry9wRDyoQmzw5mi47spVp9SgaH4VaAlDSaHyjjJRnEJxakmBZ
 1kQkHng1Nxkm1I0bnm0Tycw+lqHexN5zCQShXZvZ2cirKCVhqt81f+NP694dgKb2JfjM
 E/usCnoFTYBUlxW5EeLL/d9SnbtOFdZT+LfmTPCeJn9Rm2JE3psi8eOlqez6eTF1YZ0Q
 u6sfuu41NMobO2c00WCb2qjoOjjxo1Io3xsChHJDVfIi0gAE2W06+NM6QUJCZhZvjIrz
 2cLL7xNU4MQYm31Zoc4lPPysdAl/DwEpIDvfZwHoTIA74dd0a9+JjpqkWz1jmlUWjtFD
 MV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ibd5m0NVy+Q/WWEypLq65/u5FnE7hfTBxbEy1QdBFw0=;
 b=t/E2duNgQ8kqiZ49vWcECkoskm/REOPPhtlyotONDAhwQO/Iy0y5I2ratUxEOapRev
 SIg8CfUAscUEgYGnbH/hcazv9sMmcru2xudfvH5u9aeeW/8ZZGo8cspTtZCXWoZBkf3N
 FsW0gSR+TLSDi2egUCVvz9YpeMrGaK6uWRntCwt/bNW4oYE+/TY+ktDMRzrDAz7+nwXi
 k9UpU3GGJMdbYGgSlp5B2wy5wwmytD4hKcY4OLPGGG5YGKtSkW29GBHEjZYQcW9X1itw
 CjGZVXNofbrWuFWxvRe2+16b72Gp3C7tW2JfQiJzaxiDHNEpVdQ/1zMpsGfYTMM9yUzc
 BnbA==
X-Gm-Message-State: AOAM533QyI4bifo0H+NTImsegb0/BZIY2vfbK4Xv7Zzad7CJVeNi8Cdj
 N19vi7KHd7xgE0qHMv5vC4A=
X-Google-Smtp-Source: ABdhPJweeG1bArDhfyRKBopD9Bkp5xLIaKz0yvBtg31U6hoj2wkBa4zWpMib/i8s6YMo97Sli1sIkw==
X-Received: by 2002:a05:651c:50b:: with SMTP id
 o11mr11795571ljp.323.1619424198658; 
 Mon, 26 Apr 2021 01:03:18 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l11sm1329394lfg.99.2021.04.26.01.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 01:03:18 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:03:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/vkms: add XRGB planes composition
Message-ID: <20210426110315.4e64d589@eldfell>
In-Reply-To: <07bcf4643d11da9480599fe1b165e478bff58b25.1619250933.git.melissa.srw@gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
 <07bcf4643d11da9480599fe1b165e478bff58b25.1619250933.git.melissa.srw@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0403893880=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0403893880==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1rN.kLLq/wsYEe=kCNwIKAn"; protocol="application/pgp-signature"

--Sig_/1rN.kLLq/wsYEe=kCNwIKAn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Apr 2021 05:25:31 -0300
Melissa Wen <melissa.srw@gmail.com> wrote:

> Add support for composing XRGB888 planes in addition to the ARGB8888
> format. In the case of an XRGB plane at the top, the composition consists
> of copying the RGB values of a pixel from src to dst and clearing alpha
> channel, without the need for alpha blending operations for each pixel.
>=20
> Blend equations assume a completely opaque background, i.e., primary plane
> is not cleared before pixel blending but alpha channel is explicitly
> opaque (a =3D 0xff). Also, there is room for performance evaluation in
> switching pixel blend operation according to the plane format.
>=20
> v4:
> - clear alpha channel (0xff) after blend color values by pixel
> - improve comments on blend ops to reflect the current state
> - describe in the commit message future improvements for plane composition
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 56 ++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++--
>  2 files changed, 48 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 02642801735d..7e01bc39d2a1 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -4,6 +4,7 @@
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -64,7 +65,17 @@ static u8 blend_channel(u8 src, u8 dst, u8 alpha)
>  	return new_color;
>  }
> =20
> -static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
> +/**
> + * alpha_blend - alpha blending equation
> + * @argb_src: src pixel on premultiplied alpha mode
> + * @argb_dst: dst pixel completely opaque
> + *
> + * blend pixels using premultiplied blend formula. The current DRM assum=
ption
> + * is that pixel color values have been already pre-multiplied with the =
alpha
> + * channel values. See more drm_plane_create_blend_mode_property(). Also=
, this
> + * formula assumes a completely opaque background.
> + */
> +static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
>  {
>  	u8 alpha;
> =20
> @@ -72,8 +83,16 @@ static void alpha_blending(const u8 *argb_src, u8 *arg=
b_dst)
>  	argb_dst[0] =3D blend_channel(argb_src[0], argb_dst[0], alpha);
>  	argb_dst[1] =3D blend_channel(argb_src[1], argb_dst[1], alpha);
>  	argb_dst[2] =3D blend_channel(argb_src[2], argb_dst[2], alpha);
> -	/* Opaque primary */
> -	argb_dst[3] =3D 0xFF;
> +}
> +
> +/**
> + * x_blend - blending equation that ignores the pixel alpha
> + *
> + * overwrites RGB color value from src pixel to dst pixel.
> + */
> +static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
> +{
> +	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);

Hi,

this function very clearly assumes a very specific pixel format on both
source and destination. I think it would be good if the code comments
called out exactly which DRM_FORMAT_* they assume. This would be good
to do on almost every function that makes such assumptions. I believe that
would help code readability, and also point out explicitly which things
need to be fixed when you add support for even more pixel formats.

"xrgb" and "argb" are IMO too vague. You might be referring to
DRM_FORMAT_XRGB* and DRM_FORMAT_ARGB*, or maybe you are referring to any
pixel format that happens to have or not have an alpha channel in
addition to the three RGB channels in some order and width.

Being explicit that these refer to specific DRM_FORMAT_* should also
help understanding how things work on big-endian CPUs. My current
understanding is that this memcpy is correct also on big-endian, given
DRM_FORMAT_XRGB8888.

Hmm, or rather, is this particular function intended to be general in
the sense that the order of RGB channels does not matter as long as it's
the same in both source and destination? Which would mean I had a wrong
assumption from the start.

>  }
> =20
>  /**
> @@ -82,16 +101,20 @@ static void alpha_blending(const u8 *argb_src, u8 *a=
rgb_dst)
>   * @vaddr_src: source address
>   * @dst_composer: destination framebuffer's metadata
>   * @src_composer: source framebuffer's metadata
> + * @pixel_blend: blending equation based on plane format
>   *
> - * Blend the vaddr_src value with the vaddr_dst value using the pre-mult=
iplied
> - * alpha blending equation, since DRM currently assumes that the pixel c=
olor
> - * values have already been pre-multiplied with the alpha channel values=
. See
> - * more drm_plane_create_blend_mode_property(). This function uses buffe=
r's
> - * metadata to locate the new composite values at vaddr_dst.
> + * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
> + * equation according to the plane format and clearing alpha channel to =
an
> + * completely opaque background. This function uses buffer's metadata to=
 locate
> + * the new composite values at vaddr_dst.
> + *
> + * TODO: completely clear the primary plane (a =3D 0xff) before starting=
 to blend
> + * pixel color values
>   */
>  static void blend(void *vaddr_dst, void *vaddr_src,
>  		  struct vkms_composer *dst_composer,
> -		  struct vkms_composer *src_composer)
> +		  struct vkms_composer *src_composer,
> +		  void (*pixel_blend)(const u8 *, u8 *))
>  {
>  	int i, j, j_dst, i_dst;
>  	int offset_src, offset_dst;
> @@ -119,7 +142,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> =20
>  			pixel_src =3D (u8 *)(vaddr_src + offset_src);
>  			pixel_dst =3D (u8 *)(vaddr_dst + offset_dst);
> -			alpha_blending(pixel_src, pixel_dst);
> +			pixel_blend(pixel_src, pixel_dst);
> +			/* clearing alpha channel (0xff)*/
> +			memset(vaddr_dst + offset_dst + 3, 0xff, 1);

A one byte memset?

Wouldn't pixel_dst[3] =3D 0xff; be more clear?


Thanks,
pq

>  		}
>  		i_dst++;
>  	}
> @@ -131,6 +156,8 @@ static void compose_plane(struct vkms_composer *prima=
ry_composer,
>  {
>  	struct drm_gem_object *plane_obj;
>  	struct drm_gem_shmem_object *plane_shmem_obj;
> +	struct drm_framebuffer *fb =3D &plane_composer->fb;
> +	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> =20
>  	plane_obj =3D drm_gem_fb_get_obj(&plane_composer->fb, 0);
>  	plane_shmem_obj =3D to_drm_gem_shmem_obj(plane_obj);
> @@ -138,8 +165,13 @@ static void compose_plane(struct vkms_composer *prim=
ary_composer,
>  	if (WARN_ON(!plane_shmem_obj->vaddr))
>  		return;
> =20
> -	blend(vaddr_out, plane_shmem_obj->vaddr,
> -	      primary_composer, plane_composer);
> +	if (fb->format->format =3D=3D DRM_FORMAT_ARGB8888)
> +		pixel_blend =3D &alpha_blend;
> +	else
> +		pixel_blend =3D &x_blend;
> +
> +	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
> +	      plane_composer, pixel_blend);
>  }
> =20
>  static int compose_active_planes(void **vaddr_out,
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 135140f8e87a..da4251aff67f 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -16,8 +16,9 @@ static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
>  };
> =20
> -static const u32 vkms_cursor_formats[] =3D {
> +static const u32 vkms_plane_formats[] =3D {
>  	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888
>  };
> =20
>  static struct drm_plane_state *
> @@ -200,8 +201,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device=
 *vkmsdev,
>  	int nformats;
> =20
>  	if (type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> -		formats =3D vkms_cursor_formats;
> -		nformats =3D ARRAY_SIZE(vkms_cursor_formats);
> +		formats =3D vkms_plane_formats;
> +		nformats =3D ARRAY_SIZE(vkms_plane_formats);
>  		funcs =3D &vkms_primary_helper_funcs;
>  	} else {
>  		formats =3D vkms_formats;


--Sig_/1rN.kLLq/wsYEe=kCNwIKAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCGc8MACgkQI1/ltBGq
qqfOeg//UsPs0vCT+v0URwk8hFj3E4kuR9uAdQP0OnaQ9AicSqKkhMsufvmU2n3V
6fkMCofhWUIfTlVFCUOuMOF+dpsyd1id9Z+tuUPbAVqSv08CPxYp8VsKZAgcmuT3
2FcS4jDYOI1QQQnt7K20xdMHYLLxHUYFNmcjTDYNQpm2lUNoAl90VulICxTLPcmb
plhWi8FQbk6wj03vsyJ8B/0P6TX24efBuPNzfQfgMqvCh9LOOF5Lz/dJVGTsNSox
htssPQBwBiObidMXdxS4BAIO5/+nPS2491mz62fCsJ5f4m4jYmcnsdYT7DZfVJBx
84iR/19o8+5Bwzeyb6CyQCWwkdyFqJA/HCr+66yJGlDHvoBVO7s8MfMVTiz41EBA
7jxU0PbHyTwKppLA8aDIDE4i5as8lQfnc8HymQtZLA+D0r75E5JvnuiaLCaLyntY
SAUCXbbZ368WoqEssUvHQlmYz2B1B3tBySCS0GwQ+/igCaEDlT60ksX0mAKMSO++
ypU4tiLEifH81U0t91wM38ypujjwnKZO2kBoY7tpQ9C+QX5g0DLyLhKa0qCzu6i4
BnpIP8V27NH++v7MfYlvwrBUHQ+9Sov/FFOWR4G3MgzLdAZ+GP+NpIh/ed4vXQZ0
fFMqqDIk0FLAvqlr5h5/cpvqcBu0wixGQq/h+/w4/x6J5XT/I8I=
=u50n
-----END PGP SIGNATURE-----

--Sig_/1rN.kLLq/wsYEe=kCNwIKAn--

--===============0403893880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0403893880==--
