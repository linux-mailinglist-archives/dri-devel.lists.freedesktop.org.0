Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB740CC1732
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AAE10E73A;
	Tue, 16 Dec 2025 08:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jWHvkyHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774C110E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 22:53:26 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a1022dda33so13134275ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765839206; x=1766444006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b4y5PLcNykjjXFNDo27wTnIWBRQRo7DKJyM5i0+giPM=;
 b=jWHvkyHExpPm3fbRY2rCqy7GgHmh/oohh4uF11pIFpx4nUor2GF5EUXi6MnaTvGkjs
 V6BRyRRJnxWoaUZkJ4puEfpIMii8FLMM0ph3SCybApbAq83cjlDswNDrkcIYqc762TTj
 x9kDAnyzsJpSnP+XMikRO9bI/fwPVaZxTcYF86QLhBMwHmv6s4EApJF7WIhv/b+h2J31
 bzmQQE/jyMMAiXeleYqxxCip4hnMR481PP0H/S2BRgKOLacg9nEuI5pvAZlMeUHHs68H
 Zq5qVeNPx9lWJKRAdm9oeQexzEu/M1E7mUf5fdirzyUxls86TNxILh+Lg6ec2kv3uWcP
 9toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765839206; x=1766444006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4y5PLcNykjjXFNDo27wTnIWBRQRo7DKJyM5i0+giPM=;
 b=agzCy254SyA5aau7F2khhXVeiSj7UvHis43C1/ldDzZqk6yvDs69F7G3EiizZKsmpv
 Bv0eomo04lNkdiG08fPu/iDFEqTr4N5YgkM/lnJlCj3aXZ3QCe5HIfF3gYv2pkNp1maF
 a9x4WNq2AaJg25sZEkkAodqV0La64uM6z4vmDkXu4ZFRtgEJMETLiZcj1N5VKkaN66VY
 sWHJpLKxYSU5H/CjhDKQ/N+maErVTMjSzyvrXtjFxpN45RqJ7OK0iQ7ZdkuTHelNVL9q
 8M2NsiOkpdlq6RMjfbQ7WC7S4K5QYz4G7eYfcYlzD3mATlgJhpwFfQ0vp0IaIgXZZAre
 NnBA==
X-Gm-Message-State: AOJu0YwniTQpUkHjqYmI00ULEBLJs57ozQwLvfuPiPyw1FEovo0ybMlF
 9L4ayA1PAm/BzxNg7+kaB545oofjjICYiPRDbvSCrpVs7xH/bjMsSw40BDYMUe0N
X-Gm-Gg: AY/fxX65wzGsUDsLl7cc5eirqGIwV0QxwbC9KzJ7DZt4Ob+oCCZ8Dyy0PqjUOx1ucjo
 rnquBiyLhSTBO1cpjW5mFVHh7JLQCVSNEsikfXVaBE6sfmpjEJeV6zn5MUafe0oVzBU1sOZN+sF
 69cTiV9m7KPHMlqH9Vmay6SHencFAPWYf1jwZyu5ZFXpdOMajQukyxdZKcD1DkytvHBSYfbcyhh
 uGD9HS7zNkLcXWcItRfFDAPVE6JWndXITX0wOt9Yc7ZUAcS4wpgfB9vDfNzzWGC2SE8cvpo0fwF
 2qfGWjoMdETnqDRZoIG7EOzcpcjBrfZz1cam8ySU+SGteVUv/POmpn1e15P1ZKT0tCepkD6KvTV
 hW9TEm7Ae6sqHm5VkZROXrSKofzAfd5fqiEG0BUduLpxVRHrtTAuPTspQ+14rgZuvem2rZVfXvp
 BWuIDSNaZ5UorFCypNp0EjxTSCDg==
