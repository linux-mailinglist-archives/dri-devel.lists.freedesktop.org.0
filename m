Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B1475634
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A252510E471;
	Wed, 15 Dec 2021 10:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D7910E450
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 10:24:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7060292;
 Wed, 15 Dec 2021 11:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639563873;
 bh=4g2mn2I5Vuf+M4ULqrRTf1ix167MP5AovRDWSM6vWdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hYc7IL/Ryo4b3RizgsZGK0HuKYBskoaqVfLBbSMp6Rrm9z2o9Pz6rArzdnG9pfXXS
 13Xfd3Hgcqx6WMcHUt+ZU9Gq1ENNgclQ794Sw1uSabXns3S2X/yDOaxOiKbP5p+k+M
 sfA1tKgOONxFJakcUyXdAo8XLvXj+87s1PA1A7GA=
Date: Wed, 15 Dec 2021 12:24:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] drm: rcar-du: DRM_RCAR_DW_HDMI should depend on
 ARCH_RENESAS
Message-ID: <YbnCXreb5zjqH9r6@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cb4593af06b64eb43a316913dc4bf83d46d7d7f.1639559338.git.geert+renesas@glider.be>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Wed, Dec 15, 2021 at 10:27:45AM +0100, Geert Uytterhoeven wrote:
> The Renesas R-Car Gen3 and RZ/G2 internal HDMI encoder is only present
> on Renesas R-Car Gen3 and RZ/G2 SoCs.  Hence add a dependency on
> ARCH_RENESAS, to prevent asking the user about this driver when
> configuring a kernel without Renesas SoC support.
> 
> Fixes: 40d0fa7095d06c73 ("drm: rcar-du: Add Gen3 HDMI encoder support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index f6e6a6d5d987bf95..65d72be50f46f19e 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST

Let's move this entry first to keep alphabetical order.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.

-- 
Regards,

Laurent Pinchart
