Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373FE59923E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 03:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409610E142;
	Fri, 19 Aug 2022 01:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810210E142
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 01:06:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDE618B;
 Fri, 19 Aug 2022 03:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660871201;
 bh=NNUU5YzrDxjmeQ0TD9XuwhtqJs5RLbmdvu7V+5nLdbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GUhvLH55x4F2J5p+bBI9Zh2v1Ni0ZRMiPDyLpi58F7gJIC852VrhHt0iKg86CP8Ve
 LISRkxpNGwnfFV0ykd1vdQIHi6Af539G1worBZhGU25lofmXhOFfBri1IAvwvZskQe
 LnBl+69dn18/T8yjd4UUcI8OzwAdAyUo9Ic9x/4s=
Date: Fri, 19 Aug 2022 04:06:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: remove unnecessary include
Message-ID: <Yv7iHRuoSPi8ocZH@pendragon.ideasonboard.com>
References: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817132803.85373-1-tomi.valkeinen@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Wed, Aug 17, 2022 at 04:28:01PM +0300, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> rcar_du_regs.h is not needed by rcar_du_drv.c so drop the include.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 00ac233a115e..541c202c993a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -27,7 +27,6 @@
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_kms.h"
> -#include "rcar_du_regs.h"
>  
>  /* -----------------------------------------------------------------------------
>   * Device Information

-- 
Regards,

Laurent Pinchart
