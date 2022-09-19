Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599575BD0E8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93F010E67C;
	Mon, 19 Sep 2022 15:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6912410E67C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:29:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84C7B499;
 Mon, 19 Sep 2022 17:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663601347;
 bh=NuzkgiGGksLT/z4/1KJ+JyeCIKwowmxW3Wn0E+L0u/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5dwTvrDBt4EtkMgI5YVhD2O473i9JyzN0gFCbTOKHVa7IENvSBo4myUeJY1kjJlC
 zj+pDA5tURnUMXYWEnVSB9kB58M7BR5UPyII8wR/YisOyQJItwqQJl6Ig+5lhVhQRt
 sWnkqussNC4kxpIJk+NLjlh2SgWkYqSlFQZjpThg=
Date: Mon, 19 Sep 2022 18:28:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 06/12] drm/bridge: cros-ec-anx7688: Use
 drm_bridge_funcs.atomic_check
Message-ID: <YyiKthfh3I5rp99e@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717174454.46616-7-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717174454.46616-7-sam@ravnborg.org>
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

On Sun, Jul 17, 2022 at 07:44:48PM +0200, Sam Ravnborg wrote:
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> 
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: chrome-platform@lists.linux.dev

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c | 28 +++++++++++++++---------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> index 0f6d907432e3..fc19ea87926f 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC
>   */
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_print.h>
>  #include <linux/i2c.h>
> @@ -45,9 +46,10 @@ bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
>  	return container_of(bridge, struct cros_ec_anx7688, bridge);
>  }
>  
> -static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> -					      const struct drm_display_mode *mode,
> -					      struct drm_display_mode *adjusted_mode)
> +static int cros_ec_anx7688_bridge_atomic_check(struct drm_bridge *bridge,
> +					       struct drm_bridge_state *bridge_state,
> +					       struct drm_crtc_state *crtc_state,
> +					       struct drm_connector_state *conn_state)
>  {
>  	struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
>  	int totalbw, requiredbw;
> @@ -56,13 +58,13 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>  	int ret;
>  
>  	if (!anx->filter)
> -		return true;
> +		return 0;
>  
>  	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
>  	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to read bandwidth/lane count\n");
> -		return false;
> +		return ret;
>  	}
>  	dpbw = regs[0];
>  	lanecount = regs[1];
> @@ -71,28 +73,34 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
>  	if (dpbw > 0x19 || lanecount > 2) {
>  		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
>  			  lanecount);
> -		return false;
> +		return -EINVAL;
>  	}
>  
>  	/* Compute available bandwidth (kHz) */
>  	totalbw = dpbw * lanecount * 270000 * 8 / 10;
>  
>  	/* Required bandwidth (8 bpc, kHz) */
> -	requiredbw = mode->clock * 8 * 3;
> +	requiredbw = crtc_state->mode.clock * 8 * 3;
>  
>  	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
>  		      totalbw, dpbw, lanecount, requiredbw);
>  
>  	if (totalbw == 0) {
>  		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> -		return true;
> +		return 0;
>  	}
>  
> -	return totalbw >= requiredbw;
> +	if (totalbw < requiredbw)
> +		return -EINVAL;
> +
> +	return 0;
>  }
>  
>  static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
> -	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
> +	.atomic_check = cros_ec_anx7688_bridge_atomic_check,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart
