Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD8AD5C39
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 18:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963AB10E6CB;
	Wed, 11 Jun 2025 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="F52v95jE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB3110E6D1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1749659639; bh=9PghBU/VAIibPl4YWoEbxb+Vq7pSne0KImwxsb0T908=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=F52v95jEqDy6RoNLRnD+RLUwn8rapwmQP5bV7oDh1HxNwcxULvniTMwfndx682YRT
 MTCQBDBihwuHwpSHRXc2MxGWGHxBw/GO+B2Nq91PstepJCNavA0ulIovZ32+NVgUti
 UEWVJG4QidcWOgCrJO7EqpFwGhYPnb7OQRtFT2mg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 11 Jun 2025 18:33:18 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-fp3-display-v4-4-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=9PghBU/VAIibPl4YWoEbxb+Vq7pSne0KImwxsb0T908=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSa/0dZklWpKiHcLeocBA55qVH330Y6VmwhQt1
 FME+LsNK16JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEmv9AAKCRBy2EO4nU3X
 Vtc3D/sGEpreLVLjkNB9Q0671b/UlYCfku5noSUCU+kK7JT6IWI/st31bd33VQP8qe2xaXzKW+c
 feNsmmF25dB3Tht6FnF4xV4sTxFRyZF8H7+G1Tafw13AnX5NPFdKYvL1q7616wfl4GUFMzyqQhk
 mHyv2kvsbiRVCk0sN6pPgG6OL2ppAuGMGg/fbUQptmTsvavdLQw1ihufyr1H+PHyvNSOoyGsJeK
 OXCJ6EtKGXYgweQY3AYU6RfPjhOOp6qfdJBOr08b5LMhFrbP8Cl4+JHU2eqlAwTrUxgGU0MSY+n
 d9Z0U8dmr4md1mIj77Up5WdasPlZr+9QjEqtFsstvby5ouObwbgEdHpixy/FRIR50NFfA8iEsUO
 hDTZYyjlqbwZOSUGhIOS0hnwZhwO+j8r1Kx+X6I1BfKAr0PsQmbd9IkLEP8SDCk3RCLoal7Mxlo
 wjGoGCnVRiXTIOlRNr//IR8PWBmgzQ5xHRSIxruxZrHSJD/ou3IYB/l1Wyoqoeqw8ciZQhzJJKQ
 6SNECSnMUNo7Z0swtCawhpZMEyqPXNTTGG/0W5kqqkx8ksh65xo8URojQEWfm1uad6oHQ0/OyyL
 n25vjtGumTJxc+eXAmgYdF7yG1SMZok+U58bkpJYeagmZlLKs3u82qmTTZKbZqQjluYfr1xzWgL
 URD3tSw0v8ZAAVw==
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

Add the description for the display panel found on this phone.
Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
we need to use a dummy regulator-fixed in the meantime.

And with this done we can also enable the GPU and set the zap shader
firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 273e79fb75695af1fd7a6f77273b95fe3b913fac..c5205d09c442e45e4a0cc3e6d8ff7d9d7bda0034 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1147,7 +1147,7 @@ &bimc SLV_EBI RPM_ALWAYS_TAG>,
 
 			status = "disabled";
 
-			zap-shader {
+			gpu_zap_shader: zap-shader {
 				memory-region = <&zap_shader_region>;
 			};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 31ed26c31e6ea381a8942ccf569513df3300cdeb..55a45b528bd3f1bf9b6fe7882753338b43c62271 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -36,6 +36,14 @@ key-volume-up {
 		};
 	};
 
+	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
+	lcdb_dummy: regulator-lcdb-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "lcdb_dummy";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -44,6 +52,14 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8953/fairphone/fp3/a506_zap.mbn";
+};
+
 &hsusb_phy {
 	vdd-supply = <&pm8953_l3>;
 	vdda-pll-supply = <&pm8953_l7>;
@@ -87,6 +103,45 @@ &lpass {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "djn,98-03057-6598b-i";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+
+		iovcc-supply = <&pm8953_l6>;
+		vsn-supply = <&lcdb_dummy>;
+		vsp-supply = <&lcdb_dummy>;
+
+		pinctrl-0 = <&mdss_te_default>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+	status = "okay";
+};
+
 &mpss {
 	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
 			"qcom/msm8953/fairphone/fp3/modem.mbn";
@@ -292,6 +347,13 @@ &tlmm {
 	 * 135-138: fingerprint reader (SPI)
 	 */
 	gpio-reserved-ranges = <0 4>, <135 4>;
+
+	mdss_te_default: mdss-te-default-state {
+		pins = "gpio24";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart_0 {

-- 
2.49.0

