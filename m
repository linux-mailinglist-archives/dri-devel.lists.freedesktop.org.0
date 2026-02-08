Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOjmNMbOiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9D1099FB
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350A10E30E;
	Sun,  8 Feb 2026 17:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bvvyxpvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0578F10E30E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:27 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so28983985e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573505; x=1771178305;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhki4gKsDPvT6xO+It70bVVw01PZcqITB4DychbCA1E=;
 b=BvvyxpvvNtyBu+vTN2YETz/mab/b1oWWPt2vH9Dc5YDOraK7Z+uCWtK1tjM5/gxoAj
 p4P6fKwWCcr1GQ9SBfBCeJceWaXJhU9yMuNrp+i6EBCEdsQ2ljXxoLgLCW0u0JDhH227
 GAbu59FlFcmeQWYX0ETROX91DQtqJXScBtM40cOkBkGxDAqkesj7fQ4j56vY3b4UBz8Y
 mWcDoU+LUpg+ki7mi/mPvnFpq/jLiOQR3EVpGriIPECQfzhhjraHLJw72IePT+YACRtU
 xFLfbpeE/IJklQ6jiclMJVFs8r9vl/B7iVPoPOXGmdIPkHy/AmbQ5CWEC5CwgoG+TaOQ
 1gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573505; x=1771178305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fhki4gKsDPvT6xO+It70bVVw01PZcqITB4DychbCA1E=;
 b=KJGQb1ORuPWd7BUgVuwkU9szbAAO1gsOPOv7XRUdZYdQWnLfs+KuTQOpshnbuhlTAp
 e+B8C0xFkLbmwBQWTEdh05Gj6kbApmpVGdD9DPCk8DrBAY+NUHbCoyUnlhmSBBH3a5v4
 +kknj5bxnxLdfnCol+E6D/PP7vHgMZIEOtCp3PmpimF6Z17RCzeSWW/f/xJMduWKXcT5
 HES9LVCAOkYWQZ6wUUBOTA9TbdBgEA7/AZnx0MbOvTCPFrTm5X7pk3KSUdI7ozHy+g8l
 6zUsG0DBmfeJJ1BDUSNejotNuDawN4jiWPGrb4QQBt3HLrznWKULICCD2RgYx4xW7CvI
 DRlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/iue2vOL/MJThw+dmAjaHkhPbQGtuEvGJS4MUw/0NGPSvRIAdzOmfYB3T0AXqU7wtfmoO42dtGwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYbpvSDeqVUS/YhfykiYbM0+sIGqH3ENZ+gH1WO7aVO0Wk65T7
 bD33Gq7vO5rmCLBsx1DPU5NeNfaRegQzrWUMzlfbl94r8Nq/l1Wqf7eheYNBn7Y/53A=
X-Gm-Gg: AZuq6aIJxQ3+7JfLzHm4PeVejxYHpWwmPSN+8Hgl16TeCfjlrg3wHt8LnN8ApTjvyak
 FY6KaxxvCGWI6eVGqNbLRpuQ58Jmr+hJvfy9lgFg8+TlGRqurEDR2L6L/Z4wSNu1G06jXMh2OMX
 c1MFMrolp8FgHYl8bcisn+lWBCpTb8BFzE6euW8PkVdTuns31K4sb+MMPOWfFs2NE6O8PV2ZSeh
 Gi5TEz3xqFLnPOHLnUficb7NbRQo+G+JX2v9ntrZZ35M1suAE+2tg62Ex/nnANZrv16V4bgMGTl
 0PfR7tIsHQoGn1e3HdTsVLiaVjrPzq12vclIhszosKJMKErbMQ/BU7EFAj4QP0c8Al05/YenYzw
 QLwsABDsR4R9TEfM/u0R50QkuPY+GvzdV8y1bRoIjfMucVfjH3zNuqwcr3ht06s2xI5Zruc9HvC
 22dTq9S4F/+RBRBgAU
