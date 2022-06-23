Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760DC557637
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 11:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A4810EB21;
	Thu, 23 Jun 2022 09:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A310EB21
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655975054; x=1687511054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYvXky8LTEo0AVSCb760/bGRnZqD6JIZyUxAGN7MSkM=;
 b=EdW/HnI/NVMn4XsQC1uZkDKxuVGbegx/88ArvjRX7e0wo7EpoZOmhYqc
 YbIY6pFDJNmYpwCkbZPWeyEWLkABsPnH8kp/tcMgdGkMWpbG3A5WVEKwm
 pF8A6EK/OccvjQm9Dx2vx/8GKpS+ASPisFzTNmced8jjwKfKvtumF6fE8
 Z/Hl6qa0H+HB124TolZymCS9kujDwxnT2mmg7rISfNo/AIncg5szVyz9s
 dmZ0nKBUvKgbjn6DlQ+qQLYWAeikkBec5VyD+8iAgV4m7B26hRerNlPMH
 jVQkptz6yLNhvXJ77mEg76uaMSJYIV0Q4EYcc+7h5uOjXyr4CsHNjoxJ2 Q==;
X-IronPort-AV: E=Sophos;i="5.92,215,1650924000"; d="scan'208";a="24625634"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 23 Jun 2022 11:04:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 23 Jun 2022 11:04:11 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 23 Jun 2022 11:04:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1655975051; x=1687511051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYvXky8LTEo0AVSCb760/bGRnZqD6JIZyUxAGN7MSkM=;
 b=NvUtDhrkwwNYdRcDQlbne/78CRdvaZsxfKCvDWXrRwhTycS0Mwoz10/7
 ZztjzCtiXrtP8IjmWEVyX8LMcTk2a/NAfKhLTPcjerqXwloL4GfOpEqaL
 PgVqpNpz6hI20zL4/rB5nfJwhb7yHaMKWQaryLhO+fvc7BN2dSRESDZfu
 9YTxUyKWRCdHfdBnD1e+jqv38VVbcCKIqO0T1mn0KPgaejOl4lWRGeXDl
 1NyuPU6X/bGOUe6C29Xd3rIWN8KMmGAW6QWzEsMzJ7sKqlkv6zNgL1bcL
 uM4GRRARcirtMpCrNovO6lOAFXBPcqkpjT1nrHTHwDX+I+zVXV4506qQX A==;
X-IronPort-AV: E=Sophos;i="5.92,215,1650924000"; d="scan'208";a="24625633"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 23 Jun 2022 11:04:11 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E182D280056;
 Thu, 23 Jun 2022 11:04:10 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Subject: Re: (EXT) [PATCH v5 2/2] drm: lcdif: Add support for i.MX8MP LCDIF
 variant
Date: Thu, 23 Jun 2022 11:04:08 +0200
Message-ID: <12395339.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220613213124.617021-2-marex@denx.de>
References: <20220613213124.617021-1-marex@denx.de>
 <20220613213124.617021-2-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Martyn Welch <martyn.welch@collabora.com>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 13. Juni 2022, 23:31:24 CEST schrieb Marek Vasut:
> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> completely different from the LCDIFv3 found in i.MX23 in that it has
> a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space.
> 
> Add a separate driver which is really a fork of MXSFB driver with the
> i.MX8MP LCDIF variant handling filled in.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: - Drop the pitch check from lcdif_fb_create()
>     - Drop connector caching
>     - Wait for shadow load bit to be cleared in IRQ handler
>     - Make all clock mandatory and grab them all by name
>     - Wait for EN to be cleared in lcdif_disable_controller
>     - Rename to imx-lcdif
>     - Move shadow load to atomic_flush
> V3: - Invert DE polarity to match MX8MPRM datasheet
>     - Enable CSC in RGB to YUV mode for MEDIA_BUS_FMT_UYVY8_1X16
> V4: - Drop lcdif_overlay_plane_formats, it is unused
> V5: - Add TB from Martyn
>     - Drop lcdif_fb_create in favor of drm_gem_fb_create
>     - Pull in mxsfb/ directory from drm top level Makefile
>     - Drop busy polling of CTRLDESCL0_5_SHADOW_LOAD_EN in irq handler
>     - Use devm_request_irq
>     - Drop useless dev.of_node validity check in probe
>     - Drop lcdif_*_axi_clk() prototypes
>     - Invert HS/VS polarity
>     - Drop polling from lcdif_reset_block()
>     - Add TB from Alexander
> ---
>  drivers/gpu/drm/Makefile           |   2 +-
>  drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c  | 342 ++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_drv.h  |  44 +++
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 482 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 257 +++++++++++++++
>  7 files changed, 1144 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
> 
>[...]
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c new file mode 100644
> index 0000000000000..d2f65a44889ef
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -0,0 +1,482 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>

