Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36536D622F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553F410E6A9;
	Tue,  4 Apr 2023 13:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFD610E6A6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:23 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bx10so15434657ljb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uOl0j0yVJTK0EO6FSNMdqRAG1vOcMrWWtGv1m7YFSI=;
 b=vIDo6hrp0SsxqRH6Uv1juxRiWj9HpUqcTxUDOuZifv5/4IuOJzd3ENqjaArKL/b6C7
 9SV+9TY9xlFkMLqS+vyL6xbDHrsN0/cqm600ZCDEC25soKgBD0XJxLnjUH6ARspLBh32
 AbY5r/C2RqpAc8/xekQNTrQnh61NQi3MH9M40wCd0C3DSMkTlu1yXjZ3Y4UywEu/7Gza
 ry30Y+uzL1TylrxsJI6ndpYRDnaH/rtmJI3LT/Otbi0D3wYZjo6bdjnHnV3hi+X424fu
 uRZJExIiZk6qxBZBmJxwFlxKAzqbWhyG+DVxMS84Is5KuJ6VL7sk0DvZqKkaUsEWVswY
 lpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uOl0j0yVJTK0EO6FSNMdqRAG1vOcMrWWtGv1m7YFSI=;
 b=1mX73c5NdP95YStUBcGYj2J/tl0KO1O/nHf1uXRcnsbEVN1UNJcgdIwZx33hNLhnzQ
 Z2X5Z5vesuSOygYzbanHf5IfukEtiqfpVhT43vVg85iCz7yYynfiQB+o5kwaEVqIrJk9
 tllY/Z57HUqMU4YajF7aKA1x61qchlYg8ePLSn3Cvbipx/kcUZ6s0nZ4MHtQTFBhXHKF
 LWkMZoVeaRex8sM+7ZajRSEa1wOEyJ7V5S2rtb7FbHRniEJ7v+rfwYHKjFhMSrIntx5Z
 CL5jTT/jzaUMtulvBAYlse0QhpPs/HExLP2Ymhbz3IwF6W5vdU5EMw8kkpRQ6Ao9z2N+
 L3dg==
X-Gm-Message-State: AAQBX9eZ6/1D4J/gy0hNWM/Mfjqdzr0MvBlyJLKirXlQpob1ZAD1kcl/
 h94LV1fdegDJO6EZH2p6uHaP9g==
X-Google-Smtp-Source: AKy350aVLgQ/q/7zADbN+1dfDFphXTrml+T8MOtnOJWXESjkSrcHni1WiHw6M+WSOSCBnP2SsjkKGg==
X-Received: by 2002:a2e:9251:0:b0:299:a7c7:d4ce with SMTP id
 v17-20020a2e9251000000b00299a7c7d4cemr526455ljg.21.1680613762977; 
 Tue, 04 Apr 2023 06:09:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 28/42] drm/msm/dpu: expand sm8550 catalog
Date: Tue,  4 Apr 2023 16:06:08 +0300
Message-Id: <20230404130622.509628-29-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicate sm8450 catalog entries to sm8550 to remove dependencies
between DPU instances.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 95bb8dbdecc3..c7247a5739f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -172,6 +172,36 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x37000, 0x280, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
+static const struct dpu_perf_cfg sm8550_perf_data = {
+	.max_bw_low = 13600000,
+	.max_bw_high = 18200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	/* FIXME: lut tables */
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
 static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.caps = &sm8550_dpu_caps,
 	.ubwc = &sm8550_ubwc_cfg,
@@ -195,7 +225,7 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
 	.dma_cfg = &sm8450_regdma,
-	.perf = &sm8450_perf_data,
+	.perf = &sm8550_perf_data,
 	.mdss_irqs = IRQ_SM8450_MASK,
 };
 
-- 
2.39.2

