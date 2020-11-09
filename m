Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C22AB652
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B642F8994D;
	Mon,  9 Nov 2020 11:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61718994D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:16:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53B2DB2B;
 Mon,  9 Nov 2020 12:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604920574;
 bh=+KJGY4ijKH63lMcqJdU36XoGEfZ118V7qI8Gbv9vgV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aronStbwZNJ936wJtVUlX4Yu5pW3nn+vC3Nkkp5fH+iNbJKIh1xINkCV2sLqxrAzI
 gtNYj4rhXyQ0TvkcWSUKH7ezKy+Bz7V7nztvdRfj+g3qOoZfPhDdC2rtniC4kEUUNd
 RgAD4sZiQY1vigGBvFARnK7D/V3MfQy1Ecjb04DI=
Date: Mon, 9 Nov 2020 13:16:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 53/56] drm/omap: remove unused display.c
Message-ID: <20201109111611.GX6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-54-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-54-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:30PM +0200, Tomi Valkeinen wrote:
> The functions in display.c are not used, so drop the file.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/Makefile      |  2 +-
>  drivers/gpu/drm/omapdrm/dss/display.c | 58 ---------------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  4 --
>  3 files changed, 1 insertion(+), 63 deletions(-)
>  delete mode 100644 drivers/gpu/drm/omapdrm/dss/display.c
> 
> diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
> index 33fe7e937680..21e8277ff88f 100644
> --- a/drivers/gpu/drm/omapdrm/Makefile
> +++ b/drivers/gpu/drm/omapdrm/Makefile
> @@ -18,7 +18,7 @@ omapdrm-y := omap_drv.o \
>  
>  omapdrm-$(CONFIG_DRM_FBDEV_EMULATION) += omap_fbdev.o
>  
> -omapdrm-y += dss/base.o dss/display.o dss/output.o dss/dss.o dss/dispc.o \
> +omapdrm-y += dss/base.o dss/output.o dss/dss.o dss/dispc.o \
>  		dss/dispc_coefs.o dss/pll.o dss/video-pll.o
>  omapdrm-$(CONFIG_OMAP2_DSS_DPI) += dss/dpi.o
>  omapdrm-$(CONFIG_OMAP2_DSS_VENC) += dss/venc.o
> diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omapdrm/dss/display.c
> deleted file mode 100644
> index 7b7ee2019eae..000000000000
> --- a/drivers/gpu/drm/omapdrm/dss/display.c
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (C) 2009 Nokia Corporation
> - * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> - *
> - * Some code and ideas taken from drivers/video/omap/ driver
> - * by Imre Deak.
> - */
> -
> -#define DSS_SUBSYS_NAME "DISPLAY"
> -
> -#include <linux/kernel.h>
> -#include <linux/of.h>
> -
> -#include <drm/drm_connector.h>
> -#include <drm/drm_modes.h>
> -
> -#include "omapdss.h"
> -
> -static int disp_num_counter;
> -
> -void omapdss_display_init(struct omap_dss_device *dssdev)
> -{
> -	int id;
> -
> -	/*
> -	 * Note: this presumes that all displays either have an DT alias, or
> -	 * none has.
> -	 */
> -	id = of_alias_get_id(dssdev->dev->of_node, "display");
> -	if (id < 0)
> -		id = disp_num_counter++;
> -
> -	/* Use 'label' property for name, if it exists */
> -	of_property_read_string(dssdev->dev->of_node, "label", &dssdev->name);
> -
> -	if (dssdev->name == NULL)
> -		dssdev->name = devm_kasprintf(dssdev->dev, GFP_KERNEL,
> -					      "display%u", id);
> -}
> -
> -int omapdss_display_get_modes(struct drm_connector *connector,
> -			      const struct videomode *vm)
> -{
> -	struct drm_display_mode *mode;
> -
> -	mode = drm_mode_create(connector->dev);
> -	if (!mode)
> -		return 0;
> -
> -	drm_display_mode_from_videomode(vm, mode);
> -
> -	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> -	drm_mode_set_name(mode);
> -	drm_mode_probed_add(connector, mode);
> -
> -	return 1;
> -}
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 4e7ae164de4f..90e41c635e45 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -300,10 +300,6 @@ struct dss_pdata {
>  	struct dss_device *dss;
>  };
>  
> -void omapdss_display_init(struct omap_dss_device *dssdev);
> -int omapdss_display_get_modes(struct drm_connector *connector,
> -			      const struct videomode *vm);
> -
>  void omapdss_device_register(struct omap_dss_device *dssdev);
>  void omapdss_device_unregister(struct omap_dss_device *dssdev);
>  struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssdev);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
