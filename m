Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1CCBB2D7
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 20:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5C910E440;
	Sat, 13 Dec 2025 19:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Aephj+Q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9410E440
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 19:51:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-34a8a5f3d44so2555152a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 11:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765655479; x=1766260279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IsquRE2xz+HwwOQd61l9u2JoVfbUk9ALuRhwzEKiTUI=;
 b=Aephj+Q+1qMUqvlaaB+U66N1/ocYjYGltNOdJChw0Qmp2TpeybHDv8k0Vy5UAbxuOF
 g+jTk0fwyIQa5Rgjsm3Opcqe0IggyEzS0+olV9pzPxWYrVB5nQ9WZoGJwXiD4ecVoZHa
 KsJ/7t1DT+34/zkeWR1bbmgb+B8KwBeORpbdid/IwHivOynMhJVzoSTMFKkibjybzpyB
 XeTSVvx+nQuSI4ElGEKE5R5JuOFswm0zg2OanW4YaYhXx5yh2g5wuPLkpdC0nwdpKoFj
 1LfWAaFVtJ3OMlgKXF8k6gbNKFdi3frN3IYnzOY+UHwVds97/q+cBrHQwkOupEdqqhcV
 Vgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765655479; x=1766260279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsquRE2xz+HwwOQd61l9u2JoVfbUk9ALuRhwzEKiTUI=;
 b=eTIwMTfJdHUCScGKFdYwoOR2J+4IH2c090cd+HCR9JvsWGt/AcMnix7zYn1/a88dH+
 a6FA5+BIWgPDPbYF4hocvq4uzDH3secuhstLYhSVfasySDqNxFFyWaw7bdeKNmPVUtDg
 axSLZGnjwLWNeF60Wq4Pzg90gdScGO9WYZVrMW6I79oXsJxuDSpkIeS+BStleRHMD+aJ
 zgRaQT0xFr2XKybUPWbVyVcArxpqavCXdWQBNEXNv2TR+9Y5TQry4l04p8OMGyCZeyRg
 iwxQG62d1p6sd5mgDByWkwso+ReWlHu0DmNSEwxISiTAbtgw7M3Yyn8ehuu4h/pMkhu2
 y5mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK+4G8k2oQQKEaSZDNMbyOeTYuOGQwCfYqPNi+stZ2mGSeJiv7MIS2XXifqlivXoK3m8GGzqozuQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCDl/kaAI9bIBYHquLne85q1s9/gh03riDFWBuZFkpZw0gzPul
 QVJkhAhPoUF54T9HYxNpQcTcN75PqkTv2SAI2ZhuS3SNEKxHvpIlM197
X-Gm-Gg: AY/fxX7w8JKZqS2+rwUEYDRE81xXP/Xi9zmLRXRK+zzZb/gbbxbxLEf+zPHna2lr9tB
 Y0Qo6NYbeeY3hAfP7mvgHnJG2H2zc2dqGL7s7k+V+W6mJ4+0gWdV94Ji9rrxxyzz4+nuCck2Ng4
 Wk62hxpJ9AWVeZEnvjOAOfJDI3xfL7ljt+y+nL5cc1AG0Tu9kX3Wmx+iOv90mnZ1P0qHqr7pFgx
 0JO4EWAlCW76vhpOwD4C4gNER0X2JvasN7OzECunIjjmz2wnoTM0Nlr1/1nhkOXHrBKUwtm6LZy
 XgE/mrWsepu8Rf/9ukUJx49tUnYOj8e1Es2/VHrjLeDeiHT9tOmegmOEfz6w1fKAz67mb9OLFwQ
 ROYe40TrpeMKta7XVz476NZQagzN69UnzhO/s6fuQtXys1MnUmHTy+Ef18H1/1Xk1FWTTXcXdzb
 b7tmO4J9JycH86WyU2rAg=
X-Google-Smtp-Source: AGHT+IHcREPDF7aTpD+URjYTZa/VwryKmBvbSW4AVWG1PR85eHFFSRycSwlqSkc8yc3qS6yEZ5ct4g==
X-Received: by 2002:a17:90b:1dce:b0:34a:b4a2:f0bf with SMTP id
 98e67ed59e1d1-34abd6e2833mr5665920a91.16.1765655479201; 
 Sat, 13 Dec 2025 11:51:19 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-34abe3a2623sm5001422a91.2.2025.12.13.11.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 11:51:18 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Andres Salomon <dilinger@queued.net>, Helge Deller <deller@gmx.de>,
 linux-geode@lists.infradead.org (moderated list:AMD GEODE PROCESSOR/CHIPSET
 SUPPORT), linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] fbdev: geode: lxfb: Use devm_request_mem_region
Date: Sun, 14 Dec 2025 01:20:59 +0000
Message-ID: <20251214012059.304043-1-swarajgaikwad1925@gmail.com>
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

The lxfb driver currently uses pci_request_region() for memory
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

 drivers/video/fbdev/geode/lxfb_core.c | 36 +++++++++------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index cad99f5b7fe8..8189d6a13c5d 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -335,25 +335,21 @@ static int lxfb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 	if (ret)
 		return ret;

-	ret = pci_request_region(dev, 0, "lxfb-framebuffer");
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 0),
+			      pci_resource_len(dev, 0), "lxfb-framebuffer"))
+		return -EBUSY;

-	if (ret)
-		return ret;
-
-	ret = pci_request_region(dev, 1, "lxfb-gp");
-
-	if (ret)
-		return ret;
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 1),
+			      pci_resource_len(dev, 1), "lxfb-gp"))
+		return -EBUSY;

-	ret = pci_request_region(dev, 2, "lxfb-vg");
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 2),
+			      pci_resource_len(dev, 2), "lxfb-vg"))
+		return -EBUSY;

-	if (ret)
-		return ret;
-
-	ret = pci_request_region(dev, 3, "lxfb-vp");
-
-	if (ret)
-		return ret;
+	if (!devm_request_mem_region(&dev->dev, pci_resource_start(dev, 3),
+			      pci_resource_len(dev, 3), "lxfb-vp"))
+		return -EBUSY;

 	info->fix.smem_start = pci_resource_start(dev, 0);
 	info->fix.smem_len = vram ? vram : lx_framebuffer_size();
@@ -546,19 +542,15 @@ static int lxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 err:
 	if (info->screen_base) {
 		iounmap(info->screen_base);
-		pci_release_region(pdev, 0);
 	}
 	if (par->gp_regs) {
 		iounmap(par->gp_regs);
-		pci_release_region(pdev, 1);
 	}
 	if (par->dc_regs) {
 		iounmap(par->dc_regs);
-		pci_release_region(pdev, 2);
 	}
 	if (par->vp_regs) {
 		iounmap(par->vp_regs);
-		pci_release_region(pdev, 3);
 	}

 	fb_dealloc_cmap(&info->cmap);
@@ -575,16 +567,12 @@ static void lxfb_remove(struct pci_dev *pdev)
 	unregister_framebuffer(info);

 	iounmap(info->screen_base);
-	pci_release_region(pdev, 0);

 	iounmap(par->gp_regs);
-	pci_release_region(pdev, 1);

 	iounmap(par->dc_regs);
-	pci_release_region(pdev, 2);

 	iounmap(par->vp_regs);
-	pci_release_region(pdev, 3);

 	fb_dealloc_cmap(&info->cmap);
 	framebuffer_release(info);

base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
--
2.52.0

