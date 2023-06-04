Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA57219DE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1B10E17A;
	Sun,  4 Jun 2023 20:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA2610E0FD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so492956e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910944; x=1688502944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oC2cf55pxdTu1cBstvSIihrZqjovC5iTu1ePkZVoJI=;
 b=PHaXjRhnEDDHJgPtfPLdPqBjurkpnhS4OaO27tRLplVevhhAMWC7UCvIhhUq9YpBkw
 2XeWGLeqyaG6XzmQJ8PkeCgKw1Ujmz/dvT3VT9y6wEzo0oJCV+6oqPBo08xIOd4hxFBJ
 M8pfZv8GN3ZIWctjHaein8XYpEApO7kywKkzoMy1wH+4DAnVGXG4nHH8WMvHJST87whF
 5Nt+K8ZqRcO812/I/3WMQT9nuRSExMd6HR3XCsUsr0MQvD00R9HJunXRwMn+buggMaI6
 gpNJqMpw7hnITFLq6G9mCk6Yz5+NDN7YcvWSKfVKOnrV3Azsnd5QS+GDqeVubgx7Oq6j
 qxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910944; x=1688502944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oC2cf55pxdTu1cBstvSIihrZqjovC5iTu1ePkZVoJI=;
 b=WNHL7xqQHFTS6rmg3aweQLaggLSBPnpDri6yEEisjJvDc12AOXpFw3E2MtSwO1QrXJ
 kAVzZCybDZNsYB7d/S9EZ7wfE4wSSOBjwy4jRRhZkZ/C3rJ3K1rsuX75Trrp2GoILEyX
 InmQXg+1QJtqI5v8P31wno65sPXANRJhPAo3hKCh9qwtst+gEmk/0kk9qr5gJUimmK5n
 issW+LTJY81C7+PXXVVAf+6gcxOgTjy/ZqGK/dBBNStOCECVUfw/5Cnz0j1IT+/Dx/nW
 T+OddsPjJ4tuEIO5Yx7jhVFLYfk+S6ZVgNAbPCzvfsebPb5eb2PHfzGGDeEWS4QsGRBT
 p/zQ==
X-Gm-Message-State: AC+VfDxHCq2NK6XZlpK+sr2kVJkKT8EwYs7Mh25A9HhinJ/D7aVhVM8n
 2KcG5SXER0t2L3wDOTCDirz4nA==
X-Google-Smtp-Source: ACHHUZ6qUS9ZImgEHClaVBmgvKFZDhJLGq8Jag26OxNsJ5hZ6nfOFv17QsPPBqjfGCbVmJiJ02RNNw==
X-Received: by 2002:ac2:4a7c:0:b0:4f2:74d3:8996 with SMTP id
 q28-20020ac24a7c000000b004f274d38996mr3690178lfp.8.1685910944376; 
 Sun, 04 Jun 2023 13:35:44 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 10/22] drm/msm/dpu: correct indentation for CTL definitions
Date: Sun,  4 Jun 2023 23:35:20 +0300
Message-Id: <20230604203532.1094249-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

Shift dpu_ctl_cfg contents to correct the indentation of CTL blocks.
This is done in preparation to expanding the rest of hardware block
defines, so that all blocks have similar indentation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 34 ++++++-------
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 34 ++++++-------
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 24 +++++-----
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  8 ++--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  8 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 32 ++++++-------
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 48 +++++++++----------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 48 +++++++++----------
 13 files changed, 238 insertions(+), 238 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 8d8a38e10052..cc86ceeb1e63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -46,31 +46,31 @@ static const struct dpu_mdp_cfg msm8998_mdp = {
 
 static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x94,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x94,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x94,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0x94,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0x94,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x94,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 7db137e1f782..766403215ff2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -44,31 +44,31 @@ static const struct dpu_mdp_cfg sdm845_mdp = {
 
 static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0xe4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0xe4,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0xe4,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0xe4,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0xe4,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0xe4,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0xe4,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0xe4,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0xe4,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0xe4,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index f9a179f0c623..df49bd96590c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -45,40 +45,40 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a00, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a00, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 5c1ab849e04c..c0a9c8428f7d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -44,40 +44,40 @@ static const struct dpu_mdp_cfg sc8180x_mdp = {
 
 static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a00, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a00, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index eecaabe78927..1d831645cac4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -46,40 +46,40 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x1600, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x1600, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x1800, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x1800, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a00, .len = 0x1e0,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a00, .len = 0x1e0,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 6b9d9230a884..ce8b8fbbd72d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -37,22 +37,22 @@ static const struct dpu_mdp_cfg sc7180_mdp = {
 
 static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1dc,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x1200, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x1200, .len = 0x1dc,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x1400, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x1400, .len = 0x1dc,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 0612b008bb66..8821a3c89064 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -35,10 +35,10 @@ static const struct dpu_mdp_cfg sm6115_mdp = {
 
 static const struct dpu_ctl_cfg sm6115_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1dc,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 0c77643ae8dd..bbc6ea7fcb23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -32,10 +32,10 @@ static const struct dpu_mdp_cfg qcm2290_mdp = {
 
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x1000, .len = 0x1dc,
-	.features = BIT(DPU_CTL_ACTIVE_CFG),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x1000, .len = 0x1dc,
+		.features = BIT(DPU_CTL_ACTIVE_CFG),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 69abeba28a53..f7c1f6803def 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -44,40 +44,40 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x1e8,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1e8,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1e8,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1e8,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 257997cf04b0..bf7590f3a657 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -37,28 +37,28 @@ static const struct dpu_mdp_cfg sc7280_mdp = {
 
 static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1e8,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1e8,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index d7f0c21533ba..7ec6266651cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -45,40 +45,40 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index f654fe44172e..5e8ee19842e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -45,40 +45,40 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x204,
-	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x204,
+		.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x204,
+		.features = CTL_SC7280_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 1151ada8106b..e1d8259185bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -46,40 +46,40 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 /* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
-	.name = "ctl_0", .id = CTL_0,
-	.base = 0x15000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x290,
+		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x290,
-	.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x290,
+		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
-	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
-	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
-	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x290,
-	.features = CTL_SM8550_MASK,
-	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
 
-- 
2.39.2