X-Received: by 2002:a05:600c:1f82:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-483203d0b11mr142440925e9.12.1770573505515; 
 Sun, 08 Feb 2026 09:58:25 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48333bad79bsm120232485e9.8.2026.02.08.09.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/6] fbdev: au1100fb: Don't store device specific data in
 global variables
Date: Sun,  8 Feb 2026 18:57:58 +0100
Message-ID: <54c540f635a8a5992ef18b3adc6ed5ff84c60e51.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6478;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=4la8TwyhvmUsolxWT2IKcIbH80LEB7rogpe50paSgX0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpiM6qqCjcXii1EkFEnUR6Vbwl1/eAxuqJe46Hu
 4LfDViUpu+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYjOqgAKCRCPgPtYfRL+
 Tp+0CACnhPK3WOeqyB8yHlqwIE6p4wl/Ow0xRAHGLJxIQi4qKKs45f+vTkW9EwLTqp2mqkIg0Y4
 II471/9Dg88pQt/U49yLrqINcLfUxqemToM3pAiM4uCYkCwH/xS1NBTkbfWxe14NUoOyrrNCLka
 +VJyKHG1j4BGo7UIJeb+F1QSOfaBEyL4f8wEfLPnVlFc8f6D/giKt+8JP9WY4wTRuoJJ199T/PS
 VugQq+kcBadZnY9qhZWGr+d3iAr0Ae8/ynOATBh/rmq462dLGzecjgd9JEbn3vxCCbceBlYiw0V
 K503pxn9yA7Ymb38UJgI/o9cIhzSW5LaIAr1Dvd6i6UgRUTr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 6CD9D1099FB
X-Rspamd-Action: no action

Using global data to store device specific data is a bad pattern that
breaks if there is more than one device. So expand driver data and drop
the global variables.

While there is probably no machine that has two or more au1100fb
devices, this makes the driver a better template for new drivers and
saves some memory if there is no such bound device.

bloat-o-meter reports (for ARCH=arm allmodconfig + CONFIG_FB_AU1100=y
and ignoring the rename of the init function):

	add/remove: 1/4 grow/shrink: 2/2 up/down: 1360/-4800 (-3440)
	Function                                     old     new   delta
	au1100fb_drv_probe                          2648    3328    +680
	$a                                         12808   13484    +676
	au1100fb_drv_resume                          404     400      -4
	au1100fb_fix                                  68       -     -68
	au1100fb_var                                 160       -    -160
	fbregs                                      2048       -   -2048
	$d                                          9525    7009   -2516
	Total: Before=38664, After=35224, chg -8.90%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
I think this doesn't need a Fixes line, but if you want, it would be:

	Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
	Fixes: f77f50ca1a23 ("[PATCH] au1100fb: add power management support")
---
 drivers/video/fbdev/au1100fb.c | 65 +++++++++++++++-------------------
 drivers/video/fbdev/au1100fb.h |  5 +++
 2 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index feaa1061c436..7bc224a8455c 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -84,21 +84,6 @@ struct fb_bitfield rgb_bitfields[][4] =
 	{ { 8, 4, 0 },  { 4, 4, 0 }, { 0, 4, 0 }, { 0, 0, 0 } },
 };
 