With the current drm changes in linux-next a
> #include <drm/drm_framebuffer.h>
is needed now.

Best regards,
Alexander

> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +/* 1 second delay should be plenty of time for block reset */
> +#define RESET_TIMEOUT		1000000
> +
> +/*
> ---------------------------------------------------------------------------
> -- + * CRTC
> + */
> +static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> +			      const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->drm;
> +	const u32 format = lcdif->crtc.primary->state->fb->format->format;
> +
> +	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_RGB565,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		writel(DISP_PARA_LINE_PATTERN_RGB888,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +
> +		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> +		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> +		       lcdif->base + LCDC_V8_CSC0_COEF0);
> +		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> +		       lcdif->base + LCDC_V8_CSC0_COEF1);
> +		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> +		       lcdif->base + LCDC_V8_CSC0_COEF2);
> +		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF3);
> +		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> +		       lcdif->base + LCDC_V8_CSC0_COEF4);
> +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> +		       lcdif->base + LCDC_V8_CSC0_COEF5);
> +
> +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown media bus format 0x%x\n", 
bus_format);
> +		break;
> +	}
> +
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		writel(CTRLDESCL0_5_BPP_16_RGB565,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		writel(CTRLDESCL0_5_BPP_24_RGB888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB4444:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", 
format);
> +		break;
> +	}
> +}
> +
> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
> +{
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 ctrl = 0;
> +
> +	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> +		ctrl |= CTRL_INV_HS;
> +	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> +		ctrl |= CTRL_INV_VS;
> +	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> +		ctrl |= CTRL_INV_DE;
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		ctrl |= CTRL_INV_PXCK;
> +
> +	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +
> +	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
> +	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_DISP_SIZE);
> +
> +	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
> +	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
> +	       lcdif->base + LCDC_V8_HSYN_PARA);
> +
> +	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
> +	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
> +	       lcdif->base + LCDC_V8_VSYN_PARA);
> +
> +	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
> +	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
> +	       lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH);
> +
> +	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
> +	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> +
> +	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb-
>pitches[0]),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> +}
> +
> +static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg |= DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +}
> +
> +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg &= ~CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
> +				 reg, !(reg & CTRLDESCL0_5_EN),
> +				 0, 36000);	/* Wait ~2 
frame times max */
> +	if (ret)
> +		drm_err(lcdif->drm, "Failed to disable controller!\n");
> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg &= ~DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +}
> +
> +static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
> +{
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +	readl(lcdif->base + LCDC_V8_CTRL);
> +}
> +
> +static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> +				     struct drm_bridge_state 
*bridge_state,
> +				     const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->crtc.dev;
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 bus_flags = 0;
> +
> +	if (lcdif->bridge && lcdif->bridge->timings)
> +		bus_flags = lcdif->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)
\n",
> +			     m->crtc_clock,
> +			     (int)(clk_get_rate(lcdif->clk) / 1000));
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
> +			     bus_flags);
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
> +
> +	/* Mandatory eLCDIF reset as per the Reference Manual */
> +	lcdif_reset_block(lcdif);
> +
> +	lcdif_set_formats(lcdif, bus_format);
> +
> +	lcdif_set_mode(lcdif, bus_flags);
> +}
> +
> +static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = 
drm_atomic_get_new_crtc_state(state,
> +								
	  crtc);
