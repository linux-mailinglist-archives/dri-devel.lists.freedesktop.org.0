Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC43984FC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103696EC0D;
	Wed,  2 Jun 2021 09:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B86D6EC0A;
 Wed,  2 Jun 2021 09:10:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i10so2290158lfj.2;
 Wed, 02 Jun 2021 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lzeeO1kSxH4S5GzoNiywVf/z9RF7yqxYawPT/9xtbNU=;
 b=tybLgPVSNi/nkDT2NZYosFBShmTKZivZ1e6MwoAMeTM7OOoFyhZd4zZqna4rAoqTW/
 JS/MPfzicyExYHGVppoK1O+C2MaGS9x4kMD3b0ct9jQKNRCdwDNG35s7SYabqqmPHAES
 FN5YsFF1Ss75ibq525F5rWDbK3EZpBKVc72Xn+Te5eT5bzv7EWp0+l6xPEruijv4SHuq
 ZS9x9Mwe0tgb/Gn6JHQ4YTqob/yud6shLV1C84aCY6VKADtglcvXUsGyHKbgqZZpPUVo
 C3MuNVHuiIsIoH7h8y9Wkz2OEMBH3pq4fXW5Y3VhxSBcZ67KVhLeh9jpf3q+EpX1dUny
 6vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lzeeO1kSxH4S5GzoNiywVf/z9RF7yqxYawPT/9xtbNU=;
 b=rONa2s7yQc/j85NYMXa3Mw85ZepU7CmCLzJ5NIO7mSGuj7OzgjdnRVzcmjxqdoL5nK
 vG1QJ37axJ9a1QxZ4olD0GIisVu6xIL8AIVNwKI/RN7pBFFQbAZZKV8r63QedbVwH1Ge
 Nvb/NZThkL1Jy6JcxJ0VRLm1V2ly+wf8pEB6sY2qWYLo/Tn4XySQL9sxhStZGIUBWDgw
 Tf4hwcF42OcrepwCYNBbT/ATlY0j0zYUTOsOfQqxowO7D4zzYCZoYsErPF8E4jjtcxCa
 UCyebVSwYgzwBgDut9uspj+eM8FsIRUQzBosnAY9rQnPpowZLSo1BtjL+3N5MZYWfWnl
 K3Ow==
X-Gm-Message-State: AOAM532xmN3uRVrwNxz3cQvHbPZNxIC0Q4CJfcb3nFGH4BD0l4Ek0loh
 8pU1lkn0OZiRa0jIQNPZla0=
X-Google-Smtp-Source: ABdhPJxkeK3OqbEnIppmqfdUlTyQVC3TAZ5197RGEwetMy3GqGmyY0gpPZPd6PEg8kNzSgaJAVVIqg==
X-Received: by 2002:ac2:4d54:: with SMTP id 20mr7748938lfp.369.1622625001030; 
 Wed, 02 Jun 2021 02:10:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z13sm2281889lji.115.2021.06.02.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:10:00 -0700 (PDT)
Date: Wed, 2 Jun 2021 12:09:57 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 1/9] drm: Add gamma mode property
Message-ID: <20210602120957.7a154640@eldfell>
In-Reply-To: <20210601104135.29020-2-uma.shankar@intel.com>
References: <20210601104135.29020-1-uma.shankar@intel.com>
 <20210601104135.29020-2-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.k7R/rxs1Dr8aHB3DZDobUC"; protocol="application/pgp-signature"
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

