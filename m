Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD4A5BD0EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BF110E684;
	Mon, 19 Sep 2022 15:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39D010E684
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:29:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2472E499;
 Mon, 19 Sep 2022 17:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663601393;
 bh=jDkXVBjY35lMOtjDJwJDXPYBRkII1bXO22Gtm2g2nhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H3PfNgG0bw9Qa+rKEjsQmpYSVhr2H7UyBp4Ao1fbdRJuCiwV0SnGu3hpDIZE9Pg16
 IkMC82Mo/1UJoy63TUrMk/21MGGEA+PCVQCr29ixFLiaNfEs5l4uZrp6DMyBE7dOaJ
 fKLoyunNe0GTgA1nRB9O2Xz2UPeSoXsQJlTw2Brw=
Date: Mon, 19 Sep 2022 18:29:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 07/12] drm/bridge: tc358767: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiK5GK7TYNxI7eS@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-8-sam@ravnborg.org>
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

On Sun, Jul 17, 2022 at 07:44:49PM +0200, Sam Ravnborg wrote:
> When atomic_check() is defined, then mode_fixup() is ignored,
> so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
> Embed the original implementation in the caller and drop the function.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 02bd757a8987..b2ab967504af 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
>  		dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>  
> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -				 const struct drm_display_mode *mode,
> -				 struct drm_display_mode *adj)
> -{
> -	/* Fixup sync polarities, both hsync and vsync are active low */
> -	adj->flags = mode->flags;
> -	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -	return true;
> -}
> -
>  static int tc_common_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state,
>  				  struct drm_connector_state *conn_state,
>  				  const unsigned int max_khz)
>  {
> -	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> -			     &crtc_state->adjusted_mode);
> +	struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +
> +	/* Fixup sync polarities, both hsync and vsync are active low */
> +	adj->flags = crtc_state->mode.flags;
> +	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>  
>  	if (crtc_state->adjusted_mode.clock > max_khz)
>  		return -EINVAL;
> @@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,
> -	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
>  	.get_edid = tc_get_edid,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,

-- 
Regards,

Laurent Pinchart