> +	bool has_primary = crtc_state->plane_mask &
> +			   drm_plane_mask(crtc->primary);
> +
> +	/* The primary plane has to be enabled when the CRTC is active. */
> +	if (crtc_state->active && !has_primary)
> +		return -EINVAL;
> +
> +	return drm_atomic_add_affected_planes(state, crtc);
> +}
> +
> +static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> +				    struct drm_atomic_state 
*state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_pending_vblank_event *event;
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	event = crtc->state->event;
> +	crtc->state->event = NULL;
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (drm_crtc_vblank_get(crtc) == 0)
> +		drm_crtc_arm_vblank_event(crtc, event);
> +	else
> +		drm_crtc_send_vblank_event(crtc, event);
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state 
*state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_plane_state *new_pstate = 
drm_atomic_get_new_plane_state(state,
> +								
	    crtc->primary);
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	struct drm_bridge_state *bridge_state = NULL;
> +	struct drm_device *drm = lcdif->drm;
> +	u32 bus_format = 0;
> +	dma_addr_t paddr;
> +
> +	/* If there is a bridge attached to the LCDIF, use its bus format 
*/
> +	if (lcdif->bridge) {
> +		bridge_state =
> +			drm_atomic_get_new_bridge_state(state,
> +							
lcdif->bridge);
> +		if (!bridge_state)
> +			bus_format = MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format = bridge_state-
>input_bus_cfg.format;
> +
> +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> +			dev_warn_once(drm->dev,
> +				      "Bridge does not provide bus 
format, assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" +				      
"Please fix bridge driver by
> handling atomic_get_input_bus_fmts.\n"); +			bus_format =
> MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +	}
> +
> +	/* If all else fails, default to RGB888_1X24 */
> +	if (!bus_format)
> +		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
> +
> +	/* Write cur_buf as well to avoid an initial corrupt frame */
> +	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		
writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +	lcdif_enable_controller(lcdif);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state 
*state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_pending_vblank_event *event;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lcdif_disable_controller(lcdif);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	event = crtc->state->event;
> +	if (event) {
> +		crtc->state->event = NULL;
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
> +static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Clear and enable VBLANK IRQ */
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + 
LCDC_V8_INT_STATUS_D0);
> +	writel(INT_ENABLE_D0_VS_BLANK_EN, lcdif->base + 
LCDC_V8_INT_ENABLE_D0);
> +
> +	return 0;
> +}
> +
> +static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Disable and clear VBLANK IRQ */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + 
LCDC_V8_INT_STATUS_D0);
> +}
> +
> +static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
> +	.atomic_check = lcdif_crtc_atomic_check,
> +	.atomic_flush = lcdif_crtc_atomic_flush,
> +	.atomic_enable = lcdif_crtc_atomic_enable,
> +	.atomic_disable = lcdif_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs lcdif_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = lcdif_crtc_enable_vblank,
> +	.disable_vblank = lcdif_crtc_disable_vblank,
> +};
> +
> +/*
> ---------------------------------------------------------------------------
> -- + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/*
> ---------------------------------------------------------------------------
> -- + * Planes
> + */
> +
> +static int lcdif_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state 
*state)
> +{
> +	struct drm_plane_state *plane_state =
> drm_atomic_get_new_plane_state(state, +					
				     plane);
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +	struct drm_crtc_state *crtc_state;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state,
> +						   &lcdif-
>crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   
DRM_PLANE_HELPER_NO_SCALING,
> +						   
DRM_PLANE_HELPER_NO_SCALING,
> +						   false, 
true);
> +}
> +
> +static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> +					      struct 
drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +	struct drm_plane_state *new_pstate = 
drm_atomic_get_new_plane_state(state,
> +								
	    plane);
