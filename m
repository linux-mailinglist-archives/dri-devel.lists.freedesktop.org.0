Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB42B3779
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 18:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552F389D58;
	Sun, 15 Nov 2020 17:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285D89D58
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 17:54:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z21so21631375lfe.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 09:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqBJmqKkgG652z3Nyc98wtP8IXHpFqu9C8nfvMQEDJo=;
 b=llJAFFq0KYNl97I5JeAOHd+Qj5H8CQKM/964NFwV3sjm99Cp4diK7l5EjAoQ9rqFQg
 xXDfpFb3GN0WHEQHVUCnOQ7+MVfeEhFWVD3mSDAGii3iUqsAhODQmcnm+cUrP5fxXyno
 UdItsTh1SWAJtqiKYfOUWVHPTIm8qdfD7RpDzbrWh+reflR8yLjlsZjvF53TuvgDj2WU
 QOJ3eDgJRPZhlDPTbZczb21GWtasyKI3MPRJEDVaqqNSF6QET8jXZM64e/hRZp8oWDUY
 BamRUCdI7tla0qSgMIE5LV9Owi4JtnQ0jM/csX2QpN2dCf0tiiaaEAfRXurL+f7DJB0Z
 eI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XqBJmqKkgG652z3Nyc98wtP8IXHpFqu9C8nfvMQEDJo=;
 b=WqAboz80stwwMoKyuvKRz2rEd3El/P8jljL5aZDzV8V5fVybUOI4j29rPilfz4Bynd
 j1QE6Wi0Q5it7TdNbUyMoRPA1D9jl4SidpZLotXjmxjHjHMzkNjnY/yhzuLbiFqx/0WA
 Uvg2BMHD1D9ef2IODOkxORbp5VIer7aTzmP5J90a1kJXawpku4ZI0PFi300Ollg2SAqO
 O7LqoeSCILSnX7yew5MH96Q4MNbl3gBqj0KoE2pCsPypjcNW0ca5vOYlrX6aZhfJ5fo0
 vwerllGJZhLcUg43yX+elLqXEwf0EdP7l54B7IrO6FV1c9J4Arw/H5nErBmquRAmmTAz
 KK/Q==
X-Gm-Message-State: AOAM532f6EJLSvuHYdD6doMH1+Uj1Y53E1JgAhnmwxCp8bJJQfH4ZpFO
 C1ePMK9xQbgOrPpwjtnyF7KQFTYAQZc=
X-Google-Smtp-Source: ABdhPJziElFtsNACr12un/2VmFHniyJQB1o3L2+WnLnGmLijv5Dms6JSyBHGWjlYIhOnP9/Hl6qNBQ==
X-Received: by 2002:ac2:4645:: with SMTP id s5mr4583094lfo.196.1605462869320; 
 Sun, 15 Nov 2020 09:54:29 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id x8sm2397428lff.196.2020.11.15.09.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 09:54:28 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/gma500: Remove 2D accel code
Date: Sun, 15 Nov 2020 18:54:20 +0100
Message-Id: <20201115175420.32167-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2D acceleration is only available on PSB and MRST and very slow on both
platforms. CPU acceleration is faster so don't bother with 2D accel
anymore.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/accel_2d.c        | 292 -----------------------
 drivers/gpu/drm/gma500/cdv_device.c      |   1 -
 drivers/gpu/drm/gma500/framebuffer.c     |  16 +-
 drivers/gpu/drm/gma500/mdfld_device.c    |   1 -
 drivers/gpu/drm/gma500/oaktrail_device.c |   1 -
 drivers/gpu/drm/gma500/psb_device.c      |   1 -
 drivers/gpu/drm/gma500/psb_drv.c         |   1 -
 drivers/gpu/drm/gma500/psb_drv.h         |   7 -
 8 files changed, 1 insertion(+), 319 deletions(-)

diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
index adc0507545bf..437bbb6af9e6 100644
--- a/drivers/gpu/drm/gma500/accel_2d.c
+++ b/drivers/gpu/drm/gma500/accel_2d.c
@@ -58,295 +58,3 @@ void psb_spank(struct drm_psb_private *dev_priv)
 	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
 	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
 }
