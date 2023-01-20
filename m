Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F8675F4C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DED810E3AF;
	Fri, 20 Jan 2023 21:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207210E3A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:25 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b4so8257882edf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXpRK66Qxpazw7ZBSDhL2VuarYJmczwhTFpn31yFY6A=;
 b=h0j0tqp1w3CO7sLntH/Nj7Q3502f/+thyrgH/kZl+06qK6bFfQainS6HYKgabaCqZa
 2SenyT+Zynf64H7S77s/s4ZA7ZPqXiFqgJBPzO6GIf9QgOuopU7d+AvYUgVShhWzUPsa
 ccl3Wgrfy4LY1sxsVXfPKKmjzgHM8nTE/ZjFHhkhRKfpqvECIK0CaDIX75+JOdXE0jQU
 HOG9f3TJau/PDMyyun9j5IlkZ/TqbuQHlFFqqG66fjcSehSWaGKm2m7lwl9z5YEnwli3
 9TLmbAnSkUxdtRVgJIZL8LY6WH8dJ31ntenfHEcXkAoK78JYd3yzXFCbUv9ttCr2CmVb
 qp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXpRK66Qxpazw7ZBSDhL2VuarYJmczwhTFpn31yFY6A=;
 b=iJjlMQpiXFs7pDc977lXrXetKn+rxLlVu7pzIB9hMITaTaMwXNVdbhzUOVnTdkl53d
 oRvJ153Wka448rFYjl6q0ywcfPKgKFcvaGFR5gN8Gjm8BidmjJODLUWoBVwqClxTl3pk
 FRqOOtpJhP9xssEN04MnDSdIXNNy2GU2q4kRuLiXvEFK5BBwaQOiczrywWlJqljYgCB8
 pHSSYh2T9MaAJlp1WySId/H5wMgicGTfFfLJLp+VAUjSlUCZdGlJg+mS1C+L/HMw205F
 Vf66j7a0dbrOk0BlYtScRlCNoH30VkwvIOmAVRudG9muXptOZceim2pw3rKrZz2k+B2T
 lDUw==
X-Gm-Message-State: AFqh2kqK/SWkLTFRHnft1AOpdgzXV5IPdyvELlhdpZlXy6VExhd+H3un
 hePGpaaP3rOk2IDfCmCiPMPJ1Q==
X-Google-Smtp-Source: AMrXdXvc3+ZcD59sVWvBuYUWfY+UrxFOxehiFF1cS8qCPTMQQJktRtG9mdhI20ZezkeaPgmLt7Piuw==
X-Received: by 2002:a05:6402:454:b0:492:8c77:7dad with SMTP id
 p20-20020a056402045400b004928c777dadmr15808302edw.8.1674248483799; 
 Fri, 20 Jan 2023 13:01:23 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:23 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 5/8] arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
Date: Fri, 20 Jan 2023 22:00:57 +0100
Message-Id: <20230120210101.2146852-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The compatibles were wrong, resulting in the driver not probing. Fix
that.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c964d939289b..22bf6239c757 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3038,7 +3038,7 @@ dsi0_out: endpoint {
 			};
 
 			mdss_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,dsi-phy-5nm-8350";
+				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae94400 0 0x200>,
 				      <0 0x0ae94600 0 0x280>,
 				      <0 0x0ae94900 0 0x260>;
@@ -3135,7 +3135,7 @@ dsi1_out: endpoint {
 			};
 
 			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,dsi-phy-5nm-8350";
+				compatible = "qcom,sm8350-dsi-phy-5nm";
 				reg = <0 0x0ae96400 0 0x200>,
 				      <0 0x0ae96600 0 0x280>,
 				      <0 0x0ae96900 0 0x260>;
-- 
2.39.1

