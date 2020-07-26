Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E715322E2D9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B5F6E120;
	Sun, 26 Jul 2020 21:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2916E120
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:59:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0175951D;
 Sun, 26 Jul 2020 23:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595800773;
 bh=dU4zxOK0EbT7owv+6m30sylDh8iYUd+OU3rg3wgWFXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nd1fSJiLE62ixO8IvuFMvryNAMf4Q2fcbVzltTZmR/x2HnZdJl+EpGdzT57UlIsEH
 p13ks8ifchtSKVMq3n/Hzx+tbpFBd5zAqnWwtmgwY6xdNanHlcuslcoqGKp5aCw+Ic
 3/i9aDBL8V2+zxRjElwBG9dg7fLCH4BXgLuggFxU=
Date: Mon, 27 Jul 2020 00:59:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 13/15] drm/bridge: megachips: make connector creation
 optional
Message-ID: <20200726215925.GF28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-14-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-14-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 26, 2020 at 10:33:22PM +0200, Sam Ravnborg wrote:
> Make the connector creation optional to enable usage of the
> megachips-stdpxxxx-ge-b850v3-fw bridge with the DRM bridge connector
> helper.
> 
> v2:
>   - Set bridge.type to DRM_MODE_CONNECTOR_DisplayPort
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
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index f7b55dc374ac..61a24f265c7a 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -245,16 +245,6 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  {
>  	struct i2c_client *stdp4028_i2c
>  			= ge_b850v3_lvds_ptr->stdp4028_i2c;
> -	int ret;
> -
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> -
> -	ret = ge_b850v3_lvds_create_connector(bridge);
> -	if (ret)
> -		return ret;
>  
>  	/* Configures the bridge to re-enable interrupts after each ack. */
>  	i2c_smbus_write_word_data(stdp4028_i2c,
> @@ -266,7 +256,10 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  				  STDP4028_DPTX_IRQ_EN_REG,
>  				  STDP4028_DPTX_IRQ_CONFIG);
>  
> -	return 0;
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
> +	return ge_b850v3_lvds_create_connector(bridge);
>  }
>  
>  static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
> @@ -327,6 +320,7 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
>  	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
>  	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
>  					 DRM_BRIDGE_OP_EDID;
> +	ge_b850v3_lvds_ptr->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
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
