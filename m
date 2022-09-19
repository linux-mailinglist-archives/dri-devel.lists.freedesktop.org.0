Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B55BD08C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7678D10E66E;
	Mon, 19 Sep 2022 15:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737C10E66B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:19:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57FAA499;
 Mon, 19 Sep 2022 17:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663600791;
 bh=PQGPD6rFfQ4c9/wXNerOZd6lDaZMOvrBsAqiWgV3tp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IN7WVwhttqy9kKXcxIP20OMJA/V4fQBWil7pAMKkG4AXtYpceTw0TlNljB0cvxArg
 j84YQ52vuqaWmmH8XoIwtQDvRnjs6BaIjUEnRbNhEPsnQoe+SVh2sbQey79MGxtSGd
 BVX8UoQgAKAq5H8L+7APt1mi8Zwpf4AbIFAIkNL8=
Date: Mon, 19 Sep 2022 18:19:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 04/12] drm/bridge: Drop drm_bridge_chain_mode_fixup
Message-ID: <YyiIineQ/Ib4rQH/@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-5-sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 17, 2022 at 07:44:46PM +0200, Sam Ravnborg wrote:
> There are no users left of drm_bridge_chain_mode_fixup() and we
> do not want to have this function available, so drop it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c | 37 ------------------------------------
>  include/drm/drm_bridge.h     |  3 ---
>  2 files changed, 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index bb7fc09267af..b6f56d8f3547 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -430,43 +430,6 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>   *   needed, in order to gradually transition to the new model.
>   */
>  
> -/**
> - * drm_bridge_chain_mode_fixup - fixup proposed mode for all bridges in the
> - *				 encoder chain
> - * @bridge: bridge control structure
> - * @mode: desired mode to be set for the bridge
> - * @adjusted_mode: updated mode that works for this bridge
> - *
> - * Calls &drm_bridge_funcs.mode_fixup for all the bridges in the
> - * encoder chain, starting from the first bridge to the last.
> - *
> - * Note: the bridge passed should be the one closest to the encoder
> - *
> - * RETURNS:
> - * true on success, false on failure
> - */
> -bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode)
> -{
> -	struct drm_encoder *encoder;
> -
> -	if (!bridge)
> -		return true;
> -
> -	encoder = bridge->encoder;
> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -		if (!bridge->funcs->mode_fixup)
> -			continue;
> -
> -		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
> -			return false;
> -	}
> -
> -	return true;
> -}
> -EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
> -
>  /**
>   * drm_bridge_chain_mode_valid - validate the mode against all bridges in the
>   *				 encoder chain.
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1eca9c4c3346..7496f41535b1 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -845,9 +845,6 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  #define drm_for_each_bridge_in_chain(encoder, bridge)			\
>  	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
>  
> -bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adjusted_mode);
>  enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  			    const struct drm_display_info *info,

-- 
Regards,

Laurent Pinchart
