Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD919F1896
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB36510F106;
	Fri, 13 Dec 2024 22:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FxPSb/mI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0790A10F10E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:42 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3022c6155edso21095431fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128140; x=1734732940; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iLTQAtyScYm9lTcEQEHyFIdSvtVlHP7Xvdj3O1ACY4U=;
 b=FxPSb/mIZE5UY9OJOqoyjQKBjgfUS08ZCd8jvkvlgGaPI7meoZx5ey0lsgAxjOEG6s
 pDYmx4V2cSQxzRh/yibLusk6YcuJ8CyMV7eLL8uXdtsfpY/ZEw1FWK6WtG8gjYoY0r2U
 F68OjqG+lwGjMctmKv/NxiVRzmYztAyP+3K7DkZDMdE4fFdttdSxPvwEM/LSsex/ln8A
 OwLKieeh6xeQmnsLb7cr0BgR3rwjkKnlwEFzcfAc/nYrKPXvy0RGaN9bfx3QwcFgvcM0
 OJijOGUNoMVGrNxlC1Lfyre7/zh5P24YiQsUvHsw7armhb6whpoiuM3mzDeEx2GehX1i
 dfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128140; x=1734732940;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLTQAtyScYm9lTcEQEHyFIdSvtVlHP7Xvdj3O1ACY4U=;
 b=pY85Hh06nvTSrC3NLkllNG0n2X5m3yx+0AZtla78FGl4EF/z3TigKPgT6ULsiBk+qV
 JjXNZO1XfZ75NadAPyWsqWuJA0EH8J0p4oStcw2DD8A5HaZg5MfCC2iwVKnnfltV80bs
 UXZzPLP50VB1/yvcqqtk/HSuolKF19jI+U7V6eEl0bKiB+86z5uBh6shPcQy9tEi7mGe
 4fvogShDwG3i/ZsqxY+KS0PgC3UzjXfPHNbgyy1+1Wf+mw70P4ih9qns34UAfvjvw7vN
 r2/8jFP/Zsh/yK00sAfDPiCIgTE6wsHeuY/UUElTYLeVt8UQyVekMFRXRpuO3b9kSz+C
 ikDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkNvrSha4zxu1iy/a6v+JjzeG9xtnvMqHWcERFQXebX0sCGab1hJeDwZWJeflAEix11C4FtfvNsOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXys2OJsgN/33UOl8cy1xDHuKa9Xdk2SqcJ+0lPRJDA4gkxodK
 geQ9LdvnPQ0x7kVSUNhta/XOGSpl6XNEXiewJS0Ch79pMOZq2yW6RSOkkDZjFzcRJU+4LhO6Xjr
 IB87lWQ==
X-Gm-Gg: ASbGnctuw75PInjPMiEVUplwdGWBgd0HhHq1f8gpr27Y3ODPitKboA/ZfmPVcBKzoRL
 ZlS9BnDkygZ/0yjOE0UmTtYITMnIkwvmmAIHgjcmFxorLKPso5Nn9b1/JpwoJeSmFbtk3sMSjux
 wi9+4EA7O5wPq06k4JM8SE/J1CoEimx3eboJhGcqC8PVTbpot0Zq1nQ5ZcR3DqKGtyBJxr3SeXx
 utZr6DHyX936tDHhnjge5pgI4DxnDrWCZafssGnWGknPwPturb5Af4lqtne239p
X-Google-Smtp-Source: AGHT+IFcdnbaRwnw06KHXDrNDHefSXSslwZ6gIr92B7I01M2tDG8CS5kzToAHIMwe2uXJZg+G96CWg==
X-Received: by 2002:a05:651c:b0a:b0:300:324e:3504 with SMTP id
 38308e7fff4ca-302544b10famr14181241fa.27.1734128140349; 
 Fri, 13 Dec 2024 14:15:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:44 +0200
Subject: [PATCH 28/35] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-28-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HDBIFP7lmEfohLRdZta0STJnvjaOfr4EoK+lXYqD0Wg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHIlv4aya34bmsQu0LbX/0HpWJVj5ThCnma/
 1TdbRItCBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxyAAKCRCLPIo+Aiko
 1WRaB/4pnAW3brf4JPJfhdjbTwLCg9DaJSGmKWFZkYDkffxlD1HiJSQXH5b2BIkFDBL8nUF6KgT
 Dr4RTirbZ5jSmPLS4qcoHObGuQoSRQF6vvfeyW/oO2QfyJ308+xeA3MD+cN6BJrfcJ517EqhNeq
 nuJGK4aKZEO/+FaFkiiz4vVUjEFuzB9EVmJJudSEvWeFe6yXtQ/xn6+DBnG7VhfbYbIj/9DP3dK
 xBtkybDfFsG5yeHjWVJ88FyBbuFDtR+7S89dlqsbFE706/Dgt6TxFRWR9RO/7a0qXuKitTF28Ad
 o+PRJkzERJQpUIQAkBm3DSzqxbVdr1zkx4RtttWQStAXjCYZ
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

Continue migration to the MDSS-revision based checks and replace
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c23afdbad7b08abed2740e374be5bd89de206bf1..77187b6f5caa8c69498502d7b7e9c06b8d01fcb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 06d1a467921ad53828fc4613d09e4fd766d10339..e1039b731604ef49958ff158d36e0aef97258ca4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,7 +50,6 @@ enum {
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
  * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
- * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
  * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
  * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
@@ -68,7 +67,6 @@ enum {
 	DPU_SSPP_CSC_10BIT,
 	DPU_SSPP_CURSOR,
 	DPU_SSPP_QOS,
-	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
 	DPU_SSPP_SMART_DMA_V1,
 	DPU_SSPP_SMART_DMA_V2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 		return;
 
 	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
-			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      ctx->mdss_ver->core_major_ver >= 4,
 			      cfg);
 }
 
@@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
+
+	hw_pipe->mdss_ver = mdss_rev;
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -314,6 +314,8 @@ struct dpu_hw_sspp {
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* Ops */
 	struct dpu_hw_sspp_ops ops;
 };

-- 
2.39.5

