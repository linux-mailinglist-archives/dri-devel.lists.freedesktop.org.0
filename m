Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FEC23AFE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72C910EABC;
	Fri, 31 Oct 2025 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j/huNET9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DF510EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:09:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7a683385ad8so1508725b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761898195; x=1762502995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5yjTzpVAIcEmdotVWgALP9aimDetWuj08C3OGruDkEs=;
 b=j/huNET9Z71hsJJNoR7l8CI+aFUunwn7fwWuJKDfZ2KqJDgtdCXeIrHZy94dIC9klk
 MdSfpsUMXprHeqXM7+lirdjHkvJxTUBbEjb3qlF+3uFbH89vdXi6zeFWCQoeK+Z7e/RQ
 3OVM4T5q6gptyqFWOH0iulBjLipYNQbrLzDUtw+yDHPRJib3QFcASn7iF3G0nIK1muCu
 fnIWHwkQVR2iFnb779gx/3Gtuo4cAiRPed3WvxxcSJBY/ZuiA+fEGbgYzL7wvQV9qYFw
 AIj63dhF5+bIV96y0CM5KrBU/H3MF/6OKzBswv3YMmiJjbttJeenh9ZQiLlstX7q16ys
 DkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761898195; x=1762502995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5yjTzpVAIcEmdotVWgALP9aimDetWuj08C3OGruDkEs=;
 b=IO7kRH4BX7yO5eA3/vkEavjL0H7CEVZBHzVjb/FdUObWkXktWXGwbRbvOJQMxe5fx0
 xtGFf+SXEJigu2Qp5NgQDYlIgeU28hWuuxmZi+cECXeE4R8SjlU9Vh9yKkDLE3gGNR52
 gkNZT7ZhC0A3sKPpD744+GUNhTIkklJZzqCRTy9PIjmJcd8D+QpSWyK+mSZas4Be0JjJ
 XC/ftrBudSLmHN8YCYWKLpTx3+puVoN+OL7uHWGsIcJicavmQlL7p6HpVSfsSVGcneMO
 rYdmFvJQ8cj27WhdZcRLcyg4laMRsGFe5oGedjRt1uHNcWlYdpo4z5biL7TiGdt/yo73
 31sw==
X-Gm-Message-State: AOJu0YyirH+PITJg3GnSps+WXP90xHswgH+m0aYm6bL0w2ZjbnxNXd77
 R+iVZGkV+mDRqs8DZEoyRjVzd15wHInoH08lQ/hvrQDuOpAF6b+WAV0q
X-Gm-Gg: ASbGncuqjteX0F8WeNsx/JcYhDKiHT03ZhNwhlmKjkWJCVF3lteADQ1gfpK4Lyz0/cS
 aPwR0UTellthCLRiMRNs+IbEzLV6bfe+h1SyCxFM6TZt6J6iRD/lh5CUKrWECLp6gy7XpIINhik
 aUxEKv4t5LrbKtdYxYsl31CFkZIb90gaMBSQAtTN4Ze6n6sudoRR73P4Lm13VrlBXXsISY4jgyP
 W+OBAg79ye/c4RCDvk8yaZLjR9ZCkK0Mjiav59+qh2nv4+Tr3tmxjRtcC7x8f3ijUg4CgR89YFi
 6AXC0C8GJ1aWya7TXEfTI7ZQH4DKIZZ9UqnGetULLJWatp7fIDmsknOMTLbAMwGtWXVeInHl68a
 4tIzPHz6QPWNS3VCtsFKsFbbvmckEPddKtLksslGdsjV5jKXptFrlw3Ll0Du6zUYDA9Anqt131/
 5VSj82Yyp2MNQs
X-Google-Smtp-Source: AGHT+IG+jjw5n2v8QevhSrZ53DsQ1U593U2bn2lanUX2sGqPkPrpdNzon5zxAsGiKnBgq/jOXhIkIQ==
X-Received: by 2002:a05:6a20:1585:b0:342:1265:158f with SMTP id
 adf61e73a8af0-348cc6f4f2fmr4037368637.51.1761898194825; 
 Fri, 31 Oct 2025 01:09:54 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:68ad:2e67:289c:5dac:46fd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db86cdd2sm1265276b3a.58.2025.10.31.01.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 01:09:54 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, deller@gmx.de,
 linux-kernel@vger.kernel.org, adaplas@gmail.com, i.shihao.999@gmail.com
