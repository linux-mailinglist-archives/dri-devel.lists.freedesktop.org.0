Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E098C71F00D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B110E597;
	Thu,  1 Jun 2023 17:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151710E597;
 Thu,  1 Jun 2023 17:00:56 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 70759CFC95;
 Thu,  1 Jun 2023 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685638825; bh=eKeJWu3f/K9fInmraz7fujMKEyoO5YqMeg0ocfPUaZk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=pjAzBJB1NE9OKSaN9I3P20sycTyjb6pXf0Mw4byihxdSSGCuP2ZBjfRNv3CFxz1P6
 HEc1M9yG9XlckffcoObCzgxTz2SNQx3wZB3yFl5vmjXRRr+1raQdOyNZ3tMQIPcBoN
 fSqf27cw0X0+JqnMeQ4Lrpu7+W6o7m/4PNo1teJM=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 01 Jun 2023 19:00:14 +0200
Subject: [PATCH v3 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v3-7-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=eKeJWu3f/K9fInmraz7fujMKEyoO5YqMeg0ocfPUaZk=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkeM6h05rTstajjbAt+kVtioKTNC37puxYbWPQm
 BTuFhUuiQuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHjOoQAKCRBy2EO4nU3X
 Vv4hD/0WEov8+ZNLq0Q5ol0zU/7j43NKM1dVC6HyNyEHS5sRr4q3y8LKlQ/m3lzk2eKq89I6Zoa
 0wA+H6g00UjIjDShXCCNLa/I0XkuwuGb4nXsF5fX/8OmCwRBBQX5XaP2m3DlkWivhe7xEj4qw+6
 BoKeBzDn/g+lFAUKX8+616t3lCvpK1BRatKOMfqMnikGKSji0DdKH8ODP2qH0LsmmQETwEg4jb5
 qQxBSRJ1vZf/OE9B7RVyCQTzimae1j++fugad5zuBDXLzgzJJDclMzlORxZr+k2hNuJM5GihgO7
 IxNGErKKY7PTyfXRC2Zirh9PwcGbY3zX6tJ6uQbKDwRA8GzJ0g4Ib9DXegvW8Iloex7kvC3HZXi
 uZ68MJxFjDXvR/KpKQwoRppp6tJX8lRvivMnYa8zqJT3c/uetq1zkpedfG2Slas0QQxEK2WYCWY
 bVZk/gxbJpVOdfERXlpFbK/9m7/7Zn0yiN9csQ0R77W+dXgm1d8VlsNdTU3EHgHthNYS/Ymsxwr
 q/3qCeNr8VE/vRHDnVoEPIHEd9G1D9FxxWYSbr2/hcnm+LpucX2G4ENbWCp/64eFfLJLQfcuzOT
 PVe3yL89QxXqgV14B1ATyLSlO2TqQdhRgUNAnhhbJOOgXeO9dTc1ztTtmd1WoA0wqdjtRP8UIkW
 WgdUOM8ZyUlSCwA==
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
index 42acb9ddb8cc..9f53747d2990 100644
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
+			mdss_mdp: display-controller@fd900000 {
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
+						mdss_mdp_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@fd922800 {
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
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
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
+				phys = <&mdss_dsi0_phy>;
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
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&mdss_mdp_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@fd922a00 {
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

