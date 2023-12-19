Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBF8192DA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3346110E51C;
	Tue, 19 Dec 2023 22:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0012F10E503
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B558F614EF;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA8DAC433A9;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=0D+ON4oeNZOeVZXfD0xqsLjuyAIQe7lSx7T2s4D02kg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LXY5nwUuWkFXcqJ0M4HhBKX8XcUbGbQqNdy/i6rWxP/2H9mffS6iZZdkz5ul6EAKM
 xUyTEfSMdKhMAWecD7Saffl1l7efnxUbjZW/CvH6+HogO1GFua6d5/Dhxav5u89V/s
 azI/YnZRzJaXn4H8iTni+QBIWOo6iieFo6ZeNaasGYVOP0rS8AoWC3bb73f0sGg2vA
 u8o62fZ92Xaj7mQiPs2Y71v2t+eMQFsrXyCOsWwqR0MOJj4qjm0rYu/kGsVJgxHDi2
 v+krUBNwLjSt28vkT1dmQ9OaSU5vipcOt02eFXkUkHvF976bqTgIvxhb8PsDVMU+dU
 tYejJJPqrURmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AC88EC46CD2;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:32 +0100
Subject: [PATCH 27/27] fbdev/p9100: Drop now unused driver p9100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-27-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=11715;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=iA8JbwHY6fG7LBqaMIwOpi+rv8FIlfD/a+18lk+a/yg=; =?utf-8?q?b=3DxLx8QJT1DeN/?=
 =?utf-8?q?31Tp0n1Pwf61zbQdWjbuL9/LAngB/OMqRezOKwU12aE8l2/DawT+XUglCsLZwYk5?=
 uBsoLHkbA8MMLhEwcKYYskx/v8q/PkFcAgt9QkgeNdcf0z4sU+Va
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The p9100 driver is only relevant for the Sparcbook 3 machine,
and with sun4m support removed this driver is no longer relevant.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig  |   8 -
 drivers/video/fbdev/Makefile |   1 -
 drivers/video/fbdev/p9100.c  | 372 -------------------------------------------
 3 files changed, 381 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 94f6dca5856f..ebcc3815c7a5 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -576,14 +576,6 @@ config FB_CG14
 	  This is the frame buffer device driver for the CGfourteen frame
 	  buffer on Desktop SPARCsystems with the SX graphics option.
 
-config FB_P9100
-	bool "P9100 (Sparcbook 3 only) support"
-	depends on FB_SBUS
-	select FB_SBUS_HELPERS
-	help
-	  This is the frame buffer device driver for the P9100 card
-	  supported on Sparcbook 3 machines.
-
 config FB_LEO
 	bool "Leo (ZX) support"
 	depends on FB_SBUS
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index 8e15220152bd..bc9b24648347 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -51,7 +51,6 @@ obj-$(CONFIG_FB_CG6)              += cg6.o
 obj-$(CONFIG_FB_CG3)              += cg3.o
 obj-$(CONFIG_FB_BW2)              += bw2.o
 obj-$(CONFIG_FB_CG14)             += cg14.o
