Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF077B258
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF810E11B;
	Mon, 14 Aug 2023 07:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3210E0CB
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 17:11:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso470543766b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691946683; x=1692551483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mHFutzp1lkuAzp7C6TTKwSkYcO+SBglGJ1K/L7mw4gw=;
 b=o9TMb4SReKOwfWxMKfrwB4/vTZpeZWyGQXeJvOg1s3T8zbm0Mj7XugiSuKLvm7YcCn
 bHkcXbHYqBxyZKFXLDeBqXziCr/7lIy8vOUGa0lYcLn83Dx9Ml/tDd45F17rLmibwCKe
 qKsT4r1PtIeSmh3/hGATZ7x2m3e5PFh1E3Bz7pekqeRSyKNfxpNGp7lpzsCXMyKkrY8q
 jcfiGKLNAQasKSGccz5J32Uq/rVwOVf9Sc2Fhzy72F0vHp2ngcjn2iA4b3HV6lD20Kny
 Nz6TH0AN7nepq/A5zQU6ojwz2cL6WvTAO3xEie8JpnCYco6NfnT08emquEBe+DMmhqDR
 vOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691946683; x=1692551483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mHFutzp1lkuAzp7C6TTKwSkYcO+SBglGJ1K/L7mw4gw=;
 b=lXpWf7g8YiY87cGjB431cvTpOcQYToahPxkOu0X+zgx+qnwpBP1LY6N0fyRO6Tko1h
 a4rnLYmkRg7Vk8CoA+zDPa0J3Uv38g71e57z4hZZyqaqCdZhfhPX60Izp9Rr56f6dYid
 b9g8bOgz1hAmJ+wDtDlTLgxuHy8jFB9HguAKbr5NZeMvbnve6GUt9fUu5AX1BGgibXI+
 2N12zQambaTlIOF3F4T7YRRmblLvgb7Uxpy/a9VpIYal/VXkGuHh/z+P6j5TAkcVfHr0
 hpI5PMmEuZ/qHaMRA71EVDOXi/sUg24H+JjEWi0zVyrhFVR3F4sK5SsczY3PkkD5RDaG
 eNcw==
X-Gm-Message-State: AOJu0YzdJ1QzWYRtQZLPEPmeCwt0yydkID2O5yV+u2p0Xt0XmhtZHEuo
 lc/saOpFlZa7EPc0I/8WHF8=
X-Google-Smtp-Source: AGHT+IGxwE25b4Q85fMHwh7v/00Z2AwRFjnXpuBM11awbLV6j98vP7NGBjbS9S3CEQtOh3deTspiKQ==
X-Received: by 2002:a17:906:5357:b0:99b:5574:7d0f with SMTP id
 j23-20020a170906535700b0099b55747d0fmr6403239ejo.23.1691946682482; 
 Sun, 13 Aug 2023 10:11:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:ff34:2f15:5fe7:679d?
 ([2a02:908:8b3:1840:ff34:2f15:5fe7:679d])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170906970a00b0099bc5e5742asm4809698ejx.70.2023.08.13.10.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Aug 2023 10:11:21 -0700 (PDT)
Message-ID: <e857d383-2287-a985-24c5-fa1fff1da199@gmail.com>
Date: Sun, 13 Aug 2023 19:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
From: Maxim Schwalm <maxim.schwalm@gmail.com>
In-Reply-To: <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 14 Aug 2023 07:25:51 +0000
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.08.23 12:44, Tomi Valkeinen wrote:
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
This patch unfortunately breaks the display output on the Asus TF700T:

[drm:drm_bridge_attach] *ERROR* failed to attach bridge /i2c-mux/i2c@1/dsi@7 to encoder LVDS-59: -517
tegra-dc 54200000.dc: failed to initialize RGB output: -517
drm drm: failed to initialize 54200000.dc: -517
------------[ cut here ]------------
WARNING: CPU: 3 PID: 69 at lib/refcount.c:28 tegra_dc_init+0x24/0x5fc
refcount_t: underflow; use-after-free.
Modules linked in: elants_i2c panel_simple tc358768 atkbd vivaldi_fmap
CPU: 3 PID: 69 Comm: kworker/u8:6 Not tainted 6.5.0-rc2-postmarketos-grate #95
Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
Workqueue: events_unbound deferred_probe_work_func
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x40/0x4c
 dump_stack_lvl from __warn+0x94/0xc0
 __warn from warn_slowpath_fmt+0x118/0x16c
 warn_slowpath_fmt from tegra_dc_init+0x24/0x5fc
 tegra_dc_init from host1x_device_init+0x84/0x15c
 host1x_device_init from host1x_drm_probe+0xd8/0x3c4
 host1x_drm_probe from really_probe+0xc8/0x2dc
 really_probe from __driver_probe_device+0x88/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x104
 driver_probe_device from __device_attach_driver+0x94/0x108
 __device_attach_driver from bus_for_each_drv+0x80/0xb8
 bus_for_each_drv from __device_attach+0xa0/0x190
 __device_attach from bus_probe_device+0x88/0x8c
 bus_probe_device from deferred_probe_work_func+0x78/0xa4
 deferred_probe_work_func from process_one_work+0x208/0x420
 process_one_work from worker_thread+0x54/0x550
 worker_thread from kthread+0xdc/0xf8
 kthread from ret_from_fork+0x14/0x2c
Exception stack(0xcf9c5fb0 to 0xcf9c5ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
---[ end trace 0000000000000000 ]---

Best regards,
Maxim
