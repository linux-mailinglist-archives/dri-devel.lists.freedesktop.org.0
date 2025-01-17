Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C1AA14BC3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A639010E7B6;
	Fri, 17 Jan 2025 09:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="wTgpX6T9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823310E2FA;
 Fri, 17 Jan 2025 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fANOeKvbGZhIa7R8ixVbFZE1HhyfTPDLRenZOXTjAl8=; b=wTgpX6T9mh5eFfg+M1Va8h+FLn
 Mes6LNpPFBsFxg0hWqKmHtbL4mtc52Ss7/udGmGg/xIaIhWH6odW3R3+TKmXaOxFw2HLVqalf4iKj
 X4LQ6jTr/pdzdaOaV2NQnwik9ziAwIxyrxlcKzxhcpRSdjPCXNsUly429XaiaDIgsDqc24hN6qNQl
 vtLpQ2rVV708vc+h7lxappdfSxRNRWBN0EsxaQj9UqzjXxKw32WS2rkU6spXO1V/TJ6+nssrEFX0d
 na6TfBXbS8zgK2IoT7DKnB+8qsTqwg+RLdbxmNsrClFzySV9pQ+wTfMvqq5RYgmKV1jwbvtscIJhx
 O5Eus6sQ==;
Received: from [194.136.85.206] (port=38556 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1tYiGw-0003jK-2Y;
 Fri, 17 Jan 2025 11:04:10 +0200
Date: Fri, 17 Jan 2025 11:04:01 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Alex Hung <alex.hung@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>
Subject: Re: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
Message-ID: <20250117110401.446619e7@eldfell>
In-Reply-To: <20241220043410.416867-30-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-30-alex.hung@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IbKa/Ak_Cc0udwwLFnLiXes";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/IbKa/Ak_Cc0udwwLFnLiXes
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Dec 2024 21:33:35 -0700
Alex Hung <alex.hung@amd.com> wrote:

> From: Harry Wentland <harry.wentland@amd.com>
>=20
> The PQ function defines a mapping of code values to nits (cd/m^2).
> The max code value maps to 10,000 nits.
>=20
> Windows DWM's canonical composition color space (CCCS)  defaults
> to composing SDR contents to 80 nits and uses a float value of
> 1.0 to represent this. For this reason AMD HW hard-codes a PQ
> function that is scaled by 125, yielding 80 nit PQ values for
> 1.0 and 10,000 nits at 125.0.
>=20
> This patch introduces this scaled PQ EOTF and its inverse as
> 1D curve types.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_colorop.c |  2 ++
>  include/drm/drm_colorop.h     | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 7d4b29c0a0cc..f3391602a577 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type=
_enum_list[] =3D {
>  static const char * const colorop_curve_1d_type_names[] =3D {
>  	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] =3D "sRGB EOTF",
>  	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] =3D "sRGB Inverse EOTF",
> +	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] =3D "PQ 125 EOTF",
> +	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] =3D "PQ 125 Inverse EOTF",
>  };
> =20
> =20
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index e9f5c1adc2fe..4084a7438032 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -36,7 +36,6 @@
>   * enum drm_colorop_curve_1d_type - type of 1D curve
>   *
>   * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE coloro=
p.
> - *
>   */
>  enum drm_colorop_curve_1d_type {
>  	/**
> @@ -56,6 +55,26 @@ enum drm_colorop_curve_1d_type {
>  	 */
>  	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
> =20
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
> +	 *
> +	 * The PQ transfer function, scaled by 125.0f, so that 10,000
> +	 * nits correspond to 125.0f.
> +	 *
> +	 * Transfer characteristics of the PQ function as defined by
> +	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
> +	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system.
> +	 * Equivalent to H.273 TransferCharacteristics code point 16.
> +	 */

Hi,

this all good, I'd just clarify a minor detail.

H.273 code point 16 defines the normalised formula
TF: [0.0, 1.0] -> [0.0, 1.0]
so it is not equivalent to the 125-scaled version.

Maybe you meant something like this?

+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.


Thanks,
pq


> +	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
> +
> +	/**
> +	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
> +	 *
> +	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
> +	 */
> +	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
> +
>  	/**
>  	 * @DRM_COLOROP_1D_CURVE_COUNT:
>  	 *


--Sig_/IbKa/Ak_Cc0udwwLFnLiXes
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmeKHQEACgkQI1/ltBGq
qqc9UA//dhdXDVCxqYir1zscMW40RSIpSdwcETmm3p4KUH5YCHk/w04BI1y74wxv
CU+G+x/s5sZi5+ZS4m2F8+tr9KOMV3q1KEaw52MjfetRYVGt9NaJkzhchY6Qvt5X
IcfuAxR7jcD8TLnro/aCSzGn3QNBqKuFkOXelC7AWbuA80Don0eEJSgzby2by5u2
AhEttZwp30LntUNowIwWfwLwGdU9FUbxFuIthLPtKo1z7bXWnmwHE6aRuyM2RBxD
F+wcUXZlcRTKSHWrJmVI++47y6wcYQqU23eghDsKpP0irnBGAqcXjgZXZNiKpQn+
eC67s53c6XhhFa+AijC58yH2POenHLvsk0mj9AfBG4eXxfTGxrfLCAjR0AIpS/DD
cLczgpM1LVg2RHu63uhYiIyezsMEvAe2lTMImGBBlOsyCvGT5NG7DJr8xBhShOxv
tzCEYtCyx4o5qExGo4sVZbpAycTI6BS+g6VBrdLJ08AyF0/dOuREJfDA/HWemUMF
UUGXmLMF9OY7xWew2fRe7ds2bJbWU2rVrVDz/h9qQhEU0/3CwszG7xuDuB87xloN
AAHPlOGgEbUQv48v81J8cdbQuf7Idm6PPvOGHAwPo5J5cc+yd058IdoLDklsauo+
jI7bucGVkHLKFCtpyGnN6cYHpZISTZOBK9p13KXkZl8tnvDtSjw=
=eU11
-----END PGP SIGNATURE-----

--Sig_/IbKa/Ak_Cc0udwwLFnLiXes--
