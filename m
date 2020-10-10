Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AB28A181
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 23:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC746E09A;
	Sat, 10 Oct 2020 21:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AB96E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 21:38:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFF68528;
 Sat, 10 Oct 2020 23:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602365919;
 bh=Jd/AdmZJF5syB+e8f2v3/b7fITvHBWpYvqDUSWGuXck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAXdG/a/ATBMJEuOL5DPCTR5lFuK16uNcRoJhBFHI0G5GuE6UBwcBPaEyNC3DPWPh
 oRG6847UlLCdxE0vFOmEKfAIUxC0xdlOrGrmXOTcCCTV24UwFc2xIvMUWNXaqjIrJE
 wT5YLFbhmBK+78DsfH2rSzcRZATEzXy2yITJ7p+w=
Date: Sun, 11 Oct 2020 00:37:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] ARM: davinci_all_defconfig: Add
 CONFIG_DRM_DISPLAY_CONNECTOR=m
Message-ID: <20201010213754.GE3939@pendragon.ideasonboard.com>
References: <b88fa14d313267ba2e70619c0452120f941d1438.1602345599.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b88fa14d313267ba2e70619c0452120f941d1438.1602345599.git.jsarha@ti.com>
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
Cc: bgolaszewski@baylibre.com, tomi.valkeinen@ti.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri,

Thank you for the patch.

On Sat, Oct 10, 2020 at 07:08:50PM +0300, Jyri Sarha wrote:
> Current dumb-vga-dac driver requires CONFIG_DRM_DISPLAY_CONNECTOR
> for it to work.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> An alternative would be selecting CONFIG_DRM_DISPLAY_CONNECTOR from all
> bridges requiring DRM connector.
> 
>  arch/arm/configs/davinci_all_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
> index e849367c0566..28471757c129 100644
> --- a/arch/arm/configs/davinci_all_defconfig
> +++ b/arch/arm/configs/davinci_all_defconfig
> @@ -160,6 +160,7 @@ CONFIG_DRM=m
>  CONFIG_DRM_TILCDC=m
>  CONFIG_DRM_SIMPLE_BRIDGE=m
>  CONFIG_DRM_TINYDRM=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_TINYDRM_ST7586=m
>  CONFIG_FB=y
>  CONFIG_FIRMWARE_EDID=y

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
