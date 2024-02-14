Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032B8554BB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668110E3A5;
	Wed, 14 Feb 2024 21:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X/6TAgRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3516A10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 21:24:56 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so2268341fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707945894; x=1708550694; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mXXcyuPilQ9nXPlOaKhEVr0yZRCsEUndDUsEgWHiPIw=;
 b=X/6TAgRKdqKcsJizhShQj1svQQxcd3ObATD7nFgVUCOJuBdWD3RBxhAvlzlymsNdww
 XBb9bqxQzbE/6+zgLVLzNrYwpnylbChEyYExr/wsXDtPgBavk03f3rr1GSN/EyBvyae+
 G3ISNUnz3BiE1HUwEe+bewgAiifgaw4mF87RDNdFnR82+mSQQrWzWwAOL/ztetSVCZcl
 yb9HVuemYGxSoPI4hQquqIvpl2RqAHPMVThN3Sh0Y01/cQYF/YBa6dIu7WCaksb1hBkI
 dHdpg193/4cHSnI6HVOZDp4Pcv3ztqpaCAdIPH9myz7a7D9WOMStsZXnm79uF0l4umQS
 T9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707945894; x=1708550694;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXXcyuPilQ9nXPlOaKhEVr0yZRCsEUndDUsEgWHiPIw=;
 b=IQVsyz6N+yPvL8874dshp2c/GkYuzF002s7Lms4WxCgcwC/WO5cmqtncuLm/4rpkV7
 wAqhtg09kTuGPOBdyIJZokI1Vo/FWHmZjbSE5DyCRgPx7Tu+E+fMkmAmaL2EClcRYh9z
 SpaQBETjUSgz0uZaOCysLWYldKxsRUCHlcuOLFcJF7pqXaSNvAZmBR80Uz/XNsFVmDpx
 0Dk3ewkoOJCfDaD+oQamJLATxdUjhvFStYOg0Y7UghKkd/PE82veiWjjj25p/iSPIA3+
 Q/+CO9+mkS1Q74XMiwk/cDWBsd5//2qGAeSkWRT1okf8vQJe8BM7EppwyudA6VrGcc//
 H3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9c0FNDkzv2n4XxQYBWlLAGIsKvYlwVXLBXWdLrb6nY1AHzJ9kvGscbBL+09i+zBD+S6oENoRol/WyqShxQZe5GSqNSU2WC6gto8gJAEIQ
X-Gm-Message-State: AOJu0YxOrExNrwwetPm5CWagil5yjcEuw2k7w+jIp2p7M92DyxxgEssr
 1cnc2FlXpb7+pHsGiYXpcgn2of/oWrCVfUe+zpyqs4MbxpkWcA/yPKzXQfjt7g0=
