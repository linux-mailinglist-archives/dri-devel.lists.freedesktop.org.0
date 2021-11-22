Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE58458EBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 13:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8708999E;
	Mon, 22 Nov 2021 12:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4581B8999E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 12:52:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d27so32539814wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 04:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nyzrSrIyHqsq1LjaPjX2iqTLULy4Z6Z5BdospKxSlJY=;
 b=kR5eJHzcNuDQTvSpWwm7RGLzB5JOz3Sb843vP+TVMSVO8ocIam0UgLOz9fwO93IJlS
 8YuWR8bZbQtOmAv0wOStirUYjE7JBJglE4HAv51B0AHmwzNMHX+HHX595Wg2AeaxIwPu
 J/P6A3FmvpGYp/UKQeUIiY+nBFjX6k/mIp3Hfhli49mDC22vLlWstu10Hf3yuM/hSfFg
 EIhZV3qw0KkjCukmL4eGOGPmkSfdpIFpmFzy2kzJJUBfMHEeXCEgdxI4yH3kjTPKpPEQ
 LGdn/DNE3mVs+swMmg+8tLMZEHLiq3P1evMrXOdPK8lAfWUmPQ8aaZeB8aSmJfb9avGj
 JvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nyzrSrIyHqsq1LjaPjX2iqTLULy4Z6Z5BdospKxSlJY=;
 b=gSJcaPPD+g3GPNYQ/7lEP7eQ16Pyey5AwIgYV1z3XsbM93qYqnzzlVy+/x0vYXfktO
 D6lssy7YusGY7zT0SLRWSMsJI/3qrS96yx42i8zzp18Nye4QmkEMKTnd70lp9B+7aZI/
 N/ax9pcpuC5sbP0J6Gm1uqFbBaZ3IOejT8wqVUgAT4TByI9MJQclMmXeYz2R7Xvqo96V
 svzrJ4a7cx3qmv5b2yxl4O+PrmXr6TMSXaXsMVOy3ajDWQHCHf1Q0vXW9qOnqytZNSb5
 HOTiBIrI/XKK6mWHB0AhCyi62BEX2N82qSWOWOmjJi961d+3UQ8talXHhpE/a79JLZ1Y
 GwgQ==
X-Gm-Message-State: AOAM533b2veymbd+vAH1gsA8YevQy6EsWEDLxw+MWUglgMDd0tEU7fq1
 4F0TW1rManeRD2wi7GwD+RPBPQ==
