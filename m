Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B0E7CB85F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 04:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843610E252;
	Tue, 17 Oct 2023 02:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E65910E224;
 Tue, 17 Oct 2023 02:18:53 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-66cee0d62fbso34731186d6.3; 
 Mon, 16 Oct 2023 19:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697509132; x=1698113932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
 b=BwOqhWjIdGCqrfC8p1rI2bM01pEAb0dcuQJkLRxACg/kUAUay2LIfzOk9t32uI9TGj
 UNtOPVy5r72t1os3hMVOHEMnYCUmtRcOkQx0OEI3hk33OG5HR7J0eiPehFg7dOKznbqr
 yZ54ePTEHSbTq8D+U+EPLLulMokWLRri5DF3b3WPZZCsFVW6/gsTMrBt//1gmFIo2Cnm
 gRQoeAda/Y7YIKDnSSXrpqeujGvDhzzXPWkxC+Xsgjs7rF0phQ7VKDNR0l7oTlAnBbpp
 1vhl7CJH1UkgE3U2GlpDV/ep7sH8I7mpVecQLkh/OtE529Ta6IxZhGS0uzG/pca/fzHp
 2GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697509132; x=1698113932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bo5wp4VPacPQ/YFv1ka6i/IWIDKPlu3gu5ElNSMims=;
 b=PP6lJ+BbD/PBEpdTQHPl7GiZFgM00iSK6ro1HQH9PjZUNdySVxqG6dFJJMRZyU3f8o
 7+p9185hT70ppyn8/Drf6Xuy97vkRz6auSco/4vUWtNX0XL9ppxDdwIqRgSjp2OPZU2c
 MwOgoDFTy5ZFkQOiMHQBw5EHzAwpcvHNv9YOVRTVaG/LELD/+hMFC8PlDPHDw3P3VVr7
 QCuCHnl51dhf0WkohEoFE/xnH/FX0U3IO+SoXXz0yTxOMiEUjmCNvjGA4nqvFhyRGomS
 p33yQS8gkxNCBTqpNxykHQ0y9sevVdKLVWoL638wTY87b7BbF+ZgfzPosrUBZeFWGr/z
 mlfQ==
X-Gm-Message-State: AOJu0YwG/peJsc+oqO25g5zJzrYAHzHefFJfIs/2MQsFcaOroyNRFQNv
 8xlqD+45+bPOWsrLci3j194=
X-Google-Smtp-Source: AGHT+IGX16jPx4ZBZwRemxp+ItcB0+zNPzRTizKKVHZAqJevknBuOLrAU8KAF0Pp07aRbRr/DWaiYA==
X-Received: by 2002:a05:6214:daf:b0:66d:15c3:62cb with SMTP id
 h15-20020a0562140daf00b0066d15c362cbmr1297260qvh.36.1697509132522; 
 Mon, 16 Oct 2023 19:18:52 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05620a022900b00767c961eb47sm257090qkm.43.2023.10.16.19.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 19:18:52 -0700 (PDT)
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
Subject: [PATCH v4 4/6] drm/msm: mdss: add support for SDM670
Date: Mon, 16 Oct 2023 22:18:11 -0400
Message-ID: <20231017021805.1083350-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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

Add support for the MDSS block on the SDM670 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..2afb843271aa 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -551,6 +551,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm670_data = {
+	.ubwc_enc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 1,
+};
+
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -609,6 +615,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
+	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.42.0

