Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A086B514E5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B66010E8D7;
	Wed, 10 Sep 2025 11:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GZg4a9Pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7871B10E8D7;
 Wed, 10 Sep 2025 11:08:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 37C4B43E04;
 Wed, 10 Sep 2025 11:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D442C4CEF8;
 Wed, 10 Sep 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757502513;
 bh=eT+fM0/l96U9E80CByHY3UpL1VMyoPh2jRe5J041drA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZg4a9PzOThwfZJWjmmg1do+BJcK6fKqRVNE1sq+YdWBDlnHaURSjrRlxZ7+9DH4N
 Db+CuYerpenQhklpoGj+sHRilAxDRpInKvZJFpf3X1NCOLLQCBlcF189fa3pyP4fw4
 ufx5Lufwft1vqYQ0u4pu16D0r5dE6FepR8/Y2m7Bl1iWB50ud8cl9nr4fE/W1LSLys
 FYy4EKSZ0zBJNrEh6t7tmcyrIUrM+yDEihmZQ6+XVKFqbhMuCNH5+DEntCodxdQULf
 ZowH6/I7RWxU+6aGkzICbmkk9ffdQk6E6ckIxF6EdRydu3MVPbheSr9BgPt07IhG8H
 9PwdxdvRijCMA==
Date: Wed, 10 Sep 2025 13:08:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
Message-ID: <20250910-courageous-warthog-of-refinement-aced6f@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xkhodzl7phtwfggk"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
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


--xkhodzl7phtwfggk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:52:07PM +0300, Dmitry Baryshkov wrote:
> Check that connector initialized by drmm_connector_hdmi_init() supports
> AVI InfoFrames and warn if it doesn't support Vendor-Specific
> InfofRames (HDMI InfoFrames are more or less required).
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb=
40e7f369d810350 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 12))
>  		return -EINVAL;
> =20
> +	/* AVI is required */
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
> +		return -EINVAL;
> +
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +		drm_info(dev, "HDMI connector with no support for Vendor-Specific Info=
Frame\n");
> +

Same remark than on patch 10. It's not something we can check at init
time, and we should check (and document!) that if we expect an infoframe
to be written but the write_infoframe hook doesn't support it, it's an
error.

Maxime

--xkhodzl7phtwfggk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFcLgAKCRAnX84Zoj2+
do1pAXoDY9Dzn6G/ClMn6Qt9h6baw0nSCc1SPEDOnOlKYoD9BSE05V70x5Sqi0rR
wJwIv2ABgME+k6f+wI13qd1Ah1huLB0li8xpIpRZTte9l8GEmuSdXIv2pGQJKmjF
/tLAINKY3g==
=JQzw
-----END PGP SIGNATURE-----

--xkhodzl7phtwfggk--
