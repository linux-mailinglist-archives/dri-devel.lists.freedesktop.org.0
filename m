Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290CB250FD9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 05:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205C56E80B;
	Tue, 25 Aug 2020 03:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7126E80B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 03:15:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s16so8067497qtn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 20:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SvW0vlaUXlhWFbm4GXWlUoLrbQbUVmWGmeetFSuThhE=;
 b=lBdDG+jr+clUeV0eZJNh0HDFKzUBl3kRTE4wstKazWuV5tSm0WZL5CH4NcESSYmzwC
 sP4WG8N++5UqDSc3i3VIMNJ0jvo8sUZYtbg6/s2Hh/U63UpgMYGr2OgHf5cwuWZvOr76
 tmOZwzIAeSNJVqYyxCy0FQ1+N/2UUUOWWnInumaZmoOyep+CVW6y5F0dUJ+0+amyzmSh
 s+PTEw1UPrFB36N8Kx/VnENvAlsIhownfXWtitpvHR2u91jdmB+afg4z4yi1l7dceg4g
 X9ZWX+J6qgvDHUDyoWq/TUyWcZyD/OfUDexLvjw804QiXxRYV2LJyzlUVkp53xobKQCb
 VUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SvW0vlaUXlhWFbm4GXWlUoLrbQbUVmWGmeetFSuThhE=;
 b=WhM5GmKwaCTgcokTVAaBtKaA1ymMKxLooSnDmeta2prOGT06+JkP0L9ETx8wke87M0
 bU3Haz+Lvkn5A1qbQe1kZGcvsygGUDKOw0k/JVTPHJeqXz9ojTeNRvYnqjct5COwvcSx
 hFflMo/BdBDM73UcLK1A6Uhg6bA/wg4DQ69Zkxb1vwaVh07mRLSt5rvsROnTY4eO4Nu8
 qfmFbZ1moLTUmpTKubSyxuz7OOG71dJlcLLJ93hac0EVUtacMLcTCYsSc286ls1uEykE
 ISTcRNINF3FwzJYQHFS5qIfjgzdp7RfaLL+FxEVkyUBS71HdRf3zskwdXdiv6XW0htCB
 4yPg==
X-Gm-Message-State: AOAM533vUgh3f7HD1Y+upbGF+pHUCug78HKJQ8PbTcRfKmgGmUDfFfuQ
 zdODIvFlxAxh9Ym1+3tJfls=
X-Google-Smtp-Source: ABdhPJxNJ48MdYSl7r2xKefnshL60K4Lxd4UGz3J+2l5UciwcxMPHBZ0Y1xQjLCZd+sM07lOCMSRhA==
X-Received: by 2002:aed:3ead:: with SMTP id n42mr7978240qtf.5.1598325307956;
 Mon, 24 Aug 2020 20:15:07 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id d26sm13283713qtc.51.2020.08.24.20.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 20:15:07 -0700 (PDT)
Date: Mon, 24 Aug 2020 23:15:01 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20200825031501.y3knhdwph5a6knld@smtp.gmail.com>
References: <20200818160215.19550-1-realwakka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200818160215.19550-1-realwakka@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0278016717=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0278016717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hw63tmig6dcz7gis"
Content-Disposition: inline


--hw63tmig6dcz7gis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

Thanks a lot for your patch and effort to improve VKMS.

On 08/18, Sidong Yang wrote:
> I wrote this patch for TODO list in vkms documentation.
>=20
> Use alpha value to blend source value and destination value Instead of
> just overwrite with source value.
>=20
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
>=20
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 4f3b07a32b60..e3230e2a99af 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -77,6 +77,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> =20
>  	for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i) {
>  		for (j =3D x_src, j_dst =3D x_dst; j < x_limit; ++j) {
> +			u8 *src, *dst;
> +			u32 alpha, inv_alpha;
> +
>  			offset_dst =3D dest_composer->offset
>  				     + (i_dst * dest_composer->pitch)
>  				     + (j_dst++ * dest_composer->cpp);
> @@ -84,8 +87,15 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  				     + (i * src_composer->pitch)
>  				     + (j * src_composer->cpp);
> =20
> -			memcpy(vaddr_dst + offset_dst,
> -			       vaddr_src + offset_src, sizeof(u32));
> +			src =3D vaddr_src + offset_src;
> +			dst =3D vaddr_dst + offset_dst;
> +			alpha =3D src[3] + 1;
> +			inv_alpha =3D 256 - src[3];
> +			dst[0] =3D (alpha * src[0] + inv_alpha * dst[0]) >> 8;
> +			dst[1] =3D (alpha * src[1] + inv_alpha * dst[1]) >> 8;
> +			dst[2] =3D (alpha * src[2] + inv_alpha * dst[2]) >> 8;

Did you test your change with IGT? Maybe I missed something but looks
like that you're applying the alpha value but the value that we get is
already pre-multiplied.

Btw, It looks like that you and Melissa are working in the same feature,
maybe you two could try to sync for avoiding overlapping.

Finally, do you have plans to send your fix for
vkms_get_vblank_timestamp() function? That patch was really good and
removes a lot of warning generated during the IGT test.

Best Regards

> +			dst[3] =3D 0xff;
> +
>  		}
>  		i_dst++;
>  	}
> --=20
> 2.17.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--hw63tmig6dcz7gis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl9EgjAACgkQWJzP/com
vP+QwRAAn9k/9RskirKfJGva/5Qzhykbkj2nANsnwZo+hY6t2TNNuj4jx/INI0XA
l8eswurDyaB8yN/IUKs8HQ4LZEnrz4bKnYP8vpsJBxjPu6r+hTJ1vCEchISwaPHO
gQENSqrjAjgwkfVwHBJ4ltt3mwuvxJ01xgR+pztsIQ+H7U15TnZVhv7wVmt3jbhx
Rdgy9DM6mT5XVDcOJpriHlMQVCdfumRgbnQZxCSvyp++Bkb/HnvvV0YZnWpA1e0z
azxOW5jDeiQkg3VTJMO7tgnbXF6nX/Gucfuc1eN9yuiYJrWEyzjEjYGucbCvsbRV
U0l3XF3/lFGFLQOKe6MV+/TXVQ6rVmSAkNtSRdum8qHh8ukzHbIqdSFhdU6ThNlm
rexe62XyN1+f09f+kb/7FLxt5ov/7zdEjd2Vx9HQ8PLGhnWXJTxEvEaw12YQk5HB
Z5yvsD0V8nbUFCuCShvgDdQqSAAURMmoBxo0T8WYPnKIgfN100vL4WFu5Ru+MCFt
bbLzX+z+CyHg0oND2jg2umTDf0F6Cr2tOlxCTb7N+oqo15rsC1wpB9HqySai/oi5
3sADXinocJuSnwO08TvSpDtsQzLMvSm19V4hx33UCcheBH3Fk9nbtFmc70q/EY7f
avYZXPn+CZKPFpGv7dgqsoYe5f2sTmKQUdzC/DsQb26OHQ7zilQ=
=qLnU
-----END PGP SIGNATURE-----

--hw63tmig6dcz7gis--

--===============0278016717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0278016717==--
