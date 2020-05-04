Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCB1C388A
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 13:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0FB6E39E;
	Mon,  4 May 2020 11:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D956E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 11:45:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r26so8676645wmh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pX06LMtTZTER+xazptqkkavIDMccFm20O38NkNPUPYQ=;
 b=cSfCW0QT3wCFxwrvm8L5ng3WkpFQG+N1H7jW0Os89fbcb89F3g7wKtktd++2VJMRhn
 S04k85cTAv/PArpAUxkX3pT8kJ2lwvW13xgKt+fhHLQl++Q949dTNOq7VIhpntmVCVZX
 g2FcHyoa4J78VKjNt9pjR2GxKWIZDXPoYLmzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pX06LMtTZTER+xazptqkkavIDMccFm20O38NkNPUPYQ=;
 b=o2vp6oPMaVfiUn/kjinZ98hIdFNvBNSRljInyaxZ0Ev6eGRA6+ThBKjzuF8bthZduD
 dy2kNRwcOzgClOkMLXjwctcy2bh0IUbjwgiYJbdoMFVgzgHwgJIWzWybFtOKOOBjK11H
 uDfNi+o+T6GsppHjGKeg4unp31JYc9pSs+xoj4avOtwfKlJd9yNIlrV/Bw4mkJQsW1JA
 6Q0ISQmY9PMgrXYAwSvVbUfi2scsf6GzlL/zj8OAa35aq/6jW9zhk5s+kf/1re8fypg+
 DFrl0CwWCLaRWhWEMM9DIM2OZ8nIX5eJATxS2q8Si+3MPQBDOTXjaNSvmvLzBuwR3IWW
 w/Og==
X-Gm-Message-State: AGi0PuZKoLxjQXsRZe+ARh7XlfWAUe3dVm2U6QXvSiN2+A7r4SZyD7k/
 ezoGwrWh3bASTZRrc3ZOpAal/g==
X-Google-Smtp-Source: APiQypLX2aYeYacJQ0Ol8E4cj51s0PlYVb9k8pW74/IQ36d1M+aJSo+s61ekJHmB3vBaUaNJ55Vo7g==
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr13554731wmi.57.1588592753841; 
 Mon, 04 May 2020 04:45:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 89sm6164172wrj.37.2020.05.04.04.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:45:52 -0700 (PDT)
Date: Mon, 4 May 2020 13:45:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 2/2] drm: Add support for the LogiCVC display controller
Message-ID: <20200504112335.GH10381@phenom.ffwll.local>
Mail-Followup-To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20200403093617.760278-1-paul.kocialkowski@bootlin.com>
 <20200403093617.760278-3-paul.kocialkowski@bootlin.com>
 <20200403110433.GU2363188@phenom.ffwll.local>
 <20200430191007.GK610776@aptenodytes>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430191007.GK610776@aptenodytes>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 09:10:07PM +0200, Paul Kocialkowski wrote:
> Hi Daniel,
> 
> On Fri 03 Apr 20, 13:04, Daniel Vetter wrote:
> > On Fri, Apr 03, 2020 at 11:36:17AM +0200, Paul Kocialkowski wrote:
> > > Introduces a driver for the LogiCVC display controller, a programmable
> > > logic controller optimized for use in Xilinx Zynq-7000 SoCs and other
> > > Xilinx FPGAs. The controller is mostly configured at logic synthesis
> > > time so only a subset of configuration is left for the driver to
> > > handle.
> > > 
> > > The following features are implemented and tested:
> > > - LVDS 4-bit interface;
> > > - RGB565 pixel formats;
> > > - Multiple layers and hardware composition;
> > > - Layer-wide alpha mode;
> > > 
> > > The following features are implemented but untested:
> > > - Other RGB pixel formats;
> > > - Layer framebuffer configuration for version 4;
> > > - Lowest-layer used as background color;
> > > - Per-pixel alpha mode.
> > > 
> > > The following features are not implemented:
> > > - YUV pixel formats;
> > > - DVI, LVDS 3-bit, ITU656 and camera link interfaces;
> > > - External parallel input for layer;
> > > - Color-keying;
> > > - LUT-based alpha modes.
> > > 
> > > Additional implementation-specific notes:
> > > - Panels are only enabled after the first page flip to avoid flashing a
> > >   white screen.
> > > - Depth used in context of the LogiCVC driver only counts color components
> > >   to match the definition of the synthesis parameters.
> > > 
> > > Support is implemented for both version 3 and 4 of the controller.
> > > 
> > > With version 3, framebuffers are stored in a dedicated contiguous
> > > memory area, with a base address hardcoded for each layer. This requires
> > > using a dedicated CMA pool registered at the base address and tweaking a
> > > few offset-related registers to try to use any buffer allocated from
> > > the pool. This is done on a best-effort basis to have the hardware cope
> > > with the DRM framebuffer allocation model and there is no guarantee
> > > that each buffer allocated by GEM CMA can be used for any layer.
> > > In particular, buffers allocated below the base address for a layer are
> > > guaranteed not to be configurable for that layer. See the implementation of
> > > logicvc_layer_buffer_find_setup for specifics.
> > > 
> > > Version 4 allows configuring each buffer address directly, which
> > > guarantees that any buffer can be configured.
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > 
> > Just a few comments on stuff I've spotted since I'm working in this area.
> 
> Thanks for the review (and the devm_drm_dev_alloc series)!
> 
> I'm preparing a new version taking in account your comments. However, I didn't
> find a suitable panel connector wrapper: all I see is a wrapper for the
> bridge + panel use case.

Yup that's the one I mean. drm_bridge is supposed to be the generic "glue
stuff into my output pipeline" thing. Including panels. It's a few more
layers of abstraction, but should still be a bunch less code for you.
-Daniel

