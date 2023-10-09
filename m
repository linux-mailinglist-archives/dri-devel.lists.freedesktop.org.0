Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83997BEF3E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 01:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34110E2FF;
	Mon,  9 Oct 2023 23:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FA110E302;
 Mon,  9 Oct 2023 23:34:10 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7740729ae12so334093385a.1; 
 Mon, 09 Oct 2023 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696894449; x=1697499249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+JUMQcq2TRrYs9jHHGo4kLjuJWPBeDyDY4G5q0uNc8=;
 b=O+leUAyZBMv1r3heQN8IDUekabVYiuhjsxDH0i8ZryHnSaFC8Mpj3Tjynl+21ULLQ0
 Uki3HgMLKMjRFPSnh9jQDBwRjfdlvuIW0VaYDsuY0jnRebiZPpHwfkYwuvhGjWW6+1Uw
 Pf1WDNntHcj3o80VrWrTSvHSpe5kFWqS9FqzGawoHvWAv9UY64PPy0SV5rpP1YT0mgDm
 2+dHlnpE92lPlN09ITPgg1LkHQkTHWAY5AbBi0OUbMwB76LKOwyGD1qlWZYp2eSwC1B3
 u64Oz9kkuLbCJ32QB4eHbbs9DQRmuwLbJa0rTh4+X20b59o/bEdWO0R2EwD9xsf8BR5u
 ZeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696894449; x=1697499249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+JUMQcq2TRrYs9jHHGo4kLjuJWPBeDyDY4G5q0uNc8=;
 b=lzj62vDvtSj9Jh+co/sQHQu6XaKQQSUjIL7XP0n116pNmsqfKiZ8ukNc1VBUe7jsFj
 GNLQxqcB6QqfCuQUDj4xpyJdrjib55yoR+Y1D0jgjbOYLiRQbmHW1xUMy+wS4lGkEPxA
 g4u3rUzdDvxmLURKwj+b3Dr/fbpvscavQhbRmITimt+un+hZf562mVRaBESVlzAKY386
 +8qJ0KZc7sok1ME1vnV3fqfD5zk9hoL9tABT9O7PT3pw2PqoA+7jlx/f3oY0vN3c7gNx
 KjoyidxpelhoCtRgqU6C4+C7Vas0Rqo8pTwFzp2q40CWw2c+qShrM/CpaYu8EaLGErs6
 QVng==
X-Gm-Message-State: AOJu0Yw/q5R4XXY9t9ahZHsISwqidBgXAKl9p+I6nFYFZvVgNGEvU5Km
 MjTzEKyz30DMrFGbmXeaB1o=
X-Google-Smtp-Source: AGHT+IFzlxTNp8nQaHsDFt4Vc3mGCXq7kB1mi7xkKv8eCpo3i7PLI7M++xE7cj/rxWsNyMW/lr9WfQ==
X-Received: by 2002:a0c:ca06:0:b0:650:dbc4:2283 with SMTP id
 c6-20020a0cca06000000b00650dbc42283mr19406977qvk.34.1696894449139; 
 Mon, 09 Oct 2023 16:34:09 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a0cb358000000b0065b0554ae78sm4216819qvf.100.2023.10.09.16.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 16:34:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
Date: Mon,  9 Oct 2023 19:33:43 -0400
Message-ID: <20231009233337.485054-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Snapdragon 670 uses similar clocks (with one frequency added) to the
Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
with configuration from the Pixel 3a downstream kernel.

Since revision 4.0 is SDM845, reuse some configuration from its catalog
entry.

Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 4 files changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
new file mode 100644
index 000000000000..cbbdaebe357e
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023, Richard Acayan. All rights reserved.
+ */
+
+#ifndef _DPU_4_1_SDM670_H
+#define _DPU_4_1_SDM670_H
+
+static const struct dpu_mdp_cfg sdm670_mdp = {
+	.name = "top_0",
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+		[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	},
+};
+
+static const struct dpu_sspp_cfg sdm670_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x1c8,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x1c8,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_1_3,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+		.clk_ctrl = DPU_CLK_CTRL_VIG0,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x1c8,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA0,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x1c8,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA1,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x1c8,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+		.clk_ctrl = DPU_CLK_CTRL_DMA2,
+	},
+};
+
+static const struct dpu_dsc_cfg sdm670_dsc[] = {
+	{
+		.name = "dsc_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x140,
+	}, {
+		.name = "dsc_1", .id = DSC_1,
+		.base = 0x80400, .len = 0x140,
+	},
+};
+
+static const struct dpu_mdss_version sdm670_mdss_ver = {
+	.core_major_ver = 4,
+	.core_minor_ver = 1,
+};
+
+const struct dpu_mdss_cfg dpu_sdm670_cfg = {
+	.mdss_ver = &sdm670_mdss_ver,
+	.caps = &sdm845_dpu_caps,
+	.mdp = &sdm670_mdp,
+	.ctl_count = ARRAY_SIZE(sdm845_ctl),
+	.ctl = sdm845_ctl,
+	.sspp_count = ARRAY_SIZE(sdm670_sspp),
+	.sspp = sdm670_sspp,
+	.mixer_count = ARRAY_SIZE(sdm845_lm),
+	.mixer = sdm845_lm,
+	.pingpong_count = ARRAY_SIZE(sdm845_pp),
+	.pingpong = sdm845_pp,
+	.dsc_count = ARRAY_SIZE(sdm670_dsc),
+	.dsc = sdm670_dsc,
+	.intf_count = ARRAY_SIZE(sdm845_intf),
+	.intf = sdm845_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sdm845_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index be461586b108..84c29de9ad81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -614,6 +614,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_3_0_msm8998.h"
 
 #include "catalog/dpu_4_0_sdm845.h"
+#include "catalog/dpu_4_1_sdm670.h"
 
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ba262b3f0bdc..f59aec03269a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -824,6 +824,7 @@ struct dpu_mdss_cfg {
 
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm845_cfg;
+extern const struct dpu_mdss_cfg dpu_sdm670_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8150_cfg;
 extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa6ba2cf4b84..0049fb1de1e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1362,6 +1362,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
+	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
-- 
2.42.0

