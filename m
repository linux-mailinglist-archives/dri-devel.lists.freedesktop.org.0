Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3BCD0ED2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722810F044;
	Fri, 19 Dec 2025 16:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="b6e3uyVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5C610F042
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso346235766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162483; x=1766767283; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BUxnJEEvA236F8NBMU+pi14SjYgYMC3mWtbkAiJbgJA=;
 b=b6e3uyVxjvythaGpGPFsimt8g61aPrOzzQms1LkNkBeLK6+bhyIini5KkMuGaUq6Np
 CdOOYt4mmhPETH38D5X46wfsQCu1JN2x1U1u6jEtWJ15t5+i7HJmzjMYTAa/p+Wprk3S
 Gr+f6aicQwv7qqRTZ0djqlwoqWjwXjwn0HC64hySqvKP/OChKM0BV5HFJYuAYQ1Og+wZ
 rIS/9BNDzLZ8eDZk0ZzS1mdoE+NgrKfLJ6IexBXzx7m2DLI0z1wG1S4sgDjt3+F8cV9J
 YHMMRHYe2KrEpB/G9m+JdNJOKjdvHwxDejp6dH25M6p+BXjLpauFuwvpsSgo4NfEtSqD
 0vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162483; x=1766767283;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BUxnJEEvA236F8NBMU+pi14SjYgYMC3mWtbkAiJbgJA=;
 b=XVmuXFzMQU20QzXCcZSijkgMlFIOov8+keyA15v6wiKS7cVIT+fB7hp/qFXRzjgU9l
 UVNzr7O6s4jwsP0WVTeoQ2KfjHuIUwID+aQVXRxGuljUSVmCV96r3hQx2CqX37TyCbEs
 BCp1xOynLEIf4NGCwNFYaVCqRbJAgtSOj4TUsBb6YohzMkjbBlgYItYGMhSgMdEbZ0h5
 qMHwS/LJir2PNLh2swOf4vx8da4iN1FNBjug/kF3jyi9tC+m7CHn6xwQOcQLVHpOQfmN
 So3ENYiDSJTBgo2QnRr8/b/T9WLvBhBN74LVBNGwhMAMtRhsNzU7u2zCaPlXxX2aG9Cd
 0ywg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLMPVXJALy0KTxcEK/IXH9jDGUOYB634+Dg6wNOsMz9ETdrfxtKyMQ6F2XbtYpx1khVpUAiV7f1BU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQp8CdEjg4mTufPlb97bu7JeyXNcbvr6jdaey3EgZkqLpLYKRy
 BfkKwkEsqbg/QRW1a7TT2frDa68veaFPVhZFBdbckTWut0JucCe4ifQ3R078ju28eP0vgxnCSku
 tkewMzeEP2Vei
X-Gm-Gg: AY/fxX7hA7FkySzYyLtfolHiSi7O7uG93o6TZ9CdPvbmVVPactVsIKyMOOR2Po56LvU
 S/+Q2z9J2GZKx5BZlkqDIQI1dH39ZE5n5DlUaYDlgsTJ81OOhYUbJKrxjNyEaQEwA/jp9jARwrW
 l50mOudnyUxWzBqpcro3o5gYNpBsTQix/P3ppBqwiWe21Mg5eqA5i3cZ7rfZiZjh9ygOJwljPwd
 OAY0uzYIFuwjQSUpaLJwHCt8dgxqRjQVdlv0cMQzc6flpBWVMIuJk4Xgu7VPXOrhIUYGEeM6DR3
 NTugnJIHzT4NfsCgQsUdb2t5wReXYQKW9IrVKppV1mgF5FLqG3R9JdAzZPfcLU9EwdEToWaPYLC
 +nijdWmWd2yaT6nhjhNBs5EncPhNL3emxF/eouDVs4mGiDDURvBT6/3dcCqyk8d+gHNoXT7O+ih
 e/wSfNPO86XPP3As2C3lQP6ExtW9N54DbY072GQOc96SPXZOO2HkQmoacOQMSmyJR5gCvk+RhzC
 fw/+4S//qP0bts84+oDwtXL2A5WGNDqpACU2y6PrF5K6w==
X-Google-Smtp-Source: AGHT+IE7/rDvAirOTWuD+BVN5TbR1N6ti7H+jP3ySf2yYQJ6aR8Hobv4GJ5Cw25G9s0WT629tUqWPQ==
X-Received: by 2002:a17:907:6e8d:b0:b7a:1be1:823 with SMTP id
 a640c23a62f3a-b80371f4980mr307764866b.64.1766162483081; 
 Fri, 19 Dec 2025 08:41:23 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:11 +0100
Subject: [PATCH RFC 5/6] arm64: dts: qcom: milos: Add MDSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=6457;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZPY/+FNr1/I/jCjPIrjQ2ntydK3ydgHgE/NHLtUlLqI=;
 b=bTYroNnX9nmEp+PvxNLxIefBtVd4tBPLovBupbfVOdJ8HI0UiqL0WfH/MKEvYwKQ+t8e+eZOC
 EsYuqD5T1+tB1FhWAdiM4maIun2YecmssvG6Cy1ETDN3K03Ie2h0iZ/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 211 +++++++++++++++++++++++++++++++++++-
 1 file changed, 209 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0756cf5fb888..2477f0d97278 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,milos-camcc.h>
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
@@ -1821,6 +1822,212 @@ camcc: clock-controller@adb0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,milos-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1c00 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,milos-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-342000000 {
+						opp-hz = /bits/ 64 <342000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-402000000 {
+						opp-hz = /bits/ 64 <402000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-535000000 {
+						opp-hz = /bits/ 64 <535000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-630000000 {
+						opp-hz = /bits/ 64 <630000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae95000 {
+				compatible = "qcom,milos-dsi-phy-4nm";
+				reg = <0x0 0x0ae95000 0x0 0x200>,
+				      <0x0 0x0ae95200 0x0 0x280>,
+				      <0x0 0x0ae95500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,milos-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
@@ -1829,8 +2036,8 @@ dispcc: clock-controller@af00000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>, /* dsi0_phy_pll_out_byteclk */
-				 <0>, /* dsi0_phy_pll_out_dsiclk */
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>, /* dp0_phy_pll_link_clk */
 				 <0>; /* dp0_phy_pll_vco_div_clk */
 

-- 
2.52.0

