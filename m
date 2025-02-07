Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829AA2B94B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912E710EA00;
	Fri,  7 Feb 2025 02:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y+Yln0hP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF40310EA00
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:52:26 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54410d769f7so1322273e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896745; x=1739501545; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
 b=Y+Yln0hPpGlsz0diCdLnxk5UHkBI8m5nZIGXKTZncxXw97sJ7wZzuB3KTveRjzULPk
 xqb07bHzOesMhSZMPnuayoBkMi3JAI3QTupN+BkvvgWvK9+xo5UVXgWrF7wxbZZCXKTR
 vLB1F7Oj150IFPLpSia46Uk348zAuQEDim1WbDK4zovxULrjXo5nPIMl0mdsrlGILPLO
 EJLbLvEvI0nQ3oeO9zJiO0w9RI1gvrjjc4RXIhiOQjWZPCis9bjN1EixbNrPAV/Z/42A
 dNbKt4V2IiZDq4YmdsD4jZ9NmexzBlH5eBzd3XqFwkSrvmrHV6v+c7Ld3YjOAjwzdR2a
 tyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896745; x=1739501545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9F02/YDvnybxu8ztsJHZ1LF6k/z+auHcgxD1SfmGPM=;
 b=YTBRKxl4oQFtb+FWblZ5Vh2RBvhulfGqvAyR8KFObhe7YNGWEGecm/tDrwB0ktshzp
 n8vsBThd5m/QGXfEwPeSUL+UnOGKomGlShOHlOjX7fod4ynJDmaRGwwIhwGpTzVlK5/x
 x7ezPisfDbl0svk9Z7HS8cROcnGBRw2ehob1MhTnD2BBRKa+z7nluWVFc6yj6YQOHP8H
 Bs8q+wce77pBvdQj1BPAY940Wvl9Vzw0eO/JD5nQTn3wjXmChD/AeDYjcr3GVMAzPc7C
 t1vvyFAE8FpNlfUTMaytneMkAIq1c2VM9qC8GtlW/+4qdN9RkROHd5oNNVsWyK3NoBeC
 /DyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBi2ddADBLf4gXVUeiuOO+lOeJ05lBsd1k3xo7rEy94x9CWUDok3gYCO8vmeQHxF6y/1DTQ//WKok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQjim+6PKt3DnOSoGVUwbvzk6r+re8E+uiMSDPa6ljt62Lx6MV
 /MTSLM6ZwfdiokLfyvmrAuqax310ytCR7XB1QgEdltKZhIneEMgcFOhZrAhDHOU=
X-Gm-Gg: ASbGnctXyfMAqgQnBZ0YZ1Rb4UvSs9KgJZQ19kVlVyIdu4qKo8EhL/I4BCIvuQkZT+2
 YUvAXN/lSU021nCwHKtB8/EkQ5igCqnc7ldQcTWccWx/DPmdy7ZfcCGWf2i1TLbVB7qptoUOvLj
 lAQC1mqxPZJBlXvoSXSUz368mT9RHy3nUTv6O2GayfMcMuBV41WgaPJRBVFypcm3ywgFFWIspKb
 +oSmJ29H4hyCo2YOvFSlV9x42+VNinggQ3trgqUmmUajpEOQ01375oT47FfwmgQOtowLqhvun4C
 EKjRs3J7e3Af78VTCMFucmFCh81LXHZ+G+q5H4qhQErGmg18yCJqm7o593xe3atwsqmvdPY=
X-Google-Smtp-Source: AGHT+IFgW897y8GZ6q7fIx1eveSasf6e4TKZyOYUknvmrPjaAmKxvvhWspCZkVzJPR5Pf1lTvWOAUw==
X-Received: by 2002:a05:6512:1195:b0:542:6d01:f55c with SMTP id
 2adb3069b0e04-54414a962c4mr418596e87.3.1738896744794; 
 Thu, 06 Feb 2025 18:52:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441055573asm309217e87.81.2025.02.06.18.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:52:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:52:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> do with struct drm_panel anymore, they just manage bridges. So move them
