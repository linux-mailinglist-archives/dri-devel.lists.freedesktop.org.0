Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1978A4B82
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 11:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBA310E953;
	Mon, 15 Apr 2024 09:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sTO9CrGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A1710E953
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 09:32:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07A7960B4F;
 Mon, 15 Apr 2024 09:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E561C113CC;
 Mon, 15 Apr 2024 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713173565;
 bh=hrn2Cpax6bG0+tBLHhsKA6HphenkfmI0P4jCJ4Nb38M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTO9CrGXjb2iRtX3VcwAqY0jWcf+Q8kFyy3K/cU6keDvqq2q+zQRd87m/PumOKSlT
 UBLIOMUwLtEuWI2s8KAcwm2cTc+LjwASPSsQbFDJYsNPwSCmCcHS+aqKQ6khKnprMX
 ynRp1SbmFTCpiRd2rbugH650wz7eqpi9X1RXpPZqEOYV8SE7fIxGeiNiHIJh4Uddmf
 m0pnLX8zhUU7G6253EQRUFvvD/4yyIEj25K+QzyOl/QmVhaDXVX7ZQU63mE0NJYkCD
 9n3g/uT4urnwhy5dPdmLylCaigrWWuJdsMKRI+nxWRi4Fd9zzdt/CWSDzewI8UC7yG
 1W6arDroYB4Dg==
Date: Mon, 15 Apr 2024 11:32:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Shawn Sung <shawn.sung@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
Message-ID: <20240415-ultramarine-oxpecker-of-completion-8a2298@houat>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-2-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hhxojz7wd43elnlw"
Content-Disposition: inline
In-Reply-To: <20240403102701.369-2-shawn.sung@mediatek.com>
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


--hhxojz7wd43elnlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 03, 2024 at 06:26:53PM +0800, Shawn Sung wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>=20
> Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
> a secure buffer to support secure video path feature.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  include/uapi/drm/mediatek_drm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_=
drm.h
> index b0dea00bacbc4..e9125de3a24ad 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> =20
>  #define DRM_MTK_GEM_CREATE		0x00
>  #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
> =20
>  #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>  		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)

That flag doesn't exist in drm-misc-next, which tree is this based on?

Maxime

--hhxojz7wd43elnlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZhz0MwAKCRAnX84Zoj2+
dn3gAYDXi9cjUdHf2aEBheomLq/GUTf8sVV73EPWmCbpiNi2jzl0oe8c+ikVUjWX
5TiuHpwBgPVRTxUq5IhrqZvI3ysT+Lm44XxAlrk1rkAg3qZzilUjJKsvuAHAp7Qa
7fpwnKIfLg==
=wTVi
-----END PGP SIGNATURE-----

--hhxojz7wd43elnlw--
