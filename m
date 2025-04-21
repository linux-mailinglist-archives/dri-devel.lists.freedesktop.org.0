Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199CA9552A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 19:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8780D10E0F9;
	Mon, 21 Apr 2025 17:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VgBvtuG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0DC10E0F9;
 Mon, 21 Apr 2025 17:21:48 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-73972a54919so3739804b3a.3; 
 Mon, 21 Apr 2025 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745256108; x=1745860908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hI/kPYQwcnebx1GK8sp1T5NZWGKFVC/9WVdP0WQS4qs=;
 b=VgBvtuG0955utubnw3QoV5fUmEmPDjbBhHM3Y4HI4lFbrBF7EYqR0HUwkcPiB7JDmr
 RkQ6sM+TP1Knnq05AgCTvwhvvpDBjZ9zbcpACyP2tcZAv17GrbV/PpgXWbIPpYviB1q6
 sFFqoaOcvPG67gfQ1wGRJQh5M8CA/K4TD/aUMXX9z7NbANjnkj7tTUfe3iSrRboaPpwx
 03g1OvSCzie7RK0L2UiCtFFmyDKl2a5sJQLRwh86/qy3YUV5LKl1mq+VAyIKkJ4bA7jj
 kp/GFTSTABR7Xc4cW26J6TlQykfdvKerbcR+dFaA4kH3M5Kh1nxcOdY+O5bxOTSJrHcT
 v8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745256108; x=1745860908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hI/kPYQwcnebx1GK8sp1T5NZWGKFVC/9WVdP0WQS4qs=;
 b=GcCo4XQhaEHj+4gF8Br0IsQnwv4bR0iyCDMaK95zEe7RX5d9gfEoUi9G3IHRhGgCe0
 Z2CfTlHL5DQGLZHnxsafHvrAzEWzxIZxaWdfqlinR1uD99FFFmV0EYwpwI5AiYrdN7A9
 Ok1RD3jvgPjqDzRlI2KilYfwcq2cYYYqg1nFIp1/XjJ3VLOJn9WFfVjG/DozFvULOPQR
 5tNwOmrYJDh+kB12jegway0gZvf7/fkCReNVAfulrVf7ideb3VpLn/R2xSyFS/v4ZJ/g
 pS8Driogw/LV79AMnlD5PO3ihpEkW516IYO1DjOKfw5Igzh1ucocEsQBg45RU9OPD3zm
 KDlA==
X-Gm-Message-State: AOJu0YwdER6aiSrbXRtEVJZ/G5e65pRw+x7GeAU9oLdiYkAVKkQGxsHd
 T85NCssMJE0cgspm/Kf/tI+lriXSgu5OJ4FCxQz750eUbvaP1244sgU5sQ==
X-Gm-Gg: ASbGncvnQhIwwh5a5m7Gzp8KApB4BjJGoj/b1cMXkmGj/pEHTB0ImHSTaIr4JrJ1N7i
 4N40xHksqTEQXPirqLAcWNrKKqBIvYu82WKrOQx9Kct48gXOwy18aaL6UqECiVbF44KewSGkTKY
 yKQGMXL6PylrAG8ReQwdbVHg9oanRnof9bjuLrVeTIntSWlZjaV70MsAtdEPvFWMOp7Dzbi8O77
 XqPnAqOhBGW573NWWC3ykEkNyvL9VeP8n8cMmpBPMxJS7Q8Hw10j08PI/Vn6q6hF6BTi2s0X4RR
 kYJu05q0lGB44qp3ksUt+gTTDmrbepXfSRDSUt1CbBigO1DUmbucb9zxIjnbmUB/JqmKUfTGfCx
 Wp6iJT8Q6zIlaGDU=
X-Google-Smtp-Source: AGHT+IFUf+PTQfUR2eCURDiia5Zf7s/G+bncDAm/QXNWolKB8z01IfAgsK8aNPfU0hLSVli4c4Ul7A==
X-Received: by 2002:a05:6a21:6daa:b0:1f5:67c2:e3e9 with SMTP id
 adf61e73a8af0-203cbd2383fmr18140909637.29.1745256107724; 
 Mon, 21 Apr 2025 10:21:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0db127742bsm4642984a12.1.2025.04.21.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 10:21:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/adreno: Drop fictional address_space_size