Subject: [PATCH] fbdev: i810: use appopriate log interface dev_info
Date: Fri, 31 Oct 2025 13:39:42 +0530
Message-ID: <20251031080942.14112-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
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

There were many printk log interfaces which do no had
any KERN_INFO with them and they can be replaced with
dev_info which will allow better log level handling
making messages clear and manageable.

No functional changes to the driver behavior are introduced.
Only the logging method has been replaced as per modern
kernel coding guidelines.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/video/fbdev/i810/i810_main.c | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index d73a795fe1be..cc5d09e3bd2b 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1012,7 +1012,7 @@ static int i810_check_params(struct fb_var_screeninfo *var,
 						      var->bits_per_pixel);
 			vidmem = line_length * info->var.yres;
 			if (vxres < var->xres) {
-				printk("i810fb: required video memory, "
+				dev_info(&par->dev->dev, "i810fb: required video memory, "
 				       "%d bytes, for %dx%d-%d (virtual) "
 				       "is out of range\n",
 				       vidmem, vxres, vyres,
@@ -1067,9 +1067,9 @@ static int i810_check_params(struct fb_var_screeninfo *var,
 				|(info->monspecs.hfmax-HFMAX)
 				|(info->monspecs.vfmin-VFMIN)
 				|(info->monspecs.vfmax-VFMAX);
-			printk("i810fb: invalid video mode%s\n",
-			       default_sync ? "" : ". Specifying "
-			       "vsyncN/hsyncN parameters may help");
+			dev_err(&par->dev->dev, "i810fb: invalid video mode%s\n",
+				default_sync ? "" : ". Specifying "
+				"vsyncN/hsyncN parameters may help");
 			retval = -EINVAL;
 		}
 	}
@@ -1674,19 +1674,19 @@ static int i810_alloc_agp_mem(struct fb_info *info)
 	size = par->fb.size + par->iring.size;

 	if (!(bridge = agp_backend_acquire(par->dev))) {
-		printk("i810fb_alloc_fbmem: cannot acquire agpgart\n");
+		dev_warn(&par->dev->dev, "i810fb_alloc_fbmem: cannot acquire agpgart\n");
 		return -ENODEV;
 	}
 	if (!(par->i810_gtt.i810_fb_memory =
 	      agp_allocate_memory(bridge, size >> 12, AGP_NORMAL_MEMORY))) {
-		printk("i810fb_alloc_fbmem: can't allocate framebuffer "
+		dev_warn(&par->dev->dev, "i810fb_alloc_fbmem: can't allocate framebuffer "
 		       "memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_fb_memory,
 			    par->fb.offset)) {
-		printk("i810fb_alloc_fbmem: can't bind framebuffer memory\n");
+		dev_warn(&par->dev->dev, "i810fb_alloc_fbmem: can't bind framebuffer memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}
@@ -1694,14 +1694,14 @@ static int i810_alloc_agp_mem(struct fb_info *info)
 	if (!(par->i810_gtt.i810_cursor_memory =
 	      agp_allocate_memory(bridge, par->cursor_heap.size >> 12,
 				  AGP_PHYSICAL_MEMORY))) {
-		printk("i810fb_alloc_cursormem:  can't allocate "
+		dev_warn(&par->dev->dev, "i810fb_alloc_cursormem:  can't allocate "
 		       "cursor memory\n");
 		agp_backend_release(bridge);
 		return -ENOMEM;
 	}
 	if (agp_bind_memory(par->i810_gtt.i810_cursor_memory,
 			    par->cursor_heap.offset)) {
-		printk("i810fb_alloc_cursormem: cannot bind cursor memory\n");
+		dev_warn(&par->dev->dev, "i810fb_alloc_cursormem: cannot bind cursor memory\n");
 		agp_backend_release(bridge);
 		return -EBUSY;
 	}
@@ -1844,7 +1844,7 @@ static int i810_allocate_pci_resource(struct i810fb_par *par,
 	int err;

 	if ((err = pci_enable_device(par->dev))) {
-		printk("i810fb_init: cannot enable device\n");
+		dev_err(&par->dev->dev, "i810fb_init: cannot enable device\n");
 		return err;
 	}
 	par->res_flags |= PCI_DEVICE_ENABLED;
@@ -1859,14 +1859,14 @@ static int i810_allocate_pci_resource(struct i810fb_par *par,
 		par->mmio_start_phys = pci_resource_start(par->dev, 0);
 	}
 	if (!par->aperture.size) {
-		printk("i810fb_init: device is disabled\n");
+		dev_warn(&par->dev->dev, "i810fb_init: device is disabled\n");
 		return -ENOMEM;
 	}

 	if (!request_mem_region(par->aperture.physical,
 				par->aperture.size,
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request framebuffer region\n");
+		dev_warn(&par->dev->dev, "i810fb_init: cannot request framebuffer region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= FRAMEBUFFER_REQ;
@@ -1874,14 +1874,14 @@ static int i810_allocate_pci_resource(struct i810fb_par *par,
 	par->aperture.virtual = ioremap_wc(par->aperture.physical,
 					   par->aperture.size);
 	if (!par->aperture.virtual) {
-		printk("i810fb_init: cannot remap framebuffer region\n");
+		dev_warn(&par->dev->dev, "i810fb_init: cannot remap framebuffer region\n");
 		return -ENODEV;
 	}

 	if (!request_mem_region(par->mmio_start_phys,
 				MMIO_SIZE,
 				i810_pci_list[entry->driver_data])) {
-		printk("i810fb_init: cannot request mmio region\n");
+		dev_warn(&par->dev->dev, "i810fb_init: cannot request mmio region\n");
 		return -ENODEV;
 	}
 	par->res_flags |= MMIO_REQ;
@@ -1889,7 +1889,7 @@ static int i810_allocate_pci_resource(struct i810fb_par *par,
 	par->mmio_start_virtual = ioremap(par->mmio_start_phys,
 						  MMIO_SIZE);
 	if (!par->mmio_start_virtual) {
-		printk("i810fb_init: cannot remap mmio region\n");
+		dev_warn(&par->dev->dev, "i810fb_init: cannot remap mmio region\n");
 		return -ENODEV;
 	}

@@ -1921,12 +1921,12 @@ static void i810fb_find_init_mode(struct fb_info *info)
 	}

 	if (!err)
-		printk("i810fb_init_pci: DDC probe successful\n");
+		dev_info(&par->dev->dev, "i810fb_init_pci: DDC probe successful\n");

 	fb_edid_to_monspecs(par->edid, specs);

 	if (specs->modedb == NULL)
-		printk("i810fb_init_pci: Unable to get Mode Database\n");
+		dev_info(&par->dev->dev, "i810fb_init_pci: Unable to get Mode Database\n");

 	fb_videomode_to_modelist(specs->modedb, specs->modedb_len,
 				 &info->modelist);
@@ -2072,7 +2072,7 @@ static int i810fb_init_pci(struct pci_dev *dev,

 	if (err < 0) {
     		i810fb_release_resource(info, par);
-		printk("i810fb_init: cannot register framebuffer device\n");
+		dev_warn(&par->dev->dev, "i810fb_init: cannot register framebuffer device\n");
     		return err;
     	}

@@ -2084,10 +2084,10 @@ static int i810fb_init_pci(struct pci_dev *dev,
 	vfreq = hfreq/(info->var.yres + info->var.upper_margin +
 		       info->var.vsync_len + info->var.lower_margin);

-      	printk("I810FB: fb%d         : %s v%d.%d.%d%s\n"
-      	       "I810FB: Video RAM   : %dK\n"
-	       "I810FB: Monitor     : H: %d-%d KHz V: %d-%d Hz\n"
-	       "I810FB: Mode        : %dx%d-%dbpp@%dHz\n",
+	dev_info(&par->dev->dev, "I810FB: fb%d         : %s v%d.%d.%d%s\n"
+		"I810FB: Video RAM   : %dK\n"
+		"I810FB: Monitor     : H: %d-%d KHz V: %d-%d Hz\n"
+		"I810FB: Mode        : %dx%d-%dbpp@%dHz\n",
 	       info->node,
 	       i810_pci_list[entry->driver_data],
 	       VERSION_MAJOR, VERSION_MINOR, VERSION_TEENIE, BRANCH_VERSION,
@@ -2137,7 +2137,7 @@ static void i810fb_remove_pci(struct pci_dev *dev)

 	unregister_framebuffer(info);
 	i810fb_release_resource(info, par);
-	printk("cleanup_module:  unloaded i810 framebuffer device\n");
+	dev_info(&par->dev->dev, "cleanup_module:  unloaded i810 framebuffer device\n");
 }

 #ifndef MODULE
--
2.51.0

