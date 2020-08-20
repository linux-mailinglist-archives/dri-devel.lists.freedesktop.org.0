Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB724B022
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655DF6E8B9;
	Thu, 20 Aug 2020 07:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918A56E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 07:28:56 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f26so974080ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7f5yNRNtGPYUKKCGBYNg8F2v114ZbXfSX/NAgUOcJo8=;
 b=OfqVHJkeCh8cx66B/lW7Gg4Gk1yC2Hum95XL4wZAxMiy+JNHwG1Ui/TiI49sGpwWqi
 UQ+FH1dP8d6St1fnpzZfIM16slts5wEEFMYgBTumbEKWTX6MhuofXHUX5JftiAelLhcl
 6OcHT527ToUL8Dw97pLN9sLGZZynd0l0JpkE6k8pHSiU5o66BzLIXNiF6W448h0VNCsO
 wO2HzXun2Y/EY35QdfjHVAecCCUmJLQD40nfOt9jTxBc/aoC7L33JwpNUaU9LtegkIPX
 iPwsUVP5MNvZXmPyzf81ymzXnSxtLeAB0ewrkUGinBzkJv8qaT+Z1BnoRFVo2l+SF87n
 02cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7f5yNRNtGPYUKKCGBYNg8F2v114ZbXfSX/NAgUOcJo8=;
 b=Vh6CXpRhm5MZg5CJkWwltDpyhZ2BhzYUZ4aboX+xNbSmp6YknSDbUixP8d2wVPq8SP
 vT/dCg+qfleF58YbdEIdq91TKKaI53vDUwi9yU3Qll+aAYsQ2Q3LNKlM6BVXGumH/AKg
 SRcclCn1YX99TG+vRPa9qp3EXop2TPiA89Gm0qD/2ObViSQGnPaf8eB7ahM/AsVdVVbS
 JsavsdbiqsJOOnzymxgBhufMfc/dXoZX2gAiHcbhYdgL5Wkb1HWGMRX4R22FldrqQJgy
 cOFy6m7vAalHLMSiylmXaU3B5dz4hVWGiW84kH856FKgHa7ryQbzIaXRRztWXGDPzIX4
 OUAA==
X-Gm-Message-State: AOAM531pcGHL1zSSnVEgP2K07hxzgzm/ITGRZhyZcGZJKrKvpNFDEEJ6
 j0C3DW+yTopnUWsmg1/QuYc=
X-Google-Smtp-Source: ABdhPJx3yvY7XvCq1onnq+Uj983GGOn8m/nuUyZHN+E9fVxqTXLGv69oyy9k6/mt7UdRyGpOTL8Y+g==
X-Received: by 2002:a2e:b4f4:: with SMTP id s20mr876729ljm.339.1597908534962; 
 Thu, 20 Aug 2020 00:28:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v14sm276178ljk.10.2020.08.20.00.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 00:28:24 -0700 (PDT)
Date: Thu, 20 Aug 2020 10:27:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add alpha-premultiplied color blending
Message-ID: <20200820102449.15422be1@eldfell>
In-Reply-To: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
References: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: multipart/mixed; boundary="===============0241368899=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0241368899==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jZgsubamSNYuWNRbgMYgLRG"; protocol="application/pgp-signature"

--Sig_/jZgsubamSNYuWNRbgMYgLRG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Aug 2020 17:53:36 -0300
Melissa Wen <melissa.srw@gmail.com> wrote:

