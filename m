Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEB9FFD4D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 18:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ABF10E755;
	Thu,  2 Jan 2025 17:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pu/ztOq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268AE10E755
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 17:59:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-540215984f0so12295661e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 09:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735840717; x=1736445517; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
 b=pu/ztOq5c2DeHQsze6Yz2TCA2BoYkLR20zvrDTMjhEHTu2+ZFWA3SyBu7u9hcs0rKw
 d24yA/Kf6zWaeqwALWQcEOg2EO+0bXI7mzOAr3qUnRMQALSsA5rchRSuSt/53jlP18N6
 p3zzbkkEXAhLXeQl+Imc9a3D3izsufOGX01d33Og+jp1Z3W9pPtHqceOPLA10y/X8/l1
 4Jj6qbR8JjFos6PwohDe2T1AROo4fSeim+Annk6H111jUwzL2W1d6fkr8UE0rPZYmpFT
 5RL4s/JL6yCW281gB3TlHK/xv9JN2oi5GZsjOnSjADKOE6n77DA31CpO9cz9XZIfaBDk
 pflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735840717; x=1736445517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
 b=iziHoGv5KMe+B5TySQr0olp9PkQ3g/2wFm0C/M5LSvgFleycUif24zEflOq8SV7Luc
 3TCEv5TO+ym9VWE73fmtE0CFTRLtOItWcnQ7Gzq0IUsrlupc3vdQZDfD4uxgRr60GIdC
 uLxL7gDNgz3w8lhG35vRpeNd0HmQgcxLBGAg84BE8yz/oEUZzplrsBONWXco39ffw1KR
 i1SX4+0GE0Y787PkgXDPJOAjrc/hZpW3+mQYXXmik7Cxl7JmyrhG2b9VWShReCsG2G/o
 NrE3h00tIePPrllHEAwPCzwrlfLH1/izaE2jySUg65upWEQsKTOetC6wizIyoVk7qFxN
 bYag==
X-Gm-Message-State: AOJu0YwQjX5E54261ztRtibMBz8Aa2f9jEJJMgoIDDVvazJAixxt0uVP
 aVCHBD8Q942+dRHLoHbsUIHii5uKq40wyrrgZvSEuRJ+YRHCUzHsJkHRCO9vV0s=
X-Gm-Gg: ASbGncsQmtLbxmIKJMqBNRiTZQnkSfBK1OSTT+9R1Yx7lTQrX8Yx3yK67T+8hRE6Isz
 w69AuUehLr0SoZWc14vAC9hJorT91Byd10CYW8C9A/fZYOliBWuOpQQV7Jrrl+U/FF+4xuQubYb
 HUBYxI0WGodeevzJJjLY9yvPf30tL0fyZMqVPI6ShBBGO0LMjeMQjh7mRXDg/AxRAf+53RrwmeX
 3cDj86yKEdHmzi3kyDYbpZPS8bqBAz7kI5BrsmLvxIY8/cVk50RAuFyFK0TBTPkZBLE+e8F/iLh
 qmHHM/KhIN9QL/im4j/p/jTqFp/EeBXjqPdn
X-Google-Smtp-Source: AGHT+IGsMD2AJtN8AO7P8Gm6p46pCYxJlOrHtLA9sNt/dLBZQv2u2yZ/9NF4quLmhSUrRcYhu3IfXg==
X-Received: by 2002:a05:6512:39d0:b0:542:2a20:e69a with SMTP id
 2adb3069b0e04-5422a20e779mr13437754e87.11.1735840717312; 
 Thu, 02 Jan 2025 09:58:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238138c3sm3880439e87.140.2025.01.02.09.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 09:58:35 -0800 (PST)
Date: Thu, 2 Jan 2025 19:58:33 +0200
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
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-3-marex@denx.de>
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

On Tue, Dec 31, 2024 at 08:28:50PM +0100, Marek Vasut wrote:
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
> This makes LT9611 work with i.MX8M Plus.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
> V2: Add RB from Dmitry
> V3: - Select DRM_DISPLAY_HELPER
>     - Use return dev_err_probe() directly
>     - Add missing of_node_put(ep)
>     - Add test using drm_bridge_get_next_bridge() to try and determine
>       if the HDMI connector was missing in DT or not, and if it was
>       missing, if it was created by the HDMI bridge driver.
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f455547..fe98674d5a298 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR

Shouldn't this chunk go to another patch?

>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> @@ -28,6 +29,7 @@ config DRM_IMX_LCDIF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
>  	select DRM_CLIENT_SELECTION
> +	select DRM_DISPLAY_HELPER
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 8ee00f59ca821..dc39adabb3cd9 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -17,6 +17,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -48,8 +49,10 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
>  	struct device *dev = lcdif->drm->dev;
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_connector *connector;
>  	struct device_node *ep;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge, *nextbridge;
>  	int ret;
>  
>  	for_each_endpoint_of_node(dev->of_node, ep) {
> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>  
> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret = drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		nextbridge = drm_bridge_get_next_bridge(bridge);
> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> +		/* Test if connector node in DT, if not, it was created already */

By whom? And why? There is no display-connector bridge, but there is a
normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
now it's a proper time to create drm_bridge_connector. You have added
the next_bridge_optional flag, but it should just prevent the dw driver
from returning the error if there is no next_bridge.

> +		if (!nextbridge)
> +			continue;
> +
> +		connector = drm_bridge_connector_init(drm, encoder);
> +		if (IS_ERR(connector)) {
> +			of_node_put(ep);
> +			return dev_err_probe(drm->dev, PTR_ERR(connector),
> +					     "Failed to initialize bridge connector: %pe\n",
> +					     connector);
> +		}
> +
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret < 0) {
> +			of_node_put(ep);
> +			drm_connector_cleanup(connector);
> +			return dev_err_probe(drm->dev, ret,
> +					     "Failed to attach encoder.\n");
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
