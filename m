Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8DA076AC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E5410EDCA;
	Thu,  9 Jan 2025 13:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FnaRjJWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAEB10EDC9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:10:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436246b1f9bso1355525e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428144; x=1737032944; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vmyMD3Uq9AhqTuS5zdgQtFCCk70JrG5wX/TvE2UGDH0=;
 b=FnaRjJWpmcA7bRuAkbH/2/nB5laglWuL/hMlR8c/TLIcqEmAa25l8syhFPDli9yfmK
 KPJm9UHb2yUNaXU7CMWYo6CDzU3zIn7+H1CcGprJASx6wXgqg5P9aXaFNBlG4vywBfsh
 y9d01N8TO3v9gP3ccfGuBtFvNcweK2rGNKgDR/LAl47R+BGO5u6EtHGZWyFIBdwvYpnS
 9wAYClhBHEOTuIwKUT9ggtD2qOOFyYcEdNyslQoM8AKmQ8oCLJxAm3IiPjmC23S37/uJ
 NnxHPSeqfezEkWJM0b0VZsNm6JoxPT2a+Kr04SAmXk+I8+Qpqxu9BOhlXhJrm1Ea8o31
 vASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428144; x=1737032944;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmyMD3Uq9AhqTuS5zdgQtFCCk70JrG5wX/TvE2UGDH0=;
 b=elPyknPSRDPvQoTNqlOBMNaPJI8TnYz++HPqInB+dW9UzH6NiC7/88dkZb7A5olr18
 vItEtHQw33dfQODPA1uuYJgiGoQ6G6ecHDQ/7f7RTFCm98Wclz5aKiIF+AO3yiyudJND
 vzJvoP5Y87JLeBrfwu7kjQOBTs4TSKpHGGXudFugOb2/V9e/ByzullU+RvZUwxugq/Pa
 r26ZHJisox/8ISQfuZdIIFiTiA7CI3HkJ4KnHAwMychrDYFgzBKOz3yl3wm6jVqD1FQx
 n7nDoQyxwpvy4J4WYXNBGMTg5FLKdyavSW34wQNHSK8uP1KX208Bk+ww8XnfJ107xDUt
 /96g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF985kcJftKbXzUp4dxV4NbiFJbngEhVonF3Ve1HA7B2A6MI4cGWIG93Gp74uY2RoLoncBnsGQ4dk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeuf4rpEA6t+J8oYmU357LdNgKXhdYMDwyYKdU28eD+xfVRZDW
 CfGMCjkHCmnaU3LDcH5b0GZkWfQp5qEQIvJKVbYVv4avkbyIIL/5YxnCYhLmi+o=
X-Gm-Gg: ASbGnct+upLSruuf4LcKWjKqZyd0VKayc1S6c9DP6o++ptcYHJtG5tExONQOytnAT1m
 32yzIPn6u8vJbsVSPcu9ev0Axbm4Q6trrPRkmyfDvczqLfyq6bsbxa0xkHZRrmQqvrrjKKtcurj
 6j6h32gluST0ljejUo6v62xYImd9cyPv37fZbrIDKQwCwNSwkOagK8HeKTr/buVXIhEKd9YNXNl
 X64h3ZSnkxrXHR8DKmtj40zXD4iDi+aANKh8kv9c+z/WPmvotQvAMnGDS0mGUtRttjpaqmR
X-Google-Smtp-Source: AGHT+IF0yZQpE2T+mDEU7Qz0l8hUmiW2SIK+Ml2sGaqZkGBiX7CZXSeMJdBZDUAAKUVm9RnE3BY2xg==
X-Received: by 2002:a05:600c:1385:b0:436:1b94:2deb with SMTP id
 5b1f17b1804b1-436e26f556fmr24399175e9.5.1736428144436; 
 Thu, 09 Jan 2025 05:09:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:09:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:38 +0100
Subject: [PATCH RFC / WIP 11/11] drm/msm/dpu: WIP: CTL_LAYER_EXT is gone
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-11-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TVMXYKtsPr9SmJtLCQujXcnxWHB0kWLUZE8cXhntq7s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pZrX/xmLRnouLbZzbTf+8JmOHcEvZFbhJLW
 uKWtOsxV0iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KWQAKCRDBN2bmhouD
 19V5D/0XRUOYYup2mcozlO/v7zs+20lKubAIepFfnv1lO8cuSoDrqzzp3h83xK+BGOKPB96Gsae
 9OcEXFlGysxQ//yMKy51ALBjjkvMo+gxd53M9D0HAApgGW24Jemkann6DlDaJHtuNKPbDoQ2JM+
 qGj8+zm1I8IGrzQ+ru7QKSgUiCPUX9kcSgH7MaFkVkFIIywt1NOzNa6zyBCXTKVw0hJHK8F+v2g
 1ZFBtD36fFxvyQ4s7lcCyLefxZeHq+f4ZYNUInEXotKeEIQVs9LV0NSmcJ7mgYTHefecDeszJi4
 Zqlf2EetTd7wFNl5qvbVM25CdDeUabNHZTXSu5wWDQRh+6rx5MhFKNFS16pi4242pR+UaJNQZd8
 yknn9SRrBGmfNXJ/7arklu7+mptNR2k0GX0YbT5vplQzrGq9pb8vK5P3lvVN9KjE+Hq7mY8yEuW
 +vCN7h9JOYar8VWJIGzLT3KumqSFHIy75+D0EJPya0a5uS0U+9hnsrhX52KQSRJ1YffNig4ShLJ
 IvIBNRtgLyaTJ7VCq+hFhNIEFtw/6auV5SiVkfmbHUS2zGC1PDXe5eLZCviiPZCpsMkARrTQIso
 rrXDQHfy/sP4/81qOobC+coakacox92TjhYhBU211dg1r9gt4QOComHyBVmhLKXsd5X/DPRSvxE
 nUklphySesF7goQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Not finished. Looking around, maybe someone already did some works
around new CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 10 ++++++++--
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index b093f6e529f6d5f4a4b600d766cefb509619a3c1..df1ebb797959a67055acccd65137e4f1e342cd79 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -33,32 +33,32 @@ static const struct dpu_ctl_cfg sm8750_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8750_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8750_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SM8750_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SM8750_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SM8750_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SM8750_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 40966ab6283e666d1f113a62ada50298de68833b..8e938455459119708967e9c02a84042f3962ead1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -119,6 +119,9 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
+#define CTL_SM8750_MASK \
+	(CTL_SC7280_MASK | BIT(DPU_CTL_NO_LAYER_EXT))
+
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1bd313f2c6f199d5eefcdaa5f7c18ea512d48684..0231849b9c86662b44a0c133c87a64d9af047e7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -137,6 +137,8 @@ enum {
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
+ * @DPU_CTL_NO_LAYER_EXT:	CTL has no CTL_LAYER_EXT registers at all, but
+ *                              has active bits for pipes and layer mixers
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
@@ -146,6 +148,7 @@ enum {
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_HAS_LAYER_EXT4,
+	DPU_CTL_NO_LAYER_EXT,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 06b01cd36ce2442ee6e1b85be227851a234cc96b..502449cbbddcb21b7008f139ac065d187a16b68e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -40,6 +40,8 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12C
+#define   CTL_LAYER_ACTIVE              0x130
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -729,8 +731,12 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	if (cap & BIT(DPU_CTL_NO_LAYER_EXT)) {
+		// TODO: NOT COMPLETE, This has to be implemented
+	} else {
+		ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+		ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	}
 	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
 	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))

-- 
2.43.0

