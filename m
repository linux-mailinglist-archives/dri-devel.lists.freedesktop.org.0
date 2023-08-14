Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110477B617
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 12:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611110E013;
	Mon, 14 Aug 2023 10:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DA610E013
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+0d0K8gRdasHBBxBfDYOGaNsANZBdVAsvY0T3Y09Us8=;
 b=LswpLh2uzMEHOgd2MhTVXwJh4p45iLiHbqEQtxEOy4bHhOj60XRB3ZU+TWKlJ+QR43MFNlcMjNHVz
 ovHSWetpF6ZkSjdEw5NidQtErrSglJRKA2tS1eIpnIHX1h2oet81XR18F5W2z41uQl+h5evgVK3LbQ
 QmP2XHEQtqMchlKLSqrbFYQU4hg1onKADGtiX/Uw6Ie5uSbAswuL8FlgfyiA91h5mGSgUNRankY2Cs
 BszP0m5ALinFW2/K6QhQPl0OmFWJQUKz+UCMFJumwlvAnT3WsxRq1Mcm9jFHEbbchqG9l/F4pUG8U4
 uUVqfCKbWYiggUB2V8nihz1r2eNuvtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=+0d0K8gRdasHBBxBfDYOGaNsANZBdVAsvY0T3Y09Us8=;
 b=cm1+80wCQURPqOW72oauiHPiYa75slzrDLc15KT/ufZVuyjQ8haNT5tVRsWWtbPjDTQVMhTZt8PjN
 EUM/TyqDw==
X-HalOne-ID: d2b55440-3a8a-11ee-8bb2-c5367ef0e45e
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id d2b55440-3a8a-11ee-8bb2-c5367ef0e45e;
 Mon, 14 Aug 2023 10:10:43 +0000 (UTC)
Date: Mon, 14 Aug 2023 12:10:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
Message-ID: <20230814101041.GA277347@ravnborg.org>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
 <e857d383-2287-a985-24c5-fa1fff1da199@gmail.com>
 <0855d804-3ba3-4f29-32b1-bab3b999e506@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0855d804-3ba3-4f29-32b1-bab3b999e506@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

> From c13c691bd8826b978325575be9a87f577b83b86b Mon Sep 17 00:00:00 2001
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Date: Mon, 14 Aug 2023 13:02:23 +0300
> Subject: [PATCH] drm/bridge: tc358768: fix 'Add DRM_BRIDGE_ATTACH_NO_CONNECTOR
>  support'
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 56 +++++++++++++------------------
>  1 file changed, 24 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 82ea4d9a814a..9705ce1bd028 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -455,8 +455,6 @@ static int tc358768_dsi_host_detach(struct mipi_dsi_host *host,
>  	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
>  
>  	drm_bridge_remove(&priv->bridge);
> -	if (priv->output.panel)
> -		drm_panel_bridge_remove(priv->output.next_bridge);
>  
>  	return 0;
>  }
> @@ -531,49 +529,42 @@ static int tc358768_bridge_attach(struct drm_bridge *bridge,
>  				  enum drm_bridge_attach_flags flags)
>  {
>  	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
> +	struct drm_bridge *next_bridge;
> +	struct drm_panel *panel;
> +	int ret;
>  
>  	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
>  		dev_err(priv->dev, "needs atomic updates support\n");
>  		return -ENOTSUPP;
>  	}
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		struct device_node *node;
> -
> -		/* Get the next bridge, connected to port@1. */
> -		node = of_graph_get_remote_node(priv->dev->of_node, 1, -1);
> -		if (!node)
> -			return -ENODEV;
> -
> -		priv->output.next_bridge = of_drm_find_bridge(node);
> -		of_node_put(node);
> -		if (!priv->output.next_bridge)
> -			return -EPROBE_DEFER;
> -	} else {
> -		struct drm_bridge *bridge;
> -		struct drm_panel *panel;
> -		int ret;
> -
> -		ret = drm_of_find_panel_or_bridge(priv->dev->of_node, 1, 0,
> -						  &panel, &bridge);
> -		if (ret)
> -			return ret;
> -
> -		if (panel) {
> -			bridge = drm_panel_bridge_add_typed(panel,
> -				DRM_MODE_CONNECTOR_DSI);
> -			if (IS_ERR(bridge))
> -				return PTR_ERR(bridge);
> -		}
> +	ret = drm_of_find_panel_or_bridge(priv->dev->of_node, 1, -1, &panel,
> +					  &next_bridge);

I think the right way is to wrap the panel in a bridge,
so something like:

	next_bridge = devm_drm_of_get_bridge(dev, priv->dev->of_node, 1, -1)

	if (IS_ERR(next_bridge))
		return ...
	priv->output.next_bridge = next_bridge;


	Sam


> +	if (ret)
> +		return ret;
>  
> -		priv->output.next_bridge = bridge;
> -		priv->output.panel = panel;
> +	if (panel) {
> +		next_bridge = drm_panel_bridge_add_typed(panel,
> +			DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(next_bridge))
> +			return PTR_ERR(next_bridge);
>  	}
>  
> +	priv->output.next_bridge = next_bridge;
> +	priv->output.panel = panel;
> +
>  	return drm_bridge_attach(bridge->encoder, priv->output.next_bridge, bridge,
>  				 flags);
>  }
>  
> +void tc358768_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
> +
> +	if (priv->output.panel)
> +		drm_panel_bridge_remove(priv->output.next_bridge);
> +}
> +
>  static enum drm_mode_status
>  tc358768_bridge_mode_valid(struct drm_bridge *bridge,
>  			   const struct drm_display_info *info,
> @@ -1156,6 +1147,7 @@ tc358768_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs tc358768_bridge_funcs = {
>  	.attach = tc358768_bridge_attach,
> +	.detach = tc358768_bridge_detach,
>  	.mode_valid = tc358768_bridge_mode_valid,
>  	.pre_enable = tc358768_bridge_pre_enable,
>  	.enable = tc358768_bridge_enable,
> -- 
> 2.34.1
> 

