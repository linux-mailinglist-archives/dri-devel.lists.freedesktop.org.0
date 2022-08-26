Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC45A32BD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 01:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD2810E6A1;
	Fri, 26 Aug 2022 23:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D801210E6A1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 23:42:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5264120A;
 Sat, 27 Aug 2022 01:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661557367;
 bh=4Dvzd8Qt8F/N2QEWmU3+l627VznMmWv23c/4F/253jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eWHIOTk5WBrZ59pg4KvOcLWFYBJfDkJCOOLK5ODc3Sbozio0noaoM2Iz8QW32/+6E
 BjmMOLiSOUwCFjKy+LUK+pG6CXeMZE6lu/27NvIzIUgBlbdJQ9MT7pH/hD3cjGPmOa
 RXTJLCO7hNoPwyYsw40ZPpmdpE1JOPTlsHgAdDv4=
Date: Sat, 27 Aug 2022 02:42:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Drop unused encoder header files
Message-ID: <YwlacAoQgITHrrpt@pendragon.ideasonboard.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Thu, Aug 25, 2022 at 11:39:04AM +0100, Biju Das wrote:
> Drop unused header files from rcar_du_encoder.c
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 60d6be78323b..bfd5c087eb0a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -9,18 +9,13 @@
>  
>  #include <linux/export.h>
>  #include <linux/of.h>
> -#include <linux/slab.h>
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_managed.h>
> -#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> -#include "rcar_du_kms.h"
>  #include "rcar_lvds.h"
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
