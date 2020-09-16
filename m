Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632D26C334
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 15:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE406EA1C;
	Wed, 16 Sep 2020 13:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044AA6EA07;
 Wed, 16 Sep 2020 13:20:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t138so8112146qka.0;
 Wed, 16 Sep 2020 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wo0aeFa71noE1SaeNWFZSJ3BKucJn7M1PEH9DQMwxYg=;
 b=XGKl1y8GQ32Jk6DGgPSkXBbuDlvlUW/Vu7BzdGNYp40ePySgp4/98iZlkWKnSh6v+i
 HukRbY+9JfNwXTmumUkpievO6zIb4G9Y5AN5zyRahyqz8U3XZYv5UWKBZx6+wm9mB8FE
 K3Yy2K9aoOeXsdpteMFuiAEbeNrd8iVVTO3DX5yurPvZlRfPm+YjWLIHiotiUDJou+vR
 SQfKm3ffQy9ysZUJ6vWNQEaYmiG8Z2cvYC+LXAG26j3jSkTI6lhdEAldMuqB4nP5Lhw3
 VbJMIS+8nLAcQgLSMIQCu/n7l6aVF8uVu52i8uK9i1yMegcqP0ciilD42MuI0shI6LMK
 xDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wo0aeFa71noE1SaeNWFZSJ3BKucJn7M1PEH9DQMwxYg=;
 b=Krr+eKiNOoPcCLBhJbrlChUK7rD/HZNN6jpmDIjWIbEPx8O9Jwfph8uIXJPvTeqQXx
 2rubgkUMFCr/I+AKoyAVtDar3UPoTr4eqor/CVkoGyih6mJSFBU34urrfcWH1fmX8u0L
 3l97Rm+jOTmM6lbNv7mCcBLvDUrCCgW071HFxM3vvgFfT/h6jcQwl0ii1S4RxJ+GrsJv
 2bvsUZ6Clc11lK+547FSv+jtQLzrQOcxLGJAbaygTqYN5XlW3ITS2skhltLvlpHbXGzG
 RhJldqnHR2Hox4TqWuiRzWnXKlwYrTmWbS2yIo08IzKsjh/2E9xyyXnD4MvKKJsvDX3h
 zFqA==
X-Gm-Message-State: AOAM531zOXsrUBiGjEj8iuxfUpRvoRNdL/hOpa1A4PuTZLZ1W4qnSqgD
 MWpdrgnsHvo5JG0HTFJhp68Xcxe19WQ=
X-Google-Smtp-Source: ABdhPJw7YUdj23N3NHT/8ojGA2UA7Xzi/Xqa5ywU7XfgxdH0XCNUdOp1cGQoGqloROPYDe9WKl35/w==
X-Received: by 2002:a37:8c87:: with SMTP id o129mr5090351qkd.41.1600262430824; 
 Wed, 16 Sep 2020 06:20:30 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m36sm18552022qtd.10.2020.09.16.06.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 06:20:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] Revert "drm/radeon: handle PCIe root ports with addressing
 limitations"
Date: Wed, 16 Sep 2020 09:20:17 -0400
Message-Id: <20200916132017.1221927-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 stable@vger.kernel.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This causes screen corruption when using the GPU which makes the
system unusable.

It was noticed by several people closer to when the change went in as
well.  We looked into it a bit at the time but couldn't determine the
problem.  It only seems to affect really old chips (like 15-20 years
old) which makes it hard to reproduce if you don't have an old system.
There were a couple of threads at the time, but nothing was resolved.
I was able to find one of them:
https://lkml.org/lkml/2019/12/14/263

This reverts commit 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations").

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206973
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206697
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207763
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1140
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1287
Fixes: 33b3ad3788ab ("drm/radeon: handle PCIe root ports with addressing limitations")
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>
Cc: christian.koenig@amd.com
---

v2: provide a better commit message.  The issue seems to be related to himem.
Any ideas?

 drivers/gpu/drm/radeon/radeon.h        |  1 +
 drivers/gpu/drm/radeon/radeon_device.c | 13 ++++++++-----
 drivers/gpu/drm/radeon/radeon_ttm.c    |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index cc4f58d16589..019f756b3f80 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2391,6 +2391,7 @@ struct radeon_device {
 	struct radeon_wb		wb;
 	struct radeon_dummy_page	dummy_page;
 	bool				shutdown;
+	bool				need_dma32;
 	bool				need_swiotlb;
 	bool				accel_working;
 	bool				fastfb_working; /* IGP feature*/
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 266e3cbbd09b..f74c74ad8b5d 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1363,25 +1363,28 @@ int radeon_device_init(struct radeon_device *rdev,
 	else
 		rdev->mc.mc_mask = 0xffffffffULL; /* 32 bit MC */
 
-	/* set DMA mask.
+	/* set DMA mask + need_dma32 flags.
 	 * PCIE - can handle 40-bits.
 	 * IGP - can handle 40-bits
 	 * AGP - generally dma32 is safest
 	 * PCI - dma32 for legacy pci gart, 40 bits on newer asics
 	 */
-	dma_bits = 40;
+	rdev->need_dma32 = false;
 	if (rdev->flags & RADEON_IS_AGP)
-		dma_bits = 32;
+		rdev->need_dma32 = true;
 	if ((rdev->flags & RADEON_IS_PCI) &&
 	    (rdev->family <= CHIP_RS740))
-		dma_bits = 32;
+		rdev->need_dma32 = true;
 #ifdef CONFIG_PPC64
 	if (rdev->family == CHIP_CEDAR)
-		dma_bits = 32;
+		rdev->need_dma32 = true;
 #endif
 
+	dma_bits = rdev->need_dma32 ? 32 : 40;
 	r = dma_set_mask_and_coherent(&rdev->pdev->dev, DMA_BIT_MASK(dma_bits));
 	if (r) {
+		rdev->need_dma32 = true;
+		dma_bits = 32;
 		pr_warn("radeon: No suitable DMA available\n");
 		return r;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 74ad50c7491c..7e5c2fb8eab0 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -738,7 +738,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
 			       &radeon_bo_driver,
 			       rdev->ddev->anon_inode->i_mapping,
 			       rdev->ddev->vma_offset_manager,
-			       dma_addressing_limited(&rdev->pdev->dev));
+			       rdev->need_dma32);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
