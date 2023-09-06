Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3D793D93
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 15:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF37010E1BF;
	Wed,  6 Sep 2023 13:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66A510E64F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 13:24:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53E07DA8;
 Wed,  6 Sep 2023 15:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694006608;
 bh=O8ASfos0e7KQ3kQYHZDzxCDpFTkKK0NFcWW1Yk5WQuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ud9pUtCANON8aValeRZORHLXNaCfzhH4wwMWCwbvt2pOGXwhwuEE1FGADzd5L9+U8
 2neCPsDAx9VEUd+9v6Pj4hwiKCc07IllgrJ2xr81OZgxduZC9lxFVO75MNoAA4QzkW
 fsOue5jARyBegoIhWM9qSigyS/fTcLuZ/87dUC3Y=
Date: Wed, 6 Sep 2023 16:25:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the
 comment in rzg2l_mipi_dsi_start_video()
Message-ID: <20230906132508.GM17308@pendragon.ideasonboard.com>
References: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pavel Machek <pavel@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Wed, Sep 06, 2023 at 10:43:46AM +0100, Biju Das wrote:
> Add missing space in the comment in rzg2l_mipi_dsi_start_video().
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This issue is noticed while backporting this driver to 6.1.y-cip [1].
> 
> [1] https://lore.kernel.org/all/20230905160737.167877-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index 10febea473cd..9b5cfdd3e1c5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi)
>  	u32 status;
>  	int ret;
>  
> -	/* Configuration for Blanking sequence and start video input*/
> +	/* Configuration for Blanking sequence and start video input */
>  	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
>  		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);

-- 
Regards,

Laurent Pinchart