X-Google-Smtp-Source: AGHT+IED3YYZ0koTOIJaFk2NRIdRWxg0Y6AU5ocZwJ9LDuXiPgOu+MfHAtYYQqCEmMS+FPmsxPfTMA==
X-Received: by 2002:a05:651c:608:b0:2d1:1cc2:b6b0 with SMTP id
 k8-20020a05651c060800b002d11cc2b6b0mr1544082lje.17.1707945894309; 
 Wed, 14 Feb 2024 13:24:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWz+mM8L9u2B8EJli6CEXObsYtmAsWDYXVbWlMVpc3dYiaDBX4274+iTJHRKLwDoI3jLp8mmdiFCMnjmPv34+r0EKYi25Ci5r5z3Aa8qB1PpER60UP/VOX/nXLymlc2+i2DoIS8SJOBu0fsgjn0XTfnkmoDIs+Ae2uE/TZUhX6MaHmYnCa+CDFRlTmCa3Cj6vYliO8vQWoxibgiY539gnHESv2WXhPt8r+641IYGMHKLOhP2RVy+mCMQHAABOSsgmbq2xhbs8pI9KmJbi8Y2l7g6eVHdkfFnXRiINxd/JTk7nJhsXDxOJmkpV0uyhWiUHcnyKQs2Csitqfhzc4FT2Y+aSiGgg18qBPNIB6J7K1b9NXlj6ESEt0VJv+Vx+xcfpWgzyXKXds2Ky4GgnXvMBiIK3bxLSBWYgkQeH9D6WMGYr4X4hLRkyqMjBJG/RRyiEn8UcxaXNvOB0Tqlow+mhyQ/sDzs7JmAZfQzkq6Ivv/NpejhQN8dDfCuvRodWSC1LTgeemXPHGbpy0Tsjh+WCjCwsLMqnU43QNWaIyjTxzcg3pgac+laMApeZc1Hd69Ri8btvzGGVW04PgHS//cOsESSSxvtEkzzIofDKUHuknWhZcTwOAMC0HuXU/TyRLStxKmHlyuo4/2gOFvnuVTXVn0kqPrYUjl4xG+yEEmP2LQP0Bw82GJxmAD6AaOHjkIsHc=
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:24:53 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:24:33 +0200
Subject: [PATCH v2 4/4] drm/msm/dpu: Add X1E80100 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-x1e80100-display-v2-4-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=15961; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Wjo+0pOGgXnx4YaZ4l1uyPRnvTzMVxrVJy0mXHIFY5A=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+bv2Sps7gYa6nlZfCEHFR3r0PjPxb8h2bL7
 qdELEaKwFKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vmwAKCRAbX0TJAJUV
 VpTWD/4oUn1ELbg6RHXn6anHsklaxtL/Dg3HwirAbTGFs4OdzXPvui7lOXibV1vox3eEMfko2NG
 DQibkOECmdIVPfTLachblErNXOFDdONSkNfOw1Q4aEg4eSfUM724Rlei/2lQBsHgMreJkEpFAMS
 JgX2C9/tWxMZQ16WWpfWfTe5Qlcbm1CRmwRkIFPO1pUCn2BHGGACZdjTP/rWcH6OJth5K36lpSn
 QySQwqESOW/h45BCdt/b1mJYHde7cSGkI+cdckzMiRoaIe3Ir+tVemEHSv1Sjj9z2RwNSLhz9py
 pLVhgn9ODsUN+qGvkpxKdsXOOqHGHGArJq8HpYGD1xm+IgFAyJINg1qWQ8rCfsEcok/irsKZoHU
 YCnO4Vcspq0XM0VCjHeoG3QIBc1mkXxtgBMxRPwMroobojmKVrgbET5JczOTiMzYdwM9HyGa1aJ
 F/QONGhIWLdZjMqZCTpyLcatBGxUr+i7lquRo7ZJfxeYZQESyk9WH8qJxOMihMEyeLJO79jQNVz
 uLp79IL0HKLy734+skjCjtrO+SsbzjaCcDaw96JQYVsqaOGKeCUqeWTcN/sKfDRFgzpEWlslDVk
 PyM1BUoGBedEklXJcpq3AhCjHnZdANqjjHk/im8mdfY5DtH6q9D4cTFK0e2jTsoKBOdDZ7hMwvH
 MMN83gas/OjZwOA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add definitions for the display hardware used on the Qualcomm X1E80100
