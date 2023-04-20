Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7066E9EE2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61F10ED28;
	Thu, 20 Apr 2023 22:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830CC10ED28
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:31:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec8399e963so951951e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682029898; x=1684621898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
 b=r69+OTvdPAJ4sKqvjR7kEd3QeVT7UrZWAtHfwc9VPuD4P23u0aKU04R04eI1I4vDhv
 ZLdrDuU/SUV972AzJsfmBa834BQ/eT8x3IKHJvnSaAchmOcUDNaly1SCgXKZdSTFmv/A
 XkqyQqJU707bQACaa4zhxHd6AQ54Bxzi2OCLHdhRnRLf2h940aCzSUSN9HaD+jKB4kKx
 IXstLdu1YaFPc+VJOKHFJQpYpS/QIMt/BJPvMLoEVPD0PKVRs4k/L/kDbUzt8EeRpl2y
 rUkgnfn1GHnqxWI72pKXIPH6Sk0KFQY3n2tAjaq2QxtzhU6GVA0HqL/S/hXiW861V0bI
 RGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682029898; x=1684621898;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Gx9hOgjws0YjXjWKNVHvwkPmSavQFOa1C9EN/R+wqo=;
 b=iThOD6+XtydEB2ZNJSdq/z+OcZk6OI88yy2OZClKycpEqfvX3Wq0tMZHqAeua8sKyP
 tv8L0bgy647ihN6ebcHzIU5qxOq8zlvKPItdKdrMmbPpLbcPzffGZQDZXJ4rqSO0HlNS
 e4s2XFifhWV51o9ENgYyeP2x0nNyMej8Xd0cHiuCTLGIeap2Ok3GPuZdtBZyWFnZKUT1
 A99JP4obtGi9covuUTPsMHr2yDSps3PyoEnZsCTlyIdPyqp5TD1s76B0k6IQsa50qO37
 EDVhxulEA9LtN+J3XoCX0A6do7YubwY1igr6Bohy229ebFYmWJmmWmGCHZKB7O9zDOJc
 vZ9g==
X-Gm-Message-State: AAQBX9eje6MShYo5xfUqMTLwHtiAunOLjUcqPejhGEqNfkp+60Brv+Pb
 WFGO2F1g8UmxXjHhgRr42S3RIw==
X-Google-Smtp-Source: AKy350agF//FITNbmTr+sk0Wqprb9qhtIJOjH7KH5TKwATYHuhXeon0c3RlBjUadrSwCnVZyDBKCMg==
X-Received: by 2002:a19:ad4c:0:b0:4e8:3b51:e7eb with SMTP id
 s12-20020a19ad4c000000b004e83b51e7ebmr826262lfd.7.1682029898488; 
 Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 15:31:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 21 Apr 2023 00:31:19 +0200
Subject: [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1357;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IZraHC2rKjwAxvGejhLYdH/8ZPnRD2vaDl4IpBKvSDs=;
 b=FP2ipxs5Nr8YDG41US/6zI6ekAMslR4vE0K4u7LOeT1EivuPnX1w5tKQTXEck12W9qVTOEtDivz3
 WuRS5/DZDjHC58OaEhn697/T/kdfsd1bZWmPg7vS1HYlJv1GAHpk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for MDSS on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..f2470ce699f7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -546,6 +546,15 @@ static const struct msm_mdss_data sm6350_data = {
 	.highest_bank_bit = 1,
 };
 
+static const struct msm_mdss_data sm6375_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 0x1e,
+	/* Possibly 0 for LPDDR3 */
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -580,6 +589,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6375_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.0

