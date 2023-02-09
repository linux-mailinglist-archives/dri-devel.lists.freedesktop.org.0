Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8151E690A81
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76C410EADB;
	Thu,  9 Feb 2023 13:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EEA10EAD4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rp23so6380133ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ep/S/5x9m2V1ANadd6JdElC3vPRIzQ9Ts9Gv8yCRW/0=;
 b=cjC+TXUn2r/y0dTSpZcqaXoXhw747ZqJ0f2+ommnMZfMUmhw6zBdw86ESmkXKevbg8
 mBQaPkEbxUtQblGKxNF0mP5q6VbYjuumM+lq88MGpy9WNQSOgmNy9k4u4haWSDl+IGrQ
 ILNabbyX0BHW+z4fZP0tfvPacDhrMfJ2Ks6nuRT6vhyhg0ydYmOQpaNvwJOsKM6PxEm+
 UGFUmhNYUQsoGLmpNr8sVfYKDXOSqist4bri+0bpsVh5r9Pf4KHh/aEVEJlNVGBxn8TK
 ocrtcvg8x+03REoZdicMVxW26fPehHUABQw+gV5uNWEKXFdMc2/Rtpcng+Vsa8StbV+Y
 sGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ep/S/5x9m2V1ANadd6JdElC3vPRIzQ9Ts9Gv8yCRW/0=;
 b=d8OjvT2Ryrjx5AEVpjKMmCr8yUpv6xkz43eqFc5+9339K4PoH0W56jxLTxtnIGArzF
 oPba8aZ9YfzX8ygVSSxT8YXd5YQw1CUqPK5qusn+/zjqm8gSC5OhNbH+xer0bdrP6xQj
 ok6E6zDfSPhMdDF+YSNhcenYKo6TkjHGs8eanw2D6lwjhdJoBZuGpmmv4v4cv0EhxaLg
 EyeyNnxccVC3MNwaQXQOqs34gZQx9AlG+SOBvD85UfZS3ZN038USRL6L2SEEcvatNY0R
 qKsHBTt+UQSWy30ZmkEXS2wkAiIvesVZCcjptZSs2fbWPxSQwn9D5SY9YFs5g5ZMl1UH
 SA5g==
X-Gm-Message-State: AO0yUKXFl4i+Ecj/wrnVGBxih1UOiGwTKSfXXg0ltiDrIQJRHW6LJnqF
 ZbQSg3vwn0yqTgldGCdfS0N8gA==
X-Google-Smtp-Source: AK7set+QxdGWdLRRJj1jYnOEhrl91mAYlLkKXv/HhCZnuXTBJpi1+0bhnpCsoSQxPIzxc0DnjHQRTw==
X-Received: by 2002:a17:906:68cd:b0:885:2eb5:68a2 with SMTP id
 y13-20020a17090668cd00b008852eb568a2mr10513216ejr.16.1675949926558; 
 Thu, 09 Feb 2023 05:38:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Date: Thu,  9 Feb 2023 15:38:37 +0200
Message-Id: <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
SRAM, SPMI and TLMM nodes to the proper position.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 764 +++++++++++++--------------
 1 file changed, 382 insertions(+), 382 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 8bf38d350521..742e9dd17084 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1882,276 +1882,6 @@ compute-cb@3 {
 			};
 		};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,sm8350-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
