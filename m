Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BFCBB2CB
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 20:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C15210E40F;
	Sat, 13 Dec 2025 19:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XP0OI1C2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B5F10E40F
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 19:44:28 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso642565ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 11:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765655068; x=1766259868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vpBRllM73qDKL2ScMHTVO5zPyQi4kKb5Ruh0b06m8BA=;
 b=XP0OI1C2p3PvK2rIl92UWkU3Jvh3HsgtHkI91nO9LqRNt5MoEHLIySgofkPk8BgW8a
 FTlvgsZcPANL+JGy1uW/AJk7iiC+/UwpyV77a9RPxGPnsw7JXg4GN5HLm65G4sgFk1f/
 DWwFpsW+tsQUwzZF7aKmsSdnv1ZtLWAIDJibl1dlUPNw2Mztgdq3k2ksgKJzgIt4tOgr
 5WKrN5B3gC+S+kho6toEpr1KGpykVmohnNHOlTDrU2LPLNHS5pUntxVNXOM7UmHxQs8D
 QIyGOL5NSDMOrTI3LVCCcJ0y717E61MIdvTzflhXvQLTDLMh0FTn/FsZnMM+FjZhGH3D
 xsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765655068; x=1766259868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpBRllM73qDKL2ScMHTVO5zPyQi4kKb5Ruh0b06m8BA=;
 b=FRjOGANGWNDu/jhM77TKAsyM/O0KTh58vbEe/HCchWZQjx+tXp+yxZVZA1b4zDGIZd
 QpyGMh/kTtQNDuqcA1zBnxfGLep+r3s5ja+yEhpHc6oXZJgXNCye3qzopB5HYiLmJJw8
 q+VvAVcByZLmlEdUCkirkigRqMHHrUkyJ2CoySFURTTp8RefkxnEwr+QshAzNNkCIVYX
 G+uqEXwG8cR65QF1xfAZxQacpcOKStzO1LaEBW6wF46yvHP1pej8TGdOfd+kk+Li1XuK
 YYc+w0VoQIQkEJSJbiXOyp+uESl6Ap6TlC/SZtWRWeIx0T2YZe9xnqPq14rsR3bKSCx8
 Wl6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkMSye0eHBB9A4B3VaQqnS5grk3b3Qy6GL4qMSsksCFseVPy+2vq/1rpyY/G7SPULkYipdoLYoyto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhFDJ6pyEVpuu0vKdK9c14WO/WoFnceJbljygoQyEORI41Xka5
 4NbGLc97lzOHKRZ3mDFjxD3+08fTtDodID3xlI/eu2KBsg5szO0g2tIB
X-Gm-Gg: AY/fxX6JzMddMzhQZzXLcAipNthRoXs6cyPtwSCZNYwiucBwvOxszYhpBVqr2DUb6Kz
 1ElzXyw2eaaPWFs9GQ/RBSDnijNBsizX3eexTmdHnBhCWLdAPOvN+fv8kbbb0Vyo6aLoMBvNkwa
 MZ7GcrfYWCOQwoyTcY4GYf33Kof9NRTbQVJfGAhQt6y4Wymkz5ns71pn+hp+hf1aZFVnE0IdxCl
 ciZZZEPWVteQe0OsrfSc6o50pWqZvSreH7pZTbBXmsFUdNLMXoijiZQuOU5aGfafRgx5MMRQ68s
 HAGOgVXEUNqEyC5TfvUmW4j6Bx99QF8SZLrgLAOVvitg2cXZsZC2FGPC/M1t/L1/HdZAcaP88c4
 buwDHBDaOaUGjhO4N0/G9AKhtN0zabxWW+scXXI641EIrdKhq/EWoiQPobmiPBpiChKA7umfVUQ
 YsYSAtDPmUALkKBIddJ+JkJOVRR+5VfA==
