Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0289372E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 04:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDF110EDE5;
	Mon,  1 Apr 2024 02:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OcgOwkGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8B10EDE9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 02:42:53 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso4865536e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711939371; x=1712544171; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y9yVFk1F/l4InaoRBRhvAvLyVqHVfxw8io9/7oWWxjk=;
 b=OcgOwkGgFsXwI73vpG87BMnBsvqDR+9BPLam0JMuOqP7r84Fq77gMu7vn1tzZRAyFq
 YlBdo+lPcyqppMcrqCzHiXL5w7JY21pvHsFlTMdRRAT3Efb1VhSfQkPnOy7xFlFvpqQ2
 Pp1NkTpPZpbB5+gffm4Xed8EjTcxm8ekPaBaT2Jz5ZeeMrQirmsTf9e+vb7t94N7/Fb6
 5ZIHBNpfOHsjx/7J1TNF7ERED+Vq+pyXGd8BEIjwl0vb9ZcBBmXWRFWW0rbYeo8cXu3o
 LfWLJUmEP9SJRRHFqYii438tR3y/2tENX33kxrCXVhFX/x1AYUG1tB2CG4axrk6p6qB9
 c2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711939371; x=1712544171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y9yVFk1F/l4InaoRBRhvAvLyVqHVfxw8io9/7oWWxjk=;
 b=sqiPRVvMpIpvsrZ4Y7FBSU/HVu88OqwSj84hhmn619545fdQa/vA9B5Iu3JuRvuj7g
 wut9RsFSDCZOhhNlOp+AUrXvWJwrO1lFyilpBEr/KnSMNoS96cJ95GybnoI4X364koF5
 +3Ny61UD8ud/ouc2XsBqTX1kT4LF3pG6MNE6lYkcSAjILlQsK5Df/VwTJsRzmMgmThvU
 YO8ExS6QiRNEK3b1vZ/YVs5QCxRW8bQNCWUS4kFXO6Vf62Kg9sy+dfcaCctDbtt8sd9m
 ySu9u6Gx7Gb0xPoYaxhTEXB8fVC0A8K/hebtaY3kcTAkKkX6xNhEdqvrTgeoCe6Rh4mt
 nvGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjKOlEH7Lxcwnd7en8IyIVxCoirzCKoP0l1/pDHEbMkglZzGXJR/optaSVai456hye6T4J+IdT/PtmTAM6RCOFKqk755OzrwMlD3DOX3Y
X-Gm-Message-State: AOJu0Yz7OzbgASBZNIc2V/Ll9pTWvdOL7ZacE9WYWZDdySZmGXMKHOuH
 BJ4CYxF41SN6HC9DQER2MSI810b0nQq94nBAigBZqIjQH0iLrPHx8mDEU43vGew=
X-Google-Smtp-Source: AGHT+IH1/JM4guJl+34tgSJ/YStzCSqA5P3CfRXHwwtYSzw5F5Ml9p1FV7t1oCWJiJvS+kJX7dsLBA==
X-Received: by 2002:a05:6512:6cd:b0:513:5e6b:a191 with SMTP id
 u13-20020a05651206cd00b005135e6ba191mr5924164lff.50.1711939371678; 
 Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 w28-20020ac254bc000000b0051593cfb556sm1310603lfk.239.2024.03.31.19.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 19:42:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 01 Apr 2024 05:42:34 +0300
Subject: [PATCH v5 04/18] drm/msm: move msm_gpummu.c to
 adreno/a2xx_gpummu.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-fd-xml-shipped-v5-4-4bdb277a85a1@linaro.org>
References: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
In-Reply-To: <20240401-fd-xml-shipped-v5-0-4bdb277a85a1@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7672;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6cU+E0t42Ap7hxdVHeSGMWjrpjeApiZ0znIxbQ3B0x8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCh8l7rJy5HPp40fwedPE0XvlatC/gRHOPF1eo
 +BHEQj9qjOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgofJQAKCRCLPIo+Aiko
 1TWnB/44jhPVpCCLWqmra3T6vdOKy/kk1E/qGo6vdXKYz+0MYBQp8siB6aQ+HOCDvO+8hiv9u6H
 CH17HymNiuIWWiplYAsUDHaIQYOOygyJrQnTAsdOqzIFXiK/oYQcd34/oo/7SPO6AINJEMtrw3T
 DuqRLSZJqv+3/IcXitDO5B4EnWviDT/08DL3bSQzNeooJ5FXTk4a1RA+src2apMxjDcPoiB5Jx8
 w7j/JoY+5UNyb6glVgcQ0FEIdokVgC4793o0LoKrcp1JcymSy4Kkm8x1Kt7W/AWWdbv7jKcVgq7
 DwWbSA0DxeCCkTscHNOgslUt9C7F9UTqXAmz09DNVNjda7Ib
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The msm_gpummu.c implementation is used only on A2xx and it is tied to
the A2xx registers. Rename the source file accordingly.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
 drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b21ae2880c71..26ed4f443149 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -8,6 +8,7 @@ msm-y := \
 	adreno/adreno_device.o \
 	adreno/adreno_gpu.o \
 	adreno/a2xx_gpu.o \
