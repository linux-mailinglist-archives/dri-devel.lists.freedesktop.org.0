Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B29FB81E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0741A10E240;
	Tue, 24 Dec 2024 01:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="scutNEYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69EB10E240
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:06:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso50740021fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735002378; x=1735607178; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
 b=scutNEYaiR5MGy0r68qxKTVhSqJQ+HNwIKMl+UN5hZM/+6cIojDetTNkqj/Hs/Q6qu
 qgompk3jbnR9+WeMqiFLtSGlqwykeQx9TG/II5frvmuRkM/DQdimKXTLG/xsPBjeBN/3
 RfZzMaqUr3AnT+fvy8UH0bc6KixrNz/klIshwHZrq1Jfb/2mo/N/vcHYzLjOjy9QzFx2
 v3yOGths7yipsdgMJIFufN09hGnkKF9npw6mWzo8ZS8fPSuKsIS2T3uPcp7AjnKshoer
 Izo0GBc/fvWmjAQqq6at98K/Jw+Q8wmYLgEkblKj9wCDyoQSmCmCVkdkDE2X9dtXFl5P
 f5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735002378; x=1735607178;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
 b=jImPfXxZv0KROCSsR794ksiGLw5iLCtxtKT2kXImdAVHlbuSxWOVcSgmu54jN+TJwR
 f0QTRclYKDR4DFdkUjk3DpVgbsonIW8Cfsnc7ZJLXSsxUXjPixFReKTj6RFm1SR22dPC
 5AAWe87muF7mACQQhcfZkqXIubSZI/wUMk/x9npYFdic8vnsjFtgZ+7U3CpKeTESwEKh
 Iy0zr06uJ/JcoL+ptHsBq9XWr5IR0UTfmDgn25HgK/kRAtQiNfT6LSuZ4jRFuupgp2wj
 cffzqk2Dld1wAtT642rcWILChWGR8psYCBCCX/aAXF1QobVyOz0VkPIVKQrLE+jWyvzz
 iPYg==
X-Gm-Message-State: AOJu0YwLfsNjPM8w41pFZD92p5/ePZnzDF61Xbu7y0Zrv2QmXwW3bBYV
 IdYQKgPIGrtUGeY7Y2Qb2NWXgN4MX/BE8JmEzY/nRIpe02FH1vQqbALFla1nEpA=
X-Gm-Gg: ASbGnctc2IQ2Nm5VSLqlmJU1NhIJvBLyuoV26aN3nVqYasaGGhcqa1lmBhE+nzK65ci
 7WxDBFM0znYg9OWn3yPut1dY6AY4S3qwq0UzZJxSHR7o5rTKmbgWtNcFC2vDvb0kMjXBRoj+G9y
 zFM7zIaX/dEeYCPxHT3RpMoPZdD4srMBTEOaXSc/ggQ+IEbgZmYYEnZB9vVz2nwp6e0pCnujeYG
 joIeh0AdhBZ/4YCBcufiA8dyT+9djURy/hRjoPRyA+Rv88L84cT9FOI6DEn9YVfN4NmH4SmB/wM
 gLecQ13ho61JgTTHAi3BJ/K2C8ZCvyTImmEI
X-Google-Smtp-Source: AGHT+IFB9DIkvfAI7cjpDzasCEmR4TU1CXKXT3DFKiXSsCrTKBANpHD1zxLbg90VBtOFOdmeLLerQQ==
X-Received: by 2002:a2e:a991:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30468577a7fmr49728481fa.22.1735002378148; 
 Mon, 23 Dec 2024 17:06:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6cccasm15083871fa.1.2024.12.23.17.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:06:16 -0800 (PST)
Date: Tue, 24 Dec 2024 03:06:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <mqvhpdofvtuiewzkfn7qghwwmpf6o5d6ru6yq7lif6znvcva3a@piu42vpzofzk>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-3-marex@denx.de>
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

On Tue, Dec 24, 2024 at 01:42:49AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Mini.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 36 +++++++++++++++++++++----------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++---
>  4 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 07fb6901996ae..e67de148955b2 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 59020862cf65e..d034c21e186a4 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -118,10 +119,10 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
>  
>  static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  {
> +	struct drm_connector *connector = &mxsfb->connector;

Drop the initialisation, it is useless.

>  	struct drm_device *drm = mxsfb->drm;
> -	struct drm_connector_list_iter iter;
> -	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> @@ -139,21 +140,34 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  	if (!bridge)
>  		return -ENODEV;
>  
> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret)
>  		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>  
> -	mxsfb->bridge = bridge;
> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to initialize bridge connector: %pe\n",
> +			      connector);
> +		return ret;
> +	}
>  
> -	/*
> -	 * Get hold of the connector. This is a bit of a hack, until the bridge
> -	 * API gives us bus flags and formats.
> -	 */
> -	drm_connector_list_iter_begin(drm, &iter);
> -	mxsfb->connector = drm_connector_list_iter_next(&iter);
> -	drm_connector_list_iter_end(&iter);
> +	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
> +	if (ret < 0) {
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to attach encoder.\n");
> +		goto err_cleanup_connector;
> +	}
> +
> +	mxsfb->bridge = bridge;
>  
>  	return 0;
> +
> +err_cleanup_connector:
> +	drm_connector_cleanup(connector);
> +	return ret;
>  }
>  
>  static irqreturn_t mxsfb_irq_handler(int irq, void *data)
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25fc..7a24e96ab4263 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -43,7 +43,7 @@ struct mxsfb_drm_private {
>  	} planes;
>  	struct drm_crtc			crtc;
>  	struct drm_encoder		encoder;
> -	struct drm_connector		*connector;
> +	struct drm_connector		connector;

This connector isn't getting used. How is this supposed to work? Store
the connector that you got from drm_bridge_connector_init() here
instead.

>  	struct drm_bridge		*bridge;
>  
>  	bool				crc_active;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 7ed2516b6de05..30584091e2aa8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -281,7 +281,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> -	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
> +	u32 bus_flags = mxsfb->connector.display_info.bus_flags;
>  	int err;
>  
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
> @@ -378,8 +378,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	/* If there is no bridge, use bus format from connector */
> -	if (!bus_format && mxsfb->connector->display_info.num_bus_formats)
> -		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +	if (!bus_format && mxsfb->connector.display_info.num_bus_formats)
> +		bus_format = mxsfb->connector.display_info.bus_formats[0];
>  
>  	/* If all else fails, default to RGB888_1X24 */
>  	if (!bus_format)
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
