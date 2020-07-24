Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119F22BB8B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 03:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8A6E8BD;
	Fri, 24 Jul 2020 01:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8E6E8BD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 01:30:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38AB8279;
 Fri, 24 Jul 2020 03:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595554231;
 bh=akS/wzc0BWt9gQYq9HsNLG1pa4mQkWgmvntLaanjo4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfND16UkHYN3vA2A7MdntXo1DC2Tc2f2Hjqzy89OEu8bAfIclINlSmp/x3oV/jtd0
 Y+LT+EHhMTiOYz4EfVmvOwTKxRvvj8QTkrg59LFwJ1OuKflWR43FwvCRHSFR3ltHAQ
 B5H6QOjrSa5SpYoUp6tezNBGa+0zHZN1Z2za++8s=
Date: Fri, 24 Jul 2020 04:30:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] drm: bridge: adv7511: Add missing bridge type
Message-ID: <20200724013024.GL21353@pendragon.ideasonboard.com>
References: <20200723104523.1006706-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723104523.1006706-1-vkoul@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Thank you for the patch.

On Thu, Jul 23, 2020 at 04:15:23PM +0530, Vinod Koul wrote:
> Add bridge type as DRM_MODE_CONNECTOR_HDMIA
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

This has already been submitted: https://lore.kernel.org/dri-devel/20200720124228.12552-1-laurentiu.palcu@oss.nxp.com/

> ---
> 
> I found this when testing Dragon-board 410c which uses this bridge
> [    6.671913] msm 1a00000.mdss: [drm:msm_dsi_manager_ext_bridge_init [msm]] *ERROR* drm_bridge_connector_init failed: -22
> [    6.678879] msm 1a00000.mdss: [drm:msm_dsi_modeset_init [msm]] *ERROR* failed to create dsi connector: -19
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f45cdca9cce5..a0d392c338da 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1283,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>  			    | DRM_BRIDGE_OP_HPD;
>  	adv7511->bridge.of_node = dev->of_node;
> +	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  
>  	drm_bridge_add(&adv7511->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
