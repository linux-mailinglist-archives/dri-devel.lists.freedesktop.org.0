Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF76E6D6255
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB7510E6B1;
	Tue,  4 Apr 2023 13:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA25410E6B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:35 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h25so42322458lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjHnGHFGXszVZoYQSqWqnojD5jGbNBmyzMZZDEqNzeY=;
 b=KA2xhE2Skz11JR8bP87uNwCIkPDH9teMoKvTKkQ//yUJZ/7wFL3GubsCyxgZYazkYe
 FPaShoCdTMxrWfllofWOEOOlyv/gU25Mbr9ETcZd4aEDJqv1OoKLoWO/X23Sx5EJh4Ma
 25szl9SM3vp8NoXOtyiNV1lX2NeD7mt84m6kvcDz3EmCGvuRD24cj2nesi/hKO4TKWiZ
 jw7O5Zj0NQB0NKIlZ6SichhKqBnBISgbisWbAYYlonP9mZHmAFKTxuqzUD6LBvAoBXbn
 vI4MMPqXOJlXXsAP0O2Fjr+ulbqDdfP45K3RlWmPbnXxsovIDxiFqiaNbfTRBLfigNNq
 Mpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjHnGHFGXszVZoYQSqWqnojD5jGbNBmyzMZZDEqNzeY=;
 b=N7ScvaRl9DvOd5k0vcwqIkyssELGzb0vmKpzOZJ9rFfIO/EC+Fx0SwzKNPkYePsb44
 MqCNHK5bIXJ/CGmbTFWL7mSlbFcnw5iBJGMA22qZHVzMxWXBRuzOhcxLfD8uN+tOTB86
 +Y1twP8LXAbv/PubyznISGCZNuugLD3yn7CTo7imueH/CwOFF9Q9vUzVuybIs4mwpgEf
 byP5XIcrBfjye0yJNGo3VR93Fb7JFhkPl1dkvxO3ZIV6nNPWcGQ6Ui1hQz+JHt7j13UW
 VQIckHxnvTkEeg9zx/Sg7mjiAlS9oqCExpHTCeGGEbntwHpKL2XYB8yvG8RV83aWNhse
 dv8A==
X-Gm-Message-State: AAQBX9flxCBgHgazRILoVxDKkkxohU6DM8PEzKo5wJdRJvlY1Ukv5mnQ
 oErDSvUdg2Un+YLy6/RbOP80sQ==
X-Google-Smtp-Source: AKy350ZO4I5XZ3GSZIi+Sv2B+O9H0SzsFhZgvplUW37t5rb+qzVEpIevUE8wAE+Him0+DbadHsQMQQ==
X-Received: by 2002:ac2:51b6:0:b0:4e8:4489:6f06 with SMTP id
 f22-20020ac251b6000000b004e844896f06mr571607lfk.58.1680613773460; 
 Tue, 04 Apr 2023 06:09:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 37/42] drm/msm/dpu: rename CTL_foo_MASK to contain major
 DPU version
Date: Tue,  4 Apr 2023 16:06:17 +0300
Message-Id: <20230404130622.509628-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 +++---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  2 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  2 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 ++++----
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 +++++------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 +++++------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++--------
 14 files changed, 73 insertions(+), 69 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index a18ae2bb28ab..c09f3c2ac664 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -47,37 +47,37 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ccfca6e96f97..12d888414a0b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -46,37 +46,37 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
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
index 1b2131479649..f3181dddc3f5 100644
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
index b4cfec822ef2..a88dc2cb3d61 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 41df040a2198..33638421c935 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -37,7 +37,7 @@ static const struct dpu_ctl_cfg sm6115_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index c3f9127bb5fe..4d4dbaa506f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -34,7 +34,7 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.features = CTL_DPU_5_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 5d292783598e..8babc76f2462 100644
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
index b50d8a8f228d..030c2fdde471 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 1de294f8b706..95d3821ceaf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -47,37 +47,37 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index c4d7fae1acff..b3070cd84678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -47,37 +47,37 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
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
index d0527d3de515..1bd3f04bf251 100644
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

