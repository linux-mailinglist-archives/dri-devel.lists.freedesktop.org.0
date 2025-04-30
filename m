Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AA7AA4C64
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B9110E7D7;
	Wed, 30 Apr 2025 13:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XeM5jj97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBFA10E7D5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:02:02 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39d73b97500so415223f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018121; x=1746622921; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tndmMRLasPafzGI8us3kiKmdtf1aIReqkNl96kpfR9I=;
 b=XeM5jj970y6+G6XHbOGvdv+yZCYD/gaa+KtWgja89xONhKpYNraP//BpKWKL2Avi4P
 6H9aRmsU+701zvQOomDb7dLXb5vqr3W8ke6Zj+QrZ6OvQiYluQ52fJhscY5YneLssCBK
 Dr7VLp94t+IWTnQ0XQYV9fdhdrgxVnUYZE/x1fU4MDP22Yltq2AYN86tKMPtN34tsfnf
 Z8aO26S7GRtaStmvaqpNDfSTX7AMXKWhpcFkfUXkyaaeHrXG7pXBDCSyMuF42Q4oDkXJ
 QPuzHu7aLSu1pUzpQ/Pfw5poqtFDvZuIwCEP4hDq9Lz5sYGXAcdCG6CamcOsNjAspenU
 xwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018121; x=1746622921;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tndmMRLasPafzGI8us3kiKmdtf1aIReqkNl96kpfR9I=;
 b=o9/0eKnlD0csYKugd+g/3KoIyWEZKLPApJbk8qUEtGUQEzvxybuynfgo1PwMUOw+Hi
 xP3CfrctxBA1XMmo8iXddzTgemb8izzC5g9hGG2hpB8g3eZYJp8J5H2TvPE+7xZBvg+M
 MONf7lldALRDT6xdktT3IdZ/XYIrS5a/A7zxrHhV54W8VPB4OlcARIEL8ATn7/TZ2RxC
 n81noVmpPCRVPJi5ChSnct8xqTgP0ipNRZFOMRsjKL49vAN1KBvAoz6mHtXOAcidgUw9
 34HPd+kuIPgIHWGRYlOUC252kc4KapLqG6svUDfWjEoOPhJ4tX2RtPncBwFh+HBFtVPI
 DG0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGweSneu6++Lopfd4TxsCzxH5l5vBZyMwjoFF8Yl2v5sno+8hUx021I/kcbnRlhbZVXHecRP+2Njs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHpIPoAnMcVEmEFsTdLwaBekpcg2S5kL9P3k942KRmBNJgZEO/
 1KCtuyg0TBOxFMV27CUv9eqZAIZG5APNlVyf8+gaIE3S+abVasr/bX57H/Gcbm4=
X-Gm-Gg: ASbGnct5cMXJ2Os5pi7hveDOYhzru7eYH1oWJSHgJ+b7bVWt9m0MAPf0KImcfOdN6sc
 GNvkePTvET7X+3R2u4yKLdgkY9rNXwLSOhyK0ZwEO+55M+cnFw6f05aI8G6XETy9btUf5iCmu5T
 wGigpOXrTRFheHnrvkxLSz+OviajsimZlXUCIkgI1UxWZoOIFldpNs6mu0akEHtY49E4mAWDcYY
 xF8/3dz6ffKa6cgQ37wbMwb8lJo3oiymchionw2BPD2KuXAW1ezTyEd/FofBW/rnSy2OdWgbBMu
 Sk5acVC8fy+0XEoKMn5M9vlQ1wLyqc3mMLXTywigSFH/ECrHa+vjFRj3SjZNHrlwYwZPcw==
X-Google-Smtp-Source: AGHT+IFi7AgExT+UHxJr37nV09KKAM1KH3QuKRe5WJLZQda5LnvxXNiP5Xe86NeUpMJvDYVJnyIoGw==
X-Received: by 2002:a05:6000:2404:b0:3a0:9188:ef58 with SMTP id
 ffacd0b85a97d-3a091d667cdmr96227f8f.14.1746018120453; 
 Wed, 30 Apr 2025 06:02:00 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:54 +0200
Subject: [PATCH v5 24/24] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-24-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=be21JxufejHw2rq84sJ/VfYaP1y6cCq/ZMTy8SJRrHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8PByvnI0Trv3zsZhzQ6VfXKE9citqdjgGC3
 PsTmPZCN/WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfDwAKCRDBN2bmhouD
 1wrrD/4u2PuQ2ouXBCx8tly07ATHb1/Zj1EzEBIaw19Oi3HJew675YV4BPClQF9J7CrOB2m/ywR
 hbw/dqZXqTP4kUCrmDAqP8pwBvmJGIPQcCuznZGjaUFbdLyBqJeVV95jMfLE31jOOkDhWSZEYwV
 5jc29JXj/nPLvDAjfUv/yylQnfHKEpLeliBjwI9j6hFpDUHUEIWYsFrD7XC5gRowjCIrVWYArhu
 mg57pYWMhuBdbvtzbhsZ5Tu84iPLXB98/DznQXv97jj0t81MD1NB6vz1NN6c3s1uOrA4shA+N6L
 fpAXoNrr2+b/F6pw5r/BomV7TrYL3CX0nN4cxW11IA74vPAIV8Jgu2t0mOui5caqBaPR0rvT36m
 Kw1qNZIVTme4Ql8nZmmon1XlHcDKyjXljdJQyS0zNuyPOR4h9bFO5Fd4ZQi/vMYZIyNgL4xIVVn
 eFobglFBZ/q6CZkQ1vAotPvPkkIfBmigkKk7Q5ZdddttpPEA/Nq6UN77mcgpg+KyOVSMIToABqe
 FFzMztgK+MUi2pBiL4pp5TvizsJL5qolZqdIT6SSwni8B/WhYEl/YOH7cqaAccf7vh7IpLLW1tK
 DlnN4VVi0lbl86fzVBqvpNpfIbVkSE2PxXaOdvdUFFFEYmDm5zo0ifolEz4rzBiPZlD1TBHug82
 ZgJejiSvYezahmg==
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

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -722,6 +743,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -756,6 +788,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.45.2