platform.

Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 453 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
new file mode 100644
index 000000000000..9a9f7092c526
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -0,0 +1,449 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DPU_9_2_X1E80100_H
+#define _DPU_9_2_X1E80100_H
+
+static const struct dpu_caps x1e80100_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg x1e80100_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+static const struct dpu_ctl_cfg x1e80100_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x290,
+		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x290,
+		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x290,
+		.features = CTL_SM8550_MASK,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg x1e80100_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_3,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_3,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x8000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_3,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0xa000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_3,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0x2a000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_12", .id = SSPP_DMA4,
+		.base = 0x2c000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 14,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_13", .id = SSPP_DMA5,
+		.base = 0x2e000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 15,
+		.type = SSPP_TYPE_DMA,
+	},
+};
+
+static const struct dpu_lm_cfg x1e80100_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x320,
+		.features = MIXER_SDM845_MASK,
+		.sblk = &sdm845_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	},
+};
+
+static const struct dpu_dspp_cfg x1e80100_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	}, {
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.features = DSPP_SC7180_MASK,
+		.sblk = &sdm845_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg x1e80100_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x6a000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x6b000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_4", .id = PINGPONG_4,
+		.base = 0x6d000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+	}, {
+		.name = "pingpong_5", .id = PINGPONG_5,
+		.base = 0x6e000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+	}, {
+		.name = "pingpong_6", .id = PINGPONG_6,
+		.base = 0x66000, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	}, {
+		.name = "pingpong_7", .id = PINGPONG_7,
+		.base = 0x66400, .len = 0,
+		.features = BIT(DPU_PINGPONG_DITHER),
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	},
+};
+
+static const struct dpu_merge_3d_cfg x1e80100_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x8,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x8,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x66700, .len = 0x8,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg x1e80100_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2),
+		.sblk = &dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x4,
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &dsc_sblk_1,
+	},
+};
+
+static const struct dpu_wb_cfg x1e80100_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SM8250_MASK,
+		.format_list = wb2_formats_rgb,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_intf_cfg x1e80100_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x300,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x38000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_2,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+	}, {
+		.name = "intf_5", .id = INTF_5,
+		.base = 0x39000, .len = 0x280,
+		.features = INTF_SC7280_MASK,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_3,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+	},
+};
+
+static const struct dpu_perf_cfg x1e80100_perf_data = {
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
+static const struct dpu_mdss_version x1e80100_mdss_ver = {
+	.core_major_ver = 9,
+	.core_minor_ver = 2,
+};
+
+const struct dpu_mdss_cfg dpu_x1e80100_cfg = {
+	.mdss_ver = &x1e80100_mdss_ver,
+	.caps = &x1e80100_dpu_caps,
+	.mdp = &x1e80100_mdp,
+	.ctl_count = ARRAY_SIZE(x1e80100_ctl),
+	.ctl = x1e80100_ctl,
+	.sspp_count = ARRAY_SIZE(x1e80100_sspp),
+	.sspp = x1e80100_sspp,
+	.mixer_count = ARRAY_SIZE(x1e80100_lm),
+	.mixer = x1e80100_lm,
+	.dspp_count = ARRAY_SIZE(x1e80100_dspp),
+	.dspp = x1e80100_dspp,
+	.pingpong_count = ARRAY_SIZE(x1e80100_pp),
+	.pingpong = x1e80100_pp,
+	.dsc_count = ARRAY_SIZE(x1e80100_dsc),
+	.dsc = x1e80100_dsc,
+	.merge_3d_count = ARRAY_SIZE(x1e80100_merge_3d),
+	.merge_3d = x1e80100_merge_3d,
+	.wb_count = ARRAY_SIZE(x1e80100_wb),
+	.wb = x1e80100_wb,
+	.intf_count = ARRAY_SIZE(x1e80100_intf),
+	.intf = x1e80100_intf,
+	.vbif_count = ARRAY_SIZE(sm8550_vbif),
+	.vbif = sm8550_vbif,
+	.perf = &x1e80100_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 54e8717403a0..31ade66a3c87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -703,4 +703,6 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 
 #include "catalog/dpu_9_0_sm8550.h"
 
+#include "catalog/dpu_9_2_x1e80100.h"
+
 #include "catalog/dpu_10_0_sm8650.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ba82ef4560a6..572a25f7f62d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -849,5 +849,6 @@ extern const struct dpu_mdss_cfg dpu_sc8280xp_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8450_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8550_cfg;
 extern const struct dpu_mdss_cfg dpu_sm8650_cfg;
+extern const struct dpu_mdss_cfg dpu_x1e80100_cfg;
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 48728be27e15..fc420b805bbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1337,6 +1337,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
 	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
 	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
+	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);

-- 
2.34.1

