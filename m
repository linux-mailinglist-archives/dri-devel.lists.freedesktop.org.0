Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEB481560
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 17:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FD810E1FB;
	Wed, 29 Dec 2021 16:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0F710E1FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 16:53:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15485464;
 Wed, 29 Dec 2021 17:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1640796791;
 bh=d4mUqBC++plc2D3Vh5L6ujyZUc9IN8xOvxhMd+u6XZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCc3yy70iQyyy1vXz8/aLYXRTGapqmsPk/n/zN1AWZg15snGiY0clN8DSwxiq1KJs
 uG4pxSgkkrAQlM2hRdmfEeMZDI00+XLJS/dDicpHVBr+NHIH/EvSo1d6buXtb+pr02
 2UeCg3/pGPehayk2VUrzLmv9t2V/Twu7lB+7Ap5U=
Date: Wed, 29 Dec 2021 18:53:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: lvds: Add r8a77961 support
Message-ID: <YcySdeYmUBCW/9r7@pendragon.ideasonboard.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-2-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211224052309.1997096-2-nikita.yoush@cogentembedded.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikita,

Thank you for the patch.

On Fri, Dec 24, 2021 at 08:23:07AM +0300, Nikita Yushchenko wrote:
> The M3-W+ SoC has the same LVDS encoder as other R-Car Gen3 chips.
> Add support for M3-W+ (R8A77961) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 72a272cfc11e..8dbfbbd3cad1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -901,6 +901,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a7796-lvds", .data = &rcar_lvds_gen3_info },
> +	{ .compatible = "renesas,r8a77961-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77965-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a77970-lvds", .data = &rcar_lvds_r8a77970_info },
>  	{ .compatible = "renesas,r8a77980-lvds", .data = &rcar_lvds_gen3_info },

-- 
Regards,

Laurent Pinchart
