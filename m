Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF4250FCB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 05:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45806E7F1;
	Tue, 25 Aug 2020 03:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680036E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 03:04:12 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id k20so4514204qtq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 20:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WMp6rKseSIGCKZ7smcMX9FYuG3pJNq2bUd+Xjt7quUY=;
 b=Vp6RyI0Pj27U1iJPgEEP125p75R8nINpr4UpTse2ul+aJcuC1d4FkqsSuTSTYbCCxF
 jckdzONaRBfqOij1ebyT1/VTrJUDNcg5KhHzfIYlUJIfjWgAXz3rae4cT6jomc8zZfzJ
 jq0buk3DfwwvXCCsXQbvSp9Xx9bGPT7Issz/WrDzHcu3Jw9/9Ao4UAcd2rsdIvMHfVKn
 peR9OXBlLi0BE8+zwlB4v0mU1pybvMSI74VqTnTlRw9Mx/8NpTmu4TvARPLouz1ZJk+y
 /RRTFo6wulAsF579TLrA0icYMPYvCnPTv10PYxQBrRrDsaHkNntPb3GTIGR8WGsapsSX
 HjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WMp6rKseSIGCKZ7smcMX9FYuG3pJNq2bUd+Xjt7quUY=;
 b=cGjoBpTfconkMfCMbbMwgM+JLkupXtyn75hFLUB9TQWf4yyNNAfkkm+WnwJsym30vK
 dwEUeaqcKYStVUTtPxI5NjNCl6MNcBESqKHMbL3WIo3Ycq1IBp0386JCeLflOEH1EXMC
 +lxfws75/Ii1x8tPEpG3y+I9f58Slap86nay4dm6Jwcr9j/FHlokzAnpwk5CiIXpwOmS
 EJoJUPhbsc7uMd4dCemiyPqvcWooiTg19dGT/bA2bZiWUgOwnX2DFU19gUgMha8WauU9
 JG9GGnItzzEQqsXaVZx/zjVhpuKOx420y5M2rQiwp0hOlrTKHTqwMigw+vVWNe2Bv9Fb
 xDHg==
X-Gm-Message-State: AOAM530S/hWmAo9lxT95KJiPjhEFj0j122MgkchHEbqJHMW0Ych7QbDP
 +FxAjewrgvmIBI2M9RYiP4g=
X-Google-Smtp-Source: ABdhPJxch/RRT5dyLLc9QsWE0sRTr5+2WAEaQpazftlMpwy9NcxE2V1piaR6GpZp5uy9YENNdtM4Yg==
X-Received: by 2002:ac8:5218:: with SMTP id r24mr7877876qtn.300.1598324651593; 
 Mon, 24 Aug 2020 20:04:11 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id c40sm1644073qtb.72.2020.08.24.20.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 20:04:10 -0700 (PDT)
Date: Mon, 24 Aug 2020 23:04:04 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add alpha-premultiplied color blending
Message-ID: <20200825030404.htitgoy27nyhlezz@smtp.gmail.com>
References: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-usp@googlegroups.com
Content-Type: multipart/mixed; boundary="===============0571160613=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0571160613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqakxti56v5wopbe"
Content-Disposition: inline


--pqakxti56v5wopbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

First of all, thanks a lot for your patch!

Follows my inline comments.

On 08/19, Melissa Wen wrote:
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

Use static here.

Also, replace c_src to src, c_dst to dst, and a_src to alpha.

> +{
> +	u32 pre_blend;
> +	u8 new_color;
> +
> +	/* Premultiplied alpha blending - IGT + cairo context */

You can drop the part that says "IGT + cairo context", this explanation
better suit the commit message.

> +	pre_blend =3D (c_src * 255 + c_dst * (255 - a_src));
> +
> +	/* Faster div by 255 */
> +	new_color =3D ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> +
> +	return new_color;
> +}
> +
> +void alpha_blending(u8 *argb_src, u8 *argb_dst)

Use static.

Looks like that argb_src is a read-only variable, in this sense add
const.

> +{
> +	u8 a_src;
> +
> +	a_src =3D argb_src[3];

change a_src to alpha.

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

I suppose that p stands for "pixel", right? In this case how about use
pixel?

Best Regards
Rodrigo Siqueira

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
> --=20
> 2.28.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--pqakxti56v5wopbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl9Ef58ACgkQWJzP/com
vP/jgRAAvAg8MOEHx2JYnEfBIGYV8151bxm6ay3YEq/28WkLuvmHGrwAK75ugmEf
AEV+t2BvZqZTdOAApeI/SGo21khJru9c+eedt8OmMiseOmhXLV8GrlKHei2ONJlh
Vt+jvfYYxvRj15jm/juvoiw+nkd2gmTu6aZJ822Oh/6d8c2zzxzI4IYEZ/nafX3S
vChd30Sb4KdPdcItRTVTnK9I6v2vwc1gKikOQJ7InmloLH/MjS1Wb35PgXbRRsZh
+1sgJEuDfjTOy6qTQ2fd/LkaSOje8TiQvwo1w1S317j3kKbsDjPFMyhAzLSUpxF4
4G03o22aUcYXinkewpW+Fr9JLiKj+1+x+TlUxkwMmD4fqdiLHFF4jS3fKYyVsg23
NoZPfHHjg/e+XQ3IKS+rR9m3L9ozd/r/DyS0REvRZqlkgJp780Wtq18LBvU3N6/r
l31mshDgmFCAA8xT0u9UfEnJkL2aZE0T+voYZipxL0QQmUTyf47uK1LrYVdGh89V
F1O9+LThNO3qZ/MuUjKcSalACto7oFIRgDsIVGPEx8u4Zk/SMcQb7lGSTcGAgqSq
9NyRKgFsgQFFMjpDEk4JjRBflavT6cUm0j4ThUKAKNJJuopW2anrG7vN1kshqQh1
J5rca+g+BUr1GJH0KWg/BDEhu9bwokeYjCHt8te6akI3bOJNDQ4=
=EBgw
-----END PGP SIGNATURE-----

--pqakxti56v5wopbe--

--===============0571160613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0571160613==--
