Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C626B0305
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC3310E60A;
	Wed,  8 Mar 2023 09:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1930310E608;
 Wed,  8 Mar 2023 09:35:16 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b13so15926694ljf.6;
 Wed, 08 Mar 2023 01:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678268114;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=B9gQSU1hE4pHwNZBTdVKkwllbDTQKBkHL8xqSvdMqIk=;
 b=OK2PjgGiRk4MGijFYrDl+uNqPJmJ1+61aPDKVaAnIk1SJev0G18kzoOvxb8kmfuqvv
 8FIqUVuFYB7Q2JpZQSbTT4xHP8lK8wJfh7yLVgsaCejbLud6HtxrN18tK5ysk5AKBzrJ
 SyvlFaREbZAn1NdUBqW/eYNNEt0OQ0I+Uwj+WiXN0r8aEFRF5UmHyDo5e4l/4UASL/B/
 8MVz6OnwAqWSoa6sXI6WhzNjoa3EINRunc/83VWRxtN89YVILsx1fbXzJA10xgFB3c3f
 xjpx9HijyCUwcN3u9MkLAY64Xijlv0OLXDx8kvwxzNuuWRcl1bZWpYO6ftwu3N495kPL
 rFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678268114;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9gQSU1hE4pHwNZBTdVKkwllbDTQKBkHL8xqSvdMqIk=;
 b=aAKljghPMaPzhZk986+DQ+imobkhnBb1unTVey2KgX2rGT8VJQsud+T7fBZJUDmJMO
 GqrSG9axnz41gldw/H0Lwkb+aYsIelHL0BUxPTQTnSAKs8KaFRC2C5m69AT/sS+2LXRw
 mbMwj3NISUCvmKnHOQMuvLR8ltwPMozeA+Ki9vmXDy4P20JWbPKGj3QSGe6UvuCsd8NW
 loyQrmrjvgvW4a1EcCsRglsi0DZrQ3/y/OhHIlu+AMJlM6jSOtGfLxDJgFvs2LTM927b
 WNsDhzokAaTBL5Kf87rfOBaP+O7sI7IM9ePKYBRVxsawsZJvdE8sY0zKv7H99hfzIokO
 THmw==
X-Gm-Message-State: AO0yUKUAp97LAL1Srk8zOpU+lfVz7Q+ojC+fqLizZbWblgS+1XopPnI0
 HSzUgQH4q8q/guyv8FWTq4c=
X-Google-Smtp-Source: AK7set+rvIm/UgplTUxnwTk4ieFNE7h2CPFIrmucSKik9P+S0RFZPqowB59v7hh35gw0264HzzUbyg==
X-Received: by 2002:a2e:960d:0:b0:295:d633:7401 with SMTP id
 v13-20020a2e960d000000b00295d6337401mr5072878ljh.47.1678268114313; 
 Wed, 08 Mar 2023 01:35:14 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j8-20020a2eb708000000b00295b0c0e0c1sm2499726ljo.118.2023.03.08.01.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 01:35:13 -0800 (PST)
Date: Wed, 8 Mar 2023 11:35:10 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 15/17] drm/amd/display: Add default case for
 output_color_space switch
Message-ID: <20230308113510.4165d1bc@eldfell>
In-Reply-To: <20230307151107.49649-16-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-16-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XX+CFOwIDpI3rfKZn/d.Jy.";
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
Cc: Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XX+CFOwIDpI3rfKZn/d.Jy.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:11:05 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Reviewed-By: Joshua Ashton <joshua@froggi.es>

Hi,

why?

Isn't the bitmask of supported values supposed to stop arbitrary values
from coming through?

Why handle unsupported values like DEFAULT instead of as a kernel bug?

If this is only to stop compiler warnings of not handling all enum
values in a switch, is the commit ordering in this series even
bisectable?


