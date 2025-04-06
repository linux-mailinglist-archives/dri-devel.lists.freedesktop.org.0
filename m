Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53904A7D089
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 22:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13D710E0E0;
	Sun,  6 Apr 2025 20:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="7w4oGq+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CCC10E008
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1743972926; bh=GYQDKxQYPeumdjpCWFzmT/BFYkqlpiumCHjzhGY3a/I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=7w4oGq+H+b6MbgG4oSCp8yrzLQHtRTTLN8U2pbRKfqcb3Jc1ynW4HfhfBc492CW6q
 E7G8QLuq9qvchlYL188PiKSmm6KQONBYb5Nz8yxd2RBhiUaPBGr0Bdb+i55hh4rW9z
 zhqWgHp3J/I9NG6NeE5yzabU6WdYQU6cINs9Qpik=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 22:55:04 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: msm8953: Add interconnects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-msm8953-interconnect-v1-2-a23e22e236e0@lucaweiss.eu>
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
In-Reply-To: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8564; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9ktMphiDY7XwX/inEIMXs+LhqzzNNoazAkIIZJrkXKg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8uo8VRx5k5lFLWc/sZAtRJHoRQ9Ivwq0PlI3i
 2BLqzjQBG+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/LqPAAKCRBy2EO4nU3X
 Vs62D/46FF04VEtCjUPVZ3L0DJ4AyXJI5QNJ3kkzSpYn8YY3R6xzkOkgeVisINfxJFq7eBoEtTO
 2/CwEMAA1bKK0Sq/yBKgm+JWGFAeyfXN0Wm2ZqPm1N0XP4hpDe1ec9FmjBzBrJms7xfHzrk/LxF
 X5+wkLzMOzG94ZXnlhHhnlSzqz73sUa3FCmoSGRSICHjTf/9sdlHZv5n4P8phrlKIoO63q0k+kQ
 VxUqD3S4cf3m7dIGNUSYIUBooJW9XXpMVCwKnm5EvutFf/x8pwKcoqsEaXbXiTODkpuBTAfFt/w
 yeuvKs2LKp3rna2jUtVOYBl7E2uv7UEabEeA9NgTWd0m1vRsZnf9qoJdgi9sqaA6GitewAFpNEY
 d/j8XG1IjI+dMLaG5XfpJ84S/Wgsqiu0oTkBBZhgQSe0P1Hn8LNanPRp17IfUiQuolAwsZ2dWQ7
 LSWpNkrlNugt5N/YQ2sYJBQI2dnvc9eCToEYMVTDOjRPMipQ8+ma7ZVb3R47QLtzWR3HSUAXJIK
 JnQkSIfWYi1SZHbTgt8y7g3zDUwff+gHDo7i8Weba0hQjtY3J6KXDm9VU/3x9HI988U6hJMMsnz
 A66tF/5YC3w4uVz1hLjJyjgmEYQutc54CuimuZ3NA1k/QjM/Q8kx/CsTd+OSbs1G0CthOlAOsje
 vtJZb8E3/2HHB0g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