-			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
-					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
-					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
-					  <156 716 12>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
-
-		tsens0: thermal-sensor@c263000 {
-			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c263000 0 0x1ff>, /* TM */
-			      <0 0x0c222000 0 0x8>; /* SROT */
-			#qcom,sensors = <15>;
-			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
-				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow", "critical";
-			#thermal-sensor-cells = <1>;
-		};
-
-		tsens1: thermal-sensor@c265000 {
-			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
-			reg = <0 0x0c265000 0 0x1ff>, /* TM */
-			      <0 0x0c223000 0 0x8>; /* SROT */
-			#qcom,sensors = <14>;
-			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
-				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "uplow", "critical";
-			#thermal-sensor-cells = <1>;
-		};
-
-		aoss_qmp: power-management@c300000 {
-			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
-			reg = <0 0x0c300000 0 0x400>;
-			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
-						     IRQ_TYPE_EDGE_RISING>;
-			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-			#clock-cells = <0>;
-		};
-
-		sram@c3f0000 {
-			compatible = "qcom,rpmh-stats";
-			reg = <0 0x0c3f0000 0 0x400>;
-		};
-
-		spmi_bus: spmi@c440000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x0 0x0c440000 0x0 0x1100>,
-			      <0x0 0x0c600000 0x0 0x2000000>,
-			      <0x0 0x0e600000 0x0 0x100000>,
-			      <0x0 0x0e700000 0x0 0xa0000>,
-			      <0x0 0x0c40a000 0x0 0x26000>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-		};
-
-		tlmm: pinctrl@f100000 {
-			compatible = "qcom,sm8350-tlmm";
-			reg = <0 0x0f100000 0 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 204>;
-			wakeup-parent = <&pdc>;
-
-			sdc2_default_state: sdc2-default-state {
-				clk-pins {
-					pins = "sdc2_clk";
-					drive-strength = <16>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc2_cmd";
-					drive-strength = <16>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc2_data";
-					drive-strength = <16>;
-					bias-pull-up;
-				};
-			};
-
-			sdc2_sleep_state: sdc2-sleep-state {
-				clk-pins {
-					pins = "sdc2_clk";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				cmd-pins {
-					pins = "sdc2_cmd";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-
-				data-pins {
-					pins = "sdc2_data";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-			};
-
-			qup_uart3_default_state: qup-uart3-default-state {
-				rx-pins {
-					pins = "gpio18";
-					function = "qup3";
-				};
-				tx-pins {
-					pins = "gpio19";
-					function = "qup3";
-				};
-			};
-
-			qup_uart6_default: qup-uart6-default-state {
-				pins = "gpio30", "gpio31";
-				function = "qup6";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio58", "gpio59";
-				function = "qup18";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c0_default: qup-i2c0-default-state {
-				pins = "gpio4", "gpio5";
-				function = "qup0";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c1_default: qup-i2c1-default-state {
-				pins = "gpio8", "gpio9";
-				function = "qup1";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c2_default: qup-i2c2-default-state {
-				pins = "gpio12", "gpio13";
-				function = "qup2";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c4_default: qup-i2c4-default-state {
-				pins = "gpio20", "gpio21";
-				function = "qup4";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c5_default: qup-i2c5-default-state {
-				pins = "gpio24", "gpio25";
-				function = "qup5";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c6_default: qup-i2c6-default-state {
-				pins = "gpio28", "gpio29";
-				function = "qup6";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c7_default: qup-i2c7-default-state {
-				pins = "gpio32", "gpio33";
-				function = "qup7";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c8_default: qup-i2c8-default-state {
-				pins = "gpio36", "gpio37";
-				function = "qup8";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c9_default: qup-i2c9-default-state {
-				pins = "gpio40", "gpio41";
-				function = "qup9";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c10_default: qup-i2c10-default-state {
-				pins = "gpio44", "gpio45";
-				function = "qup10";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c11_default: qup-i2c11-default-state {
-				pins = "gpio48", "gpio49";
-				function = "qup11";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c12_default: qup-i2c12-default-state {
-				pins = "gpio52", "gpio53";
-				function = "qup12";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c13_default: qup-i2c13-default-state {
-				pins = "gpio0", "gpio1";
-				function = "qup13";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_i2c14_default: qup-i2c14-default-state {
-				pins = "gpio56", "gpio57";
-				function = "qup14";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c15_default: qup-i2c15-default-state {
-				pins = "gpio60", "gpio61";
-				function = "qup15";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c16_default: qup-i2c16-default-state {
-				pins = "gpio64", "gpio65";
-				function = "qup16";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c17_default: qup-i2c17-default-state {
-				pins = "gpio72", "gpio73";
-				function = "qup17";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			qup_i2c19_default: qup-i2c19-default-state {
-				pins = "gpio76", "gpio77";
-				function = "qup19";
-				drive-strength = <2>;
-				bias-disable;
-			};
-		};
-
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
@@ -2591,144 +2321,414 @@ mdss_dsi0_out: endpoint {
 				};
 			};
 
-			mdss_dsi0_phy: phy@ae94400 {
-				compatible = "qcom,sm8350-dsi-phy-5nm";
-				reg = <0 0x0ae94400 0 0x200>,
-				      <0 0x0ae94600 0 0x280>,
-				      <0 0x0ae94900 0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
-
-				#clock-cells = <1>;
-				#phy-cells = <0>;
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sm8350-dsi-phy-5nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94900 0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy 0>,
+							 <&mdss_dsi1_phy 1>;
+
+				operating-points-v2 = <&dsi1_opp_table>;
+				power-domains = <&rpmhpd SM8350_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					/* TODO: opp-187500000 should work with
+					 * &rpmhpd_opp_low_svs, but one some of
+					 * sm8350_hdk boards reboot using this
+					 * opp.
+					 */
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_svs>;
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
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sm8350-dsi-phy-5nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sm8350-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,
+					  <59 312 3>, <62 374 2>,  <64 434 2>,   <66 438 3>,
+					  <69 86 1>,  <70 520 54>, <124 609 31>, <155 63 1>,
+					  <156 716 12>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1ff>, /* TM */
+			      <0 0x0c222000 0 0x8>; /* SROT */
+			#qcom,sensors = <15>;
+			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <&pdc 28 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1ff>, /* TM */
+			      <0 0x0c223000 0 0x8>; /* SROT */
+			#qcom,sensors = <14>;
+			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <&pdc 29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sm8350-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0 0x0c3f0000 0 0x400>;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sm8350-tlmm";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 204>;
+			wakeup-parent = <&pdc>;
+
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <16>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 
-				status = "disabled";
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 
-			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
-				reg = <0 0x0ae96000 0 0x400>;
-				reg-names = "dsi_ctrl";
+			qup_uart3_default_state: qup-uart3-default-state {
+				rx-pins {
+					pins = "gpio18";
+					function = "qup3";
+				};
+				tx-pins {
+					pins = "gpio19";
+					function = "qup3";
+				};
+			};
 
-				interrupt-parent = <&mdss>;
-				interrupts = <5>;
+			qup_uart6_default: qup-uart6-default-state {
+				pins = "gpio30", "gpio31";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
-					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
-					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
-					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
-					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&gcc GCC_DISP_HF_AXI_CLK>;
-				clock-names = "byte",
-					      "byte_intf",
-					      "pixel",
-					      "core",
-					      "iface",
-					      "bus";
+			qup_uart18_default: qup-uart18-default-state {
+				pins = "gpio58", "gpio59";
+				function = "qup18";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
-						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				operating-points-v2 = <&dsi1_opp_table>;
-				power-domains = <&rpmhpd SM8350_MMCX>;
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio8", "gpio9";
+				function = "qup1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				phys = <&mdss_dsi1_phy>;
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio12", "gpio13";
+				function = "qup2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				#address-cells = <1>;
-				#size-cells = <0>;
+			qup_i2c4_default: qup-i2c4-default-state {
+				pins = "gpio20", "gpio21";
+				function = "qup4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				status = "disabled";
+			qup_i2c5_default: qup-i2c5-default-state {
+				pins = "gpio24", "gpio25";
+				function = "qup5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				dsi1_opp_table: opp-table {
-					compatible = "operating-points-v2";
+			qup_i2c6_default: qup-i2c6-default-state {
+				pins = "gpio28", "gpio29";
+				function = "qup6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					/* TODO: opp-187500000 should work with
-					 * &rpmhpd_opp_low_svs, but one some of
-					 * sm8350_hdk boards reboot using this
-					 * opp.
-					 */
-					opp-187500000 {
-						opp-hz = /bits/ 64 <187500000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
+			qup_i2c7_default: qup-i2c7-default-state {
+				pins = "gpio32", "gpio33";
+				function = "qup7";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-					opp-300000000 {
-						opp-hz = /bits/ 64 <300000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio36", "gpio37";
+				function = "qup8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					opp-358000000 {
-						opp-hz = /bits/ 64 <358000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-				};
+			qup_i2c9_default: qup-i2c9-default-state {
+				pins = "gpio40", "gpio41";
+				function = "qup9";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio44", "gpio45";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					port@0 {
-						reg = <0>;
-						mdss_dsi1_in: endpoint {
-							remote-endpoint = <&dpu_intf2_out>;
-						};
-					};
+			qup_i2c11_default: qup-i2c11-default-state {
+				pins = "gpio48", "gpio49";
+				function = "qup11";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-					port@1 {
-						reg = <1>;
-						mdss_dsi1_out: endpoint {
-						};
-					};
-				};
+			qup_i2c12_default: qup-i2c12-default-state {
+				pins = "gpio52", "gpio53";
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
 			};
 
-			mdss_dsi1_phy: phy@ae96400 {
-				compatible = "qcom,sm8350-dsi-phy-5nm";
-				reg = <0 0x0ae96400 0 0x200>,
-				      <0 0x0ae96600 0 0x280>,
-				      <0 0x0ae96900 0 0x27c>;
-				reg-names = "dsi_phy",
-					    "dsi_phy_lane",
-					    "dsi_pll";
+			qup_i2c13_default: qup-i2c13-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup13";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 
-				#clock-cells = <1>;
-				#phy-cells = <0>;
+			qup_i2c14_default: qup-i2c14-default-state {
+				pins = "gpio56", "gpio57";
+				function = "qup14";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-					 <&rpmhcc RPMH_CXO_CLK>;
-				clock-names = "iface", "ref";
+			qup_i2c15_default: qup-i2c15-default-state {
+				pins = "gpio60", "gpio61";
+				function = "qup15";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-				status = "disabled";
+			qup_i2c16_default: qup-i2c16-default-state {
+				pins = "gpio64", "gpio65";
+				function = "qup16";
+				drive-strength = <2>;
+				bias-disable;
 			};
-		};
 
-		dispcc: clock-controller@af00000 {
-			compatible = "qcom,sm8350-dispcc";
-			reg = <0 0x0af00000 0 0x10000>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
-				 <0>,
-				 <0>;
-			clock-names = "bi_tcxo",
-				      "dsi0_phy_pll_out_byteclk",
-				      "dsi0_phy_pll_out_dsiclk",
-				      "dsi1_phy_pll_out_byteclk",
-				      "dsi1_phy_pll_out_dsiclk",
-				      "dp_phy_pll_link_clk",
-				      "dp_phy_pll_vco_div_clk";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
+			qup_i2c17_default: qup-i2c17-default-state {
+				pins = "gpio72", "gpio73";
+				function = "qup17";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-			power-domains = <&rpmhpd SM8350_MMCX>;
+			qup_i2c19_default: qup-i2c19-default-state {
+				pins = "gpio76", "gpio77";
+				function = "qup19";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.39.1

