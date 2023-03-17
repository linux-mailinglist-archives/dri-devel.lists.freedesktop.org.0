Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AC6BEC59
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FB710E3D1;
	Fri, 17 Mar 2023 15:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7C710E3B7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:06:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q16so4743023wrw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679065596;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4UjNj4RhdG2GPeYaYxWsIzZJ/IFtQynTcD2qm6NR1vE=;
 b=czkh5cDiGWVe/i0SuyJrTZy/wTH2ZfGTJbRrg8+e64y0OdSn1I4Uabl3zl6DYXzPqI
 CqBmMYZq+7Jvw6amuaE2JUYKPOdsg+BZsRcJP9tzbk3Sevdr8lAnKfdj4w/TBWpf6XwU
 cDSfMBDD03UhkQvvpo6N8dpA/NafQldP0cnbke0M58KUSt6UYw8IRR5tM2IhROiJdqEW
 WQqDs4EdFr0bTKqWzj1HEtgJc6gXA4m/OdL3CMRs6RUNpfYPh3nvt1fblNrgWjjrXGeF
 zYc1a1sTQakB2PKVakVooGdrwIfeKZ7nXDQhlv8TLCrKYPW1G1vbiGVZtmlt53CCc7pj
 pStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065596;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UjNj4RhdG2GPeYaYxWsIzZJ/IFtQynTcD2qm6NR1vE=;
 b=hubnSOkIEDLQfFX+wDAW8UpKbUcR/WvDl/6E/gj5TvmqKRFvMKc7e+JQxV5SFfrYuo
 LGb672F5379g/QvHkPjdbwKhGOwQ0syLbVT/6dNaz27lD6m/TLzTZgqfhHzTDRsU5u+W
 zCYcg89tuFdu1KHVrJCq3USL5h9O339E8oXT5Diype76FRfqwdYMY2j8MoM8WcQDj5go
 CdsdZHE0qJJmPZYZZyiir1odsVy4+ob0eZqwXIgnnjPrICMH8VmFzUYShwWAUOVYM3Qp
 EZC2krM0C47JyyLdVpFW6KP4tlNl8gPC3LbQobC/e0pgJSzKVyPctMNcKE42QqbTB2Vr
 R0wA==
X-Gm-Message-State: AO0yUKVcpMyebmBLImKFP4QLMFBXEf91Y9pBH3/fulFIftxdBIuFUSK+
 8pBZW5Uhc0Kdwt2vYobJxfKvPg==
X-Google-Smtp-Source: AK7set+SLkTG8XRJsF2Zt2rpqpd7PWbpbCVULyH5l70pGWIdQM+XuDMXxdWYIgcrxUzypDGlFyMOoA==
X-Received: by 2002:adf:f5cc:0:b0:2d4:4f2b:965d with SMTP id
 k12-20020adff5cc000000b002d44f2b965dmr293209wrp.51.1679065596255; 
 Fri, 17 Mar 2023 08:06:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d58ed000000b002c5493a17efsm2187902wrd.25.2023.03.17.08.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:06:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Mar 2023 16:06:33 +0100
Subject: [PATCH v6 2/5] arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v6-2-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #SM8350-HDK
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 42 +++++++++++++-----------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1afc4311796e..975ab4cbe57e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -661,7 +662,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy_lanes 0>,
 				 <&ufs_mem_phy_lanes 1>,
 				 <&ufs_mem_phy_lanes 2>,
-				 <0>,
+				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
 		};
 
@@ -2135,37 +2136,24 @@ usb_2_hsphy: phy@88e4000 {
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
@@ -2268,7 +2256,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
@@ -2633,8 +2621,8 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
 				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
+				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",
 				      "dsi0_phy_pll_out_byteclk",
 				      "dsi0_phy_pll_out_dsiclk",

-- 
2.34.1

