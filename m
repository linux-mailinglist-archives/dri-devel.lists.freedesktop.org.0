Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAC5BD11D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ACF10E689;
	Mon, 19 Sep 2022 15:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BB010E689
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:34:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44236499;
 Mon, 19 Sep 2022 17:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663601674;
 bh=5Obobqkdm/QseGlldjU1Tkl0Aau1csirOHQ2CjvpOIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6AgUzxS3VJ+xsDHgxrsI53uLkcYTt0/KBNeOpnY4ofzE6XgUVNhrWUVaQFhGCj4a
 Odq3CbDwQvNjrhW6lvi7RdXsY64HvJ3QplgAY+BUN6Lon2Fo1l5g98qs0madIADBpf
 7EsxsT9lWtt1UzkALUy58W6BB7+Da2gWu2WK2jjw=
Date: Mon, 19 Sep 2022 18:34:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 11/12] drm/bridge: Drop drm_bridge_funcs.mode_fixup
Message-ID: <YyiL/Q8X76I+ZzEu@pendragon.ideasonboard.com>
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220717175801.78668-4-sam@ravnborg.org>
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

On Sun, Jul 17, 2022 at 07:58:00PM +0200, Sam Ravnborg wrote:
> All users are converted over to drm_bridge_funcs.atomic_check()
> so it is safe to drop the mode_fixup support.
> 
> Update the comment for atomic_check with relevant parts from mode_fixup.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c |  7 +----
>  include/drm/drm_bridge.h     | 60 ++++++++++--------------------------
>  2 files changed, 17 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b6f56d8f3547..3f5acb19957c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -685,10 +685,6 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  						  crtc_state, conn_state);
>  		if (ret)
>  			return ret;
> -	} else if (bridge->funcs->mode_fixup) {
> -		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> -					       &crtc_state->adjusted_mode))
> -			return -EINVAL;
>  	}
>  
>  	return 0;
> @@ -934,8 +930,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>   * @conn_state: new connector state
>   *
>   * First trigger a bus format negotiation before calling
> - * &drm_bridge_funcs.atomic_check() (falls back on
> - * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
> + * &drm_bridge_funcs.atomic_check() op for all the bridges in the encoder chain,
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_check()
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7496f41535b1..8c93369bcc74 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -106,7 +106,7 @@ struct drm_bridge_funcs {
>  	 * to look at anything else but the passed-in mode, and validate it
>  	 * against configuration-invariant hardward constraints. Any further
>  	 * limits which depend upon the configuration can only be checked in
> -	 * @mode_fixup.
> +	 * @atomic_check.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -116,46 +116,6 @@ struct drm_bridge_funcs {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
> -	/**
> -	 * @mode_fixup:
> -	 *
> -	 * This callback is used to validate and adjust a mode. The parameter
> -	 * mode is the display mode that should be fed to the next element in
> -	 * the display chain, either the final &drm_connector or the next
> -	 * &drm_bridge. The parameter adjusted_mode is the input mode the bridge
> -	 * requires. It can be modified by this callback and does not need to
> -	 * match mode. See also &drm_crtc_state.adjusted_mode for more details.
> -	 *
> -	 * This is the only hook that allows a bridge to reject a modeset. If
> -	 * this function passes all other callbacks must succeed for this
> -	 * configuration.
> -	 *
> -	 * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
> -	 * is not called when &drm_bridge_funcs.atomic_check() is implemented,
> -	 * so only one of them should be provided.
> -	 *
> -	 * NOTE:
> -	 *
> -	 * This function is called in the check phase of atomic modesets, which
> -	 * can be aborted for any reason (including on userspace's request to
> -	 * just check whether a configuration would be possible). Drivers MUST
> -	 * NOT touch any persistent state (hardware or software) or data
> -	 * structures except the passed in @state parameter.
> -	 *
> -	 * Also beware that userspace can request its own custom modes, neither
> -	 * core nor helpers filter modes to the list of probe modes reported by
> -	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> -	 * that modes are filtered consistently put any bridge constraints and
> -	 * limits checks into @mode_valid.
> -	 *
> -	 * RETURNS:
> -	 *
> -	 * True if an acceptable configuration is possible, false if the modeset
> -	 * operation should be rejected.
> -	 */
> -	bool (*mode_fixup)(struct drm_bridge *bridge,
> -			   const struct drm_display_mode *mode,
> -			   struct drm_display_mode *adjusted_mode);
>  	/**
>  	 * @disable:
>  	 *
> @@ -466,9 +426,7 @@ struct drm_bridge_funcs {
>  	 * &drm_bridge_funcs.atomic_check() hooks are called in reverse
>  	 * order (from the last to the first bridge).
>  	 *
> -	 * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> -	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
> -	 * one of them should be provided.
> +	 * This method is optional.
>  	 *
>  	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
>  	 * &drm_bridge_state.output_bus_cfg.flags it should happen in
> @@ -478,6 +436,20 @@ struct drm_bridge_funcs {
>  	 * &drm_connector.display_info.bus_flags if the bridge is the last
>  	 * element in the chain.
>  	 *
> +	 * NOTE:
> +	 *
> +	 * This function is called in the check phase of atomic modesets, which
> +	 * can be aborted for any reason (including on userspace's request to
> +	 * just check whether a configuration would be possible). Drivers MUST
> +	 * NOT touch any persistent state (hardware or software) or data
> +	 * structures except the passed in @state parameter.
> +	 *
> +	 * Also beware that userspace can request its own custom modes, neither
> +	 * core nor helpers filter modes to the list of probe modes reported by
> +	 * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> +	 * that modes are filtered consistently put any bridge constraints and
> +	 * limits checks into @mode_valid.
> +	 *
>  	 * RETURNS:
>  	 * zero if the check passed, a negative error code otherwise.
>  	 */

-- 
Regards,

Laurent Pinchart