Date: Mon, 21 Apr 2025 10:21:43 -0700
Message-ID: <20250421172144.168273-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Really the only purpose of this was to limit the address space size to
4GB to avoid 32b rollover problems in 64b pointer math in older sqe fw.
So replace the address_space_size with a quirk limiting the address
space to 4GB.  In all other cases, use the SMMU input address size (IAS)
to determine the address space size.

v2: Properly account for vm_start

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  4 ++-
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 53e2ff4406d8..f85b7e89bafb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -681,6 +681,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 		},
 		.gmem = (SZ_128K + SZ_4K),
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
@@ -713,6 +714,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -743,7 +745,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -769,7 +772,8 @@ static const struct adreno_info a6xx_gpus[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.init = a6xx_gpu_init,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
@@ -791,6 +795,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -815,6 +820,7 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
@@ -838,8 +844,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
 		},
 		.gmem = SZ_512K,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -874,7 +881,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00010000,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
 			{ 137, 1 },
@@ -907,7 +913,6 @@ static const struct adreno_info a6xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x06030001,
@@ -920,8 +925,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
 		},
 		.gmem = SZ_1M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -939,8 +945,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
 		},
 		.gmem = SZ_1M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -973,7 +980,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0, 0 },
 			{ 1, 1 },
@@ -1000,7 +1006,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020000,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06060300),
 		.family = ADRENO_6XX_GEN4,
@@ -1019,7 +1024,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
-		.address_space_size = SZ_16G,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,
@@ -1039,7 +1043,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 			.prim_fifo_threshold = 0x00200200,
 		},
-		.address_space_size = SZ_16G,
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 117, 0 },
@@ -1056,8 +1059,9 @@ static const struct adreno_info a6xx_gpus[] = {
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
 		},
 		.gmem = SZ_2M,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1085,7 +1089,6 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00800200,
 		},
-		.address_space_size = SZ_16G,
 	}
 };
 DECLARE_ADRENO_GPULIST(a6xx);
@@ -1395,7 +1398,6 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_cgc_mode = 0x00020000,
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
@@ -1429,7 +1431,6 @@ static const struct adreno_info a7xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
@@ -1451,7 +1452,6 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
 		},
-		.address_space_size = SZ_256G,
 		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
@@ -1484,7 +1484,6 @@ static const struct adreno_info a7xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
-		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index eeb8b5e582d5..129c33f0b027 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2272,7 +2272,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_address_space_create(mmu,
-		"gpu", 0x100000000ULL,
+		"gpu", ADRENO_VM_START,
 		adreno_private_address_space_size(gpu));
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 59cfed5acace..e80db01a01c0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -236,14 +236,27 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 u64 adreno_private_address_space_size(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	const struct io_pgtable_cfg *ttbr1_cfg;
 
 	if (address_space_size)
 		return address_space_size;
 
-	if (adreno_gpu->info->address_space_size)
-		return adreno_gpu->info->address_space_size;
+	if (adreno_gpu->info->quirks & ADRENO_QUIRK_4GB_VA)
+		return SZ_4G;
 
-	return SZ_4G;
+	if (!adreno_smmu || !adreno_smmu->get_ttbr1_cfg)
+		return SZ_4G;
+
+	ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
+
+	/*
+	 * Userspace VM is actually using TTBR0, but both are the same size,
+	 * with b48 (sign bit) selecting which TTBRn to use.  So if IAS is
+	 * 48, the total (kernel+user) address space size is effectively
+	 * 49 bits.  But what userspace is control of is the lower 48.
+	 */
+	return BIT(ttbr1_cfg->ias) - ADRENO_VM_START;
 }
 
 void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a1e2d9e87b75..2366a57b280f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -57,6 +57,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_4GB_VA			BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
@@ -104,7 +105,6 @@ struct adreno_info {
 	union {
 		const struct a6xx_info *a6xx;
 	};
-	u64 address_space_size;
 	/**
 	 * @speedbins: Optional table of fuse to speedbin mappings
 	 *
@@ -600,6 +600,8 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 	       adreno_is_a740_family(gpu);
 }
 
+/* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
+#define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
-- 
2.49.0

