Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C717682E7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 02:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AEC10E241;
	Sun, 30 Jul 2023 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1936C10E232
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:24 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso50020641fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677322; x=1691282122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
 b=i1b/4elKekiFdllyB7yaCQosxADFk946gBfbH8whkJpNXH5nzwlYkAgHuw2viRxn/N
 vu8AkBAxS0l02DfmHkAIc2Pxe4NBuOkENZ7CB1cI0KIRlWWgysBc1h6+u5T/RpN2WXWP
 RO0VyCoxlcWrSV9pnSiK1zGiLLI9O6Sn6FqUbjP6AHJwHZ9u3jmy9OfBCrFl9V92J9A5
 26HzIP9qWVGYg2f2xPXwXeXvKZc7nCK88NJU+Ppy9trJbfN/ZmgF1GoeGApykBozyt1Z
 CiM40srzlpm578yMgc7clOjlWL7bN/cfWYs9FHEqmivGnJbtW5hlGz+JNE/2HO38lNON
 57IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677322; x=1691282122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
 b=CR7M0euuEgo6CEyOG5T+jSZQV1kl5tjUQr8HKrPtAogJ7xz8j9cG0C5OjqEGjo6jL/
 ph09d+wx19JygQAmVxSrSf3Dtb2N53qYxJIxI23o0aQjMC84RG4oE6fh9D9AJzyu630Q
 43udyAk7xvWfJi9D7ImTgI2sEqwS1mrjACyiy0ut83MJeVsAUjqqkO8l6IHMRfM5NmKP
 x4SKs1OOkq7ai9C4Dp9mrzCmfcXw2LQwvS62I7YKSiyrc3pCg9loOD9MUvo5STEdSVAf
 CNm7u1iqH9ffkVbeISslKmOSbQ5Gy05dDE9ISZn/sLQpk4ux04Og7RBGX6P+Un4GV4BF
 ss2w==
X-Gm-Message-State: ABy/qLagyk5L2aIpKI1Q3e16aBDhbpondt1+TGQUt3WAgs/CW+kHMlID
 aQXYuCGk/EndfF6OIQ73VkBrTw==
X-Google-Smtp-Source: APBJJlEam35F/ytgrDAXFDexoo3mbj9BefEnZ6vWczKxROs1tw7pyLmJJYPr8cEvagNUEPisfr6wzQ==
X-Received: by 2002:a2e:b0d1:0:b0:2b9:acad:b4b2 with SMTP id
 g17-20020a2eb0d1000000b002b9acadb4b2mr4143778ljl.6.1690677322455; 
 Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
Date: Sun, 30 Jul 2023 03:35:13 +0300
Message-Id: <20230730003518.349197-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..c19dc70d4456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 945b88c5ab58..a6f8eee58b92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -145,8 +144,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

