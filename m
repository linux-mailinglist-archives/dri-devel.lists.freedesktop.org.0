Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD426AF90
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 23:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA546E131;
	Tue, 15 Sep 2020 21:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D796E131
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 21:28:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 550EFFD8;
 Tue, 15 Sep 2020 23:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600205328;
 bh=1fW+9ODHyTgtpvCwB+LlP1H9FsiLZbbOxUQHapfO7TY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcjNrdPzbHAOZWxm8YFvpLv4pptFk+HGV4svfxm0j9nuLZxzQanTUzdQcbIOJ6+Sf
 8/a+AfI9tY+liC8t9CkZLm4PwIfy27IUaAO24PaWTbqlJDR07/FvsNNbec1YYsTGtb
 L4TsMTNSNWCKNdeEw67z2jFZvtoLoHgdk7j7GVXE=
Date: Wed, 16 Sep 2020 00:28:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: Kconfig: Update description for DRM_RCAR_DW_HDMI
 config
Message-ID: <20200915212819.GD3998@pendragon.ideasonboard.com>
References: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar,

Thank you for the patch.

On Fri, Sep 11, 2020 at 11:07:41AM +0100, Lad Prabhakar wrote:
> rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoC's, update the
> same to reflect the description for DRM_RCAR_DW_HDMI config.

I'm not sure what you mean by "the same" here. I'd propose

The rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoCs. Update the
Kconfig entry description to reflect this.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you're fine with that, there's no need to resubmit the patch.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index f65d1489dc50..bd8b43fb9753 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,11 +22,11 @@ config DRM_RCAR_CMM
>  	  Enable support for R-Car Color Management Module (CMM).
>  
>  config DRM_RCAR_DW_HDMI
> -	tristate "R-Car DU Gen3 HDMI Encoder Support"
> +	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
>  	select DRM_DW_HDMI
>  	help
> -	  Enable support for R-Car Gen3 internal HDMI encoder.
> +	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
>  
>  config DRM_RCAR_LVDS
>  	tristate "R-Car DU LVDS Encoder Support"

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
