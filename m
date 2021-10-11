Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C82428782
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 09:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF589FDD;
	Mon, 11 Oct 2021 07:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAE489F97
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:43:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id d3so36159266edp.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 23:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bYl5CRIyrC8wFN0NYRqQbeVluqzSNbGhILQFZ99pqqg=;
 b=do7i0hZXQxXmbFMlBAc/jYFNLbCovmgxI8OXYrORIWKNB9ksGnbxrPDNGTF9cOgEfL
 t5lKGavhkGnOk3KDk7t2wpPCa8Lsil040jHpP1pFzRXoXRxI6pb4gG7DqDdLe7OeJdy3
 Rgbr9mjvCGtR9SaC9LmDEPHhiu5X0d15M7MyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bYl5CRIyrC8wFN0NYRqQbeVluqzSNbGhILQFZ99pqqg=;
 b=aAjqeqImUR553clNqSHXrZJPwVztr38eBtPcHcFCScz5glUX/dIBeNTtzDSMK5Hltw
 YtxIkazDDFcwZ2u9Xpm8ztt5i8Qb8ixLYxjXzmmPYoEiQy2hNcuK+Mu/I2WcjDEArhcI
 t4yDEf5v+ngDj8oC7Uf4yC8Y8Dg0KZbNfhsvzlI8msKGTqbJubK7GzTm5hxpId1RBTkB
 e0LloyBDaf6r+OG0KFyKYlriyLAcdJvnXNOUkH3wcEzEeEPnh9q4DpZKqrNNzWsAohCt
 wpky8e2HuJPYPNhFPp8HsiSIFxdRcM+8QP+2EYCK5AaMB+pfDGh3r8hCPrqRfMf4OgHc
 jVpQ==
X-Gm-Message-State: AOAM532ngPK3yNoanSUv+EMwpnhVFMiu6qJMha5k6lfAkbu8HePw9UXY
 AHenzJ+L3h/EDabRcEknDJQJXA==
X-Google-Smtp-Source: ABdhPJxQWnbpZPi8rf/dpw2QxAGpGwY5atfOgMtsunmWfo9cBl9+I7SHNG/TPByiGhuGeiiBZLM7vA==
X-Received: by 2002:a17:906:6844:: with SMTP id
 a4mr23059097ejs.65.1633934593255; 
 Sun, 10 Oct 2021 23:43:13 -0700 (PDT)
Received: from panicking ([2.198.78.7])
 by smtp.gmail.com with ESMTPSA id c11sm3659023edk.68.2021.10.10.23.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 23:43:12 -0700 (PDT)
Date: Mon, 11 Oct 2021 08:42:52 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Heiko Stubner <heiko@sntech.de>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Liu <net147@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexander Sack <asac@linaro.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
Message-ID: <20211011063948.GA1487752@panicking>
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704140309.268469-1-jagan@amarulasolutions.com>
X-Mailman-Approved-At: Mon, 11 Oct 2021 07:15:20 +0000
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

Hi

On Sun, Jul 04, 2021 at 07:33:09PM +0530, Jagan Teki wrote:
> Finding panel_or_bridge might vary based on associated
> DSI devices like DSI panel, bridge, and I2C based DSI
> bridge.
> 
> 1. DSI panels and bridges will invoke the host attach
>    from probe in order to find the panel_or_bridge.
> 
>    chipone_probe()
>        dw_mipi_dsi_host_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 
>    ltdc_encoder_init().start
>        dw_mipi_dsi_bridge_attach().start
> 		   dw_mipi_dsi_host_attach().start
> 		       chipone_attach(). start
> 
> 	               chipone_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>        dw_mipi_dsi_bridge_attach(). done
>    ltdc_encoder_init().done
> 
> 2. I2C based DSI bridge will invoke the drm_bridge_attach
>    from bridge attach in order to find the panel_or_bridge.
> 
>    ltdc_encoder_init().start
>        dw_mipi_dsi_bridge_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 		   dw_mipi_dsi_host_attach().start
> 		       sn65dsi83_attach(). start
> 
> 	               sn65dsi83_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>        dw_mipi_dsi_bridge_attach(). done
>    ltdc_encoder_init().done
> 
> So, invoke the panel_or_bridge from host attach and
> bridge attach in order to find all possible DSI devices.
> 

Working on linux-next-5.14-rc4 on px30-evb rockchip board. On top of this patch for px30 dsi
I need to add:


