Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60424BBE4C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A2B10E192;
	Fri, 18 Feb 2022 17:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D632910E192
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:24:53 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL700-0001jF-94; Fri, 18 Feb 2022 18:24:52 +0100
Message-ID: <523293963dc2ca9fe4c2bb282cd88f1dc197217e.camel@pengutronix.de>
Subject: Re: [PATCH V2 02/11] drm/bridge: tc358767: Change tc_ prefix to
 tc_edp_ for (e)DP specific functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:24:50 +0100
In-Reply-To: <20220218010054.315026-3-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-3-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
> These functions are specific to (e)DP output initialization and
> operation, add specific tc_edp_ prefix to those functions to
> discern them from DPI output functions that will be added later
> in this series. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: - New patch
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 35 ++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index c23e0abc65e8f..4b8ea0db2a5e8 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1164,7 +1164,7 @@ static int tc_main_link_disable(struct tc_data *tc)
>  	return regmap_write(tc->regmap, DP0CTL, 0);
>  }
>  
> -static int tc_stream_enable(struct tc_data *tc)
> +static int tc_edp_stream_enable(struct tc_data *tc)
>  {
>  	int ret;
>  	u32 value;
> @@ -1219,7 +1219,7 @@ static int tc_stream_enable(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static int tc_stream_disable(struct tc_data *tc)
> +static int tc_edp_stream_disable(struct tc_data *tc)
>  {
>  	int ret;
>  
> @@ -1234,7 +1234,7 @@ static int tc_stream_disable(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static void tc_bridge_enable(struct drm_bridge *bridge)
> +static void tc_edp_bridge_enable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
> @@ -1251,7 +1251,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  		return;
>  	}
>  
> -	ret = tc_stream_enable(tc);
> +	ret = tc_edp_stream_enable(tc);
>  	if (ret < 0) {
>  		dev_err(tc->dev, "main link stream start error: %d\n", ret);
>  		tc_main_link_disable(tc);
> @@ -1259,12 +1259,12 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>  	}
>  }
>  
> -static void tc_bridge_disable(struct drm_bridge *bridge)
> +static void tc_edp_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
>  
> -	ret = tc_stream_disable(tc);
> +	ret = tc_edp_stream_disable(tc);
>  	if (ret < 0)
>  		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
>  
> @@ -1285,9 +1285,10 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>  	return true;
>  }
>  
> -static enum drm_mode_status tc_mode_valid(struct drm_bridge *bridge,
> -					  const struct drm_display_info *info,
> -					  const struct drm_display_mode *mode)
> +static enum drm_mode_status
> +tc_edp_mode_valid(struct drm_bridge *bridge,
> +		  const struct drm_display_info *info,
> +		  const struct drm_display_mode *mode)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	u32 req, avail;
> @@ -1395,8 +1396,8 @@ static const struct drm_connector_funcs tc_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static int tc_bridge_attach(struct drm_bridge *bridge,
> -			    enum drm_bridge_attach_flags flags)
> +static int tc_edp_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
>  {
>  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  	struct tc_data *tc = bridge_to_tc(bridge);
> @@ -1448,18 +1449,18 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> -static void tc_bridge_detach(struct drm_bridge *bridge)
> +static void tc_edp_bridge_detach(struct drm_bridge *bridge)
>  {
>  	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
>  }
>  
>  static const struct drm_bridge_funcs tc_bridge_funcs = {
> -	.attach = tc_bridge_attach,
> -	.detach = tc_bridge_detach,
> -	.mode_valid = tc_mode_valid,
> +	.attach = tc_edp_bridge_attach,
> +	.detach = tc_edp_bridge_detach,
> +	.mode_valid = tc_edp_mode_valid,
>  	.mode_set = tc_bridge_mode_set,
> -	.enable = tc_bridge_enable,
> -	.disable = tc_bridge_disable,
> +	.enable = tc_edp_bridge_enable,
> +	.disable = tc_edp_bridge_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
>  	.detect = tc_bridge_detect,
>  	.get_edid = tc_get_edid,


