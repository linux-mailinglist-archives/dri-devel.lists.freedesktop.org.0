Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359FA40ACE
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96910E00B;
	Sat, 22 Feb 2025 17:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="h56yv1t0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A3510E258
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740247094; bh=QBxvoEdUEK2SkbLndKPfxDjCEC5giUzyR0L2dQYitgE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=h56yv1t0sXYTHgejBLgeVLH+apEVGEN4YsAFvFxh0+F9ztOpQUCDveGLQX81Fw6hj
 JXCXvuP6BRo/r4QP6Vuf8FYpvZIGYzcA8Y3ECZqE/EoO2popmRJSBlriBQlQqXMgu8
 tilzEwDXGJ1kXcY04Z3cKR5BU69B9gnaddsHlgyc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 22 Feb 2025 18:58:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable display
 and GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-fp3-display-v1-4-ccd812e16952@lucaweiss.eu>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
In-Reply-To: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3149; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=QBxvoEdUEK2SkbLndKPfxDjCEC5giUzyR0L2dQYitgE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnuhA0C0eBdK8p2uW3UrYwf4GANbkkpiNYOeG2d
 kcGvz5xZbKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7oQNAAKCRBy2EO4nU3X
 VhCzEACtJ33nle+xC4lPGedSNSLoxK1hqZ6G5y+oLE4Q1uu7UhZq4ru68B3VnhPERhOn5heL4+2
 XzWdrKzc6fppWeGjMQNe8TE1x46pCLJmW4UB45kmb/lhLLD4VqnRIyWwYEgz0JjGakZ0gsakiLF
 495FK9rPrNS+UYseKMCf9spI5Jvp0wscTbzn1BeHdSfaDiGIqOawdjc0SuXAPuslGiUIFv2oQh5
 hdkdNv36+LyEYtGHe0UC9+jrGE+U7xdYCaNBQMcRAjhblF8SmgzZcKowO2XlHs5VjHfi174dn21
 8GVF6UEIXlKtaU3/RJdJVo2yMhLZS8yg3J1Fu2N20OSU42uIvj5YqsYRN74Fviggr8BZHQ76xDb
 koptniR5BByVdgqWO4u/MN3gpa1hZxlvVQteij1SGOOy2gcs1S/iKF45/BUfo8fDU0b8ULsivdV
 olhjfLSI+gL3zjOuoo70gOA66iUHF7biyr3oAsC9qBcyeiEmNKSFzXmH5631oRZi5cBvdii3DQh
 uwpCbBbtHA9Zc+dZf23iCmsXTxPaOA/gd/IC/kTFxFZj6K2Qr2TPC+O22ne8JoB7fGr/QAQP73h
 H/lZci53Ltrno+b+DBoLUqTJN9WZb8uAzbz6z4hQrx1mCd3YdLSFxYn7lY5B/ckMhc2tQtKiZiT
 ffNVt1rRaZwoOGA==
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
index 31ed26c31e6ea381a8942ccf569513df3300cdeb..b9af811f46c283c7e0ca72e30c6cba13462f6b5a 100644
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
+		compatible = "djn,fairphone-fp3-panel";
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

