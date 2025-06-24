Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81AAE62C1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 12:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61110E510;
	Tue, 24 Jun 2025 10:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ePAFulvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293210E510
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 10:43:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-34-99-nat.elisa-mobile.fi
 [85.76.34.99])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EFE946A6;
 Tue, 24 Jun 2025 12:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750761772;
 bh=yz+JsuAiHyWr/UyOi0g9uuvNp3Sy8j7oMp0yuTEJQxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePAFulvMmvswetLospzsePX/uVj/vzBwEAPvsFBHa+eS7EPE1Eqo+IsrtMPNjtDvY
 MzRclrzKONfQwkxDK3jJX4MFYzz/+ou1QkhWiXHiMGKMK8vzahz0zaLENbvlvknLjO
 PG7PEwMTPE2wDnJPzQoKnzje1YwxXMXVInU34sFU=
Date: Tue, 24 Jun 2025 13:42:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Message-ID: <20250624104248.GH15951@pendragon.ideasonboard.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 24, 2025 at 02:54:14PM +0530, Dharma Balasubiramani wrote:
> Drop the drm_panel field of the mchp_lvds struct as it is unused.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/gpu/drm/bridge/microchip-lvds.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> index 9f4ff82bc6b4..42751124b868 100644
> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> @@ -23,7 +23,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_of.h>
> -#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -56,7 +55,6 @@ struct mchp_lvds {
>  	struct device *dev;
>  	void __iomem *regs;
>  	struct clk *pclk;
> -	struct drm_panel *panel;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  };
> @@ -179,13 +177,8 @@ static int mchp_lvds_probe(struct platform_device *pdev)
>  			"can't find port point, please init lvds panel port!\n");
>  		return -ENODEV;
>  	}

The above code seems unneeded now, I think you can drop it too.

> -
> -	lvds->panel = of_drm_find_panel(port);
>  	of_node_put(port);
>  
> -	if (IS_ERR(lvds->panel))
> -		return -EPROBE_DEFER;
> -
>  	lvds->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>  
>  	if (IS_ERR(lvds->panel_bridge))

-- 
Regards,

Laurent Pinchart