X-Google-Smtp-Source: AGHT+IGyg92faWHXBt9zaVvBaBKtx3YFvdCAWY30UKXOk6xfy9iaNTDpTPM7MMtl4koyXzcqOdOtQg==
X-Received: by 2002:a17:902:d3ca:b0:298:68e:4042 with SMTP id
 d9443c01a7336-29eeec1d557mr62341375ad.26.1765655067642; 
 Sat, 13 Dec 2025 11:44:27 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29efd74f5e1sm72818695ad.16.2025.12.13.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 11:44:27 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Andres Salomon <dilinger@queued.net>, Helge Deller <deller@gmx.de>,
 linux-geode@lists.infradead.org (moderated list:AMD GEODE PROCESSOR/CHIPSET
 SUPPORT), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] fbdev: geode: gxfb: Use devm_request_mem_region
Date: Sun, 14 Dec 2025 01:13:59 +0000
Message-ID: <20251214011400.300460-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
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

The gxfb driver currently uses pci_request_region() for memory
reservation, which requires manual error handling and cleanup using
pci_release_region().

Simplify the driver by migrating to the managed helper
devm_request_mem_region(). This ensures that resources are automatically
released on driver detach, allowing the removal of explicit cleanup code
in the probe error path and the remove function.

This addresses the TODO item "Request memory regions in all fbdev
drivers" in Documentation/gpu/todo.rst.

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
Compile-tested only on x86_64.

 drivers/video/fbdev/geode/gxfb_core.c | 36 +++++++++++----------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index 8d69be7c9d31..05af546c8c92 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -223,31 +223,33 @@ static int gxfb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 	if (ret < 0)
 		return ret;

-	ret = pci_request_region(dev, 3, "gxfb (video processor)");
-	if (ret < 0)
-		return ret;
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 3),
+			      pci_resource_len(dev, 3), "gxfb (video processor)"))
+		return -EBUSY;
+
 	par->vid_regs = pci_ioremap_bar(dev, 3);
 	if (!par->vid_regs)
 		return -ENOMEM;

-	ret = pci_request_region(dev, 2, "gxfb (display controller)");
-	if (ret < 0)
-		return ret;
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 2),
+			      pci_resource_len(dev, 2), "gxfb (display controller)"))
+		return -EBUSY;
+
 	par->dc_regs = pci_ioremap_bar(dev, 2);
 	if (!par->dc_regs)
 		return -ENOMEM;

-	ret = pci_request_region(dev, 1, "gxfb (graphics processor)");
-	if (ret < 0)
-		return ret;
-	par->gp_regs = pci_ioremap_bar(dev, 1);
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 1),
+			      pci_resource_len(dev, 1), "gxfb (graphics processor)"))
+		return -EBUSY;

+	par->gp_regs = pci_ioremap_bar(dev, 1);
 	if (!par->gp_regs)
 		return -ENOMEM;

-	ret = pci_request_region(dev, 0, "gxfb (framebuffer)");
-	if (ret < 0)
-		return ret;
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
+			      pci_resource_len(dev, 0), "gxfb (framebuffer)"))
+		return -EBUSY;

 	info->fix.smem_start = pci_resource_start(dev, 0);
 	info->fix.smem_len = vram ? vram : gx_frame_buffer_size();
@@ -414,19 +416,15 @@ static int gxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
   err:
 	if (info->screen_base) {
 		iounmap(info->screen_base);
-		pci_release_region(pdev, 0);
 	}
 	if (par->vid_regs) {
 		iounmap(par->vid_regs);
-		pci_release_region(pdev, 3);
 	}
 	if (par->dc_regs) {
 		iounmap(par->dc_regs);
-		pci_release_region(pdev, 2);
 	}
 	if (par->gp_regs) {
 		iounmap(par->gp_regs);
-		pci_release_region(pdev, 1);
 	}

 	fb_dealloc_cmap(&info->cmap);
@@ -442,16 +440,12 @@ static void gxfb_remove(struct pci_dev *pdev)
 	unregister_framebuffer(info);

 	iounmap((void __iomem *)info->screen_base);
-	pci_release_region(pdev, 0);

 	iounmap(par->vid_regs);
-	pci_release_region(pdev, 3);

 	iounmap(par->dc_regs);
-	pci_release_region(pdev, 2);

 	iounmap(par->gp_regs);
-	pci_release_region(pdev, 1);

 	fb_dealloc_cmap(&info->cmap);


base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
--
2.52.0

