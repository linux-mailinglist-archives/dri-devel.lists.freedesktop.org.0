Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E47794EC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1510E6BF;
	Fri, 11 Aug 2023 16:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0F410E6BD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:42:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so3408734e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691772125; x=1692376925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EqXYn1ppGt3moRC8rckrU8+Vg4tspq9IiH2IQ5aagXs=;
 b=cxnPXWaEJyjFnjHvktdv4p03V4t1UaB57LvJjjG2Az4j1cTYlBHbiB1KHNovGnbIg6
 9MZ4ZzOlyMNXNoVVTvOdy7DoUGSMpA3Ovb99wZ8urJnV9D1tucCYguj5xPbBD+/IM84F
 DcOkKI18GIPWOiP9CTcu0uP2xxUBhxgUsvACSxq/rToFF6amA07w/hRLiqI0Xu7K0F+L
 yP2jmSrkpxUGAkbXUaS1IV1vpdQLkN93NLbxxnSm6674kgqjsmcqtZLwI2JqfoxAlxEm
 NGpyhsz1i8u3lDAR1cpqzfrGyEHrVImK0sd0QsPYA7mYZCbZiJHkUe2TIdAEtWBVuR6y
 cdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691772125; x=1692376925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EqXYn1ppGt3moRC8rckrU8+Vg4tspq9IiH2IQ5aagXs=;
 b=UZelvq3h9HsvY9ZzqWa9aRdzIKmfEuV5HY58BJP/UAYrMENe0U8cOpvWBAfQIgbZfQ
 uSkphChdFIBC/C38FyVhg0tgzFZoiRWxOQvfBMhGuQ1sMIm8ug0ScycWcZGMWwudZLh3
 OrTrwq5Uwr0gea2FqeMxqfxV1S5e8KQAymnpZxnICR+mRJ7c6I1KIhrRwjBISK7zRtyn
 JdlvOFHglPesZ7Shie0n2ZmEjkbSvDO58qOqtmqjK1OeyX3/9OikcPMEm9NgCYn6njbh
 yzEZ7FsxfNhOePbZ0PRgoeljdJ/5WEUGp0VAqIheCfgsjF62OvcOJDCPEfZ1SM8pp/bg
 KF1A==
X-Gm-Message-State: AOJu0YwywIPAxY9zAE2Rz3/BGijie7bcQPW1WgP8AEKSpbV0nXEBoULA
 9jGdMTwpQjyZ68VCvvfp6d8=
X-Google-Smtp-Source: AGHT+IH8ialG1cnsrmSX/EaXJpuPINUi0dq1Nzmicg1lnnKlYllBUwJwtX1Hu1vgrcrFDfHiaqd8/g==
X-Received: by 2002:a05:6512:695:b0:4fe:711:2931 with SMTP id
 t21-20020a056512069500b004fe07112931mr2672090lfe.22.1691772124482; 
 Fri, 11 Aug 2023 09:42:04 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32]) by smtp.gmail.com with ESMTPSA id
 s6-20020a19ad46000000b004fe951827easm400815lfd.196.2023.08.11.09.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:42:04 -0700 (PDT)
Message-ID: <bce1096a-ffd5-4fd7-a279-7b5235b81b3f@gmail.com>
Date: Fri, 11 Aug 2023 19:44:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/08/2023 13:44, Tomi Valkeinen wrote:

I would rather have a commit message than a blank one.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 64 +++++++++++++++++++++++++++------------
>  1 file changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index ea19de5509ed..a567f136ddc7 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -131,8 +131,17 @@ static const char * const tc358768_supplies[] = {
>  
>  struct tc358768_dsi_output {
>  	struct mipi_dsi_device *dev;
> +
> +	/* Legacy field if DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used */
>  	struct drm_panel *panel;
> -	struct drm_bridge *bridge;
> +
> +	/*
> +	 * If DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used and a panel is attached
> +	 * to tc358768, 'next_bridge' contains the bridge the driver created
> +	 * with drm_panel_bridge_add_typed(). Otherwise 'next_bridge' contains
> +	 * the next bridge the driver found.
> +	 */
> +	struct drm_bridge *next_bridge;

why it is better to call it next_bridge than just bridge? Is there a
prev_bridge also?

>  };
>  
>  struct tc358768_priv {
> @@ -391,8 +400,6 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
>  				    struct mipi_dsi_device *dev)
>  {
>  	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>  	struct device_node *ep;
>  	int ret;
>  
> @@ -420,21 +427,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
>  		return -ENOTSUPP;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
> -					  &bridge);
> -	if (ret)
> -		return ret;
> -
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> -	}
> -
>  	priv->output.dev = dev;
> -	priv->output.bridge = bridge;
> -	priv->output.panel = panel;
>  
>  	priv->dsi_lanes = dev->lanes;
>  	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
> @@ -463,7 +456,7 @@ static int tc358768_dsi_host_detach(struct mipi_dsi_host *host,
>  
>  	drm_bridge_remove(&priv->bridge);
>  	if (priv->output.panel)
> -		drm_panel_bridge_remove(priv->output.bridge);
> +		drm_panel_bridge_remove(priv->output.next_bridge);
>  
>  	return 0;
>  }
> @@ -544,7 +537,40 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
>  		return -ENOTSUPP;
>  	}
>  
> -	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		struct device_node *node;
> +
> +		/* Get the next bridge, connected to port@1. */
> +		node = of_graph_get_remote_node(priv->dev->of_node, 1, -1);
> +		if (!node)
> +			return -ENODEV;
> +
> +		priv->output.next_bridge = of_drm_find_bridge(node);
> +		of_node_put(node);
> +		if (!priv->output.next_bridge)
> +			return -EPROBE_DEFER;
> +	} else {
> +		struct drm_bridge *bridge;
> +		struct drm_panel *panel;
> +		int ret;
> +
> +		ret = drm_of_find_panel_or_bridge(priv->dev->of_node, 1, 0,
> +						  &panel, &bridge);
> +		if (ret)
> +			return ret;
> +
> +		if (panel) {
> +			bridge = drm_panel_bridge_add_typed(panel,
> +				DRM_MODE_CONNECTOR_DSI);
> +			if (IS_ERR(bridge))
> +				return PTR_ERR(bridge);
> +		}
> +
> +		priv->output.next_bridge = bridge;
> +		priv->output.panel = panel;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder, priv->output.next_bridge, bridge,
>  				 flags);
>  }
>  
> 

-- 
Péter
