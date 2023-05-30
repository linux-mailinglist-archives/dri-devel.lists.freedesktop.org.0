Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC2716C48
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2447310E406;
	Tue, 30 May 2023 18:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBF10E403;
 Tue, 30 May 2023 18:25:03 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id A394ACFC44;
 Tue, 30 May 2023 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685471072; bh=z/aQiTQcE2QuOfic75RRo/hFCpeXMEDvL82sQ0eB9MU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=PNuNaQPfPXQXcBI3A0XralCb8FDrEGVTHYmJ3aCA10HzXvrQq0T06xM4qdA7AP/Kf
 Rs/LIrqV8Q/oGBuvhsJub9kXZDnNjm8OJIEXQ8s6F4sgXt/3jvZRsS495NrY5qT7gm
 p2PrPr2h/JIWbw214A1oylzKbjYO50YaA8oxpzJo=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Tue, 30 May 2023 20:24:17 +0200
Subject: [PATCH v2 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v2-7-e005b769ee28@z3ntu.xyz>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=z/aQiTQcE2QuOfic75RRo/hFCpeXMEDvL82sQ0eB9MU=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9XQ26mD638qkdilZENNBfMnjNRu6b0TrM9i
 x5nSITiamCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/VwAKCRBy2EO4nU3X
 VnLUEACNBeNSCjbsj9aGEIRQvH3o2vtqRbOvDk1zU6BBbiSmbXGGieqeWgf9FXKZhiGQnUqICnG
 D387FPjOyiicfJ6MYqFNbcGgWiFQIbfTdcdBGXSkOxH1Kk3Issd3qQ1rhIhBKrjRMR+geDo/DAt
 XlxcxB+3/DVPPuvjLM0y5ZIKCqriFjP5zla9Y0qpGsvWrK3E4SqyyajciObw7ZiGWFkbM7rn4fY
 WyAqFoFStaRYCRl+etjNwL/hiiq/EO91rK+jUwTugLrJVJHoxtun+yeu24BI3cJz6/POGnpGKU2
 y5aUG8C1AznkHXBOHTKBleqMRwr5SgjUstlCCiYiZtdO+7Vn4I7lIE31LMFx7C7/lgzFHvveRph
 TasTKWPQFROsT408+XGDL2gMaFf5884CEmACaEn+UWzI5KCSG/OpwUFI9AUimawI67VV21z0gS0
 XNLPEw2N+7Qz/IubFzbMzlvnL4UDwZiW+vy4o+QqphcvK4wms6ke2co5aED9B/JFxrqYeMzFBcl
 vuDuFXJCFGtvM7UZlS6suSn0NZOOaEyW2SOrCFqbfuvNGWjuBa8SJ/CONwBlsxfEbLIET85jWti
 rGguMvuupfUzUS+YXnGFbcxOpGMgvWvHAfyCV6jj/WhxH22uouhYvUk1MqOVoq+Hvb8DOHyYIiG
 EewI8xHb5XplNzg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the nodes that describe the mdss so that display can work on
MSM8226.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 127 ++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index 42acb9ddb8cc..c794f5ece1d1 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -636,6 +636,133 @@ smd-edge {
 				label = "lpass";
 			};
 		};
+
+		mdss: display-subsystem@fd900000 {
+			compatible = "qcom,mdss";
+			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			power-domains = <&mmcc MDSS_GDSC>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@fd900000 {
+				compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
+				reg = <0xfd900100 0x22000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@fd922800 {
+				compatible = "qcom,msm8226-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0xfd922800 0x1f8>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
+						  <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+							 <&dsi_phy0 1>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_BYTE0_CLK>,
+					 <&mmcc MDSS_PCLK0_CLK>,
+					 <&mmcc MDSS_ESC0_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core",
+					      "core_mmss";
+
+				phys = <&dsi_phy0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy0: phy@fd922a00 {
+				compatible = "qcom,dsi-phy-28nm-8226";
+				reg = <0xfd922a00 0xd4>,
+				      <0xfd922b00 0x280>,
+				      <0xfd922d80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+			};
+		};
 	};
 
 	timer {

-- 
2.40.1