-
-/**
- *	psb2_2d_wait_available	-	wait for FIFO room
- *	@dev_priv: our DRM device
- *	@size: size (in dwords) of the command we want to issue
- *
- *	Wait until there is room to load the FIFO with our data. If the
- *	device is not responding then reset it
- */
-static int psb_2d_wait_available(struct drm_psb_private *dev_priv,
-			  unsigned size)
-{
-	uint32_t avail = PSB_RSGX32(PSB_CR_2D_SOCIF);
-	unsigned long t = jiffies + HZ;
-
-	while (avail < size) {
-		avail = PSB_RSGX32(PSB_CR_2D_SOCIF);
-		if (time_after(jiffies, t)) {
-			psb_spank(dev_priv);
-			return -EIO;
-		}
-	}
-	return 0;
-}
-
-/**
- *	psb_2d_submit		-	submit a 2D command
- *	@dev_priv: our DRM device
- *	@cmdbuf: command to issue
- *	@size: length (in dwords)
- *
- *	Issue one or more 2D commands to the accelerator. This needs to be
- *	serialized later when we add the GEM interfaces for acceleration
- */
-static int psbfb_2d_submit(struct drm_psb_private *dev_priv, uint32_t *cmdbuf,
-								unsigned size)
-{
-	int ret = 0;
-	int i;
-	unsigned submit_size;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev_priv->lock_2d, flags);
-	while (size > 0) {
-		submit_size = (size < 0x60) ? size : 0x60;
-		size -= submit_size;
-		ret = psb_2d_wait_available(dev_priv, submit_size);
-		if (ret)
-			break;
-
-		submit_size <<= 2;
-
-		for (i = 0; i < submit_size; i += 4)
-			PSB_WSGX32(*cmdbuf++, PSB_SGX_2D_SLAVE_PORT + i);
-
-		(void)PSB_RSGX32(PSB_SGX_2D_SLAVE_PORT + i - 4);
-	}
-	spin_unlock_irqrestore(&dev_priv->lock_2d, flags);
-	return ret;
-}
-
-
-/**
- *	psb_accel_2d_copy_direction	-	compute blit order
- *	@xdir: X direction of move
- *	@ydir: Y direction of move
- *
- *	Compute the correct order setings to ensure that an overlapping blit
- *	correctly copies all the pixels.
- */
-static u32 psb_accel_2d_copy_direction(int xdir, int ydir)
-{
-	if (xdir < 0)
-		return (ydir < 0) ? PSB_2D_COPYORDER_BR2TL :
-						PSB_2D_COPYORDER_TR2BL;
-	else
-		return (ydir < 0) ? PSB_2D_COPYORDER_BL2TR :
-						PSB_2D_COPYORDER_TL2BR;
-}
-
-/**
- *	psb_accel_2d_copy		-	accelerated 2D copy
- *	@dev_priv: our DRM device
- *	@src_offset in bytes
- *	@src_stride in bytes
- *	@src_format psb 2D format defines
- *	@dst_offset in bytes
- *	@dst_stride in bytes
- *	@dst_format psb 2D format defines
- *	@src_x offset in pixels
- *	@src_y offset in pixels
- *	@dst_x offset in pixels
- *	@dst_y offset in pixels
- *	@size_x of the copied area
- *	@size_y of the copied area
- *
- *	Format and issue a 2D accelerated copy command.
- */
-static int psb_accel_2d_copy(struct drm_psb_private *dev_priv,
-			     uint32_t src_offset, uint32_t src_stride,
-			     uint32_t src_format, uint32_t dst_offset,
-			     uint32_t dst_stride, uint32_t dst_format,
-			     uint16_t src_x, uint16_t src_y,
-			     uint16_t dst_x, uint16_t dst_y,
-			     uint16_t size_x, uint16_t size_y)
-{
-	uint32_t blit_cmd;
-	uint32_t buffer[10];
-	uint32_t *buf;
-	uint32_t direction;
-
-	buf = buffer;
-
-	direction =
-	    psb_accel_2d_copy_direction(src_x - dst_x, src_y - dst_y);
-
-	if (direction == PSB_2D_COPYORDER_BR2TL ||
-	    direction == PSB_2D_COPYORDER_TR2BL) {
-		src_x += size_x - 1;
-		dst_x += size_x - 1;
-	}
-	if (direction == PSB_2D_COPYORDER_BR2TL ||
-	    direction == PSB_2D_COPYORDER_BL2TR) {
-		src_y += size_y - 1;
-		dst_y += size_y - 1;
-	}
-
-	blit_cmd =
-	    PSB_2D_BLIT_BH |
-	    PSB_2D_ROT_NONE |
-	    PSB_2D_DSTCK_DISABLE |
-	    PSB_2D_SRCCK_DISABLE |
-	    PSB_2D_USE_PAT | PSB_2D_ROP3_SRCCOPY | direction;
-
-	*buf++ = PSB_2D_FENCE_BH;
-	*buf++ =
-	    PSB_2D_DST_SURF_BH | dst_format | (dst_stride <<
-					       PSB_2D_DST_STRIDE_SHIFT);
-	*buf++ = dst_offset;
-	*buf++ =
-	    PSB_2D_SRC_SURF_BH | src_format | (src_stride <<
-					       PSB_2D_SRC_STRIDE_SHIFT);
-	*buf++ = src_offset;
-	*buf++ =
-	    PSB_2D_SRC_OFF_BH | (src_x << PSB_2D_SRCOFF_XSTART_SHIFT) |
-	    (src_y << PSB_2D_SRCOFF_YSTART_SHIFT);
-	*buf++ = blit_cmd;
-	*buf++ =
-	    (dst_x << PSB_2D_DST_XSTART_SHIFT) | (dst_y <<
-						  PSB_2D_DST_YSTART_SHIFT);
-	*buf++ =
-	    (size_x << PSB_2D_DST_XSIZE_SHIFT) | (size_y <<
-						  PSB_2D_DST_YSIZE_SHIFT);
-	*buf++ = PSB_2D_FLUSH_BH;
-
-	return psbfb_2d_submit(dev_priv, buffer, buf - buffer);
-}
-
-/**
- *	psbfb_copyarea_accel	-	copyarea acceleration for /dev/fb
- *	@info: our framebuffer
- *	@a: copyarea parameters from the framebuffer core
- *
- *	Perform a 2D copy via the accelerator
- */
-static void psbfb_copyarea_accel(struct fb_info *info,
-				 const struct fb_copyarea *a)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_device *dev;
-	struct drm_psb_private *dev_priv;
-	uint32_t offset;
-	uint32_t stride;
-	uint32_t src_format;
-	uint32_t dst_format;
-
-	if (!fb)
-		return;
-
-	dev = fb->dev;
-	dev_priv = dev->dev_private;
-	offset = to_gtt_range(fb->obj[0])->offset;
-	stride = fb->pitches[0];
-
-	switch (fb->format->depth) {
-	case 8:
-		src_format = PSB_2D_SRC_332RGB;
-		dst_format = PSB_2D_DST_332RGB;
-		break;
-	case 15:
-		src_format = PSB_2D_SRC_555RGB;
-		dst_format = PSB_2D_DST_555RGB;
-		break;
-	case 16:
-		src_format = PSB_2D_SRC_565RGB;
-		dst_format = PSB_2D_DST_565RGB;
-		break;
-	case 24:
-	case 32:
-		/* this is wrong but since we don't do blending its okay */
-		src_format = PSB_2D_SRC_8888ARGB;
-		dst_format = PSB_2D_DST_8888ARGB;
-		break;
-	default:
-		/* software fallback */
-		drm_fb_helper_cfb_copyarea(info, a);
-		return;
-	}
-
-	if (!gma_power_begin(dev, false)) {
-		drm_fb_helper_cfb_copyarea(info, a);
-		return;
-	}
-	psb_accel_2d_copy(dev_priv,
-			  offset, stride, src_format,
-			  offset, stride, dst_format,
-			  a->sx, a->sy, a->dx, a->dy, a->width, a->height);
-	gma_power_end(dev);
-}
-
-/**
- *	psbfb_copyarea	-	2D copy interface
- *	@info: our framebuffer
- *	@region: region to copy
- *
- *	Copy an area of the framebuffer console either by the accelerator
- *	or directly using the cfb helpers according to the request
- */
-void psbfb_copyarea(struct fb_info *info,
-			   const struct fb_copyarea *region)
-{
-	if (unlikely(info->state != FBINFO_STATE_RUNNING))
-		return;
-
-	/* Avoid the 8 pixel erratum */
-	if (region->width == 8 || region->height == 8 ||
-		(info->flags & FBINFO_HWACCEL_DISABLED))
-		return drm_fb_helper_cfb_copyarea(info, region);
-
-	psbfb_copyarea_accel(info, region);
-}
-
-/**
- *	psbfb_sync	-	synchronize 2D
- *	@info: our framebuffer
- *
- *	Wait for the 2D engine to quiesce so that we can do CPU
- *	access to the framebuffer again
- */
-int psbfb_sync(struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_device *dev = fb->dev;
-	struct drm_psb_private *dev_priv = dev->dev_private;
-	unsigned long _end = jiffies + HZ;
-	int busy = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev_priv->lock_2d, flags);
-	/*
-	 * First idle the 2D engine.
-	 */
-
-	if ((PSB_RSGX32(PSB_CR_2D_SOCIF) == _PSB_C2_SOCIF_EMPTY) &&
-	    ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) & _PSB_C2B_STATUS_BUSY) == 0))
-		goto out;
-
-	do {
-		busy = (PSB_RSGX32(PSB_CR_2D_SOCIF) != _PSB_C2_SOCIF_EMPTY);
-		cpu_relax();
-	} while (busy && !time_after_eq(jiffies, _end));
-
-	if (busy)
-		busy = (PSB_RSGX32(PSB_CR_2D_SOCIF) != _PSB_C2_SOCIF_EMPTY);
-	if (busy)
-		goto out;
-
-	do {
-		busy = ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) &
-						_PSB_C2B_STATUS_BUSY) != 0);
-		cpu_relax();
-	} while (busy && !time_after_eq(jiffies, _end));
-	if (busy)
-		busy = ((PSB_RSGX32(PSB_CR_2D_BLIT_STATUS) &
-					_PSB_C2B_STATUS_BUSY) != 0);
-
-out:
-	spin_unlock_irqrestore(&dev_priv->lock_2d, flags);
-	return (busy) ? -EBUSY : 0;
-}
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 4d216a0205f2..e75293e4a52f 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -584,7 +584,6 @@ static int cdv_chip_setup(struct drm_device *dev)
 
 const struct psb_ops cdv_chip_ops = {
 	.name = "GMA3600/3650",
-	.accel_2d = 0,
 	.pipes = 2,
 	.crtcs = 2,
 	.hdmi_mask = (1 << 0) | (1 << 1),
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 2d64c58607f5..fc4fda1d258b 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -144,17 +144,6 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return 0;
 }
 
