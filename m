Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A772398557
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3E6EC1D;
	Wed,  2 Jun 2021 09:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A456EC1D;
 Wed,  2 Jun 2021 09:33:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id m3so1722961lji.12;
 Wed, 02 Jun 2021 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=vJx77L+mVHsoE5Xisv+Qu97I6LH51bfnvz5NIaE6Cfs=;
 b=HEc2SfxweU4O5z9UuyszUXXOkJ4wHOAYedAcOZqpY6Yffmfj7y7no3B2BVy2RJRy9C
 onYwtFJ/iNbx9o02OtkCi5LjwsCIZi+CRGptV/4+oX1bQD2r+igYcHW/S0qcLnghkyyv
 LLxHIJUSJxPXV4+hhwTXDlNaMeI0WPWV61IEEuuzNIE0Z9Hena5QCKp11AxOPRC1nFeD
 ItVpiD7UnactKsopOoEWC+10MTMNff2QtH491Eryg1QWV4qG6dx5xJ2sgikRxdPtF+rl
 K8vRpU+8AhAcXNci8vf03Gs7iOrVr18YUXBSRBBmc9JgA06tqZHt3RLRdg+pqKROXbfS
 EiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=vJx77L+mVHsoE5Xisv+Qu97I6LH51bfnvz5NIaE6Cfs=;
 b=Qk8ZNMbV7HmrK3zc3ufvbx6MZPGcsY1ALv/aMifskMl9cRTkPW0/yWJfNqkdoShEez
 JYalAoobRv9qsO+jSHoz6siaFalBEJIU+N5b40oQvn8rC5hYCUtbt++McsclSeLLsWet
 GnmgMMVwgJ1rYeC9saCqs0VcSlG13RwOF+OkHMSUmIjcGIqgfERceKQu6iF5dGPOSJEQ
 Fi2cmnPJCQQyvYtDtrAaSKXFPc3gJ153H7hoP2cmYTvQLJ1THTevbfB1rCb1z0NvGrDB
 D1LJmYVW7pQU+bE6AnCZ/n+l1X1ejHOaHALWG4IqaMqr4NfTG70lv78bhA3ei1jrjxyk
 NZ0Q==
X-Gm-Message-State: AOAM531V0EbPrMZUEY8QRIAHqB0UNhbuygk3Yo8Tufy9lUTHtJVTkjb4
 2k4cPod3oQ7D43sVc0SxjMw=
X-Google-Smtp-Source: ABdhPJwNhJCSB1eIdRvrt9b/qMoK/gV+NcvWDMd5mpx9kAf71HL9oQ6G6wRhfXv5yazFfDy9/QQD7g==
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr24331105ljp.105.1622626418864; 
 Wed, 02 Jun 2021 02:33:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u22sm2291455lja.5.2021.06.02.02.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:33:38 -0700 (PDT)
Date: Wed, 2 Jun 2021 12:33:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 01/21] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <20210602123335.29045e06@eldfell>
In-Reply-To: <20210601105218.29185-2-uma.shankar@intel.com>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210601105218.29185-2-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A+9DFkfVbYmc.+3dMui5jn/"; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/A+9DFkfVbYmc.+3dMui5jn/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 16:21:58 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> Existing LUT precision structure is having only 16 bit
> precision. This is not enough for upcoming enhanced hardwares
> and advance usecases like HDR processing. Hence added a new
> structure with 32 bit precision values.
>=20
> This also defines a new structure to define color lut ranges,
> along with related macro definitions and enums. This will help
> describe multi segmented lut ranges in the hardware.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 9b6722d45f36..d0ce48d2e732 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -819,6 +819,64 @@ struct hdr_output_metadata {
>  	};
>  };
> =20
> +/*
> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
> + * can be used for either purpose, but not simultaneously. To expose
> + * modes that support gamma and degamma simultaneously the gamma mode
> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
> + * ranges.
> + */
> +/* LUT is for gamma (after CTM) */
> +#define DRM_MODE_LUT_GAMMA BIT(0)
> +/* LUT is for degamma (before CTM) */
> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
> +/* linearly interpolate between the points */
> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
> +/*
> + * the last value of the previous range is the
> + * first value of the current range.
> + */
> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> +/* the curve must be non-decreasing */
> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
> +/* the curve is reflected across origin for negative inputs */
> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> +/* the same curve (red) is used for blue and green channels as well */
> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> +
> +struct drm_color_lut_range {
> +	/* DRM_MODE_LUT_* */
> +	__u32 flags;
> +	/* number of points on the curve */
> +	__u16 count;
> +	/* input/output bits per component */
> +	__u8 input_bpc, output_bpc;
> +	/* input start/end values */
> +	__s32 start, end;
> +	/* output min/max values */
> +	__s32 min, max;
> +};
> +
> +enum lut_type {

Unprefixed type name in UAPI headers is probably not a good idea.

> +	LUT_TYPE_DEGAMMA =3D 0,
> +	LUT_TYPE_GAMMA =3D 1,
> +};

All the above stuff seems to be the same in your other patch series'
patch "[PATCH 1/9] drm: Add gamma mode property". Is this series
replacing the series "[PATCH 0/9] Enhance pipe color support for multi
segmented luts" or what does this mean?


Thanks,
pq

> +
> +/*
> + * Creating 64 bit palette entries for better data
> + * precision. This will be required for HDR and
> + * similar color processing usecases.
> + */
> +struct drm_color_lut_ext {
> +	/*
> +	 * Data is U32.32 fixed point format.
> +	 */
> +	__u64 red;
> +	__u64 green;
> +	__u64 blue;
> +	__u64 reserved;
> +};
> +
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4


--Sig_/A+9DFkfVbYmc.+3dMui5jn/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC3UG8ACgkQI1/ltBGq
qqcQuQ//ZczEGpeM2w6esWjGpPdwaTxDJKJbxeEg/BwEnL+b1CAm8HGsU5o813Fz
Wn9RcI06rHtRyTNGl+zOIigOqB8No+2gF9/XQVRJ7xlEx0eB0oin3Nc4d4WYY3Gb
Y5A+NHHVdK06LMVcuXiv5DZrMWVr78IIgUD5SqVFJEbXEo/LxUOtr9piN3mb06nQ
xfaEd3+ArpxJ15rN+F4Y3taLhnks2aXoqgdJ7g/EBpkYelgnRvsmNsDaS66ziuKm
eNyJccwRigXBXhrJKhftRmsX4hBhTpMN+yYCsrlrKDowkf+b1hU4Mr3gSLxkQSy8
RQ2XT/AdH7S8R3ZWzt3NnIp42oZEviQXJj0ppZEJvTuDVxkFEfVhG/Pl/ePo9m4B
+hrazrkV82S31ITxFcVEcQwy6Vf1uEvWPTh3JEtyvuskgaiYmCCXtvsszjw6uukM
WN0jMl1+FEhqE6MKrO+dhTDMAtKLzxJ2J/sSImUECzOrcqRaPCiY8Sc5P2ZmXx/j
oz1I7Ro8eVz8q8EcTjj8oWI96aZ5w2NpH+W4lpfsgpiVDD710iGgZV6gr6eaP5GP
MAGDfL+25hObNVyGXh4T2hY/FGmSLgXOHw1+updFbzM9sH8l0n3CuaW8q0BPQucT
Jnmhfx7j4oW1nhVFtyeSQoPBqBccihNZNqgjKbZw7HxhhOhGBCA=
=Xvoq
-----END PGP SIGNATURE-----

--Sig_/A+9DFkfVbYmc.+3dMui5jn/--
