Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B749FB840
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93A010E1DC;
	Tue, 24 Dec 2024 01:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w7gPODyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2DC10E1DC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:24:10 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so4979315e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735003388; x=1735608188; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
 b=w7gPODyHtwb3p+q5bczzyHTHgAID9nl5F6+GNP8F/3wu9bbRr6xfIfSQ+58FgTzpih
 cG3dMqXr/vdEC1D7SXzgUAtUqYYVO6WcynWYhGeOFbMc3y1KNnU18UY/OAlpoxOP6OGG
 FSgbJOAgRotkP2vdrAKgc8WJcieFAusJ3CpwyFJjW7w8uAL1ZXnJ8PoPHatHaFMaRD/n
 ErurmoM4l1d6jMoDnCbYsGt4crCQZB6RMycw1FRRWPPjC+JAkUWYSEI9Ip8Vvb2B2HZI
 ZcdEYqHS23YvfoLaqEYndi0hYZuRrkMi7GrMdelhROU6fwi3J+yv4dUOHJL4u3Mj3RpY
 PVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735003388; x=1735608188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
 b=CiOrdqWLKJHwTgpIYFJvf+v8QDCblVQgYnU4iLeNVcy13CB5d2ukcQ9DmnI771R8yo
 Mup7TSvpOWwj4QyHVLJcS/ALgdIfY+cgnMtgYwlLTBTdTMmLuam0erfgBvDfYFKyo6Fo
 QPvy395faGeRbhALymd6CVbkJYgQEobpUvex7wG5t2ZRGC+83FpRayecBWQW2kbg5nTl
 dFJzW+ydYgdxBzP9n4gA92uiE+/L/x2dm6YoxmmfpJrrhYZo1kkhgRPjDtb2NUWTCh9p
 ut+AaFJ1ibejZWAztzFgGgm/jSIYZPgtg6+/n11ITF7vibf1Z59zrdgQUVrG+4d/ZhIp
 j2ZQ==
X-Gm-Message-State: AOJu0YwN/NPXXXAcU2D09vmRbU26ALAW6oodzR4jZXmYn+4N8p+Rl2BU
 m8J6BJwA7d+0ZRkMUH3NjZx9tN4x8HIwDL6NZtG/kTIto9qn4ocaIkT29kJB2I8=
X-Gm-Gg: ASbGncvga7xBkHXzy9kuvAPHr3XG+Wq1gnG0rENYF9oeHPOt4lyoMocnlc5JJ2EWZzo
 fvYUTydT1EyCSQWXcHu4PcDFsRnVTPgWZELaNqCndbm/JftdjmrmIk107LyXUPh8pUe+yMLKD2b
 3kGqp94PYHfLd4CH2Qm9PWt1i02TRNR8X2+ticvMsqXCRkLevf0Yrb9xiZIyIv3+SJWdk/D6pNM
 8xmIzPLTwlo9+Ee+25HQOAUwD7wI+0yFUXnfl9RnqrCyvR81NfjCAtn6ZOeoPIQZWHA3gfTuIKV
 p3OTge4qrfGSXirDNPUNuLu2TMFj141pegZD
X-Google-Smtp-Source: AGHT+IE0cj501KVsxr5E+oOy+kYCAVFozA0mjr9ON0hVv1bfayb8BvzJJWWAMM6IBPiWdzjgftxlSw==
X-Received: by 2002:a05:6512:acc:b0:540:1dca:52d3 with SMTP id
 2adb3069b0e04-54229540670mr4513495e87.29.1735003388265; 
 Mon, 23 Dec 2024 17:23:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813692sm1417891e87.125.2024.12.23.17.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:23:06 -0800 (PST)
Date: Tue, 24 Dec 2024 03:23:04 +0200
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
Subject: Re: [PATCH 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <ovbuijd2kyq7c2ypjv6f4ttnpom53o5sagvafwf7ddvemq4orw@zi3hr22p4zjh>
References: <20241224004439.239880-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-1-marex@denx.de>
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

On Tue, Dec 24, 2024 at 01:42:47AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .

Just to note: currently this will prevent one from using CEC with that
HDMI connector. I have a WIP series which provides generic CEC helpers
similar to HDMI Connector and HDMI Audio, but to make it work with
dw-hdmi would require one to convert the bridge into using
DRM_BRIDGE_OP_HDMI.

> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
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
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..d8e9fbf75edbb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
>  	help
>  	  Choose this to enable support for the internal HDMI TX Parallel
>  	  Video Interface found on the Freescale i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..4ebae5ad072ad 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
