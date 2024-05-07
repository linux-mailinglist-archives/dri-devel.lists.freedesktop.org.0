Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782718BE186
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080810E4A6;
	Tue,  7 May 2024 12:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NmfOP7y5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C162910E4A6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:03:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B58761629
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C6AC4AF67
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715083388;
 bh=Ea92ey9Y4mJyACRVj1y+BYDC6s5Ina7q6HC2o8kkYqI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NmfOP7y5cgdKPQyFZR3J8hxc+96sREULM+zTk83sxpQWOupwU2wRzPCNFiEKH2Inc
 0Rgl/9+At2bCzdkcG1x5bynQPK8PCtqBvXedBVA40cKcSvjl0N1h97yAdMRBjAs9+o
 rUAFNRGljyppaf81Edcv6HvvSrNVx+9U4diHiDs01h8y1UKztCuFWkLt40Ff4jzWSr
 8uaSoP+YbkQDNfPk4YtJ4G7Jgw4MW3JOmmxmBtQAUC5rp+M0C74o0UD0Be7YYpmUI6
 dqtZyHK746ne6CDkjbebmPWGD6cLvdRaubpRJRrnY6mUe2/oQ6/cTWL3NEVZpbQ6qu
 isABdY8OpwGgg==
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de5e74939fdso2480171276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 05:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqMxzyGq1S7JqVdaDMf3YDoyfq7Q7dl4f4/Zx0lrNKw1PHy5IFBLHdyyjuoBtPVzWTlh9iP0lC41pwWj5wiz1mbVidIlnEzQ/nDucc2iyD
X-Gm-Message-State: AOJu0YyMEC7FFICGn/72nhaBIWF1Yg4YQYgrMrVQ4g2hfaz5yRLAu/Ut
 MKht0E5bDTrKzTkwg0FgEEzz6Vbq9WnM6hLz5T69AMiJD14nTEwvpe9eOO/aIL1XKbKurg+E7mv
 WJiJk0a9rF2dTZjxn279a62EArk/5vgXf5y5n8g==
X-Google-Smtp-Source: AGHT+IFASQJ7En22EiRKU1G/Js+pMfVUKcBEoMeS7ZnY6BKqLbZB1gsTSLgE44jqNPZXZ29zuSi8fVfr7Ile965txI8=
X-Received: by 2002:a25:2985:0:b0:de6:4ff:3157 with SMTP id
 p127-20020a252985000000b00de604ff3157mr12618383ybp.44.1715083387541; Tue, 07
 May 2024 05:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-2-l.stach@pengutronix.de>
In-Reply-To: <20240503151129.3901815-2-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 7 May 2024 14:02:56 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4xo+0RPkA6h0JurDn1WVvQRpNmPdZWks34BAMhCxU+_w@mail.gmail.com>
Message-ID: <CAN6tsi4xo+0RPkA6h0JurDn1WVvQRpNmPdZWks34BAMhCxU+_w@mail.gmail.com>
Subject: Re: [PATCH 01/14] drm/bridge: analogix_dp: remove unused platform
 power_on_end callback
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 3, 2024 at 5:12=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> This isn't used, but gives the impression of the power on and power off
> platform calls being non-symmetrical. Remove the unused callback and
> rename the power_on_start to simplay power_on.

s/simplay/simply

>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 ++-----
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 2 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 4 ++--
>  include/drm/bridge/analogix_dp.h                   | 3 +--
>  4 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 98454f0af90e..b39721588980 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1264,8 +1264,8 @@ static int analogix_dp_set_bridge(struct analogix_d=
p_device *dp)
>                 goto out_dp_clk_pre;
>         }
>
> -       if (dp->plat_data->power_on_start)
> -               dp->plat_data->power_on_start(dp->plat_data);
> +       if (dp->plat_data->power_on)
> +               dp->plat_data->power_on(dp->plat_data);
>
>         phy_power_on(dp->phy);
>
> @@ -1290,9 +1290,6 @@ static int analogix_dp_set_bridge(struct analogix_d=
p_device *dp)
>                 goto out_dp_init;
>         }
>
> -       if (dp->plat_data->power_on_end)
> -               dp->plat_data->power_on_end(dp->plat_data);
> -
>         enable_irq(dp->irq);
>         return 0;
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index f48c4343f469..30c8750187ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -233,7 +233,7 @@ static int exynos_dp_probe(struct platform_device *pd=
ev)
>         /* The remote port can be either a panel or a bridge */
>         dp->plat_data.panel =3D panel;
>         dp->plat_data.dev_type =3D EXYNOS_DP;
> -       dp->plat_data.power_on_start =3D exynos_dp_poweron;
> +       dp->plat_data.power_on =3D exynos_dp_poweron;
>         dp->plat_data.power_off =3D exynos_dp_poweroff;
>         dp->plat_data.attach =3D exynos_dp_bridge_attach;
>         dp->plat_data.get_modes =3D exynos_dp_get_modes;
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 7069a3d4d581..baeb41875a4b 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -92,7 +92,7 @@ static int rockchip_dp_pre_init(struct rockchip_dp_devi=
ce *dp)
>         return 0;
>  }
>
> -static int rockchip_dp_poweron_start(struct analogix_dp_plat_data *plat_=
data)
> +static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>  {
>         struct rockchip_dp_device *dp =3D pdata_encoder_to_dp(plat_data);
>         int ret;
> @@ -397,7 +397,7 @@ static int rockchip_dp_probe(struct platform_device *=
pdev)
>         dp->data =3D dp_data;
>         dp->plat_data.panel =3D panel;
>         dp->plat_data.dev_type =3D dp->data->chip_type;
> -       dp->plat_data.power_on_start =3D rockchip_dp_poweron_start;
> +       dp->plat_data.power_on =3D rockchip_dp_poweron;
>         dp->plat_data.power_off =3D rockchip_dp_powerdown;
>         dp->plat_data.get_modes =3D rockchip_dp_get_modes;
>
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index b0dcc07334a1..8709b6a74c0f 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -29,8 +29,7 @@ struct analogix_dp_plat_data {
>         struct drm_connector *connector;
>         bool skip_connector;
>
> -       int (*power_on_start)(struct analogix_dp_plat_data *);
> -       int (*power_on_end)(struct analogix_dp_plat_data *);
> +       int (*power_on)(struct analogix_dp_plat_data *);
>         int (*power_off)(struct analogix_dp_plat_data *);
>         int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *=
,
>                       struct drm_connector *);
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
