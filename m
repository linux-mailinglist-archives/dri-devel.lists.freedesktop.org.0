Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4C751361
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458010E5F1;
	Wed, 12 Jul 2023 22:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB510E5E7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:48 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b7430a07b7so4930651fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199907; x=1689804707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEVSbE1/ce06xrGzvQ/IXrEdLz2Ykt/bguR+64ZLVSg=;
 b=Xc+qMmKEncGdAxd3ZS8oNpmWu9cSED0Dofo6zdEPGszPXndlFsYJ+YFPLwaCVbx+0w
 nP6yQ0E18ICbkK+iYdkQb2EwHRrYo9NpPLPukU+ZBLAlTak3j9Frp1dshPEwY31D5yeH
 vfGqJSd0jH1DS/4JAK/wbH/g+Z23a5D6177VJCotiX96oY/UaRih/78TBFJuAsPpZAHT
 TmVLKC+tBRBMCiFKzH+yhz8pScFbPAw5TB2821tjcOGux4c1efQc0iXjuy39QlR5mTkL
 6D+jFGzAQq2Jr8/X5f4HyJQiFod5DXUeZyLvB2FoODzjI6bh2HsqprmwcdY+jCZPIQVs
 N9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199907; x=1689804707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oEVSbE1/ce06xrGzvQ/IXrEdLz2Ykt/bguR+64ZLVSg=;
 b=aD5Iy8FN10/0IPsd7ZjeU+Z4trUy0a39QP6/WYPrIn28Bo6tG7uqCBZlsPd8fFPua2
 qiTHSgEjYcKnXKtaT7wPSE6/kVwactgpCPEOKWpUKr3ZvvDlODUZYJiMu7fQiotTz3QE
 fjKaytThDkviCoq/98gWsuMrAD4uHvFplMQ39aFUvVOJF+QR7mPC5twOqkKSUnBYxVBQ
 0fZhnS6T87iHF4B95VAov2l1be9kZdLyJlVcWBoxwiSN8hK+UElO/AeJ7JMhfWnMazDA
 6b8TA2GPuLrdb8/2o5QaC7NLwoeM2QUuIjQQSlNskWNb9+0VbBpukJgvmXxE8zV7j3g2
 kj+g==
X-Gm-Message-State: ABy/qLZVpcKoVy0W0+A+jxfyuIY0zfi5IeucvE+hQdnRb+Nq7LGY2Q24
 nzj8m6r18rcGEWeM/9mcES0wNg==
X-Google-Smtp-Source: APBJJlH2fxRPQvztM/SBnX9UCMBin6bn/eO/hso7htdhdIEtvBTybNNpfsE+ckKxDB7hI1U0ma239A==
X-Received: by 2002:a05:6512:3b3:b0:4f9:571d:c50e with SMTP id
 v19-20020a05651203b300b004f9571dc50emr15810950lfp.36.1689199906917; 
 Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 08/11] drm/msm/dpu: remove unused fields from struct
 dpu_core_perf
Date: Thu, 13 Jul 2023 01:11:36 +0300
Message-Id: <20230712221139.313729-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
are not used by the code.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 27a0312bd140..d8c88ce5190d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -497,15 +497,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 	perf->max_core_clk_rate = 0;
 	perf->core_clk = NULL;
-	perf->dev = NULL;
 }
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk)
 {
-	perf->dev = dev;
 	perf->perf_cfg = perf_cfg;
 	perf->core_clk = core_clk;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index f4b84e67138c..e718d523ff30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -36,8 +36,6 @@ struct dpu_core_perf_tune {
 
 /**
  * struct dpu_core_perf - definition of core performance context
- * @dev: Pointer to drm device
- * @debugfs_root: top level debug folder
  * @perf_cfg: Platform-specific performance configuration
  * @core_clk: Pointer to the core clock
  * @core_clk_rate: current core clock rate
@@ -49,8 +47,6 @@ struct dpu_core_perf_tune {
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
 struct dpu_core_perf {
-	struct drm_device *dev;
-	struct dentry *debugfs_root;
 	const struct dpu_perf_cfg *perf_cfg;
 	struct clk *core_clk;
 	u64 core_clk_rate;
@@ -95,12 +91,10 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
 /**
  * dpu_core_perf_init - initialize the given core performance context
  * @perf: Pointer to core performance context
- * @dev: Pointer to drm device
  * @perf_cfg: Pointer to platform performance configuration
  * @core_clk: pointer to core clock
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
-		struct drm_device *dev,
 		const struct dpu_perf_cfg *perf_cfg,
 		struct clk *core_clk);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 074c032cd24e..80e08302680c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1156,7 +1156,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
+	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
 			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-- 
2.39.2

