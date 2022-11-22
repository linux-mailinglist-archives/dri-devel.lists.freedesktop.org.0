Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E997D63313C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 01:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F110E353;
	Tue, 22 Nov 2022 00:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63710E353
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:18:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 290CD88F;
 Tue, 22 Nov 2022 01:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669076284;
 bh=YuSo/Ps3qDTVswLN7zb1jfKqaQh26L/2bAiMA1FHZ/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+8I7eHgYU/w+XI/CNRqtyNFp/Rj4nvWUred9CWJW73wk0kjZJhjQYERrrDZsQdQm
 PKKhX/JcJCIRdF1rQsQb+4nPzcgIH5+aNbhUzt/r0v1oBm7MfhFKgMskqmdySrCSw6
 Ia9jJV4ty5liHbnnFXsEXZQqLpb4z9g75/bQVnMA=
Date: Tue, 22 Nov 2022 02:17:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between DRM and
 RZG2L_MIPI_DSI
Message-ID: <Y3wVLU01mHp2zozI@pendragon.ideasonboard.com>
References: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121181121.168278-1-biju.das.jz@bp.renesas.com>
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
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Mon, Nov 21, 2022 at 06:11:21PM +0000, Biju Das wrote:
> When CONFIG_DRM=m and CONFIG_DRM_RZG2L_MIPI_DSI=y, it results in a
> build failure. This patch fixes the build issue by adding dependency
> to DRM.
> 
> Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Ref:
>  * https://lore.kernel.org/linux-renesas-soc/OS0PR01MB592298E75153A52245D789D4860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#u
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 1065dca885ef..b2bddbeca878 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -56,7 +56,7 @@ config DRM_RCAR_MIPI_DSI
>  
>  config DRM_RZG2L_MIPI_DSI
>  	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM_BRIDGE && OF
> +	depends on DRM && DRM_BRIDGE && OF
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select DRM_MIPI_DSI
>  	help

-- 
Regards,

Laurent Pinchart
