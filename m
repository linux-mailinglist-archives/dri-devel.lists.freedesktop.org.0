Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC399852C0F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 10:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BBF10E3F8;
	Tue, 13 Feb 2024 09:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="nJYVuhP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046A10E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xx7rNXGoKTHU3cZOeF+a9Cra/ph/Z16+DbxgoWB7MI0=; b=nJYVuhP4XHZ6QikCG22EgW9HCx
 TJTUsk4XkaT1Dgc8JxYMgV5EbZnhHaclDGEFP39RsRXhijRZ1YcAPsKtZuHMZZFxCjxvkkRG42f96
 6Y0Mtd++FYYU+8Kh/dqs+Dqu/et7jYH7nu6hRiNyuIuVJi/vfLhzK2R3kfZ8ldJuoALVc7jyyen0J
 vNRBufFO4YsdX9JMTDjiduY51vFycRFfEMnj0hFZV/98kdzn+2mWSqYhC8aGCsYCJenkBFdOz6/R4
 JXRhMhANvI5PiTJOyHIEqny83rmSPEI0XEDV8YP613Itwd1CII60eyIKUDnAolVkEpJJdClk6L11D
 ObEU+y2Q==;
Received: from [194.136.85.206] (port=34208 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rZot0-0002vU-2L;
 Tue, 13 Feb 2024 11:15:30 +0200
Date: Tue, 13 Feb 2024 11:15:27 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH 05/28] drm: Add support for 3x3 CTM
Message-ID: <20240213111527.33ffc75b@eldfell>
In-Reply-To: <20240213064835.139464-6-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-6-uma.shankar@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7xLLH4/_gr5gAiwz1a+SE3m";
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

--Sig_/7xLLH4/_gr5gAiwz1a+SE3m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Feb 2024 12:18:12 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add support for 3x3 Color Transformation Matrices in Color Pipeline.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 3 +++
>  drivers/gpu/drm/drm_colorop.c     | 2 +-
>  include/uapi/drm/drm_mode.h       | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index e7bf1fb054af..c54b0d6c133e 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -716,6 +716,9 @@ static int drm_atomic_color_set_data_property(struct =
drm_colorop *colorop,
>  	case DRM_COLOROP_CTM_3X4:
>  		size =3D sizeof(struct drm_color_ctm_3x4);
>  		break;
> +	case DRM_COLOROP_CTM_3X3:
> +		size =3D sizeof(struct drm_color_ctm);
> +		break;
>  	default:
>  		/* should never get here */
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 462ffec42cdf..6bae6dc8e54b 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -107,7 +107,7 @@ int drm_colorop_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
>  				   0);
> =20
>  	/* data */
> -	if (type =3D=3D DRM_COLOROP_CTM_3X4) {
> +	if (type =3D=3D DRM_COLOROP_CTM_3X4 || type =3D=3D DRM_COLOROP_CTM_3X3)=
 {
>  		prop =3D drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP=
_BLOB,
>  					   "DATA", 0);
>  		if (!prop)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index f16318f1785f..68696253867e 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -868,6 +868,7 @@ struct drm_color_lut {
> =20
>  enum drm_colorop_type {
>  	DRM_COLOROP_1D_CURVE,
> +	DRM_COLOROP_CTM_3X3,
>  	DRM_COLOROP_CTM_3X4,
>  };
> =20

Hi,

where are the docs for DRM_COLOROP_CTM_3X3?


Thanks,
pq

--Sig_/7xLLH4/_gr5gAiwz1a+SE3m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXLMy8ACgkQI1/ltBGq
qqeHRBAAhiZ13am9DpqcknUnFzez8Yh75d20SxPhKyFdUQBESnAS/AwygjHbBZgO
OnslAKBXlZVeYNqzAqgsRFQvohU23sa9+mrg0QmZLutQODRHeuENwrQvHyOFQ+7K
fsSQR30v+B7Gl5Q1REba+hPBavL6g6/e1ABXz9LWc7qsvvfbFWnL0Q74HojVTUbA
GTMyh6UkT64Utmu25b8mTCDH5kHdSdLm18UkvyYVhHyVAzT79vkjreU8vMUZXXlH
CJkg0mvjl8Z/F49mY6fC3w/Jk7Zt0kgSPjzEzxEcNglgp4RLKpQdH6FeWxpSrpZL
pRKmWzdeISzUCn6NYr7NMcUggiwEO1gEeyAVpjf6wKqDJWo9FTNGZwp9GcSbg7XS
r00B/kSfCspxwFvvd0k0etayi0T4aPXSuWX1ufj3p63QtCAc4j4luLFfSV0NNYQT
4vo1KWgrkBOEWzl33k0jz97KxPgGALapwUGmVPUZ/1UUHQnLkMMg0YF7X6emstBP
KY0z39N+K7+DUsygLluescCGIYzuq5GYmp8ValzzmE+E+Bm9x4TJaaSxLZCUIoHy
38gqQ/NjwEGRvIOcROVsBt7IV9NmK319SJW6dQME0dILzXsMjrRWLuhqpv9GUbYG
bAHh9UcDaMqprg0UClSF03bVDz3YYLdYgV25MHdPcoY6OAgqEPI=
=08HT
-----END PGP SIGNATURE-----

--Sig_/7xLLH4/_gr5gAiwz1a+SE3m--
