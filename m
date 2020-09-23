Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB8275B97
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F2B6E9D0;
	Wed, 23 Sep 2020 15:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4AF6E937
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:22:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l15so4771208wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kEZ2mkwJ55LfS+DLM/CkFVH5ZNrOW56QRp0me9+mPlw=;
 b=jyp5IMw+AItljgrtlI6Xe1L7Xtb+jkJL564EmxoNAR+FXIuJPUScuQ4QXmYfkusdjY
 /IYDTgq3VTmrLwYT6z2zqiqNloN3KU2d+O09ypALIvQTp6BRc8BaU63oCo2rwwzpkiVJ
 //tohGEJNfPfxtXypVRTZ/U1uIZjNsrotdvl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kEZ2mkwJ55LfS+DLM/CkFVH5ZNrOW56QRp0me9+mPlw=;
 b=dpbxgjPYtzzbtwWUcFBrsB8OeH94frYKyAsLBzklpd+vsi43Vl5k39fLvK6eCAwIHJ
 d9sk3A/kt72Jj+JEsUBRCd/OoKzgpNn/++h3ivAD30hMkDxo/D/KGe4UjFHQOwnCbcVd
 lQZaaEDhQAkuSf7t3PuU8KPQglQWfWtzeE3vugmAw1fsPOt//ql90ymcYCs/w5JZr1g0
 GVLHMp5Nlw+MzejfdL0RmMASOz3eXQ9+eE1ZAu77t7win+PqLfpAPe7eA3DHLcghEqBK
 UtckseBAysG6jnb5oFszioR/+pt2lNupu4EXdSr1WbOJLWMe53hbHz/ZoFrFWqQkLAwv
 dPlQ==
X-Gm-Message-State: AOAM533jM8FuJs5tKDM6wuHP38q4D53ziaBOQjZb1VlBxqj7nT8ES6zL
 ARR9vPTMOQu2YkR838D9WmX5Xw==
X-Google-Smtp-Source: ABdhPJwzp/afUmBBP6BoaP8UsWoOjTIhPC9qhkl6J5MkKpKpvO9eyQj+P4CTl9eeIp5Up3MZFtSxNA==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr86334wmj.172.1600874554066;
 Wed, 23 Sep 2020 08:22:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm134868wma.29.2020.09.23.08.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:22:33 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:22:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
Message-ID: <20200923152231.GP438822@phenom.ffwll.local>
References: <1598904172-30865-1-git-send-email-anitha.chrisanthus@intel.com>
 <1598904172-30865-3-git-send-email-anitha.chrisanthus@intel.com>
 <20200910083042.GH438822@phenom.ffwll.local>
 <BY5PR11MB41824E626C9C9939221319D28C3B0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB41824E626C9C9939221319D28C3B0@BY5PR11MB4182.namprd11.prod.outlook.com>
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 06:20:02PM +0000, Chrisanthus, Anitha wrote:
> Hi Daniel,
> Thank you for your review. Keem Bay is developed on kernel 5.45 (Yocto)
> and I am working with the program to get a working 5.9 kernel for Keem
> Bay and will test this driver when that becomes available.

Yeah 5.4 is a bit old for upstreaming since a bunch of drm changes aren't
available there. Having an upstream kernel to test your submission is
indeed needed first.
-Daniel

> 

