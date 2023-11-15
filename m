Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBDF7EC3E8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115610E043;
	Wed, 15 Nov 2023 13:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B510E043
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:40:11 +0000 (UTC)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it
 [93.61.96.190])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 849FF289;
 Wed, 15 Nov 2023 14:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1700055583;
 bh=NxXjmOPJMciSlIIlULpGV0qPhehGhc+iYj2Gbd7TbOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vuh4OSudDnbriNx1OysVfOFPw2iz5kB7EC7JQkskL622Peu9KQTJkRDW7S7L/+vc/
 tDP+HLhe3qZNzP6BzmExtVN9lrGCOC0By9oqdsfXEa7DnKQQLBUGop+3k1DSxQ4OIK
 pnHVb/90q/edeJF0J9UeT0gEaq8uv8nMCg4n9NmA=
Date: Wed, 15 Nov 2023 14:40:06 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v12 3/4] drm: renesas: Add RZ/G2L DU Support
Message-ID: <crz6tpijabfqkzetkg6ui345oay2vbib6y7fehiwvhh2cllbvy@6knnilxzkuqb>
References: <20231102150744.28736-1-biju.das.jz@bp.renesas.com>
 <20231102150744.28736-4-biju.das.jz@bp.renesas.com>
 <72edcrxqbhq3ykcdocipx7tf7pd6dporvi7hh6mor4inxchuho@p5j7s4zczmux>
 <TYVPR01MB112798CF5AF250F06BAB194EB86B1A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYVPR01MB112798CF5AF250F06BAB194EB86B1A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju

