Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4394A841
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 15:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3310E509;
	Wed,  7 Aug 2024 13:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhUB4StT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D983D10E4FF;
 Wed,  7 Aug 2024 13:05:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3685a5e7d3cso1045691f8f.1; 
 Wed, 07 Aug 2024 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723035913; x=1723640713; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
 b=NhUB4StTw4nyxcBoaKACDTq4riGQ9IpbyhvntUnvZapsP2BuivOFUPvcBDu+z16IOF
 +yskR1eBZDu8yI73ZC9bhgY6ecPIFElv36OEzSWMygVKUiafsUTXWdUhjYKUrMnfj4ki
 EeszkOHweJ5x6VJ913GO/4Vkuw+t5kpV16fFgoouC/vF6KZalLiRuDIC03N0qt2ANi3p
 62SFiC7K6bjY75nzcnbxFFcg+djrtrWryEa+VMGkbeuM/wKMiJDa/tF/qI3LR6tDy28r
 MuGI+u7UPxIGYfwbVliGOxapgGgohrjMlZ1WvTG22jh5p9UYVSCPGVUAFiMawQTMopiN
 VMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723035913; x=1723640713;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSNGG3GotjTBAlAnmapyQDldxvgMj+vGrJqRSjQ/FdI=;
 b=nFdbd0hMww3qNo2HXdYA2eNN78sEKPXphgun/xF3jeZ7Wv+o4kQL1cVzFhnfitkqwn
 rDbl+SdPQGUIg3L8fMBs9Xh7afgD/b3duw2jqOUYqhCk+lgkSVvvjTQVNv6O+4BwaVcO
 VR1ea9/oGyYTtnRc96ATv7RutGbmW2QvnOq7OwdyhU+NgHfQPt2IYRB967NfPTYAXasJ
 JhY/MJPeQFJn8kFklyFgkXce1cUZLzGL+kMLgrkNsFub8b+zLc3kJTtJGPt/D/JXKVLN
 90lMuGq0gOl3kAqNBgQCUYSu2zwF72YqncFQ2AlGoXWcN7nVXncQ1oZm4MS9cJvihOZT
 PMvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc4JA3K6UanY3UAHgwUa93NCm6Et1wcMeZUB5KKKb1KEfYRJ9H8SWGL4deN5/y2vOQbjVnFbZnh9VMrlCf8INZYw0ApLaZsCwAwd64r9GdJCA1FavLOqhRvKBNth288wzww/25Zd9s9eelK0fsywIz
X-Gm-Message-State: AOJu0YxHjSnhMJ92ksbPRQ5m+n7+aVT5Jq6xGRrzh75GrMLWMJ7VaA0F
 c/iUWr0CP2IZ934GOQAWt9P8OVQqMNWJq77U10/RmoutleBbl37p
X-Google-Smtp-Source: AGHT+IEVihQ/enbqo557pBdcDAromC8hvGH0wJJ3SOz3/ngZqBuYMGtcs3lfS/dXja46KX0ptKPeww==
X-Received: by 2002:adf:e411:0:b0:364:3ba5:c5af with SMTP id
 ffacd0b85a97d-36bbc1c34e2mr13190156f8f.61.1723035912901; 
 Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd05980csm16072849f8f.76.2024.08.07.06.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 06:05:12 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 14:04:57 +0100
Subject: [PATCH v3 2/4] drm/msm: Expand UBWC config setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-msm-tiling-config-v3-2-ef1bc26efb4c@gmail.com>
References: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
In-Reply-To: <20240807-msm-tiling-config-v3-0-ef1bc26efb4c@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723035909; l=6571;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YqSTQt5dLeLvGVR7Cw3NpcAP/JRh88mVQ19Mjdbd+so=;
 b=P5jyBp0Q0bjWVd0ij4ec8KGzM8lAUFGvkfsd5iNbP21FQ2K9NUgnhAWC4GQbUeHYC9+offb50
 ib0AzeLNfzTDTAAdfBktOVj2Z253hUGca9jDlTcjaHECi50pfa2DgFa
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