> Thanks,
> Anitha
> 
> 
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Thursday, September 10, 2020 1:31 AM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; Paauwe, Bob J
> > <bob.j.paauwe@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>;
> > Vetter, Daniel <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v7 2/4] drm/kmb: Add support for KeemBay Display
> > 
> > On Mon, Aug 31, 2020 at 01:02:50PM -0700, Anitha Chrisanthus wrote:
> > > This is a basic KMS atomic modesetting display driver for KeemBay family
> > of
> > > SOCs. Driver has no 2D or 3D graphics.It calls into the ADV bridge
> > > driver at the connector level.
> > >
> > > Single CRTC with LCD controller->mipi DSI-> ADV bridge
> > >
> > > Only 1080p resolution and single plane is supported at this time.
> > >
> > > v2: moved extern to .h, removed license text
> > >     use drm_dev_init, upclassed dev_private, removed HAVE_IRQ.(Sam)
> > >
> > > v3: Squashed all 59 commits to one
> > >
> > > v4: review changes from Sam Ravnborg
> > > 	renamed dev_p to kmb
> > > 	moved clocks under kmb_clock, consolidated clk initializations
> > > 	use drmm functions
> > > 	use DRM_GEM_CMA_DRIVER_OPS_VMAP
> > >
> > > v5: corrected spellings
> > > v6: corrected checkpatch warnings
> > > v7: review changes Sam Ravnborg and Thomas Zimmerman
> > > 	removed kmb_crtc.h kmb_crtc_cleanup (Thomas)
> > > 	renamed mode_set, kmb_load, inlined unload (Thomas)
> > > 	moved remaining logging to drm_*(Thomas)
> > > 	re-orged driver initialization (Thomas)
> > > 	moved plane_status to drm_private (Sam)
> > > 	removed unnecessary logs and defines and ifdef codes (Sam)
> > > 	call helper_check in plane_atomic_check (Sam)
> > > 	renamed set to get for bpp and format functions(Sam)
> > > 	use drm helper functions for reset, duplicate/destroy state instead
> > > 	of kmb functions (Sam)
> > > 	removed kmb_priv from kmb_plane and removed kmb_plane_state
> > (Sam)
> > >
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
> > 
> > Sam asked me to take a look at this too, looks reasonable overall. I've
> > spotted a few small things plus a potential functional issue around
> > vblank/event handling. I strongly recommend running the igt test suite
> > over the driver to see whether it all works reasonably ok. See below for
> > details.
> > 
> > > ---
> > >  drivers/gpu/drm/kmb/kmb_crtc.c  | 224 +++++++++++++
> > >  drivers/gpu/drm/kmb/kmb_drv.c   | 676
> > ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/kmb/kmb_drv.h   | 170 ++++++++++
> > >  drivers/gpu/drm/kmb/kmb_plane.c | 480
> > ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/kmb/kmb_plane.h | 110 +++++++
> > >  5 files changed, 1660 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/kmb/kmb_crtc.c
> > >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.c
> > >  create mode 100644 drivers/gpu/drm/kmb/kmb_drv.h
> > >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.c
> > >  create mode 100644 drivers/gpu/drm/kmb/kmb_plane.h
> > >
> > > diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c
> > b/drivers/gpu/drm/kmb/kmb_crtc.c
> > > new file mode 100644
> > > index 0000000..a684331
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/kmb/kmb_crtc.c
> > > @@ -0,0 +1,224 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2020 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_data/simplefb.h>
> > > +
> > > +#include <video/videomode.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_debugfs.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_plane_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "kmb_drv.h"
> > > +#include "kmb_dsi.h"
> > > +#include "kmb_plane.h"
> > > +#include "kmb_regs.h"
> > > +
> > > +struct kmb_crtc_timing {
> > > +	u32 vfront_porch;
> > > +	u32 vback_porch;
> > > +	u32 vsync_len;
> > > +	u32 hfront_porch;
> > > +	u32 hback_porch;
> > > +	u32 hsync_len;
> > > +};
> > > +
> > > +static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct drm_device *dev = crtc->dev;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +
> > > +	/* Clear interrupt */
> > > +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > > +	/* Set which interval to generate vertical interrupt */
> > > +	kmb_write_lcd(kmb, LCD_VSTATUS_COMPARE,
> > > +		      LCD_VSTATUS_COMPARE_VSYNC);
> > > +	/* Enable vertical interrupt */
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +			    LCD_INT_VERT_COMP);
> > > +	return 0;
> > > +}
> > > +
> > > +static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
> > > +{
> > > +	struct drm_device *dev = crtc->dev;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +
> > > +	/* Clear interrupt */
> > > +	kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
> > > +	/* Disable vertical interrupt */
> > > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +			    LCD_INT_VERT_COMP);
> > > +}
> > > +
> > > +static const struct drm_crtc_funcs kmb_crtc_funcs = {
> > > +	.destroy = drm_crtc_cleanup,
> > > +	.set_config = drm_atomic_helper_set_config,
> > > +	.page_flip = drm_atomic_helper_page_flip,
> > > +	.reset = drm_atomic_helper_crtc_reset,
> > > +	.atomic_duplicate_state =
> > drm_atomic_helper_crtc_duplicate_state,
> > > +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> > > +	.enable_vblank = kmb_crtc_enable_vblank,
> > > +	.disable_vblank = kmb_crtc_disable_vblank,
> > > +};
> > > +
> > > +static void kmb_crtc_set_mode(struct drm_crtc *crtc)
> > > +{
> > > +	struct drm_device *dev = crtc->dev;
> > > +	struct drm_display_mode *m = &crtc->state->adjusted_mode;
> > > +	struct kmb_crtc_timing vm;
> > > +	int vsync_start_offset;
> > > +	int vsync_end_offset;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +	unsigned int val = 0;
> > > +
> > > +	/* Initialize mipi */
> > > +	kmb_dsi_hw_init(dev, m);
> > > +	drm_info(dev,
> > > +		 "vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d
> > hsync_len=%d\n",
> > > +		 m->crtc_vsync_start - m->crtc_vdisplay,
> > > +		 m->crtc_vtotal - m->crtc_vsync_end,
> > > +		 m->crtc_vsync_end - m->crtc_vsync_start,
> > > +		 m->crtc_hsync_start - m->crtc_hdisplay,
> > > +		 m->crtc_htotal - m->crtc_hsync_end,
> > > +		 m->crtc_hsync_end - m->crtc_hsync_start);
> > > +	val = kmb_read_lcd(kmb, LCD_INT_ENABLE);
> > > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, ~0x0);
> > > +	vm.vfront_porch = 2;
> > > +	vm.vback_porch = 2;
> > > +	vm.vsync_len = 8;
> > > +	vm.hfront_porch = 0;
> > > +	vm.hback_porch = 0;
> > > +	vm.hsync_len = 28;
> > > +
> > > +	vsync_start_offset =  m->crtc_vsync_start -  m->crtc_hsync_start;
> > > +	vsync_end_offset =  m->crtc_vsync_end - m->crtc_hsync_end;
> > > +
> > > +	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-
> > w=%d h-active=%d h-bp=%d h-fp=%d hysnc-l=%d",
> > > +		__func__, __LINE__,
> > > +			m->crtc_vdisplay, vm.vback_porch,
> > vm.vfront_porch,
> > > +			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
> > > +			vm.hfront_porch, vm.hsync_len);
> > > +	kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT,
> > > +		      m->crtc_vdisplay - 1);
> > > +	kmb_write_lcd(kmb, LCD_V_BACKPORCH, vm.vback_porch);
> > > +	kmb_write_lcd(kmb, LCD_V_FRONTPORCH, vm.vfront_porch);
> > > +	kmb_write_lcd(kmb, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
> > > +	kmb_write_lcd(kmb, LCD_H_ACTIVEWIDTH,
> > > +		      m->crtc_hdisplay - 1);
> > > +	kmb_write_lcd(kmb, LCD_H_BACKPORCH, vm.hback_porch);
> > > +	kmb_write_lcd(kmb, LCD_H_FRONTPORCH, vm.hfront_porch);
> > > +	kmb_write_lcd(kmb, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
> > > +	/* This is hardcoded as 0 in the Myriadx code */
> > > +	kmb_write_lcd(kmb, LCD_VSYNC_START, 0);
> > > +	kmb_write_lcd(kmb, LCD_VSYNC_END, 0);
> > > +	/* Back ground color */
> > > +	kmb_write_lcd(kmb, LCD_BG_COLOUR_LS, 0x4);
> > > +	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
> > > +		kmb_write_lcd(kmb,
> > > +			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
> > > +		kmb_write_lcd(kmb,
> > > +			      LCD_V_BACKPORCH_EVEN, vm.vback_porch);
> > > +		kmb_write_lcd(kmb,
> > > +			      LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);
> > > +		kmb_write_lcd(kmb, LCD_V_ACTIVEHEIGHT_EVEN,
> > > +			      m->crtc_vdisplay - 1);
> > > +		/* This is hardcoded as 10 in the Myriadx code */
> > > +		kmb_write_lcd(kmb, LCD_VSYNC_START_EVEN, 10);
> > > +		kmb_write_lcd(kmb, LCD_VSYNC_END_EVEN, 10);
> > > +	}
> > > +	kmb_write_lcd(kmb, LCD_TIMING_GEN_TRIG, ENABLE);
> > > +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, LCD_CTRL_ENABLE);
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, val);
> > > +}
> > > +
> > > +static void kmb_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +				   struct drm_crtc_state *old_state)
> > > +{
> > > +	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
> > > +
> > > +	clk_prepare_enable(lcd->clk);
> > > +	kmb_crtc_set_mode(crtc);
> > > +	drm_crtc_vblank_on(crtc);
> > > +}
> > > +
> > > +static void kmb_crtc_atomic_disable(struct drm_crtc *crtc,
> > > +				    struct drm_crtc_state *old_state)
> > > +{
> > > +	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
> > > +
> > > +	/* due to hw limitations, planes need to be off when crtc is off */
> > > +	drm_atomic_helper_disable_planes_on_crtc(old_state, false);
> > > +
> > > +	drm_crtc_vblank_off(crtc);
> > > +	clk_disable_unprepare(lcd->clk);
> > > +}
> > > +
> > > +static void kmb_crtc_atomic_begin(struct drm_crtc *crtc,
> > > +				  struct drm_crtc_state *state)
> > > +{
> > > +	struct drm_device *dev = crtc->dev;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +
> > > +	kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +			    LCD_INT_VERT_COMP);
> > > +}
> > > +
> > > +static void kmb_crtc_atomic_flush(struct drm_crtc *crtc,
> > > +				  struct drm_crtc_state *state)
> > > +{
> > > +	struct drm_device *dev = crtc->dev;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +			    LCD_INT_VERT_COMP);
> > > +
> > > +	spin_lock_irq(&crtc->dev->event_lock);
> > > +	if (crtc->state->event)
> > > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > 
> > Uh, you have vblank event support, but you immediately send out the
> > vblank
> > event. That breaks userspace assumptions. You probably want to use
> > drm_crtc_arm_vblank_event here. Also there's tons of races that can
> > possibly happen, so please read the kerneldoc comment for that function
> > carefully - you probably need to validate that the vblank event arming,
> > vblank process and re-enabling of LCD_INT_ENABLE cannot race against
> > each
> > another in bad ways.
> > 
> > Also we have igt testcases for this, so please run them:
> > 
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-
> > changes-with-igt
> > 
> > > +	crtc->state->event = NULL;
> > > +	spin_unlock_irq(&crtc->dev->event_lock);
> > > +}
> > > +
> > > +static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
> > > +	.atomic_begin = kmb_crtc_atomic_begin,
> > > +	.atomic_enable = kmb_crtc_atomic_enable,
> > > +	.atomic_disable = kmb_crtc_atomic_disable,
> > > +	.atomic_flush = kmb_crtc_atomic_flush,
> > > +};
> > > +
> > > +int kmb_setup_crtc(struct drm_device *drm)
> > > +{
> > > +	struct kmb_drm_private *kmb = to_kmb(drm);
> > > +	struct kmb_plane *primary;
> > > +	int ret;
> > > +
> > > +	primary = kmb_plane_init(drm);
> > > +	if (IS_ERR(primary))
> > > +		return PTR_ERR(primary);
> > > +
> > > +	ret = drm_crtc_init_with_planes(drm, &kmb->crtc, &primary-
> > >base_plane,
> > > +					NULL, &kmb_crtc_funcs, NULL);
> > > +	if (ret) {
> > > +		kmb_plane_destroy(&primary->base_plane);
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_crtc_helper_add(&kmb->crtc, &kmb_crtc_helper_funcs);
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/kmb/kmb_drv.c
> > b/drivers/gpu/drm/kmb/kmb_drv.c
> > > new file mode 100644
> > > index 0000000..e413099
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> > > @@ -0,0 +1,676 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2020 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/console.h>
> > > +#include <linux/list.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#include <drm/drm.h>
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_ioctl.h>
> > > +#include <drm/drm_irq.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +#include <drm/drm_vblank.h>
> > > +
> > > +#include "kmb_drv.h"
> > > +#include "kmb_dsi.h"
> > > +#include "kmb_regs.h"
> > > +
> > > +int kmb_under_flow = 0, kmb_flush_done = 0, layer_no = 0;
> > > +static struct kmb_clock kmb_clk;
> > > +
> > > +static struct drm_bridge *adv_bridge;
> > > +
> > > +int kmb_display_clk_enable(struct kmb_drm_private *kmb)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	ret = clk_prepare_enable(kmb_clk.clk_lcd);
> > > +	if (ret) {
> > > +		drm_err(&kmb->drm, "Failed to enable LCD clock: %d\n",
> > ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(kmb_clk.clk_mipi);
> > > +	if (ret) {
> > > +		drm_err(&kmb->drm, "Failed to enable MIPI clock: %d\n",
> > ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(kmb_clk.clk_mipi_ecfg);
> > > +	if (ret) {
> > > +		drm_err(&kmb->drm,
> > > +			"Failed to enable MIPI_ECFG clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(kmb_clk.clk_mipi_cfg);
> > > +	if (ret) {
> > > +		drm_err(&kmb->drm,
> > > +			"Failed to enable MIPI_CFG clock: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
> > > +	return 0;
> > > +}
> > > +
> > > +int kmb_initialize_clocks(struct kmb_drm_private *kmb, struct device
> > *dev)
> > > +{
> > > +	struct device_node *vpu_dev;
> > > +	unsigned long clk;
> > > +	int ret = 0;
> > > +
> > > +	kmb_clk.clk_lcd = clk_get(dev, "clk_lcd");
> > > +	if (IS_ERR(kmb_clk.clk_lcd)) {
> > > +		drm_err(&kmb->drm, "clk_get() failed clk_lcd\n");
> > > +		return PTR_ERR(kmb_clk.clk_lcd);
> > > +	}
> > > +
> > > +	kmb_clk.clk_mipi = clk_get(dev, "clk_mipi");
> > > +	if (IS_ERR(kmb_clk.clk_mipi)) {
> > > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi\n");
> > > +		return PTR_ERR(kmb_clk.clk_mipi);
> > > +	}
> > > +
> > > +	kmb_clk.clk_mipi_ecfg = clk_get(dev, "clk_mipi_ecfg");
> > > +	if (IS_ERR(kmb_clk.clk_mipi_ecfg)) {
> > > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_ecfg\n");
> > > +		return PTR_ERR(kmb_clk.clk_mipi_ecfg);
> > > +	}
> > > +
> > > +	kmb_clk.clk_mipi_cfg = clk_get(dev, "clk_mipi_cfg");
> > > +	if (IS_ERR(kmb_clk.clk_mipi_cfg)) {
> > > +		drm_err(&kmb->drm, "clk_get() failed clk_mipi_cfg\n");
> > > +		return PTR_ERR(kmb_clk.clk_mipi_cfg);
> > > +	}
> > > +	vpu_dev = of_find_node_by_path("/soc/vpu-ipc");
> > > +	kmb_clk.clk_pll0 = of_clk_get_by_name(vpu_dev, "pll_0_out_0");
> > > +	if (IS_ERR(kmb_clk.clk_pll0)) {
> > > +		drm_err(&kmb->drm, "clk_get() failed clk_pll0 ");
> > > +		return PTR_ERR(kmb_clk.clk_pll0);
> > > +	}
> > > +	kmb->sys_clk_mhz = clk_get_rate(kmb_clk.clk_pll0) / 1000000;
> > > +	drm_info(&kmb->drm, "system clk = %d Mhz", kmb-
> > >sys_clk_mhz);
> > > +
> > > +	/* Set LCD clock to 200 Mhz */
> > > +	clk_set_rate(kmb_clk.clk_lcd, KMB_LCD_DEFAULT_CLK);
> > > +	if (clk_get_rate(kmb_clk.clk_lcd) != KMB_LCD_DEFAULT_CLK) {
> > > +		drm_err(&kmb->drm, "failed to set to clk_lcd to %d\n",
> > > +			KMB_LCD_DEFAULT_CLK);
> > > +		return -1;
> > > +	}
> > > +	drm_dbg(&kmb->drm, "clk_lcd = %ld\n",
> > clk_get_rate(kmb_clk.clk_lcd));
> > > +
> > > +	/* Set MIPI clock to 24 Mhz */
> > > +	clk_set_rate(kmb_clk.clk_mipi, KMB_MIPI_DEFAULT_CLK);
> > > +	if (clk_get_rate(kmb_clk.clk_mipi) != KMB_MIPI_DEFAULT_CLK) {
> > > +		drm_err(&kmb->drm, "failed to set to clk_mipi to %d\n",
> > > +			KMB_MIPI_DEFAULT_CLK);
> > > +		return -1;
> > > +	}
> > > +	drm_dbg(&kmb->drm, "clk_mipi = %ld\n",
> > clk_get_rate(kmb_clk.clk_mipi));
> > > +
> > > +	clk = clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > > +	if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > > +		/* Set MIPI_ECFG clock to 24 Mhz */
> > > +		clk_set_rate(kmb_clk.clk_mipi_ecfg,
> > KMB_MIPI_DEFAULT_CFG_CLK);
> > > +		clk = clk_get_rate(kmb_clk.clk_mipi_ecfg);
> > > +		if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > > +			drm_err(&kmb->drm,
> > > +				"failed to set to clk_mipi_ecfg to %d\n",
> > > +				 KMB_MIPI_DEFAULT_CFG_CLK);
> > > +			return -1;
> > > +		}
> > > +	}
> > > +
> > > +	clk = clk_get_rate(kmb_clk.clk_mipi_cfg);
> > > +	if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > > +		/* Set MIPI_CFG clock to 24 Mhz */
> > > +		clk_set_rate(kmb_clk.clk_mipi_cfg, 24000000);
> > > +		clk = clk_get_rate(kmb_clk.clk_mipi_cfg);
> > > +		if (clk != KMB_MIPI_DEFAULT_CFG_CLK) {
> > > +			drm_err(&kmb->drm,
> > > +				"failed to set clk_mipi_cfg to %d\n",
> > > +				  KMB_MIPI_DEFAULT_CFG_CLK);
> > > +			return -1;
> > > +		}
> > > +	}
> > > +
> > > +	ret = kmb_display_clk_enable(kmb);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Enable MSS_CAM_CLK_CTRL for MIPI TX and LCD */
> > > +	kmb_set_bitmask_msscam(kmb, MSS_CAM_CLK_CTRL, 0x1fff);
> > > +	kmb_set_bitmask_msscam(kmb, MSS_CAM_RSTN_CTRL, 0xffffffff);
> > > +	return 0;
> > > +}
> > > +
> > > +static int kmb_display_clk_disable(void)
> > > +{
> > > +	if (kmb_clk.clk_lcd)
> > > +		clk_disable_unprepare(kmb_clk.clk_lcd);
> > > +	if (kmb_clk.clk_mipi)
> > > +		clk_disable_unprepare(kmb_clk.clk_mipi);
> > > +	if (kmb_clk.clk_mipi_ecfg)
> > > +		clk_disable_unprepare(kmb_clk.clk_mipi_ecfg);
> > > +	if (kmb_clk.clk_mipi_cfg)
> > > +		clk_disable_unprepare(kmb_clk.clk_mipi_cfg);
> > > +	return 0;
> > > +}
> > > +
> > > +static void __iomem *kmb_map_mmio(struct drm_device *drm, char
> > *name)
> > > +{
> > > +	struct resource *res;
> > > +	struct platform_device *pdev = to_platform_device(drm->dev);
> > > +	void __iomem *mem;
> > > +
> > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > name);
> > > +	if (!res) {
> > > +		drm_err(drm, "failed to get resource for %s", name);
> > > +		return ERR_PTR(-ENOMEM);
> > > +	}
> > > +	mem = devm_ioremap_resource(drm->dev, res);
> > > +	if (IS_ERR(mem))
> > > +		drm_err(drm, "failed to ioremap %s registers", name);
> > > +	return mem;
> > > +}
> > > +
> > > +static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
> > > +{
> > > +	struct kmb_drm_private *kmb = to_kmb(drm);
> > > +	struct platform_device *pdev = to_platform_device(drm->dev);
> > > +	int irq_lcd;
> > > +	int ret = 0;
> > > +
> > > +	/* Map LCD MMIO registers */
> > > +	kmb->lcd_mmio = kmb_map_mmio(drm, "lcd_regs");
> > > +	if (IS_ERR(kmb->lcd_mmio)) {
> > > +		drm_err(&kmb->drm, "failed to map LCD registers\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	/* Map MIPI MMIO registers */
> > > +	kmb->mipi_mmio = kmb_map_mmio(drm, "mipi_regs");
> > > +	if (IS_ERR(kmb->mipi_mmio)) {
> > > +		drm_err(&kmb->drm, "failed to map MIPI registers\n");
> > > +		iounmap(kmb->lcd_mmio);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and
> > > +	 * MSS_CAM_CLK_CTRL register
> > > +	 */
> > > +	kmb->msscam_mmio = kmb_map_mmio(drm, "msscam_regs");
> > > +	if (IS_ERR(kmb->msscam_mmio)) {
> > > +		drm_err(&kmb->drm, "failed to map MSSCAM
> > registers\n");
> > > +		iounmap(kmb->lcd_mmio);
> > > +		iounmap(kmb->mipi_mmio);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	if (IS_ERR(kmb->msscam_mmio)) {
> > > +		drm_err(&kmb->drm, "failed to map MSSCAM
> > registers\n");
> > > +		iounmap(kmb->lcd_mmio);
> > > +		iounmap(kmb->mipi_mmio);
> > > +		return -ENOMEM;
> > > +	}
> > > +	/* Enable display clocks */
> > > +	kmb_initialize_clocks(kmb, &pdev->dev);
> > > +
> > > +	/* Register irqs here - section 17.3 in databook
> > > +	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
> > > +	 * firmware has redirected 79 to A53 IRQ 33
> > > +	 */
> > > +
> > > +	/* Allocate LCD interrupt resources */
> > > +	irq_lcd = platform_get_irq_byname(pdev, "irq_lcd");
> > > +	if (irq_lcd < 0) {
> > > +		drm_err(&kmb->drm, "irq_lcd not found");
> > > +		goto setup_fail;
> > > +	}
> > > +
> > > +	/* Get the optional framebuffer memory resource */
> > > +	ret = of_reserved_mem_device_init(drm->dev);
> > > +	if (ret && ret != -ENODEV)
> > > +		return ret;
> > > +
> > > +	spin_lock_init(&kmb->irq_lock);
> > > +
> > > +	kmb->irq_lcd = irq_lcd;
> > > +
> > > +	return 0;
> > > +
> > > + setup_fail:
> > > +	of_reserved_mem_device_release(drm->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
> > > +	.fb_create = drm_gem_fb_create,
> > > +	.atomic_check = drm_atomic_helper_check,
> > > +	.atomic_commit = drm_atomic_helper_commit,
> > > +};
> > > +
> > > +static int kmb_setup_mode_config(struct drm_device *drm)
> > > +{
> > > +	int ret;
> > > +	struct kmb_drm_private *kmb = to_kmb(drm);
> > > +
> > > +	ret = drmm_mode_config_init(drm);
> > > +	if (ret)
> > > +		return ret;
> > > +	drm->mode_config.min_width = KMB_MIN_WIDTH;
> > > +	drm->mode_config.min_height = KMB_MIN_HEIGHT;
> > > +	drm->mode_config.max_width = KMB_MAX_WIDTH;
> > > +	drm->mode_config.max_height = KMB_MAX_HEIGHT;
> > > +	drm->mode_config.funcs = &kmb_mode_config_funcs;
> > > +
> > > +	ret = kmb_setup_crtc(drm);
> > > +	if (ret < 0) {
> > > +		drm_err(drm, "failed to create crtc\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Initialize MIPI DSI */
> > > +	ret = kmb_dsi_init(drm, adv_bridge);
> > 
> > Split up isn't correct here, this won't compile since the dsi code isn't
> > in this patch yet. So you need to have this ordered the other way round.
> > 
> > > +	if (ret) {
> > > +		drm_err(drm, "failed to initialize DSI\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Set the CRTC's port so that the encoder component can find it */
> > > +	kmb->crtc.port = of_graph_get_port_by_id(drm->dev->of_node, 0);
> > > +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > > +	if (ret < 0) {
> > > +		drm_err(drm, "failed to initialize vblank\n");
> > > +		pm_runtime_disable(drm->dev);
> > > +		return ret;
> > > +	}
> > > +
> > > +	drm_mode_config_reset(drm);
> > > +	return 0;
> > > +}
> > > +
> > > +static irqreturn_t handle_lcd_irq(struct drm_device *dev)
> > > +{
> > > +	unsigned long status, val, val1;
> > > +	int plane_id, dma0_state, dma1_state;
> > > +	struct kmb_drm_private *kmb = to_kmb(dev);
> > > +
> > > +	status = kmb_read_lcd(kmb, LCD_INT_STATUS);
> > > +
> > > +	if (status & LCD_INT_EOF) {
> > > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF);
> > > +
> > > +		/* When disabling/enabling LCD layers, the change takes
> > effect
> > > +		 * immediately and does not wait for EOF (end of frame).
> > > +		 * When kmb_plane_atomic_disable is called, mark the
> > plane as
> > > +		 * disabled but actually disable the plane when EOF irq is
> > > +		 * being handled.
> > > +		 */
> > > +		for (plane_id = LAYER_0;
> > > +				plane_id < KMB_MAX_PLANES; plane_id++)
> > {
> > > +			if (kmb->plane_status[plane_id].disable) {
> > > +				kmb_clr_bitmask_lcd(kmb,
> > > +						    LCD_LAYERn_DMA_CFG
> > > +						    (plane_id),
> > > +
> > LCD_DMA_LAYER_ENABLE);
> > > +
> > > +				kmb_clr_bitmask_lcd(kmb, LCD_CONTROL,
> > > +						    kmb-
> > >plane_status[plane_id].ctrl);
> > > +
> > > +				kmb->plane_status[plane_id].disable = false;
> > > +			}
> > > +		}
> > > +		if (kmb_under_flow) {
> > > +			/* DMA Recovery after underflow */
> > > +			dma0_state = (layer_no == 0) ?
> > > +			    LCD_VIDEO0_DMA0_STATE :
> > LCD_VIDEO1_DMA0_STATE;
> > > +			dma1_state = (layer_no == 0) ?
> > > +			    LCD_VIDEO0_DMA1_STATE :
> > LCD_VIDEO1_DMA1_STATE;
> > > +
> > > +			do {
> > > +				kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> > > +				val = kmb_read_lcd(kmb, dma0_state)
> > > +				    & LCD_DMA_STATE_ACTIVE;
> > > +				val1 = kmb_read_lcd(kmb, dma1_state)
> > > +				    & LCD_DMA_STATE_ACTIVE;
> > > +			} while ((val || val1));
> > > +			/* disable dma */
> > > +			kmb_clr_bitmask_lcd(kmb,
> > LCD_LAYERn_DMA_CFG(layer_no),
> > > +					    LCD_DMA_LAYER_ENABLE);
> > > +			kmb_write_lcd(kmb, LCD_FIFO_FLUSH, 1);
> > > +			kmb_flush_done = 1;
> > > +			kmb_under_flow = 0;
> > > +		}
> > > +	}
> > > +
> > > +	if (status & LCD_INT_LINE_CMP) {
> > > +		/* clear line compare interrupt */
> > > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
> > > +	}
> > > +
> > > +	if (status & LCD_INT_VERT_COMP) {
> > > +		/* Read VSTATUS */
> > > +		val = kmb_read_lcd(kmb, LCD_VSTATUS);
> > > +		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
> > > +		switch (val) {
> > > +		case LCD_VSTATUS_COMPARE_VSYNC:
> > > +			/* Clear vertical compare interrupt */
> > > +			kmb_write_lcd(kmb, LCD_INT_CLEAR,
> > LCD_INT_VERT_COMP);
> > > +			if (kmb_flush_done) {
> > > +				kmb_set_bitmask_lcd(kmb,
> > > +						    LCD_LAYERn_DMA_CFG
> > > +						    (layer_no),
> > > +
> > LCD_DMA_LAYER_ENABLE);
> > > +				kmb_flush_done = 0;
> > > +			}
> > > +			drm_handle_vblank(dev, 0);
> > 
> > Would be nice to use the new-style drm_crtc_handle_vblank here.
> > 
> > > +			break;
> > > +		case LCD_VSTATUS_COMPARE_BACKPORCH:
> > > +		case LCD_VSTATUS_COMPARE_ACTIVE:
> > > +		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
> > > +			kmb_write_lcd(kmb, LCD_INT_CLEAR,
> > LCD_INT_VERT_COMP);
> > > +			break;
> > > +		}
> > > +	}
> > > +	if (status & LCD_INT_DMA_ERR) {
> > > +		val =
> > > +		    (status & LCD_INT_DMA_ERR &
> > > +		     kmb_read_lcd(kmb, LCD_INT_ENABLE));
> > > +		/* LAYER0 - VL0 */
> > > +		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
> > > +			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > +			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
> > > +			kmb_under_flow++;
> > > +			drm_info(&kmb->drm,
> > > +				 "!LAYER0:VL0 DMA UNDERFLOW val =
> > 0x%lx,under_flow=%d",
> > > +			     val, kmb_under_flow);
> > > +			/* disable underflow interrupt */
> > > +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +					    LAYER0_DMA_FIFO_UNDERFLOW
> > |
> > > +
> > LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > +
> > LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > > +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > > +
> > LAYER0_DMA_CB_FIFO_UNDERFLOW |
> > > +					    LAYER0_DMA_FIFO_UNDERFLOW
> > |
> > > +
> > LAYER0_DMA_CR_FIFO_UNDERFLOW);
> > > +			/* disable auto restart mode */
> > > +			kmb_clr_bitmask_lcd(kmb,
> > LCD_LAYERn_DMA_CFG(0),
> > > +
> > LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > > +			layer_no = 0;
> > > +		}
> > > +
> > > +		if (val & LAYER0_DMA_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER0:VL0 DMA OVERFLOW val = 0x%lx",
> > val);
> > > +		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER0:VL0 DMA CB OVERFLOW val =
> > 0x%lx", val);
> > > +		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER0:VL0 DMA CR OVERFLOW val =
> > 0x%lx", val);
> > > +
> > > +		/* LAYER1 - VL1 */
> > > +		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
> > > +			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > +			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
> > > +			kmb_under_flow++;
> > > +			drm_info(&kmb->drm,
> > > +				 "!LAYER1:VL1 DMA UNDERFLOW val =
> > 0x%lx, under_flow=%d",
> > > +			     val, kmb_under_flow);
> > > +			/* disable underflow interrupt */
> > > +			kmb_clr_bitmask_lcd(kmb, LCD_INT_ENABLE,
> > > +					    LAYER1_DMA_FIFO_UNDERFLOW
> > |
> > > +
> > LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > +
> > LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > > +			kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR,
> > > +
> > LAYER1_DMA_CB_FIFO_UNDERFLOW |
> > > +					    LAYER1_DMA_FIFO_UNDERFLOW
> > |
> > > +
> > LAYER1_DMA_CR_FIFO_UNDERFLOW);
> > > +			/* disable auto restart mode */
> > > +			kmb_clr_bitmask_lcd(kmb,
> > LCD_LAYERn_DMA_CFG(1),
> > > +
> > LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
> > > +			layer_no = 1;
> > > +		}
> > > +
> > > +		/* LAYER1 - VL1 */
> > > +		if (val & LAYER1_DMA_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER1:VL1 DMA OVERFLOW val = 0x%lx",
> > val);
> > > +		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER1:VL1 DMA CB OVERFLOW val =
> > 0x%lx", val);
> > > +		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER1:VL1 DMA CR OVERFLOW val =
> > 0x%lx", val);
> > > +
> > > +		/* LAYER2 - GL0 */
> > > +		if (val & LAYER2_DMA_FIFO_UNDERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER2:GL0 DMA UNDERFLOW val =
> > 0x%lx", val);
> > > +		if (val & LAYER2_DMA_FIFO_OVERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER2:GL0 DMA OVERFLOW val = 0x%lx",
> > val);
> > > +
> > > +		/* LAYER3 - GL1 */
> > > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER3:GL1 DMA UNDERFLOW val =
> > 0x%lx", val);
> > > +		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
> > > +			drm_dbg(&kmb->drm,
> > > +				"LAYER3:GL1 DMA OVERFLOW val = 0x%lx",
> > val);
> > > +	}
> > > +
> > > +	if (status & LCD_INT_LAYER) {
> > > +		/* Clear layer interrupts */
> > > +		kmb_write_lcd(kmb, LCD_INT_CLEAR, LCD_INT_LAYER);
> > > +	}
> > > +
> > > +	/* Clear all interrupts */
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, 1);
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +/* IRQ handler */
> > > +static irqreturn_t kmb_isr(int irq, void *arg)
> > > +{
> > > +	struct drm_device *dev = (struct drm_device *)arg;
> > > +
> > > +	handle_lcd_irq(dev);
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static void kmb_irq_reset(struct drm_device *drm)
> > > +{
> > > +	kmb_write_lcd(to_kmb(drm), LCD_INT_CLEAR, 0xFFFF);
> > > +	kmb_write_lcd(to_kmb(drm), LCD_INT_ENABLE, 0);
> > > +}
> > > +
> > > +DEFINE_DRM_GEM_CMA_FOPS(fops);
> > > +
> > > +static struct drm_driver kmb_driver = {
> > > +	.driver_features = DRIVER_GEM |
> > > +	    DRIVER_MODESET | DRIVER_ATOMIC,
> > > +	.irq_handler = kmb_isr,
> > > +	.irq_preinstall = kmb_irq_reset,
> > > +	.irq_uninstall = kmb_irq_reset,
> > > +	/* GEM Operations */
> > > +	.fops = &fops,
> > > +	DRM_GEM_CMA_DRIVER_OPS_VMAP,
> > > +	.name = "kmb-drm",
> > > +	.desc = "KEEMBAY DISPLAY DRIVER ",
> > > +	.date = "20190122",
> > > +	.major = 1,
> > > +	.minor = 0,
> > > +};
> > > +
> > > +static int kmb_remove(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct drm_device *drm = dev_get_drvdata(dev);
> > > +	struct kmb_drm_private *kmb = to_kmb(drm);
> > > +
> > > +	drm_dev_unregister(drm);
> > > +	drm_kms_helper_poll_fini(drm);
> > > +	of_node_put(kmb->crtc.port);
> > > +	kmb->crtc.port = NULL;
> > > +	pm_runtime_get_sync(drm->dev);
> > > +	drm_irq_uninstall(drm);
> > > +	pm_runtime_put_sync(drm->dev);
> > > +	pm_runtime_disable(drm->dev);
> > > +
> > > +	of_reserved_mem_device_release(drm->dev);
> > > +
> > > +	/* Release clks */
> > > +	kmb_display_clk_disable();
> > > +	clk_put(kmb_clk.clk_lcd);
> > > +	clk_put(kmb_clk.clk_mipi);
> > > +
> > > +	dev_set_drvdata(dev, NULL);
> > > +
> > > +	/* Unregister DSI host */
> > > +	kmb_dsi_host_unregister();
> > > +	return 0;
> > > +}
> > > +
> > > +static int kmb_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = get_device(&pdev->dev);
> > > +	struct kmb_drm_private *kmb;
> > > +	int ret = 0;
> > > +
> > > +	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
> > > +	 * has a mipi_dsi_host to register its device to. So, we
> > > +	 * first register the DSI host during probe time, and then return
> > > +	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called
> > again
> > > +	 *  and then the rest of the driver initialization can proceed
> > > +	 *  afterwards and the bridge can be successfully attached.
> > > +	 */
> > > +	adv_bridge = kmb_dsi_host_bridge_init(dev);
> > > +
> > > +	if (adv_bridge == ERR_PTR(-EPROBE_DEFER)) {
> > > +		return -EPROBE_DEFER;
> > > +	} else if (IS_ERR(adv_bridge)) {
> > > +		DRM_ERROR("probe failed to initialize DSI host bridge\n");
> > > +		return PTR_ERR(adv_bridge);
> > > +	}
> > > +
> > > +	/* Create DRM device */
> > > +	kmb = devm_drm_dev_alloc(dev, &kmb_driver,
> > > +				 struct kmb_drm_private, drm);
> > > +	if (IS_ERR(kmb))
> > > +		return PTR_ERR(kmb);
> > > +
> > > +	dev_set_drvdata(dev, &kmb->drm);
> > > +
> > > +	ret = kmb_hw_init(&kmb->drm, 0);
> > > +	if (ret)
> > > +		goto err_free1;
> > > +
> > > +	ret = kmb_setup_mode_config(&kmb->drm);
> > > +	if (ret)
> > > +		goto err_free;
> > > +
> > > +	ret = drm_irq_install(&kmb->drm, kmb->irq_lcd);
> > > +	if (ret < 0) {
> > > +		drm_err(&kmb->drm, "failed to install IRQ handler\n");
> > > +		goto err_irq;
> > > +	}
> > > +
> > > +	drm_kms_helper_poll_init(&kmb->drm);
> > > +
> > > +	/* Register graphics device with the kernel */
> > > +	ret = drm_dev_register(&kmb->drm, 0);
> > > +	if (ret)
> > > +		goto err_register;
> > > +
> > > +	return 0;
> > > +
> > > + err_register:
> > > +	drm_kms_helper_poll_fini(&kmb->drm);
> > > + err_irq:
> > > +	pm_runtime_disable(kmb->drm.dev);
> > > + err_free:
> > > +	drm_crtc_cleanup(&kmb->crtc);
> > > +	drm_mode_config_cleanup(&kmb->drm);
> > > + err_free1:
> > > +	dev_set_drvdata(dev, NULL);
> > > +	kmb_dsi_host_unregister();
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct of_device_id kmb_of_match[] = {
> > > +	{.compatible = "intel,kmb_display"},
> > > +	{},
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, kmb_of_match);
> > > +
> > > +static int __maybe_unused kmb_pm_suspend(struct device *dev)
> > > +{
> > > +	struct drm_device *drm = dev_get_drvdata(dev);
> > > +	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
> > > +
> > > +	drm_kms_helper_poll_disable(drm);
> > > +
> > > +	kmb->state = drm_atomic_helper_suspend(drm);
> > > +	if (IS_ERR(kmb->state)) {
> > > +		drm_kms_helper_poll_enable(drm);
> > > +		return PTR_ERR(kmb->state);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused kmb_pm_resume(struct device *dev)
> > > +{
> > > +	struct drm_device *drm = dev_get_drvdata(dev);
> > > +	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
> > > +
> > > +	if (!kmb)
> > > +		return 0;
> > > +
> > > +	drm_atomic_helper_resume(drm, kmb->state);
> > > +	drm_kms_helper_poll_enable(drm);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend,
> > kmb_pm_resume);
> > > +
> > > +static struct platform_driver kmb_platform_driver = {
> > > +	.probe = kmb_probe,
> > > +	.remove = kmb_remove,
> > > +	.driver = {
> > > +		.name = "kmb-drm",
> > > +		.pm = &kmb_pm_ops,
> > > +		.of_match_table = kmb_of_match,
> > > +	},
> > > +};
> > > +
> > > +module_platform_driver(kmb_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Intel Corporation");
> > > +MODULE_DESCRIPTION("Keembay Display driver");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/gpu/drm/kmb/kmb_drv.h
> > b/drivers/gpu/drm/kmb/kmb_drv.h
> > > new file mode 100644
> > > index 0000000..352f2d2
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/kmb/kmb_drv.h
> > > @@ -0,0 +1,170 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only
> > > + *
> > > + * Copyright (c) 2018-2020 Intel Corporation
> > > + */
> > > +
> > > +#ifndef __KMB_DRV_H__
> > > +#define __KMB_DRV_H__
> > > +
> > > +#include "kmb_plane.h"
> > > +#include "kmb_regs.h"
> > > +
> > > +#define KMB_MAX_WIDTH			1920 /*max width in pixels
> > */
> > > +#define KMB_MAX_HEIGHT			1080 /*max height in
> > pixels */
> > > +#define KMB_MIN_WIDTH                   1920 /*max width in pixels */
> > > +#define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
> > > +#define KMB_LCD_DEFAULT_CLK		200000000
> > > +#define KMB_MIPI_DEFAULT_CLK		24000000
> > > +#define KMB_MIPI_DEFAULT_CFG_CLK	24000000
> > > +#define KMB_SYS_CLK_MHZ			500
> > > +
> > > +#define ICAM_MMIO		0x3b100000
> > > +#define ICAM_LCD_OFFSET		0x1080
> > > +#define ICAM_MMIO_SIZE		0x2000
> > > +
> > > +struct kmb_drm_private {
> > > +	struct drm_device		drm;
> > > +	void __iomem			*lcd_mmio;
> > > +	void __iomem			*mipi_mmio;
> > > +	void __iomem			*msscam_mmio;
> > > +	struct clk			*clk;
> > > +	struct drm_crtc			crtc;
> > > +	struct kmb_plane		*plane;
> > > +	struct drm_atomic_state		*state;
> > > +	spinlock_t			irq_lock;
> > > +	int				irq_lcd;
> > > +	int				irq_mipi;
> > > +	int				sys_clk_mhz;
> > > +	dma_addr_t			fb_addr;
> > > +	struct layer_status		plane_status[KMB_MAX_PLANES];
> > > +};
> > > +
> > > +struct kmb_clock {
> > > +	struct clk *clk_lcd;
> > > +	struct clk *clk_mipi;
> > > +	struct clk *clk_mipi_ecfg;
> > > +	struct clk *clk_mipi_cfg;
> > > +	struct clk *clk_pll0;
> > > +};
> > > +
> > > +static inline struct kmb_drm_private *to_kmb(const struct drm_device
> > *dev)
> > > +{
> > > +	return container_of(dev, struct kmb_drm_private, drm);
> > > +}
> > > +
> > > +static inline struct kmb_drm_private *crtc_to_kmb_priv(const struct
> > drm_crtc *x)
> > > +{
> > > +	return container_of(x, struct kmb_drm_private, crtc);
> > > +}
> > > +
> > > +struct blt_layer_config {
> > > +	unsigned char layer_format;
> > > +};
> > > +
> > > +static inline void kmb_write_lcd(struct kmb_drm_private *dev_p,
> > > +				 unsigned int reg, u32 value)
> > > +{
> > > +	writel(value, (dev_p->lcd_mmio + reg));
> > > +}
> > > +
> > > +static inline void kmb_write_mipi(struct kmb_drm_private *dev_p,
> > > +				  unsigned int reg, u32 value)
> > > +{
> > > +	writel(value, (dev_p->mipi_mmio + reg));
> > > +}
> > > +
> > > +static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
> > > +				    unsigned int reg, u32 value)
> > > +{
> > > +	writel(value, (dev_p->msscam_mmio + reg));
> > > +}
> > > +
> > > +static inline u32 kmb_read_msscam(struct kmb_drm_private *dev_p,
> > > +				  unsigned int reg)
> > > +{
> > > +	return readl(dev_p->msscam_mmio + reg);
> > > +}
> > > +
> > > +static inline void kmb_set_bitmask_msscam(struct kmb_drm_private
> > *dev_p,
> > > +					  unsigned int reg, u32 mask)
> > > +{
> > > +	u32 reg_val = kmb_read_msscam(dev_p, reg);
> > > +
> > > +	kmb_write_msscam(dev_p, reg, (reg_val | mask));
> > > +}
> > > +
> > > +static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p,
> > unsigned int reg)
> > > +{
> > > +	return readl(dev_p->lcd_mmio + reg);
> > > +}
> > > +
> > > +static inline void kmb_set_bitmask_lcd(struct kmb_drm_private
> > *dev_p,
> > > +				       unsigned int reg, u32 mask)
> > > +{
> > > +	u32 reg_val = kmb_read_lcd(dev_p, reg);
> > > +
> > > +	kmb_write_lcd(dev_p, reg, (reg_val | mask));
> > > +}
> > > +
> > > +static inline void kmb_clr_bitmask_lcd(struct kmb_drm_private *dev_p,
> > > +				       unsigned int reg, u32 mask)
> > > +{
> > > +	u32 reg_val = kmb_read_lcd(dev_p, reg);
> > > +
> > > +	kmb_write_lcd(dev_p, reg, (reg_val & (~mask)));
> > > +}
> > > +
> > > +static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p,
> > unsigned int reg)
> > > +{
> > > +	return readl(dev_p->mipi_mmio + reg);
> > > +}
> > > +
> > > +static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
> > > +				       unsigned int reg, u32 offset,
> > > +				       u32 num_bits, u32 value)
> > > +{
> > > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > > +	u32 mask = (1 << num_bits) - 1;
> > > +
> > > +	value &= mask;
> > > +	mask <<= offset;
> > > +	reg_val &= (~mask);
> > > +	reg_val |= (value << offset);
> > > +	kmb_write_mipi(dev_p, reg, reg_val);
> > > +}
> > > +
> > > +static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
> > > +				    unsigned int reg, u32 offset)
> > > +{
> > > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > > +
> > > +	kmb_write_mipi(dev_p, reg, reg_val | (1 << offset));
> > > +}
> > > +
> > > +static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
> > > +				    unsigned int reg, u32 offset)
> > > +{
> > > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > > +
> > > +	kmb_write_mipi(dev_p, reg, reg_val & (~(1 << offset)));
> > > +}
> > > +
> > > +static inline void kmb_set_bitmask_mipi(struct kmb_drm_private
> > *dev_p,
> > > +					unsigned int reg, u32 mask)
> > > +{
> > > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > > +
> > > +	kmb_write_mipi(dev_p, reg, (reg_val | mask));
> > > +}
> > > +
> > > +static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private
> > *dev_p,
> > > +					unsigned int reg, u32 mask)
> > > +{
> > > +	u32 reg_val = kmb_read_mipi(dev_p, reg);
> > > +
> > > +	kmb_write_mipi(dev_p, reg, (reg_val & (~mask)));
> > > +}
> > > +
> > > +int kmb_setup_crtc(struct drm_device *dev);
> > > +void kmb_set_scanout(struct kmb_drm_private *lcd);
> > > +#endif /* __KMB_DRV_H__ */
> > > diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> > b/drivers/gpu/drm/kmb/kmb_plane.c
> > > new file mode 100644
> > > index 0000000..d1e7786
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> > > @@ -0,0 +1,480 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2020 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_fb_cma_helper.h>
> > > +#include <drm/drm_fb_helper.h>
> > > +#include <drm/drm_fourcc.h>
> > > +#include <drm/drm_gem_cma_helper.h>
> > > +#include <drm/drm_managed.h>
> > > +#include <drm/drm_plane_helper.h>
> > > +
> > > +#include "kmb_drv.h"
> > > +#include "kmb_plane.h"
> > > +#include "kmb_regs.h"
> > > +
> > > +const u32 layer_irqs[] = {
> > > +	LCD_INT_VL0,
> > > +	LCD_INT_VL1,
> > > +	LCD_INT_GL0,
> > > +	LCD_INT_GL1
> > > +};
> > > +
> > > +static unsigned int check_pixel_format(struct drm_plane *plane, u32
> > format)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < plane->format_count; i++) {
> > > +		if (plane->format_types[i] == format)
> > > +			return 0;
> > > +	}
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int kmb_plane_atomic_check(struct drm_plane *plane,
> > > +				  struct drm_plane_state *state)
> > > +{
> > > +	struct drm_framebuffer *fb;
> > > +	int ret;
> > > +	struct drm_crtc_state *crtc_state;
> > > +	bool can_position;
> > > +
> > > +	fb = state->fb;
> > > +	if (!fb || !state->crtc)
> > > +		return 0;
> > > +
> > > +	ret = check_pixel_format(plane, fb->format->format);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h >
> > KMB_MAX_HEIGHT)
> > > +		return -EINVAL;
> > > +	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h <
> > KMB_MIN_HEIGHT)
> > > +		return -EINVAL;
> > > +	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
> > > +	crtc_state =
> > > +		drm_atomic_get_existing_crtc_state(state->state, state-
> > >crtc);
> > > +	return drm_atomic_helper_check_plane_state(state, crtc_state,
> > > +
> > DRM_PLANE_HELPER_NO_SCALING,
> > > +
> > DRM_PLANE_HELPER_NO_SCALING,
> > > +						 can_position, true);
> > > +}
> > > +
> > > +static void kmb_plane_atomic_disable(struct drm_plane *plane,
> > > +				     struct drm_plane_state *state)
> > > +{
> > > +	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> > > +	int plane_id = kmb_plane->id;
> > > +	struct kmb_drm_private *kmb;
> > > +
> > > +	kmb = to_kmb(plane->dev);
> > > +
> > > +	switch (plane_id) {
> > > +	case LAYER_0:
> > > +		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL1_ENABLE;
> > > +		break;
> > > +	case LAYER_1:
> > > +		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
> > > +		break;
> > > +	case LAYER_2:
> > > +		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> > > +		break;
> > > +	case LAYER_3:
> > > +		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> > > +		break;
> > > +	}
> > > +
> > > +	kmb->plane_status[plane_id].disable = true;
> > > +}
> > > +
> > > +unsigned int get_pixel_format(u32 format)
> > > +{
> > > +	unsigned int val = 0;
> > > +
> > > +	switch (format) {
> > > +		/* planar formats */
> > > +	case DRM_FORMAT_YUV444:
> > > +		val = LCD_LAYER_FORMAT_YCBCR444PLAN |
> > LCD_LAYER_PLANAR_STORAGE;
> > > +		break;
> > > +	case DRM_FORMAT_YVU444:
> > > +		val = LCD_LAYER_FORMAT_YCBCR444PLAN |
> > LCD_LAYER_PLANAR_STORAGE
> > > +		    | LCD_LAYER_CRCB_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_YUV422:
> > > +		val = LCD_LAYER_FORMAT_YCBCR422PLAN |
> > LCD_LAYER_PLANAR_STORAGE;
> > > +		break;
> > > +	case DRM_FORMAT_YVU422:
> > > +		val = LCD_LAYER_FORMAT_YCBCR422PLAN |
> > LCD_LAYER_PLANAR_STORAGE
> > > +		    | LCD_LAYER_CRCB_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_YUV420:
> > > +		val = LCD_LAYER_FORMAT_YCBCR420PLAN |
> > LCD_LAYER_PLANAR_STORAGE;
> > > +		break;
> > > +	case DRM_FORMAT_YVU420:
> > > +		val = LCD_LAYER_FORMAT_YCBCR420PLAN |
> > LCD_LAYER_PLANAR_STORAGE
> > > +		    | LCD_LAYER_CRCB_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_NV12:
> > > +		val = LCD_LAYER_FORMAT_NV12 |
> > LCD_LAYER_PLANAR_STORAGE;
> > > +		break;
> > > +	case DRM_FORMAT_NV21:
> > > +		val = LCD_LAYER_FORMAT_NV12 |
> > LCD_LAYER_PLANAR_STORAGE
> > > +		    | LCD_LAYER_CRCB_ORDER;
> > > +		break;
> > > +		/* packed formats */
> > > +		/* looks hw requires B & G to be swapped when RGB */
> > > +	case DRM_FORMAT_RGB332:
> > > +		val = LCD_LAYER_FORMAT_RGB332 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_XBGR4444:
> > > +		val = LCD_LAYER_FORMAT_RGBX4444;
> > > +		break;
> > > +	case DRM_FORMAT_ARGB4444:
> > > +		val = LCD_LAYER_FORMAT_RGBA4444 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_ABGR4444:
> > > +		val = LCD_LAYER_FORMAT_RGBA4444;
> > > +		break;
> > > +	case DRM_FORMAT_XRGB1555:
> > > +		val = LCD_LAYER_FORMAT_XRGB1555 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_XBGR1555:
> > > +		val = LCD_LAYER_FORMAT_XRGB1555;
> > > +		break;
> > > +	case DRM_FORMAT_ARGB1555:
> > > +		val = LCD_LAYER_FORMAT_RGBA1555 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_ABGR1555:
> > > +		val = LCD_LAYER_FORMAT_RGBA1555;
> > > +		break;
> > > +	case DRM_FORMAT_RGB565:
> > > +		val = LCD_LAYER_FORMAT_RGB565 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_BGR565:
> > > +		val = LCD_LAYER_FORMAT_RGB565;
> > > +		break;
> > > +	case DRM_FORMAT_RGB888:
> > > +		val = LCD_LAYER_FORMAT_RGB888 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_BGR888:
> > > +		val = LCD_LAYER_FORMAT_RGB888;
> > > +		break;
> > > +	case DRM_FORMAT_XRGB8888:
> > > +		val = LCD_LAYER_FORMAT_RGBX8888 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_XBGR8888:
> > > +		val = LCD_LAYER_FORMAT_RGBX8888;
> > > +		break;
> > > +	case DRM_FORMAT_ARGB8888:
> > > +		val = LCD_LAYER_FORMAT_RGBA8888 |
> > LCD_LAYER_BGR_ORDER;
> > > +		break;
> > > +	case DRM_FORMAT_ABGR8888:
> > > +		val = LCD_LAYER_FORMAT_RGBA8888;
> > > +		break;
> > > +	}
> > > +	DRM_INFO_ONCE("%s : %d format=0x%x val=0x%x\n",
> > > +		      __func__, __LINE__, format, val);
> > > +	return val;
> > > +}
> > > +
> > > +unsigned int get_bits_per_pixel(const struct drm_format_info *format)
> > > +{
> > > +	u32 bpp = 0;
> > > +	unsigned int val = 0;
> > > +
> > > +	if (format->num_planes > 1) {
> > > +		val = LCD_LAYER_8BPP;
> > > +		return val;
> > > +	}
> > > +
> > > +	bpp += 8 * format->cpp[0];
> > > +
> > > +	switch (bpp) {
> > > +	case 8:
> > > +		val = LCD_LAYER_8BPP;
> > > +		break;
> > > +	case 16:
> > > +		val = LCD_LAYER_16BPP;
> > > +		break;
> > > +	case 24:
> > > +		val = LCD_LAYER_24BPP;
> > > +		break;
> > > +	case 32:
> > > +		val = LCD_LAYER_32BPP;
> > > +		break;
> > > +	}
> > > +
> > > +	DRM_DEBUG("bpp=%d val=0x%x\n", bpp, val);
> > > +	return val;
> > > +}
> > > +
> > > +static void config_csc(struct kmb_drm_private *kmb, int plane_id)
> > > +{
> > > +	/* YUV to RGB conversion using the fixed matrix csc_coef_lcd */
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF11(plane_id),
> > csc_coef_lcd[0]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF12(plane_id),
> > csc_coef_lcd[1]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF13(plane_id),
> > csc_coef_lcd[2]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF21(plane_id),
> > csc_coef_lcd[3]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF22(plane_id),
> > csc_coef_lcd[4]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF23(plane_id),
> > csc_coef_lcd[5]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF31(plane_id),
> > csc_coef_lcd[6]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF32(plane_id),
> > csc_coef_lcd[7]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_COEFF33(plane_id),
> > csc_coef_lcd[8]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF1(plane_id),
> > csc_coef_lcd[9]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF2(plane_id),
> > csc_coef_lcd[10]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CSC_OFF3(plane_id),
> > csc_coef_lcd[11]);
> > > +}
> > > +
> > > +static void kmb_plane_atomic_update(struct drm_plane *plane,
> > > +				    struct drm_plane_state *state)
> > > +{
> > > +	struct drm_framebuffer *fb;
> > > +	struct kmb_drm_private *kmb;
> > > +	unsigned int width;
> > > +	unsigned int height;
> > > +	unsigned int dma_len;
> > > +	struct kmb_plane *kmb_plane;
> > > +	unsigned int dma_cfg;
> > > +	unsigned int ctrl = 0, val = 0, out_format = 0;
> > > +	unsigned int src_w, src_h, crtc_x, crtc_y;
> > > +	unsigned char plane_id;
> > > +	int num_planes;
> > > +	static dma_addr_t addr[MAX_SUB_PLANES];
> > > +
> > > +	if (!plane || !plane->state || !state)
> > > +		return;
> > > +
> > > +	fb = plane->state->fb;
> > > +	if (!fb)
> > > +		return;
> > > +	num_planes = fb->format->num_planes;
> > > +	kmb_plane = to_kmb_plane(plane);
> > > +	plane_id = kmb_plane->id;
> > > +
> > > +	kmb = to_kmb(plane->dev);
> > > +
> > > +	if (kmb_under_flow || kmb_flush_done) {
> > > +		drm_dbg(&kmb->drm, "plane_update:underflow!!!!
> > returning");
> > > +		return;
> > > +	}
> > > +
> > > +	src_w = (plane->state->src_w >> 16);
> > > +	src_h = plane->state->src_h >> 16;
> > > +	crtc_x = plane->state->crtc_x;
> > > +	crtc_y = plane->state->crtc_y;
> > > +
> > > +	drm_dbg(&kmb->drm,
> > > +		"src_w=%d src_h=%d, fb->format->format=0x%x fb-
> > >flags=0x%x\n",
> > > +		  src_w, src_h, fb->format->format, fb->flags);
> > > +
> > > +	width = fb->width;
> > > +	height = fb->height;
> > > +	dma_len = (width * height * fb->format->cpp[0]);
> > > +	drm_dbg(&kmb->drm, "dma_len=%d ", dma_len);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
> > dma_len);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
> > > +		      fb->pitches[0]);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
> > > +		      (width * fb->format->cpp[0]));
> > > +
> > > +	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
> > > +	kmb->fb_addr = addr[Y_PLANE];
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
> > > +		      addr[Y_PLANE] + fb->offsets[0]);
> > > +	val = get_pixel_format(fb->format->format);
> > > +	val |= get_bits_per_pixel(fb->format);
> > > +	/* Program Cb/Cr for planar formats */
> > > +	if (num_planes > 1) {
> > > +		kmb_write_lcd(kmb,
> > LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> > > +			      width * fb->format->cpp[0]);
> > > +		kmb_write_lcd(kmb,
> > LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
> > > +			      (width * fb->format->cpp[0]));
> > > +
> > > +		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane-
> > >state,
> > > +							U_PLANE);
> > > +		/* check if Cb/Cr is swapped*/
> > > +		if (num_planes == 3 && (val & LCD_LAYER_CRCB_ORDER))
> > > +			kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > > +					addr[U_PLANE]);
> > > +		else
> > > +			kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > > +					addr[U_PLANE]);
> > > +
> > > +		if (num_planes == 3) {
> > > +			kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> > > +				      ((width) * fb->format->cpp[0]));
> > > +
> > > +			kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> > > +				      ((width) * fb->format->cpp[0]));
> > > +
> > > +			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
> > > +								plane->state,
> > > +								V_PLANE);
> > > +
> > > +			/* check if Cb/Cr is swapped*/
> > > +			if (val & LCD_LAYER_CRCB_ORDER)
> > > +				kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_START_CB_ADR(plane_id),
> > > +					      addr[V_PLANE]);
> > > +			else
> > > +				kmb_write_lcd(kmb,
> > > +
> > LCD_LAYERn_DMA_START_CR_ADR(plane_id),
> > > +					      addr[V_PLANE]);
> > > +		}
> > > +	}
> > > +
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_COL_START(plane_id), crtc_x);
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_ROW_START(plane_id), crtc_y);
> > > +
> > > +	val |= LCD_LAYER_FIFO_100;
> > > +
> > > +	if (val & LCD_LAYER_PLANAR_STORAGE) {
> > > +		val |= LCD_LAYER_CSC_EN;
> > > +
> > > +		/* Enable CSC if input is planar and output is RGB */
> > > +		config_csc(kmb, plane_id);
> > > +	}
> > > +
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_CFG(plane_id), val);
> > > +
> > > +	switch (plane_id) {
> > > +	case LAYER_0:
> > > +		ctrl = LCD_CTRL_VL1_ENABLE;
> > > +		break;
> > > +	case LAYER_1:
> > > +		ctrl = LCD_CTRL_VL2_ENABLE;
> > > +		break;
> > > +	case LAYER_2:
> > > +		ctrl = LCD_CTRL_GL1_ENABLE;
> > > +		break;
> > > +	case LAYER_3:
> > > +		ctrl = LCD_CTRL_GL2_ENABLE;
> > > +		break;
> > > +	}
> > > +
> > > +	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
> > > +	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
> > > +
> > > +	/* LCD is connected to MIPI on kmb
> > > +	 * Therefore this bit is required for DSI Tx
> > > +	 */
> > > +	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
> > > +
> > > +	kmb_set_bitmask_lcd(kmb, LCD_CONTROL, ctrl);
> > > +
> > > +	/* FIXME no doc on how to set output format,these values are
> > > +	 * taken from the Myriadx tests
> > > +	 */
> > > +	out_format |= LCD_OUTF_FORMAT_RGB888;
> > > +
> > > +	/* Leave RGB order,conversion mode and clip mode to default */
> > > +	/* do not interleave RGB channels for mipi Tx compatibility */
> > > +	out_format |= LCD_OUTF_MIPI_RGB_MODE;
> > > +	kmb_write_lcd(kmb, LCD_OUT_FORMAT_CFG, out_format);
> > > +
> > > +	dma_cfg = LCD_DMA_LAYER_ENABLE |
> > LCD_DMA_LAYER_VSTRIDE_EN |
> > > +	    LCD_DMA_LAYER_CONT_UPDATE |
> > LCD_DMA_LAYER_AXI_BURST_16;
> > > +
> > > +	/* Enable DMA */
> > > +	kmb_write_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
> > > +	drm_dbg(&kmb->drm, "dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
> > dma_cfg,
> > > +		kmb_read_lcd(kmb, LCD_LAYERn_DMA_CFG(plane_id)));
> > > +
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_CLEAR, LCD_INT_EOF |
> > > +			LCD_INT_DMA_ERR);
> > > +	kmb_set_bitmask_lcd(kmb, LCD_INT_ENABLE, LCD_INT_EOF |
> > > +			LCD_INT_DMA_ERR);
> > > +}
> > > +
> > > +static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
> > > +	.atomic_check = kmb_plane_atomic_check,
> > > +	.atomic_update = kmb_plane_atomic_update,
> > > +	.atomic_disable = kmb_plane_atomic_disable
> > > +};
> > > +
> > > +void kmb_plane_destroy(struct drm_plane *plane)
> > > +{
> > > +	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
> > > +
> > > +	drm_plane_cleanup(plane);
> > > +	kfree(kmb_plane);
> > > +}
> > > +
> > > +static const struct drm_plane_funcs kmb_plane_funcs = {
> > > +	.update_plane = drm_atomic_helper_update_plane,
> > > +	.disable_plane = drm_atomic_helper_disable_plane,
> > > +	.destroy = kmb_plane_destroy,
> > > +	.reset = drm_atomic_helper_plane_reset,
> > > +	.atomic_duplicate_state =
> > drm_atomic_helper_plane_duplicate_state,
> > > +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > > +};
> > > +
> > > +struct kmb_plane *kmb_plane_init(struct drm_device *drm)
> > > +{
> > > +	struct kmb_drm_private *kmb = to_kmb(drm);
> > > +	struct kmb_plane *plane = NULL;
> > > +	struct kmb_plane *primary = NULL;
> > > +	int i = 0;
> > > +	int ret = 0;
> > > +	enum drm_plane_type plane_type;
> > > +	const u32 *plane_formats;
> > > +	int num_plane_formats;
> > > +
> > > +	for (i = 0; i < KMB_MAX_PLANES; i++) {
> > > +		plane = drmm_kzalloc(drm, sizeof(*plane), GFP_KERNEL);
> > > +
> > > +		if (!plane) {
> > > +			drm_err(drm, "Failed to allocate plane\n");
> > > +			return ERR_PTR(-ENOMEM);
> > > +		}
> > > +
> > > +		plane_type = (i == 0) ? DRM_PLANE_TYPE_PRIMARY :
> > > +		    DRM_PLANE_TYPE_OVERLAY;
> > > +		if (i < 2) {
> > > +			plane_formats = kmb_formats_v;
> > > +			num_plane_formats =
> > ARRAY_SIZE(kmb_formats_v);
> > > +		} else {
> > > +			plane_formats = kmb_formats_g;
> > > +			num_plane_formats =
> > ARRAY_SIZE(kmb_formats_g);
> > > +		}
> > > +
> > > +		ret = drm_universal_plane_init(drm, &plane->base_plane,
> > > +					       POSSIBLE_CRTCS,
> > &kmb_plane_funcs,
> > > +					       plane_formats,
> > num_plane_formats,
> > > +					       NULL, plane_type, "plane %d", i);
> > > +		if (ret < 0) {
> > > +			drm_err(drm, "drm_universal_plane_init failed
> > (ret=%d)",
> > > +				ret);
> > > +			goto cleanup;
> > > +		}
> > > +		drm_dbg(drm, "%s : %d i=%d type=%d",
> > > +			__func__, __LINE__,
> > > +			  i, plane_type);
> > > +		drm_plane_helper_add(&plane->base_plane,
> > > +				     &kmb_plane_helper_funcs);
> > > +		if (plane_type == DRM_PLANE_TYPE_PRIMARY) {
> > > +			primary = plane;
> > > +			kmb->plane = plane;
> > > +		}
> > > +		drm_dbg(drm, "%s : %d primary=%p\n", __func__,
> > __LINE__,
> > > +			&primary->base_plane);
> > > +		plane->id = i;
> > > +	}
> > > +
> > > +	return primary;
> > > +cleanup:
> > > +	drmm_kfree(drm, plane);
> > > +	return ERR_PTR(ret);
> > > +}
> > > diff --git a/drivers/gpu/drm/kmb/kmb_plane.h
> > b/drivers/gpu/drm/kmb/kmb_plane.h
> > > new file mode 100644
> > > index 0000000..141cdaa
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> > > @@ -0,0 +1,110 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only
> > > + *
> > > + * Copyright (c) 2018-2020 Intel Corporation
> > > + */
> > > +
> > > +#ifndef __KMB_PLANE_H__
> > > +#define __KMB_PLANE_H__
> > > +
> > > +extern int kmb_under_flow;
> > > +extern int kmb_flush_done;
> > > +
> > > +#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
> > > +			(LAYER0_DMA_FIFO_OVERFLOW) | \
> > > +			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
> > > +			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
> > > +			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
> > > +			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
> > > +
> > > +#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
> > > +			(LAYER1_DMA_FIFO_OVERFLOW) | \
> > > +			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
> > > +			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
> > > +			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
> > > +			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
> > > +
> > > +#define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW |
> > LAYER2_DMA_FIFO_UNDERFLOW)
> > > +#define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW |
> > LAYER3_DMA_FIFO_UNDERFLOW)
> > > +#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE |
> > LCD_INT_VL0_ERR)
> > > +#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE |
> > LCD_INT_VL1_ERR)
> > > +#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE |
> > LCD_INT_GL0_ERR)
> > > +#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE |
> > LCD_INT_GL1_ERR)
> > > +#define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
> > > +		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
> > > +
> > > +#define POSSIBLE_CRTCS 1
> > > +#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
> > > +
> > > +enum layer_id {
> > > +	LAYER_0,
> > > +	LAYER_1,
> > > +	LAYER_2,
> > > +	LAYER_3,
> > > +	/* KMB_MAX_PLANES */
> > > +};
> > > +
> > > +#define KMB_MAX_PLANES 1
> > > +
> > > +enum sub_plane_id {
> > > +	Y_PLANE,
> > > +	U_PLANE,
> > > +	V_PLANE,
> > > +	MAX_SUB_PLANES,
> > > +};
> > > +
> > > +struct kmb_plane {
> > > +	struct drm_plane base_plane;
> > > +	unsigned char id;
> > > +};
> > > +
> > > +/* Graphics layer (layers 2 & 3) formats, only packed formats  are
> > supported */
> > > +static const u32 kmb_formats_g[] = {
> > > +	DRM_FORMAT_RGB332,
> > > +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > > +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > > +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > > +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > > +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > > +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > > +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > > +};
> > > +
> > > +#define MAX_FORMAT_G	(ARRAY_SIZE(kmb_formats_g))
> > > +#define MAX_FORMAT_V	(ARRAY_SIZE(kmb_formats_v))
> > > +
> > > +/* Video layer ( 0 & 1) formats, packed and planar formats are
> > supported */
> > > +static const u32 kmb_formats_v[] = {
> > > +	/* packed formats */
> > > +	DRM_FORMAT_RGB332,
> > > +	DRM_FORMAT_XRGB4444, DRM_FORMAT_XBGR4444,
> > > +	DRM_FORMAT_ARGB4444, DRM_FORMAT_ABGR4444,
> > > +	DRM_FORMAT_XRGB1555, DRM_FORMAT_XBGR1555,
> > > +	DRM_FORMAT_ARGB1555, DRM_FORMAT_ABGR1555,
> > > +	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
> > > +	DRM_FORMAT_RGB888, DRM_FORMAT_BGR888,
> > > +	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
> > > +	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
> > > +	/*planar formats */
> > > +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420,
> > > +	DRM_FORMAT_YUV422, DRM_FORMAT_YVU422,
> > > +	DRM_FORMAT_YUV444, DRM_FORMAT_YVU444,
> > > +	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
> > > +};
> > > +
> > > +/* Conversion (yuv->rgb) matrix from myriadx */
> > > +static const u32 csc_coef_lcd[] = {
> > > +	1024, 0, 1436,
> > > +	1024, -352, -731,
> > > +	1024, 1814, 0,
> > > +	-179, 125, -226
> > > +};
> > 
> > The static const arrays above look a bit strange in a header file (and
> > could result in duplication in the driver .ko), please move to .c files.
> > Headers should only contain definitions, not declarations of actual
> > storage.
> > 
> > Cheers, Daniel
> > 
> > > +
> > > +struct layer_status {
> > > +	bool disable;
> > > +	u32 ctrl;
> > > +};
> > > +
> > > +struct kmb_plane *kmb_plane_init(struct drm_device *drm);
> > > +void kmb_plane_destroy(struct drm_plane *plane);
> > > +#endif /* __KMB_PLANE_H__ */
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
