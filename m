Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56029FF623
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 05:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DB010E1F5;
	Thu,  2 Jan 2025 04:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WXlnIwvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333410E1F5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 04:52:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-303489e8775so126677551fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2025 20:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735793510; x=1736398310; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
 b=WXlnIwvJxVNGTGQIiLBYuXa/fN3E5jr5sbmnSoOfRP1zWgAec7M8zOhGVGoJmOvOuo
 KHXyskbJfdcmAO+5+wdm4IyeDf6eUEfebR0crg2OKRAcG1J0AhJ7acdDrRzZOt7Q/jn2
 i81KDDjplKDVbpDeazWlm4pafWazenvZnTk944BlOMUaEbDhEUFZiRJ7bgBsgnsWjiQQ
 dBFDa1G79uyYg6ncI7k1Isf/DAmhCfmL/moL53kO+YaoPEn+I6NsRFAU/WN09cI04ZU2
 FJOyDMfVS4zQQ72Bc2IT19iSfv7aB9sLaERB34EJOv/mieQqaWIbY3WlLGjp5yY/VIPG
 XorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735793510; x=1736398310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRbuq/vJhOHDwWZyIZVQ1UR8FeorGGJoKh1JNDZST1k=;
 b=CpbasBXIk4L67kFCHJa4VQvxrKgN1TMKF22kw56vMS+zz3m9oNX+x9XPfv61T8FUzR
 FY4gdiJ6gXjCheJ42LIZ18nZJMvif/b0ivcNaqzfGfi4SmbYTBeRGOcw+kaO5rU9CPx8
 0P1V/2Fi9bhGOxJ3vmVTW1AkJuNuBLKCuJmjOQLbLY0nTkizUK7E82kayRAwpNa01g2X
 xh1QbTu2OTFR/5EwFSAsB/u+ba0gId4iuU6Md9aNKCYwk9MN9HjCatBbFL/KAwtf4aWf
 z755pJZRjAO6z5bRmgGihjXQBqOr6yTKuEtEDUsrDatbv7xE+AvsFdeT9ftB8ZrVu6+6
 mboQ==
X-Gm-Message-State: AOJu0Yzuel0uGzYxmJ35yU2TwbNGZ0fbcYBlQtE2ksMo0pCNtkKGdD0A
 nJFy56yRrjsfWK/znhMCFdgNIe1iGDAI2zqPUmTlkxnSZFlnivZ5mqbv9Owgpm8=
X-Gm-Gg: ASbGncst7d3xv7FKoE8d8Axea0XFAZjb4kIYJZcbElbAIvVyjwDLAy9ui0BM9CJ9PjX
 HDZj2Bf76QtoJdsWLuIN+MS9soiNeeQs2DM4Ww3hRDPtez9A/ZaBtdV8DMgE7nKnrZIADjkC5Ur
 8Tu5mJENu2k0IBG1k7PNTLWv5xCt/NlqTYVJOjfRFesMQ1wTDQ4c+SbXhKIgiuGLxVwo5MprDtq
 +3jI4uhtnztZmbsvwNi2P9DMxwQYOub/uDC2l3rYACQ+ROMdyBHdTTeN7gfm5ej1n+gENDqslLD
 8TOCjeaPg6p9cH/Lw9QWD6wVIIkOm9G5ySAT
X-Google-Smtp-Source: AGHT+IGE2Szq9qm9GN+rsyVm5RLYM6Bq9PLVSw4z6os4ljvKgQu4XGWjU61plLVc+yzsVHeip+HlRw==
X-Received: by 2002:a2e:a588:0:b0:2ff:c349:8d08 with SMTP id
 38308e7fff4ca-3046851e529mr158851661fa.8.1735793510280; 
 Wed, 01 Jan 2025 20:51:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad6c632sm42017411fa.21.2025.01.01.20.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 20:51:49 -0800 (PST)
Date: Thu, 2 Jan 2025 06:51:47 +0200
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
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <xqu2zjrefp2rgp2hyjqhi3nxypcxa7zpypct553upbxdsx64jr@wfn3dzzk3jxe>
References: <20241231192925.97614-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-1-marex@denx.de>
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

On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> HDMI but do not contain the HDMI connector node. This flag allows such
> DTs to work by creating the connector in the HDMI bridge driver. Do not
> use this flag, do not proliferate this flag, please fix your DTs.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Please describe that it is required for backwards compatibility with the
existing DTs. I think it is a good idea unless Shawn, Sascha or Fabio
tell that we should ignore backwards compatibility.

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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
> V3: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++++----
>  include/drm/bridge/dw_hdmi.h              |  2 ++
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004..852e73c0f686f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2893,9 +2893,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> -					 bridge, flags);
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> +		if (hdmi->plat_data->output_port_optional && !hdmi->next_bridge)
> +			return dw_hdmi_connector_create(hdmi);
> +		else
> +			return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +						 bridge, flags);
> +	}
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3298,7 +3302,7 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>  					  hdmi->plat_data->output_port,
>  					  -1);
>  	if (!remote)
> -		return -ENODEV;
> +		return hdmi->plat_data->output_port_optional ? 0 : -ENODEV;
>  
>  	hdmi->next_bridge = of_drm_find_bridge(remote);
>  	of_node_put(remote);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a46baa0737cd..3bb6e633424a8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -127,6 +127,8 @@ struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
>  	unsigned int output_port;
> +	/* Used purely by MX8MP HDMI to work around broken DTs without HDMI connector node. */
> +	bool output_port_optional;
>  
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
