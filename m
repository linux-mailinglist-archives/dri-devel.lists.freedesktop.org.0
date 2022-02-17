Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0E4B9CAB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1B310EF50;
	Thu, 17 Feb 2022 10:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88610EF50
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 10:03:03 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d23so8866289lfv.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=RoOTB3vZkQwzYPRZAgiyvvTVPRhf8OFRTaGI84Fbjro=;
 b=LnNVrxyRvAOtmCIOaUu+98tC35/2ib+27Z3s05eSMUxQUEW+kXDdSAYGkXCHAstvNE
 nnLBdEL2keD7bbdKJsikieb9zdYr99fwChFpbUlbz9TNY/byhScBOR5wVnjOo6QIzSK6
 z9x6qknR1sJC9nwV3d+7C+atFhHp/Eqr2lAABkyQW9qcjbvwmGQ+tQf6Lb7GOz80WIQM
 K8ju26q5xc9rJFdDj/TfE7/zwY0ddGEmSzNt4/t3RTA8yInTM3OV9YsO9r+fpBA/QENG
 hp6qlv93rj8A2h5eRVOke6y912QLnvOUBsOf8sx0wSzgGL6ghSEAn6W93AvfEO2hkfIM
 +s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=RoOTB3vZkQwzYPRZAgiyvvTVPRhf8OFRTaGI84Fbjro=;
 b=KBznKDZ+NE2c2RpYMO+53YmBTXAnufNmtWU35epsBqEWkwkbrOsDY8FY2+J/K1sQly
 eJ+jbsi93x7JJPXFlofvwhUyohKcNy5NZnDjhm7an1L8EkBi/rwCNZ7ZK7s/CgFmtJiq
 E1XI8QRf5lo1sjmYNDP/YY6tXTsaRPahewKzXEFMk3pjijoxTLM95t0Mli5vXsmFtlCt
 EeXhmZL9AXzcP29wv1MSDegZHJthxnpPp3MlpFBhbPvCVpOHPT4Ji+tv5oHzlSxq5jIj
 8MwOv3e/IRHAhitqpKBr09UQZSqjnMv7AA+h8UvVCI23C7LSyE3/0SVY7p7O3I4OMUJx
 3zAQ==
X-Gm-Message-State: AOAM530jLcN4b48Eaxj4jimvyycxyW57HReU41TBWcPXEXb+3/wOldTl
 uPzmlWXZv/lgFqCMJ0vDutA=
X-Google-Smtp-Source: ABdhPJyHyBSPz0zviYWjFjR0JBinOyr3nCfiuhwyjA+aVFjHKiUoVmaPTr/VjgPeN0WeLb4fsHLoPA==
X-Received: by 2002:a05:6512:2622:b0:442:bd44:8af8 with SMTP id
 bt34-20020a056512262200b00442bd448af8mr1606991lfb.317.1645092181858; 
 Thu, 17 Feb 2022 02:03:01 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e10sm5110323ljk.30.2022.02.17.02.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:03:01 -0800 (PST)
Date: Thu, 17 Feb 2022 12:02:58 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] drm/fourcc: Add DRM_FORMAT_R[124]
Message-ID: <20220217120258.0ee53dd8@eldfell>
In-Reply-To: <20220215165226.2738568-8-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-8-geert@linux-m68k.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jt_VVbdBEiI1p4OibkFRGE0";
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
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Jt_VVbdBEiI1p4OibkFRGE0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Feb 2022 17:52:25 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Introduce fourcc codes for single-channel frame buffer formats with two,
> four, and sixteen intensity levels.  Traditionally, the first channel
> has been called the "red" channel, but the fourcc can also be used for
> other light-on-dark displays.
>=20
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 5c77ce10f53e3a64..c12e48ecb1ab8aad 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -151,6 +151,12 @@ const struct drm_format_info *__drm_format_info(u32 =
format)
>  		{ .format =3D DRM_FORMAT_C4,		.depth =3D 4,  .num_planes =3D 1,
>  		  .char_per_block =3D { 1, }, .block_w =3D { 2, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_C8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_R1,		.depth =3D 1,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 8, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_R2,		.depth =3D 2,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 4, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_R4,		.depth =3D 4,  .num_planes =3D 1,
> +		  .char_per_block =3D { 1, }, .block_w =3D { 2, }, .block_h =3D { 1, }=
, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R8,		.depth =3D 8,  .num_planes =3D 1, .cpp =
=3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R10,		.depth =3D 10, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
>  		{ .format =3D DRM_FORMAT_R12,		.depth =3D 12, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 3f09174670b3cce6..8605a1acc6813e6c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -104,6 +104,15 @@ extern "C" {
>  #define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [3:0] C */
>  #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> =20
> +/* 1 bpp Red */
> +#define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [0] R */
> +
> +/* 2 bpp Red */
> +#define DRM_FORMAT_R2		fourcc_code('R', '2', ' ', ' ') /* [1:0] R */
> +
> +/* 4 bpp Red */
> +#define DRM_FORMAT_R4		fourcc_code('R', '4', ' ', ' ') /* [3:0] R */
> +
>  /* 8 bpp Red */
>  #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
> =20

Hi Geert,

I have the same comment here as for C1/C2/C4: these need to specify the
ordering inside a byte. Otherwise this reads as one byte of storage per
pixel, but using only 1/2/4 bits of each byte.

The idea of having Cx and Rx formats separately sounds good to me.


Thanks,
pq

--Sig_/Jt_VVbdBEiI1p4OibkFRGE0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIOHVIACgkQI1/ltBGq
qqepcA/+LL865J5CZJYZEBDBIYPLhUz/FNe6EH1lYd+zALvj8tkr+/ERUpIYrVo6
syM+GRsn9ZmHtBhvurgkSXnjHQ36oK2EYjOc/o4G5Oa0EkmA38SHlNe+WPL3IVsC
fWKCupfuYHnPT6/WFd50KDv5BAN/FRtguuRByXgp8WopMnlaSGdJ5Q57UliLJNQX
z8S4Zm2WiJ6b55Qb3qfUpSwMt0ScJ/8nmKkXnWlNyEEjxIlFC4vv/EmNJscZn98e
YGiQxlnlzMAIBGIZGZ1iVdzsAtG77UvhpL36W5qcDbPS3R38dyotSEWTEAGzowO2
EuudkRiJVsEmUvuXgPlN1gqo3JKqGXUe/9VXjSZIxnmh6n6pbNdfov1zfFWbipn9
SRJIRy+9Zywuo8xvxIt+XzrKOu000hoEKAkNR5kPMKRFBW0gJlqAldYP5BwxkBjQ
r7eIwzqjuYshHcmcvTTpy88zFR24noSuDIkLpR6PGt+Js1PPzBQdLcqqS7nQfVBl
1mEVZCvtkts92Za17HPwTwTCHBpHXjXtKxb0or83mgaeeWbKVz+sU6FAGuymYvEa
H4pFSBsMkUEPaCkqBY6CB9LKzJgboRNcwkaIaI+Chsrx3JfpI5VkvUlSEcb4fwSi
RksMQvVivoRpEbAcuPX3wVae6WT0ZhZcuPmKSEroBgv9KYBoiOY=
=oi2B
-----END PGP SIGNATURE-----

--Sig_/Jt_VVbdBEiI1p4OibkFRGE0--
