Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E0AFF212
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8110E80D;
	Wed,  9 Jul 2025 19:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BFRzFXD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75A10E834
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=JFhcVY1ZSSoc/XTpIZicoEuxmwFVa6EOH7jKZUvbqJs=; b=BFRzFXD5Nbw5HVW60D6pQXWEb8
 3rkb7z3l/vfTl5da3duXtLdc/TgsbxYZiEhh4XeVUvi10UQOSOZpgQMQVwle74iJrcXN7cEqlizaX
 xcuzHez4FLT7kuIr2EwMrRwDh6ywlS0OrgwOon9hRnVkWz2PE+yRX3esQDmCP61Iz446VQx9+Ido0
 Xv6mXFIbpfjbwMIa1PD9kbL6YLx9AGX5m7FLKX8EewJFkxjKzEobi5gYdGSkmpYhzrJZ4N5oM+dFN
 A067ULINjLEdxlBlUroBOwKs6oTOhlhoSEOXwX3H/Je5oLleHGRyTUrd3ndmq/Y5UPVXlP/3uFSVr
 +O1ZAOHw==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZat6-0006ZI-2e; Wed, 09 Jul 2025 21:55:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v2 04/12] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Date: Wed, 09 Jul 2025 21:55:26 +0200
Message-ID: <4596850.bcXerOTE6V@diego>
In-Reply-To: <20250709070139.3130635-5-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Damon,

Am Mittwoch, 9. Juli 2025, 09:01:31 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

> @@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct =
device *master, void *data)
> =20
>  	dp->drm_dev =3D drm_dev;
> =20
> -	if (!dp->plat_data.panel && !dp->ptn_bridge) {
> +	if (!dp->plat_data.panel && !dp->plat_data.panel) {

typo. The second test should be for dp->plat_data.bridge


>  		ret =3D exynos_dp_dt_parse_panel(dp);
>  		if (ret)
>  			return ret;



