Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD8A6C2CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 19:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABAC10E03D;
	Fri, 21 Mar 2025 18:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kGcJqPcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01410E03D;
 Fri, 21 Mar 2025 18:54:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-224019ad9edso58946605ad.1; 
 Fri, 21 Mar 2025 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742583289; x=1743188089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kuWrbcuvodyfwyDX9ovNtAfDuo8x7JtH0NBDGtHQx3E=;
 b=kGcJqPcPBdDNTclZggcnvys7wRZBVg5Ag+vmbpumY1uZxW5Ba6dbtgEN41YxoLMVIG
 yHe5u0Zpv1EYnjrYbI+WZfivWJRTrUANcXxJIUrrZ5Z7rNBljq2bottiZ+9nct9Xmz/V
 OmI7OsGjZuOXdOCClZkoMNeEq00adWJcIItDG1LAh/no8IJgsxf1X4YqPh51vajTvQd2
 pQGY0wwmlvxCARwcovpuu73KmmiSqO3Q6Bev2JnUrJ8ytLoSZ+FrFo3VHI+sFcjsV9T1
 UbTr5B8FfDJMhHYWFf+A8nHpeLcLqbIB/efKh1fAfVUz+wG816uXQSBr0NnqBIaUzbm2
 XV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742583289; x=1743188089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kuWrbcuvodyfwyDX9ovNtAfDuo8x7JtH0NBDGtHQx3E=;
 b=daYadIlxt9DQN3tbb8j3D4vPNGnJIcHl9yAbkWqpU45z7sjF91eH/0FPi4uuhIsNIy
 5BWWebF+0fVe0ZCx6/R7kM6zhSPlgAkA452q54UsWmpQ6vA8i7i9KZsTLo4TH4ntFSuL
 fJK4QPMkVOKP367CtynjDyoH4TxiAPG76ceApTAv8mJOL2EfdrACWbnKe1BFq8icI240
 Ef67nELmuzfSjOv2ao6B1C/zM4WWTIecw8hRLLehMwTAYdqkRpl61yu45lAgdXQGeB7/
 YWUY1heBY1yIkHhdyb/HAbXp3D48MnzMltUXYMa+6Qeo6ha6Gi/vhbbXZaq4Hh0me2ji
 nJTg==
X-Gm-Message-State: AOJu0YyGH4Lg9u+M2vQiTPv0L254jUC7gJNp/6NujrzEWVkTo4bdoIqU
 Mk7zL/+uxm+UiKXIPjCB4MVMqjuwjYXFONHqZDgZixi71e9KK3KYKBaSWg==
X-Gm-Gg: ASbGncuwHje0IO2DovQ5sUbH+JTxmnKMr4N5LVJumX92SR+BoO+vTZR2awFRGUNXZvK
 TSVzORd1mop8pSqm5Q1F4Qfpy0p5ghCApuSU1fkT+Jm9W1vMnAYM+6dLbuFneax5ObejZ0bm/6o
 QDOtkXS3na5NdHLV1W8QqySWbWMCoqOnCmZGB6rYxiPGHZslwBm68wGbrB2IPABFFsK4n0mdj7j
 rTz0icuMSl01jDuQ80NAEwYbdIcl1M7/XkuHnz7vr7zM2bSyoOOAEUXVq0hO05zgqj/JzOkFJDh
 g2xI6SpUgc0yeHbQ3rbiVVkMaqdwOWl8UgeboKS6RSnApuxu1Rn4zHhe5zSQTcMqRvgpT9kP5Ix
 ZAWI/zRQ3kB9HEeWi3aA=
X-Google-Smtp-Source: AGHT+IENwJPy3NZ2JgeNry3ajUMcfwlItfAMwMe80EXJa+Ja58OE0NniLaywafeM20eG0xAejI6Hpg==
X-Received: by 2002:a17:902:ce05:b0:223:fd7f:2752 with SMTP id
 d9443c01a7336-22780d9325amr73936175ad.29.1742583289057; 
 Fri, 21 Mar 2025 11:54:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f4c4easm20943485ad.84.2025.03.21.11.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 11:54:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Drop fictional address_space_size
Date: Fri, 21 Mar 2025 11:54:37 -0700
Message-ID: <20250321185437.5890-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 33 +++++++++++------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 19 ++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  2 +-
 3 files changed, 33 insertions(+), 21 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bac6cd3afe37..b07c785d3aee 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -236,14 +236,27 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 u64 adreno_private_vm_size(struct msm_gpu *gpu)
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
+
+	if (!adreno_smmu || !adreno_smmu->get_ttbr1_cfg)
+		return SZ_4G;
+
+	ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
 
-	return SZ_4G;
+	/*
+	 * Userspace VM is actually using TTBR0, but both are the same size,
+	 * with b48 (sign bit) selecting which TTBRn to use.  So if IAS is
+	 * 48, the total (kernel+user) address space size is effectively
+	 * 49 bits.  But what userspace is control of is the lower 48.
+	 */
+	return BIT(ttbr1_cfg->ias);
 }
 
 void adreno_check_and_reenable_stall(struct adreno_gpu *adreno_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a76f4c62deee..ec58dd2ff208 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -56,6 +56,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
+#define ADRENO_QUIRK_4GB_VA			BIT(6)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
@@ -103,7 +104,6 @@ struct adreno_info {
 	union {
 		const struct a6xx_info *a6xx;
 	};
-	u64 address_space_size;
 	/**
 	 * @speedbins: Optional table of fuse to speedbin mappings
 	 *
-- 
2.49.0

