Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF254EDE0E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8319210F406;
	Thu, 31 Mar 2022 15:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4910F406
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:55:52 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id t13so143897pgn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfZ4YjhCUdPTqUxxdgP7i11SONGzsgH3T/5nmaaIz9M=;
 b=mCZZn6AzPZLw6vnOHPSDl73r0J7pGHR/4YUgOYIKQ8LR0hQ2QYihhQ5FKnb/KjQBr4
 2zE8bmXFgM/M0hYXZNXzT4bzxKkxCDuTG2r9Cu6Kisd0BCMczX8HJ/c1vewByKB146u/
 Goum+zExZiBjqYmtOinkitJNHvtMtgXKjECT82hFnOak9XkDoC9b5g9ZPMaJZJ/6bUDC
 ZHJdl1b8Bstl7qL5KFrQ39zjFLdF+TqaOIfP1oIpCwdDQkQ7XFFu7baO2l6Yx8umGrQR
 i+q+MvFBrhx0YmDyZ0DKvIDHNWZBx9jBHiJC+9KtZOvjMeA/R224ntmUaWLge502Livf
 7pqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfZ4YjhCUdPTqUxxdgP7i11SONGzsgH3T/5nmaaIz9M=;
 b=kzY7VKLvtmyPp4c5IO1adl4FzeEnvw18pHmImnnFkOhnNMAunFkACmfqoXijRnIEA6
 kNFUDFUChOn0bNfjNJMZvVP443Mh2eaiC9Cg+aTTtTtUKG6iy/QAOKOSTjpBwJY+bbtI
 UPmn0da+WDk1U1D1ei5COWqLb1FczodtNf/CXDCTq5XHRVmxro0SImvr/S7xU0sD9EvM
 JB3/XnpXLPZw/7flhksD8feC/eFxxN+/YgN6uxP3HM2FgWC1CZqyH3+Acfumq123VpXC
 zN05J1b4htEX9ASmd8Fc0MJjis2qYDSG2E/qIyLTGVYET9Dfi/wXeZ1g3cFzJp4Fh6aC
 3I+Q==
X-Gm-Message-State: AOAM531XI8182XM3uuDqpx0FJTlPMTjEWhxLJ3iJkjh/OdqgXJQsnsGp
 m9kosdn09u2ewCgBlxkdHTuJhP0lBrh8+iDnz3HGCQ==
X-Google-Smtp-Source: ABdhPJyL6P+p8VOGVKAMMpIHJhe6uTWzuAgYOOzuipO3LxqFCDqq3aJm4ZHhzordXEp9ND7qVUz36pNFOdqcL5b8lQs=
X-Received: by 2002:a63:574d:0:b0:386:c67:b383 with SMTP id
 h13-20020a63574d000000b003860c67b383mr11281057pgm.324.1648742152213; Thu, 31
 Mar 2022 08:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
In-Reply-To: <20220331154503.66054-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 17:55:41 +0200
Message-ID: <CAG3jFysdZ4chY3CC1JZJvD9aShjDOr9dwXOX8rpVnR3QF8KE1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] Revert "drm/bridge: dw-mipi-dsi: Find the possible
 DSI devices"
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
> This reverts commit c206c7faeb3263a7cc7b4de443a3877cd7a5e74b.
>
> In order to avoid any probe ordering issues, the I2C based downstream
> bridge drivers now register and attach the DSI devices at the probe
> instead of doing it on drm_bridge_function.attach().
>
> Examples of those commits are:
>
> commit <6ef7ee48765f> ("drm/bridge: sn65dsi83: Register and attach our
> DSI device at probe")
> commit <d89078c37b10> ("drm/bridge: lt8912b: Register and attach our DSI
> device at probe")
> commit <864c49a31d6b> ("drm/bridge: adv7511: Register and attach our DSI
> device at probe")
>
> dw-mipi-dsi has panel or bridge finding code based on previous downstream
> bridges, so revert the same and make the panel or bridge funding in host
> attach as before.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4, v3, v2:
> - none
>
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 +++++--------------
>  1 file changed, 15 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 11d20b8638cd..1cc912b6e1f8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -246,7 +246,6 @@ struct dw_mipi_dsi {
>
>         struct clk *pclk;
>
> -       bool device_found;
>         unsigned int lane_mbps; /* per lane */
>         u32 channel;
>         u32 lanes;
> @@ -310,37 +309,13 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
>         return readl(dsi->base + reg);
>  }
>
> -static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
> -                                      struct device_node *node)
> -{
> -       struct drm_bridge *bridge;
> -       struct drm_panel *panel;
> -       int ret;
> -
> -       ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> -       if (ret)
> -               return ret;
> -
> -       if (panel) {
> -               bridge = drm_panel_bridge_add_typed(panel,
> -                                                   DRM_MODE_CONNECTOR_DSI);
> -               if (IS_ERR(bridge))
> -                       return PTR_ERR(bridge);
> -       }
> -
> -       dsi->panel_bridge = bridge;
> -
> -       if (!dsi->panel_bridge)
> -               return -EPROBE_DEFER;
> -
> -       return 0;
> -}
> -
>  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>                                    struct mipi_dsi_device *device)
>  {
>         struct dw_mipi_dsi *dsi = host_to_dsi(host);
>         const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> +       struct drm_bridge *bridge;
> +       struct drm_panel *panel;
>         int ret;
>
>         if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -354,14 +329,22 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>         dsi->format = device->format;
>         dsi->mode_flags = device->mode_flags;
>
> -       if (!dsi->device_found) {
> -               ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
> -               if (ret)
> -                       return ret;
> +       ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> +                                         &panel, &bridge);
> +       if (ret)
> +               return ret;
>
> -               dsi->device_found = true;
> +       if (panel) {
> +               bridge = drm_panel_bridge_add_typed(panel,
> +                                                   DRM_MODE_CONNECTOR_DSI);
> +               if (IS_ERR(bridge))
> +                       return PTR_ERR(bridge);
>         }
>
> +       dsi->panel_bridge = bridge;
> +
> +       drm_bridge_add(&dsi->bridge);
> +
>         if (pdata->host_ops && pdata->host_ops->attach) {
>                 ret = pdata->host_ops->attach(pdata->priv_data, device);
>                 if (ret < 0)
> @@ -1021,16 +1004,6 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
>         /* Set the encoder type as caller does not know it */
>         bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
>
> -       if (!dsi->device_found) {
> -               int ret;
> -
> -               ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
> -               if (ret)
> -                       return ret;
> -
> -               dsi->device_found = true;
> -       }
> -
>         /* Attach the panel-bridge to the dsi bridge */
>         return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
>                                  flags);
> @@ -1217,7 +1190,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node = pdev->dev.of_node;
>  #endif
> -       drm_bridge_add(&dsi->bridge);
>
>         return dsi;
>  }
> --
> 2.25.1
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>