> +	dma_addr_t paddr;
> +
> +	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	if (paddr) {
> +		writel(lower_32_bits(paddr),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +		
writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +	}
> +}
> +
> +static bool lcdif_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
> +static const struct drm_plane_helper_funcs lcdif_plane_primary_helper_funcs
> = { +	.atomic_check = lcdif_plane_atomic_check,
> +	.atomic_update = lcdif_plane_primary_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs lcdif_plane_funcs = {
> +	.format_mod_supported	= lcdif_format_mod_supported,
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= 
drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static const u32 lcdif_primary_plane_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const u64 lcdif_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +/*
> ---------------------------------------------------------------------------
> -- + * Initialization
> + */
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif)
> +{
> +	struct drm_encoder *encoder = &lcdif->encoder;
> +	struct drm_crtc *crtc = &lcdif->crtc;
> +	int ret;
> +
> +	drm_plane_helper_add(&lcdif->planes.primary,
> +			     &lcdif_plane_primary_helper_funcs);
> +	ret = drm_universal_plane_init(lcdif->drm, &lcdif->planes.primary, 
1,
> +				       &lcdif_plane_funcs,
> +				       
lcdif_primary_plane_formats,
> +				       
ARRAY_SIZE(lcdif_primary_plane_formats),
> +				       lcdif_modifiers, 
DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
> +					&lcdif->planes.primary, 
NULL,
> +					&lcdif_crtc_funcs, 
NULL);
> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
> +				DRM_MODE_ENCODER_NONE, NULL);
> +}
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> b/drivers/gpu/drm/mxsfb/lcdif_regs.h new file mode 100644
> index 0000000000000..c70220651e3a5
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -0,0 +1,257 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIF LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_REGS_H__
> +#define __LCDIF_REGS_H__
> +
> +#define REG_SET	4
> +#define REG_CLR	8
> +
> +/* V8 register set */
> +#define LCDC_V8_CTRL			0x00
> +#define LCDC_V8_DISP_PARA		0x10
> +#define LCDC_V8_DISP_SIZE		0x14
> +#define LCDC_V8_HSYN_PARA		0x18
> +#define LCDC_V8_VSYN_PARA		0x1c
> +#define LCDC_V8_VSYN_HSYN_WIDTH		0x20
> +#define LCDC_V8_INT_STATUS_D0		0x24
> +#define LCDC_V8_INT_ENABLE_D0		0x28
> +#define LCDC_V8_INT_STATUS_D1		0x30
> +#define LCDC_V8_INT_ENABLE_D1		0x34
> +#define LCDC_V8_CTRLDESCL0_1		0x200
> +#define LCDC_V8_CTRLDESCL0_3		0x208
> +#define LCDC_V8_CTRLDESCL_LOW0_4	0x20c
> +#define LCDC_V8_CTRLDESCL_HIGH0_4	0x210
> +#define LCDC_V8_CTRLDESCL0_5		0x214
> +#define LCDC_V8_CSC0_CTRL		0x21c
> +#define LCDC_V8_CSC0_COEF0		0x220
> +#define LCDC_V8_CSC0_COEF1		0x224
> +#define LCDC_V8_CSC0_COEF2		0x228
> +#define LCDC_V8_CSC0_COEF3		0x22c
> +#define LCDC_V8_CSC0_COEF4		0x230
> +#define LCDC_V8_CSC0_COEF5		0x234
> +#define LCDC_V8_PANIC0_THRES		0x238
> +
> +#define CTRL_SFTRST			BIT(31)
> +#define CTRL_CLKGATE			BIT(30)
> +#define CTRL_BYPASS_COUNT		BIT(19)
> +#define CTRL_VSYNC_MODE			BIT(18)
> +#define CTRL_DOTCLK_MODE		BIT(17)
> +#define CTRL_DATA_SELECT		BIT(16)
> +#define CTRL_BUS_WIDTH_16		(0 << 10)
> +#define CTRL_BUS_WIDTH_8		(1 << 10)
> +#define CTRL_BUS_WIDTH_18		(2 << 10)
> +#define CTRL_BUS_WIDTH_24		(3 << 10)
> +#define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
> +#define CTRL_WORD_LENGTH_16		(0 << 8)
> +#define CTRL_WORD_LENGTH_8		(1 << 8)
> +#define CTRL_WORD_LENGTH_18		(2 << 8)
> +#define CTRL_WORD_LENGTH_24		(3 << 8)
> +#define CTRL_MASTER			BIT(5)
> +#define CTRL_DF16			BIT(3)
> +#define CTRL_DF18			BIT(2)
> +#define CTRL_DF24			BIT(1)
> +#define CTRL_RUN			BIT(0)
> +
> +#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
> +#define CTRL1_FIFO_CLEAR		BIT(21)
> +#define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
> +#define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
> +#define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
> +#define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
> +
> +#define CTRL2_SET_OUTSTANDING_REQS_1	0
> +#define CTRL2_SET_OUTSTANDING_REQS_2	(0x1 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_4	(0x2 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_8	(0x3 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_16	(0x4 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_MASK	(0x7 << 21)
> +
> +#define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
> +#define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
> +#define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
> +#define TRANSFER_COUNT_GET_HCOUNT(x)	((x) & 0xffff)
> +
> +#define VDCTRL0_ENABLE_PRESENT		BIT(28)
> +#define VDCTRL0_VSYNC_ACT_HIGH		BIT(27)
> +#define VDCTRL0_HSYNC_ACT_HIGH		BIT(26)
> +#define VDCTRL0_DOTCLK_ACT_FALLING	BIT(25)
> +#define VDCTRL0_ENABLE_ACT_HIGH		BIT(24)
> +#define VDCTRL0_VSYNC_PERIOD_UNIT	BIT(21)
> +#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	BIT(20)
> +#define VDCTRL0_HALF_LINE		BIT(19)
> +#define VDCTRL0_HALF_LINE_MODE		BIT(18)
> +#define VDCTRL0_SET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +#define VDCTRL0_GET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +
> +#define VDCTRL2_SET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +#define VDCTRL2_GET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +
> +#define VDCTRL3_MUX_SYNC_SIGNALS	BIT(29)
> +#define VDCTRL3_VSYNC_ONLY		BIT(28)
> +#define SET_HOR_WAIT_CNT(x)		(((x) & 0xfff) << 16)
> +#define GET_HOR_WAIT_CNT(x)		(((x) >> 16) & 0xfff)
> +#define SET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +#define GET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +
> +#define VDCTRL4_SET_DOTCLK_DLY(x)	(((x) & 0x7) << 29) /* v4 only */
> +#define VDCTRL4_GET_DOTCLK_DLY(x)	(((x) >> 29) & 0x7) /* v4 only */
> +#define VDCTRL4_SYNC_SIGNALS_ON		BIT(18)
> +#define SET_DOTCLK_H_VALID_DATA_CNT(x)	((x) & 0x3ffff)
> +
> +#define DEBUG0_HSYNC			BIT(26)
> +#define DEBUG0_VSYNC			BIT(25)
> +
> +#define AS_CTRL_PS_DISABLE		BIT(23)
> +#define AS_CTRL_ALPHA_INVERT		BIT(20)
> +#define AS_CTRL_ALPHA(a)		(((a) & 0xff) << 8)
> +#define AS_CTRL_FORMAT_RGB565		(0xe << 4)
> +#define AS_CTRL_FORMAT_RGB444		(0xd << 4)
> +#define AS_CTRL_FORMAT_RGB555		(0xc << 4)
> +#define AS_CTRL_FORMAT_ARGB4444		(0x9 << 4)
> +#define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
> +#define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
> +#define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
> +#define AS_CTRL_ENABLE_COLORKEY		BIT(3)
> +#define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
> +#define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
> +#define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
> +#define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
> +#define AS_CTRL_AS_ENABLE		BIT(0)
> +
> +/* V8 register set */
> +#define CTRL_SW_RESET			BIT(31)
> +#define CTRL_FETCH_START_OPTION_FPV	0
> +#define CTRL_FETCH_START_OPTION_PWV	BIT(8)
> +#define CTRL_FETCH_START_OPTION_BPV	BIT(9)
> +#define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
> +#define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
> +#define CTRL_NEG				BIT(4)
> +#define CTRL_INV_PXCK			BIT(3)
> +#define CTRL_INV_DE			BIT(2)
> +#define CTRL_INV_VS			BIT(1)
> +#define CTRL_INV_HS			BIT(0)
> +
> +#define DISP_PARA_DISP_ON		BIT(31)
> +#define DISP_PARA_SWAP_EN		BIT(30)
> +#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) | BIT(26))
> +#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888	0
> +#define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
> +#define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
> +#define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
> +#define DISP_PARA_BGND_G_MASK		GENMASK(15, 8)
> +#define DISP_PARA_BGND_B_MASK		GENMASK(7, 0)
> +
> +#define DISP_SIZE_DELTA_Y(n)		(((n) & 0xffff) << 16)
> +#define DISP_SIZE_DELTA_Y_MASK		GENMASK(31, 16)
> +#define DISP_SIZE_DELTA_X(n)		((n) & 0xffff)
> +#define DISP_SIZE_DELTA_X_MASK		GENMASK(15, 0)
> +
> +#define HSYN_PARA_BP_H(n)		(((n) & 0xffff) << 16)
> +#define HSYN_PARA_BP_H_MASK		GENMASK(31, 16)
> +#define HSYN_PARA_FP_H(n)		((n) & 0xffff)
> +#define HSYN_PARA_FP_H_MASK		GENMASK(15, 0)
> +
> +#define VSYN_PARA_BP_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_PARA_BP_V_MASK		GENMASK(31, 16)
> +#define VSYN_PARA_FP_V(n)		((n) & 0xffff)
> +#define VSYN_PARA_FP_V_MASK		GENMASK(15, 0)
> +
> +#define VSYN_HSYN_WIDTH_PW_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_HSYN_WIDTH_PW_V_MASK	GENMASK(31, 16)
> +#define VSYN_HSYN_WIDTH_PW_H(n)		((n) & 0xffff)
> +#define VSYN_HSYN_WIDTH_PW_H_MASK	GENMASK(15, 0)
> +
> +#define INT_STATUS_D0_FIFO_EMPTY	BIT(24)
> +#define INT_STATUS_D0_DMA_DONE		BIT(16)
> +#define INT_STATUS_D0_DMA_ERR		BIT(8)
> +#define INT_STATUS_D0_VS_BLANK		BIT(2)
> +#define INT_STATUS_D0_UNDERRUN		BIT(1)
> +#define INT_STATUS_D0_VSYNC		BIT(0)
> +
> +#define INT_ENABLE_D0_FIFO_EMPTY_EN	BIT(24)
> +#define INT_ENABLE_D0_DMA_DONE_EN	BIT(16)
> +#define INT_ENABLE_D0_DMA_ERR_EN	BIT(8)
> +#define INT_ENABLE_D0_VS_BLANK_EN	BIT(2)
> +#define INT_ENABLE_D0_UNDERRUN_EN	BIT(1)
> +#define INT_ENABLE_D0_VSYNC_EN		BIT(0)
> +
> +#define INT_STATUS_D1_PLANE_PANIC	BIT(0)
> +
> +#define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
> +
> +#define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
> +#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
> +#define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL0_3_PITCH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_3_PITCH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH(n)	((n) & 0xf)
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH_MASK	GENMASK(3, 0)
> +
> +#define CTRLDESCL0_5_EN			BIT(31)
> +#define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
> +#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
> +#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
> +#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
> +#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))
> +#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
> +#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
> +#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
> +#define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
> +#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
> +#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
> +#define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
> +
> +#define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
> +#define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
> +#define CSC0_CTRL_BYPASS		BIT(0)
> +
> +#define CSC0_COEF0_A2(n)		(((n) << 16) & CSC0_COEF0_A2_MASK)
> +#define CSC0_COEF0_A2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF0_A1(n)		((n) & CSC0_COEF0_A1_MASK)
> +#define CSC0_COEF0_A1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF1_B1(n)		(((n) << 16) & CSC0_COEF1_B1_MASK)
> +#define CSC0_COEF1_B1_MASK		GENMASK(26, 16)
> +#define CSC0_COEF1_A3(n)		((n) & CSC0_COEF1_A3_MASK)
> +#define CSC0_COEF1_A3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF2_B3(n)		(((n) << 16) & CSC0_COEF2_B3_MASK)
> +#define CSC0_COEF2_B3_MASK		GENMASK(26, 16)
> +#define CSC0_COEF2_B2(n)		((n) & CSC0_COEF2_B2_MASK)
> +#define CSC0_COEF2_B2_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF3_C2(n)		(((n) << 16) & CSC0_COEF3_C2_MASK)
> +#define CSC0_COEF3_C2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF3_C1(n)		((n) & CSC0_COEF3_C1_MASK)
> +#define CSC0_COEF3_C1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF4_D1(n)		(((n) << 16) & CSC0_COEF4_D1_MASK)
> +#define CSC0_COEF4_D1_MASK		GENMASK(24, 16)
> +#define CSC0_COEF4_C3(n)		((n) & CSC0_COEF4_C3_MASK)
> +#define CSC0_COEF4_C3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF5_D3(n)		(((n) << 16) & CSC0_COEF5_D3_MASK)
> +#define CSC0_COEF5_D3_MASK		GENMASK(24, 16)
> +#define CSC0_COEF5_D2(n)		((n) & CSC0_COEF5_D2_MASK)
> +#define CSC0_COEF5_D2_MASK		GENMASK(8, 0)
> +
> +#define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
> +#define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +
> +#define LCDIF_MIN_XRES			120
> +#define LCDIF_MIN_YRES			120
> +#define LCDIF_MAX_XRES			0xffff
> +#define LCDIF_MAX_YRES			0xffff
> +
> +#endif /* __LCDIF_REGS_H__ */




