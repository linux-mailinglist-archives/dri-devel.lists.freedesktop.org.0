Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED36D116D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75210F053;
	Thu, 30 Mar 2023 21:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E45F10F07E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bi9so26359436lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWzlU9ks8RPLV5j79BK+jW6ADgv3xknZShaQq5C6Acw=;
 b=oxSSk7LSQ1p53syp3cF8g0g5MLtZXe5jISX43oJvXITYRD1gTG1TLGtFd45FDpjoCP
 3b6mDtilcaf79bjKUiOFrjeXCwmUe8Tie/MfuYka3fLm4/TGYmUkY+44nOaiXgJwjpg4
 TLrg3kF1dLXMzbPRgKkuDhk+VVQw4SVfPLqPC8ceXIx1TIWdJoWGq7huKFh5xpuIlrRC
 2d+fL/9pAencjZFZ1v+zIAdBM/jxAXRw2SjZBFvlEEaUESSH9uvPsYifETE/ByEQN5YW
 dLiGTNoxO6EtTPyj93Rg8/WVgRvnnQBrZlN2jHp6c6MmQPt6qE5NglOs+LaQWl9CNAnm
 iZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWzlU9ks8RPLV5j79BK+jW6ADgv3xknZShaQq5C6Acw=;
 b=lGMglc8ISN5le42B9rpJq2UAUygdqVDiQQgAxJPtz0zDXOzOkCn1phIEr+/URZlqNt
 LvOwCuUCW3Fm+mpkwxYX5Y9rQyg26Y9Ac+O3xNIx8jt3MxCX5xqyx8N6A9luT9RYhmVw
 cffCx7aw7NP4fax282z/raIi7Z6Mw9LE6yL1HpyD+bw5OGKqbLWEJMqELU1sHCn8W7Fu
 NxIpjEF0V3JGYTNpk1YdjttPjzwN9ObHClD69MHeUpU/vH06z6+oAStQ8oLx2lfjeLC5
 oxBVLjM5vpMDCpjiZyJwqoPNNerKoDwAIsFdMUSMWXAYbCuf2HDlnZmrC1ezN/sXQaHd
 nbeA==
X-Gm-Message-State: AAQBX9dVUBxJWunyNu+A6N+8RnzyIj0s9rCWorgVRSnDV/6IOE4zzxv7
 dSu3wrU80oCGytbEIuMCe6ctFA==
X-Google-Smtp-Source: AKy350b5OcxYGpH66a4HHlXiGE/4jigmZNFGZV0ianjbhz+AvatgiAb+B5tVtIfSHPnLFo3zlQCRfw==
X-Received: by 2002:ac2:53b0:0:b0:4e8:d733:fde6 with SMTP id
 j16-20020ac253b0000000b004e8d733fde6mr7702174lfh.60.1680213260680; 
 Thu, 30 Mar 2023 14:54:20 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 35/38] drm/msm/dpu: rename CTL_foo_MASK to contain major
 DPU version
Date: Fri, 31 Mar 2023 00:53:21 +0300
Message-Id: <20230330215324.1853304-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename CTL feature masks to contain base DPU
version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 10 +++++-----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |  2 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 +++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
 11 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 3f1931808c3f..6afabd251a9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -48,31 +48,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index eb008a05af37..cace399551cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -46,31 +46,31 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0xe4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0xe4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
+	.features = CTL_DPU_0_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
index c56affb97caa..a05f514bf8ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
@@ -42,37 +42,37 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a00, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 6b10ce93a986..629ca8d38d58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_5_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a00, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0691539603bf..5f7c8221f553 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -39,19 +39,19 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
index a89b27b9b167..a0168a66f31c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
@@ -21,7 +21,7 @@ static const struct dpu_ctl_cfg dpu_6_lm1_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 38cc0f5afd7b..36c6e4fd419a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x1e8,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x1e8,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x19000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 504f3c5ba3c8..6ba00cdbbf7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -38,25 +38,25 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
index 3cd3b274534f..c41b7875048a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -41,37 +41,37 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = CTL_DPU_7_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index a9f456ba0e4a..5e9ebda84348 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -48,37 +48,37 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.features = CTL_DPU_9_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x17000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
+	.features = CTL_DPU_9_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x18000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
+	.features = CTL_DPU_9_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x19000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
+	.features = CTL_DPU_9_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
 	.base = 0x1a000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
+	.features = CTL_DPU_9_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fa5d0ee5421d..0599652c6ff5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -80,14 +80,18 @@
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
-#define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | \
-	 BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-
-#define CTL_SM8550_MASK \
-	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
+#define CTL_DPU_0_MASK (0)
+
+#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | \
+			BIT(DPU_CTL_ACTIVE_CFG))
+
+#define CTL_DPU_7_MASK (CTL_DPU_5_MASK | \
+			BIT(DPU_CTL_FETCH_ACTIVE) | \
+			BIT(DPU_CTL_VM_CFG) | \
+			BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+
+#define CTL_DPU_9_MASK (CTL_DPU_7_MASK | \
+			BIT(DPU_CTL_HAS_LAYER_EXT4))
 
 #define MERGE_3D_SM8150_MASK (0)
 
-- 
2.39.2

