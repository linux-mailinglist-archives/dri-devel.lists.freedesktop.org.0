Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7E4EDDF5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FEA10F400;
	Thu, 31 Mar 2022 15:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58C410F400
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:52:12 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so4031915pjo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sx4w7Ly1ifRX/iEBNixOiCMpxM0l3zOWr1dP3UPbXTU=;
 b=YoMEh9DZ2+eJSsKdBeqh8v4Q5+JpN2AZg2EHyZXP+x/lCYgiK9XCODVzXLCVoSYAs7
 7Vw8+qXuWAPBfB4k06ziXjEva3VEJSJ2/wUjyoBwsLyDn9jTn4oUEblIhiOQbEsAs/ly
 gzjzXIKLTpAWcz642D17+ZNuiXJx+6nl3rxOCEIcJhm9T/UYcSDMy3MmjnNzKZxlAyyx
 BqmISK9HeuL7TDsHMoo5ziwRdASg6Wi8idHT2KtIRmvcAlwafc/Z9+6RqTPMUPCGWbTX
 xmb2FBLkkPO4AGcVU7+rxh8a97oxcyjp8eyUhzqrX8+xuow1wp3Ag7nIFZYOikLRKZou
 8YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sx4w7Ly1ifRX/iEBNixOiCMpxM0l3zOWr1dP3UPbXTU=;
 b=WDNBIi+Lw/OknmqFt+qEoVzxSQJ1qhlnJ0ZiofuR/iZOX8WtQ4+8gJ1Oz9imd2YMIH
 NOlvlUDVZf6Ev2tUaTEx5PYkhnBR8xhOyGT8z8mOVFy36eD0mqiEtVHvuXxERUqJ2rR4
 m7RyQTfr69/bydBFmDLie6G2RJeXa7gWbD2tx9BCJiSdXjnUa3B949KsNA41kS+OofDb
 tTkxsSbDBSsgb2ACFUZN3JUADaSZCbFI/8Z/6LqbmY+Lbv55pZ/3EBN9XG6ODbKmeR9T
 zeetmp3hH0t5N/kbAJKKQ5rdV28ryO8A4/cMwSVDOtRRH4uNY/hyIM7Q72ENFXkRpI0l
 FfgQ==
X-Gm-Message-State: AOAM532WsAro7EAFrpAnCiFOOwFrd+Vg4fs+1czltlXsCI07ZjBzkfgs
 mmPXpdVLbsA/xObuQqO/5VB69SkyZKtRQiMLwPW83w==
X-Google-Smtp-Source: ABdhPJzjF7x+oA5lt7XIbdhtzlu26poc+zlh4wy+TTLzY+Sq50QQk6F60KxsQdmTHjNqEUpuCSgDWPJESC4VRGgmAtY=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr6793485pjb.179.1648741932463; Thu, 31
 Mar 2022 08:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
 <20220331154503.66054-4-jagan@amarulasolutions.com>
In-Reply-To: <20220331154503.66054-4-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:52:01 +0200
Message-ID: <CAG3jFyu5y7REsUmJUrfWo4GLM_1_fhwPK=1EKoRbGkq6OmbXsQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm: bridge: dw-mipi-dsi: Switch to
 devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 17:45, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4, v3:
> - none
> Changes for v2:
> - split the patch
>
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 1cc912b6e1f8..b2efecf7d160 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -315,7 +315,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>         struct dw_mipi_dsi *dsi = host_to_dsi(host);
>         const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
>         struct drm_bridge *bridge;
> -       struct drm_panel *panel;
>         int ret;
>
>         if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,17 +328,9 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>         dsi->format = device->format;
>         dsi->mode_flags = device->mode_flags;
>
> -       ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -                                         &panel, &bridge);
> -       if (ret)
> -               return ret;
> -
> -       if (panel) {
> -               bridge = drm_panel_bridge_add_typed(panel,
> -                                                   DRM_MODE_CONNECTOR_DSI);
> -               if (IS_ERR(bridge))
> -                       return PTR_ERR(bridge);
> -       }
> +       bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
> +       if (IS_ERR(bridge))
> +               return PTR_ERR(bridge);
>
>         dsi->panel_bridge = bridge;
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