Thanks,
pq

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 43 ++++++++++---------
>  1 file changed, 22 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7f77e226f1eb..a15b26962496 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5308,7 +5308,29 @@ get_output_color_space(const struct dc_crtc_timing=
 *dc_crtc_timing,
>  	enum dc_color_space color_space =3D COLOR_SPACE_SRGB;
> =20
>  	switch (connector_state->colorspace) {
> +	case DRM_MODE_COLORIMETRY_BT601_YCC:
> +		if (dc_crtc_timing->flags.Y_ONLY)
> +			color_space =3D COLOR_SPACE_YCBCR601_LIMITED;
> +		else
> +			color_space =3D COLOR_SPACE_YCBCR601;
> +		break;
> +	case DRM_MODE_COLORIMETRY_BT709_YCC:
> +		if (dc_crtc_timing->flags.Y_ONLY)
> +			color_space =3D COLOR_SPACE_YCBCR709_LIMITED;
> +		else
> +			color_space =3D COLOR_SPACE_YCBCR709;
> +		break;
> +	case DRM_MODE_COLORIMETRY_OPRGB:
> +		color_space =3D COLOR_SPACE_ADOBERGB;
> +		break;
> +	case DRM_MODE_COLORIMETRY_BT2020:
> +		color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE;
> +		break;
> +	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> +		color_space =3D COLOR_SPACE_2020_YCBCR;
> +		break;
>  	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
> +	default:
>  		if (dc_crtc_timing->pixel_encoding =3D=3D PIXEL_ENCODING_RGB) {
>  			color_space =3D COLOR_SPACE_SRGB;
>  		/*
> @@ -5330,27 +5352,6 @@ get_output_color_space(const struct dc_crtc_timing=
 *dc_crtc_timing,
>  				color_space =3D COLOR_SPACE_YCBCR601;
>  		}
>  		break;
> -	case DRM_MODE_COLORIMETRY_BT601_YCC:
> -		if (dc_crtc_timing->flags.Y_ONLY)
> -			color_space =3D COLOR_SPACE_YCBCR601_LIMITED;
> -		else
> -			color_space =3D COLOR_SPACE_YCBCR601;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT709_YCC:
> -		if (dc_crtc_timing->flags.Y_ONLY)
> -			color_space =3D COLOR_SPACE_YCBCR709_LIMITED;
> -		else
> -			color_space =3D COLOR_SPACE_YCBCR709;
> -		break;
> -	case DRM_MODE_COLORIMETRY_OPRGB:
> -		color_space =3D COLOR_SPACE_ADOBERGB;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020:
> -		color_space =3D COLOR_SPACE_2020_RGB_FULLRANGE;
> -		break;
> -	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
> -		color_space =3D COLOR_SPACE_2020_YCBCR;
> -		break;
>  	}
> =20
>  	return color_space;


--Sig_/XX+CFOwIDpI3rfKZn/d.Jy.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIVs4ACgkQI1/ltBGq
qqfUGw/7BRoOJKeB9W+OcsO5MBRu9hDhujse5eYhZ3HtxbKIHMqKh9DoGD8Q/ZE9
PILYNaWtW+60zkGBvGSrEkIrkOF46yxYqvELcP4fXAHL+k8litUGPHua1aG/eS4D
DQlSwJ2uCyw7x7fHxbjDeBDrKIvvSW8jsgARSdNl/V/d5ygg0ydt2knRxpvYk9Zo
N+vaEnDqeL7bttuVoe07tUgIOMkEPcD6ILIN9J8COVaE2HFgfw5qvRax/VGx+TBr
rItwtgvMxr07S2ZJ+8cO/85LcYBt1JZhABs4uk8aNemR7ov+7JtyA9iRv3OsK5Yu
MOY0Q2uUemlyGpjFnQawpavkDRU716iJ7SbDTZWO8CWpRd0YQh7RwWeCtbopUfpS
h5amPo+O+rENV/z428m+iS0qLN5RhpSagbL2TMirAHxDF4Wv4738gTULnME4eGEa
rj4dRb218/XBJNGzvgtXg8T/Y4HtavjEPSpUrT+RqGjRRrSOb2Z8mD320jhNfagl
8HY2ovauRCzkilQeXeAD3B/aoG0WVzG+hF3ltzi0C8ZlwfmvJ4/Bvs2JUfgTI5Sq
kIQuizaSleJshQb176cDwII1LrnlBeKPKpxrA1mRzSV5gcrS5UIJ7I1opeGYETN/
iepj9Om8peTE1ix1oNLz/6CfkociPFbCgECpd+y4Tb8rImvwfz8=
=DJ/T
-----END PGP SIGNATURE-----

--Sig_/XX+CFOwIDpI3rfKZn/d.Jy.--
