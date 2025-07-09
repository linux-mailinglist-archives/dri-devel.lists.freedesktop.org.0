Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A498EAFF220
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B2710E83D;
	Wed,  9 Jul 2025 19:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="CplRT5r6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111E210E826
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Oi+8ljfF+JQ62/JezDSEUuiZkb455tkEy3zZWjAXllY=; b=CplRT5r6vcPr6kjF6esg0ft930
 B90fQvkTqExfjC/bI9ln9oLal5rexREbxOjnqMv5pb0a18gQDO/sUzrXkC7Tuqyq/UnM4SJD5Q4js
 vJsLIbGSTvV1bEHWxzhmjgOm/rA/4h5hAB4ob+Mw7zL6XdA6rE9zvyCo/QOg4P8+894UnFF8CYXi/
 1IF31V+e1mgGDD3pGhy4KUTzB3UcJbZLDkIVFeRNotAoqE6RKf9arcc2Bz3qB6CpXwWSGq1BfspbA
 GA+h8dm92fFcTEf85HDWVt5VBHBqQYhMdxrjDcu7jBP3mQMgUlZw6Cjx6lJ1IzVJRpmrOxbT++sHQ
 lK7lIn7A==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uZavq-0006bE-Gp; Wed, 09 Jul 2025 21:58:18 +0200
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
Subject: Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Date: Wed, 09 Jul 2025 21:58:17 +0200
Message-ID: <6306541.2iPT33SAM4@diego>
In-Reply-To: <20250709070139.3130635-6-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
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

Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Damon Ding:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 9d7d3f009e58..9e1313fdecad 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>  	dp->plat_data.power_off =3D exynos_dp_poweroff;
>  	dp->plat_data.attach =3D exynos_dp_bridge_attach;
>  	dp->plat_data.get_modes =3D exynos_dp_get_modes;
> -	dp->plat_data.skip_connector =3D !!bridge;
> =20
>  out:
>  	dp->adp =3D analogix_dp_probe(dev, &dp->plat_data);
>=20

I think you might want to merge=20
=2D drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_con=
nector
=2D drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_c=
onnector

Because when separate this creates a bisection issue.
Like when a bisect happens to land directly on this commit, you already have
removed the exynos assignment, but the updated check from the following pat=
ch
is not yet in place.