X-Google-Smtp-Source: AGHT+IEZ9kpuajnTEPYHznFAawAXm9oPKcyxxTpunc95UjNrN7yiUhUAnO2BusqteKwTAEK8ENvJvQ==
X-Received: by 2002:a17:902:f789:b0:29f:2734:6ffb with SMTP id
 d9443c01a7336-29f27347628mr119839355ad.22.1765839205502; 
 Mon, 15 Dec 2025 14:53:25 -0800 (PST)
Received: from localhost.localdomain ([2409:40f2:2e:1717:4362:2468:ba9b:e74a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29f301bf609sm99085545ad.23.2025.12.15.14.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 14:53:25 -0800 (PST)
From: patdiviyam@gmail.com
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, deller@gmx.de, linux-fbdev@vger.kernel.org,
 DiviyamPathak <patdiviyam@gmail.com>
Subject: [PATCH] fbdev: xilinxfb: request memory region before mapping
 framebuffer
Date: Tue, 16 Dec 2025 04:23:05 +0530
Message-ID: <20251215225305.3820098-1-patdiviyam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:05:31 +0000
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

From: DiviyamPathak <patdiviyam@gmail.com>

The xilinxfb driver maps a physical framebuffer address with ioremap()
without first reserving the memory region. This can conflict with other
drivers accessing the same resource.

Request the memory region with devm_request_mem_region() before mapping
the framebuffer and use managed mappings for proper lifetime handling.

This addresses the fbdev TODO about requesting memory regions and avoids
potential resource conflicts.

Signed-off-by: DiviyamPathak <patdiviyam@gmail.com>
---
 drivers/video/fbdev/xilinxfb.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 0a6e05cd155a..f18437490de8 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -280,19 +280,27 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	/* Allocate the framebuffer memory */
 	if (pdata->fb_phys) {
 		drvdata->fb_phys = pdata->fb_phys;
-		drvdata->fb_virt = ioremap(pdata->fb_phys, fbsize);
+		/* Request the memory region before mapping */
+		if (!devm_request_mem_region(dev, pdata->fb_phys, fbsize,
+					DRIVER_NAME)) {
+			dev_err(dev, "Cannot request framebuffer memory region\n");
+			return -EBUSY;
+		}
+		drvdata->fb_virt = devm_ioremap(dev, pdata->fb_phys, fbsize);
+		if (!drvdata->fb_virt) {
+			dev_err(dev, "Could not map framebuffer memory\n");
+			return -ENOMEM;
+		}
 	} else {
 		drvdata->fb_alloced = 1;
 		drvdata->fb_virt = dma_alloc_coherent(dev, PAGE_ALIGN(fbsize),
-						      &drvdata->fb_phys,
-						      GFP_KERNEL);
-	}
-
-	if (!drvdata->fb_virt) {
-		dev_err(dev, "Could not allocate frame buffer memory\n");
-		return -ENOMEM;
+					&drvdata->fb_phys,
+					GFP_KERNEL);
+		if (!drvdata->fb_virt) {
+			dev_err(dev, "Could not allocate frame buffer memory\n");
+			return -ENOMEM;
+		}
 	}
-
 	/* Clear (turn to black) the framebuffer */
 	memset_io((void __iomem *)drvdata->fb_virt, 0, fbsize);
 
@@ -362,8 +370,6 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	if (drvdata->fb_alloced)
 		dma_free_coherent(dev, PAGE_ALIGN(fbsize), drvdata->fb_virt,
 				  drvdata->fb_phys);
-	else
-		iounmap(drvdata->fb_virt);
 
 	/* Turn off the display */
 	xilinx_fb_out32(drvdata, REG_CTRL, 0);
@@ -386,8 +392,6 @@ static void xilinxfb_release(struct device *dev)
 	if (drvdata->fb_alloced)
 		dma_free_coherent(dev, PAGE_ALIGN(drvdata->info.fix.smem_len),
 				  drvdata->fb_virt, drvdata->fb_phys);
-	else
-		iounmap(drvdata->fb_virt);
 
 	/* Turn off the display */
 	xilinx_fb_out32(drvdata, REG_CTRL, 0);
-- 
2.43.0