-static struct fb_fix_screeninfo au1100fb_fix = {
-	.id		= "AU1100 FB",
-	.xpanstep 	= 1,
-	.ypanstep 	= 1,
-	.type		= FB_TYPE_PACKED_PIXELS,
-	.accel		= FB_ACCEL_NONE,
-};
-
-static struct fb_var_screeninfo au1100fb_var = {
-	.activate	= FB_ACTIVATE_NOW,
-	.height		= -1,
-	.width		= -1,
-	.vmode		= FB_VMODE_NONINTERLACED,
-};
-
 /* fb_blank
  * Blank the screen. Depending on the mode, the screen will be
  * activated with the backlight color, or desactivated
@@ -432,19 +417,26 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -EFAULT;
 	}
 
-	au1100fb_fix.mmio_start = regs_res->start;
-	au1100fb_fix.mmio_len = resource_size(regs_res);
+	fbdev->info.fix = (struct fb_fix_screeninfo) {
+		.mmio_start = regs_res->start,
+		.mmio_len = resource_size(regs_res),
+		.id = "AU1100 FB",
+		.xpanstep = 1,
+		.ypanstep = 1,
+		.type = FB_TYPE_PACKED_PIXELS,
+		.accel = FB_ACCEL_NONE,
+	};
 
 	if (!devm_request_mem_region(&dev->dev,
-				     au1100fb_fix.mmio_start,
-				     au1100fb_fix.mmio_len,
+				     fbdev->info.fix.mmio_start,
+				     fbdev->info.fix.mmio_len,
 				     DRIVER_NAME)) {
 		print_err("fail to lock memory region at 0x%08lx",
-				au1100fb_fix.mmio_start);
+			  fbdev->info.fix.mmio_start);
 		return -EBUSY;
 	}
 
-	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(au1100fb_fix.mmio_start);
+	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
 
 	print_dbg("Register memory map at %p", fbdev->regs);
 	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
@@ -469,22 +461,27 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -ENOMEM;
 	}
 
-	au1100fb_fix.smem_start = fbdev->fb_phys;
-	au1100fb_fix.smem_len = fbdev->fb_len;
+	fbdev->info.fix.smem_start = fbdev->fb_phys;
+	fbdev->info.fix.smem_len = fbdev->fb_len;
 
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
 	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
-	au1100fb_var.bits_per_pixel = fbdev->panel->bpp;
-	au1100fb_var.xres = fbdev->panel->xres;
-	au1100fb_var.xres_virtual = au1100fb_var.xres;
-	au1100fb_var.yres = fbdev->panel->yres;
-	au1100fb_var.yres_virtual = au1100fb_var.yres;
+	fbdev->info.var = (struct fb_var_screeninfo) {
+		.activate = FB_ACTIVATE_NOW,
+		.height = -1,
+		.width = -1,
+		.vmode = FB_VMODE_NONINTERLACED,
+		.bits_per_pixel = fbdev->panel->bpp,
+		.xres = fbdev->panel->xres,
+		.xres_virtual = fbdev->panel->xres,
+		.yres = fbdev->panel->yres,
+		.yres_virtual = fbdev->panel->yres,
+	};
 
 	fbdev->info.screen_base = fbdev->fb_mem;
 	fbdev->info.fbops = &au1100fb_ops;
-	fbdev->info.fix = au1100fb_fix;
 
 	fbdev->info.pseudo_palette =
 		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
@@ -497,8 +494,6 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -EFAULT;
 	}
 
-	fbdev->info.var = au1100fb_var;
-
 	/* Set h/w registers */
 	au1100fb_setmode(fbdev);
 
@@ -545,9 +540,7 @@ void au1100fb_drv_remove(struct platform_device *dev)
 }
 
 #ifdef CONFIG_PM
-static struct au1100fb_regs fbregs;
-
-int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
+static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 
@@ -559,7 +552,7 @@ int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 
 	clk_disable(fbdev->lcdclk);
 
-	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
+	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));
 
 	return 0;
 }
@@ -572,7 +565,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
 	if (!fbdev)
 		return 0;
 
-	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
+	memcpy(fbdev->regs, &fbdev->pm_regs, sizeof(struct au1100fb_regs));
 
 	ret = clk_enable(fbdev->lcdclk);
 	if (ret)
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 79f4048726f1..dc53d063fcc3 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -105,6 +105,11 @@ struct au1100fb_device {
 	size_t       		regs_len;
 	unsigned int 		regs_phys;
 
+#ifdef CONFIG_PM
+	/* stores the register values during suspend */
+	struct au1100fb_regs 	pm_regs;
+#endif
+
 	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
 	size_t	      		fb_len;
 	dma_addr_t    		fb_phys;
-- 
2.47.3

