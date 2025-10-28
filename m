Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C3C1689D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 19:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A110E051;
	Tue, 28 Oct 2025 18:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i7VwoYTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DD210E051
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:50:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-475dab5a5acso23365775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761677428; x=1762282228; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UKInHWtL/NoTyGjIvodU8RE8yH+iry3ECrXzTsyTC9E=;
 b=i7VwoYTM89fW0Wo7bY7flDnK/AOQIZfbhNR8cHPbp1i0qsTIjHvs3M5aXuOKAlLZup
 P5bToKj2RL277ATI2/bMaSvKvNZNp8sqZonn6RnGR9Xv8xaS8iU5G0lqXR+jL3QhmQyw
 yJFdFInTjnkJtU2eMKy5u67zRjLS7lJO0+T6bhlxcQbalwu8M9ehZmC4IqHiAb4kuIZN
 32Nkhe081Lr0jOFVZdRCmR/Q1NxD6cseqElCuCGAAy4/2GDW0Boe3dQz8SeswnllGIfU
 ZDcvczkW7oFBM8V82ag92srnNC+b10OdO5tvXv47imhozoiPRK248kLwxyJvWMZn7vSa
 lDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761677428; x=1762282228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKInHWtL/NoTyGjIvodU8RE8yH+iry3ECrXzTsyTC9E=;
 b=NIBBgoS8ss/FNWcQ3ASZYBWEkl1cEQ6klvJGNuzucAifd5qnblWfylhxDCSvyDKquI
 /bIKKUxhMIvpwJ1JCS3G9mP7R0Jx2Z3TdU8NRbgOLa6b1DjZ5fAKvddPgKhQlEZINC+A
 s7k/uVSqg/bHXHphESmfzi7xHjyPlUyZgaJIDqwyiCqD4R/KvZcdWTEsDiE6j6ouSZaT
 YHzqViyBymTrdlEK2GBVoW+NU4xN167E3xwDPlYMwxXsxny3OeZe2RnkRU2Ev3vkuNxF
 tG4ae4Qku4EFvln2yaufFRSLlOaGdu4F5Ex2f25zTXCMzzsogTeacfgfg6aDJdB61TeV
 bGLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD3keu4QGiRsxJj2N19MqyWp7Zo7SPR7cQq1GUs47gduRheJdIHeEalC42qy4hKUbqwvhgTNTcdlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVvPGpFN6aa5otNfi4ddi3ML8tKD+p01qM6UxgrCAiWQoBSM0q
 LGTFUUnfUIiHXdXlMhzgQi3FaiKxhlmdo2KxvtApn/rNLA9x7XCXw3SY
X-Gm-Gg: ASbGncsagFmEX5Aj1I/Lw97nXoaALU4k78Xl0yTgLvCf7E43InlVyVwInsYJvk36BLi
 WgOqH2s4zrEeMCRox7PKISI1tMMr5KZVRmMLDqnl2JLxMESLA/KO8QnbLkNilCkpKsfxwtsYGoL
 qc0jXTZRqfG5T5y6K+jQaf/ZJb5Zea7EM2jJ7fMJ+c6U01INowR69V7jiIjwsrOg2CLLFfYHqJw
 FtNFTev0IsnrfzYSIe1eRvAmZMDdcbw1rUg0if1Fsgn4/xfj/WN74+YBO0dAPTJI1N261Yv7kim
 lPNUkYvmnKYCqrpD45I72O7jNu78D6F5P9/rlD0TGchhqL70OZmuN4m047OvjYesoufPXrOgPbk
 HuxLHeylZ1Rz34ploTWfTojjZYa+k2Usb6cojRFAPt7JKhcaqAxJTwP51okvLAHnbJS+Q88Im1W
 dD2Nnk9Qiete2bP8QbOg/ojifdkL55rNZ42X3sEiWnPguwC8XbKxo+dvNdctI=
X-Google-Smtp-Source: AGHT+IGRVa25s3OR2Cduu1pjQMHI10hc0vMm3RMUpviJTN181mKMkawFAXSXy+jCA9K4dDiCJCC0tw==
X-Received: by 2002:a05:600c:4686:b0:476:6ef6:e28c with SMTP id
 5b1f17b1804b1-4771e3ba62emr3417945e9.38.1761677428341; 
 Tue, 28 Oct 2025 11:50:28 -0700 (PDT)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm22782280f8f.26.2025.10.28.11.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 11:50:27 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev/vesafb: Use dev_* fn's instead printk.
Date: Tue, 28 Oct 2025 19:50:21 +0100
Message-ID: <20251028185021.2758401-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
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

- Family dev_* fn's will show device name, giving extra info to logs.
- Delete the prefix `vesafb:` from msg strings, not needed now.

