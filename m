Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC984D1302
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D7510E35C;
	Tue,  8 Mar 2022 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E310E35C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:04:23 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id v28so24077946ljv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jZ+MIPcrQgiBvV9esILrCWNT+QHgAhnZB9Zx1WBFYKc=;
 b=pui7J67Xw0oUhnvd1RD87Sklk4hyTKg8ESiVGpiLW24baD11IcU6C72omNUGBUj205
 x9r3fmMbZEiBrJmqcc+fgRHdt7xJopBaXDrnBKx3h0bMIP4KZglWcNopNsB9lrc/WlZC
 HYtptWeqibQRoeQR0RYMm6Y/M9UhtqSMINpSoZM3blx1AJcqy8eRlSkPtcP/mJ8s60Yn
 91YOiy+wbd5ZkAoyxgCAVOlwt11F85Es5rYj07iyUGPLsgK6Kbe6x7AK7OxxaxOmynhv
 bSOfPQ0Yn9ng5C7QssOpL6rb0ydubd9YTqemDg3D3b39XpS0y1AcOMLuH2I1gABcamm5
 Gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jZ+MIPcrQgiBvV9esILrCWNT+QHgAhnZB9Zx1WBFYKc=;
 b=ZjahQ/+rnV8jmFhoAFOh0Ahn3izbgpqxkZcM/66ycvecsBL3jVqGsAneJgJ1RzBKri
 hGSDrlf35mYaxg21d2bFflopCRpoWM9AwS9C5Stc1K28k6q43Khzc4Ec13iHkKbhG84n
 kdCe8bCYUtLHC6qzXRLG+da89akU6/SZCUVntNVBLHV7mZTv7hnwmAGWOF4LgGVBiW7K
 2WEKV7rgqT/LA+cwTkZ35y9ZE3f37lSZMXoKoDByUzaOL8GcCogcUCL5rFZpbwbq7WWi
 PoBHdl7MOopUQ9XhZaXOQmGgZ5lo+maulcgz+lvwTQPPGJUZy2LTq2HoOueSf0bDxbdO
 fSfg==
X-Gm-Message-State: AOAM533GKCLqoD2sYS7/m6tKpn42RQh8TzQ43lKZ9uXJtAwzou6Kvs5y
 DZ2pC9iQH+Gnr0h4W1q0UkA=
X-Google-Smtp-Source: ABdhPJxxTef3eaNlDryAFPPL5nF0q4IhFtlUhPg8XzybHkrwi6IlWSoA/8AUiwzzDQGcesZTH9iplg==
X-Received: by 2002:a2e:aaa3:0:b0:230:21db:210b with SMTP id
 bj35-20020a2eaaa3000000b0023021db210bmr10411422ljb.394.1646730261407; 
 Tue, 08 Mar 2022 01:04:21 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 w10-20020ac2442a000000b0044835a52a08sm802928lfl.163.2022.03.08.01.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:04:21 -0800 (PST)
Date: Tue, 8 Mar 2022 11:04:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
Message-ID: <20220308110417.37290c65@eldfell>
In-Reply-To: <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VBZDq9jhkM14hkgWzHPGink";
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VBZDq9jhkM14hkgWzHPGink
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  7 Mar 2022 21:52:40 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Introduce fourcc codes for color-indexed frame buffer formats with two,
> four, and sixteen colors, and provide a mapping from bit per pixel and
> depth to fourcc codes.
>=20
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2:
>   - Improve pixel descriptions,
>   - Require depth to match bpp in drm_mode_legacy_fb_format(),
>   - Set .is_color_indexed flag.
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 21 +++++++++++++++++++++
>  include/uapi/drm/drm_fourcc.h |  5 ++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 6c76bd821d17e7c7..29f4fe199c4ddcf0 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -43,6 +43,21 @@ uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint3=
2_t depth)
>  	uint32_t fmt =3D DRM_FORMAT_INVALID;
> =20
>  	switch (bpp) {
> +	case 1:
> +		if (depth =3D=3D 1)
> +			fmt =3D DRM_FORMAT_C1;
> +		break;
> +
> +	case 2:
> +		if (depth =3D=3D 2)
> +			fmt =3D DRM_FORMAT_C2;
> +		break;
> +
> +	case 4:
> +		if (depth =3D=3D 4)
> +			fmt =3D DRM_FORMAT_C4;
> +		break;
> +
>  	case 8:
>  		if (depth =3D=3D 8)
>  			fmt =3D DRM_FORMAT_C8;
> @@ -132,6 +147,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
>  const struct drm_format_info *__drm_format_info(u32 format)
>  {
>  	static const struct drm_format_info formats[] =3D {
> +		{ .format =3D DRM_FORMAT_C1,		.depth =3D 1,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 8, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1, .is_color_indexed =3D true },
> +		{ .format =3D DRM_FORMAT_C2,		.depth =3D 2,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 4, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1, .is_color_indexed =3D true },
> +		{ .format =3D DRM_FORMAT_C4,		.depth =3D 4,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 2, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1, .is_color_indexed =3D true },
>  		{ .format =3D DRM_FORMAT_C8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .is_color_indexed =3D true },
>  		{ .format =3D DRM_FORMAT_R8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R10,		.depth =3D 10, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index fc0c1454d2757d5d..457ed39cc48f08e1 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -99,7 +99,10 @@ extern "C" {
>  #define DRM_FORMAT_INVALID	0
> =20
>  /* color index */
> -#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> +#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2=
:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> +#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2=
:C3 2:2:2:2 four pixels/byte */
> +#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:=
4 two pixels/byte */
> +#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one =
pixel/byte */
> =20
>  /* 8 bpp Red */
>  #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */

Hi Geert,

this patch looks good to me, so

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/VBZDq9jhkM14hkgWzHPGink
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInHBIACgkQI1/ltBGq
qqcvIQ/+Iq3B29/S8YElzMbwhbRbCnHjVokyhitB/SEdNY4JMNb4FMtMUhAMRxSF
Uo31tlj5O5NB91q20uMJCBduXO/YSRaLmoLs15/KmRjgtQ0gPE8XuZlfOc5y7cRR
XSpGqgcmzjjAC8lUEknvkg1petE8GGa3gbuQzVB22gvkNNGaUFrrsdHsmOm7d1bz
M8MbwGpI2xZZp1I6c4LqSCLNlLZaSi5N31EtZp5zgJfGVCavF1WyooHB1DNe/U3K
OLYMPaTtVYomsMH9qYx2VWPWTJ/oVWN1lNe88BltTNNdXd+8GJo32KObx0JC34CB
WgmJLrirf9LdhoaAjyEWSwUg5tlyU8I6NQQWL+rP7ITsU/Sdgmno1Ccl48dwltyt
zoJHLym33F6jZGY3cLAi3aNvs3MRNr81if410QQZjeutX0+VEFeilbnypTWaRUiu
iDY3sLIJyvnrfAnZQmfpz1xHmyVxriRxatYA2Uco6v+yw4Qn78Bwnxkgp6nMDNy7
dom+5l2xjgf3BNyjdBj70UJ1+T+Ctpc5sytm8eXfiMMazeudXybSYGuBrep2r0oz
R3QcikKUeJkZevDcxsptDXNx7ocHEzU4v406hvnTv6k5dQnJqH6hC6Tala/JbCxz
A2D+Y+Oz/EfOS1i7u27CEhHU2ou666eHzdpTFh2aiNdSnJSAJ3s=
=UfSs
-----END PGP SIGNATURE-----

--Sig_/VBZDq9jhkM14hkgWzHPGink--
