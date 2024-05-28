Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A88D24FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166CF10E168;
	Tue, 28 May 2024 19:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YbQlYsiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB0210F768;
 Tue, 28 May 2024 19:43:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42017f8de7aso9854475e9.1; 
 Tue, 28 May 2024 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716925417; x=1717530217; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gOgU5Pv9vLAMtMzfb5HowXi9zg9SbrF3W9s32WW+p8M=;
 b=YbQlYsiWZt11Ct6fexbZia3f5jm576FiJVE4E1FkYFE9am//wNSQ9brh/ib/HCpWEI
 RBFYxMko/ACtspAuCObyGDzzVuLc3WYSmAnG93clpvpcAgQSTiRItiwpR9BZkEPtyFjT
 64j/nEqse+bp4AzRJDe0KYQV3adVh/rWu0Yf7g5x2mIx4Q0308qkInR8eknjydAoXg0H
 al6YpoK7EyfmJXLDKugaxg8OqoJf0SL+2hCse52Dmgc8RQAVko5ip0im5o70fb0rPz/+
 vk1F7wQWIdBo1cFDYVutAaXjLUEw/N7+BBHuPIocCgfmF47m6E2FQXMHckWQEhIaPOiJ
 a90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716925417; x=1717530217;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOgU5Pv9vLAMtMzfb5HowXi9zg9SbrF3W9s32WW+p8M=;
 b=dR2r7ZECpfpjOOTDa6fIf3dy86EvFNSxwVSoJpF2y4Ans9P4jhv4saPkgqe2hR2TLa
 59yapdatdRUzDdaq70bQvtmx4AYKtyq3Dpp6AemAN/SvHGVdaoUVVO4iUNGmoJfazSKw
 GgXc1U/r/FZvIPX7/gVb0MDi52BqSENLo+21l1eNkcHEIuQgS7c0Zgb4SnqL/eMlOHB9
 QoPlrwJrzs51RM1l8f5Oixwg4ktY2iKwpzRxsOB+L1dtZ/tJE8PhuNTdShkVu50TJLJ2
 ccj7Vu4KuIq7AICiX+DIjcEGKkmX2DsjRWthg92uufdn7mvRQnB847ltddyin1GmnJLE
 40jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpRoQAlsvt20JVUfcEybaoFUM5DMC7NM8dgVtLzGfjA5GF+kCtHe5lCO8Yxl9EA+xiVotU8OE+mhKiezBe6+w9RpNZXZ6rBwgiFMDiFKtsdNCU5LWDH6u/iMvPswGlfCUQxcPyBvwYmpjRzLLeV6lx
X-Gm-Message-State: AOJu0YzEJyCmjaaS+bc7WNkfrSwrge4v0ZH/SBV2SD4TpbiRo69s+zVw
 vaBYguH/tawzVZF7dX0SafibmOJI6Uvn68PQv7opc5Yrva33a6ed
X-Google-Smtp-Source: AGHT+IGKbSgiilhOSBJxmKHEzGKuWzqlCk3N/VsqD/9S1jtOwU/1lBz6xW1FQ1871m5BxQiTTa4Fng==
X-Received: by 2002:a7b:ce18:0:b0:420:18e9:86d5 with SMTP id
 5b1f17b1804b1-421089f8242mr107646795e9.10.1716925416880; 
 Tue, 28 May 2024 12:43:36 -0700 (PDT)
Received: from [192.168.1.130] (BC249212.unconfigured.pool.telekom.hu.
 [188.36.146.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f134cesm183709915e9.18.2024.05.28.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 12:43:36 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 28 May 2024 21:43:30 +0200
Subject: [PATCH] drm/msm/adreno: Add A306A support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240528-a306a-v1-1-03a66dacd8c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOEzVmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUyML3URjA7NEXROLVENzY3MjkxSzZCWg2oKi1LTMCrA50bG1tQDHRkq
 pVwAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

From: Otto Pflüger <otto.pflueger@abscue.de>

Add support for Adreno 306A GPU what is found in MSM8917 SoC.
This GPU marketing name is Adreno 308.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
[use internal name of the GPU, reword the commit message]
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc849838..b46ff49f47cf 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -145,6 +145,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
 		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x0000000a);
+	} else if (adreno_is_a306a(adreno_gpu)) {
+		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000010);
+		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000010);
 	} else if (adreno_is_a320(adreno_gpu)) {
 		/* Set up 16 deep read/write request queues: */
 		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x10101010);
@@ -237,7 +241,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
 
 	/* Enable Clock gating: */
-	if (adreno_is_a305b(adreno_gpu) || adreno_is_a306(adreno_gpu))
+	if (adreno_is_a305b(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
 	else if (adreno_is_a320(adreno_gpu))
 		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
@@ -334,8 +340,10 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A3XX_CP_PFP_UCODE_DATA, ptr[i]);
 
 	/* CP ROQ queue sizes (bytes) - RB:16, ST:16, IB1:32, IB2:64 */
-	if (adreno_is_a305(adreno_gpu) || adreno_is_a306(adreno_gpu) ||
-			adreno_is_a320(adreno_gpu)) {
+	if (adreno_is_a305(adreno_gpu) ||
+	    adreno_is_a306(adreno_gpu) ||
+	    adreno_is_a306a(adreno_gpu) ||
+	    adreno_is_a320(adreno_gpu)) {
 		gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS,
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
 				AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..198b2b5b67fb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -86,6 +86,17 @@ static const struct adreno_info gpulist[] = {
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
+		.family = ADRENO_3XX,
+		.revn  = 308,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem  = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a3xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..2645f6f4ad83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -268,6 +268,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 307);
 }
 
+static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
+{
+	/* a306a marketing name is a308 */
+	return adreno_is_revn(gpu, 308);
+}
+
 static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);

---
base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
change-id: 20240528-a306a-48e173724d6c

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