[    0.981825] vesa-framebuffer vesa-framebuffer.0: scrolling: redraw

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/video/fbdev/vesafb.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index a81df8865143..36c1fc553883 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -314,8 +314,8 @@ static int vesafb_probe(struct platform_device *dev)
 #endif
 
 	if (!request_mem_region(vesafb_fix.smem_start, size_total, "vesafb")) {
-		printk(KERN_WARNING
-		       "vesafb: cannot reserve video memory at 0x%lx\n",
+		dev_warn(&dev->dev,
+		       "cannot reserve video memory at 0x%lx\n",
 			vesafb_fix.smem_start);
 		/* We cannot make this fatal. Sometimes this comes from magic
 		   spaces our resource handlers simply don't know about */
@@ -333,12 +333,12 @@ static int vesafb_probe(struct platform_device *dev)
 	par->base = si->lfb_base;
 	par->size = size_total;
 
-	printk(KERN_INFO "vesafb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
+	dev_info(&dev->dev,"mode is %dx%dx%d, linelength=%d, pages=%d\n",
 	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel,
 	       vesafb_fix.line_length, si->pages);
 
 	if (si->vesapm_seg) {
-		printk(KERN_INFO "vesafb: protected mode interface info at %04x:%04x\n",
+		dev_info(&dev->dev, "protected mode interface info at %04x:%04x\n",
 		       si->vesapm_seg, si->vesapm_off);
 	}
 
@@ -352,9 +352,9 @@ static int vesafb_probe(struct platform_device *dev)
 		pmi_base  = (unsigned short *)phys_to_virt(pmi_phys);
 		pmi_start = (void*)((char*)pmi_base + pmi_base[1]);
 		pmi_pal   = (void*)((char*)pmi_base + pmi_base[2]);
-		printk(KERN_INFO "vesafb: pmi: set display start = %p, set palette = %p\n",pmi_start,pmi_pal);
+		dev_info(&dev->dev, "pmi: set display start = %p, set palette = %p\n",pmi_start,pmi_pal);
 		if (pmi_base[3]) {
-			printk(KERN_INFO "vesafb: pmi: ports = ");
+			dev_info(&dev->dev, "pmi: ports = ");
 			for (i = pmi_base[3]/2; pmi_base[i] != 0xffff; i++)
 				printk("%x ", pmi_base[i]);
 			printk("\n");
@@ -365,14 +365,14 @@ static int vesafb_probe(struct platform_device *dev)
 				 * Rules are: we have to set up a descriptor for the requested
 				 * memory area and pass it in the ES register to the BIOS function.
 				 */
-				printk(KERN_INFO "vesafb: can't handle memory requests, pmi disabled\n");
+				dev_info(&dev->dev, "can't handle memory requests, pmi disabled\n");
 				ypan = pmi_setpal = 0;
 			}
 		}
 	}
 
 	if (vesafb_defined.bits_per_pixel == 8 && !pmi_setpal && !vga_compat) {
-		printk(KERN_WARNING "vesafb: hardware palette is unchangeable,\n"
+		dev_warn(&dev->dev, "hardware palette is unchangeable,\n"
 		                    "        colors may be incorrect\n");
 		vesafb_fix.visual = FB_VISUAL_STATIC_PSEUDOCOLOR;
 	}
@@ -380,10 +380,10 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_defined.xres_virtual = vesafb_defined.xres;
 	vesafb_defined.yres_virtual = vesafb_fix.smem_len / vesafb_fix.line_length;
 	if (ypan && vesafb_defined.yres_virtual > vesafb_defined.yres) {
-		printk(KERN_INFO "vesafb: scrolling: %s using protected mode interface, yres_virtual=%d\n",
+		dev_info(&dev->dev, "scrolling: %s using protected mode interface, yres_virtual=%d\n",
 		       (ypan > 1) ? "ywrap" : "ypan",vesafb_defined.yres_virtual);
 	} else {
-		printk(KERN_INFO "vesafb: scrolling: redraw\n");
+		dev_info(&dev->dev, "scrolling: redraw\n");
 		vesafb_defined.yres_virtual = vesafb_defined.yres;
 		ypan = 0;
 	}
@@ -410,7 +410,7 @@ static int vesafb_probe(struct platform_device *dev)
 		vesafb_defined.bits_per_pixel;
 	}
 
-	printk(KERN_INFO "vesafb: %s: "
+	dev_info(&dev->dev, "%s: "
 	       "size=%d:%d:%d:%d, shift=%d:%d:%d:%d\n",
 	       (vesafb_defined.bits_per_pixel > 8) ?
 	       "Truecolor" : (vga_compat || pmi_setpal) ?
@@ -453,14 +453,14 @@ static int vesafb_probe(struct platform_device *dev)
 	}
 
 	if (!info->screen_base) {
-		printk(KERN_ERR
-		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
+		dev_err(&dev->dev,
+		       "abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
 			vesafb_fix.smem_len, vesafb_fix.smem_start);
 		err = -EIO;
 		goto err_release_region;
 	}
 
-	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
+	dev_info(&dev->dev, "framebuffer at 0x%lx, mapped to 0x%p, "
 	       "using %dk, total %dk\n",
 	       vesafb_fix.smem_start, info->screen_base,
 	       size_remap/1024, size_total/1024);
-- 
2.50.1