-static const struct fb_ops psbfb_ops = {
-	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = psbfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-	.fb_mmap = psbfb_mmap,
-	.fb_sync = psbfb_sync,
-};
-
 static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -318,10 +307,7 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 
 	fb_helper->fb = fb;
 
-	if (dev_priv->ops->accel_2d)	/* 2D engine */
-		info->fbops = &psbfb_ops;
-	else	/* Software */
-		info->fbops = &psbfb_unaccel_ops;
+	info->fbops = &psbfb_unaccel_ops;
 
 	info->fix.smem_start = dev->mode_config.fb_base;
 	info->fix.smem_len = size;
diff --git a/drivers/gpu/drm/gma500/mdfld_device.c b/drivers/gpu/drm/gma500/mdfld_device.c
index be9cf6b1e3b3..b83d59b21de5 100644
--- a/drivers/gpu/drm/gma500/mdfld_device.c
+++ b/drivers/gpu/drm/gma500/mdfld_device.c
@@ -536,7 +536,6 @@ static int mdfld_chip_setup(struct drm_device *dev)
 
 const struct psb_ops mdfld_chip_ops = {
 	.name = "mdfld",
-	.accel_2d = 0,
 	.pipes = 3,
 	.crtcs = 3,
 	.lvds_mask = (1 << 1),
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index ade7e2416a66..8754290b0e23 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -536,7 +536,6 @@ static void oaktrail_teardown(struct drm_device *dev)
 
 const struct psb_ops oaktrail_chip_ops = {
 	.name = "Oaktrail",
-	.accel_2d = 1,
 	.pipes = 2,
 	.crtcs = 2,
 	.hdmi_mask = (1 << 1),
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index ece994c4c21a..2d21f8ec595f 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -318,7 +318,6 @@ static void psb_chip_teardown(struct drm_device *dev)
 
 const struct psb_ops psb_chip_ops = {
 	.name = "Poulsbo",
-	.accel_2d = 1,
 	.pipes = 2,
 	.crtcs = 2,
 	.hdmi_mask = (1 << 0),
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 6e7197d89463..cc2d59e8471d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -124,7 +124,6 @@ static int psb_do_init(struct drm_device *dev)
 	    (stolen_gtt << PAGE_SHIFT) * 1024;
 
 	spin_lock_init(&dev_priv->irqmask_lock);
-	spin_lock_init(&dev_priv->lock_2d);
 
 	PSB_WSGX32(0x00000000, PSB_CR_BIF_BANK0);
 	PSB_WSGX32(0x00000000, PSB_CR_BIF_BANK1);
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index ce6aae4b1bb2..5b7f7a312d53 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -576,9 +576,6 @@ struct drm_psb_private {
 
 	struct drm_fb_helper *fb_helper;
 
-	/* 2D acceleration */
-	spinlock_t lock_2d;
-
 	/* Panel brightness */
 	int brightness;
 	int brightness_adjusted;
@@ -615,7 +612,6 @@ struct drm_psb_private {
 /* Operations for each board type */
 struct psb_ops {
 	const char *name;
-	unsigned int accel_2d:1;
 	int pipes;		/* Number of output pipes */
 	int crtcs;		/* Number of CRTCs */
 	int sgx_offset;		/* Base offset of SGX device */
@@ -696,9 +692,6 @@ extern int psbfb_probed(struct drm_device *dev);
 extern int psbfb_remove(struct drm_device *dev,
 			struct drm_framebuffer *fb);
 /* accel_2d.c */
-extern void psbfb_copyarea(struct fb_info *info,
-					const struct fb_copyarea *region);
-extern int psbfb_sync(struct fb_info *info);
 extern void psb_spank(struct drm_psb_private *dev_priv);
 
 /* psb_reset.c */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
