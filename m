Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216C26403A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 10:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849146E351;
	Thu, 10 Sep 2020 08:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D176E34D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 08:40:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so4943953wmm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QJl2kVGKBurGSGdyCzUB4dBTidSg2F/ilTxUn9OqInA=;
 b=kUUrSRhVrF3dWOB0z8a0SooUiAjD9/AumAU/LWHxWKy4d2ITXqIEETj19xglrqQOX4
 ajT74Oy0RcqB2V6uw6l/UVUYHkUC/LCMpP4T3YvRMPG0Dq7S4EodEljkbnt20NMud2KJ
 qN4V9O4voR39Be5aN28ZkIL5YmsGCFua7QnJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QJl2kVGKBurGSGdyCzUB4dBTidSg2F/ilTxUn9OqInA=;
 b=RUETp4eVIDilBuXkM3z7hisQKONp7qs5yzDwjYIkcoczaV+hxhjwEf+Ai4l/63jukq
 nYFVhxXB27EaH1siVVipVYQ5B7MAzePpH5Ukvvxa07/Nj6np+vdGG2S9ZcCMsfpg1OrM
 w/uzsgVZ3C/HQ4lGUQKVBkKFRFvgKXxU/WA8/cW5Cv2Hnhtavkc5/vqK0sKzvUgC+u8O
 /dFohpF1TAcbQflHCcUkzSd+a4by1v4d2RplGaIaXP7oaclqZMdyteDZ+fvVNzX9P++6
 1q0OWOL7n7Iv7sD5nhf/714lK32kRCaoPOBU1yiucAxlpbVOP3OlNDnknAG6Zr0toWqw
 zz3g==
X-Gm-Message-State: AOAM532jyG2DmLlV6EYnAjBQjrVnj+S3EDaOGB1tNdiqJMwKIpnvTmaU
 YnaE5M7EQlxmvkuVyew2TnL+Gg==
X-Google-Smtp-Source: ABdhPJxW4k6k4YLnBcP0T7ykIklwAeKGlBuICEzglL7fMVpZW7mJ2pmJ1jvgDwGdaYm/aKlQFN5/Fw==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr7236784wma.156.1599727230497; 
 Thu, 10 Sep 2020 01:40:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s5sm8113316wrm.33.2020.09.10.01.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:40:29 -0700 (PDT)
Date: Thu, 10 Sep 2020 10:40:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200910084028.GJ438822@phenom.ffwll.local>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: daniel.vetter@intel.com, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 01:02:50PM -0700, Anitha Chrisanthus wrote:
> This is a basic KMS atomic modesetting display driver for KeemBay family =
of
> SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> driver at the connector level.
> =

> Single CRTC with LCD controller->mipi DSI-> ADV bridge
> =

> Only 1080p resolution and single plane is supported at this time.
> =

> v2: moved extern to .h, removed license text
>     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.(Sam)
> =

> v3: Squashed all 59 commits to one
> =

> v4: review changes from Sam Ravnborg
> 	renamed dev_p to kmb
> 	moved clocks under kmb_clock, consolidated clk initializations
> 	use drmm functions
> 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> =

> v5: corrected spellings
> v6: corrected checkpatch warnings
> v7: review changes Sam Ravnborg and Thomas Zimmerman
> 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> 	renamed mode_set, kmb_load, inlined unload (Thomas)
> 	moved remaining logging to drm_*(Thomas)
> 	re-orged driver initialization (Thomas)
> 	moved plane_status to drm_private (Sam)
> 	removed unnecessary logs and defines and ifdef codes (Sam)
> 	call helper_check in plane_atomic_check (Sam)
> 	renamed set to get for bpp and format functions(Sam)
> 	use drm helper functions for reset, duplicate/destroy state instead
> 	of kmb functions (Sam)
> 	removed kmb_priv from kmb_plane and removed kmb_plane_state (Sam)
> =

> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
>  drivers/gpu/drm/kmb/kmb_drv.c   | 676 ++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.c | 480 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
>  5 files changed, 1660 insertions(+)
>  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
>  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> =

> diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crt=
c.c
> new file mode 100644
> index 0000000..a684331
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_data/simplefb.h>
> +
> +#include <video/videomode.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "kmb_drv.h"
> +#include "kmb_dsi.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +struct kmb_crtc_timing {
> +	u32 vfront_porch;
> +	u32 vback_porch;
> +	u32 vsync_len;
> +	u32 hfront_porch;
> +	u32 hback_porch;
> +	u32 hsync_len;
> +};
> +
> +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	/* Clear interrupt */
> +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +	/* Set which interval to generate vertical interrupt */
> +	kmb_write_lcd(kmb, LCD_VSTATUS_COMPARE,
> +		      LCD_VSTATUS_COMPARE_VSYNC);
> +	/* Enable vertical interrupt */
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +	return 0;
> +}
> +
> +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	/* Clear interrupt */
> +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +	/* Disable vertical interrupt */
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +}
> +
> +static const struct drm_crtc_funcs kmb_crtc_funcs =3D {
> +	.destroy =3D drm_crtc_cleanup,
> +	.set_config =3D drm_atomic_helper_set_config,
> +	.page_flip =3D drm_atomic_helper_page_flip,
> +	.reset =3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank =3D kmb_crtc_enable_vblank,
> +	.disable_vblank =3D kmb_crtc_disable_vblank,
> +};
> +
> +static void kmb_crtc_set_mode(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct drm_display_mode *m =3D &crtc->state->adjusted_mode;
> +	struct kmb_crtc_timing vm;
> +	int vsync_start_offset;
> +	int vsync_end_offset;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +	unsigned int val =3D 0;
> +
> +	/* Initialize mipi */
> +	kmb_dsi_hw_init(dev, m);
> +	drm_info(dev,
> +		 "vfp=3D %d vbp=3D %d vsyc_len=3D%d hfp=3D%d hbp=3D%d hsync_len=3D%d\n=
",
> +		 m->crtc_vsync_start - m->crtc_vdisplay,
> +		 m->crtc_vtotal - m->crtc_vsync_end,
> +		 m->crtc_vsync_end - m->crtc_vsync_start,
> +		 m->crtc_hsync_start - m->crtc_hdisplay,
> +		 m->crtc_htotal - m->crtc_hsync_end,
> +		 m->crtc_hsync_end - m->crtc_hsync_start);
> +	val =3D kmb_read_lcd(kmb, LCD_INT_ENABLE);
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, ~0x0);
> +	vm.vfront_porch =3D 2;
> +	vm.vback_porch =3D 2;
> +	vm.vsync_len =3D 8;
> +	vm.hfront_porch =3D 0;
> +	vm.hback_porch =3D 0;
> +	vm.hsync_len =3D 28;
> +
> +	vsync_start_offset =3D  m->crtc_vsync_start -  m->crtc_hsync_start;
> +	vsync_end_offset =3D  m->crtc_vsync_end - m->crtc_hsync_end;
> +
> +	drm_dbg(dev, "%s : %dactive height=3D %d vbp=3D%d vfp=3D%d vsync-w=3D%d=
 h-active=3D%d h-bp=3D%d h-fp=3D%d hysnc-l=3D%d",
> +		__func__, __LINE__,
> +			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
> +			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> +			vm.hfront_porch, vm.hsync_len);
> +	kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
> +		      m->crtc_vdisplay - 1);
> +	kmb_write_lcd(kmb, LCD_V_BACKPORCH, vm.vback_porch);
> +	kmb_write_lcd(kmb, LCD_V_FRONTPORCH, vm.vfront_porch);
> +	kmb_write_lcd(kmb, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> +	kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
> +		      m->crtc_hdisplay - 1);
> +	kmb_write_lcd(kmb, LCD_H_BACKPORCH, vm.hback_porch);
> +	kmb_write_lcd(kmb, LCD_H_FRONTPORCH, vm.hfront_porch);
> +	kmb_write_lcd(kmb, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> +	/* This is hardcoded as 0 in the Myriadx code */
> +	kmb_write_lcd(kmb, LCD_VSYNC_START, 0);
> +	kmb_write_lcd(kmb, LCD_VSYNC_END, 0);
> +	/* Back ground color */
> +	kmb_write_lcd(kmb, LCD_BG_COLOUR_LS, 0x4);
> +	if (m->flags =3D=3D DRM_MODE_FLAG_INTERLACE) {
> +		kmb_write_lcd(kmb,
> +			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
> +		kmb_write_lcd(kmb,
> +			      LCD_V_BACKPORCH_EVEN, vm.vback_porch);
> +		kmb_write_lcd(kmb,
> +			      LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);
> +		kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT_EVEN,
> +			      m->crtc_vdisplay - 1);
> +		/* This is hardcoded as 10 in the Myriadx code */
> +		kmb_write_lcd(kmb, LCD_VSYNC_START_EVEN, 10);
> +		kmb_write_lcd(kmb, LCD_VSYNC_END_EVEN, 10);
> +	}
> +	kmb_write_lcd(kmb, LCD_TIMING_GEN_TRIG, ENABLE);
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_ENABLE);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> +}
> +
> +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *old_state)
> +{
> +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> +
> +	clk_prepare_enable(lcd->clk);
> +	kmb_crtc_set_mode(crtc);
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *old_state)
> +{
> +	struct kmb_drm_private *lcd =3D crtc_to_kmb_priv(crtc);
> +
> +	/* due to hw limitations, planes need to be off when crtc is off */
> +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> +
> +	drm_crtc_vblank_off(crtc);
> +	clk_disable_unprepare(lcd->clk);
> +}
> +
> +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *state)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +}
> +
> +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> +				  struct drm_crtc_state *state)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +			    LCD_INT_VERT_COMP);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event)
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +	crtc->state->event =3D NULL;
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs =3D {
> +	.atomic_begin =3D kmb_crtc_atomic_begin,
> +	.atomic_enable =3D kmb_crtc_atomic_enable,
> +	.atomic_disable =3D kmb_crtc_atomic_disable,
> +	.atomic_flush =3D kmb_crtc_atomic_flush,
> +};
> +
> +int kmb_setup_crtc(struct drm_device *drm)
> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +	struct kmb_plane *primary;
> +	int ret;
> +
> +	primary =3D kmb_plane_init(drm);
> +	if (IS_ERR(primary))
> +		return PTR_ERR(primary);
> +
> +	ret =3D drm_crtc_init_with_planes(drm, &kmb->crtc, &primary->base_plane,
> +					NULL, &kmb_crtc_funcs, NULL);
> +	if (ret) {
> +		kmb_plane_destroy(&primary->base_plane);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&kmb->crtc, &kmb_crtc_helper_funcs);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> new file mode 100644
> index 0000000..e413099
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -0,0 +1,676 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/console.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_irq.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "kmb_drv.h"
> +#include "kmb_dsi.h"
> +#include "kmb_regs.h"
> +
> +int kmb_under_flow =3D 0, kmb_flush_done =3D 0, layer_no =3D 0;
> +static struct kmb_clock kmb_clk;
> +
> +static struct drm_bridge *adv_bridge;
> +
> +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_lcd);
> +	if (ret) {
> +		drm_err(&kmb->drm, "Failed to enable LCD clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi);
> +	if (ret) {
> +		drm_err(&kmb->drm, "Failed to enable MIPI clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_ecfg);
> +	if (ret) {
> +		drm_err(&kmb->drm,
> +			"Failed to enable MIPI_ECFG clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(kmb_clk.clk_mipi_cfg);
> +	if (ret) {
> +		drm_err(&kmb->drm,
> +			"Failed to enable MIPI_CFG clock: %d\n", ret);
> +		return ret;
> +	}
> +	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> +	return 0;
> +}
> +
> +int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device *de=
v)
> +{
> +	struct device_node *vpu_dev;
> +	unsigned long clk;
> +	int ret =3D 0;
> +
> +	kmb_clk.clk_lcd =3D clk_get(dev, "clk_lcd");
> +	if (IS_ERR(kmb_clk.clk_lcd)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
> +		return PTR_ERR(kmb_clk.clk_lcd);
> +	}
> +
> +	kmb_clk.clk_mipi =3D clk_get(dev, "clk_mipi");
> +	if (IS_ERR(kmb_clk.clk_mipi)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi\n");
> +		return PTR_ERR(kmb_clk.clk_mipi);
> +	}
> +
> +	kmb_clk.clk_mipi_ecfg =3D clk_get(dev, "clk_mipi_ecfg");
> +	if (IS_ERR(kmb_clk.clk_mipi_ecfg)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_ecfg\n");
> +		return PTR_ERR(kmb_clk.clk_mipi_ecfg);
> +	}
> +
> +	kmb_clk.clk_mipi_cfg =3D clk_get(dev, "clk_mipi_cfg");
> +	if (IS_ERR(kmb_clk.clk_mipi_cfg)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_cfg\n");
> +		return PTR_ERR(kmb_clk.clk_mipi_cfg);
> +	}
> +	vpu_dev =3D of_find_node_by_path("/soc/vpu-ipc");
> +	kmb_clk.clk_pll0 =3D of_clk_get_by_name(vpu_dev, "pll_0_out_0");
> +	if (IS_ERR(kmb_clk.clk_pll0)) {
> +		drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
> +		return PTR_ERR(kmb_clk.clk_pll0);
> +	}
> +	kmb->sys_clk_mhz =3D clk_get_rate(kmb_clk.clk_pll0) / 1000000;
> +	drm_info(&kmb->drm, "system clk =3D %d Mhz", kmb->sys_clk_mhz);
> +
> +	/* Set LCD clock to 200 Mhz */
> +	clk_set_rate(kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
> +	if (clk_get_rate(kmb_clk.clk_lcd) !=3D KMB_LCD_DEFAULT_CLK) {
> +		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
> +			KMB_LCD_DEFAULT_CLK);
> +		return -1;
> +	}
> +	drm_dbg(&kmb->drm, "clk_lcd =3D %ld\n", clk_get_rate(kmb_clk.clk_lcd));
> +
> +	/* Set MIPI clock to 24 Mhz */
> +	clk_set_rate(kmb_clk.clk_mipi, KMB_MIPI_DEFAULT_CLK);
> +	if (clk_get_rate(kmb_clk.clk_mipi) !=3D KMB_MIPI_DEFAULT_CLK) {
> +		drm_err(&kmb->drm, "failed to set to clk_mipi to %d\n",
> +			KMB_MIPI_DEFAULT_CLK);
> +		return -1;
> +	}
> +	drm_dbg(&kmb->drm, "clk_mipi =3D %ld\n", clk_get_rate(kmb_clk.clk_mipi)=
);
> +
> +	clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +		/* Set MIPI_ECFG clock to 24 Mhz */
> +		clk_set_rate(kmb_clk.clk_mipi_ecfg, KMB_MIPI_DEFAULT_CFG_CLK);
> +		clk =3D clk_get_rate(kmb_clk.clk_mipi_ecfg);
> +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +			drm_err(&kmb->drm,
> +				"failed to set to clk_mipi_ecfg to %d\n",
> +				 KMB_MIPI_DEFAULT_CFG_CLK);
> +			return -1;
> +		}
> +	}
> +
> +	clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> +	if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +		/* Set MIPI_CFG clock to 24 Mhz */
> +		clk_set_rate(kmb_clk.clk_mipi_cfg, 24000000);
> +		clk =3D clk_get_rate(kmb_clk.clk_mipi_cfg);
> +		if (clk !=3D KMB_MIPI_DEFAULT_CFG_CLK) {
> +			drm_err(&kmb->drm,
> +				"failed to set clk_mipi_cfg to %d\n",
> +				  KMB_MIPI_DEFAULT_CFG_CLK);
> +			return -1;
> +		}
> +	}
> +
> +	ret =3D kmb_display_clk_enable(kmb);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> +	kmb_set_bitmask_msscam(kmb, MSS_CAM_CLK_CTRL, 0x1fff);
> +	kmb_set_bitmask_msscam(kmb, MSS_CAM_RSTN_CTRL, 0xffffffff);
> +	return 0;
> +}
> +
> +static int kmb_display_clk_disable(void)
> +{
> +	if (kmb_clk.clk_lcd)
> +		clk_disable_unprepare(kmb_clk.clk_lcd);
> +	if (kmb_clk.clk_mipi)
> +		clk_disable_unprepare(kmb_clk.clk_mipi);
> +	if (kmb_clk.clk_mipi_ecfg)
> +		clk_disable_unprepare(kmb_clk.clk_mipi_ecfg);
> +	if (kmb_clk.clk_mipi_cfg)
> +		clk_disable_unprepare(kmb_clk.clk_mipi_cfg);
> +	return 0;
> +}
> +
> +static void __iomem *kmb_map_mmio(struct drm_device *drm, char *name)
> +{
> +	struct resource *res;
> +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	void __iomem *mem;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!res) {
> +		drm_err(drm, "failed to get resource for %s", name);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	mem =3D devm_ioremap_resource(drm->dev, res);
> +	if (IS_ERR(mem))
> +		drm_err(drm, "failed to ioremap %s registers", name);
> +	return mem;
> +}
> +
> +static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +	struct platform_device *pdev =3D to_platform_device(drm->dev);
> +	int irq_lcd;
> +	int ret =3D 0;
> +
> +	/* Map LCD MMIO registers */
> +	kmb->lcd_mmio =3D kmb_map_mmio(drm, "lcd_regs");
> +	if (IS_ERR(kmb->lcd_mmio)) {
> +		drm_err(&kmb->drm, "failed to map LCD registers\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Map MIPI MMIO registers */
> +	kmb->mipi_mmio =3D kmb_map_mmio(drm, "mipi_regs");
> +	if (IS_ERR(kmb->mipi_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MIPI registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		return -ENOMEM;
> +	}
> +
> +	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> +	 * MSS_CAM_CLK_CTRL register
> +	 */
> +	kmb->msscam_mmio =3D kmb_map_mmio(drm, "msscam_regs");
> +	if (IS_ERR(kmb->msscam_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MSSCAM registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		iounmap(kmb->mipi_mmio);
> +		return -ENOMEM;
> +	}
> +
> +	if (IS_ERR(kmb->msscam_mmio)) {
> +		drm_err(&kmb->drm, "failed to map MSSCAM registers\n");
> +		iounmap(kmb->lcd_mmio);
> +		iounmap(kmb->mipi_mmio);
> +		return -ENOMEM;
> +	}
> +	/* Enable display clocks */
> +	kmb_initialize_clocks(kmb, &pdev->dev);
> +
> +	/* Register irqs here - section 17.3 in databook
> +	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
> +	 * firmware has redirected 79 to A53 IRQ 33
> +	 */
> +
> +	/* Allocate LCD interrupt resources */
> +	irq_lcd =3D platform_get_irq_byname(pdev, "irq_lcd");
> +	if (irq_lcd < 0) {
> +		drm_err(&kmb->drm, "irq_lcd not found");
> +		goto setup_fail;
> +	}
> +
> +	/* Get the optional framebuffer memory resource */
> +	ret =3D of_reserved_mem_device_init(drm->dev);
> +	if (ret && ret !=3D -ENODEV)
> +		return ret;
> +
> +	spin_lock_init(&kmb->irq_lock);
> +
> +	kmb->irq_lcd =3D irq_lcd;
> +
> +	return 0;
> +
> + setup_fail:
> +	of_reserved_mem_device_release(drm->dev);
> +
> +	return ret;
> +}
> +
> +static const struct drm_mode_config_funcs kmb_mode_config_funcs =3D {
> +	.fb_create =3D drm_gem_fb_create,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static int kmb_setup_mode_config(struct drm_device *drm)
> +{
> +	int ret;
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +	drm->mode_config.min_width =3D KMB_MIN_WIDTH;
> +	drm->mode_config.min_height =3D KMB_MIN_HEIGHT;
> +	drm->mode_config.max_width =3D KMB_MAX_WIDTH;
> +	drm->mode_config.max_height =3D KMB_MAX_HEIGHT;
> +	drm->mode_config.funcs =3D &kmb_mode_config_funcs;
> +
> +	ret =3D kmb_setup_crtc(drm);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to create crtc\n");
> +		return ret;
> +	}
> +
> +	/* Initialize MIPI DSI */
> +	ret =3D kmb_dsi_init(drm, adv_bridge);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize DSI\n");
> +		return ret;
> +	}
> +
> +	/* Set the CRTC's port so that the encoder component can find it */
> +	kmb->crtc.port =3D of_graph_get_port_by_id(drm->dev->of_node, 0);
> +	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to initialize vblank\n");
> +		pm_runtime_disable(drm->dev);
> +		return ret;
> +	}
> +
> +	drm_mode_config_reset(drm);
> +	return 0;
> +}
> +
> +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> +{
> +	unsigned long status, val, val1;
> +	int plane_id, dma0_state, dma1_state;
> +	struct kmb_drm_private *kmb =3D to_kmb(dev);
> +
> +	status =3D kmb_read_lcd(kmb, LCD_INT_STATUS);
> +
> +	if (status & LCD_INT_EOF) {
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF);
> +
> +		/* When disabling/enabling LCD layers, the change takes effect
> +		 * immediately and does not wait for EOF (end of frame).
> +		 * When kmb_plane_atomic_disable is called, mark the plane as
> +		 * disabled but actually disable the plane when EOF irq is
> +		 * being handled.
> +		 */
> +		for (plane_id =3D LAYER_0;
> +				plane_id < KMB_MAX_PLANES; plane_id++) {
> +			if (kmb->plane_status[plane_id].disable) {
> +				kmb_clr_bitmask_lcd(kmb,
> +						    LCD_LAYERn_DMA_CFG
> +						    (plane_id),
> +						    LCD_DMA_LAYER_ENABLE);
> +
> +				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> +						    kmb->plane_status[plane_id].ctrl);
> +
> +				kmb->plane_status[plane_id].disable =3D false;
> +			}
> +		}
> +		if (kmb_under_flow) {
> +			/* DMA Recovery after underflow */
> +			dma0_state =3D (layer_no =3D=3D 0) ?
> +			    LCD_VIDEO0_DMA0_STATE : LCD_VIDEO1_DMA0_STATE;
> +			dma1_state =3D (layer_no =3D=3D 0) ?
> +			    LCD_VIDEO0_DMA1_STATE : LCD_VIDEO1_DMA1_STATE;
> +
> +			do {
> +				kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> +				val =3D kmb_read_lcd(kmb, dma0_state)
> +				    & LCD_DMA_STATE_ACTIVE;
> +				val1 =3D kmb_read_lcd(kmb, dma1_state)
> +				    & LCD_DMA_STATE_ACTIVE;
> +			} while ((val || val1));
> +			/* disable dma */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(layer_no),
> +					    LCD_DMA_LAYER_ENABLE);
> +			kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> +			kmb_flush_done =3D 1;
> +			kmb_under_flow =3D 0;
> +		}
> +	}
> +
> +	if (status & LCD_INT_LINE_CMP) {
> +		/* clear line compare interrupt */
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
> +	}
> +
> +	if (status & LCD_INT_VERT_COMP) {
> +		/* Read VSTATUS */
> +		val =3D kmb_read_lcd(kmb, LCD_VSTATUS);
> +		val =3D (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> +		switch (val) {
> +		case LCD_VSTATUS_COMPARE_VSYNC:
> +			/* Clear vertical compare interrupt */
> +			kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +			if (kmb_flush_done) {
> +				kmb_set_bitmask_lcd(kmb,
> +						    LCD_LAYERn_DMA_CFG
> +						    (layer_no),
> +						    LCD_DMA_LAYER_ENABLE);
> +				kmb_flush_done =3D 0;
> +			}
> +			drm_handle_vblank(dev, 0);
> +			break;
> +		case LCD_VSTATUS_COMPARE_BACKPORCH:
> +		case LCD_VSTATUS_COMPARE_ACTIVE:
> +		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> +			kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> +			break;
> +		}
> +	}
> +	if (status & LCD_INT_DMA_ERR) {
> +		val =3D
> +		    (status & LCD_INT_DMA_ERR &
> +		     kmb_read_lcd(kmb, LCD_INT_ENABLE));
> +		/* LAYER0 - VL0 */
> +		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> +			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> +			kmb_under_flow++;
> +			drm_info(&kmb->drm,
> +				 "!LAYER0:VL0 DMA UNDERFLOW val =3D 0x%lx,under_flow=3D%d",
> +			     val, kmb_under_flow);
> +			/* disable underflow interrupt */
> +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +					    LAYER0_DMA_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
> +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> +					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_FIFO_UNDERFLOW |
> +					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
> +			/* disable auto restart mode */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(0),
> +					    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> +			layer_no =3D 0;
> +		}
> +
> +		if (val & LAYER0_DMA_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER0:VL0 DMA OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER0:VL0 DMA CB OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER0:VL0 DMA CR OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER1 - VL1 */
> +		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> +			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> +			kmb_under_flow++;
> +			drm_info(&kmb->drm,
> +				 "!LAYER1:VL1 DMA UNDERFLOW val =3D 0x%lx, under_flow=3D%d",
> +			     val, kmb_under_flow);
> +			/* disable underflow interrupt */
> +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> +					    LAYER1_DMA_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
> +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> +					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_FIFO_UNDERFLOW |
> +					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
> +			/* disable auto restart mode */
> +			kmb_clr_bitmask_lcd(kmb, LCD_LAYERn_DMA_CFG(1),
> +					    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> +			layer_no =3D 1;
> +		}
> +
> +		/* LAYER1 - VL1 */
> +		if (val & LAYER1_DMA_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER1:VL1 DMA OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER1:VL1 DMA CB OVERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER1:VL1 DMA CR OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER2 - GL0 */
> +		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER2:GL0 DMA UNDERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER2_DMA_FIFO_OVERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER2:GL0 DMA OVERFLOW val =3D 0x%lx", val);
> +
> +		/* LAYER3 - GL1 */
> +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER3:GL1 DMA UNDERFLOW val =3D 0x%lx", val);
> +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> +			drm_dbg(&kmb->drm,
> +				"LAYER3:GL1 DMA OVERFLOW val =3D 0x%lx", val);
> +	}
> +
> +	if (status & LCD_INT_LAYER) {
> +		/* Clear layer interrupts */
> +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LAYER);
> +	}
> +
> +	/* Clear all interrupts */
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, 1);
> +	return IRQ_HANDLED;
> +}
> +
> +/* IRQ handler */
> +static irqreturn_t kmb_isr(int irq, void *arg)
> +{
> +	struct drm_device *dev =3D (struct drm_device *)arg;
> +
> +	handle_lcd_irq(dev);
> +	return IRQ_HANDLED;
> +}
> +
> +static void kmb_irq_reset(struct drm_device *drm)
> +{
> +	kmb_write_lcd(to_kmb(drm), LCD_INT_CLEAR, 0xFFFF);
> +	kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(fops);
> +
> +static struct drm_driver kmb_driver =3D {
> +	.driver_features =3D DRIVER_GEM |
> +	    DRIVER_MODESET | DRIVER_ATOMIC,
> +	.irq_handler =3D kmb_isr,
> +	.irq_preinstall =3D kmb_irq_reset,
> +	.irq_uninstall =3D kmb_irq_reset,
> +	/* GEM Operations */
> +	.fops =3D &fops,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> +	.name =3D "kmb-drm",
> +	.desc =3D "KEEMBAY DISPLAY DRIVER ",
> +	.date =3D "20190122",
> +	.major =3D 1,
> +	.minor =3D 0,
> +};
> +
> +static int kmb_remove(struct platform_device *pdev)

Missed this in my first reply:

- You shold call drm_atomic_helper_shutdown here after unregistering the
  driver. Otherwise there's going to be all kinds of leaks and issue.

- Please use devm_ functions so you don't have to hand-roll so much of the
  hw cleanup code.

Cheers, Daniel
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +
> +	drm_dev_unregister(drm);
> +	drm_kms_helper_poll_fini(drm);
> +	of_node_put(kmb->crtc.port);
> +	kmb->crtc.port =3D NULL;
> +	pm_runtime_get_sync(drm->dev);
> +	drm_irq_uninstall(drm);
> +	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
> +
> +	of_reserved_mem_device_release(drm->dev);
> +
> +	/* Release clks */
> +	kmb_display_clk_disable();
> +	clk_put(kmb_clk.clk_lcd);
> +	clk_put(kmb_clk.clk_mipi);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +	/* Unregister DSI host */
> +	kmb_dsi_host_unregister();
> +	return 0;
> +}
> +
> +static int kmb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D get_device(&pdev->dev);
> +	struct kmb_drm_private *kmb;
> +	int ret =3D 0;
> +
> +	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> +	 * has a mipi_dsi_host to register its device to. So, we
> +	 * first register the DSI host during probe time, and then return
> +	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called again
> +	 *  and then the rest of the driver initialization can proceed
> +	 *  afterwards and the bridge can be successfully attached.
> +	 */
> +	adv_bridge =3D kmb_dsi_host_bridge_init(dev);
> +
> +	if (adv_bridge =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(adv_bridge)) {
> +		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> +		return PTR_ERR(adv_bridge);
> +	}
> +
> +	/* Create DRM device */
> +	kmb =3D devm_drm_dev_alloc(dev, &kmb_driver,
> +				 struct kmb_drm_private, drm);
> +	if (IS_ERR(kmb))
> +		return PTR_ERR(kmb);
> +
> +	dev_set_drvdata(dev, &kmb->drm);
> +
> +	ret =3D kmb_hw_init(&kmb->drm, 0);
> +	if (ret)
> +		goto err_free1;
> +
> +	ret =3D kmb_setup_mode_config(&kmb->drm);
> +	if (ret)
> +		goto err_free;
> +
> +	ret =3D drm_irq_install(&kmb->drm, kmb->irq_lcd);
> +	if (ret < 0) {
> +		drm_err(&kmb->drm, "failed to install IRQ handler\n");
> +		goto err_irq;
> +	}
> +
> +	drm_kms_helper_poll_init(&kmb->drm);
> +
> +	/* Register graphics device with the kernel */
> +	ret =3D drm_dev_register(&kmb->drm, 0);
> +	if (ret)
> +		goto err_register;
> +
> +	return 0;
> +
> + err_register:
> +	drm_kms_helper_poll_fini(&kmb->drm);
> + err_irq:
> +	pm_runtime_disable(kmb->drm.dev);
> + err_free:
> +	drm_crtc_cleanup(&kmb->crtc);
> +	drm_mode_config_cleanup(&kmb->drm);
> + err_free1:
> +	dev_set_drvdata(dev, NULL);
> +	kmb_dsi_host_unregister();
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id kmb_of_match[] =3D {
> +	{.compatible =3D "intel,kmb_display"},
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, kmb_of_match);
> +
> +static int __maybe_unused kmb_pm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> +
> +	drm_kms_helper_poll_disable(drm);
> +
> +	kmb->state =3D drm_atomic_helper_suspend(drm);
> +	if (IS_ERR(kmb->state)) {
> +		drm_kms_helper_poll_enable(drm);
> +		return PTR_ERR(kmb->state);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused kmb_pm_resume(struct device *dev)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(dev);
> +	struct kmb_drm_private *kmb =3D drm ? to_kmb(drm) : NULL;
> +
> +	if (!kmb)
> +		return 0;
> +
> +	drm_atomic_helper_resume(drm, kmb->state);
> +	drm_kms_helper_poll_enable(drm);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
> +
> +static struct platform_driver kmb_platform_driver =3D {
> +	.probe =3D kmb_probe,
> +	.remove =3D kmb_remove,
> +	.driver =3D {
> +		.name =3D "kmb-drm",
> +		.pm =3D &kmb_pm_ops,
> +		.of_match_table =3D kmb_of_match,
> +	},
> +};
> +
> +module_platform_driver(kmb_platform_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Keembay Display driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
> new file mode 100644
> index 0000000..352f2d2
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> @@ -0,0 +1,170 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_DRV_H__
> +#define __KMB_DRV_H__
> +
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +#define KMB_MAX_WIDTH			1920 /*max width in pixels */
> +#define KMB_MAX_HEIGHT			1080 /*max height in pixels */
> +#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
> +#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
> +#define KMB_LCD_DEFAULT_CLK		200000000
> +#define KMB_MIPI_DEFAULT_CLK		24000000
> +#define KMB_MIPI_DEFAULT_CFG_CLK	24000000
> +#define KMB_SYS_CLK_MHZ			500
> +
> +#define ICAM_MMIO		0x3b100000
> +#define ICAM_LCD_OFFSET		0x1080
> +#define ICAM_MMIO_SIZE		0x2000
> +
> +struct kmb_drm_private {
> +	struct drm_device		drm;
> +	void __iomem			*lcd_mmio;
> +	void __iomem			*mipi_mmio;
> +	void __iomem			*msscam_mmio;
> +	struct clk			*clk;
> +	struct drm_crtc			crtc;
> +	struct kmb_plane		*plane;
> +	struct drm_atomic_state		*state;
> +	spinlock_t			irq_lock;
> +	int				irq_lcd;
> +	int				irq_mipi;
> +	int				sys_clk_mhz;
> +	dma_addr_t			fb_addr;
> +	struct layer_status		plane_status[KMB_MAX_PLANES];
> +};
> +
> +struct kmb_clock {
> +	struct clk *clk_lcd;
> +	struct clk *clk_mipi;
> +	struct clk *clk_mipi_ecfg;
> +	struct clk *clk_mipi_cfg;
> +	struct clk *clk_pll0;
> +};
> +
> +static inline struct kmb_drm_private *to_kmb(const struct drm_device *de=
v)
> +{
> +	return container_of(dev, struct kmb_drm_private, drm);
> +}
> +
> +static inline struct kmb_drm_private *crtc_to_kmb_priv(const struct drm_=
crtc *x)
> +{
> +	return container_of(x, struct kmb_drm_private, crtc);
> +}
> +
> +struct blt_layer_config {
> +	unsigned char layer_format;
> +};
> +
> +static inline void kmb_write_lcd(struct kmb_drm_private *dev_p,
> +				 unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->lcd_mmio + reg));
> +}
> +
> +static inline void kmb_write_mipi(struct kmb_drm_private *dev_p,
> +				  unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->mipi_mmio + reg));
> +}
> +
> +static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 value)
> +{
> +	writel(value, (dev_p->msscam_mmio + reg));
> +}
> +
> +static inline u32 kmb_read_msscam(struct kmb_drm_private *dev_p,
> +				  unsigned int reg)
> +{
> +	return readl(dev_p->msscam_mmio + reg);
> +}
> +
> +static inline void kmb_set_bitmask_msscam(struct kmb_drm_private *dev_p,
> +					  unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_msscam(dev_p, reg);
> +
> +	kmb_write_msscam(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned i=
nt reg)
> +{
> +	return readl(dev_p->lcd_mmio + reg);
> +}
> +
> +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> +
> +	kmb_write_lcd(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_lcd(dev_p, reg);
> +
> +	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> +}
> +
> +static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned =
int reg)
> +{
> +	return readl(dev_p->mipi_mmio + reg);
> +}
> +
> +static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
> +				       unsigned int reg, u32 offset,
> +				       u32 num_bits, u32 value)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +	u32 mask =3D (1 << num_bits) - 1;
> +
> +	value &=3D mask;
> +	mask <<=3D offset;
> +	reg_val &=3D (~mask);
> +	reg_val |=3D (value << offset);
> +	kmb_write_mipi(dev_p, reg, reg_val);
> +}
> +
> +static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 offset)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> +}
> +
> +static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
> +				    unsigned int reg, u32 offset)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> +}
> +
> +static inline void kmb_set_bitmask_mipi(struct kmb_drm_private *dev_p,
> +					unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, (reg_val | mask));
> +}
> +
> +static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private *dev_p,
> +					unsigned int reg, u32 mask)
> +{
> +	u32 reg_val =3D kmb_read_mipi(dev_p, reg);
> +
> +	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> +}
> +
> +int kmb_setup_crtc(struct drm_device *dev);
> +void kmb_set_scanout(struct kmb_drm_private *lcd);
> +#endif /* __KMB_DRV_H__ */
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_pl=
ane.c
> new file mode 100644
> index 0000000..d1e7786
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "kmb_drv.h"
> +#include "kmb_plane.h"
> +#include "kmb_regs.h"
> +
> +const u32 layer_irqs[] =3D {
> +	LCD_INT_VL0,
> +	LCD_INT_VL1,
> +	LCD_INT_GL0,
> +	LCD_INT_GL1
> +};
> +
> +static unsigned int check_pixel_format(struct drm_plane *plane, u32 form=
at)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < plane->format_count; i++) {
> +		if (plane->format_types[i] =3D=3D format)
> +			return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int kmb_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	int ret;
> +	struct drm_crtc_state *crtc_state;
> +	bool can_position;
> +
> +	fb =3D state->fb;
> +	if (!fb || !state->crtc)
> +		return 0;
> +
> +	ret =3D check_pixel_format(plane, fb->format->format);
> +	if (ret)
> +		return ret;
> +
> +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
> +		return -EINVAL;
> +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
> +		return -EINVAL;
> +	can_position =3D (plane->type =3D=3D DRM_PLANE_TYPE_OVERLAY);
> +	crtc_state =3D
> +		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +						 DRM_PLANE_HELPER_NO_SCALING,
> +						 DRM_PLANE_HELPER_NO_SCALING,
> +						 can_position, true);
> +}
> +
> +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *state)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +	int plane_id =3D kmb_plane->id;
> +	struct kmb_drm_private *kmb;
> +
> +	kmb =3D to_kmb(plane->dev);
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	kmb->plane_status[plane_id].disable =3D true;
> +}
> +
> +unsigned int get_pixel_format(u32 format)
> +{
> +	unsigned int val =3D 0;
> +
> +	switch (format) {
> +		/* planar formats */
> +	case DRM_FORMAT_YUV444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU444:
> +		val =3D LCD_LAYER_FORMAT_YCBCR444PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU422:
> +		val =3D LCD_LAYER_FORMAT_YCBCR422PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_YUV420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_YVU420:
> +		val =3D LCD_LAYER_FORMAT_YCBCR420PLAN | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +	case DRM_FORMAT_NV12:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		val =3D LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
> +		    | LCD_LAYER_CRCB_ORDER;
> +		break;
> +		/* packed formats */
> +		/* looks hw requires B & G to be swapped when RGB */
> +	case DRM_FORMAT_RGB332:
> +		val =3D LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBX4444;
> +		break;
> +	case DRM_FORMAT_ARGB4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR4444:
> +		val =3D LCD_LAYER_FORMAT_RGBA4444;
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR1555:
> +		val =3D LCD_LAYER_FORMAT_XRGB1555;
> +		break;
> +	case DRM_FORMAT_ARGB1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR1555:
> +		val =3D LCD_LAYER_FORMAT_RGBA1555;
> +		break;
> +	case DRM_FORMAT_RGB565:
> +		val =3D LCD_LAYER_FORMAT_RGB565 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR565:
> +		val =3D LCD_LAYER_FORMAT_RGB565;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		val =3D LCD_LAYER_FORMAT_RGB888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_BGR888:
> +		val =3D LCD_LAYER_FORMAT_RGB888;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBX8888;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
> +		break;
> +	case DRM_FORMAT_ABGR8888:
> +		val =3D LCD_LAYER_FORMAT_RGBA8888;
> +		break;
> +	}
> +	DRM_INFO_ONCE("%s : %d format=3D0x%x val=3D0x%x\n",
> +		      __func__, __LINE__, format, val);
> +	return val;
> +}
> +
> +unsigned int get_bits_per_pixel(const struct drm_format_info *format)
> +{
> +	u32 bpp =3D 0;
> +	unsigned int val =3D 0;
> +
> +	if (format->num_planes > 1) {
> +		val =3D LCD_LAYER_8BPP;
> +		return val;
> +	}
> +
> +	bpp +=3D 8 * format->cpp[0];
> +
> +	switch (bpp) {
> +	case 8:
> +		val =3D LCD_LAYER_8BPP;
> +		break;
> +	case 16:
> +		val =3D LCD_LAYER_16BPP;
> +		break;
> +	case 24:
> +		val =3D LCD_LAYER_24BPP;
> +		break;
> +	case 32:
> +		val =3D LCD_LAYER_32BPP;
> +		break;
> +	}
> +
> +	DRM_DEBUG("bpp=3D%d val=3D0x%x\n", bpp, val);
> +	return val;
> +}
> +
> +static void config_csc(struct kmb_drm_private *kmb, int plane_id)
> +{
> +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id), csc_coef_lcd[0]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id), csc_coef_lcd[1]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id), csc_coef_lcd[2]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id), csc_coef_lcd[3]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id), csc_coef_lcd[4]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id), csc_coef_lcd[5]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id), csc_coef_lcd[6]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id), csc_coef_lcd[7]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id), csc_coef_lcd[8]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
> +}
> +
> +static void kmb_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb;
> +	struct kmb_drm_private *kmb;
> +	unsigned int width;
> +	unsigned int height;
> +	unsigned int dma_len;
> +	struct kmb_plane *kmb_plane;
> +	unsigned int dma_cfg;
> +	unsigned int ctrl =3D 0, val =3D 0, out_format =3D 0;
> +	unsigned int src_w, src_h, crtc_x, crtc_y;
> +	unsigned char plane_id;
> +	int num_planes;
> +	static dma_addr_t addr[MAX_SUB_PLANES];
> +
> +	if (!plane || !plane->state || !state)
> +		return;
> +
> +	fb =3D plane->state->fb;
> +	if (!fb)
> +		return;
> +	num_planes =3D fb->format->num_planes;
> +	kmb_plane =3D to_kmb_plane(plane);
> +	plane_id =3D kmb_plane->id;
> +
> +	kmb =3D to_kmb(plane->dev);
> +
> +	if (kmb_under_flow || kmb_flush_done) {
> +		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning");
> +		return;
> +	}
> +
> +	src_w =3D (plane->state->src_w >> 16);
> +	src_h =3D plane->state->src_h >> 16;
> +	crtc_x =3D plane->state->crtc_x;
> +	crtc_y =3D plane->state->crtc_y;
> +
> +	drm_dbg(&kmb->drm,
> +		"src_w=3D%d src_h=3D%d, fb->format->format=3D0x%x fb->flags=3D0x%x\n",
> +		  src_w, src_h, fb->format->format, fb->flags);
> +
> +	width =3D fb->width;
> +	height =3D fb->height;
> +	dma_len =3D (width * height * fb->format->cpp[0]);
> +	drm_dbg(&kmb->drm, "dma_len=3D%d ", dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> +		      fb->pitches[0]);
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> +		      (width * fb->format->cpp[0]));
> +
> +	addr[Y_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> +	kmb->fb_addr =3D addr[Y_PLANE];
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> +		      addr[Y_PLANE] + fb->offsets[0]);
> +	val =3D get_pixel_format(fb->format->format);
> +	val |=3D get_bits_per_pixel(fb->format);
> +	/* Program Cb/Cr for planar formats */
> +	if (num_planes > 1) {
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> +			      width * fb->format->cpp[0]);
> +		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> +			      (width * fb->format->cpp[0]));
> +
> +		addr[U_PLANE] =3D drm_fb_cma_get_gem_addr(fb, plane->state,
> +							U_PLANE);
> +		/* check if Cb/Cr is swapped*/
> +		if (num_planes =3D=3D 3 && (val & LCD_LAYER_CRCB_ORDER))
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					addr[U_PLANE]);
> +		else
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					addr[U_PLANE]);
> +
> +		if (num_planes =3D=3D 3) {
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			kmb_write_lcd(kmb,
> +				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> +				      ((width) * fb->format->cpp[0]));
> +
> +			addr[V_PLANE] =3D drm_fb_cma_get_gem_addr(fb,
> +								plane->state,
> +								V_PLANE);
> +
> +			/* check if Cb/Cr is swapped*/
> +			if (val & LCD_LAYER_CRCB_ORDER)
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> +					      addr[V_PLANE]);
> +			else
> +				kmb_write_lcd(kmb,
> +					      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> +					      addr[V_PLANE]);
> +		}
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> +	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);
> +	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> +
> +	val |=3D LCD_LAYER_FIFO_100;
> +
> +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> +		val |=3D LCD_LAYER_CSC_EN;
> +
> +		/* Enable CSC if input is planar and output is RGB */
> +		config_csc(kmb, plane_id);
> +	}
> +
> +	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> +
> +	switch (plane_id) {
> +	case LAYER_0:
> +		ctrl =3D LCD_CTRL_VL1_ENABLE;
> +		break;
> +	case LAYER_1:
> +		ctrl =3D LCD_CTRL_VL2_ENABLE;
> +		break;
> +	case LAYER_2:
> +		ctrl =3D LCD_CTRL_GL1_ENABLE;
> +		break;
> +	case LAYER_3:
> +		ctrl =3D LCD_CTRL_GL2_ENABLE;
> +		break;
> +	}
> +
> +	ctrl |=3D LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> +
> +	/* LCD is connected to MIPI on kmb
> +	 * Therefore this bit is required for DSI Tx
> +	 */
> +	ctrl |=3D LCD_CTRL_VHSYNC_IDLE_LVL;
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> +
> +	/* FIXME no doc on how to set output format,these values are
> +	 * taken from the Myriadx tests
> +	 */
> +	out_format |=3D LCD_OUTF_FORMAT_RGB888;
> +
> +	/* Leave RGB order,conversion mode and clip mode to default */
> +	/* do not interleave RGB channels for mipi Tx compatibility */
> +	out_format |=3D LCD_OUTF_MIPI_RGB_MODE;
> +	kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> +
> +	dma_cfg =3D LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
> +	    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
> +
> +	/* Enable DMA */
> +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> +	drm_dbg(&kmb->drm, "dma_cfg=3D0x%x LCD_DMA_CFG=3D0x%x\n", dma_cfg,
> +		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> +
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> +			LCD_INT_DMA_ERR);
> +}
> +
> +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs =3D {
> +	.atomic_check =3D kmb_plane_atomic_check,
> +	.atomic_update =3D kmb_plane_atomic_update,
> +	.atomic_disable =3D kmb_plane_atomic_disable
> +};
> +
> +void kmb_plane_destroy(struct drm_plane *plane)
> +{
> +	struct kmb_plane *kmb_plane =3D to_kmb_plane(plane);
> +
> +	drm_plane_cleanup(plane);
> +	kfree(kmb_plane);
> +}
> +
> +static const struct drm_plane_funcs kmb_plane_funcs =3D {
> +	.update_plane =3D drm_atomic_helper_update_plane,
> +	.disable_plane =3D drm_atomic_helper_disable_plane,
> +	.destroy =3D kmb_plane_destroy,
> +	.reset =3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> +};
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> +{
> +	struct kmb_drm_private *kmb =3D to_kmb(drm);
> +	struct kmb_plane *plane =3D NULL;
> +	struct kmb_plane *primary =3D NULL;
> +	int i =3D 0;
> +	int ret =3D 0;
> +	enum drm_plane_type plane_type;
> +	const u32 *plane_formats;
> +	int num_plane_formats;
> +
> +	for (i =3D 0; i < KMB_MAX_PLANES; i++) {
> +		plane =3D drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> +
> +		if (!plane) {
> +			drm_err(drm, "Failed to allocate plane\n");
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
> +		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> +		    DRM_PLANE_TYPE_OVERLAY;
> +		if (i < 2) {
> +			plane_formats =3D kmb_formats_v;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_v);
> +		} else {
> +			plane_formats =3D kmb_formats_g;
> +			num_plane_formats =3D ARRAY_SIZE(kmb_formats_g);
> +		}
> +
> +		ret =3D drm_universal_plane_init(drm, &plane->base_plane,
> +					       POSSIBLE_CRTCS, &kmb_plane_funcs,
> +					       plane_formats, num_plane_formats,
> +					       NULL, plane_type, "plane %d", i);
> +		if (ret < 0) {
> +			drm_err(drm, "drm_universal_plane_init failed (ret=3D%d)",
> +				ret);
> +			goto cleanup;
> +		}
> +		drm_dbg(drm, "%s : %d i=3D%d type=3D%d",
> +			__func__, __LINE__,
> +			  i, plane_type);
> +		drm_plane_helper_add(&plane->base_plane,
> +				     &kmb_plane_helper_funcs);
> +		if (plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			primary =3D plane;
> +			kmb->plane =3D plane;
> +		}
> +		drm_dbg(drm, "%s : %d primary=3D%p\n", __func__, __LINE__,
> +			&primary->base_plane);
> +		plane->id =3D i;
> +	}
> +
> +	return primary;
> +cleanup:
> +	drmm_kfree(drm, plane);
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_pl=
ane.h
> new file mode 100644
> index 0000000..141cdaa
> --- /dev/null
> +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright =A9 2018-2020 Intel Corporation
> + */
> +
> +#ifndef __KMB_PLANE_H__
> +#define __KMB_PLANE_H__
> +
> +extern int kmb_under_flow;
> +extern int kmb_flush_done;
> +
> +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> +			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
> +
> +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UNDE=
RFLOW)
> +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UNDE=
RFLOW)
> +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE | LCD_INT_VL0_ERR)
> +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_ERR)
> +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_ERR)
> +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
> +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
> +		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> +
> +#define POSSIBLE_CRTCS 1
> +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> +
> +enum layer_id {
> +	LAYER_0,
> +	LAYER_1,
> +	LAYER_2,
> +	LAYER_3,
> +	/* KMB_MAX_PLANES */
> +};
> +
> +#define KMB_MAX_PLANES 1
> +
> +enum sub_plane_id {
> +	Y_PLANE,
> +	U_PLANE,
> +	V_PLANE,
> +	MAX_SUB_PLANES,
> +};
> +
> +struct kmb_plane {
> +	struct drm_plane base_plane;
> +	unsigned char id;
> +};
> +
> +/* Graphics layer (layers 2 & 3) formats, only packed formats  are suppo=
rted */
> +static const u32 kmb_formats_g[] =3D {
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +};
> +
> +#define MAX_FORMAT_G	(ARRAY_SIZE(kmb_formats_g))
> +#define MAX_FORMAT_V	(ARRAY_SIZE(kmb_formats_v))
> +
> +/* Video layer ( 0 & 1) formats, packed and planar formats are supported=
 */
> +static const u32 kmb_formats_v[] =3D {
> +	/* packed formats */
> +	DRM_FORMAT_RGB332,
> +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> +	/*planar formats */
> +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> +};
> +
> +/* Conversion (yuv->rgb) matrix from myriadx */
> +static const u32 csc_coef_lcd[] =3D {
> +	1024, 0, 1436,
> +	1024, -352, -731,
> +	1024, 1814, 0,
> +	-179, 125, -226
> +};
> +
> +struct layer_status {
> +	bool disable;
> +	u32 ctrl;
> +};
> +
> +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> +void kmb_plane_destroy(struct drm_plane *plane);
> +#endif /* __KMB_PLANE_H__ */
> -- =

> 2.7.4
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
