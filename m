Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC03925A17
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522E810E79D;
	Wed,  3 Jul 2024 10:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kdfjTkCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D00110E3A5;
 Wed,  3 Jul 2024 10:54:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-365663f51adso3175055f8f.1; 
 Wed, 03 Jul 2024 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720004043; x=1720608843; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
 b=kdfjTkCgiay3Tu41sL6zc66L1IzUEm8mUo9Vw85bMCSFkjUx/ljhaWJRXKmAfexI0S
 mdGmfH+Q0eUPMbcfqZnmtV8VYD8sxmZlT/abRI01y8stueMfFbP+Z5THya7645MDlfqi
 c3+zBq2WjFjY4HatIfGttMPg6REaaTqKIvAGqtC2fwKzMBjtgJqMwzsK6vN0BTkFGt6f
 tXZXvlL2xdjyzPvqNXJxeHYRFctwLpxWzFRnZXE2BBCN8H+q/IG95HINZ0I8gN9Q91fl
 I7rEeHT9Ti/ydHFQ5U3h4Zt+2Nmnyq8c8w7SBlJV7KuyWcDfQFBVnuGy21FMldbO2eRn
 g9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720004043; x=1720608843;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
 b=Ei6kk/MVwm6cDozeklr30HxzTnsWun5eP0KctWYEtdVwkhcHTbR/rc3NH7sY9QOxXY
 qmQko4cCJYjzExFYFvU8MO/Mx3gYBQB48Cwcj1lecILTZyUKgo1W+nhlD38atn2tANi2
 jVYmAyUMDS/uYyEiPxiZ7n61YzWhskoYNmC54VrCUhG+15z9BfArNlC9i0nNf3B3vZ5Y
 +OtSk+9GLaKAqwjfPpWHUgv9gJOl2YIXgF97J21Vp6AGyxLg2oJP5/seXkiOr9Be9pX5
 JcvBG0krulvORatDnckwOBfcJsdGrDdE0zOxMc7glExogduUg8KJ4JAQNtvQ6Hh7N0Bm
 puuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBiBkOeuwQmgfJqnsVyGAsH475IfEcjs/FofcZerIRgNfCGkAT6CNBYYlQs8+3kuy2QxXcx420sYQjFbx2rf8mMaPSNPEJv6mW/5Q6VilA1j6/xGsU9zw8VEXlOzURgjyMXx8CjB7si3l4eyXJA6iV
X-Gm-Message-State: AOJu0YzAa2ezpnHFzaDUFoK7fqdV+hQvJOpYIdyKR2yqpVnuID1yiqr2
 F0HPYu/IIDfOAaEoc7WLw61PE2km5fPBQQDG1FyFQdulLaSZv79oRqhFYyQX
X-Google-Smtp-Source: AGHT+IFbYFGKaiANXXTF8Ajl8YzGmcI1/8803WNaXqJuwoPgXi/1kQzdfs0rqHSfVvkIPq1XqmueVA==
X-Received: by 2002:a05:6000:18ae:b0:360:79d4:b098 with SMTP id
 ffacd0b85a97d-367756bad06mr7567131f8f.29.1720004042449; 
 Wed, 03 Jul 2024 03:54:02 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0d9b1dsm15644879f8f.42.2024.07.03.03.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:54:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 03 Jul 2024 11:53:48 +0100
Subject: [PATCH v2 2/3] drm/msm: Expand UBWC config setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-msm-tiling-config-v2-2-b9da29ab6608@gmail.com>
References: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
In-Reply-To: <20240703-msm-tiling-config-v2-0-b9da29ab6608@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720004038; l=6571;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
 b=Zzxey0YUXABYR+iwfrPaLUlCL6pq087DsQ+FQ2whIMX3wOyYnunXemygLoztY5jm7vfoSW55b
 OrofpEJ0fd9BxsQQ2B1zxdggowJaEeb3j7GCEbmueBHBlZyDHxKiWhK
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 34 +++++++++++++++++----------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 32 ++++++++++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 17 deletions(-)

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
index bcaec86ac67a..7c2fdd1e7684 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -493,24 +493,17 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
-	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
 	gpu->ubwc_config.rgb565_predicator = 0;
-	/* Unknown, introduced with A650 family */
 	gpu->ubwc_config.uavflagprd_inv = 0;
-	/* Whether the minimum access length is 64 bits */
 	gpu->ubwc_config.min_acc_len = 0;
-	/* Entirely magic, per-GPU-gen value */
-	gpu->ubwc_config.ubwc_mode = 0;
-	/*
-	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
-	 * This should ideally use DRAM type detection.
-	 */
+	gpu->ubwc_config.ubwc_swizzle = 0x6;
+	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
-		gpu->ubwc_config.ubwc_mode = 1;
+		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
 	if (adreno_is_a618(gpu))
@@ -536,6 +529,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
+		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_7c3(gpu)) {
@@ -543,12 +537,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
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
 
@@ -564,21 +558,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
@@ -586,6 +585,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+
+	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
+		  adreno_gpu->ubwc_config.macrotile_mode);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e1c69bb022d6..6aca9a9e904d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -191,12 +191,42 @@ struct adreno_gpu {
 	const struct firmware *fw[ADRENO_FW_MAX];
 
 	struct {
+		/**
+		 * @rgb565_predicator: Unknown, introduced with A650 family,
+		 * related to UBWC mode/ver 4
+		 */
 		u32 rgb565_predicator;
+		/** @uavflagprd_inv: Unknown, introduced with A650 family */
 		u32 uavflagprd_inv;
+		/** @min_acc_len: Whether the minimum access length is 64 bits */
 		u32 min_acc_len;
-		u32 ubwc_mode;
+		/**
+		 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+		 *
+		 * UBWC 1.0 always enables all three levels.
+		 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+		 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+		 *
+		 * This is a bitmask where BIT(0) enables level 1, BIT(1)
+		 * controls level 2, and BIT(2) enables level 3.
+		 */
+		u32 ubwc_swizzle;
+		/**
+		 * @highest_bank_bit: Highest Bank Bit
+		 *
+		 * The Highest Bank Bit value represents the bit of the highest
+		 * DDR bank.  This should ideally use DRAM type detection.
+		 */
 		u32 highest_bank_bit;
 		u32 amsbc;
+		/**
+		 * @macrotile_mode: Macrotile Mode
+		 *
+		 * Whether to use 4-channel macrotiling mode or the newer
+		 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
+		 * 4-channel and 1 is 8-channel.
+		 */
+		u32 macrotile_mode;
 	} ubwc_config;
 
 	/*

-- 
2.31.1

