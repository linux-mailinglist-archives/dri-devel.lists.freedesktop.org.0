Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313289F1888
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EBB10F10A;
	Fri, 13 Dec 2024 22:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KL3mGxxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2C510F106
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso25599141fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128128; x=1734732928; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=chVhsad0nyWoDCjTbYyZx4KJLlPYPuHtPpH/BD0TAQQ=;
 b=KL3mGxxWJivoyPSTCYnHUFce2/0z/WSKLaGO5lwBWN0cwKlwS8gBsINcNs1MOI5+JI
 9s2Jeqh/N2k+gtE0ry+KnGNcYxf6O8DwWJ+kV0koNjFq8GSuXnwlyG2ELgNL8TAbp9fx
 X2lz6hC+exfs40abaEi44iRLNcknr6zAMo5gCJJCCJ4LPxvOTYFDtCp0FPDwpuuZQ6u6
 /NPzSIkcyVx7gUO6NKggX2TBEvuGLc/60iWzOiYZXd39bsGhsKr7wMApRu6i8ZQSTrvn
 PxQ8a/KUhtHpY/k3qgRSyYthllNO1GXJteNLyknFoTPN47RM3kARDV/h/Bn1dlu3BQr5
 Fbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128128; x=1734732928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=chVhsad0nyWoDCjTbYyZx4KJLlPYPuHtPpH/BD0TAQQ=;
 b=b/8v1c7LaW9uE3+sY3B24dhh2euimaCnPN5U9JljQgY818HYIM3C8dX2wfjHLEtb9z
 3twK2AxnhhEjQ/NcmAD8c9c/J1LoAjOAuttaiKprWyRjT3GnrpPe3UB6ONYgWR5hi461
 3FfHwPBN38L1NN+7TEDXUqjTiV7WtIAM15Za5XQWKsRk718ThjAewko7ZDjccfhricPK
 RFUdi0g0/TPD0/VlYkJkgAdAREu29qNbVqSTS6BlaDChYnydjPW3P249Djteyzee5+V/
 iXEe3ix1vWUveORQkY7XpCIxUwU3ckPzY+gLuABW982jaHdzXjX84Dy38zJ0GZnzwILi
 sEDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnEwCY4yBKa0LmWw22HkC+s/WvEM9A8JG5hIelJlwJh4Ce3hiHX0DWJS+pivPOWkEwkX7aqXWhbqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDAJcbVr6Z98UFBTw7RpZ+4ZX8ix7tckG2gvHimrocLSHl7mDG
 VLCcddo7qt5h34KqUUjEhRRv3zj6ObCpI1nAKEHrBVUF413UGPeqi+f5TMJ/ADg=
X-Gm-Gg: ASbGncsks2UWAsNVcji+SBKxFZzfil9fcwZqe4QjVrISRiwMXo/p6OtDZ1k7qaNlaFg
 hNT2skDNJVgWi/SIKGyH8/omvHC8nQJhj+tCOa8Wm6M58uAoWEVdfiQvO8Z/U2a/PmRxsBfEMbL
 N+dsLstt03e4xIWPotQx8RaDunIyQcgoWdONjkY62DfMualWoywW4cdJ/akrIAIQA6a+hBBc4rO
 7Mt8QIMKl96BeD6G3765KuKFYJTY6AfuyHpWE/EsXUrN+JNZyWfiBPmCiOcqtB5
X-Google-Smtp-Source: AGHT+IEPslOEXU1HExpx66RH9HFq1jjWfgiGfuKg/3qgcHoCTgG9FaEIZ5VSFqt2rANmbQbXPzVkxQ==
X-Received: by 2002:a05:6512:2342:b0:540:353a:df90 with SMTP id
 2adb3069b0e04-540916d73eemr1400742e87.43.1734128127943; 
 Fri, 13 Dec 2024 14:15:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:38 +0200
Subject: [PATCH 22/35] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-22-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oI4Xmovs4LivMfNkpbUHThe5kQZb5G9zfJ7jDno5uJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHHJ+i5CvqHnELCVIKy+3smmzEbJz8tTAX5j
 6L7XTPoCqmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxwAKCRCLPIo+Aiko
 1WX1B/4uChS9rMYZOUUOZ0TcABKFH6w3S4l7MldTzoYy2PSOqHSlToi1ehzHpzQ8jsfKozoii3D
 P7oaBe8DyMMU7ODRy29SPKJqfMU0/dLTNzFNv0xMOSRj7rDeqw1HWd1wLaGGtOqYGFg4bgXmqJ0
 57469/48Kyogw7/AbSDwaZIJsTZQAvYZprudOdG8wbymPvpMxiSeNB7zdeHpYR2DHjVB6A4lvwU
 4Z0zSTKSw3wqMhmgHhDEtCY1dPxo5eF2jAIVpSxtff0yJkmmjYp4iFoB5ovrneRVufBNQJvx0El
 pkoPtWUJq5tukt0bE97bD7T7sEAhUTT4PTJ1b2AwxhkTeT57
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
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 439c6c502d3a1d5279881f2c9798a20cda8fb428..946308eb7a88c1604b152ff98cb27b1766a76718 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..a5b6e6610a34d6f744a6662b877588fa2e6fde7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 246f42727c842e7f6a718af5afa4afaf52b5a6a6..d5e608402082cfc3cde8d156acdc85ee366af685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 8ab534493607339673a037c02445eaf567de0a81..e3ea28c653328cf926a18426d12f07821c413b30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a8d4837691fadcc34dbd6cd0d2c2f2fd6d19cb19..a30b8906091d3ae72f2f9cdfc558942cab0a713f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8d03b33dc707497e5756d8632f267e925aeeea3a..c9d8caa2733ba701fe05c9b350b4a1468a573d9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

