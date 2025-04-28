Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9FA9FAEB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6280510EA2A;
	Mon, 28 Apr 2025 20:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j0X1siL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FD710EA28;
 Mon, 28 Apr 2025 20:56:38 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-736aaeed234so4470872b3a.0; 
 Mon, 28 Apr 2025 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873797; x=1746478597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
 b=j0X1siL8Mbqe7wFzyrfl/0FvGvFxvAN4qDQ+msWr46VrPlVa8VFLDwoavh4aouz3YP
 t/tDAC7kPU1mBV1wOy29M+irhtz1uSsmVCIvyonzdOJb6iD4JwuTyD5dUUid18VdlkkS
 zk17j6umYWUt1RCh6MCbvKDrF+svRDbyE4In/Uc1xnfxcFEW3hn3mv1VTY8OmjSU23fl
 g5hwkbQGdU/SeMm4AG+qcrueObkXO+i7P/X/E7VNwV1IDp/rWPNSAPgIIGPJ6aqaXOHl
 F8LZaTiISpVCVIq8V1yn7Q5x/fX/FxM5vQWNww1rYFD5viFgK5/UPpKB1Z961pNJj0Oq
 xooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873797; x=1746478597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZWdv895QF2g5ZazrpGEqIZ+CNyMWOJKJzfuDlETcFA=;
 b=m0nkmJ8SnWwUve4WqG8fhuomedQB86Ku+oxpyIbHcwrGwbF0FyPILLMeKoEouIlKjH
 7pK3MdrmQn3MfhHjAa9sGbseSSNLFP3dAg+8TLpUSge3FV3gI7bKQcGhGX3zAenzfgLg
 3YdAq1Lin3PmYj892AaRKJYdRtOCpAjNcC1FvLtdl0UvACUQ228cnkfjhKBf2V4csVCI
 whAU/VN48zHIl/21JrUcqYXzcfuXRYA54vKfAdTN3L4JcMulOTJxDz796rYNJYW/zjPi
 taxeTOEuvoPDC3ISQgK2la6+G+JwFyAFe6buBgLTvvkaf2KUnyTTTCJa0+aWzpi8VX8m
 IXFQ==
X-Gm-Message-State: AOJu0YwpqN1EoFLXMynFkKHyY4EfDMvIjxkjAxjYp4oy1tHPPn/soaaP
 yWsV+79SRVPiyA/yTvQm7/kGUpRxawKh+sk6DGe+kuOWd5D0dUJbOd3DOg==
X-Gm-Gg: ASbGncvgk4IE1wGpqp/85cIjnKWTn+IH/eWsluqnGRXUxu9e6GkOzjcj4aTB/3qxTwF
 8HC+AVlOg62aLCfzYJALZxTPlIDewXKQu9DIxtO3CCmcHkt4ds8NLDP1zESf5tP/aNik7I03nDq
 d6vI/BKhf7G53XqyXZJW1H65na1wG2fIDdlg+/g2ztLyN7StMUY+b75fBsrlIghsmg/Ox3yfk7n
 q8BGZ+wqdvYVc76l76eBVKU39B3TxiWnrUR/37AAcwoOYTX+2LtiXeILFtpmodKCKJObty4510a
 ++3ukPzDwRWK6Si87bWCxw8Z9M9LqaYyxJWP1qVcAvOeeQdr6ysQ++ZQ9QJ0m1Csx1CZMiDziG6
 JUv87rinbFQulcvg8i+dqKQ24zA==
X-Google-Smtp-Source: AGHT+IEiI0PIx8sG0Cs/BBXwMjUjK2HcinX0Gfd8jPjSIhMKMTJcc2LognCvLHlEUKydTsw79aws8Q==
X-Received: by 2002:a05:6a00:3927:b0:732:2923:b70f with SMTP id
 d2e1a72fcca58-740271689ffmr1632804b3a.11.1745873797293; 
 Mon, 28 Apr 2025 13:56:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9abf2sm8405360b3a.122.2025.04.28.13.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:56:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
Date: Mon, 28 Apr 2025 13:54:10 -0700
Message-ID: <20250428205619.227835-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

In situations where mapping/unmapping squence can be controlled by
userspace, attempting to map over a region that has not yet been
unmapped is an error.  But not something that should spam dmesg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/io-pgtable-arm.c | 18 ++++++++++++------
 include/linux/io-pgtable.h     |  8 ++++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f27965caf6a1..99523505dac5 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -475,7 +475,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 		cptep = iopte_deref(pte, data);
 	} else if (pte) {
 		/* We require an unmap first */
-		WARN_ON(!selftest_running);
+		WARN_ON(!selftest_running && !(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 		return -EEXIST;
 	}
 
@@ -649,8 +649,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	unmap_idx_start = ARM_LPAE_LVL_IDX(iova, lvl, data);
 	ptep += unmap_idx_start;
 	pte = READ_ONCE(*ptep);
-	if (WARN_ON(!pte))
-		return 0;
+	if (!pte) {
+		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
+		return -ENOENT;
+	}
 
 	/* If the size matches this level, we're in the right place */
 	if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
@@ -660,8 +662,10 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 		/* Find and handle non-leaf entries */
 		for (i = 0; i < num_entries; i++) {
 			pte = READ_ONCE(ptep[i]);
-			if (WARN_ON(!pte))
+			if (!pte) {
+				WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN_ON));
 				break;
+			}
 
 			if (!iopte_leaf(pte, lvl, iop->fmt)) {
 				__arm_lpae_clear_pte(&ptep[i], &iop->cfg, 1);
@@ -976,7 +980,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
 			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
 			    IO_PGTABLE_QUIRK_ARM_OUTER_WBWA |
-			    IO_PGTABLE_QUIRK_ARM_HD))
+			    IO_PGTABLE_QUIRK_ARM_HD |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
@@ -1079,7 +1084,8 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	struct arm_lpae_io_pgtable *data;
 	typeof(&cfg->arm_lpae_s2_cfg.vtcr) vtcr = &cfg->arm_lpae_s2_cfg.vtcr;
 
-	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB))
+	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_S2FWB |
+			    IO_PGTABLE_QUIRK_NO_WARN_ON))
 		return NULL;
 
 	data = arm_lpae_alloc_pgtable(cfg);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index bba2a51c87d2..639b8f4fb87d 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -88,6 +88,13 @@ struct io_pgtable_cfg {
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
 	 * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
+	 *
+	 * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
+	 *	mappings, but silently return -EEXISTS.  Normally an attempt
+	 *	to map over an existing mapping would indicate some sort of
+	 *	kernel bug, which would justify the WARN_ON().  But for GPU
+	 *	drivers, this could be under control of userspace.  Which
+	 *	deserves an error return, but not to spam dmesg.
 	 */
 	#define IO_PGTABLE_QUIRK_ARM_NS			BIT(0)
 	#define IO_PGTABLE_QUIRK_NO_PERMS		BIT(1)
@@ -97,6 +104,7 @@ struct io_pgtable_cfg {
 	#define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA		BIT(6)
 	#define IO_PGTABLE_QUIRK_ARM_HD			BIT(7)
 	#define IO_PGTABLE_QUIRK_ARM_S2FWB		BIT(8)
+	#define IO_PGTABLE_QUIRK_NO_WARN_ON		BIT(9)
 	unsigned long			quirks;
 	unsigned long			pgsize_bitmap;
 	unsigned int			ias;
-- 
2.49.0

