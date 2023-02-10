Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B72691CDE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5894110ECC5;
	Fri, 10 Feb 2023 10:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716510ECC7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:34:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5959502wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n53b4yhBmViMDHIftiJB3ier3fKOOJs37AEPAgKOcQg=;
 b=RSnlTQDCCfHAOErowMFFxTs4pb9dI8nYYjfDl9uQHAlcrC3s0yXCgzTCYjQRdXSZzO
 irb3s1f12kNQQzfEFosdHTqEwG//KiSLRc0ZZAkI87k8aW91XlkhcO8cNux7JwJihVZE
 45ZvxepMMBXXE4+SLVcDeQEQl0vC70jb+MOyYjnNsHLPiSbe15h81VpOfKMsTad879uU
 4RawnBYDTewPrvCCQgHnsY8//SarnUQhXLPE8Us+ugXiNodhYrUwQ2aOtFh8YkKUVwkC
 JnACFlzNok9o2Ty8OUhHdJMCP8paoViiDbGychUJJcdyLHhb8EYk2yKI5iv4z9gDSNIG
 zPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n53b4yhBmViMDHIftiJB3ier3fKOOJs37AEPAgKOcQg=;
 b=CB++Uumli55FvD9H5a6tZhbyh8cQdoenM2+KJItpuebE3A8YEP7yJWYDv7peHNayfj
 yOXn8J6/pPffy1tZQ9KQrqVIsylHOBa+zHkj3w2YRoPMjpYRY3ykVNEH1w8fUUkgqNS1
 i726y4tZS/4Hv+TBIVU8B6XwRy1gJYfiB3ctiuowViOMAnA8x/qD6b/Z5ulFuXWzGoi7
 JUlgAparl50lIgMKbLIql6jWkJGNkmhUSXJv8km9bAvzd8RcWbwHZXuHP14k8nvuaOUl
 MxSDtXWH1m5R17StExNKFjrACtT5vCYjgZcEZjEIe1781LOTskag3NeETCywDBhbYzk7
 loZw==
X-Gm-Message-State: AO0yUKUMtC1x+niD2p8NmOEEo0CC708bP43RBmZ3a4yVEjGJw0ZmYeo5
 Ifl/g5+ysgeM5bweP4rXzet1hA==
X-Google-Smtp-Source: AK7set9g8Fu4kd0Db899Uo2PhLO+UrrHHiJ4YcvCzV57yKjNKPYfH/PniBR1H2ovCBb9D0ZqgwpAuw==
X-Received: by 2002:a05:600c:491d:b0:3da:2a78:d7a4 with SMTP id
 f29-20020a05600c491d00b003da2a78d7a4mr12458184wmp.21.1676025296824; 
 Fri, 10 Feb 2023 02:34:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:34:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 11:34:51 +0100
Subject: [PATCH v2 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-2-529da2203659@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first QMP PHY is an USB3/DP combo phy, switch to the newly
documented bindings and register the clocks to the GCC
and DISPCC controllers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 40 ++++++++++++------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 04bb838189a6..d490ce84a022 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -652,7 +652,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy_lanes 0>,
 				 <&ufs_mem_phy_lanes 1>,
 				 <&ufs_mem_phy_lanes 2>,
-				 <0>,
+				 <&usb_1_qmpphy 0>,
 				 <0>;
 		};
 
@@ -2601,37 +2601,24 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
-		usb_1_qmpphy: phy-wrapper@88e9000 {
-			compatible = "qcom,sm8350-qmp-usb3-phy";
-			reg = <0 0x088e9000 0 0x200>,
-			      <0 0x088e8000 0 0x20>;
-			status = "disabled";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_1_qmpphy: phy@88e9000 {
+			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
+			reg = <0 0x088e8000 0 0x3000>;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
-			clock-names = "aux", "ref_clk_src", "com_aux";
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
 
 			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
 				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
-			usb_1_ssphy: phy@88e9200 {
-				reg = <0 0x088e9200 0 0x200>,
-				      <0 0x088e9400 0 0x200>,
-				      <0 0x088e9c00 0 0x400>,
-				      <0 0x088e9600 0 0x200>,
-				      <0 0x088e9800 0 0x200>,
-				      <0 0x088e9a00 0 0x100>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			status = "disabled";
 		};
 
 		usb_2_qmpphy: phy-wrapper@88eb000 {
@@ -2727,7 +2714,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -3092,8 +3079,7 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
+				 <&usb_1_qmpphy 1>, <&usb_1_qmpphy 2>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",

-- 
2.34.1

