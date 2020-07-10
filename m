Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483D21BFF5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC946ED31;
	Fri, 10 Jul 2020 22:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72086ED31
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:36:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78C622C0;
 Sat, 11 Jul 2020 00:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420573;
 bh=O9k9zKHy5n2jwSphjjCeYaJFUNFDTN8A6zzUQz3A2ZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5qHiIe+u0PY2XAYKNYn9xASVNI6ctQIBkgJ9+LuNC7DSII7njqmWGIk/D23C1CKZ
 V6mt4CAZlmp8weK3Pq3idFUsxwNvOP3D8L0W5gRa8h7LMjK117AXlZojxaGdYqelqQ
 NOw3npYaDAbSYaFx8rHPjmWWusx4+jjaCIX6Mp/w=
Date: Sat, 11 Jul 2020 01:36:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 15/21] drm/bridge: megachips: enable detect bridge
 operation
Message-ID: <20200710223606.GS5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-16-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-16-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:11PM +0200, Sam Ravnborg wrote:
> To prepare for use in a chained bridge setup enable the
> detect operation.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index cf1dfbc88acf..78a9afe8f063 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -163,8 +163,8 @@ drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
>  	.mode_valid = ge_b850v3_lvds_mode_valid,
>  };
>  
> -static enum drm_connector_status ge_b850v3_lvds_detect(
> -		struct drm_connector *connector, bool force)
> +static enum drm_connector_status ge_b850v3_lvds_bridge_detect(
> +		struct drm_bridge *bridge)
>  {
>  	struct i2c_client *stdp4028_i2c =
>  			ge_b850v3_lvds_ptr->stdp4028_i2c;
> @@ -182,6 +182,12 @@ static enum drm_connector_status ge_b850v3_lvds_detect(
>  	return connector_status_unknown;
>  }
>  
> +static enum drm_connector_status ge_b850v3_lvds_detect(
> +		struct drm_connector *connector, bool force)
> +{
> +	return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->bridge);
> +}
> +
>  static const struct drm_connector_funcs ge_b850v3_lvds_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.detect = ge_b850v3_lvds_detect,
> @@ -263,6 +269,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
>  	.attach = ge_b850v3_lvds_attach,
> +	.detect = ge_b850v3_lvds_bridge_detect,
>  };
>  
>  static int ge_b850v3_lvds_init(struct device *dev)
> @@ -317,6 +324,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
>  
>  	/* drm bridge initialization */
>  	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
> +	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
>  	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
