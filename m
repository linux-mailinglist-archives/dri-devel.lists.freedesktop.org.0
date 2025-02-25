Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA31A44E83
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1010110E1C9;
	Tue, 25 Feb 2025 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="bHA9pBSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7458E10E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740518094; bh=V8zm/T/v89iW7Qxn5c4OjobqRw0lXZC27c2iSEMOnn8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=bHA9pBSyZxybVLBkGBxL+XQPqfwe7PIMBtMoImfwremXWYF7+4ujNADL8TOlNCZAI
 xn45l+mjxxr0GRIa98XIbwhIZU+ErfQH9m1JHM09OQAxXGLc3ctdf1SqDU3JIXJRNQ
 5Ik7PwoEvLkXS2cl/J8cWygkyFHh7/xLFLweVQfk=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 25 Feb 2025 22:14:32 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
In-Reply-To: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=V8zm/T/v89iW7Qxn5c4OjobqRw0lXZC27c2iSEMOnn8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLLLxC/LXvqZR548r1l8YFfBF2H/HiCQs346
 JBrmX4EdJaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74yywAKCRBy2EO4nU3X
 Vq5ID/9mkGZ+E3Mi1lgJtZ0A+laMbxyjekOKGBvkS0VKwBQcRvRCq17iXyJlQeh4fDKbm00aiFU
 v/58MYo39g9G6Wxqi/0zrE5a+QNf2qYoYu9BJGpi7t7Sy5KUBUUf45yT1zk2XvZzrOiepmVipV0
 mowzmFBaihCmdO37D8PiqcOaCHkG8sWLu/4IKuvNSAFZWO1uhmpY09u/Rs3DdehW0XTyvAxolHP
 b5raB9EjvJZIs2U7VQGVBtxpvtJwSNBrqOCwGZi+VaYbwP4p/9VekdZoIogiPDYUKAhieiMujuK
 8Shka3vkvE/j/5x7NGEM5/UkrFgyA9lodTwWmC+tAov5pqZLgxAssU9R8Ec1yEvsMRi5p+bz5oD
 iaM8ad6N9MLnsCVv9UDUpnidpooLORlhZVM+G9TMIIpjd3b9pun/jf8QF9ziOXuXOPU8klpNwYh
 ExPnQUjQUeSWM31xAwLjthNtO1HkVSWTo0RBGbuuDzlV4+Zc+5kbBoKOGnMscLHspBjG5hYEawu
 +f3+5C+wKdOzZXrAeUik1PmpuoaFo3w8eMzVov/dk4JZM+3fVOUC4/54Y9jJvf4GKE3JB+SzkjT
 drjsKBg8eGXFAbf43zkiCzYMAQUU2vuKqIcAMLrXG5oqagllvGgYd2d3LUwgo7xFAN1vZqVrbyd
 HzpS/hAXEzmmbyg==
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
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..6f5e6c407194d16682d1e6401fd4d10f3b73c195 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1072,7 +1072,7 @@ gpu: gpu@1c00000 {
 
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
2.48.1

