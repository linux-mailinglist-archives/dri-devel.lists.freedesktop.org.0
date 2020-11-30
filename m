Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777882C825F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D916E44F;
	Mon, 30 Nov 2020 10:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7146E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:42:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99422B26;
 Mon, 30 Nov 2020 11:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606732936;
 bh=nccvof+bLS6m3IRK7ODyI1Qp7X5cMr+LeoTk3Ain1bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H0TA8KBtlbPfR/drXg8SlDaZlv9zyEyzkSLXMA8IigojQqF+26OwbUs7uM2rP5ka5
 NvNlmGXXJhk+jztElkDYE5rVRUkMUODXAYb3ievH9VF85XS+PsEVVaiDqdm9cwgKRa
 DDt20ZxvIxzXzUuSteun8FysAm2pEs1KEyazMCI0=
Date: Mon, 30 Nov 2020 12:42:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 4/5] drm/omap: rearrange includes in omapdss.h
Message-ID: <20201130104208.GT4141@pendragon.ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103080310.164453-5-tomi.valkeinen@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 03, 2020 at 10:03:09AM +0200, Tomi Valkeinen wrote:
> Drop "uapi/" and rearrange alphabetically.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index ab19d4af8de7..8e9a2019f173 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -7,13 +7,13 @@
>  #ifndef __OMAP_DRM_DSS_H
>  #define __OMAP_DRM_DSS_H
>  
> -#include <linux/list.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_mode.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> -#include <video/videomode.h>
> +#include <linux/list.h>
>  #include <linux/platform_data/omapdss.h>
> -#include <uapi/drm/drm_mode.h>
> -#include <drm/drm_crtc.h>
> +#include <video/videomode.h>
>  
>  #define DISPC_IRQ_FRAMEDONE		(1 << 0)
>  #define DISPC_IRQ_VSYNC			(1 << 1)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
