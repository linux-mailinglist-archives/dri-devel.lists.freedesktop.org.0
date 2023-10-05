Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130C7BABFC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122610E497;
	Thu,  5 Oct 2023 21:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692E10E42C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50307759b65so1863357e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541225; x=1697146025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
 b=PKyXAbB+blK4nGZvqsuGgP0VeMD9OibgATAzx77gsDcLjqg4ZaE9ME6+/Gtw1GcAgt
 rivoXFFFKtR8kJIGr8W17GSGowEKnij6qmSyzRKvO7BD0JAPrbh9slsRdulRIbHijpln
 YhyqPoC42/OHoVR2njNl+hw/9vTOeMZPUytWvzXbJzdmu7fHwUN2CVf03SViLpYcudco
 cvuhSqnRmLEXjUBqSkDxTE5msNpuugnSs1FE/eZAYDm//tFoFUbtZpvuJigWG9ZS9vaq
 9hxETwjAIoVoGd3c5QtNxLNpN+bXAcDonayx7C7tYNmZRJDhyY27lC/jEoBEEOBjynEv
 xLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541225; x=1697146025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+EjvI1wyeZrkzbT5judqb3tmkNP0yx0O7nDncad6txg=;
 b=LbQq1ws0et4Bw0NB1gwKhs8/j6mLhVgJdAlt8nTOJuP6T/Gz5x0WKSYEeSpiBOQV2R
 W6uBWJPEpjkmsvF7WUN9OGxbJvUavLaPbwHDKxEM7//boD4LQTRxAWlHsJEgx+/0AOhQ
 IvQvzvKLuxJqRKTaj0ZRYXFra1IceGosTp8ZakHhTG3qjio3A0bl9Zj6Fm5zSK+YyfP+
 1bwdNvjlqMlJNOVf2Z0Qm6Rzfqvi6GeHcP6D4h767vTSWlApQdrxH6LgkVw075BH28e9
 riiAUAaAvb+g98Wm6470lpFxtaNk1Mhv2Hk2q/z5dBVWgSBdHDKUty/SIYTSGBkcxmfv
 1Wjw==
X-Gm-Message-State: AOJu0YxZLYdTffv7z+uvJg36rCi87/SSl3Cb7dPDA805MwJ7cWfhslOE
 sF/iYKtuvobsK61AMeC0KW2JFA==
X-Google-Smtp-Source: AGHT+IEXFUd2LvvPL3+hSLdVurC0OHcVBywiEdXDCTuRZm/9W2UL7bqMZ/NkRKvWrX/Z+k0gm+4XWA==
X-Received: by 2002:a19:6543:0:b0:4fe:95e:159a with SMTP id
 c3-20020a196543000000b004fe095e159amr4473674lfj.23.1696541225467; 
 Thu, 05 Oct 2023 14:27:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 02/10] drm/msm/dpu: Drop unused get_scaler_ver callback
 from SSPP
Date: Fri,  6 Oct 2023 00:26:55 +0300
Message-Id: <20231005212703.2400237-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marijn Suijten <marijn.suijten@somainline.org>

This pointer callback is never used and should be removed.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[DB: dropped the helpers completely, which are unused now]
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 13 +------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ---
 4 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..7e9c87088e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -394,15 +394,6 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 			format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
-{
-	if (!ctx)
-		return 0;
-
-	return dpu_hw_get_scaler3_ver(&ctx->hw,
-				      ctx->cap->sblk->scaler_blk.base);
-}
-
 /*
  * dpu_hw_sspp_setup_rects()
  */
@@ -605,10 +596,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
-		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
-	}
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..ca02f86c94ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -288,12 +288,6 @@ struct dpu_hw_sspp_ops {
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format);
 
-	/**
-	 * get_scaler_ver - get scaler h/w version
-	 * @ctx: Pointer to pipe context
-	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
-
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..af4fb54f3c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -381,12 +381,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_OP_MODE + scaler_offset, op_mode);
 }
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-			u32 scaler_offset)
-{
-	return DPU_REG_READ(c, QSEED3_HW_VERSION + scaler_offset);
-}
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..689d06c7d740 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -340,9 +340,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		u32 scaler_offset, u32 scaler_version,
 		const struct dpu_format *format);
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-		u32 scaler_offset);
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
-- 
2.39.2