--Sig_/.k7R/rxs1Dr8aHB3DZDobUC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  1 Jun 2021 16:11:27 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> Add a gamma mode property to enable various kind of
> gamma modes supported by platforms like: Interpolated, Split,
> Multi Segmented, Logarithmic etc. Userspace can get this property
> and should be able to get the platform capabilities wrt various
> gamma modes possible and the possible ranges.
>=20
> It can select one of the modes exposed as blob_id as an
> enum and set the respective mode.
>=20
> It can then create the LUT and send it to driver using
> already available GAMMA_LUT property as blob.
>=20
> Note: This is based on design by Ville and is being carried forward
> based on his original idea.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++
>  drivers/gpu/drm/drm_color_mgmt.c  | 75 +++++++++++++++++++++++++++++++
>  include/drm/drm_color_mgmt.h      |  8 ++++
>  include/drm/drm_crtc.h            | 14 ++++++
>  include/uapi/drm/drm_mode.h       | 43 ++++++++++++++++++
>  5 files changed, 145 insertions(+)
>=20

...

> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 13eeba2a750a..b1eead03ebe8 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -262,6 +262,13 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *mode_blob;
> =20
> +	/**
> +	 * @gamma_mode: This is a blob_id and exposes the platform capabilities
> +	 * wrt to various gamma modes and the respective lut ranges. This also
> +	 * helps user select a gamma mode amongst the supported ones.
> +	 */
> +	u32 gamma_mode;
> +
>  	/**
>  	 * @degamma_lut:
>  	 *
> @@ -1096,6 +1103,13 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
> =20
> +	/**
> +	 * @gamma_mode_property: Optional CRTC property to enumerate and
> +	 * select the mode of the crtc gamma/degmama LUTs. This also exposes
> +	 * the lut ranges of the various supported gamma modes to userspace.
> +	 */
> +	struct drm_property *gamma_mode_property;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 9b6722d45f36..d7758d351936 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -819,6 +819,49 @@ struct hdr_output_metadata {
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
> +	LUT_TYPE_DEGAMMA =3D 0,
> +	LUT_TYPE_GAMMA =3D 1,
> +};
> +
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4

Hi,

where is the UAPI documentation for this new GAMMA_MODE?

As a userspace dev, I have no idea what to do with the above based on
what's written here.

Also, reading the description of DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES in
patch 5/9, what difference does it make whether userspace sets or does
not set that cap? I don't understand the implications from the
description.


Thanks,
pq

--Sig_/.k7R/rxs1Dr8aHB3DZDobUC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC3SuUACgkQI1/ltBGq
qqc6TA/+IGIrMBuAH7lstlyW/tAzUU3mUaSZ+ekQgM5Aw6IenSNI1rlk51+51NfK
6zLLp7bej/Acrpcg99Co568RWu9f3isWFwD/fJtPJlsKzfmDgDOoj2R1y9995Z10
IAE8R+r070zTIcYqncN90lst6Jo4AK7W+YmvzmvbuCnl1KoDTh+U+fLZarTrHb8O
Zb1udEY2wuLL5JNArUM/IuAMAKvhdkGr+dJkRKgxgOdNRmu7yNogAeJqkmA2EvCn
J5cqr1sU2xoc4h//Z03jC094kk/WNXdGKFOKafnapGIjDc+KjQv5FvhIrd5Gjnw3
83+H6Xl3gVPR/PdXdz2FgJ5PBGgNkfzk/3Os//d8hRfb8DQfbIFsddci0qRMeSJE
3/QKu6s3f1dWLLqL/nHUrVW3sAfI6tO0tR6czrwWWkxfpVjlAxB0D051DSs3m6vx
yyiU3rnwWNLcfE6aogtRynddwKdKV8YB8fuo3KoYnpIGJ4WxfBY5fAbRzJKyJQLu
D5E4udoGhqiYgcXztP++wJVtW2IiPCyZ9Y0GaYtEp5t4GJXCL1de/AdlbeVaZ4C8
FXiQMah1JwfrKu0/2n4imAQ1S/c6loDUgjm5I5rOSWGZdu4RC6rgnugxwN/rLzYI
oEV6cA+CbNzxp9gPfLET2giijDA36geGd5oGAcC42SrEJZ5VMm0=
=3QZz
-----END PGP SIGNATURE-----

--Sig_/.k7R/rxs1Dr8aHB3DZDobUC--
