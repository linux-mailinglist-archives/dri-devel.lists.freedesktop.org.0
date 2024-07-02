Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C45923E37
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8013C10E1A2;
	Tue,  2 Jul 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+WC+Ujt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471B310E03B;
 Tue,  2 Jul 2024 12:56:57 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ee794ec046so3967381fa.2; 
 Tue, 02 Jul 2024 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719925015; x=1720529815; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gnGAeKy6cKabHkI1nmqibTkSazH5JxrYUCYAVQVNUgc=;
 b=l+WC+Ujtvzz1KRaU6BVxarPAqroqH9S6l7QrqjqtVm7IeOeRdiZFinC/xle611n/18
 rqQvYyO2zPC0J42dRyaRdShJqZIeGvXlxPp5GC5ifVY7GME5wwp/t17lfRjFd54l7Ib4
 2ZVv0MXi/B0IaMwQdTZYEJjtLd6N7x5gIK30F1sLZFCirI/sggp4TnuQeUHF/QPy9vMD
 O9pE/jWL0Pe6aeznLB80dwVfGX/SEDxRo8hMrb6Um948ttPN2VsLy+V9+cJikwLOGEAJ
 StVmh2oS92LAEer/4bMg86P8ZhKhaowGzevm8SPA6+Xo6KGKaumJ2fGv9xdFtp1xSGd/
 Zwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719925015; x=1720529815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnGAeKy6cKabHkI1nmqibTkSazH5JxrYUCYAVQVNUgc=;
 b=PD/KPIDSHJokAtr86Emp/vcg1vtoLpRj6PMEups9o/qEfyhWBIGvcLGDoq0JiwAMgu
 2DKBuONJEvpv5r0cgoUrFkiQMC3rJkVwpL0UjEjZTFZp/AAyf4KurxzROFfyVF+gDcyO
 AXvChektWI/kk+2SdZ8PQOFUas8KdeM6dukKjxnFKXvrS7aLLGcgdv+1i/DnjP/gxrpG
 LlMfD3aQDEf7dlYNRPwJ5uGma+6Bbz304+vmXyqDCdhnCjx0EwXUH/ykty5Uw3ouV851
 jqOT8GTMsj4yKee5uvP2CqeLMYKD/Yo/rUjTjsaHSle8dzMGVZjLjl7fVnf9TqDIjBAL
 wWtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxOVxQrJLSBc6jB6exvtWHcws1f6LYW092JhxE8wB7U6LgcOJ6t4i1+tD2rznYIRa2usTu0iD+zubRK8ZoJLADOOiI8YwrFeGnIIib3B7G6LDsgyBLzLp2Gy+cRSMgrG+SUR+1wW4EHupLSSVGGnO7
X-Gm-Message-State: AOJu0Yw3IACmlk9rDtub06gryMUrw5EHZgGT6GnBJdv86l3F6Ka4NVtd
 gPzohDW4CEhqE7//ot3BZ5J+/46lRPqtUEu0p11mlK8yS9+9crpUNgS1Gn1j
X-Google-Smtp-Source: AGHT+IHqqYpYc7QoftKQzFzASkQHWObzeV6B+bP/VIjnFJCXVyW4kV3tImdNe1+sfli7z/0dPhfOuA==
X-Received: by 2002:a05:651c:244:b0:2ee:7255:5047 with SMTP id
 38308e7fff4ca-2ee7255541cmr24696971fa.50.1719925015088; 
 Tue, 02 Jul 2024 05:56:55 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fc429sm13145533f8f.68.2024.07.02.05.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 05:56:54 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 02 Jul 2024 13:56:31 +0100
Subject: [PATCH 2/3] drm/msm: Expand UBWC config setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
In-Reply-To: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719925012; l=5620;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wfae/FqGppsFAFeYSmy9hzy6du6jrKi2qMsq/GmcavQ=;
 b=2SEambhuX70gN17T2Bi7H4ND7MnPk4Xsb73JiHeQ97gQ57KqU6kpRymtE7i24NxUEyp4OJXDz
 muMO1iDAImID6whIvdAvuMMzvnKGCPl4iWZEvruYvvzW6Fkilhr0CkV
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

According to downstream we should be setting RBBM_NC_MODE_CNTL to a
non-default value on a663 and a680, we don't support a663 and on a680
we're leaving it at the wrong (suboptimal) value. Just set it on all
GPUs. Similarly, plumb through level2_swizzling_dis which will be
necessary on a663.

ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
the display side. Similarly macrotile_mode should match the display
side.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..33b0f607f913 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->ubwc_config.highest_bank_bit = 14;
 
+	/* a5xx only supports UBWC 1.0, these are not configurable */
+	adreno_gpu->ubwc_config.macrotile_mode = 0;
+	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c98cdb1e9326..7a3564dd7941 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	/* Whether the minimum access length is 64 bits */
 	gpu->ubwc_config.min_acc_len = 0;
-	/* Entirely magic, per-GPU-gen value */
-	gpu->ubwc_config.ubwc_mode = 0;
+	/* Whether to enable level 1, 2 & 3 bank swizzling.
+	 * UBWC 1.0 always enables all three levels.
+	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+	 */
+	gpu->ubwc_config.ubwc_swizzle = 0x6;
+	/* Whether to use 4-channel macrotiling mode or the newer 8-channel
+	 * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and 1 is
+	 * 8-channel.
+	 */
+	gpu->ubwc_config.macrotile_mode = 0;
 	/*
 	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
 	 * This should ideally use DRAM type detection.
@@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 1;
+		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
@@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_7c3(gpu)) {
@@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 0;
 	}
 }
 
@@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
+	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
+	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
+		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
 		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
+		  level2_swizzling_dis << 6 | hbb_hi << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
+		  level2_swizzling_dis << 12 | hbb_hi << 10 |
 		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
-		  hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
+		  hbb_lo << 1 | ubwc_mode);
 
 	if (adreno_is_a7xx(adreno_gpu))
 		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
@@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+
+	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
+		  adreno_gpu->ubwc_config.macrotile_mode);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cff8ce541d2c..b2da660c10c7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -194,9 +194,10 @@ struct adreno_gpu {
 		u32 rgb565_predicator;
 		u32 uavflagprd_inv;
 		u32 min_acc_len;
-		u32 ubwc_mode;
+		u32 ubwc_swizzle;
 		u32 highest_bank_bit;
 		u32 amsbc;
+		u32 macrotile_mode;
 	} ubwc_config;
 
 	/*

-- 
2.31.1