+	adreno/a2xx_gpummu.o \
 	adreno/a3xx_gpu.o \
 	adreno/a4xx_gpu.o \
 	adreno/a5xx_gpu.o \
@@ -113,7 +114,6 @@ msm-y += \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_gpu_tracepoints.o \
-	msm_gpummu.o
 
 msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 	dp/dp_debug.o
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 0d8133f3174b..0dc255ddf5ce 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -113,7 +113,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	uint32_t *ptr, len;
 	int i, ret;
 
-	msm_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
+	a2xx_gpummu_params(gpu->aspace->mmu, &pt_base, &tran_error);
 
 	DBG("%s", gpu->name);
 
@@ -469,7 +469,7 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
 static struct msm_gem_address_space *
 a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
-	struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
+	struct msm_mmu *mmu = a2xx_gpummu_new(&pdev->dev, gpu);
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 161a075f94af..53702f19990f 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -19,4 +19,8 @@ struct a2xx_gpu {
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu);
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+		dma_addr_t *tran_error);
+
 #endif /* __A2XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
similarity index 67%
rename from drivers/gpu/drm/msm/msm_gpummu.c
rename to drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index f7d1945e0c9f..39641551eeb6 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -5,30 +5,33 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
-#include "adreno/adreno_gpu.h"
-#include "adreno/a2xx.xml.h"
 
-struct msm_gpummu {
+#include "adreno_gpu.h"
+#include "a2xx_gpu.h"
+
+#include "a2xx.xml.h"
+
+struct a2xx_gpummu {
 	struct msm_mmu base;
 	struct msm_gpu *gpu;
 	dma_addr_t pt_base;
 	uint32_t *table;
 };
-#define to_msm_gpummu(x) container_of(x, struct msm_gpummu, base)
+#define to_a2xx_gpummu(x) container_of(x, struct a2xx_gpummu, base)
 
 #define GPUMMU_VA_START SZ_16M
 #define GPUMMU_VA_RANGE (0xfff * SZ_64K)
 #define GPUMMU_PAGE_SIZE SZ_4K
 #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
 
-static void msm_gpummu_detach(struct msm_mmu *mmu)
+static void a2xx_gpummu_detach(struct msm_mmu *mmu)
 {
 }
 
-static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
+static int a2xx_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 		struct sg_table *sgt, size_t len, int prot)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	struct sg_dma_page_iter dma_iter;
 	unsigned prot_bits = 0;
@@ -53,9 +56,9 @@ static int msm_gpummu_map(struct msm_mmu *mmu, uint64_t iova,
 	return 0;
 }
 
-static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
+static int a2xx_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 	unsigned idx = (iova - GPUMMU_VA_START) / GPUMMU_PAGE_SIZE;
 	unsigned i;
 
@@ -68,13 +71,13 @@ static int msm_gpummu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 	return 0;
 }
 
-static void msm_gpummu_resume_translation(struct msm_mmu *mmu)
+static void a2xx_gpummu_resume_translation(struct msm_mmu *mmu)
 {
 }
 
-static void msm_gpummu_destroy(struct msm_mmu *mmu)
+static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
-	struct msm_gpummu *gpummu = to_msm_gpummu(mmu);
+	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
 	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
@@ -83,16 +86,16 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
 }
 
 static const struct msm_mmu_funcs funcs = {
-		.detach = msm_gpummu_detach,
-		.map = msm_gpummu_map,
-		.unmap = msm_gpummu_unmap,
-		.destroy = msm_gpummu_destroy,
-		.resume_translation = msm_gpummu_resume_translation,
+		.detach = a2xx_gpummu_detach,
+		.map = a2xx_gpummu_map,
+		.unmap = a2xx_gpummu_unmap,
+		.destroy = a2xx_gpummu_destroy,
+		.resume_translation = a2xx_gpummu_resume_translation,
 };
 
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
+struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 {
-	struct msm_gpummu *gpummu;
+	struct a2xx_gpummu *gpummu;
 
 	gpummu = kzalloc(sizeof(*gpummu), GFP_KERNEL);
 	if (!gpummu)
@@ -111,10 +114,10 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 	return &gpummu->base;
 }
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
+void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error)
 {
-	dma_addr_t base = to_msm_gpummu(mmu)->pt_base;
+	dma_addr_t base = to_a2xx_gpummu(mmu)->pt_base;
 
 	*pt_base = base;
 	*tran_error = base + TABLE_SIZE; /* 32-byte aligned */
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index eb72d3645c1d..88af4f490881 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -42,7 +42,6 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
-struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
@@ -53,10 +52,6 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
-void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
-		dma_addr_t *tran_error);
-
-
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 		int *asid);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);

-- 
2.39.2