On Wed, Nov 15, 2023 at 12:36:55PM +0000, Biju Das wrote:
> Hi Jacopo Mondi,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH v12 3/4] drm: renesas: Add RZ/G2L DU Support
> >
> > Hi Biju
> >
> >   the series does not apply on v6.3. What is the base for the series ?
> >
> > On Thu, Nov 02, 2023 at 03:07:43PM +0000, Biju Das wrote:
> > > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > > Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > > along with 2 RPFs to support the blending of two picture layers and
> > > raster operations (ROPs).
> > >
> > > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > > alike SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Ref:
> > >
> > > v11->v12:
> > > * Replaced rzg2l_du_write() with writel().
> > > v10->v11:
> > > * Replaced CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1 for building
> > >   rzg2l_du_vsp driver.
> > > * Dropped "rzg2l_du_regs.h" instead the relevant definitions defined in
> > >   .c file.
> > > * Dropped setting ditr5 based on latest HW manual 1.3.0/1.4.0
> > > * Updated the comment for auto clear.
> > > * Replaced writel()->rzg2l_du_write() in rzg2l_du_start_stop().
> > > * Dropped CRC related functions as it does not have DISCOM.
> > > * Replaced the variable possible_crtcs->possible_outputs in
> > >   struct rzg2l_du_output_routing.
> > > * Updated DMA_BIT_MASK from 40->32.
> > > * Dropped unneeded struct drm_bridge from rzg2l_du_drv.h.
> > > * Dropped colour keying support as it doesn't have planes.
> > > * Added only RGB formats in rzg2l_du_format_infos.
> > > * Dropped chroma planes from rzg2l_du_fb_create().
> > > * Updated the comment for max_pitch in rzg2l_du_fb_create().
> > > * Dropped possible_crtcs check in rzg2l_du_encoders_init().
> > > * Dropped additional empty line from struct rzg2l_du_device.
> > > v9->v10:
> > >  * Dropped ARM64 dependency from Kconfig.
> > >  * Sorted the configs alphabetically in Kconfig.
> > >  * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
> > >    VIDEO_RENESAS_VSP1.
> > >  * On rzg2l_du_crtc_set_display_timing() replaced the setting of parent
> > >    clk rate with dclk rate.
> > >  * Added rzg2l_du_write() wrapper function.
> > >  * Updated the comment atomic_begin->atomic_flush.
> > >  * Dropped .atomic_check and .atomic_begin callback
> > >  * Renamed __rzg2l_du_crtc_plane_atomic_check-
> > >__rzg2l_du_vsp_plane_atomic
> > >    _check and moved it to rzg2l_du_vsp.c
> > >  * Added struct clk in rzg2l_du_crtc.h
> > >  * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
> > >    vblank_count from struct rzg2l_du_crtc.
> > >  * Replaced the macro to_rzg2l_crtc with static inline functions.
> > >  * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
> > >    wait.h and drm_managed.h from rzg2l_du_drv.c.
> > >  * Replaced DRM_INFO->drm_info
> > >  * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
> > >    gem_prime_mmap.
> > >  * Replaced the callback remove->remove_new.
> > >  * Dropped header file wait.h and added forward declarations struct clk
> > and
> > >    rzg2l_du_device from rzg2l_du_drv.h.
> > >  * Dropped the dsi and dpad0_source variables from struct
> > rzg2l_du_device.
> > >  * Replaced the macro to_rzg2l_encoder with static inline functions.
> > >  * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
> > >  * Dropped struct sg_table and added the scatterlist.h header file in
> > >    rzg2l_du_vsp.h
> > >  * Added container_of.h header file, forward declarations struct device
> > and
> > >    struct rzg2l_du_device in rzg2l_du_vsp.h.
> > > v8->v9:
> > >  * Dropped reset_control_assert() from error patch for
> > rzg2l_du_crtc_get() as
> > >    suggested by Philipp Zabel.
> > > v7->v8:
> > >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating
> > rz_du folder.
> > >  * Updated KConfig and Makefile.
> > > v6->v7:
> > >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> > >    DU support added to more platforms based on RZ/G2L alike SoCs.
> > >  * Rebased to latest drm-tip.
> > >  * Added patch #2 for binding support for RZ/V2L DU
> > >  * Added patch #4 for driver support for RZ/V2L DU
> > >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> > >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> > >  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L}
> > SoCs.
> > >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> > > ---
> > >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> > >  drivers/gpu/drm/renesas/Makefile              |   1 +
> > >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
> > >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 435 ++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  89 ++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 176 +++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  78 +++
> > >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  72 +++
> > >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 ++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 441 ++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 ++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 ++++++++++++++++++
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 ++++
> > >  14 files changed, 1954 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > >
> > > diff --git a/drivers/gpu/drm/renesas/Kconfig
> > b/drivers/gpu/drm/renesas/Kconfig
> > > index 3777dad17f81..21862a8ef710 100644
> > > --- a/drivers/gpu/drm/renesas/Kconfig
> > > +++ b/drivers/gpu/drm/renesas/Kconfig
> > > @@ -1,4 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > >  source "drivers/gpu/drm/renesas/rcar-du/Kconfig"
> > > +source "drivers/gpu/drm/renesas/rz-du/Kconfig"
> > >  source "drivers/gpu/drm/renesas/shmobile/Kconfig"
> > > diff --git a/drivers/gpu/drm/renesas/Makefile
> > b/drivers/gpu/drm/renesas/Makefile
> > > index ec0e89e7a592..b8d8bc53967f 100644
> > > --- a/drivers/gpu/drm/renesas/Makefile
> > > +++ b/drivers/gpu/drm/renesas/Makefile
> > > @@ -1,4 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >
> > >  obj-y += rcar-du/
> > > +obj-y += rz-du/
> > >  obj-$(CONFIG_DRM_SHMOBILE) += shmobile/
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > > new file mode 100644
> > > index 000000000000..5f0db2c5fee6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > > @@ -0,0 +1,12 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +config DRM_RZG2L_DU
> > > +	tristate "DRM Support for RZ/G2L Display Unit"
> > > +	depends on ARCH_RZG2L || COMPILE_TEST
> > > +	depends on DRM && OF
> > > +	depends on VIDEO_RENESAS_VSP1
> > > +	select DRM_GEM_DMA_HELPER
> > > +	select DRM_KMS_HELPER
> > > +	select VIDEOMODE_HELPERS
> > > +	help
> > > +	  Choose this option if you have an RZ/G2L alike chipset.
> > > +	  If M is selected the module will be called rzg2l-du-drm.
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile
> > b/drivers/gpu/drm/renesas/rz-du/Makefile
> > > new file mode 100644
> > > index 000000000000..663b82a2577f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> > > @@ -0,0 +1,8 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +rzg2l-du-drm-y := rzg2l_du_crtc.o \
> > > +		  rzg2l_du_drv.o \
> > > +		  rzg2l_du_encoder.o \
> > > +		  rzg2l_du_kms.o \
> > > +
> > > +rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
> > > +obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > new file mode 100644
> > > index 000000000000..7656b2a6aebc
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > @@ -0,0 +1,435 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * RZ/G2L Display Unit CRTCs
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_crtc.c
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/reset.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_framebuffer.h>
> > > +#include <drm/drm_gem_dma_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "rzg2l_du_crtc.h"
> > > +#include "rzg2l_du_drv.h"
> > > +#include "rzg2l_du_encoder.h"
> > > +#include "rzg2l_du_kms.h"
> > > +#include "rzg2l_du_vsp.h"
> > > +
> > > +#define DU_MCR0			0x00
> > > +#define DU_MCR0_DPI_OE		BIT(0)
> >
> > This bit documented as reserved in TRM version Rev.1.30 (May 12th
> > 2023)
>
> OK will drop this and unused macros below.
>
> >
> > > +#define DU_MCR0_DI_EN		BIT(8)
> > > +#define DU_MCR0_PB_CLR		BIT(16)
> > > +
> > > +#define DU_DITR0		0x10
> > > +#define DU_DITR0_DPI_CLKMD	BIT(0)
> > > +#define DU_DITR0_DEMD_LOW	0x0
> > > +#define DU_DITR0_DEMD_HIGH	(BIT(8) | BIT(9))
> > > +#define DU_DITR0_VSPOL		BIT(16)
> > > +#define DU_DITR0_HSPOL		BIT(17)
> > > +
> > > +#define DU_DITR1		0x14
> > > +#define DU_DITR1_VSA(x)		((x) << 0)
> > > +#define DU_DITR1_VACTIVE(x)	((x) << 16)
> > > +
> > > +#define DU_DITR2		0x18
> > > +#define DU_DITR2_VBP(x)		((x) << 0)
> > > +#define DU_DITR2_VFP(x)		((x) << 16)
> > > +
> > > +#define DU_DITR3		0x1c
> > > +#define DU_DITR3_HSA(x)		((x) << 0)
> > > +#define DU_DITR3_HACTIVE(x)	((x) << 16)
> > > +
> > > +#define DU_DITR4		0x20
> > > +#define DU_DITR4_HBP(x)		((x) << 0)
> > > +#define DU_DITR4_HFP(x)		((x) << 16)
> > > +
> > > +#define DU_MCR1			0x40
> > > +#define DU_MCR1_PB_AUTOCLR	BIT(16)
> > > +
> > > +#define DU_PBCR0		0x4c
> > > +#define DU_PBCR0_PB_DEP(x)	((x) << 0)
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Hardware Setup
> > > + */
> > > +
> > > +static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc
> > *rcrtc)
> > > +{
> > > +	const struct drm_display_mode *mode = &rcrtc->crtc.state-
> > >adjusted_mode;
> > > +	unsigned long mode_clock = mode->clock * 1000;
> > > +	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
> > > +	struct rzg2l_du_device *rcdu = rcrtc->dev;
> > > +
> > > +	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> > > +	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
> > > +
> > > +	ditr0 = (DU_DITR0_DEMD_HIGH
> > > +	      | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL : 0)
> > > +	      | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL :
> > 0));
> > > +
> > > +	ditr1 = DU_DITR1_VSA(mode->vsync_end - mode->vsync_start)
> > > +	      | DU_DITR1_VACTIVE(mode->vdisplay);
> > > +
> > > +	ditr2 = DU_DITR2_VBP(mode->vtotal - mode->vsync_end)
> > > +	      | DU_DITR2_VFP(mode->vsync_start - mode->vdisplay);
> > > +
> > > +	ditr3 = DU_DITR3_HSA(mode->hsync_end - mode->hsync_start)
> > > +	      | DU_DITR3_HACTIVE(mode->hdisplay);
> > > +
> > > +	ditr4 = DU_DITR4_HBP(mode->htotal - mode->hsync_end)
> > > +	      | DU_DITR4_HFP(mode->hsync_start - mode->hdisplay);
> > > +
> > > +	pbcr0 = DU_PBCR0_PB_DEP(0x1f);
> > > +
> > > +	writel(ditr0, rcdu->mmio + DU_DITR0);
> > > +	writel(ditr1, rcdu->mmio + DU_DITR1);
> > > +	writel(ditr2, rcdu->mmio + DU_DITR2);
> > > +	writel(ditr3, rcdu->mmio + DU_DITR3);
> > > +	writel(ditr4, rcdu->mmio + DU_DITR4);
> > > +	writel(pbcr0, rcdu->mmio + DU_PBCR0);
> > > +
> > > +	/* Enable auto clear */
> > > +	writel(DU_MCR1_PB_AUTOCLR, rcdu->mmio + DU_MCR1);
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Page Flip
> > > + */
> > > +
> > > +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	struct drm_pending_vblank_event *event;
> > > +	struct drm_device *dev = rcrtc->crtc.dev;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&dev->event_lock, flags);
> > > +	event = rcrtc->event;
> > > +	rcrtc->event = NULL;
> > > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > > +
> > > +	if (!event)
> > > +		return;
> > > +
> > > +	spin_lock_irqsave(&dev->event_lock, flags);
> > > +	drm_crtc_send_vblank_event(&rcrtc->crtc, event);
> > > +	wake_up(&rcrtc->flip_wait);
> > > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > > +
> > > +	drm_crtc_vblank_put(&rcrtc->crtc);
> > > +}
> > > +
> > > +static bool rzg2l_du_crtc_page_flip_pending(struct rzg2l_du_crtc
> > *rcrtc)
> > > +{
> > > +	struct drm_device *dev = rcrtc->crtc.dev;
> > > +	unsigned long flags;
> > > +	bool pending;
> > > +
> > > +	spin_lock_irqsave(&dev->event_lock, flags);
> > > +	pending = rcrtc->event;
> > > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > > +
> > > +	return pending;
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_wait_page_flip(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	struct rzg2l_du_device *rcdu = rcrtc->dev;
> > > +
> > > +	if (wait_event_timeout(rcrtc->flip_wait,
> > > +			       !rzg2l_du_crtc_page_flip_pending(rcrtc),
> > > +			       msecs_to_jiffies(50)))
> > > +		return;
> > > +
> > > +	dev_warn(rcdu->dev, "page flip timeout\n");
> > > +
> > > +	rzg2l_du_crtc_finish_page_flip(rcrtc);
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Start/Stop and Suspend/Resume
> > > + */
> > > +
> > > +static void rzg2l_du_crtc_setup(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	/* Configure display timings and output routing */
> > > +	rzg2l_du_crtc_set_display_timing(rcrtc);
> > > +
> > > +	/* Enable the VSP compositor. */
> > > +	rzg2l_du_vsp_enable(rcrtc);
> > > +
> > > +	/* Turn vertical blanking interrupt reporting on. */
> > > +	drm_crtc_vblank_on(&rcrtc->crtc);
> > > +}
> > > +
> > > +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Guard against double-get, as the function is called from both the
> > > +	 * .atomic_enable() and .atomic_flush() handlers.
> > > +	 */
> > > +	if (rcrtc->initialized)
> > > +		return 0;
> > > +
> > > +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> > > +	if (ret < 0)
> > > +		goto error_bus_clock;
> > > +
> > > +	ret = reset_control_deassert(rcrtc->rstc);
> > > +	if (ret < 0)
> > > +		goto error_peri_clock;
> > > +
> > > +	rzg2l_du_crtc_setup(rcrtc);
> > > +	rcrtc->initialized = true;
> > > +
> > > +	return 0;
> > > +
> > > +error_peri_clock:
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > > +error_bus_clock:
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > > +	return ret;
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.dclk);
> > > +	reset_control_assert(rcrtc->rstc);
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > > +
> > > +	rcrtc->initialized = false;
> > > +}
> > > +
> > > +static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool
> > start)
> > > +{
> > > +	struct rzg2l_du_device *rcdu = rcrtc->dev;
> > > +
> > > +	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	rzg2l_du_start_stop(rcrtc, true);
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
> > > +{
> > > +	struct drm_crtc *crtc = &rcrtc->crtc;
> > > +
> > > +	/*
> > > +	 * Disable vertical blanking interrupt reporting. We first need to
> > wait
> > > +	 * for page flip completion before stopping the CRTC as userspace
> > > +	 * expects page flips to eventually complete.
> > > +	 */
> > > +	rzg2l_du_crtc_wait_page_flip(rcrtc);
> > > +	drm_crtc_vblank_off(crtc);
> > > +
> > > +	/* Disable the VSP compositor. */
> > > +	rzg2l_du_vsp_disable(rcrtc);
> > > +
> > > +	rzg2l_du_start_stop(rcrtc, false);
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * CRTC Functions
> > > + */
> > > +
> > > +static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +					struct drm_atomic_state *state)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > +
> > > +	rzg2l_du_crtc_get(rcrtc);
> > > +
> > > +	rzg2l_du_crtc_start(rcrtc);
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +					 struct drm_atomic_state *state)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > +
> > > +	rzg2l_du_crtc_stop(rcrtc);
> > > +	rzg2l_du_crtc_put(rcrtc);
> > > +
> > > +	spin_lock_irq(&crtc->dev->event_lock);
> > > +	if (crtc->state->event) {
> > > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > > +		crtc->state->event = NULL;
> > > +	}
> > > +	spin_unlock_irq(&crtc->dev->event_lock);
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +				       struct drm_atomic_state *state)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > +	struct drm_device *dev = rcrtc->crtc.dev;
> > > +	unsigned long flags;
> > > +
> > > +	WARN_ON(!crtc->state->enable);
> > > +
> > > +	/*
> > > +	 * If a mode set is in progress we can be called with the CRTC
> > disabled.
> > > +	 * We thus need to first get and setup the CRTC in order to
> > configure
> > > +	 * planes. We must *not* put the CRTC, as it must be kept awake
> > until
> > > +	 * the .atomic_enable() call that will follow. The get operation in
> > > +	 * .atomic_enable() will in that case be a no-op, and the CRTC will
> > be
> > > +	 * put later in .atomic_disable().
> > > +	 */
> > > +	rzg2l_du_crtc_get(rcrtc);
> > > +
> > > +	if (crtc->state->event) {
> > > +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> > > +
> > > +		spin_lock_irqsave(&dev->event_lock, flags);
> > > +		rcrtc->event = crtc->state->event;
> > > +		crtc->state->event = NULL;
> > > +		spin_unlock_irqrestore(&dev->event_lock, flags);
> > > +	}
> > > +
> > > +	rzg2l_du_vsp_atomic_flush(rcrtc);
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
> > > +	.atomic_flush = rzg2l_du_crtc_atomic_flush,
> > > +	.atomic_enable = rzg2l_du_crtc_atomic_enable,
> > > +	.atomic_disable = rzg2l_du_crtc_atomic_disable,
> > > +};
> > > +
> > > +static struct drm_crtc_state *
> > > +rzg2l_du_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> > > +{
> > > +	struct rzg2l_du_crtc_state *state;
> > > +	struct rzg2l_du_crtc_state *copy;
> > > +
> > > +	if (WARN_ON(!crtc->state))
> > > +		return NULL;
> > > +
> > > +	state = to_rzg2l_crtc_state(crtc->state);
> > > +	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
> > > +	if (!copy)
> > > +		return NULL;
> > > +
> > > +	__drm_atomic_helper_crtc_duplicate_state(crtc, &copy->state);
> > > +
> > > +	return &copy->state;
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> > > +					       struct drm_crtc_state *state)
> > > +{
> > > +	__drm_atomic_helper_crtc_destroy_state(state);
> > > +	kfree(to_rzg2l_crtc_state(state));
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_reset(struct drm_crtc *crtc)
> > > +{
> > > +	struct rzg2l_du_crtc_state *state;
> > > +
> > > +	if (crtc->state) {
> > > +		rzg2l_du_crtc_atomic_destroy_state(crtc, crtc->state);
> > > +		crtc->state = NULL;
> > > +	}
> > > +
> > > +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > > +	if (!state)
> > > +		return;
> > > +
> > > +	__drm_atomic_helper_crtc_reset(crtc, &state->state);
> > > +}
> > > +
> > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > +
> > > +	rcrtc->vblank_enable = true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
> > > +
> > > +	rcrtc->vblank_enable = false;
> > > +}
> > > +
> > > +static const struct drm_crtc_funcs crtc_funcs_rz = {
> > > +	.reset = rzg2l_du_crtc_reset,
> > > +	.destroy = drm_crtc_cleanup,
> > > +	.set_config = drm_atomic_helper_set_config,
> > > +	.page_flip = drm_atomic_helper_page_flip,
> > > +	.atomic_duplicate_state = rzg2l_du_crtc_atomic_duplicate_state,
> > > +	.atomic_destroy_state = rzg2l_du_crtc_atomic_destroy_state,
> > > +	.enable_vblank = rzg2l_du_crtc_enable_vblank,
> > > +	.disable_vblank = rzg2l_du_crtc_disable_vblank,
> > > +};
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Initialization
> > > + */
> > > +
> > > +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
> > > +{
> > > +	struct rzg2l_du_crtc *rcrtc = &rcdu->crtcs[0];
> > > +	struct drm_crtc *crtc = &rcrtc->crtc;
> > > +	struct drm_plane *primary;
> > > +	int ret;
> > > +
> > > +	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
> > > +	if (IS_ERR(rcrtc->rstc)) {
> > > +		dev_err(rcdu->dev, "can't get cpg reset\n");
> > > +		return PTR_ERR(rcrtc->rstc);
> > > +	}
> > > +
> > > +	rcrtc->rzg2l_clocks.aclk = devm_clk_get(rcdu->dev, "aclk");
> > > +	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
> > > +		dev_err(rcdu->dev, "no axi clock for DU\n");
> > > +		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
> > > +	}
> > > +
> > > +	rcrtc->rzg2l_clocks.pclk = devm_clk_get(rcdu->dev, "pclk");
> > > +	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
> > > +		dev_err(rcdu->dev, "no peripheral clock for DU\n");
> > > +		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
> > > +	}
> > > +
> > > +	rcrtc->rzg2l_clocks.dclk = devm_clk_get(rcdu->dev, "vclk");
> > > +	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
> > > +		dev_err(rcdu->dev, "no video clock for DU\n");
> > > +		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
> > > +	}
> > > +
> > > +	init_waitqueue_head(&rcrtc->flip_wait);
> > > +	rcrtc->dev = rcdu;
> > > +
> > > +	primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> > > +
> > > +	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
> > > +					&crtc_funcs_rz, NULL);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> > > +
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > > new file mode 100644
> > > index 000000000000..cbba38acc377
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > > @@ -0,0 +1,89 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * RZ/G2L Display Unit CRTCs
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_crtc.h
> > > + */
> > > +
> > > +#ifndef __RZG2L_DU_CRTC_H__
> > > +#define __RZG2L_DU_CRTC_H__
> > > +
> > > +#include <linux/container_of.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/spinlock.h>
> > > +#include <linux/wait.h>
> > > +
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_writeback.h>
> > > +
> > > +#include <media/vsp1.h>
> > > +
> > > +struct clk;
> > > +struct reset_control;
> > > +struct rzg2l_du_vsp;
> > > +struct rzg2l_du_format_info;
> > > +
> > > +/**
> > > + * struct rzg2l_du_crtc - the CRTC, representing a DU superposition
> > processor
> > > + * @crtc: base DRM CRTC
> > > + * @dev: the DU device
> > > + * @initialized: whether the CRTC has been initialized and clocks
> > enabled
> > > + * @vblank_enable: whether vblank events are enabled on this CRTC
> > > + * @event: event to post when the pending page flip completes
> > > + * @flip_wait: wait queue used to signal page flip completion
> > > + * @vsp: VSP feeding video to this CRTC
> > > + * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
> > > + * @rstc: reset controller
> > > + * @rzg2l_clocks: the bus, main and video clock
> > > + */
> > > +struct rzg2l_du_crtc {
> > > +	struct drm_crtc crtc;
> > > +
> > > +	struct rzg2l_du_device *dev;
> > > +	bool initialized;
> > > +
> > > +	bool vblank_enable;
> > > +	struct drm_pending_vblank_event *event;
> > > +	wait_queue_head_t flip_wait;
> > > +
> > > +	struct rzg2l_du_vsp *vsp;
> > > +	unsigned int vsp_pipe;
> > > +
> > > +	const char *const *sources;
> > > +	unsigned int sources_count;
> > > +
> > > +	struct reset_control *rstc;
> > > +	struct {
> > > +		struct clk *aclk;
> > > +		struct clk *pclk;
> > > +		struct clk *dclk;
> > > +	} rzg2l_clocks;
> > > +};
> > > +
> > > +static inline struct rzg2l_du_crtc *to_rzg2l_crtc(struct drm_crtc *c)
> > > +{
> > > +	return container_of(c, struct rzg2l_du_crtc, crtc);
> > > +}
> > > +
> > > +/**
> > > + * struct rzg2l_du_crtc_state - Driver-specific CRTC state
> > > + * @state: base DRM CRTC state
> > > + * @outputs: bitmask of the outputs (enum rzg2l_du_output) driven by
> > this CRTC
> > > + */
> > > +struct rzg2l_du_crtc_state {
> > > +	struct drm_crtc_state state;
> > > +	unsigned int outputs;
> > > +};
> > > +
> > > +static inline struct rzg2l_du_crtc_state *to_rzg2l_crtc_state(struct
> > drm_crtc_state *s)
> > > +{
> > > +	return container_of(s, struct rzg2l_du_crtc_state, state);
> > > +}
> > > +
> > > +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu);
> > > +
> > > +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc);
> > > +
> > > +#endif /* __RZG2L_DU_CRTC_H__ */
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > new file mode 100644
> > > index 000000000000..2f3ced999c4f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > @@ -0,0 +1,176 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * RZ/G2L Display Unit DRM driver
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_drv.c
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fbdev_generic.h>
> > > +#include <drm/drm_gem_dma_helper.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +#include "rzg2l_du_drv.h"
> > > +#include "rzg2l_du_kms.h"
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Device Information
> > > + */
> > > +
> > > +static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
> > > +	.channels_mask = BIT(0),
> > > +	.routes = {
> > > +		[RZG2L_DU_OUTPUT_DSI0] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 0,
> > > +		},
> > > +		[RZG2L_DU_OUTPUT_DPAD0] = {
> > > +			.possible_outputs = BIT(0),
> > > +			.port = 1,
> > > +		}
> > > +	}
> > > +};
> > > +
> > > +static const struct of_device_id rzg2l_du_of_table[] = {
> > > +	{ .compatible = "renesas,r9a07g044-du", .data =
> > &rzg2l_du_r9a07g044_info },
> > > +	{ /* sentinel */ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, rzg2l_du_of_table);
> > > +
> > > +const char *rzg2l_du_output_name(enum rzg2l_du_output output)
> > > +{
> > > +	static const char * const names[] = {
> > > +		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
> > > +		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
> > > +	};
> > > +
> > > +	if (output >= ARRAY_SIZE(names))
> > > +		return "UNKNOWN";
> > > +
> > > +	return names[output];
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * DRM operations
> > > + */
> > > +
> > > +DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
> > > +
> > > +static const struct drm_driver rzg2l_du_driver = {
> > > +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> > > +	.dumb_create		= rzg2l_du_dumb_create,
> > > +	.gem_prime_import_sg_table = rzg2l_du_gem_prime_import_sg_table,
> > > +	.fops			= &rzg2l_du_fops,
> > > +	.name			= "rzg2l-du",
> > > +	.desc			= "Renesas RZ/G2L Display Unit",
> > > +	.date			= "20230410",
> > > +	.major			= 1,
> > > +	.minor			= 0,
> > > +};
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Platform driver
> > > + */
> > > +
> > > +static void rzg2l_du_remove(struct platform_device *pdev)
> > > +{
> > > +	struct rzg2l_du_device *rcdu = platform_get_drvdata(pdev);
> > > +	struct drm_device *ddev = &rcdu->ddev;
> > > +
> > > +	drm_dev_unregister(ddev);
> > > +	drm_atomic_helper_shutdown(ddev);
> > > +
> > > +	drm_kms_helper_poll_fini(ddev);
> > > +}
> > > +
> > > +static void rzg2l_du_shutdown(struct platform_device *pdev)
> > > +{
> > > +	struct rzg2l_du_device *rcdu = platform_get_drvdata(pdev);
> > > +
> > > +	drm_atomic_helper_shutdown(&rcdu->ddev);
> > > +}
> > > +
> > > +static int rzg2l_du_probe(struct platform_device *pdev)
> > > +{
> > > +	struct rzg2l_du_device *rcdu;
> > > +	int ret;
> > > +
> > > +	if (drm_firmware_drivers_only())
> > > +		return -ENODEV;
> > > +
> > > +	/* Allocate and initialize the RZ/G2L device structure. */
> > > +	rcdu = devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
> > > +				  struct rzg2l_du_device, ddev);
> > > +	if (IS_ERR(rcdu))
> > > +		return PTR_ERR(rcdu);
> > > +
> > > +	rcdu->dev = &pdev->dev;
> > > +	rcdu->info = of_device_get_match_data(rcdu->dev);
> > > +
> > > +	platform_set_drvdata(pdev, rcdu);
> > > +
> > > +	/* I/O resources */
> > > +	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(rcdu->mmio))
> > > +		return PTR_ERR(rcdu->mmio);
> > > +
> > > +	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* DRM/KMS objects */
> > > +	ret = rzg2l_du_modeset_init(rcdu);
> > > +	if (ret < 0) {
> > > +		/*
> > > +		 * Don't use dev_err_probe(), as it would overwrite the probe
> > > +		 * deferral reason recorded in rzg2l_du_modeset_init().
> >
> > Not sure I got this one. It's been verbatim copied from rcar-du, just
> > wanted to make sure it applies here too
>
> Yes, it applies here as well.
>
> >
> > > +		 */
> > > +		if (ret != -EPROBE_DEFER)
> > > +			dev_err(&pdev->dev,
> > > +				"failed to initialize DRM/KMS (%d)\n", ret);
> > > +		goto error;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Register the DRM device with the core and the connectors with
> > > +	 * sysfs.
> > > +	 */
> > > +	ret = drm_dev_register(&rcdu->ddev, 0);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
> > > +
> > > +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	drm_kms_helper_poll_fini(&rcdu->ddev);
> > > +	return ret;
> > > +}
> > > +
> > > +static struct platform_driver rzg2l_du_platform_driver = {
> > > +	.probe		= rzg2l_du_probe,
> > > +	.remove_new	= rzg2l_du_remove,
> > > +	.shutdown	= rzg2l_du_shutdown,
> > > +	.driver		= {
> > > +		.name	= "rzg2l-du",
> > > +		.of_match_table = rzg2l_du_of_table,
> > > +	},
> > > +};
> > > +
> > > +module_platform_driver(rzg2l_du_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > > +MODULE_DESCRIPTION("Renesas RZ/G2L Display Unit DRM Driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > new file mode 100644
> > > index 000000000000..58806c2a8f2b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > @@ -0,0 +1,78 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * RZ/G2L Display Unit DRM driver
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_drv.h
> > > + */
> > > +
> > > +#ifndef __RZG2L_DU_DRV_H__
> > > +#define __RZG2L_DU_DRV_H__
> > > +
> > > +#include <linux/kernel.h>
> > > +
> > > +#include <drm/drm_device.h>
> > > +
> > > +#include "rzg2l_du_crtc.h"
> > > +#include "rzg2l_du_vsp.h"
> > > +
> > > +struct device;
> > > +struct drm_property;
> > > +
> > > +enum rzg2l_du_output {
> > > +	RZG2L_DU_OUTPUT_DSI0,
> > > +	RZG2L_DU_OUTPUT_DPAD0,
> > > +	RZG2L_DU_OUTPUT_MAX,
> > > +};
> > > +
> > > +/*
> > > + * struct rzg2l_du_output_routing - Output routing specification
> > > + * @possible_outputs: bitmask of possible outputs
> > > + * @port: device tree port number corresponding to this output route
> > > + *
> > > + * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> > > + * specify the valid SoC outputs, which CRTC can drive the output, and
> > the type
> > > + * of in-SoC encoder for the output.
> > > + */
> > > +struct rzg2l_du_output_routing {
> > > +	unsigned int possible_outputs;
> > > +	unsigned int port;
> > > +};
> > > +
> > > +/*
> > > + * struct rzg2l_du_device_info - DU model-specific information
> > > + * @channels_mask: bit mask of available DU channels
> > > + * @routes: array of CRTC to output routes, indexed by output
> > (RZG2L_DU_OUTPUT_*)
> > > + */
> > > +struct rzg2l_du_device_info {
> > > +	unsigned int channels_mask;
> > > +	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > > +};
> > > +
> > > +#define RZG2L_DU_MAX_CRTCS		1
> > > +#define RZG2L_DU_MAX_VSPS		1
> > > +#define RZG2L_DU_MAX_DSI		1
> > > +
> > > +struct rzg2l_du_device {
> > > +	struct device *dev;
> > > +	const struct rzg2l_du_device_info *info;
> > > +
> > > +	void __iomem *mmio;
> > > +
> > > +	struct drm_device ddev;
> > > +
> > > +	struct rzg2l_du_crtc crtcs[RZG2L_DU_MAX_CRTCS];
> > > +	unsigned int num_crtcs;
> > > +
> > > +	struct rzg2l_du_vsp vsps[RZG2L_DU_MAX_VSPS];
> > > +};
> > > +
> > > +static inline struct rzg2l_du_device *to_rzg2l_du_device(struct
> > drm_device *dev)
> > > +{
> > > +	return container_of(dev, struct rzg2l_du_device, ddev);
> > > +}
> > > +
> > > +const char *rzg2l_du_output_name(enum rzg2l_du_output output);
> > > +
> > > +#endif /* __RZG2L_DU_DRV_H__ */
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > new file mode 100644
> > > index 000000000000..339cbaaea0b5
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > @@ -0,0 +1,72 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * RZ/G2L Display Unit Encoder
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_encoder.c
> > > + */
> > > +
> > > +#include <linux/export.h>
> > > +#include <linux/of.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_bridge_connector.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +#include "rzg2l_du_drv.h"
> > > +#include "rzg2l_du_encoder.h"
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Encoder
> > > + */
> > > +
> > > +static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
> > > +};
> > > +
> > > +int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
> > > +			  enum rzg2l_du_output output,
> > > +			  struct device_node *enc_node)
> > > +{
> > > +	struct rzg2l_du_encoder *renc;
> > > +	struct drm_connector *connector;
> > > +	struct drm_bridge *bridge;
> > > +	int ret;
> > > +
> > > +	/* Locate the DRM bridge from the DT node. */
> > > +	bridge = of_drm_find_bridge(enc_node);
> > > +	if (!bridge)
> > > +		return -EPROBE_DEFER;
> > > +
> > > +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
> > > +		enc_node, rzg2l_du_output_name(output));
> > > +
> > > +	renc = drmm_encoder_alloc(&rcdu->ddev, struct rzg2l_du_encoder,
> > base,
> > > +				  &rzg2l_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
> > > +				  NULL);
> > > +	if (IS_ERR(renc))
> > > +		return PTR_ERR(renc);
> > > +
> > > +	renc->output = output;
> > > +
> > > +	/* Attach the bridge to the encoder. */
> > > +	ret = drm_bridge_attach(&renc->base, bridge, NULL,
> > > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +	if (ret) {
> > > +		dev_err(rcdu->dev,
> > > +			"failed to attach bridge %pOF for output %s (%d)\n",
> > > +			bridge->of_node, rzg2l_du_output_name(output), ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Create the connector for the chain of bridges. */
> > > +	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> > > +	if (IS_ERR(connector)) {
> > > +		dev_err(rcdu->dev,
> > > +			"failed to created connector for output %s (%ld)\n",
> > > +			rzg2l_du_output_name(output), PTR_ERR(connector));
> > > +		return PTR_ERR(connector);
> > > +	}
> > > +
> > > +	return drm_connector_attach_encoder(connector, &renc->base);
> > > +}
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > > new file mode 100644
> > > index 000000000000..3e430c1f6132
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * RZ/G2L Display Unit Encoder
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_encoder.h
> > > + */
> > > +
> > > +#ifndef __RZG2L_DU_ENCODER_H__
> > > +#define __RZG2L_DU_ENCODER_H__
> > > +
> > > +#include <drm/drm_encoder.h>
> > > +#include <linux/container_of.h>
> > > +
> > > +struct rzg2l_du_device;
> > > +
> > > +struct rzg2l_du_encoder {
> > > +	struct drm_encoder base;
> > > +	enum rzg2l_du_output output;
> > > +};
> > > +
> > > +static inline struct rzg2l_du_encoder *to_rzg2l_encoder(struct
> > drm_encoder *e)
> > > +{
> > > +	return container_of(e, struct rzg2l_du_encoder, base);
> > > +}
> > > +
> > > +int rzg2l_du_encoder_init(struct rzg2l_du_device *rcdu,
> > > +			  enum rzg2l_du_output output,
> > > +			  struct device_node *enc_node);
> > > +
> > > +#endif /* __RZG2L_DU_ENCODER_H__ */
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > > new file mode 100644
> > > index 000000000000..9e4fa36d1dd0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > > @@ -0,0 +1,441 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * RZ/G2L Display Unit Mode Setting
> > > + *
> > > + * Copyright (C) 2023 Renesas Electronics Corporation
> > > + *
> > > + * Based on rcar_du_kms.c
> > > + */
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_framebuffer.h>
> > > +#include <drm/drm_gem_dma_helper.h>
> > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_managed.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "rzg2l_du_crtc.h"
> > > +#include "rzg2l_du_drv.h"
> > > +#include "rzg2l_du_encoder.h"
> > > +#include "rzg2l_du_kms.h"
> > > +#include "rzg2l_du_vsp.h"
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Format helpers
> > > + */
> > > +
> > > +static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
> > > +	{
> > > +		.fourcc = DRM_FORMAT_XRGB8888,
> > > +		.v4l2 = V4L2_PIX_FMT_XBGR32,
> > > +		.bpp = 32,
> > > +		.planes = 1,
> > > +		.hsub = 1,
> > > +	}, {
> > > +		.fourcc = DRM_FORMAT_ARGB8888,
> > > +		.v4l2 = V4L2_PIX_FMT_ABGR32,
> > > +		.bpp = 32,
> > > +		.planes = 1,
> > > +		.hsub = 1,
> > > +	}, {
> > > +		.fourcc = DRM_FORMAT_RGB888,
> > > +		.v4l2 = V4L2_PIX_FMT_BGR24,
> > > +		.bpp = 24,
> > > +		.planes = 1,
> > > +		.hsub = 1,
> > > +	}
> > > +};
> > > +
> > > +const struct rzg2l_du_format_info *rzg2l_du_format_info(u32 fourcc)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(rzg2l_du_format_infos); ++i) {
> > > +		if (rzg2l_du_format_infos[i].fourcc == fourcc)
> > > +			return &rzg2l_du_format_infos[i];
> > > +	}
> > > +
> > > +	return NULL;
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Frame buffer
> > > + */
> > > +
> > > +static const struct drm_gem_object_funcs rzg2l_du_gem_funcs = {
> > > +	.free = drm_gem_dma_object_free,
> > > +	.print_info = drm_gem_dma_object_print_info,
> > > +	.get_sg_table = drm_gem_dma_object_get_sg_table,
> > > +	.vmap = drm_gem_dma_object_vmap,
> > > +	.mmap = drm_gem_dma_object_mmap,
> > > +	.vm_ops = &drm_gem_dma_vm_ops,
> > > +};
> > > +
> > > +struct drm_gem_object *
> > > +rzg2l_du_gem_prime_import_sg_table(struct drm_device *dev,
> > > +				   struct dma_buf_attachment *attach,
> > > +				   struct sg_table *sgt)
> > > +{
> > > +	struct drm_gem_dma_object *dma_obj;
> > > +	struct drm_gem_object *gem_obj;
> > > +	int ret;
> > > +
> > > +	/* Create a DMA GEM buffer. */
> > > +	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> > > +	if (!dma_obj)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	gem_obj = &dma_obj->base;
> > > +	gem_obj->funcs = &rzg2l_du_gem_funcs;
> > > +
> > > +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> > > +	dma_obj->map_noncoherent = false;
> > > +
> > > +	ret = drm_gem_create_mmap_offset(gem_obj);
> > > +	if (ret) {
> > > +		drm_gem_object_release(gem_obj);
> > > +		kfree(dma_obj);
> > > +		return ERR_PTR(ret);
> > > +	}
> > > +
> > > +	dma_obj->dma_addr = 0;
> > > +	dma_obj->sgt = sgt;
> > > +
> > > +	return gem_obj;
> > > +}
> > > +
> > > +int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> > > +			 struct drm_mode_create_dumb *args)
> > > +{
> > > +	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> > > +	unsigned int align = 16 * args->bpp / 8;
> > > +
> > > +	args->pitch = roundup(min_pitch, align);
> > > +
> > > +	return drm_gem_dma_dumb_create_internal(file, dev, args);
> > > +}
> > > +
> > > +static struct drm_framebuffer *
> > > +rzg2l_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > > +		   const struct drm_mode_fb_cmd2 *mode_cmd)
> > > +{
> > > +	const struct rzg2l_du_format_info *format;
> > > +	unsigned int max_pitch;
> > > +
> > > +	format = rzg2l_du_format_info(mode_cmd->pixel_format);
> > > +	if (!format) {
> > > +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> > > +			&mode_cmd->pixel_format);
> > > +		return ERR_PTR(-EINVAL);
> > > +	}
> > > +
> > > +	/*
> > > +	 * On RZ/G2L the memory interface is handled by the VSP that limits
> > the
> > > +	 * pitch to 65535 bytes.
> > > +	 */
> > > +	max_pitch = 65535;
> > > +	if (mode_cmd->pitches[0] > max_pitch) {
> > > +		dev_dbg(dev->dev, "invalid pitch value %u\n",
> > > +			mode_cmd->pitches[0]);
> > > +		return ERR_PTR(-EINVAL);
> > > +	}
> > > +
> > > +	return drm_gem_fb_create(dev, file_priv, mode_cmd);
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Atomic Check and Update
> > > + */
> > > +
> > > +static void rzg2l_du_atomic_commit_tail(struct drm_atomic_state
> > *old_state)
> > > +{
> > > +	struct drm_device *dev = old_state->dev;
> > > +
> > > +	/* Apply the atomic update. */
> > > +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > > +	drm_atomic_helper_commit_planes(dev, old_state,
> > > +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > > +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > > +
> > > +	drm_atomic_helper_commit_hw_done(old_state);
> > > +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> > > +
> > > +	drm_atomic_helper_cleanup_planes(dev, old_state);
> > > +}
> > > +
> > > +/* --------------------------------------------------------------------
> > ---------
> > > + * Initialization
> > > + */
> > > +
> > > +static const struct drm_mode_config_helper_funcs
> > rzg2l_du_mode_config_helper = {
> > > +	.atomic_commit_tail = rzg2l_du_atomic_commit_tail,
> > > +};
> > > +
> > > +static const struct drm_mode_config_funcs rzg2l_du_mode_config_funcs =
> > {
> > > +	.fb_create = rzg2l_du_fb_create,
> > > +	.atomic_check = drm_atomic_helper_check,
> > > +	.atomic_commit = drm_atomic_helper_commit,
> > > +};
> > > +
> > > +static int rzg2l_du_encoders_init_one(struct rzg2l_du_device *rcdu,
> > > +				      enum rzg2l_du_output output,
> > > +				      struct of_endpoint *ep)
> > > +{
> > > +	struct device_node *entity;
> > > +	int ret;
> > > +
> > > +	/* Locate the connected entity and initialize the encoder. */
> > > +	entity = of_graph_get_remote_port_parent(ep->local_node);
> > > +	if (!entity) {
> > > +		dev_dbg(rcdu->dev, "unconnected endpoint %pOF, skipping\n",
> > > +			ep->local_node);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	if (!of_device_is_available(entity)) {
> > > +		dev_dbg(rcdu->dev,
> > > +			"connected entity %pOF is disabled, skipping\n",
> > > +			entity);
> > > +		of_node_put(entity);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	ret = rzg2l_du_encoder_init(rcdu, output, entity);
> > > +	if (ret && ret != -EPROBE_DEFER && ret != -ENOLINK)
> > > +		dev_warn(rcdu->dev,
> > > +			 "failed to initialize encoder %pOF on output %s (%d),
> > skipping\n",
> > > +			 entity, rzg2l_du_output_name(output), ret);
> > > +
> > > +	of_node_put(entity);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int rzg2l_du_encoders_init(struct rzg2l_du_device *rcdu)
> > > +{
> > > +	struct device_node *np = rcdu->dev->of_node;
> > > +	struct device_node *ep_node;
> > > +	unsigned int num_encoders = 0;
> > > +
> > > +	/*
> > > +	 * Iterate over the endpoints and create one encoder for each output
> > > +	 * pipeline.
> > > +	 */
> > > +	for_each_endpoint_of_node(np, ep_node) {
> > > +		enum rzg2l_du_output output;
> > > +		struct of_endpoint ep;
> > > +		unsigned int i;
> > > +		int ret;
> > > +
> > > +		ret = of_graph_parse_endpoint(ep_node, &ep);
> > > +		if (ret < 0) {
> > > +			of_node_put(ep_node);
> > > +			return ret;
> > > +		}
> > > +
> > > +		/* Find the output route corresponding to the port number. */
> > > +		for (i = 0; i < RZG2L_DU_OUTPUT_MAX; ++i) {
> > > +			if (rcdu->info->routes[i].port == ep.port) {
> > > +				output = i;
> > > +				break;
> > > +			}
> > > +		}
> > > +
> > > +		if (i == RZG2L_DU_OUTPUT_MAX) {
> > > +			dev_warn(rcdu->dev,
> > > +				 "port %u references unexisting output,
> > skipping\n",
> > > +				 ep.port);
> > > +			continue;
> > > +		}
> > > +
> > > +		/* Process the output pipeline. */
> > > +		ret = rzg2l_du_encoders_init_one(rcdu, output, &ep);
> > > +		if (ret < 0) {
> > > +			if (ret == -EPROBE_DEFER) {
> > > +				of_node_put(ep_node);
> > > +				return ret;
> > > +			}
> > > +
> > > +			continue;
> > > +		}
> > > +
> > > +		num_encoders++;
> > > +	}
> > > +
> > > +	return num_encoders;
> > > +}
> > > +
> > > +static int rzg2l_du_vsps_init(struct rzg2l_du_device *rcdu)
> > > +{
> > > +	const struct device_node *np = rcdu->dev->of_node;
> > > +	const char *vsps_prop_name = "renesas,vsps";
> > > +	struct of_phandle_args args;
> > > +	struct {
> > > +		struct device_node *np;
> > > +		unsigned int crtcs_mask;
> > > +	} vsps[RZG2L_DU_MAX_VSPS] = { { NULL, }, };
> > > +	unsigned int vsps_count = 0;
> > > +	unsigned int cells;
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * First parse the DT vsps property to populate the list of VSPs.
> > Each
> > > +	 * entry contains a pointer to the VSP DT node and a bitmask of the
> > > +	 * connected DU CRTCs.
> > > +	 */
> > > +	ret = of_property_count_u32_elems(np, vsps_prop_name);
> > > +	if (ret < 0) {
> > > +		/* Backward compatibility with old DTBs. */
> > > +		vsps_prop_name = "vsps";
> > > +		ret = of_property_count_u32_elems(np, vsps_prop_name);
> >
> > Do you need this one ? You don't have "old DTBs" if I'm not mistaken
>
> OK will drop this.
>
> >
> > > +	}
> > > +	cells = ret / rcdu->num_crtcs - 1;
> > > +	if (cells > 1)
> >
> > You have 2 elements for each vsp entry (phandle + LIF), and one vsps
> > can be associated with one CRTC only, right ?
>
> Yes that is correct.
>
> >
> > Doesn't the above work onl if you have a single CRTC (2 / 1 - 1 == 1)
> > but breaks for any other larger number of CRTCs ? (ie with 3 CRTC 6 /
> > 1 - 1 > 1) ?
>
> Ok, I will change the condition to (cells != 1)
>
>
> >
> > Also, can RZ/G2L have more than 1 CRTC ? Do you need all the below
> > code ?
>
> Future devices may have more than 1 CRTC. So, I would like to keep as it is.
> We can do optimization later. Are you ok with it?

Makes sense indeed! I'm fine with that!

Thanks
   j
