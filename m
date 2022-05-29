Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547E5371FA
	for <lists+dri-devel@lfdr.de>; Sun, 29 May 2022 20:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D4410F4B1;
	Sun, 29 May 2022 18:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD4310F4AB;
 Sun, 29 May 2022 18:02:33 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u18so2273203plb.3;
 Sun, 29 May 2022 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzGOFoijegI6bs3FEJJIbalqohkJ7YI9mVcD9clwKWU=;
 b=nOnixLnoLQGUvPL5RyUQZOlPY6YE6sNEMHjYjB2IaYUrtzPoYguiyrl1YUq+Lsm927
 3EBZmxu4bAYfcWvSMuAlCYHftz433enDWNht0945TEX570r/w4uGZcaiKfU4ftm/cC4k
 X4xk50R+bxzTE6Hw7drKMu4JMci4MbvUyZL0dDer18d+WLPO7wxvuMM8IU5jraCPSOXH
 AWrwrCnl8DAxkxXrJc/+e+G8suJ5PFdL9F4Mks90Gbxs0MFal9IIERTRNIkjirUSgl/l
 qti86avstvKCwFK9ZxRE9FhIx/81oGc9m+klckALxDY553SU3F83RRqgoggrrzi4OAdj
 nQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzGOFoijegI6bs3FEJJIbalqohkJ7YI9mVcD9clwKWU=;
 b=Ebfy/mCraLCascU/YbclyOomVAsol3m1a6pCMMxFzvMw/dVOKKLiiX3CNX11lqBVBO
 1/3B7ZjN1zHNPcYVDvhD9jo59VQwnmWPACqbcO6ELmuz/ol5ggajq3NUJ6QDrlCpdjiF
 ZwGRB8G4DM/N/HR82/67N53yrjfeDA/0QPcOoneq+7384BloBmSXEMpnIWZUqIk/jAjA
 VEUr4EsTPXJ8X5BbuGx4Oy+INRFNyjw/U3aSGrVCLv4nxXuHUgGRrZHUt7+Inui8vTdA
 i+Mz/0F/SPytjmquSxSDEtT6HOJsgb+K/7eICFTLdj6458vwu4wWJVhvwfSdH5bDfwqf
 +w5A==
X-Gm-Message-State: AOAM5300Xl57t9UvcsYXtZS+JBMlnOXtd0cgVpmXpvY81IWX1xsDF4cC
 mimj8HrCkFSx4QZj7gzQw/RjQAKcIWE=
X-Google-Smtp-Source: ABdhPJwbxNlyttp4stVGRr/0qeiqK75I0bN48Jv5EpwxMjf2d4saFqSUqUJ4ZWtAGhl4CfHyPk5ouQ==
X-Received: by 2002:a17:902:b413:b0:15e:e6a8:b3e with SMTP id
 x19-20020a170902b41300b0015ee6a80b3emr52707916plr.24.1653847352869; 
 Sun, 29 May 2022 11:02:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a17090301d000b0016370e1af6bsm7622714plh.128.2022.05.29.11.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:02:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Allow larger address space size
Date: Sun, 29 May 2022 11:02:25 -0700
Message-Id: <20220529180232.2576720-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The restriction to 4G was strictly to work around 64b math bug in some
versions of SQE firmware.  This appears to be fixed in a650+ SQE fw, so
allow a larger address space size on these devices.

Also, add a modparam override for debugging and igt.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  3 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 17 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 ++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 42ed9a3c4905..24932b2945ae 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1737,7 +1737,8 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_address_space_create(mmu,
-		"gpu", 0x100000000ULL, SZ_4G);
+		"gpu", 0x100000000ULL,
+		adreno_private_address_space_size(gpu));
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 89cfd84760d7..f3685130ce9b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -303,6 +303,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
+		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
@@ -316,6 +317,7 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
+		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
 		.fw = {
@@ -326,6 +328,7 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
+		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
 		.revn = 680,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4e665c806a14..7bc96cbe6e95 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -21,6 +21,10 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+static u64 address_space_size = 0;
+MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
+module_param(address_space_size, u64, 0600);
+
 static bool zap_available = true;
 
 static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
@@ -228,6 +232,19 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	return aspace;
 }
 
+u64 adreno_private_address_space_size(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	if (address_space_size)
+		return address_space_size;
+
+	if (adreno_gpu->info->address_space_size)
+		return adreno_gpu->info->address_space_size;
+
+	return SZ_4G;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ab3b5ef80332..0a4d45695dc7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -70,6 +70,7 @@ struct adreno_info {
 	const char *zapfw;
 	u32 inactive_period;
 	const struct adreno_reglist *hwcg;
+	u64 address_space_size;
 };
 
 const struct adreno_info *adreno_info(struct adreno_rev rev);
@@ -280,6 +281,7 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	       adreno_is_a660_family(gpu);
 }
 
+u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
 int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
-- 
2.35.3