> 
> Cheers,
> 
> Paul
> 
> > > ---
> > >  MAINTAINERS                                 |   6 +
> > >  drivers/gpu/drm/Kconfig                     |   2 +
> > >  drivers/gpu/drm/Makefile                    |   1 +
> > >  drivers/gpu/drm/logicvc/Kconfig             |   9 +
> > >  drivers/gpu/drm/logicvc/Makefile            |   4 +
> > >  drivers/gpu/drm/logicvc/logicvc_crtc.c      | 272 +++++++++
> > >  drivers/gpu/drm/logicvc/logicvc_crtc.h      |  23 +
> > >  drivers/gpu/drm/logicvc/logicvc_drm.c       | 471 +++++++++++++++
> > >  drivers/gpu/drm/logicvc/logicvc_drm.h       |  60 ++
> > >  drivers/gpu/drm/logicvc/logicvc_interface.c | 240 ++++++++
> > >  drivers/gpu/drm/logicvc/logicvc_interface.h |  32 ++
> > >  drivers/gpu/drm/logicvc/logicvc_layer.c     | 603 ++++++++++++++++++++
> > >  drivers/gpu/drm/logicvc/logicvc_layer.h     |  65 +++
> > >  drivers/gpu/drm/logicvc/logicvc_mode.c      | 104 ++++
> > >  drivers/gpu/drm/logicvc/logicvc_mode.h      |  15 +
> > >  drivers/gpu/drm/logicvc/logicvc_of.c        | 205 +++++++
> > >  drivers/gpu/drm/logicvc/logicvc_of.h        |  28 +
> > >  drivers/gpu/drm/logicvc/logicvc_regs.h      |  88 +++
> > >  18 files changed, 2228 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/logicvc/Kconfig
> > >  create mode 100644 drivers/gpu/drm/logicvc/Makefile
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
> > >  create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index aff76a779cfe..531128065d46 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5307,6 +5307,12 @@ S:	Orphan / Obsolete
> > >  F:	drivers/gpu/drm/i810/
> > >  F:	include/uapi/drm/i810_drm.h
> > >  
> > > +DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
> > > +M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > > +S:	Supported
> > > +F:	drivers/gpu/drm/logicvc/
> > > +
> > >  DRM DRIVER FOR MATROX G200/G400 GRAPHICS CARDS
> > >  S:	Orphan / Obsolete
> > >  F:	drivers/gpu/drm/mga/
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index 43594978958e..700e6bb49249 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -360,6 +360,8 @@ source "drivers/gpu/drm/arc/Kconfig"
> > >  
> > >  source "drivers/gpu/drm/hisilicon/Kconfig"
> > >  
> > > +source "drivers/gpu/drm/logicvc/Kconfig"
> > > +
> > >  source "drivers/gpu/drm/mediatek/Kconfig"
> > >  
> > >  source "drivers/gpu/drm/zte/Kconfig"
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 183c60048307..7dc2dec4dc0f 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -104,6 +104,7 @@ obj-$(CONFIG_DRM_STM) += stm/
> > >  obj-$(CONFIG_DRM_STI) += sti/
> > >  obj-$(CONFIG_DRM_IMX) += imx/
> > >  obj-$(CONFIG_DRM_INGENIC) += ingenic/
> > > +obj-$(CONFIG_DRM_LOGICVC) += logicvc/
> > >  obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
> > >  obj-$(CONFIG_DRM_MESON)	+= meson/
> > >  obj-y			+= i2c/
> > > diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
> > > new file mode 100644
> > > index 000000000000..300b2be07385
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/Kconfig
> > > @@ -0,0 +1,9 @@
> > > +config DRM_LOGICVC
> > > +	tristate "LogiCVC DRM"
> > > +	depends on DRM
> > > +	depends on OF || COMPILE_TEST
> > > +	select DRM_KMS_HELPER
> > > +	select DRM_KMS_CMA_HELPER
> > > +	select DRM_GEM_CMA_HELPER
> > > +	help
> > > +	  DRM display driver for the logiCVC programmable logic block from Xylon
> > > diff --git a/drivers/gpu/drm/logicvc/Makefile b/drivers/gpu/drm/logicvc/Makefile
> > > new file mode 100644
> > > index 000000000000..c09531fbd6ad
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/Makefile
> > > @@ -0,0 +1,4 @@
> > > +logicvc-drm-y += logicvc_crtc.o logicvc_drm.o logicvc_interface.o \
> > > +		 logicvc_layer.o logicvc_mode.o logicvc_of.o
> > > +
> > > +obj-$(CONFIG_DRM_LOGICVC) += logicvc-drm.o
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.c b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> > > new file mode 100644
> > > index 000000000000..d732821a255a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.c
> > > @@ -0,0 +1,272 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "logicvc_crtc.h"
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_interface.h"
> > > +#include "logicvc_layer.h"
> > > +#include "logicvc_regs.h"
> > > +
> > > +#define logicvc_crtc(c) \
> > > +	container_of(c, struct logicvc_crtc, drm_crtc)
> > > +
> > > +static int logicvc_crtc_atomic_check(struct drm_crtc *drm_crtc,
> > > +				     struct drm_crtc_state *state)
> > > +{
> > > +	struct drm_display_mode *mode = &state->adjusted_mode;
> > > +
> > > +	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
> > > +				      struct drm_crtc_state *old_state)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
> > > +	struct drm_device *drm = drm_crtc->dev;
> > > +	unsigned long flags;
> > > +
> > > +	/* Register pending event, only if vblank is already on. */
> > > +	if (drm_crtc->state->event && old_state->active) {
> > > +		spin_lock_irqsave(&drm->event_lock, flags);
> > > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) != 0);
> > > +
> > > +		crtc->event = drm_crtc->state->event;
> > > +		drm_crtc->state->event = NULL;
> > > +
> > > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > > +	}
> > > +}
> > > +
> > > +static void logicvc_crtc_atomic_enable(struct drm_crtc *drm_crtc,
> > > +				       struct drm_crtc_state *old_state)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
> > > +	struct logicvc_drm *logicvc = crtc->logicvc;
> > > +	struct drm_display_mode *mode = &drm_crtc->state->adjusted_mode;
> > > +	struct drm_device *drm = drm_crtc->dev;
> > > +	unsigned int hact, hfp, hsl, hbp;
> > > +	unsigned int vact, vfp, vsl, vbp;
> > > +	unsigned long flags;
> > > +	u32 ctrl;
> > > +
> > > +	/* Timings */
> > > +
> > > +	hact = mode->hdisplay;
> > > +	hfp = mode->hsync_start - mode->hdisplay;
> > > +	hsl = mode->hsync_end - mode->hsync_start;
> > > +	hbp = mode->htotal - mode->hsync_end;
> > > +
> > > +	vact = mode->vdisplay;
> > > +	vfp = mode->vsync_start - mode->vdisplay;
> > > +	vsl = mode->vsync_end - mode->vsync_start;
> > > +	vbp = mode->vtotal - mode->vsync_end;
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_FRONT_PORCH_REG, hfp - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_REG, hsl - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_HSYNC_BACK_PORCH_REG, hbp - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_HRES_REG, hact - 1);
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_FRONT_PORCH_REG, vfp - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_REG, vsl - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_VSYNC_BACK_PORCH_REG, vbp - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_VRES_REG, vact - 1);
> > > +
> > > +	/* Signals */
> > > +
> > > +	ctrl = LOGICVC_CTRL_HSYNC_ENABLE | LOGICVC_CTRL_VSYNC_ENABLE |
> > > +	       LOGICVC_CTRL_DE_ENABLE;
> > > +
> > > +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > +		ctrl |= LOGICVC_CTRL_HSYNC_INVERT;
> > > +
> > > +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> > > +		ctrl |= LOGICVC_CTRL_VSYNC_INVERT;
> > > +
> > > +	if (logicvc->interface) {
> > > +		struct drm_connector *connector =
> > > +			&logicvc->interface->drm_connector;
> > > +		struct drm_display_info *display_info =
> > > +			&connector->display_info;
> > > +
> > > +		if (display_info->bus_flags & DRM_BUS_FLAG_DE_LOW)
> > > +			ctrl |= LOGICVC_CTRL_DE_INVERT;
> > > +
> > > +		if (display_info->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > > +			ctrl |= LOGICVC_CTRL_CLOCK_INVERT;
> > > +	}
> > > +
> > > +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> > > +			   LOGICVC_CTRL_HSYNC_ENABLE |
> > > +			   LOGICVC_CTRL_HSYNC_INVERT |
> > > +			   LOGICVC_CTRL_VSYNC_ENABLE |
> > > +			   LOGICVC_CTRL_VSYNC_INVERT |
> > > +			   LOGICVC_CTRL_DE_ENABLE |
> > > +			   LOGICVC_CTRL_DE_INVERT |
> > > +			   LOGICVC_CTRL_PIXEL_INVERT |
> > > +			   LOGICVC_CTRL_CLOCK_INVERT, ctrl);
> > > +
> > > +	/* Generate internal state reset. */
> > > +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> > > +
> > > +	drm_crtc_vblank_on(drm_crtc);
> > > +
> > > +	/* Register our event after vblank is enabled. */
> > > +	if (drm_crtc->state->event && !old_state->active) {
> > > +		spin_lock_irqsave(&drm->event_lock, flags);
> > > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) != 0);
> > > +
> > > +		crtc->event = drm_crtc->state->event;
> > > +		drm_crtc->state->event = NULL;
> > > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > > +	}
> > > +}
> > > +
> > > +static void logicvc_crtc_atomic_disable(struct drm_crtc *drm_crtc,
> > > +					struct drm_crtc_state *old_state)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
> > > +	struct logicvc_drm *logicvc = crtc->logicvc;
> > > +
> > > +	drm_crtc_vblank_off(drm_crtc);
> > > +
> > > +	/* Disable and clear CRTC bits. */
> > > +	regmap_update_bits(logicvc->regmap, LOGICVC_CTRL_REG,
> > > +			   LOGICVC_CTRL_HSYNC_ENABLE |
> > > +			   LOGICVC_CTRL_HSYNC_INVERT |
> > > +			   LOGICVC_CTRL_VSYNC_ENABLE |
> > > +			   LOGICVC_CTRL_VSYNC_INVERT |
> > > +			   LOGICVC_CTRL_DE_ENABLE |
> > > +			   LOGICVC_CTRL_DE_INVERT |
> > > +			   LOGICVC_CTRL_PIXEL_INVERT |
> > > +			   LOGICVC_CTRL_CLOCK_INVERT, 0);
> > > +
> > > +	/* Generate internal state reset. */
> > > +	regmap_write(logicvc->regmap, LOGICVC_DTYPE_REG, 0);
> > > +
> > > +	/* Consume leftover event since vblank is now disabled. */
> > > +	if (drm_crtc->state->event && !drm_crtc->state->active) {
> > > +		spin_lock_irq(&drm_crtc->dev->event_lock);
> > > +
> > > +		drm_crtc_send_vblank_event(drm_crtc, drm_crtc->state->event);
> > > +		drm_crtc->state->event = NULL;
> > > +		spin_unlock_irq(&drm_crtc->dev->event_lock);
> > > +	}
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs logicvc_crtc_helper_funcs = {
> > > +	.atomic_check		= logicvc_crtc_atomic_check,
> > > +	.atomic_begin		= logicvc_crtc_atomic_begin,
> > > +	.atomic_enable		= logicvc_crtc_atomic_enable,
> > > +	.atomic_disable		= logicvc_crtc_atomic_disable,
> > > +};
> > > +
> > > +static int logicvc_crtc_enable_vblank(struct drm_crtc *drm_crtc)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
> > > +	struct logicvc_drm *logicvc = crtc->logicvc;
> > > +
> > > +	/* Clear any pending V_SYNC interrupt. */
> > > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_STAT_REG,
> > > +			  LOGICVC_INT_STAT_V_SYNC, LOGICVC_INT_STAT_V_SYNC);
> > > +
> > > +	/* Unmask V_SYNC interrupt. */
> > > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> > > +			  LOGICVC_INT_MASK_V_SYNC, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void logicvc_crtc_disable_vblank(struct drm_crtc *drm_crtc)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc_crtc(drm_crtc);
> > > +	struct logicvc_drm *logicvc = crtc->logicvc;
> > > +
> > > +	/* Mask V_SYNC interrupt. */
> > > +	regmap_write_bits(logicvc->regmap, LOGICVC_INT_MASK_REG,
> > > +			  LOGICVC_INT_MASK_V_SYNC, LOGICVC_INT_MASK_V_SYNC);
> > > +}
> > > +
> > > +static const struct drm_crtc_funcs logicvc_crtc_funcs = {
> > > +	.reset			= drm_atomic_helper_crtc_reset,
> > > +	.destroy		= drm_crtc_cleanup,
> > > +	.set_config		= drm_atomic_helper_set_config,
> > > +	.page_flip		= drm_atomic_helper_page_flip,
> > > +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> > > +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> > > +	.enable_vblank		= logicvc_crtc_enable_vblank,
> > > +	.disable_vblank		= logicvc_crtc_disable_vblank,
> > > +};
> > > +
> > > +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct logicvc_crtc *crtc = logicvc->crtc;
> > > +	struct drm_device *drm = logicvc->drm;
> > > +	unsigned long flags;
> > > +
> > > +	if (!crtc)
> > > +		return;
> > > +
> > > +	drm_crtc_handle_vblank(&crtc->drm_crtc);
> > > +
> > > +	if (crtc->event) {
> > > +		spin_lock_irqsave(&drm->event_lock, flags);
> > > +		drm_crtc_send_vblank_event(&crtc->drm_crtc, crtc->event);
> > > +		drm_crtc_vblank_put(&crtc->drm_crtc);
> > > +		crtc->event = NULL;
> > > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > > +	}
> > > +}
> > > +
> > > +int logicvc_crtc_init(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct device_node *of_node = logicvc->drm->dev->of_node;
> > > +	struct logicvc_crtc *crtc;
> > > +	struct logicvc_layer *layer_primary;
> > > +	int ret;
> > > +
> > > +	crtc = devm_kzalloc(logicvc->drm->dev, sizeof(*crtc), GFP_KERNEL);
> > > +	if (!crtc)
> > > +		return -ENOMEM;
> > > +
> > > +	crtc->logicvc = logicvc;
> > > +
> > > +	layer_primary = logicvc_layer_get_primary(logicvc);
> > > +	if (!layer_primary) {
> > > +		DRM_ERROR("Failed to get primary layer\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = drm_crtc_init_with_planes(logicvc->drm, &crtc->drm_crtc,
> > > +					&layer_primary->drm_plane, NULL,
> > > +					&logicvc_crtc_funcs, NULL);
> > > +	if (ret) {
> > > +		DRM_ERROR("Failed to initalize CRTC\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_crtc_helper_add(&crtc->drm_crtc, &logicvc_crtc_helper_funcs);
> > > +
> > > +	crtc->drm_crtc.port = of_graph_get_port_by_id(of_node, 1);
> > > +
> > > +	logicvc->crtc = crtc;
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_crtc.h b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> > > new file mode 100644
> > > index 000000000000..b2fd96b3fe0f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_crtc.h
> > > @@ -0,0 +1,23 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_CRTC_H_
> > > +#define _LOGICVC_CRTC_H_
> > > +
> > > +struct drm_pending_vblank_event;
> > > +struct logicvc_drm;
> > > +
> > > +struct logicvc_crtc {
> > > +	struct logicvc_drm *logicvc;
> > 
> > You have these sprinkled all over, they're redundant imo just upcast the
> > drm_device pointer that all the base class structures have already.
> > There's a bunch of these all over. If you want to a nice little function
> > to do the pointer chasing&casting so you can go directly from logicvc_crtc
> > to logicvc_drm.
> > 
> > > +
> > > +	struct drm_crtc drm_crtc;
> > > +	struct drm_pending_vblank_event *event;
> > > +};
> > > +
> > > +void logicvc_crtc_vblank_handler(struct logicvc_drm *logicvc);
> > > +int logicvc_crtc_init(struct logicvc_drm *logicvc);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
> > > new file mode 100644
> > > index 000000000000..527b12cbd17b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> > > @@ -0,0 +1,471 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "logicvc_crtc.h"
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_interface.h"
> > > +#include "logicvc_mode.h"
> > > +#include "logicvc_layer.h"
> > > +#include "logicvc_of.h"
> > > +#include "logicvc_regs.h"
> > > +
> > > +DEFINE_DRM_GEM_CMA_FOPS(logicvc_drm_fops);
> > > +
> > > +static int logicvc_drm_gem_cma_dumb_create(struct drm_file *file_priv,
> > > +					   struct drm_device *drm,
> > > +					   struct drm_mode_create_dumb *args)
> > > +{
> > > +	struct logicvc_drm *logicvc = drm->dev_private;
> > > +
> > > +	/* Stride is always fixed to its configuration value. */
> > > +	args->pitch = logicvc->config.row_stride * DIV_ROUND_UP(args->bpp, 8);
> > > +
> > > +	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
> > > +}
> > > +
> > > +static struct drm_driver logicvc_drm_driver = {
> > > +	.driver_features		= DRIVER_GEM | DRIVER_MODESET |
> > > +					  DRIVER_ATOMIC,
> > > +
> > > +	.fops				= &logicvc_drm_fops,
> > > +	.name				= "logicvc-drm",
> > > +	.desc				= "Xylon LogiCVC DRM driver",
> > > +	.date				= "20200403",
> > > +	.major				= 1,
> > > +	.minor				= 0,
> > > +
> > > +	DRM_GEM_CMA_VMAP_DRIVER_OPS,
> > > +	.dumb_create			= logicvc_drm_gem_cma_dumb_create,
> > > +};
> > > +
> > > +static struct regmap_config logicvc_drm_regmap_config = {
> > > +	.reg_bits	= 32,
> > > +	.val_bits	= 32,
> > > +	.reg_stride	= 4,
> > > +	.name		= "logicvc-drm",
> > > +};
> > > +
> > > +static irqreturn_t logicvc_drm_irq_handler(int irq, void *data)
> > > +{
> > > +	struct logicvc_drm *logicvc = data;
> > > +	irqreturn_t ret = IRQ_NONE;
> > > +	u32 stat = 0;
> > > +
> > > +	/* Get pending interrupt sources. */
> > > +	regmap_read(logicvc->regmap, LOGICVC_INT_STAT_REG, &stat);
> > > +
> > > +	/* Clear all pending interrupt sources. */
> > > +	regmap_write(logicvc->regmap, LOGICVC_INT_STAT_REG, stat);
> > > +
> > > +	if (stat & LOGICVC_INT_STAT_V_SYNC) {
> > > +		logicvc_crtc_vblank_handler(logicvc);
> > > +		ret = IRQ_HANDLED;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct device_node *of_node = logicvc->drm->dev->of_node;
> > > +	struct logicvc_drm_config *config = &logicvc->config;
> > > +	struct device_node *layers_node;
> > > +	int ret;
> > > +
> > > +	logicvc_of_property_parse_bool(of_node, "xylon,dithering",
> > > +				       &config->dithering);
> > > +	logicvc_of_property_parse_bool(of_node, "xylon,background-layer",
> > > +				       &config->background_layer);
> > > +	logicvc_of_property_parse_bool(of_node, "xylon,layers-configurable",
> > > +				       &config->layers_configurable);
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,display-interface",
> > > +					    &config->display_interface);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,display-colorspace",
> > > +					    &config->display_colorspace);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,display-depth",
> > > +					    &config->display_depth);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,row-stride",
> > > +					    &config->row_stride);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	layers_node = of_get_child_by_name(of_node, "layers");
> > > +	if (!layers_node) {
> > > +		DRM_ERROR("Missing non-optional layers node\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	config->layers_count = of_get_child_count(layers_node);
> > > +	if (!config->layers_count) {
> > > +		DRM_ERROR("Missing a non-optional layers children node\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void logicvc_version_print(struct logicvc_drm *logicvc)
> > > +{
> > > +	u32 version;
> > > +
> > > +	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
> > > +
> > > +	DRM_INFO("LogiCVC version %d.%02d.%c\n",
> > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
> > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
> > > +		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
> > > +		 'a');
> > > +}
> > > +
> > > +static int logicvc_clocks_prepare(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct {
> > > +		struct clk **clk;
> > > +		char *name;
> > > +		bool optional;
> > > +	} clocks_map[] = {
> > > +		{
> > > +			.clk = &logicvc->vclk,
> > > +			.name = "vclk",
> > > +			.optional = false,
> > > +		},
> > > +		{
> > > +			.clk = &logicvc->vclk2,
> > > +			.name = "vclk2",
> > > +			.optional = true,
> > > +		},
> > > +		{
> > > +			.clk = &logicvc->lvdsclk,
> > > +			.name = "lvdsclk",
> > > +			.optional = true,
> > > +		},
> > > +		{
> > > +			.clk = &logicvc->lvdsclkn,
> > > +			.name = "lvdsclkn",
> > > +			.optional = true,
> > > +		},
> > > +	};
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(clocks_map); i++) {
> > > +		struct clk *clk;
> > > +
> > > +		clk = devm_clk_get(logicvc->drm->dev, clocks_map[i].name);
> > > +		if (IS_ERR(clk)) {
> > > +			if (PTR_ERR(clk) == -ENOENT && clocks_map[i].optional)
> > > +				continue;
> > > +
> > > +			DRM_ERROR("Missing non-optional clock %s\n",
> > > +				  clocks_map[i].name);
> > > +
> > > +			ret = PTR_ERR(clk);
> > > +			goto error;
> > > +		}
> > > +
> > > +		ret = clk_prepare_enable(clk);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to prepare and enable clock %s\n",
> > > +				  clocks_map[i].name);
> > > +			goto error;
> > > +		}
> > > +
> > > +		*clocks_map[i].clk = clk;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	for (i = 0; i < ARRAY_SIZE(clocks_map); i++) {
> > > +		if (!*clocks_map[i].clk)
> > > +			continue;
> > > +
> > > +		clk_disable_unprepare(*clocks_map[i].clk);
> > > +		*clocks_map[i].clk = NULL;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int logicvc_clocks_unprepare(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct clk **clocks[] = {
> > > +		&logicvc->vclk,
> > > +		&logicvc->vclk2,
> > > +		&logicvc->lvdsclk,
> > > +		&logicvc->lvdsclkn,
> > > +	};
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
> > > +		if (!*clocks[i])
> > > +			continue;
> > > +
> > > +		clk_disable_unprepare(*clocks[i]);
> > > +		*clocks[i] = NULL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int logicvc_drm_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device_node *of_node = pdev->dev.of_node;
> > > +	struct device_node *reserved_mem_node;
> > > +	struct reserved_mem *reserved_mem = NULL;
> > > +	const struct logicvc_drm_caps *caps;
> > > +	struct logicvc_drm *logicvc;
> > > +	struct drm_device *drm;
> > > +	struct regmap *regmap;
> > > +	struct resource res;
> > > +	void __iomem *base;
> > > +	int irq;
> > > +	int ret;
> > > +
> > > +	caps = of_device_get_match_data(&pdev->dev);
> > > +	if (!caps)
> > > +		return -EINVAL;
> > > +
> > > +	ret = of_reserved_mem_device_init(&pdev->dev);
> > > +	if (ret && ret != -ENODEV) {
> > > +		dev_err(&pdev->dev, "Failed to init memory region\n");
> > > +		goto error_early;
> > > +	}
> > > +
> > > +	reserved_mem_node = of_parse_phandle(of_node, "memory-region", 0);
> > > +	if (reserved_mem_node) {
> > > +		reserved_mem = of_reserved_mem_lookup(reserved_mem_node);
> > > +		of_node_put(reserved_mem_node);
> > > +	}
> > > +
> > > +	/* Get regmap from syscon first if available. */
> > > +	regmap = syscon_regmap_lookup_by_phandle(of_node, "xylon,syscon");
> > > +
> > > +	/* Then get regmap from parent if available. */
> > > +	if (IS_ERR(regmap) && of_node->parent)
> > > +		regmap = syscon_node_to_regmap(of_node->parent);
> > > +
> > > +	/* Register our own regmap otherwise. */
> > > +	if (IS_ERR(regmap)) {
> > > +		ret = of_address_to_resource(of_node, 0, &res);
> > > +		if (ret) {
> > > +			dev_err(&pdev->dev,
> > > +				"Failed to get resource from address\n");
> > > +			goto error_reserved_mem;
> > > +		}
> > > +
> > > +		base = devm_ioremap_resource(&pdev->dev, &res);
> > > +		if (IS_ERR(base)) {
> > > +			dev_err(&pdev->dev, "Failed to map I/O base\n");
> > > +			ret = PTR_ERR(base);
> > > +			goto error_reserved_mem;
> > > +		}
> > > +
> > > +		logicvc_drm_regmap_config.max_register = resource_size(&res) -
> > > +							 4;
> > > +
> > > +		regmap = devm_regmap_init_mmio(&pdev->dev, base,
> > > +					       &logicvc_drm_regmap_config);
> > > +		if (IS_ERR(regmap)) {
> > > +			dev_err(&pdev->dev,
> > > +				"Failed to create regmap for I/O\n");
> > > +			ret = PTR_ERR(regmap);
> > > +			goto error_reserved_mem;
> > > +		}
> > > +	}
> > > +
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0) {
> > > +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> > > +		ret = -ENODEV;
> > > +		goto error_reserved_mem;
> > > +	}
> > > +
> > > +	drm = drm_dev_alloc(&logicvc_drm_driver, &pdev->dev);
> > > +	if (IS_ERR(drm)) {
> > > +		ret = PTR_ERR(drm);
> > > +		goto error_reserved_mem;
> > > +	}
> > > +
> > > +	logicvc = devm_kzalloc(&pdev->dev, sizeof(*logicvc), GFP_KERNEL);
> > 
> > Uh that's a wrong pattern. Please use devm_drm_dev_init and kzalloc and
> > drmm_add_final_kfree. Or wait until I send out my latest patch series
> > which adds a devm_drm_dev_alloc.
> > 
> > > +	if (!logicvc) {
> > > +		ret = -ENOMEM;
> > > +		goto error_logicvc;
> > > +	}
> > > +
> > > +	logicvc->caps = caps;
> > > +	logicvc->drm = drm;
> > > +	drm->dev_private = logicvc;
> > 
> > Please don't set ->dev_private, instead subclass.
> > 
> > > +	platform_set_drvdata(pdev, logicvc);
> > > +
> > > +	logicvc->regmap = regmap;
> > > +	INIT_LIST_HEAD(&logicvc->layers_list);
> > > +
> > > +	if (reserved_mem)
> > > +		logicvc->reserved_mem_base = reserved_mem->base;
> > > +
> > > +	ret = logicvc_clocks_prepare(logicvc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to prepare clocks\n");
> > > +		goto error_logicvc;
> > > +	}
> > > +
> > > +	ret = devm_request_irq(drm->dev, irq, logicvc_drm_irq_handler, 0,
> > > +			       dev_name(drm->dev), logicvc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to request IRQ\n");
> > > +		goto error_clocks;
> > > +	}
> > > +
> > > +	logicvc_version_print(logicvc);
> > > +
> > > +	ret = logicvc_drm_config_parse(logicvc);
> > > +	if (ret && ret != -ENODEV) {
> > > +		drm_err(logicvc->drm, "Failed to parse config\n");
> > > +		goto error_clocks;
> > > +	}
> > > +
> > > +	drm_mode_config_init(drm);
> > > +
> > > +	ret = logicvc_layers_init(logicvc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize layers\n");
> > > +		goto error_mode_config;
> > > +	}
> > > +
> > > +	ret = logicvc_crtc_init(logicvc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize CRTC\n");
> > > +		goto error_mode_config;
> > > +	}
> > > +
> > > +	logicvc_layers_attach_crtc(logicvc);
> > > +
> > > +	ret = logicvc_interface_init(logicvc);
> > > +	if (ret) {
> > > +		if (ret != -EPROBE_DEFER)
> > > +			drm_err(logicvc->drm,
> > > +				"Failed to initialize interface\n");
> > > +
> > > +		goto error_mode_config;
> > > +	}
> > > +
> > > +	logicvc_interface_attach_crtc(logicvc);
> > > +
> > > +	ret = logicvc_mode_init(logicvc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize KMS\n");
> > > +		goto error_mode_config;
> > > +	}
> > > +
> > > +	ret = drm_dev_register(drm, 0);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to register DRM device\n");
> > > +		goto error_mode;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error_mode:
> > > +	logicvc_mode_fini(logicvc);
> > > +
> > > +error_mode_config:
> > > +	drm_mode_config_cleanup(drm);
> > > +
> > > +error_clocks:
> > > +	logicvc_clocks_unprepare(logicvc);
> > > +
> > > +error_logicvc:
> > > +	drm_dev_put(drm);
> > > +
> > > +error_reserved_mem:
> > > +	of_reserved_mem_device_release(&pdev->dev);
> > > +
> > > +error_early:
> > > +	return ret;
> > > +}
> > > +
> > > +static int logicvc_drm_remove(struct platform_device *pdev)
> > > +{
> > > +	struct logicvc_drm *logicvc = platform_get_drvdata(pdev);
> > > +
> > > +	drm_dev_unregister(logicvc->drm);
> > > +	drm_atomic_helper_shutdown(logicvc->drm);
> > > +
> > > +	logicvc_mode_fini(logicvc);
> > > +
> > > +	drm_mode_config_cleanup(logicvc->drm);
> > > +
> > > +	logicvc_clocks_unprepare(logicvc);
> > > +
> > > +	drm_dev_put(logicvc->drm);
> > > +
> > > +	of_reserved_mem_device_release(&pdev->dev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct logicvc_drm_caps logicvc_drm_caps_3 = {
> > > +	.layer_address = false,
> > > +};
> > > +
> > > +static const struct logicvc_drm_caps logicvc_drm_caps_4 = {
> > > +	.layer_address = true,
> > > +};
> > > +
> > > +static struct of_device_id logicvc_drm_of_table[] = {
> > > +	{
> > > +		.compatible = "xylon,logicvc-3.02.a-display",
> > > +		.data = &logicvc_drm_caps_3,
> > > +	},
> > > +	{
> > > +		.compatible = "xylon,logicvc-4.01.a-display",
> > > +		.data = &logicvc_drm_caps_4,
> > > +	},
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
> > > +
> > > +static struct platform_driver logicvc_drm_platform_driver = {
> > > +	.probe		= logicvc_drm_probe,
> > > +	.remove		= logicvc_drm_remove,
> > > +	.driver		= {
> > > +		.name		= "logicvc-drm",
> > > +		.of_match_table	= logicvc_drm_of_table,
> > > +	},
> > > +};
> > > +
> > > +module_platform_driver(logicvc_drm_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> > > +MODULE_DESCRIPTION("Xylon LogiCVC DRM driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.h b/drivers/gpu/drm/logicvc/logicvc_drm.h
> > > new file mode 100644
> > > index 000000000000..cc728d5a4aee
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.h
> > > @@ -0,0 +1,60 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_DRM_H_
> > > +#define _LOGICVC_DRM_H_
> > > +
> > > +#include <linux/regmap.h>
> > > +#include <linux/types.h>
> > > +#include <drm/drm_device.h>
> > > +
> > > +#define LOGICVC_DISPLAY_INTERFACE_RGB			0
> > > +#define LOGICVC_DISPLAY_INTERFACE_ITU656		1
> > > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS		2
> > > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA	3
> > > +#define LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS		4
> > > +#define LOGICVC_DISPLAY_INTERFACE_DVI			5
> > > +
> > > +#define LOGICVC_DISPLAY_COLORSPACE_RGB		0
> > > +#define LOGICVC_DISPLAY_COLORSPACE_YUV422	1
> > > +#define LOGICVC_DISPLAY_COLORSPACE_YUV444	2
> > > +
> > > +struct logicvc_crtc;
> > > +struct logicvc_interface;
> > > +
> > > +struct logicvc_drm_config {
> > > +	u32 display_interface;
> > > +	u32 display_colorspace;
> > > +	u32 display_depth;
> > > +	u32 row_stride;
> > > +	bool dithering;
> > > +	bool background_layer;
> > > +	bool layers_configurable;
> > > +	u32 layers_count;
> > > +};
> > > +
> > > +struct logicvc_drm_caps {
> > > +	bool layer_address;
> > > +};
> > > +
> > > +struct logicvc_drm {
> > > +	const struct logicvc_drm_caps *caps;
> > > +	struct logicvc_drm_config config;
> > > +	struct drm_device *drm;
> > > +	phys_addr_t reserved_mem_base;
> > > +	struct regmap *regmap;
> > > +
> > > +	struct clk *vclk;
> > > +	struct clk *vclk2;
> > > +	struct clk *lvdsclk;
> > > +	struct clk *lvdsclkn;
> > > +
> > > +	struct list_head layers_list;
> > > +	struct logicvc_crtc *crtc;
> > > +	struct logicvc_interface *interface;
> > > +};
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
> > > new file mode 100644
> > > index 000000000000..05f2149ed338
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
> > > @@ -0,0 +1,240 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_modeset_helper_vtables.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_panel.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +#include "logicvc_crtc.h"
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_interface.h"
> > > +#include "logicvc_regs.h"
> > > +
> > > +#define logicvc_interface_from_drm_encoder(c) \
> > > +	container_of(c, struct logicvc_interface, drm_encoder)
> > > +#define logicvc_interface_from_drm_connector(c) \
> > > +	container_of(c, struct logicvc_interface, drm_connector)
> > > +
> > > +static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
> > > +{
> > > +	struct logicvc_interface *interface =
> > > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > > +
> > > +	regmap_update_bits(interface->logicvc->regmap, LOGICVC_POWER_CTRL_REG,
> > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
> > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
> > > +
> > > +	if (interface->drm_panel) {
> > > +		drm_panel_prepare(interface->drm_panel);
> > > +
> > > +		/* Encoder enable is too early to enable the panel and a white
> > > +		 * screen will be seen if the panel gets enabled before the
> > > +		 * first page flip is done (and no other framebuffer
> > > +		 * configuration remains from the boot software). */
> > > +		interface->drm_panel_enabled = false;
> > > +	}
> > > +}
> > > +
> > > +static void logicvc_encoder_disable(struct drm_encoder *drm_encoder)
> > > +{
> > > +	struct logicvc_interface *interface =
> > > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > > +
> > > +	if (interface->drm_panel) {
> > > +		drm_panel_disable(interface->drm_panel);
> > > +		drm_panel_unprepare(interface->drm_panel);
> > > +	}
> > > +}
> > > +
> > > +static const struct drm_encoder_helper_funcs logicvc_encoder_helper_funcs = {
> > > +	.enable			= logicvc_encoder_enable,
> > > +	.disable		= logicvc_encoder_disable,
> > > +};
> > > +
> > > +static const struct drm_encoder_funcs logicvc_encoder_funcs = {
> > > +	.destroy		= drm_encoder_cleanup,
> > > +};
> > > +
> > > +static int logicvc_connector_get_modes(struct drm_connector *drm_connector)
> > > +{
> > > +	struct logicvc_interface *interface =
> > > +		logicvc_interface_from_drm_connector(drm_connector);
> > > +
> > > +	if (interface->drm_panel)
> > > +		return drm_panel_get_modes(interface->drm_panel, drm_connector);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct drm_connector_helper_funcs logicvc_connector_helper_funcs = {
> > > +	.get_modes		= logicvc_connector_get_modes,
> > > +};
> > 
> > Don't we have a panel connector wrapper that does this for you
> > automatically already? Including the other boilerplate below.
> > -Daniel
> > 
> > > +
> > > +static void logicvc_connector_destroy(struct drm_connector *drm_connector)
> > > +{
> > > +	struct logicvc_interface *interface =
> > > +		logicvc_interface_from_drm_connector(drm_connector);
> > > +
> > > +	if (interface->drm_panel)
> > > +		drm_panel_detach(interface->drm_panel);
> > > +
> > > +	drm_connector_cleanup(drm_connector);
> > > +}
> > > +
> > > +static const struct drm_connector_funcs logicvc_connector_funcs = {
> > > +	.reset			= drm_atomic_helper_connector_reset,
> > > +	.fill_modes		= drm_helper_probe_single_connector_modes,
> > > +	.destroy		= logicvc_connector_destroy,
> > > +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> > > +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> > > +};
> > > +
> > > +static int logicvc_interface_encoder_type(struct logicvc_drm *logicvc)
> > > +{
> > > +	switch (logicvc->config.display_interface) {
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> > > +		return DRM_MODE_ENCODER_LVDS;
> > > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > > +		return DRM_MODE_ENCODER_TMDS;
> > > +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> > > +		return DRM_MODE_ENCODER_DPI;
> > > +	default:
> > > +		return DRM_MODE_ENCODER_NONE;
> > > +	}
> > > +}
> > > +
> > > +static int logicvc_interface_connector_type(struct logicvc_drm *logicvc)
> > > +{
> > > +	switch (logicvc->config.display_interface) {
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS:
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS_CAMERA:
> > > +	case LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS:
> > > +		return DRM_MODE_CONNECTOR_LVDS;
> > > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > > +		return DRM_MODE_CONNECTOR_DVID;
> > > +	case LOGICVC_DISPLAY_INTERFACE_RGB:
> > > +		return DRM_MODE_CONNECTOR_DPI;
> > > +	default:
> > > +		return DRM_MODE_CONNECTOR_Unknown;
> > > +	}
> > > +}
> > > +
> > > +static bool logicvc_interface_native_connector(struct logicvc_drm *logicvc)
> > > +{
> > > +	switch (logicvc->config.display_interface) {
> > > +	case LOGICVC_DISPLAY_INTERFACE_DVI:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc)
> > > +{
> > > +	uint32_t possible_crtcs = drm_crtc_mask(&logicvc->crtc->drm_crtc);
> > > +
> > > +	logicvc->interface->drm_encoder.possible_crtcs = possible_crtcs;
> > > +}
> > > +
> > > +int logicvc_interface_init(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct logicvc_interface *interface;
> > > +	struct device_node *of_node = logicvc->drm->dev->of_node;
> > > +	int encoder_type = logicvc_interface_encoder_type(logicvc);
> > > +	int connector_type = logicvc_interface_connector_type(logicvc);
> > > +	bool native_connector = logicvc_interface_native_connector(logicvc);
> > > +	int ret;
> > > +
> > > +	interface = devm_kzalloc(logicvc->drm->dev, sizeof(*interface),
> > > +				 GFP_KERNEL);
> > > +	if (!interface) {
> > > +		ret = -ENOMEM;
> > > +		goto error_early;
> > > +	}
> > > +
> > > +	interface->logicvc = logicvc;
> > > +
> > > +	ret = drm_of_find_panel_or_bridge(of_node, 1, 0, &interface->drm_panel,
> > > +					  &interface->drm_bridge);
> > > +	if (ret == -EPROBE_DEFER)
> > > +		goto error_early;
> > > +
> > > +	ret = drm_encoder_init(logicvc->drm, &interface->drm_encoder,
> > > +			       &logicvc_encoder_funcs, encoder_type, NULL);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initalize encoder\n");
> > > +		goto error_early;
> > > +	}
> > > +
> > > +	drm_encoder_helper_add(&interface->drm_encoder,
> > > +			       &logicvc_encoder_helper_funcs);
> > > +
> > > +	if (native_connector || interface->drm_panel) {
> > > +		ret = drm_connector_init(logicvc->drm,
> > > +					 &interface->drm_connector,
> > > +					 &logicvc_connector_funcs,
> > > +					 connector_type);
> > > +		if (ret) {
> > > +			drm_err(logicvc->drm,
> > > +				"Failed to initalize connector\n");
> > > +			goto error_encoder;
> > > +		}
> > > +
> > > +		drm_connector_helper_add(&interface->drm_connector,
> > > +					 &logicvc_connector_helper_funcs);
> > > +
> > > +		ret = drm_connector_attach_encoder(&interface->drm_connector,
> > > +						   &interface->drm_encoder);
> > > +		if (ret) {
> > > +			drm_err(logicvc->drm,
> > > +				"Failed to attach connector to encoder\n");
> > > +			goto error_encoder;
> > > +		}
> > > +	}
> > > +
> > > +	if (interface->drm_panel) {
> > > +		ret = drm_panel_attach(interface->drm_panel,
> > > +				       &interface->drm_connector);
> > > +		if (ret) {
> > > +			drm_err(logicvc->drm,
> > > +				"Failed to attach panel to connector\n");
> > > +			goto error_encoder;
> > > +		}
> > > +	}
> > > +
> > > +	if (interface->drm_bridge) {
> > > +		ret = drm_bridge_attach(&interface->drm_encoder,
> > > +					interface->drm_bridge, NULL, 0);
> > > +		if (ret) {
> > > +			drm_err(logicvc->drm,
> > > +				"Failed to attach bridge to encoder\n");
> > > +			goto error_encoder;
> > > +		}
> > > +	}
> > > +
> > > +	logicvc->interface = interface;
> > > +
> > > +	return 0;
> > > +
> > > +error_encoder:
> > > +	drm_encoder_cleanup(&interface->drm_encoder);
> > > +
> > > +error_early:
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.h b/drivers/gpu/drm/logicvc/logicvc_interface.h
> > > new file mode 100644
> > > index 000000000000..d27abfff929f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_interface.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_INTERFACE_H_
> > > +#define _LOGICVC_INTERFACE_H_
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h>
> > > +#include <drm/drm_encoder.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +struct logicvc_drm;
> > > +
> > > +struct logicvc_interface {
> > > +	struct logicvc_drm *logicvc;
> > > +
> > > +	struct drm_encoder drm_encoder;
> > > +	struct drm_connector drm_connector;
> > > +
> > > +	struct drm_panel *drm_panel;
> > > +	struct drm_bridge *drm_bridge;
> > > +
> > > +	bool drm_panel_enabled;
> > > +};
> > > +
> > > +void logicvc_interface_attach_crtc(struct logicvc_drm *logicvc);
> > > +int logicvc_interface_init(struct logicvc_drm *logicvc);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
> > > new file mode 100644
> > > index 000000000000..07a22e736ae7
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> > > @@ -0,0 +1,603 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_plane.h>
> > > +#include <drm/drm_plane_helper.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "logicvc_crtc.h"
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_layer.h"
> > > +#include "logicvc_of.h"
> > > +#include "logicvc_regs.h"
> > > +
> > > +#define logicvc_layer(p) \
> > > +	container_of(p, struct logicvc_layer, drm_plane)
> > > +
> > > +static uint32_t logicvc_layer_formats_rgb16[] = {
> > > +	DRM_FORMAT_RGB565,
> > > +	DRM_FORMAT_BGR565,
> > > +	DRM_FORMAT_INVALID,
> > > +};
> > > +
> > > +static uint32_t logicvc_layer_formats_rgb24[] = {
> > > +	DRM_FORMAT_XRGB8888,
> > > +	DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_INVALID,
> > > +};
> > > +
> > > +/* What we call depth in this driver only counts color components, not alpha.
> > > + * This allows us to stay compatible with the LogiCVC bistream definitions. */
> > > +static uint32_t logicvc_layer_formats_rgb24_alpha[] = {
> > > +	DRM_FORMAT_ARGB8888,
> > > +	DRM_FORMAT_ABGR8888,
> > > +	DRM_FORMAT_INVALID,
> > > +};
> > > +
> > > +static struct logicvc_layer_formats logicvc_layer_formats[] = {
> > > +	{
> > > +		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
> > > +		.depth		= 16,
> > > +		.formats	= logicvc_layer_formats_rgb16,
> > > +	},
> > > +	{
> > > +		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
> > > +		.depth		= 24,
> > > +		.formats	= logicvc_layer_formats_rgb24,
> > > +	},
> > > +	{
> > > +		.colorspace	= LOGICVC_LAYER_COLORSPACE_RGB,
> > > +		.depth		= 24,
> > > +		.alpha		= true,
> > > +		.formats	= logicvc_layer_formats_rgb24_alpha,
> > > +	},
> > > +	{ }
> > > +};
> > > +
> > > +static bool logicvc_layer_format_inverted(uint32_t format)
> > > +{
> > > +	switch (format) {
> > > +	case DRM_FORMAT_BGR565:
> > > +	case DRM_FORMAT_BGR888:
> > > +	case DRM_FORMAT_XBGR8888:
> > > +	case DRM_FORMAT_ABGR8888:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
> > > +				      struct drm_plane_state *state)
> > > +{
> > > +	struct logicvc_layer *layer = logicvc_layer(drm_plane);
> > > +	struct logicvc_drm *logicvc = layer->logicvc;
> > > +	struct drm_crtc_state *crtc_state;
> > > +	int min_scale, max_scale;
> > > +	bool can_position;
> > > +	int ret;
> > > +
> > > +	if (!state->crtc)
> > > +		return 0;
> > > +
> > > +	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
> > > +							state->crtc);
> > > +	if (WARN_ON(!crtc_state))
> > > +		return -EINVAL;
> > > +
> > > +	if (state->crtc_x < 0 || state->crtc_y < 0) {
> > > +		drm_err(logicvc->drm,
> > > +			"Negative on-CRTC positions are not supported.\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (!logicvc->caps->layer_address) {
> > > +		ret = logicvc_layer_buffer_find_setup(layer, state, NULL);
> > > +		if (ret) {
> > > +			drm_err(logicvc->drm,
> > > +				"No viable setup for buffer found.\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	min_scale = DRM_PLANE_HELPER_NO_SCALING;
> > > +	max_scale = DRM_PLANE_HELPER_NO_SCALING;
> > > +
> > > +	can_position = (drm_plane->type == DRM_PLANE_TYPE_OVERLAY &&
> > > +			layer->index != (logicvc->config.layers_count - 1) &&
> > > +			logicvc->config.layers_configurable);
> > > +
> > > +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> > > +						  min_scale, max_scale,
> > > +						  can_position, true);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Invalid plane state\n\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
> > > +					struct drm_plane_state *old_state)
> > > +{
> > > +	struct logicvc_layer *layer = logicvc_layer(drm_plane);
> > > +	struct logicvc_drm *logicvc = layer->logicvc;
> > > +	struct drm_plane_state *state = drm_plane->state;
> > > +	struct drm_crtc *drm_crtc = &logicvc->crtc->drm_crtc;
> > > +	struct drm_display_mode *mode = &drm_crtc->state->adjusted_mode;
> > > +	struct drm_framebuffer *fb = state->fb;
> > > +	struct logicvc_layer_buffer_setup setup = {};
> > > +	u32 index = layer->index;
> > > +	u32 reg;
> > > +
> > > +	/* Layer dimensions */
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_WIDTH_REG(index),
> > > +		     state->crtc_w - 1);
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HEIGHT_REG(index),
> > > +		     state->crtc_h - 1);
> > > +
> > > +	if (logicvc->caps->layer_address) {
> > > +		phys_addr_t fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
> > > +
> > > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
> > > +			     fb_addr);
> > > +	} else {
> > > +		/* Rely on offsets to configure the address. */
> > > +
> > > +		logicvc_layer_buffer_find_setup(layer, state, &setup);
> > > +
> > > +		/* Layer memory offsets */
> > > +
> > > +		regmap_write(logicvc->regmap, LOGICVC_BUFFER_SEL_REG,
> > > +			     LOGICVC_BUFFER_SEL_VALUE(index, setup.buffer_sel));
> > > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_HOFFSET_REG(index),
> > > +			     setup.hoffset);
> > > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_VOFFSET_REG(index),
> > > +			     setup.voffset);
> > > +	}
> > > +
> > > +	/* Layer position */
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_HPOSITION_REG(index),
> > > +		     mode->hdisplay - 1 - state->crtc_x);
> > > +
> > > +	/* Vertical position must be set last to sync layer register changes. */
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_VPOSITION_REG(index),
> > > +		     mode->vdisplay - 1 - state->crtc_y);
> > > +
> > > +	/* Layer alpha */
> > > +
> > > +	if (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_LAYER) {
> > > +		u32 alpha_bits;
> > > +		u32 alpha_max;
> > > +		u32 alpha;
> > > +
> > > +		switch (layer->config.depth) {
> > > +		case 8:
> > > +			alpha_bits = 3;
> > > +			break;
> > > +		case 16:
> > > +			if (layer->config.colorspace == LOGICVC_LAYER_COLORSPACE_YUV)
> > > +				alpha_bits = 8;
> > > +			else
> > > +				alpha_bits = 6;
> > > +			break;
> > > +		default:
> > > +			alpha_bits = 8;
> > > +			break;
> > > +		}
> > > +
> > > +		alpha_max = BIT(alpha_bits) - 1;
> > > +		alpha = state->alpha * alpha_max / DRM_BLEND_ALPHA_OPAQUE;
> > > +
> > > +		DRM_DEBUG_DRIVER("Setting layer %d alpha to %d/%d\n", index,
> > > +				 alpha, alpha_max);
> > > +
> > > +		regmap_write(logicvc->regmap, LOGICVC_LAYER_ALPHA_REG(index),
> > > +			     alpha);
> > > +	}
> > > +
> > > +	/* Layer control */
> > > +
> > > +	reg = LOGICVC_LAYER_CTRL_ENABLE;
> > > +
> > > +	if (logicvc_layer_format_inverted(fb->format->format))
> > > +		reg |= LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT;
> > > +
> > > +	reg |= LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE;
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), reg);
> > > +}
> > > +
> > > +static void logicvc_plane_atomic_disable(struct drm_plane *drm_plane,
> > > +					 struct drm_plane_state *old_state)
> > > +{
> > > +	struct logicvc_layer *layer = logicvc_layer(drm_plane);
> > > +	struct logicvc_drm *logicvc = layer->logicvc;
> > > +	u32 index = layer->index;
> > > +
> > > +	regmap_write(logicvc->regmap, LOGICVC_LAYER_CTRL_REG(index), 0);
> > > +}
> > > +
> > > +static struct drm_plane_helper_funcs logicvc_plane_helper_funcs = {
> > > +	.atomic_check		= logicvc_plane_atomic_check,
> > > +	.atomic_update		= logicvc_plane_atomic_update,
> > > +	.atomic_disable		= logicvc_plane_atomic_disable,
> > > +};
> > > +
> > > +static const struct drm_plane_funcs logicvc_plane_funcs = {
> > > +	.update_plane		= drm_atomic_helper_update_plane,
> > > +	.disable_plane		= drm_atomic_helper_disable_plane,
> > > +	.destroy		= drm_plane_cleanup,
> > > +	.reset			= drm_atomic_helper_plane_reset,
> > > +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> > > +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> > > +};
> > > +
> > > +int logicvc_layer_buffer_find_setup(struct logicvc_layer *layer,
> > > +				    struct drm_plane_state *state,
> > > +				    struct logicvc_layer_buffer_setup *setup)
> > > +{
> > > +	struct logicvc_drm *logicvc = layer->logicvc;
> > > +	struct drm_framebuffer *fb = state->fb;
> > > +	/* All the supported formats have a single data plane. */
> > > +	u32 layer_bytespp = fb->format->cpp[0];
> > > +	u32 layer_stride = layer_bytespp * logicvc->config.row_stride;
> > > +	u32 base_offset = layer->config.base_offset * layer_stride;
> > > +	u32 buffer_offset = layer->config.buffer_offset * layer_stride;
> > > +	u8 buffer_sel = 0;
> > > +	u16 voffset = 0;
> > > +	u16 hoffset = 0;
> > > +	phys_addr_t fb_addr;
> > > +	u32 fb_offset;
> > > +	u32 gap;
> > > +
> > > +	if (!logicvc->reserved_mem_base) {
> > > +		drm_err(logicvc->drm,
> > > +			"No reserved memory base was registered!\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
> > > +	if (fb_addr < logicvc->reserved_mem_base) {
> > > +		drm_err(logicvc->drm,
> > > +			"Framebuffer memory below reserved memory base!\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	fb_offset = (u32) (fb_addr - logicvc->reserved_mem_base);
> > > +
> > > +	if (fb_offset < base_offset) {
> > > +		drm_err(logicvc->drm,
> > > +			"Framebuffer offset below layer base offset!\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	gap = fb_offset - base_offset;
> > > +
> > > +	/* Use the possible video buffers selection. */
> > > +	if (gap && buffer_offset) {
> > > +		buffer_sel = gap / buffer_offset;
> > > +		if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
> > > +			buffer_sel = LOGICVC_BUFFER_SEL_MAX;
> > > +
> > > +		gap -= buffer_sel * buffer_offset;
> > > +	}
> > > +
> > > +	/* Use the vertical offset. */
> > > +	if (gap && layer_stride && logicvc->config.layers_configurable) {
> > > +		voffset = gap / layer_stride;
> > > +		if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
> > > +			voffset = LOGICVC_LAYER_VOFFSET_MAX;
> > > +
> > > +		gap -= voffset * layer_stride;
> > > +	}
> > > +
> > > +	/* Use the horizontal offset. */
> > > +	if (gap && layer_bytespp && logicvc->config.layers_configurable) {
> > > +		hoffset = gap / layer_bytespp;
> > > +		if (hoffset > LOGICVC_DIMENSIONS_MAX)
> > > +			hoffset = LOGICVC_DIMENSIONS_MAX;
> > > +
> > > +		gap -= hoffset * layer_bytespp;
> > > +	}
> > > +
> > > +	if (gap) {
> > > +		drm_err(logicvc->drm,
> > > +			"Unable to find layer %d buffer setup for 0x%x byte gap\n",
> > > +			layer->index, fb_offset - base_offset);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	DRM_DEBUG_DRIVER("Found layer %d buffer setup for 0x%x byte gap:\n",
> > > +			 layer->index, fb_offset - base_offset);
> > > +
> > > +	DRM_DEBUG_DRIVER("- buffer_sel = 0x%x chunks of 0x%x bytes\n",
> > > +			 buffer_sel, buffer_offset);
> > > +	DRM_DEBUG_DRIVER("- voffset = 0x%x chunks of 0x%x bytes\n", voffset,
> > > +			 layer_stride);
> > > +	DRM_DEBUG_DRIVER("- hoffset = 0x%x chunks of 0x%x bytes\n", hoffset,
> > > +			 layer_bytespp);
> > > +
> > > +	if (setup) {
> > > +		setup->buffer_sel = buffer_sel;
> > > +		setup->voffset = voffset;
> > > +		setup->hoffset = hoffset;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct logicvc_layer_formats *logicvc_layer_formats_lookup(struct logicvc_layer *layer)
> > > +{
> > > +	bool alpha;
> > > +	unsigned int i = 0;
> > > +
> > > +	alpha = (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_PIXEL);
> > > +
> > > +	while (logicvc_layer_formats[i].formats) {
> > > +		if (logicvc_layer_formats[i].colorspace == layer->config.colorspace &&
> > > +		    logicvc_layer_formats[i].depth == layer->config.depth &&
> > > +		    logicvc_layer_formats[i].alpha == alpha)
> > > +			return &logicvc_layer_formats[i];
> > > +
> > > +		i++;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +static unsigned int logicvc_layer_formats_count(struct logicvc_layer_formats *formats)
> > > +{
> > > +	unsigned int count = 0;
> > > +
> > > +	while (formats->formats[count] != DRM_FORMAT_INVALID)
> > > +		count++;
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static int logicvc_layer_config_parse(struct logicvc_drm *logicvc,
> > > +				      struct logicvc_layer *layer)
> > > +{
> > > +	struct device_node *of_node = layer->of_node;
> > > +	struct logicvc_layer_config *config = &layer->config;
> > > +	int ret;
> > > +
> > > +	logicvc_of_property_parse_bool(of_node, "xylon,layer-primary",
> > > +				       &config->primary);
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,layer-colorspace",
> > > +					    &config->colorspace);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,layer-depth",
> > > +					    &config->depth);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,layer-alpha-mode",
> > > +					    &config->alpha_mode);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Memory offset is only relevant without layer address configuration. */
> > > +	if (logicvc->caps->layer_address)
> > > +		return 0;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,layer-base-offset",
> > > +					    &config->base_offset);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = logicvc_of_property_parse_u32(of_node, "xylon,layer-buffer-offset",
> > > +					    &config->buffer_offset);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *logicvc,
> > > +						   u32 index)
> > > +{
> > > +	struct logicvc_layer *layer;
> > > +
> > > +	list_for_each_entry(layer, &logicvc->layers_list, list)
> > > +		if (layer->index == index)
> > > +			return layer;
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *logicvc,
> > > +						  enum drm_plane_type type)
> > > +{
> > > +	struct logicvc_layer *layer;
> > > +
> > > +	list_for_each_entry(layer, &logicvc->layers_list, list)
> > > +		if (layer->drm_plane.type == type)
> > > +			return layer;
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logicvc)
> > > +{
> > > +	return logicvc_layer_get_from_type(logicvc, DRM_PLANE_TYPE_PRIMARY);
> > > +}
> > > +
> > > +static int logicvc_layer_init(struct logicvc_drm *logicvc,
> > > +			      struct device_node *of_node, u32 index)
> > > +{
> > > +	struct logicvc_layer *layer = NULL;
> > > +	struct logicvc_layer_formats *formats;
> > > +	unsigned int formats_count;
> > > +	enum drm_plane_type type;
> > > +	unsigned int zpos;
> > > +	int ret;
> > > +
> > > +	layer = devm_kzalloc(logicvc->drm->dev, sizeof(*layer), GFP_KERNEL);
> > > +	if (!layer) {
> > > +		ret = -ENOMEM;
> > > +		goto error;
> > > +	}
> > > +
> > > +	layer->logicvc = logicvc;
> > > +	layer->of_node = of_node;
> > > +	layer->index = index;
> > > +
> > > +	ret = logicvc_layer_config_parse(logicvc, layer);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm,
> > > +			"Failed to parse config for layer #%d\n", index);
> > > +		goto error;
> > > +	}
> > > +
> > > +	formats = logicvc_layer_formats_lookup(layer);
> > > +	if (!formats) {
> > > +		drm_err(logicvc->drm,
> > > +			"Failed to lookup formats for layer #%d\n", index);
> > > +		goto error;
> > > +	}
> > > +
> > > +	formats_count = logicvc_layer_formats_count(formats);
> > > +
> > > +	/* The final layer can be configured as a background layer. */
> > > +	if (logicvc->config.background_layer &&
> > > +	    index == (logicvc->config.layers_count - 1)) {
> > > +		/* A zero value for black is only valid for RGB, not for YUV,
> > > +		 * so this will need to take the format in account for YUV. */
> > > +		u32 background = 0;
> > > +
> > > +		DRM_DEBUG_DRIVER("Using layer #%d as background layer\n",
> > > +				 index);
> > > +
> > > +		regmap_write(logicvc->regmap, LOGICVC_BACKGROUND_COLOR_REG,
> > > +			     background);
> > > +
> > > +		devm_kfree(logicvc->drm->dev, layer);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (layer->config.primary)
> > > +		type = DRM_PLANE_TYPE_PRIMARY;
> > > +	else
> > > +		type = DRM_PLANE_TYPE_OVERLAY;
> > > +
> > > +	ret = drm_universal_plane_init(logicvc->drm, &layer->drm_plane, 0,
> > > +				       &logicvc_plane_funcs, formats->formats,
> > > +				       formats_count, NULL, type, NULL);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize layer plane\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_plane_helper_add(&layer->drm_plane, &logicvc_plane_helper_funcs);
> > > +
> > > +	zpos = logicvc->config.layers_count - index - 1;
> > > +	DRM_DEBUG_DRIVER("Giving layer #%d zpos %d\n", index, zpos);
> > > +
> > > +	if (layer->config.alpha_mode == LOGICVC_LAYER_ALPHA_LAYER)
> > > +		drm_plane_create_alpha_property(&layer->drm_plane);
> > > +
> > > +	drm_plane_create_zpos_immutable_property(&layer->drm_plane, zpos);
> > > +
> > > +	DRM_DEBUG_DRIVER("Registering layer #%d\n", index);
> > > +
> > > +	layer->formats = formats;
> > > +
> > > +	list_add_tail(&layer->list, &logicvc->layers_list);
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	if (layer)
> > > +		devm_kfree(logicvc->drm->dev, layer);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void logicvc_layer_fini(struct logicvc_drm *logicvc,
> > > +			       struct logicvc_layer *layer)
> > > +{
> > > +	list_del(&layer->list);
> > > +	devm_kfree(logicvc->drm->dev, layer);
> > > +}
> > > +
> > > +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc)
> > > +{
> > > +	uint32_t possible_crtcs = drm_crtc_mask(&logicvc->crtc->drm_crtc);
> > > +	struct logicvc_layer *layer;
> > > +
> > > +	list_for_each_entry(layer, &logicvc->layers_list, list) {
> > > +		if (layer->drm_plane.type != DRM_PLANE_TYPE_OVERLAY)
> > > +			continue;
> > > +
> > > +		layer->drm_plane.possible_crtcs = possible_crtcs;
> > > +	}
> > > +}
> > > +
> > > +int logicvc_layers_init(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct device_node *of_node = logicvc->drm->dev->of_node;
> > > +	struct device_node *layer_node = NULL;
> > > +	struct device_node *layers_node;
> > > +	struct logicvc_layer *layer;
> > > +	struct logicvc_layer *next;
> > > +	int ret = 0;
> > > +
> > > +	layers_node = of_get_child_by_name(of_node, "layers");
> > > +	if (!layers_node) {
> > > +		DRM_ERROR("No layers node found in the description\n");
> > > +		ret = -ENODEV;
> > > +		goto error;
> > > +	}
> > > +
> > > +	for_each_child_of_node(layers_node, layer_node) {
> > > +		u32 index = 0;
> > > +
> > > +		if (!logicvc_of_node_is_layer(layer_node))
> > > +			continue;
> > > +
> > > +		ret = of_property_read_u32(layer_node, "reg", &index);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		layer = logicvc_layer_get_from_index(logicvc, index);
> > > +		if (layer) {
> > > +			DRM_ERROR("Duplicated entry for layer #%d\n", index);
> > > +			continue;
> > > +		}
> > > +
> > > +		ret = logicvc_layer_init(logicvc, layer_node, index);
> > > +		if (ret)
> > > +			goto error;
> > > +
> > > +		of_node_put(layer_node);
> > > +	}
> > > +
> > > +	of_node_put(layers_node);
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	list_for_each_entry_safe(layer, next, &logicvc->layers_list, list)
> > > +		logicvc_layer_fini(logicvc, layer);
> > > +
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.h b/drivers/gpu/drm/logicvc/logicvc_layer.h
> > > new file mode 100644
> > > index 000000000000..71b3f177b093
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_layer.h
> > > @@ -0,0 +1,65 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_LAYER_H_
> > > +#define _LOGICVC_LAYER_H_
> > > +
> > > +#include <linux/of.h>
> > > +#include <linux/types.h>
> > > +#include <drm/drm_plane.h>
> > > +
> > > +#define LOGICVC_LAYER_COLORSPACE_RGB		0
> > > +#define LOGICVC_LAYER_COLORSPACE_YUV		1
> > > +
> > > +#define LOGICVC_LAYER_ALPHA_LAYER		0
> > > +#define LOGICVC_LAYER_ALPHA_PIXEL		1
> > > +
> > > +struct logicvc_layer_buffer_setup {
> > > +	u8 buffer_sel;
> > > +	u16 voffset;
> > > +	u16 hoffset;
> > > +};
> > > +
> > > +struct logicvc_layer_config {
> > > +	u32 colorspace;
> > > +	u32 depth;
> > > +	u32 alpha_mode;
> > > +	u32 base_offset;
> > > +	u32 buffer_offset;
> > > +	bool primary;
> > > +};
> > > +
> > > +struct logicvc_layer_formats {
> > > +	u32 colorspace;
> > > +	u32 depth;
> > > +	bool alpha;
> > > +	uint32_t *formats;
> > > +};
> > > +
> > > +struct logicvc_layer {
> > > +	struct logicvc_drm *logicvc;
> > > +
> > > +	struct logicvc_layer_config config;
> > > +	struct logicvc_layer_formats *formats;
> > > +	struct device_node *of_node;
> > > +
> > > +	struct drm_plane drm_plane;
> > > +	struct list_head list;
> > > +	u32 index;
> > > +};
> > > +
> > > +int logicvc_layer_buffer_find_setup(struct logicvc_layer *layer,
> > > +				    struct drm_plane_state *state,
> > > +				    struct logicvc_layer_buffer_setup *setup);
> > > +struct logicvc_layer *logicvc_layer_get_from_index(struct logicvc_drm *logicvc,
> > > +						   u32 index);
> > > +struct logicvc_layer *logicvc_layer_get_from_type(struct logicvc_drm *logicvc,
> > > +						  enum drm_plane_type type);
> > > +struct logicvc_layer *logicvc_layer_get_primary(struct logicvc_drm *logicvc);
> > > +void logicvc_layers_attach_crtc(struct logicvc_drm *logicvc);
> > > +int logicvc_layers_init(struct logicvc_drm *logicvc);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
> > > new file mode 100644
> > > index 000000000000..a97ca36fdae7
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
> > > @@ -0,0 +1,104 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_mode_config.h>
> > > +#include <drm/drm_panel.h>
> > > +#include <drm/drm_print.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_interface.h"
> > > +#include "logicvc_layer.h"
> > > +#include "logicvc_mode.h"
> > > +
> > > +static void logicvc_mode_atomic_commit_tail(struct drm_atomic_state *old_state)
> > > +{
> > > +	struct drm_device *drm = old_state->dev;
> > > +	struct logicvc_drm *logicvc = drm->dev_private;
> > > +	struct logicvc_interface *interface = logicvc->interface;
> > > +
> > > +	drm_atomic_helper_commit_tail(old_state);
> > > +
> > > +	/* Enable the panel after the first commit, which concerns our panel
> > > +	 * since we only support a single interface. */
> > > +	if (interface->drm_panel && !interface->drm_panel_enabled) {
> > > +		drm_panel_enable(interface->drm_panel);
> > > +		interface->drm_panel_enabled = true;
> > > +	}
> > > +}
> > > +
> > > +static const struct drm_mode_config_helper_funcs logicvc_mode_config_helper_funcs = {
> > > +	.atomic_commit_tail	= logicvc_mode_atomic_commit_tail,
> > > +};
> > > +
> > > +static const struct drm_mode_config_funcs logicvc_mode_config_funcs = {
> > > +	.fb_create		= drm_gem_fb_create,
> > > +	.output_poll_changed	= drm_fb_helper_output_poll_changed,
> > > +	.atomic_check		= drm_atomic_helper_check,
> > > +	.atomic_commit		= drm_atomic_helper_commit,
> > > +};
> > > +
> > > +int logicvc_mode_init(struct logicvc_drm *logicvc)
> > > +{
> > > +	struct drm_mode_config *mode_config = &logicvc->drm->mode_config;
> > > +	struct logicvc_layer *layer_primary;
> > > +	uint32_t preferred_depth;
> > > +	int ret;
> > > +
> > > +	ret = drm_vblank_init(logicvc->drm, logicvc->drm->mode_config.num_crtc);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize vblank\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	layer_primary = logicvc_layer_get_primary(logicvc);
> > > +	if (!layer_primary) {
> > > +		drm_err(logicvc->drm, "Failed to get primary layer\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	preferred_depth = layer_primary->formats->depth;
> > > +
> > > +	/* DRM counts alpha in depth, our driver doesn't. */
> > > +	if (layer_primary->formats->alpha)
> > > +		preferred_depth += 8;
> > > +
> > > +	mode_config->min_width = 64;
> > > +	mode_config->max_width = 2048;
> > > +	mode_config->min_height = 1;
> > > +	mode_config->max_height = 2048;
> > > +	mode_config->preferred_depth = preferred_depth;
> > > +	mode_config->funcs = &logicvc_mode_config_funcs;
> > > +	mode_config->helper_private = &logicvc_mode_config_helper_funcs;
> > > +
> > > +	drm_mode_config_reset(logicvc->drm);
> > > +
> > > +	ret = drm_fbdev_generic_setup(logicvc->drm, preferred_depth);
> > > +	if (ret) {
> > > +		drm_err(logicvc->drm, "Failed to initialize fbdev\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_kms_helper_poll_init(logicvc->drm);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void logicvc_mode_fini(struct logicvc_drm *logicvc)
> > > +{
> > > +	drm_kms_helper_poll_fini(logicvc->drm);
> > > +}
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.h b/drivers/gpu/drm/logicvc/logicvc_mode.h
> > > new file mode 100644
> > > index 000000000000..690def1619a6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_mode.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_MODE_H_
> > > +#define _LOGICVC_MODE_H_
> > > +
> > > +struct logicvc_drm;
> > > +
> > > +int logicvc_mode_init(struct logicvc_drm *logicvc);
> > > +void logicvc_mode_fini(struct logicvc_drm *logicvc);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_of.c b/drivers/gpu/drm/logicvc/logicvc_of.c
> > > new file mode 100644
> > > index 000000000000..19b7bc5ea572
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_of.c
> > > @@ -0,0 +1,205 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#include <drm/drm_print.h>
> > > +
> > > +#include "logicvc_drm.h"
> > > +#include "logicvc_layer.h"
> > > +#include "logicvc_of.h"
> > > +
> > > +static struct logicvc_of_property_sv logicvc_of_display_interface_sv[] = {
> > > +	{ "lvds-4bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS },
> > > +	{ "lvds-3bits",	LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS },
> > > +	{ },
> > > +};
> > > +
> > > +static struct logicvc_of_property_sv logicvc_of_display_colorspace_sv[] = {
> > > +	{ "rgb",	LOGICVC_DISPLAY_COLORSPACE_RGB },
> > > +	{ "yuv422",	LOGICVC_DISPLAY_COLORSPACE_YUV422 },
> > > +	{ "yuv444",	LOGICVC_DISPLAY_COLORSPACE_YUV444 },
> > > +	{ },
> > > +};
> > > +
> > > +static struct logicvc_of_property_sv logicvc_of_layer_colorspace_sv[] = {
> > > +	{ "rgb",	LOGICVC_LAYER_COLORSPACE_RGB },
> > > +	{ "yuv",	LOGICVC_LAYER_COLORSPACE_YUV },
> > > +	{ },
> > > +};
> > > +
> > > +static struct logicvc_of_property_sv logicvc_of_layer_alpha_mode_sv[] = {
> > > +	{ "layer",	LOGICVC_LAYER_ALPHA_LAYER },
> > > +	{ "pixel",	LOGICVC_LAYER_ALPHA_PIXEL },
> > > +	{ },
> > > +};
> > > +
> > > +static struct logicvc_of_property logicvc_of_properties[] = {
> > > +	{
> > > +		.name		= "xylon,display-interface",
> > > +		.sv		= logicvc_of_display_interface_sv,
> > > +		.range		= {
> > > +			LOGICVC_DISPLAY_INTERFACE_LVDS_4BITS,
> > > +			LOGICVC_DISPLAY_INTERFACE_LVDS_3BITS,
> > > +		},
> > > +	},
> > > +	{
> > > +		.name		= "xylon,display-colorspace",
> > > +		.sv		= logicvc_of_display_colorspace_sv,
> > > +		.range		= {
> > > +			LOGICVC_DISPLAY_COLORSPACE_RGB,
> > > +			LOGICVC_DISPLAY_COLORSPACE_YUV444,
> > > +		},
> > > +	},
> > > +	{
> > > +		.name		= "xylon,display-depth",
> > > +		.range		= { 8, 24 },
> > > +	},
> > > +	{
> > > +		.name		= "xylon,row-stride",
> > > +	},
> > > +	{
> > > +		.name		= "xylon,dithering",
> > > +		.optional	= true,
> > > +	},
> > > +	{
> > > +		.name		= "xylon,background-layer",
> > > +		.optional	= true,
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layers-configurable",
> > > +		.optional	= true,
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layers-count",
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-depth",
> > > +		.range		= { 8, 24 },
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-colorspace",
> > > +		.sv		= logicvc_of_layer_colorspace_sv,
> > > +		.range		= {
> > > +			LOGICVC_LAYER_COLORSPACE_RGB,
> > > +			LOGICVC_LAYER_COLORSPACE_RGB,
> > > +		},
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-alpha-mode",
> > > +		.sv		= logicvc_of_layer_alpha_mode_sv,
> > > +		.range		= {
> > > +			LOGICVC_LAYER_ALPHA_LAYER,
> > > +			LOGICVC_LAYER_ALPHA_PIXEL,
> > > +		},
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-base-offset",
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-buffer-offset",
> > > +	},
> > > +	{
> > > +		.name		= "xylon,layer-primary",
> > > +		.optional	= true,
> > > +	},
> > > +	{ },
> > > +};
> > > +
> > > +static int logicvc_of_property_sv_value(struct logicvc_of_property_sv *sv,
> > > +					const char *string, u32 *value)
> > > +{
> > > +	unsigned int i = 0;
> > > +
> > > +	while (sv[i].string) {
> > > +		if (!strcmp(sv[i].string, string)) {
> > > +			*value = sv[i].value;
> > > +			return 0;
> > > +		}
> > > +
> > > +		i++;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static struct logicvc_of_property *logicvc_of_property_lookup(const char *name)
> > > +{
> > > +	unsigned int i = 0;
> > > +
> > > +	while (logicvc_of_properties[i].name) {
> > > +		if (!strcmp(logicvc_of_properties[i].name, name))
> > > +			return &logicvc_of_properties[i];
> > > +
> > > +		i++;
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +int logicvc_of_property_parse_u32(struct device_node *of_node,
> > > +				  const char *name, u32 *target)
> > > +{
> > > +	struct logicvc_of_property *property;
> > > +	const char *string;
> > > +	u32 value;
> > > +	int ret;
> > > +
> > > +	property = logicvc_of_property_lookup(name);
> > > +	if (!property)
> > > +		return -EINVAL;
> > > +
> > > +	if (!property->optional && !of_property_read_bool(of_node, name)) {
> > > +		DRM_ERROR("Missing non-optional OF property %s\n", name);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	if (property->sv) {
> > > +		ret = of_property_read_string(of_node, name, &string);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to read OF property %s\n", name);
> > > +			return ret;
> > > +		}
> > > +
> > > +		ret = logicvc_of_property_sv_value(property->sv, string,
> > > +						   &value);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to match OF string %s\n", name);
> > > +			return ret;
> > > +		}
> > > +	} else {
> > > +		ret = of_property_read_u32(of_node, name, &value);
> > > +		if (ret) {
> > > +			DRM_ERROR("Failed to read OF property %s\n", name);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	if (property->range[0] || property->range[1])
> > > +		if (value < property->range[0] || value > property->range[1])
> > > +			return -ERANGE;
> > > +
> > > +	*target = value;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +void logicvc_of_property_parse_bool(struct device_node *of_node,
> > > +				    const char *name, bool *target)
> > > +{
> > > +	struct logicvc_of_property *property;
> > > +
> > > +	property = logicvc_of_property_lookup(name);
> > > +	if (!property) {
> > > +		*target = false;
> > > +		return;
> > > +	}
> > > +
> > > +	*target = of_property_read_bool(of_node, name);
> > > +}
> > > +
> > > +bool logicvc_of_node_is_layer(struct device_node *of_node)
> > > +{
> > > +	return !of_node_cmp(of_node->name, "layer");
> > > +}
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_of.h b/drivers/gpu/drm/logicvc/logicvc_of.h
> > > new file mode 100644
> > > index 000000000000..5c6f3f33503a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_of.h
> > > @@ -0,0 +1,28 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_OF_H_
> > > +#define _LOGICVC_OF_H_
> > > +
> > > +struct logicvc_of_property_sv {
> > > +	const char *string;
> > > +	u32 value;
> > > +};
> > > +
> > > +struct logicvc_of_property {
> > > +	char *name;
> > > +	bool optional;
> > > +	struct logicvc_of_property_sv *sv;
> > > +	u32 range[2];
> > > +};
> > > +
> > > +int logicvc_of_property_parse_u32(struct device_node *of_node,
> > > +				  const char *name, u32 *target);
> > > +void logicvc_of_property_parse_bool(struct device_node *of_node,
> > > +				    const char *name, bool *target);
> > > +bool logicvc_of_node_is_layer(struct device_node *of_node);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/logicvc/logicvc_regs.h b/drivers/gpu/drm/logicvc/logicvc_regs.h
> > > new file mode 100644
> > > index 000000000000..d0be5fe84856
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/logicvc/logicvc_regs.h
> > > @@ -0,0 +1,88 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2019 Bootlin
> > > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > + *
> > > + * Copyright (C) 2014 Xylon d.o.o.
> > > + * Author: Davor Joja <davor.joja@logicbricks.com>
> > > + */
> > > +
> > > +#ifndef _LOGICVC_REGS_H_
> > > +#define _LOGICVC_REGS_H_
> > > +
> > > +#define LOGICVC_FIELD_GET(field, value) \
> > > +	(((value) & field##_MASK) >> field##_SHIFT)
> > > +#define LOGICVC_FIELD_SET(field, value) \
> > > +	(((value) << field##_SHIFT) & field##_MASK)
> > > +
> > > +#define LOGICVC_DIMENSIONS_MAX		(BIT(16) - 1)
> > > +
> > > +#define LOGICVC_HSYNC_FRONT_PORCH_REG	0x00
> > > +#define LOGICVC_HSYNC_REG		0x08
> > > +#define LOGICVC_HSYNC_BACK_PORCH_REG	0x10
> > > +#define LOGICVC_HRES_REG		0x18
> > > +#define LOGICVC_VSYNC_FRONT_PORCH_REG	0x20
> > > +#define LOGICVC_VSYNC_REG		0x28
> > > +#define LOGICVC_VSYNC_BACK_PORCH_REG	0x30
> > > +#define LOGICVC_VRES_REG		0x38
> > > +
> > > +#define LOGICVC_CTRL_REG		0x40
> > > +#define LOGICVC_CTRL_CLOCK_INVERT	BIT(8)
> > > +#define LOGICVC_CTRL_PIXEL_INVERT	BIT(7)
> > > +#define LOGICVC_CTRL_DE_INVERT		BIT(5)
> > > +#define LOGICVC_CTRL_DE_ENABLE		BIT(4)
> > > +#define LOGICVC_CTRL_VSYNC_INVERT	BIT(3)
> > > +#define LOGICVC_CTRL_VSYNC_ENABLE	BIT(2)
> > > +#define LOGICVC_CTRL_HSYNC_INVERT	BIT(1)
> > > +#define LOGICVC_CTRL_HSYNC_ENABLE	BIT(0)
> > > +
> > > +#define LOGICVC_DTYPE_REG		0x48
> > > +#define LOGICVC_BACKGROUND_COLOR_REG	0x50
> > > +
> > > +#define LOGICVC_BUFFER_SEL_REG		0x58
> > > +#define LOGICVC_BUFFER_SEL_VALUE(i, v) \
> > > +	(BIT(10 + (i)) | ((v) << (2 * (i))))
> > > +#define LOGICVC_BUFFER_SEL_MAX		2
> > > +
> > > +#define LOGICVC_DOUBLE_CLUT_REG		0x60
> > > +
> > > +#define LOGICVC_INT_STAT_REG		0x68
> > > +#define LOGICVC_INT_STAT_V_SYNC		BIT(5)
> > > +
> > > +#define LOGICVC_INT_MASK_REG		0x70
> > > +#define LOGICVC_INT_MASK_V_SYNC		BIT(5)
> > > +
> > > +#define LOGICVC_POWER_CTRL_REG		0x78
> > > +#define LOGICVC_POWER_CTRL_BACKLIGHT_ENABLE	BIT(0)
> > > +#define LOGICVC_POWER_CTRL_VDD_ENABLE		BIT(1)
> > > +#define LOGICVC_POWER_CTRL_VEE_ENABLE		BIT(2)
> > > +#define LOGICVC_POWER_CTRL_VIDEO_ENABLE		BIT(3)
> > > +
> > > +#define LOGICVC_IP_VERSION_REG		0xf8
> > > +#define LOGICVC_IP_VERSION_MAJOR_MASK	GENMASK(16, 11)
> > > +#define LOGICVC_IP_VERSION_MAJOR_SHIFT	11
> > > +#define LOGICVC_IP_VERSION_MINOR_MASK	GENMASK(10, 5)
> > > +#define LOGICVC_IP_VERSION_MINOR_SHIFT	5
> > > +#define LOGICVC_IP_VERSION_LEVEL_MASK	GENMASK(4, 0)
> > > +#define LOGICVC_IP_VERSION_LEVEL_SHIFT	0
> > > +
> > > +#define LOGICVC_LAYER_ADDRESS_REG(i)	(0x100 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_HOFFSET_REG(i)	(0x100 + (i) * 0x80)
> > > +
> > > +#define LOGICVC_LAYER_VOFFSET_REG(i)	(0x108 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_VOFFSET_MAX	4095
> > > +
> > > +#define LOGICVC_LAYER_HPOSITION_REG(i)	(0x110 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_VPOSITION_REG(i)	(0x118 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_WIDTH_REG(i)	(0x120 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_HEIGHT_REG(i)	(0x128 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_ALPHA_REG(i)	(0x130 + (i) * 0x80)
> > > +
> > > +#define LOGICVC_LAYER_CTRL_REG(i)	(0x138 + (i) * 0x80)
> > > +#define LOGICVC_LAYER_CTRL_ENABLE	BIT(0)
> > > +#define LOGICVC_LAYER_CTRL_COLOR_KEY_DISABLE	BIT(1)
> > > +#define LOGICVC_LAYER_CTRL_PIXEL_FORMAT_INVERT	BIT(4)
> > > +
> > > +#define LOGICVC_LAYER_COLOR_KEY_REG(i)	(0x140 + (i) * 0x80)
> > > +
> > > +#endif
> > > -- 
> > > 2.26.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
