Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE563939120
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 16:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC23C10E094;
	Mon, 22 Jul 2024 14:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PHhrso5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D6210E094;
 Mon, 22 Jul 2024 14:58:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4267300145eso37792855e9.3; 
 Mon, 22 Jul 2024 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721660314; x=1722265114; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvRXbc2W10YhzddPjznwtMvfAtM0HPxa93PdBpyxyzc=;
 b=PHhrso5VWDa3R9iJ/FMpdqBZ5X+IC2TNeNawuCIDXQ6LE6RhzYCMQIKqMF3rinmquI
 T6h3Lh9CVqH9EZG43XumNN2uJtRpfTdYLvuQNn6pqXKwehiPiRimKU10dJcImHlxH0tf
 Q5YvvyIzpLxxKnnfpi/rZPWamU03qdo6bKJ6OqL9iTLrTrXg6oK+Cvfu5i5CdJmJuaZF
 VQtycHKrDPlUnQIBeJfV35nsFK6BvVxrWoj8UcH+YJ9IMUi7IVXJLMBjV8iyjhGqbxT/
 l4uB+IhBAWNsjFiKRSeb8eHP1qCa06wt8Whshg2AvcNJNJnI3YnOijyMe84nxVoeSjQ+
 l2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721660314; x=1722265114;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvRXbc2W10YhzddPjznwtMvfAtM0HPxa93PdBpyxyzc=;
 b=NnzZ1CxmaQ4DgoICwIKoMttCi/HujSggfechMqgub2ed2xgLEFci525Mwb8dS3AUDU
 0yHYuc2rc3JFuVeGIkMvyfNcY2RUEH07DRgdXhTGyswuqqwXuDXaoa42s+WksWLO79mj
 POmHhb/JU7S+2C3YLwYiQai4L25sTcutH9TWcdYX3+gAhE/UDWTgAFlArCdgWKP5MhkO
 8o0Ei4U3JMs7Np0gpj3nq73scDWw8Y22pVBZf+ICPqSXbgWrdxzifY9cwe/Pz9qBWnOb
 RORPbF73z8+PGdni6PGfeA38wt6GxME25Qb8qNv5MsC3De0XT+pKdB6odirUIMvyddam
 LWwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1spuERJJ7IeTRUgOl4DBBTr7f2tEyqFIQdE/QHgOhsrOw0KzpOZJX5Z91oOyEc604HsT9NCWqhzwDXnA0FBjCPj9NJMwfBdjhBScOxIvDsEBWUsvre9ApvjjQsA0UUXyCD8qeWXR2MsW/45q/JAN6
X-Gm-Message-State: AOJu0YzV7aGyqaeJ+sefdoMIFtqORdmp77CJhEnb7oLA8MHVZ739uPhQ
 cxp3JMZpSaAgxkxX4MO4vMduU/O8hwiqqLSZ6+ZYOWtZiPGjFAmM
X-Google-Smtp-Source: AGHT+IHft4RH3hRBVeVQW93z8LFgj/ytRnObBn5Djt8fHS7MHN36oIbol7ITeI2yPPUhds6nwsPkUw==
X-Received: by 2002:a05:600c:470d:b0:426:5e8e:aa48 with SMTP id
 5b1f17b1804b1-427dc52910amr65865035e9.22.1721660313545; 
 Mon, 22 Jul 2024 07:58:33 -0700 (PDT)
Received: from [192.168.1.130] (51B6D03E.dsl.pool.telekom.hu. [81.182.208.62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa09bsm133294335e9.7.2024.07.22.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:58:32 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Mon, 22 Jul 2024 16:58:19 +0200
Subject: [PATCH v3] drm/msm/adreno: Add A306A support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240722-a306a-v3-1-cff90857c615@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIpznmYC/12NQQrCMBBFr1JmbSSZ1DS48h7iIibTdsC2kkhQS
 u9uWhDF5fvMezNDosiU4FjNEClz4mksoHcV+N6NHQkOhQEl1vKAVjgtjRO1JdXoButgPJTbe6S
 Wn1vnfCncc3pM8bVls1rX/0JWQgmpnTHB+WB9c+oGx7e9nwZYCxm/lkH5sXC1grblfyC6tr/Ws
 ixvN46h0tAAAAA=
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
X-Mailer: b4 0.14.0
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Changes in v3:
- Fix issues addressed by reviews.
- Rebase on latest next.
- Link to v2: https://lore.kernel.org/r/20240620-a306a-v2-1-0d388e1deebf@gmail.com

Changes in v2:
- Rebase on https://patchwork.freedesktop.org/series/127393/
- Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
---
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 0de8465b6cf0..2eb6c3e93748 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a3xx_gpu_init,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
+		.family = ADRENO_3XX,
+		.revn = 308,
+		.fw = {
+			[ADRENO_FW_PM4] = "a300_pm4.fw",
+			[ADRENO_FW_PFP] = "a300_pfp.fw",
+		},
+		.gmem = SZ_128K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a3xx_gpu_init,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
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
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..c3b7970c2bfa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -294,6 +294,12 @@ static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
 	return adreno_is_revn(gpu, 307);
 }
 
+static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
+{
+	/* a306a (marketing name is a308) */
+	return adreno_is_revn(gpu, 308);
+}
+
 static inline bool adreno_is_a320(const struct adreno_gpu *gpu)
 {
 	return adreno_is_revn(gpu, 320);

---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240528-a306a-48e173724d6c

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