From a0e0344b4cb4df3d97fac0e27e0aa76a2a191b0e Mon Sep 17 00:00:00 2001
From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Sun, 10 Oct 2021 23:56:20 +0200
Subject: [PATCH] drm: dw-mipi-dsi-rockchip: Avoid the attach before probe is
 completed

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   |  8 +++++++-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++++++----
 include/drm/bridge/dw_mipi_dsi.h                |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 45f4515dda00..a5535f183af3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -362,8 +362,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 		dsi->device_found = true;
 	}
 
+	/*
+	 * NOTE: the dsi registration is implemented in
+	 * platform driver, that to say dsi would be exist after
+	 * probe is terminated. The call is done before the end of probe
+	 * so we need to pass the dsi to the platform driver.
+	 */
 	if (pdata->host_ops && pdata->host_ops->attach) {
-		ret = pdata->host_ops->attach(pdata->priv_data, device);
+		ret = pdata->host_ops->attach(pdata->priv_data, device, dsi);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index ec7729d18cb8..cf7c9cf11c9e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -972,12 +972,15 @@ static const struct component_ops dw_mipi_dsi_rockchip_ops = {
 };
 
 static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
-					    struct mipi_dsi_device *device)
+					    struct mipi_dsi_device *device,
+					    struct dw_mipi_dsi *dmd)
 {
 	struct dw_mipi_dsi_rockchip *dsi = priv_data;
 	struct device *second;
 	int ret;
 
+	dsi->dmd = dmd;
+
 	ret = component_add(dsi->dev, &dw_mipi_dsi_rockchip_ops);
 	if (ret) {
 		DRM_DEV_ERROR(dsi->dev, "Failed to register component: %d\n",
@@ -1027,6 +1030,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct dw_mipi_dsi_rockchip *dsi;
 	struct resource *res;
+	struct dw_mipi_dsi *dmd;
 	const struct rockchip_dw_dsi_chip_data *cdata =
 				of_device_get_match_data(dev);
 	int ret, i;
@@ -1115,9 +1119,9 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	dsi->pdata.priv_data = dsi;
 	platform_set_drvdata(pdev, dsi);
 
-	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
-	if (IS_ERR(dsi->dmd)) {
-		ret = PTR_ERR(dsi->dmd);
+	dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
+	if (IS_ERR(dmd)) {
+		ret = PTR_ERR(dmd);
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev,
 				      "Failed to probe dw_mipi_dsi: %d\n", ret);
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index bda8aa7c2280..cf81f19806ad 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -41,7 +41,7 @@ struct dw_mipi_dsi_phy_ops {
 
 struct dw_mipi_dsi_host_ops {
 	int (*attach)(void *priv_data,
-		      struct mipi_dsi_device *dsi);
+		      struct mipi_dsi_device *dsi, struct dw_mipi_dsi *dmd);
 	int (*detach)(void *priv_data,
 		      struct mipi_dsi_device *dsi);
 };

During the probing the sequence let arrive to attach before the rockchip
driver terminate to be registered. Anyway the panel is not working at
the moment for some timing issue

Michael

-- 
2.25.1

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 ++++++++++++++-----
>  1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..45f4515dda00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -246,6 +246,7 @@ struct dw_mipi_dsi {
>  
>  	struct clk *pclk;
>  
> +	bool device_found;
>  	unsigned int lane_mbps; /* per lane */
>  	u32 channel;
>  	u32 lanes;
> @@ -309,13 +310,37 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
>  	return readl(dsi->base + reg);
>  }
>  
> +static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
> +				       struct device_node *node)
> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
> +	if (!dsi->panel_bridge)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  				   struct mipi_dsi_device *device)
>  {
>  	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>  	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,22 +354,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ret;
> +	if (!dsi->device_found) {
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
> +		if (ret)
> +			return ret;
>  
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		dsi->device_found = true;
>  	}
>  
> -	dsi->panel_bridge = bridge;
> -
> -	drm_bridge_add(&dsi->bridge);
> -
>  	if (pdata->host_ops && pdata->host_ops->attach) {
>  		ret = pdata->host_ops->attach(pdata->priv_data, device);
>  		if (ret < 0)
> @@ -999,6 +1016,16 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
>  	/* Set the encoder type as caller does not know it */
>  	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
>  
> +	if (!dsi->device_found) {
> +		int ret;
> +
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
> +		if (ret)
> +			return ret;
> +
> +		dsi->device_found = true;
> +	}
> +
>  	/* Attach the panel-bridge to the dsi bridge */
>  	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
>  				 flags);
> @@ -1181,6 +1208,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>  	dsi->bridge.of_node = pdev->dev.of_node;
>  #endif
> +	drm_bridge_add(&dsi->bridge);
>  
>  	return dsi;
>  }
> -- 
> 2.25.1
> 
> 