interconnects where applicable.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[luca: Prepare patch for upstream submission]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 96 +++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..bc75c0bd67a27d0b2437e1bd29498f45a4822c08 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/clock/qcom,gcc-msm8953.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,msm8953.h>
+#include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
@@ -44,6 +46,8 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -54,6 +58,8 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -64,6 +70,8 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -74,6 +82,8 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 		};
@@ -84,6 +94,8 @@ cpu4: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -94,6 +106,8 @@ cpu5: cpu@101 {
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -104,6 +118,8 @@ cpu6: cpu@102 {
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -114,6 +130,8 @@ cpu7: cpu@103 {
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			interconnects = <&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>;
 			next-level-cache = <&l2_1>;
 			#cooling-cells = <2>;
 		};
@@ -470,6 +488,13 @@ rng@e3000 {
 			clock-names = "core";
 		};
 
+		bimc: interconnect@400000 {
+			compatible = "qcom,msm8953-bimc";
+			reg = <0x00400000 0x5a000>;
+
+			#interconnect-cells = <2>;
+		};
+
 		tsens0: thermal-sensor@4a9000 {
 			compatible = "qcom,msm8953-tsens", "qcom,tsens-v2";
 			reg = <0x004a9000 0x1000>, /* TM */
@@ -486,6 +511,29 @@ restart@4ab000 {
 			reg = <0x004ab000 0x4>;
 		};
 
+		pcnoc: interconnect@500000 {
+			compatible = "qcom,msm8953-pcnoc";
+			reg = <0x00500000 0x12080>;
+
+			clocks = <&gcc GCC_PCNOC_USB3_AXI_CLK>;
+			clock-names = "pcnoc_usb3_axi";
+
+			#interconnect-cells = <2>;
+		};
+
+		snoc: interconnect@580000 {
+			compatible = "qcom,msm8953-snoc";
+			reg = <0x00580000 0x16080>;
+
+			#interconnect-cells = <2>;
+
+			snoc_mm: interconnect-snoc {
+				compatible = "qcom,msm8953-snoc-mm";
+
+				#interconnect-cells = <2>;
+			};
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,msm8953-pinctrl";
 			reg = <0x01000000 0x300000>;
@@ -849,6 +897,13 @@ mdss: display-subsystem@1a00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
+			interconnects = <&snoc_mm MAS_MDP RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_DISP_SS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
 			clocks = <&gcc GCC_MDSS_AHB_CLK>,
 				 <&gcc GCC_MDSS_AXI_CLK>,
 				 <&gcc GCC_MDSS_VSYNC_CLK>,
@@ -1065,6 +1120,11 @@ gpu: gpu@1c00000 {
 				      "alwayson";
 			power-domains = <&gcc OXILI_GX_GDSC>;
 
+			interconnects = <&bimc MAS_OXILI RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_GPU_CFG RPM_ACTIVE_TAG>;
+
 			iommus = <&gpu_iommu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
 
@@ -1302,6 +1362,12 @@ usb3: usb@70f8800 {
 					  <&gcc GCC_USB30_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <133330000>;
 
+			interconnects = <&pcnoc MAS_USB3 RPM_ALWAYS_TAG
+					 &bimc SLV_EBI RPM_ALWAYS_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			power-domains = <&gcc USB30_GDSC>;
 
 			qcom,select-utmi-as-pipe-clk;
@@ -1354,6 +1420,11 @@ sdhc_1: mmc@7824900 {
 				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
 
+			interconnects = <&pcnoc MAS_SDCC_1 RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_SDCC_1 RPM_ACTIVE_TAG>;
+
 			power-domains = <&rpmpd MSM8953_VDDCX>;
 			operating-points-v2 = <&sdhc1_opp_table>;
 
@@ -1374,26 +1445,36 @@ sdhc1_opp_table: opp-table-sdhc1 {
 
 				opp-25000000 {
 					opp-hz = /bits/ 64 <25000000>;
+					opp-peak-kBps = <200000>, <100000>;
+					opp-avg-kBps = <65360>, <32768>;
 					required-opps = <&rpmpd_opp_low_svs>;
 				};
 
 				opp-50000000 {
 					opp-hz = /bits/ 64 <50000000>;
+					opp-peak-kBps = <400000>, <200000>;
+					opp-avg-kBps = <130718>, <65360>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
 
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <400000>, <400000>;
+					opp-avg-kBps = <130718>, <65360>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
 
 				opp-192000000 {
 					opp-hz = /bits/ 64 <192000000>;
+					opp-peak-kBps = <800000>, <600000>;
+					opp-avg-kBps = <261438>, <130718>;
 					required-opps = <&rpmpd_opp_nom>;
 				};
 
 				opp-384000000 {
 					opp-hz = /bits/ 64 <384000000>;
+					opp-peak-kBps = <800000>, <800000>;
+					opp-avg-kBps = <261438>, <300000>;
 					required-opps = <&rpmpd_opp_nom>;
 				};
 			};
@@ -1414,6 +1495,11 @@ sdhc_2: mmc@7864900 {
 				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "iface", "core", "xo";
 
+			interconnects = <&pcnoc MAS_SDCC_2 RPM_ACTIVE_TAG
+					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
+					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
+					 &pcnoc SLV_SDCC_2 RPM_ACTIVE_TAG>;
+
 			power-domains = <&rpmpd MSM8953_VDDCX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
@@ -1430,26 +1516,36 @@ sdhc2_opp_table: opp-table-sdhc2 {
 
 				opp-25000000 {
 					opp-hz = /bits/ 64 <25000000>;
+					opp-peak-kBps = <200000>, <100000>;
+					opp-avg-kBps = <65360>, <32768>;
 					required-opps = <&rpmpd_opp_low_svs>;
 				};
 
 				opp-50000000 {
 					opp-hz = /bits/ 64 <50000000>;
+					opp-peak-kBps = <400000>, <400000>;
+					opp-avg-kBps = <130718>, <65360>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
 
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <800000>, <400000>;
+					opp-avg-kBps = <130718>, <130718>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
 
 				opp-177770000 {
 					opp-hz = /bits/ 64 <177770000>;
+					opp-peak-kBps = <600000>, <600000>;
+					opp-avg-kBps = <261438>, <130718>;
 					required-opps = <&rpmpd_opp_nom>;
 				};
 
 				opp-200000000 {
 					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <800000>, <800000>;
+					opp-avg-kBps = <261438>, <130718>;
 					required-opps = <&rpmpd_opp_nom>;
 				};
 			};

-- 
2.49.0

