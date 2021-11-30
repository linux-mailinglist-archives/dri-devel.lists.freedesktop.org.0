Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A3462AA3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 03:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391306E21C;
	Tue, 30 Nov 2021 02:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B96E219
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 02:39:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4126C2FD;
 Tue, 30 Nov 2021 03:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638239977;
 bh=D6c5QdmEOPbcUcWv/45z7zVdzObV1vuKlP/0f9FHf54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1ElRcoeeQXJSn0aDfgfttYjApGk3N9AekQZzH41b+TsHekB6RGm6RoYbSAGM4xYt
 xCFaOt+FHlYGWOswcjDbL4GseCtkCNOg0hbH1XThkb2kYUNMmkHjcClGLOvG407ykG
 ucxnxXkRZLfM6xKSChCWLNoA8FrDsw28f8/pJEUw=
Date: Tue, 30 Nov 2021 04:39:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Add DSI support to rcar_du_output_name
Message-ID: <YaWO0MjIDAa30cSM@pendragon.ideasonboard.com>
References: <20211129170845.2269532-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211129170845.2269532-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Mon, Nov 29, 2021 at 05:08:45PM +0000, Kieran Bingham wrote:
> The DSI output names were not added when the DSI pipeline support was
> introduced.
> 
> Add the correct labels for these outputs, and fix the sort order to
> match 'enum rcar_du_output' while we are here.
> 
> Fixes: b291fdcf5114 ("drm: rcar-du: Add r8a779a0 device support")
> Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 5612a9e7a905..5a8131ef81d5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -544,10 +544,12 @@ const char *rcar_du_output_name(enum rcar_du_output output)
>  	static const char * const names[] = {
>  		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0",
>  		[RCAR_DU_OUTPUT_DPAD1] = "DPAD1",
> -		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> -		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
> +		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
> +		[RCAR_DU_OUTPUT_DSI1] = "DSI1",
>  		[RCAR_DU_OUTPUT_HDMI0] = "HDMI0",
>  		[RCAR_DU_OUTPUT_HDMI1] = "HDMI1",
> +		[RCAR_DU_OUTPUT_LVDS0] = "LVDS0",
> +		[RCAR_DU_OUTPUT_LVDS1] = "LVDS1",
>  		[RCAR_DU_OUTPUT_TCON] = "TCON",
>  	};
>  

-- 
Regards,

Laurent Pinchart