> The current VKMS blend function ignores alpha channel and just overwrites
> vaddr_src with vaddr_dst. This XRGB approach triggers a warning when
> running the kms_cursor_crc/cursor-alpha-transparent test case. In IGT
> tests, cairo_format_argb32 uses premultiplied alpha (according to
> documentation), so this patch considers premultiplied alpha colors to
> compose vaddr_src with vaddr_dst.
>=20
> This change removes the following cursor-alpha-transparent warning:
> Suspicious CRC: All values are 0.
>=20
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 43 +++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 4f3b07a32b60..6aac962d3e2e 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -32,8 +32,6 @@ static uint32_t compute_crc(void *vaddr_out, struct vkm=
s_composer *composer)
>  			src_offset =3D composer->offset
>  				     + (i * composer->pitch)
>  				     + (j * composer->cpp);
> -			/* XRGB format ignores Alpha channel */
> -			bitmap_clear(vaddr_out + src_offset, 24, 8);
>  			crc =3D crc32_le(crc, vaddr_out + src_offset,
>  				       sizeof(u32));
>  		}
> @@ -42,6 +40,32 @@ static uint32_t compute_crc(void *vaddr_out, struct vk=
ms_composer *composer)
>  	return crc;
>  }
> =20
> +u8 blend_channel(u8 c_src, u8 c_dst, u8 a_src)
> +{
> +	u32 pre_blend;
> +	u8 new_color;
> +
> +	/* Premultiplied alpha blending - IGT + cairo context */
> +	pre_blend =3D (c_src * 255 + c_dst * (255 - a_src));
> +
> +	/* Faster div by 255 */
> +	new_color =3D ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> +
> +	return new_color;
> +}
> +
> +void alpha_blending(u8 *argb_src, u8 *argb_dst)
> +{
> +	u8 a_src;
> +
> +	a_src =3D argb_src[3];

Hi,

DRM pixel formats are often defined as "bits in a 32-bit word", but
here you are accessing it as an array of bytes. To me that looks
suspicious wrt. big-endian architectures.

Unfortunately I have again forgot how DRM pixel formats should be
interpreted on a big-endian machine, if I ever even understood it, so I
can't say if this is right or not.


Thanks,
pq

> +	argb_dst[0] =3D blend_channel(argb_src[0], argb_dst[0], a_src);
> +	argb_dst[1] =3D blend_channel(argb_src[1], argb_dst[1], a_src);
> +	argb_dst[2] =3D blend_channel(argb_src[2], argb_dst[2], a_src);
> +	/* Opaque primary */
> +	argb_dst[3] =3D 0xFF;
> +}
> +
>  /**
>   * blend - blend value at vaddr_src with value at vaddr_dst
>   * @vaddr_dst: destination address
> @@ -50,12 +74,9 @@ static uint32_t compute_crc(void *vaddr_out, struct vk=
ms_composer *composer)
>   * @src_composer: source framebuffer's metadata
>   *
>   * Blend value at vaddr_src with value at vaddr_dst.
> - * Currently, this function write value of vaddr_src on value
> - * at vaddr_dst using buffer's metadata to locate the new values
> - * from vaddr_src and their destination at vaddr_dst.
> - *
> - * TODO: Use the alpha value to blend vaddr_src with vaddr_dst
> - *	 instead of overwriting it.
> + * Currently, this function considers premultiplied alpha for blending, =
as used
> + * by Cairo. It uses buffer's metadata to locate the new composite value=
s at
> + * vaddr_dst.
>   */
>  static void blend(void *vaddr_dst, void *vaddr_src,
>  		  struct vkms_composer *dest_composer,
> @@ -63,6 +84,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  {
>  	int i, j, j_dst, i_dst;
>  	int offset_src, offset_dst;
> +	u8 *p_dst, *p_src;
> =20
>  	int x_src =3D src_composer->src.x1 >> 16;
>  	int y_src =3D src_composer->src.y1 >> 16;
> @@ -84,8 +106,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  				     + (i * src_composer->pitch)
>  				     + (j * src_composer->cpp);
> =20
> -			memcpy(vaddr_dst + offset_dst,
> -			       vaddr_src + offset_src, sizeof(u32));
> +			p_src =3D (u8 *)(vaddr_src + offset_src);
> +			p_dst =3D (u8 *)(vaddr_dst + offset_dst);
> +			alpha_blending(p_src, p_dst);
>  		}
>  		i_dst++;
>  	}


--Sig_/jZgsubamSNYuWNRbgMYgLRG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl8+JcYACgkQI1/ltBGq
qqd9zhAAh3Zxhs4hXtAcm3f9KdRiqBwRVmPmmgub5iH/cxDQ60Dv1RTnf0MO9MIL
oYqwZsbx4XUMeZcqd2tQOAQDCU6fXk6UYiJHxyovu0JAk1e//YWF+YLKFGStfI90
7M7ZQiZQeJkQSGh71WNVLwTNIPdpDbTrRUmGfoRNE8x36nn5LGRke3fjCGkwMvwV
ENKDiknOHmNKDBfvDEcKQ7sUGzbVD8MReS+m/aVIuE7jJWPW1IKc6Kx2O4nFjBbk
8oRsBSQZ/PkDHvcO90VhMWg3AvNAM3fIA2CEOlwAyg9qi0OHiG7qbQh1DFiZtrA9
UX6nVJOd2qM8No0oQh8C4PAX9yBM/R5V7Y+GuIFQuy/rwiqiGaJmu3+8ULhs5AYo
9ByYXDcFP6IQGxqgaNk95hu/piHJo7Xd+FRP0C76ib8VMAoLUMFrsXoSx8ioImA4
J6T0vsMYgMn66DyyTRjHINIR6fQ1FSrRt5DPBNCZdXN84iXa+XLmF5qiX1O62+jK
ZLrLPOlPHVY+TA/w8ssiGMcl7O5HL/UKSHh0k0zJjo3fm8P3X0DfATdHUm3FRKID
06qbA+HwxiMwSQWNlBhBBZrv6xvzXajVrcS4BZClYiUmhUjhmET1Ii5Yx7TndVlL
/VWw3tUdkjXAkKsokctHeCyfwu4ADOzKcFyAjkODEUPIbi46LWw=
=TNt1
-----END PGP SIGNATURE-----

--Sig_/jZgsubamSNYuWNRbgMYgLRG--

--===============0241368899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0241368899==--
