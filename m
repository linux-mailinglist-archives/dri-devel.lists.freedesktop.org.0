Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09283735192
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9CA10E1D4;
	Mon, 19 Jun 2023 10:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4200110E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:09:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65924FB;
 Mon, 19 Jun 2023 12:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687169339;
 bh=8KLNVd3x/Kt6IAGErzu+Yt02tpa87WUe7LsV3zMi8oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lv96dCKIYb+19hPKMjHu55PvBBgxRgg+vYwp7oQf1nlmhxHNjwaxGNPwRGijHD37n
 dzoHVkEsM4aMLag8lC99nL4IQSZgLwbFqn8UKc6+6lbmveouzMc+fUtyBdSMAs29+x
 78iPU1PghaZhPcdbKNEwR/8jHz4LGMlogILkKGIk=
Date: Mon, 19 Jun 2023 13:09:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] MAINTAINERS: Update info for TI display drivers
Message-ID: <20230619100934.GB10462@pendragon.ideasonboard.com>
References: <20230619082323.20575-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230619082323.20575-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>, Aradhya Bhatia <a-bhatia1@ti.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Jun 19, 2023 at 11:23:23AM +0300, Tomi Valkeinen wrote:
> Add drm-misc as the git tree for tilcdc and omapdrm. Change Tomi's email
> to point to ideasonboard.com instead of kernel.org.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa0aa6c31772..29f242734eee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7014,7 +7014,7 @@ F:	drivers/gpu/drm/stm
>  
>  DRM DRIVERS FOR TI KEYSTONE
>  M:	Jyri Sarha <jyri.sarha@iki.fi>
> -M:	Tomi Valkeinen <tomba@kernel.org>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -7025,16 +7025,18 @@ F:	drivers/gpu/drm/tidss/
>  
>  DRM DRIVERS FOR TI LCDC
>  M:	Jyri Sarha <jyri.sarha@iki.fi>
> -R:	Tomi Valkeinen <tomba@kernel.org>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/tilcdc/
>  F:	drivers/gpu/drm/tilcdc/
>  
>  DRM DRIVERS FOR TI OMAP
> -M:	Tomi Valkeinen <tomba@kernel.org>
> +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/ti/
>  F:	drivers/gpu/drm/omapdrm/
>  

-- 
Regards,

Laurent Pinchart
