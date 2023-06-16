Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88E7338C1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482FF10E67A;
	Fri, 16 Jun 2023 19:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA3410E67A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lUS3rLdIADJBJTAvpvb8h44NZiU9UaFvThtxBf6MH1Y=;
 b=E2BNHIXfNwOntISH7Y4Yfp0UCo3HTRHnQtGI9DiYKc0NIoDs/mZvAfHyE5DliltH+iXl45s6fyyYG
 ia8qZVdnu2xrSszAdRFkWEACy3ji+WDl7B2eZCqZ3Q2UxuNsZjWVQy1L7TyV5zztshE4omaYdI+mCG
 BBWKHJQMO8MxJJaHZNi9KQ08QkVWXUL9cJicNOTzNIih9ZZ4kSVlwF9b+56uLhxAJW5BEkD0GNEhoP
 gQuCq6NKqUNJMEMkRHOeIr6jZaH7XyigQQ4mDy+THPVuvlGvrgkv8eddCyXOZzYhptTjfmOwLVoZ02
 x7Zrcv19afYu9olgP0JWR/TpqoJfOwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lUS3rLdIADJBJTAvpvb8h44NZiU9UaFvThtxBf6MH1Y=;
 b=xjjCGv/g8PVcMGmpgHIa/+6BJ3EaH3cRuNm29Ojhio8ke3okgqEWot11SG6+9o7sKwYQeLP8YXyhW
 s371WdKDA==
X-HalOne-ID: 60163bf1-0c78-11ee-a88b-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 60163bf1-0c78-11ee-a88b-6f01c1d0a443;
 Fri, 16 Jun 2023 19:02:46 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:02:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/5] drm/bridge: tc358762: Switch to atomic ops
Message-ID: <20230616190245.GG1697490@ravnborg.org>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-2-marex@denx.de>
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
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:18:59PM +0200, Marek Vasut wrote:
> Switch the bridge driver over to atomic ops. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

(I hope one day all bridge drivers are converted to atomic ops...)

> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index df9703eacab1f..5e00c08b99540 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -126,7 +126,7 @@ static int tc358762_init(struct tc358762 *ctx)
>  	return tc358762_clear_error(ctx);
>  }
>  
> -static void tc358762_post_disable(struct drm_bridge *bridge)
> +static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_state *state)
>  {
>  	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>  	int ret;
> @@ -148,7 +148,7 @@ static void tc358762_post_disable(struct drm_bridge *bridge)
>  		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
>  }
>  
> -static void tc358762_pre_enable(struct drm_bridge *bridge)
> +static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
>  {
>  	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>  	int ret;
> @@ -165,7 +165,7 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
>  	ctx->pre_enabled = true;
>  }
>  
> -static void tc358762_enable(struct drm_bridge *bridge)
> +static void tc358762_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
>  {
>  	struct tc358762 *ctx = bridge_to_tc358762(bridge);
>  	int ret;
> @@ -185,9 +185,12 @@ static int tc358762_attach(struct drm_bridge *bridge,
>  }
>  
>  static const struct drm_bridge_funcs tc358762_bridge_funcs = {
> -	.post_disable = tc358762_post_disable,
> -	.pre_enable = tc358762_pre_enable,
> -	.enable = tc358762_enable,
> +	.atomic_post_disable = tc358762_post_disable,
> +	.atomic_pre_enable = tc358762_pre_enable,
> +	.atomic_enable = tc358762_enable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = tc358762_attach,
>  };
>  
> -- 
> 2.39.2
