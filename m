Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8B2AB635
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3589930;
	Mon,  9 Nov 2020 11:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F99689933
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:10:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AECF2B2B;
 Mon,  9 Nov 2020 12:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604920252;
 bh=lKyzd8LpkprWUzQt3Q3xYMJ8fBYVE6XtqZ57FELlnHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWRWqAI1jFLf7kSL6EWg6prsurQrLtIYmyFBa7Bzr6w1tq6KlWSxiZkT08OWD7AHj
 agakPpwn29MGvwkjXcsa0Ypn0CoNquY6CBtxkPMY+VS3TxbYlMXZWbdWokvGFK/dNO
 7h7KkPvkTznesGbcooTl6UMvYxCyq8X9icP6H97M=
Date: Mon, 9 Nov 2020 13:10:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 51/56] ARM: omap2plus_defconfig: Update for moved DSI
 command mode panel
Message-ID: <20201109111049.GV6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-52-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-52-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:28PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The DSI command mode panel is no longer specific
> to OMAP and thus the config option has been renamed
> slightly.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/configs/omap2plus_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 34793aabdb65..d329d0829fce 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -369,7 +369,7 @@ CONFIG_DRM_OMAP=m
>  CONFIG_OMAP5_DSS_HDMI=y
>  CONFIG_OMAP2_DSS_SDI=y
>  CONFIG_OMAP2_DSS_DSI=y
> -CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> +CONFIG_DRM_PANEL_DSI_CM=m

Is thi the right location, have you regenerated the defconfig from a
.config, or just renamed the option ? With the location fixed if needed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  CONFIG_DRM_TILCDC=m
>  CONFIG_DRM_PANEL_SIMPLE=m
>  CONFIG_DRM_PANEL_LG_LB035Q02=m

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