-obj-$(CONFIG_FB_P9100)            += p9100.o
 obj-$(CONFIG_FB_TCX)              += tcx.o
 obj-$(CONFIG_FB_LEO)              += leo.o
 obj-$(CONFIG_FB_ACORN)            += acornfb.o
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
deleted file mode 100644
index e1356f8a866e..000000000000
--- a/drivers/video/fbdev/p9100.c
+++ /dev/null
@@ -1,372 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* p9100.c: P9100 frame buffer driver
- *
- * Copyright (C) 2003, 2006 David S. Miller (davem@davemloft.net)
- * Copyright 1999 Derrick J Brashear (shadow@dementia.org)
- *
- * Driver layout based loosely on tgafb.c, see that file for credits.
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/delay.h>
-#include <linux/init.h>
-#include <linux/fb.h>
-#include <linux/mm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-
-#include <asm/io.h>
-#include <asm/fbio.h>
-
-#include "sbuslib.h"
-
-/*
- * Local functions.
- */
-
-static int p9100_setcolreg(unsigned, unsigned, unsigned, unsigned,
-			   unsigned, struct fb_info *);
-static int p9100_blank(int, struct fb_info *);
-
-static int p9100_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
-static int p9100_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
-
-/*
- *  Frame buffer operations
- */
-
-static const struct fb_ops p9100_ops = {
-	.owner			= THIS_MODULE,
-	FB_DEFAULT_SBUS_OPS(p9100),
-	.fb_setcolreg		= p9100_setcolreg,
-	.fb_blank		= p9100_blank,
-};
-
-/* P9100 control registers */
-#define P9100_SYSCTL_OFF	0x0UL
-#define P9100_VIDEOCTL_OFF	0x100UL
-#define P9100_VRAMCTL_OFF 	0x180UL
-#define P9100_RAMDAC_OFF 	0x200UL
-#define P9100_VIDEOCOPROC_OFF 	0x400UL
-
-/* P9100 command registers */
-#define P9100_CMD_OFF 0x0UL
-
-/* P9100 framebuffer memory */
-#define P9100_FB_OFF 0x0UL
-
-/* 3 bits: 2=8bpp 3=16bpp 5=32bpp 7=24bpp */
-#define SYS_CONFIG_PIXELSIZE_SHIFT 26
-
-#define SCREENPAINT_TIMECTL1_ENABLE_VIDEO 0x20 /* 0 = off, 1 = on */
-
-struct p9100_regs {
-	/* Registers for the system control */
-	u32 sys_base;
-	u32 sys_config;
-	u32 sys_intr;
-	u32 sys_int_ena;
-	u32 sys_alt_rd;
-	u32 sys_alt_wr;
-	u32 sys_xxx[58];
-
-	/* Registers for the video control */
-	u32 vid_base;
-	u32 vid_hcnt;
-	u32 vid_htotal;
-	u32 vid_hsync_rise;
-	u32 vid_hblank_rise;
-	u32 vid_hblank_fall;
-	u32 vid_hcnt_preload;
-	u32 vid_vcnt;
-	u32 vid_vlen;
-	u32 vid_vsync_rise;
-	u32 vid_vblank_rise;
-	u32 vid_vblank_fall;
-	u32 vid_vcnt_preload;
-	u32 vid_screenpaint_addr;
-	u32 vid_screenpaint_timectl1;
-	u32 vid_screenpaint_qsfcnt;
-	u32 vid_screenpaint_timectl2;
-	u32 vid_xxx[15];
-
-	/* Registers for the video control */
-	u32 vram_base;
-	u32 vram_memcfg;
-	u32 vram_refresh_pd;
-	u32 vram_refresh_cnt;
-	u32 vram_raslo_max;
-	u32 vram_raslo_cur;
-	u32 pwrup_cfg;
-	u32 vram_xxx[25];
-
-	/* Registers for IBM RGB528 Palette */
-	u32 ramdac_cmap_wridx;
-	u32 ramdac_palette_data;
-	u32 ramdac_pixel_mask;
-	u32 ramdac_palette_rdaddr;
-	u32 ramdac_idx_lo;
-	u32 ramdac_idx_hi;
-	u32 ramdac_idx_data;
-	u32 ramdac_idx_ctl;
-	u32 ramdac_xxx[1784];
-};
-
-struct p9100_cmd_parameng {
-	u32 parameng_status;
-	u32 parameng_bltcmd;
-	u32 parameng_quadcmd;
-};
-
-struct p9100_par {
-	spinlock_t		lock;
-	struct p9100_regs	__iomem *regs;
-
-	u32			flags;
-#define P9100_FLAG_BLANKED	0x00000001
-
-	unsigned long		which_io;
-};
-
-/**
- *      p9100_setcolreg - Optional function. Sets a color register.
- *      @regno: boolean, 0 copy local, 1 get_user() function
- *      @red: frame buffer colormap structure
- *      @green: The green value which can be up to 16 bits wide
- *      @blue:  The blue value which can be up to 16 bits wide.
- *      @transp: If supported the alpha value which can be up to 16 bits wide.
- *      @info: frame buffer info structure
- */
-static int p9100_setcolreg(unsigned regno,
-			   unsigned red, unsigned green, unsigned blue,
-			   unsigned transp, struct fb_info *info)
-{
-	struct p9100_par *par = (struct p9100_par *) info->par;
-	struct p9100_regs __iomem *regs = par->regs;
-	unsigned long flags;
-
-	if (regno >= 256)
-		return 1;
-
-	red >>= 8;
-	green >>= 8;
-	blue >>= 8;
-
-	spin_lock_irqsave(&par->lock, flags);
-
-	sbus_writel((regno << 16), &regs->ramdac_cmap_wridx);
-	sbus_writel((red << 16), &regs->ramdac_palette_data);
-	sbus_writel((green << 16), &regs->ramdac_palette_data);
-	sbus_writel((blue << 16), &regs->ramdac_palette_data);
-
-	spin_unlock_irqrestore(&par->lock, flags);
-
-	return 0;
-}
-
-/**
- *      p9100_blank - Optional function.  Blanks the display.
- *      @blank: the blank mode we want.
- *      @info: frame buffer structure that represents a single frame buffer
- */
-static int
-p9100_blank(int blank, struct fb_info *info)
-{
-	struct p9100_par *par = (struct p9100_par *) info->par;
-	struct p9100_regs __iomem *regs = par->regs;
-	unsigned long flags;
-	u32 val;
-
-	spin_lock_irqsave(&par->lock, flags);
-
-	switch (blank) {
-	case FB_BLANK_UNBLANK: /* Unblanking */
-		val = sbus_readl(&regs->vid_screenpaint_timectl1);
-		val |= SCREENPAINT_TIMECTL1_ENABLE_VIDEO;
-		sbus_writel(val, &regs->vid_screenpaint_timectl1);
-		par->flags &= ~P9100_FLAG_BLANKED;
-		break;
-
-	case FB_BLANK_NORMAL: /* Normal blanking */
-	case FB_BLANK_VSYNC_SUSPEND: /* VESA blank (vsync off) */
-	case FB_BLANK_HSYNC_SUSPEND: /* VESA blank (hsync off) */
-	case FB_BLANK_POWERDOWN: /* Poweroff */
-		val = sbus_readl(&regs->vid_screenpaint_timectl1);
-		val &= ~SCREENPAINT_TIMECTL1_ENABLE_VIDEO;
-		sbus_writel(val, &regs->vid_screenpaint_timectl1);
-		par->flags |= P9100_FLAG_BLANKED;
-		break;
-	}
-
-	spin_unlock_irqrestore(&par->lock, flags);
-
-	return 0;
-}
-
-static struct sbus_mmap_map p9100_mmap_map[] = {
-	{ CG3_MMAP_OFFSET,	0,		SBUS_MMAP_FBSIZE(1) },
-	{ 0,			0,		0		    }
-};
-
-static int p9100_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct p9100_par *par = (struct p9100_par *)info->par;
-
-	return sbusfb_mmap_helper(p9100_mmap_map,
-				  info->fix.smem_start, info->fix.smem_len,
-				  par->which_io, vma);
-}
-
-static int p9100_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
-{
-	/* Make it look like a cg3. */
-	return sbusfb_ioctl_helper(cmd, arg, info,
-				   FBTYPE_SUN3COLOR, 8, info->fix.smem_len);
-}
-
-/*
- *  Initialisation
- */
-
-static void p9100_init_fix(struct fb_info *info, int linebytes, struct device_node *dp)
-{
-	snprintf(info->fix.id, sizeof(info->fix.id), "%pOFn", dp);
-
-	info->fix.type = FB_TYPE_PACKED_PIXELS;
-	info->fix.visual = FB_VISUAL_PSEUDOCOLOR;
-
-	info->fix.line_length = linebytes;
-
-	info->fix.accel = FB_ACCEL_SUN_CGTHREE;
-}
-
-static int p9100_probe(struct platform_device *op)
-{
-	struct device_node *dp = op->dev.of_node;
-	struct fb_info *info;
-	struct p9100_par *par;
-	int linebytes, err;
-
-	info = framebuffer_alloc(sizeof(struct p9100_par), &op->dev);
-
-	err = -ENOMEM;
-	if (!info)
-		goto out_err;
-	par = info->par;
-
-	spin_lock_init(&par->lock);
-
-	/* This is the framebuffer and the only resource apps can mmap.  */
-	info->fix.smem_start = op->resource[2].start;
-	par->which_io = op->resource[2].flags & IORESOURCE_BITS;
-
-	sbusfb_fill_var(&info->var, dp, 8);
-	info->var.red.length = 8;
-	info->var.green.length = 8;
-	info->var.blue.length = 8;
-
-	linebytes = of_getintprop_default(dp, "linebytes", info->var.xres);
-	info->fix.smem_len = PAGE_ALIGN(linebytes * info->var.yres);
-
-	par->regs = of_ioremap(&op->resource[0], 0,
-			       sizeof(struct p9100_regs), "p9100 regs");
-	if (!par->regs)
-		goto out_release_fb;
-
-	info->fbops = &p9100_ops;
-	info->screen_base = of_ioremap(&op->resource[2], 0,
-				       info->fix.smem_len, "p9100 ram");
-	if (!info->screen_base)
-		goto out_unmap_regs;
-
-	p9100_blank(FB_BLANK_UNBLANK, info);
-
-	if (fb_alloc_cmap(&info->cmap, 256, 0))
-		goto out_unmap_screen;
-
-	p9100_init_fix(info, linebytes, dp);
-
-	err = register_framebuffer(info);
-	if (err < 0)
-		goto out_dealloc_cmap;
-
-	fb_set_cmap(&info->cmap, info);
-
-	dev_set_drvdata(&op->dev, info);
-
-	printk(KERN_INFO "%pOF: p9100 at %lx:%lx\n",
-	       dp,
-	       par->which_io, info->fix.smem_start);
-
-	return 0;
-
-out_dealloc_cmap:
-	fb_dealloc_cmap(&info->cmap);
-
-out_unmap_screen:
-	of_iounmap(&op->resource[2], info->screen_base, info->fix.smem_len);
-
-out_unmap_regs:
-	of_iounmap(&op->resource[0], par->regs, sizeof(struct p9100_regs));
-
-out_release_fb:
-	framebuffer_release(info);
-
-out_err:
-	return err;
-}
-
-static void p9100_remove(struct platform_device *op)
-{
-	struct fb_info *info = dev_get_drvdata(&op->dev);
-	struct p9100_par *par = info->par;
-
-	unregister_framebuffer(info);
-	fb_dealloc_cmap(&info->cmap);
-
-	of_iounmap(&op->resource[0], par->regs, sizeof(struct p9100_regs));
-	of_iounmap(&op->resource[2], info->screen_base, info->fix.smem_len);
-
-	framebuffer_release(info);
-}
-
-static const struct of_device_id p9100_match[] = {
-	{
-		.name = "p9100",
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, p9100_match);
-
-static struct platform_driver p9100_driver = {
-	.driver = {
-		.name = "p9100",
-		.of_match_table = p9100_match,
-	},
-	.probe		= p9100_probe,
-	.remove_new	= p9100_remove,
-};
-
-static int __init p9100_init(void)
-{
-	if (fb_get_options("p9100fb", NULL))
-		return -ENODEV;
-
-	return platform_driver_register(&p9100_driver);
-}
-
-static void __exit p9100_exit(void)
-{
-	platform_driver_unregister(&p9100_driver);
-}
-
-module_init(p9100_init);
-module_exit(p9100_exit);
-
-MODULE_DESCRIPTION("framebuffer driver for P9100 chipsets");
-MODULE_AUTHOR("David S. Miller <davem@davemloft.net>");
-MODULE_VERSION("2.0");
-MODULE_LICENSE("GPL");

-- 
2.34.1

