Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C7C4580E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BFF10E35A;
	Mon, 10 Nov 2025 09:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uua+djP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5110E324
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:04:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso13434325e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762765489; x=1763370289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sk5vRB2A8CTvXBhPjKRDoJZr7gkm+Aa51P8sRfLV4X0=;
 b=Uua+djP2UXi1G5FaOo9pAztxmvke2RMNMIbRMlLY6r1joQgr7bSspegOZ14dh26X65
 FhZU7M1s5jPFC9XMeP7FlJdvrEvsl1K0N31ijz/ool10AVDIgR/ibutUwJJk+LAYQjIj
 d8FxS87YSrqDv7jFywM5grvFBMvfUXxCMBMMn3Dqj3OlrsUzf5FpfTVOFTZUFCt90/a4
 16rP/PP7k5cJoZIOcP5cj2UUoFrPTndb/R6pZZgcR2Tx3L8kDBoYptzcZkxnlYd9vjiV
 YJ9jo12PTBBsJMmS3BWqCrHud14dgM+WkDySqOlAaB8Z9hSB49Fii8n4Vo3ZkvWJcGIq
 us3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762765489; x=1763370289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sk5vRB2A8CTvXBhPjKRDoJZr7gkm+Aa51P8sRfLV4X0=;
 b=n5E+r11qojRRYL6aV33vXna5vjvU1DafZizTtEy9FGCc7qg3gSzsfvKS8mtqDZpJY6
 /qAa8nJzJ/Q7WIMdVoPs2k6x+NWlR6X4RnuYrNPN7CbINSEF611l4KjxVkCgR4aJhNw7
 vD6vsMym2L+UPmghJtCzOAapzu6KiSj1HEQkUoR/M3iF8Vym2EODh1pDax3kwh5LqNnr
 /tYbfdb+YE72um73FfLqkGrOfP6J/ytMtM3vG0Tm9oq3Rai6nRLF5dsjn4NU4FJkWJkm
 xYYMaqgzDESlkF1Zv5irAARvwQ0rqkdsrYPKxkbek7154pzP0kG7CHxeg5EB1EglALZQ
 Lpwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO5ArQMbzVZimHR5nFznLF7gzX3emZ2m9UymsiF10i0HN5NOaJsi/AG22izlBm9VXWs6KiCc70tBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9QeJJJGzUCHrtL88iNicB+9snpNhNPG1u4YzsENpm1x+4FzIH
 Ym+CLM+Tus/uQLzWm/tsETSu6CNnE+nyXaa5Ep32RoltnSdpPoeP9kQO
X-Gm-Gg: ASbGncswYjq03U4DjnyxNSY+b1wph3bi+hnxq+NKrq6NQu1qpaGJX8KUHi7yzMXmRlx
 9Zv5yh7KAXj5HQU9z+g5J3cgAixJD+w0F9fxunVs3mWUcHw7SRUgBVzPtmz7iPljjKSvgZjE1hq
 1xbapjLujmlkI9FN0D5N1R6hywUAXNeFKHVaxKzIl4iQMWTfYj6xOBtm+SiNbTrNoyNMFqJlB12
 Dm2CEB5qcnUl7OswS7tv66nlWalOPUC82XzqH8vPCw9IPEbFsH+hPc7t5xuYt5TTOWIijN2C3Aw
 HOX6kd+zWr+NzUNI+Z0hC/Y3zivqsoB9TA0nMt7axq18xfo5CI5GRfBKJ3W6/V8AJNg2NcPcym6
 Ml25LcoU2aP7BpOKDOEzvH6UpLaoxQirRhJH6gMGx3SUmoqdraFiMlIcTidbOM9LC9JBt12kN2I
 oanyxN2Vqm/65VnneomT69ANxMDIkzp6JVpHseBJKB5eEka3W0zzxV8GLL2zQ=
X-Google-Smtp-Source: AGHT+IEwdnOYLiRxGnlYWFiugvoKZP0MLjXKBzH1fGwb5TD6K5KB/oIeeQdF5BkkS4fmoxY0g26LaA==
X-Received: by 2002:a05:600c:444b:b0:477:7a78:3016 with SMTP id
 5b1f17b1804b1-4777a783204mr26968615e9.8.1762765488848; 
 Mon, 10 Nov 2025 01:04:48 -0800 (PST)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47763e7a6desm103083205e9.8.2025.11.10.01.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:04:48 -0800 (PST)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH] fbdev/vga16fb: Use dev_* fn's instead printk.
Date: Mon, 10 Nov 2025 10:04:46 +0100
Message-ID: <20251110090446.2910998-1-rampxxxx@gmail.com>
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
- Delete the prefix `vga16fb:` from msg strings, not needed now.

[    1.037947] vga16fb vga-framebuffer.0: initializing

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 drivers/video/fbdev/vga16fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index 3b4c50d98ba6..432ba7c8164b 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1324,7 +1324,7 @@ static int vga16fb_probe(struct platform_device *dev)
 		dev_err(&dev->dev, "vga16b: cannot reserve video memory at 0x%lx\n",
 		       vga16fb_fix.smem_start);
 	}
-	printk(KERN_DEBUG "vga16fb: initializing\n");
+	dev_dbg(&dev->dev, "initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
 	if (!info) {
@@ -1336,12 +1336,12 @@ static int vga16fb_probe(struct platform_device *dev)
 	info->screen_base = (void __iomem *)VGA_MAP_MEM(VGA_FB_PHYS_BASE, 0);
 
 	if (!info->screen_base) {
-		printk(KERN_ERR "vga16fb: unable to map device\n");
+		dev_err(&dev->dev, "unable to map device\n");
 		ret = -ENOMEM;
 		goto err_ioremap;
 	}
 
-	printk(KERN_INFO "vga16fb: mapped to 0x%p\n", info->screen_base);
+	dev_info(&dev->dev, "mapped to 0x%p\n", info->screen_base);
 	par = info->par;
 
 	par->isVGA = screen_info_video_type(si) == VIDEO_TYPE_VGAC;
@@ -1369,13 +1369,13 @@ static int vga16fb_probe(struct platform_device *dev)
 	i = (info->var.bits_per_pixel == 8) ? 256 : 16;
 	ret = fb_alloc_cmap(&info->cmap, i, 0);
 	if (ret) {
-		printk(KERN_ERR "vga16fb: unable to allocate colormap\n");
+		dev_err(&dev->dev, "unable to allocate colormap\n");
 		ret = -ENOMEM;
 		goto err_alloc_cmap;
 	}
 
 	if (vga16fb_check_var(&info->var, info)) {
-		printk(KERN_ERR "vga16fb: unable to validate variable\n");
+		dev_err(&dev->dev, "unable to validate variable\n");
 		ret = -EINVAL;
 		goto err_check_var;
 	}
@@ -1386,7 +1386,7 @@ static int vga16fb_probe(struct platform_device *dev)
 	if (ret)
 		goto err_check_var;
 	if (register_framebuffer(info) < 0) {
-		printk(KERN_ERR "vga16fb: unable to register framebuffer\n");
+		dev_err(&dev->dev, "unable to register framebuffer\n");
 		ret = -EINVAL;
 		goto err_check_var;
 	}
-- 
2.50.1

