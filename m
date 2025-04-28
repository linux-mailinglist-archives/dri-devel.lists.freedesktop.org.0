Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464EDA9FB30
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C310EA63;
	Mon, 28 Apr 2025 20:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNFUOip1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECE010EA5B;
 Mon, 28 Apr 2025 20:57:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-224019ad9edso79817415ad.1; 
 Mon, 28 Apr 2025 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873873; x=1746478673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
 b=bNFUOip17KfJ5/W1vGN/ngBPPbjnsfru5UCibsJFSjf2ov+mTi81mVcjdsvqLOLtL+
 6WERTDaRzd/s9UEdkp36vAnnKGr24atEfaPtu3mJbPSeEWaCLo3wHwEaJ3hEsNmiYw6b
 begsx+GfPOcQRTkYkg3aoJ39buhA24tTJNyvUwV9fCysz0rSInIi2aP92UVvArQZCnHT
 AKyNchM3CKgc8FuIFYsP6hLuhtp16jRQXA/gxtqHdF5MkohGqAy+aNIjYLHEWtQ+xkXZ
 CuG0Z6pDNGTsiUGJmRltvewy2rw5uLgjZPK1CuUBQgaEmCPnFXMfeZ45m1etB+9COXfG
 6sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873873; x=1746478673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1j2RUJnwVC+vYKJSWO/0XWvYj35FTt1kwRlO+Xy2fTs=;
 b=L4PlV8v3ntXAYJeORGMMWVbE0VpyvHcqIqtGC1fcXjUirkJaIH9XKbFYL8x1txAzlV
 VkLrB/Gh3faqBBgAdL3NGm98BFlxWlW4R1q62dRMhkW8kXwPb7A3LaE7gSX6kZzTbnSi
 Lq9w4bJk+KxZTgfoYPBEQ78JjIqhjoK7e9+khpc5qEciFIqOle2E62dzCzJ03BsrJvfg
 9u9FjD6z2fQuUyJcDB8zinDkqPW/3BO4F/rQhjzLzRAF/fLBpQbcJgm9upwxcKj8IjAJ
 eRlExaKdP4xUi4a49rJQrPrxy7to319HwpAGgvLw+yT3Or46Ht/OVUK7p++4uSeyTddf
 gEOQ==
X-Gm-Message-State: AOJu0YyL31Reqq407lvZuG/ySVxmTDoWtZDbjxdLWZRbNG0soHbjTHG2
 c90ACRONrwZw+Hie6xlltzMceYPZ6cjoT7xYguSEMYYEZLvHFWMxvHpp7w==
X-Gm-Gg: ASbGnct1XoE3ysYKKrjkoHi3iqYU77arRLhIiVKzD2I6UOysY1FohjIoQ0h9LEn2Eye
 h/qAcf3PU9LNN8Jv50W1lFASRR6FSv0OfyOetaxMg68+EzaCGK/vnv/dLnrvy3r9mDvQUEYSCg6
 jDqxTV9q5DnNm9bEBrHudG/Spj76UCVw/KL4pS+yKmRgbz8kkYGn1PjSC4AUOSsNtnbmZ+SQU1R
 OYGWH0t6YEqTw7sajKJUprdBLHuaRQjkaJOJyqoL/xCQwh00G0g3YX39uSH7cSs1JUnCSqVSK9M
 gJmrwH/lIutll+Hn+GXDPDsHNKVrO6XkQGtfVufhkCulV8yQgj4CzvwW84cNctTd6lS/xwJbXDC
 jmieB9VE/iIGylgQ=
X-Google-Smtp-Source: AGHT+IGj0j4cIVnhPmszKYijPx+TdZT0sVXc2HKRoQohmvTZqeB+6N3kGYgKnyk3T5fZPfKqujD20g==
X-Received: by 2002:a17:902:e5ce:b0:220:c164:6ee1 with SMTP id
 d9443c01a7336-22de7012487mr6704695ad.32.1745873873408; 
 Mon, 28 Apr 2025 13:57:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d76e21sm88016025ad.45.2025.04.28.13.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 29/33] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Mon, 28 Apr 2025 13:54:36 -0700
Message-ID: <20250428205619.227835-30-robdclark@gmail.com>
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b7936b83660f..f4d3210bb8ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..237d298d0eeb 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN_ON;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0