> from bridge/panel.c to drm_bridge.c.
> 
> Move also of_drm_find_bridge_by_endpoint() which is used only by
> devm_drm_of_get_bridge() and drmm_of_get_bridge().
> 
> No code changes, only move functions to a different file within the same
> module and add an #include as needed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
>  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
>  
> -/**
> - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> - *
> - * Given a DT node's port and endpoint number, find the connected node and
> - * return the associated struct drm_bridge.
> - *
> - * Returns zero if successful, or one of the standard error codes if it fails.
> - */
> -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> -					  int port, int endpoint,
> -					  struct drm_bridge **bridge)

I'd say make this function the main API instead (and name it drm_of
rather than of_drm, this can happen in the previous patch).

> -{
> -	int ret = -EPROBE_DEFER;
> -	struct device_node *remote;
> -
> -	if (!bridge)
> -		return -EINVAL;
> -
> -	/*
> -	 * of_graph_get_remote_node() produces a noisy error message if port
> -	 * node isn't found and the absence of the port is a legit case here,
> -	 * so at first we silently check whether graph presents in the
> -	 * device-tree node.
> -	 */
> -	if (!of_graph_is_present(np))
> -		return -ENODEV;
> -
> -	remote = of_graph_get_remote_node(np, port, endpoint);
> -	if (!remote)
> -		return -ENODEV;
> -
> -	*bridge = of_drm_find_bridge(remote);
> -	if (*bridge)
> -		ret = 0;
> -
> -	of_node_put(remote);
> -	return ret;
> -}
> -
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel through
>   * the "rotation" binding from a device tree node
> @@ -1150,62 +1107,3 @@ struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge)
>  	return &panel_bridge->connector;
>  }
>  EXPORT_SYMBOL(drm_panel_bridge_connector);
> -
> -#ifdef CONFIG_OF
> -/**
> - * devm_drm_of_get_bridge - Return next bridge in the chain
> - * @dev: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a pointer to the bridge if successful, or an error pointer
> - * otherwise.
> - */
> -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> -					  struct device_node *np,
> -					  u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}

Then these two functions can go into the header as static inlines with
the proper deprecation notification. There is little point in having
them in the source file. I think eventually all users should be
converted into using your new of_drm_find_bridge_by_endpoint() funcion.

> -EXPORT_SYMBOL(devm_drm_of_get_bridge);
> -
> -/**
> - * drmm_of_get_bridge - Return next bridge in the chain
> - * @drm: device to tie the bridge lifetime to
> - * @np: device tree node containing encoder output ports
> - * @port: port in the device tree node
> - * @endpoint: endpoint in the device tree node
> - *
> - * Given a DT node's port and endpoint number, finds the connected node
> - * and returns the associated bridge if any.
> - *
> - * Returns a drmm managed pointer to the bridge if successful, or an error
> - * pointer otherwise.
> - */
> -struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> -				      struct device_node *np,
> -				      u32 port, u32 endpoint)
> -{
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return bridge;
> -}
> -EXPORT_SYMBOL(drmm_of_get_bridge);
> -
> -#endif
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 87cebec2de806781cee22da54d666eee9bde3648..2aa17fbe538b86066c4e68f0d0e8046e9ca9b965 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -25,6 +25,7 @@
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
> @@ -1334,6 +1335,105 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated struct drm_bridge.
> + *
> + * Returns zero if successful, or one of the standard error codes if it fails.
> + */
> +static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> +					  int port, int endpoint,
> +					  struct drm_bridge **bridge)
> +{
> +	int ret = -EPROBE_DEFER;
> +	struct device_node *remote;
> +
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the
> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return -ENODEV;
> +
> +	remote = of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	*bridge = of_drm_find_bridge(remote);
> +	if (*bridge)
> +		ret = 0;
> +
> +	of_node_put(remote);
> +	return ret;
> +}
> +
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +					  struct device_node *np,
> +					  u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
> +
> +/**
> + * drmm_of_get_bridge - Return next bridge in the chain
> + * @drm: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any.
> + *
> + * Returns a drmm managed pointer to the bridge if successful, or an error
> + * pointer otherwise.
> + */
> +struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
> +				      struct device_node *np,
> +				      u32 port, u32 endpoint)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = of_drm_find_bridge_by_endpoint(np, port, endpoint, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(drmm_of_get_bridge);
>  #endif
>  
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