X-Google-Smtp-Source: ABdhPJwdC+WsPMh2aJ4eLbLlWlidyEKSz5uuOyDwmoRvrSG6TNfMSNkkSSZN0/bbb6BFIzC1UmRoTA==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr37547383wrt.41.1637585540506; 
 Mon, 22 Nov 2021 04:52:20 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:68f2:9b9a:7f6d:f86c?
 ([2001:861:44c0:66c0:68f2:9b9a:7f6d:f86c])
 by smtp.gmail.com with ESMTPSA id t8sm10481544wmq.32.2021.11.22.04.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:52:19 -0800 (PST)
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
Date: Mon, 22 Nov 2021 13:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211122065223.88059-4-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/11/2021 07:52, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output, those
> can have an option to connect the DSI host by means of interface
> bridge converter.
> 
> This DSI to non-DSI interface bridge converter would requires
> DSI Host to handle drm bridge functionalities in order to DSI
> Host to Interface bridge.
> 
> This patch convert the existing to a drm bridge driver with a
> built-in encoder support for compatibility with existing
> component drivers.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v5:
> - add atomic APIs
> - find host and device variant DSI devices.
> Changes for v4, v3:
> - none
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
>  2 files changed, 96 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 43d9c9e5198d..a6a272b55f77 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -21,6 +21,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
>  	return 0;
>  }
>  
> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
> -	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> +	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
>  	struct mipi_dsi_device *device = dsi->device;
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_prepare(dsi->panel);
>  
> +	if (dsi->next_bridge)
> +		dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> +
>  	/*
>  	 * FIXME: This should be moved after the switch to HS mode.
>  	 *
> @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	if (dsi->panel)
>  		drm_panel_enable(dsi->panel);
>  
> +	if (dsi->next_bridge)
> +		dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> +


No need to call the next bridge atomic pre_enable/enable/disable/post_disable since they will
be called automatically on the bridge chain.

>  	sun6i_dsi_start(dsi, DSI_START_HSC);
>  
>  	udelay(1000);
> @@ -794,15 +802,19 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>  	sun6i_dsi_start(dsi, DSI_START_HSD);
>  }
>  
> -static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
> +static void sun6i_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_bridge_state)
>  {
> -	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
>  
>  	DRM_DEBUG_DRIVER("Disabling DSI output\n");
>  
>  	if (dsi->panel) {
>  		drm_panel_disable(dsi->panel);
>  		drm_panel_unprepare(dsi->panel);
> +	} else if (dsi->next_bridge) {
> +		dsi->next_bridge->funcs->atomic_disable(dsi->next_bridge, old_bridge_state);
> +		dsi->next_bridge->funcs->atomic_post_disable(dsi->next_bridge, old_bridge_state);

Ditto

>  	}
>  
>  	phy_power_off(dsi->dphy);
> @@ -842,9 +854,25 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
>  	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
> -	.disable	= sun6i_dsi_encoder_disable,
> -	.enable		= sun6i_dsi_encoder_enable,
> +static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> +
> +	if (dsi->next_bridge)
> +		return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> +					 NULL, 0);
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.atomic_enable		= sun6i_dsi_bridge_atomic_enable,
> +	.atomic_disable		= sun6i_dsi_bridge_atomic_disable,
> +	.attach			= sun6i_dsi_bridge_attach,
>  };
>  
>  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,
> @@ -966,8 +994,6 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  	struct sun6i_dsi *dsi = dev_get_drvdata(dev);
>  	int ret;
>  
> -	drm_encoder_helper_add(&dsi->encoder,
> -			       &sun6i_dsi_enc_helper_funcs);
>  	ret = drm_simple_encoder_init(drm, &dsi->encoder,
>  				      DRM_MODE_ENCODER_DSI);
>  	if (ret) {
> @@ -976,18 +1002,26 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
>  	}
>  	dsi->encoder.possible_crtcs = BIT(0);
>  
> -	drm_connector_helper_add(&dsi->connector,
> -				 &sun6i_dsi_connector_helper_funcs);
> -	ret = drm_connector_init(drm, &dsi->connector,
> -				 &sun6i_dsi_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DSI);
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
>  	if (ret) {
> -		dev_err(dsi->dev,
> -			"Couldn't initialise the DSI connector\n");
> +		dev_err(dsi->dev, "Couldn't attach drm bridge\n");
>  		goto err_cleanup_connector;
>  	}
>  
> -	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +	if (dsi->panel) {
> +		drm_connector_helper_add(&dsi->connector,
> +					 &sun6i_dsi_connector_helper_funcs);
> +		ret = drm_connector_init(drm, &dsi->connector,
> +					 &sun6i_dsi_connector_funcs,
> +					 DRM_MODE_CONNECTOR_DSI);
> +		if (ret) {
> +			dev_err(dsi->dev,
> +				"Couldn't initialise the DSI connector\n");
> +			goto err_cleanup_connector;
> +		}
> +
> +		drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
> +	}
>  
>  	return 0;
>  
> @@ -1013,16 +1047,46 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *host,
>  			    struct mipi_dsi_device *device)
>  {
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
> -	struct drm_panel *panel = of_drm_find_panel(device->dev.of_node);
> +	struct device_node *remote = device->dev.of_node;
>  	int ret;
>  
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> +	if (!of_device_is_available(remote)) {
> +		/**
> +		 * I2C interfaced DSI bridges will register DSI host on the
> +		 * bridge drivers instead of conventional device.
> +		 *
> +		 * Those are probed via host of_node instead of device of_node.
> +		 */
> +		remote = of_graph_get_remote_node(host->dev->of_node, 0, 0);
> +		if (!remote)
> +			return -ENODEV;
> +	}
> +
> +	dsi->panel = of_drm_find_panel(remote);
> +	if (IS_ERR(dsi->panel)) {
> +		dsi->panel = NULL;
> +
> +		dsi->next_bridge = of_drm_find_bridge(remote);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			dev_err(dsi->dev, "failed to find bridge\n");
> +			return PTR_ERR(dsi->next_bridge);
> +		}
> +	} else {
> +		dsi->next_bridge = NULL;
> +	}
> +
> +	of_node_put(remote);
>  
> -	dsi->panel = panel;
>  	dsi->device = device;
>  
> -	dev_info(host->dev, "Attached device %s\n", device->name);
> +	dev_info(host->dev, "Attached %s %s\n",
> +		 device->name, dsi->panel ? "panel" : "bridge");
> +
> +	dsi->bridge.funcs = &sun6i_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dsi->dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +	drm_bridge_add(&dsi->bridge);
>  
>  	ret = component_add(dsi->dev, &sun6i_dsi_ops);
>  	if (ret) {
> @@ -1040,9 +1104,11 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
>  	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
>  
>  	dsi->panel = NULL;
> +	dsi->next_bridge = NULL;
>  	dsi->device = NULL;
>  
>  	component_del(dsi->dev, &sun6i_dsi_ops);
> +	drm_bridge_remove(&dsi->bridge);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index 61e88ea6044d..d269304691c9 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -16,6 +16,7 @@
>  #define SUN6I_DSI_TCON_DIV	4
>  
>  struct sun6i_dsi {
> +	struct drm_bridge	bridge;
>  	struct drm_connector	connector;
>  	struct drm_encoder	encoder;
>  	struct mipi_dsi_host	host;
> @@ -30,6 +31,7 @@ struct sun6i_dsi {
>  	struct device		*dev;
>  	struct mipi_dsi_device	*device;
>  	struct drm_panel	*panel;
> +	struct drm_bridge	*next_bridge;
>  };
>  
>  static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
> @@ -37,6 +39,11 @@ static inline struct sun6i_dsi *host_to_sun6i_dsi(struct mipi_dsi_host *host)
>  	return container_of(host, struct sun6i_dsi, host);
>  };
>  
> +static inline struct sun6i_dsi *bridge_to_sun6i_dsi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct sun6i_dsi, bridge);
> +}
> +
>  static inline struct sun6i_dsi *connector_to_sun6i_dsi(struct drm_connector *connector)
>  {
>  	return container_of(connector, struct sun6i_dsi, connector);
> 

