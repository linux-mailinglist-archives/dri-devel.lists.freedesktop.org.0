Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77326AC6E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 20:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B526E05C;
	Tue, 15 Sep 2020 18:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D156E05C;
 Tue, 15 Sep 2020 18:46:18 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t138so5411310qka.0;
 Tue, 15 Sep 2020 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzFYJUIdRqoAFCAPdjlb9LWys+y6309yAx2DiZqfxAI=;
 b=dYfKIdIb0GtsYdYZzbiuU9syJhyQNcoQ9iVtznPGh5Ip9iPeMTKpkBMSW41nSzOV5v
 rBfr6HGofAHxF03cwjJMaKtaP1Qc2ZUjhcVKL4ynaVQGwKeGTzjRz9cTAwkIUKUXppgP
 NGiuFQT/oDHSCD4U/bCSn/4KcnLXdCE9SgkbPsb99ejeZpXForLkjILfI4AzH/eX4d71
 AEU2TzujHjx8E0Bl542bc0At/09R37gFqyNxEMxUjVzpijqRoC6kNtfOZ1CeDfZsjnNs
 rSXRZCTjCWQwrRtgswu3iS6KIF3+S4mQ2kdp3JKg6ti0MXi8MGPpEndiLQ7Ud7vFa8al
 Beyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzFYJUIdRqoAFCAPdjlb9LWys+y6309yAx2DiZqfxAI=;
 b=mQT/+neutET8JYRkaOUv+2Wjs/rT4k5DQXHWZ3Ho4dTe7Ar4AJWO7BdroIAzKIiV23
 sDAIXQOk+FXuipoJTq2C8QBAS4Q5rwDDRHCuPrEwt7htatXzFtjvVWqdF4xc/xBm0yfw
 EU0IcFCtiYp9+bQSjNLU8ECK5rI7Js99mSTsVvXwvWRh5+2+wdkag3cjpM40czXneXVe
 DwbKpGjgEH/JPzA6eMTWZP/mppWSz+OSGL4rMRb0VhgX/CG8jqj0thQM51Q4X2Md2aP6
 V0RjuH00grm2eYqEQbi2LNjJdYP25tLhnrNGH5LUzBE6XZ7nX5jN0ZE0kXg8gl7+eJuM
 IwKw==
X-Gm-Message-State: AOAM533ln1yPoAVc+FKuwhIQG8p1CY23w0/gmtzj703pHMvG/qWicD7b
 xSd0ORHZjFBs2oxggZ3m8Xh+H4JS15k=
X-Google-Smtp-Source: ABdhPJwD4TSoAg1Ep1qKpxttrWpr+adHoyBFzbWqI54QjFiaTde6encq52iu8n4UVTxDl9tYxnOrWA==
X-Received: by 2002:a37:e504:: with SMTP id e4mr18809091qkg.290.1600195577404; 
 Tue, 15 Sep 2020 11:46:17 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id n136sm16340897qkn.14.2020.09.15.11.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 11:46:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Revert "drm/radeon: handle PCIe root ports with addressing
 limitations"
Date: Tue, 15 Sep 2020 14:46:07 -0400
Message-Id: <20200915184607.84435-1-alexander.deucher@amd.com>
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

This change breaks tons of systems.

This reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206973
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=206697
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=207763
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1140
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1287
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>
Cc: christian.koenig@amd.com
---
 drivers/gpu/drm/radeon/radeon.h        |  1 +
 drivers/gpu/drm/radeon/radeon_device.c | 13 ++++++++-----
 drivers/gpu/drm/radeon/radeon_ttm.c    |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index b7c3fb2bfb54..eed23dffccf4 100644
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
index 357e8e98cca9..d2550862313e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -787,7 +787,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
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
