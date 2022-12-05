Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E4642D19
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA9310E261;
	Mon,  5 Dec 2022 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A18210E261
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gu23so29147810ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bEH3pnZJvLD0zwCY2qegZFliLhqKwSFLXksz2qDwd0o=;
 b=OeTzndGKys7w4AIe7cNLcW0+3q2MjOuFI3Oaxw91IHy+Hrd14F4rsHgtZ7jURzrf3a
 SXu+jbQKQangMprAENpevL8aDEfl14ADH74gsCdGHooYwswCkqlUm0LRFi1D9CM5CO5/
 itbAcg+nHqTqkq7WgwzwAFOj21dVAk/E+r+yESDRaxV5WGTyTiaDBDb/+pLX21vS7uT0
 0IkS6OKzLkasHG3rzd7bAYDh25fDABh6lmLWkIgGknwISkS/pqb1l3Q5/1sNM3/ZXm60
 rzCxmgAoTIs9pstNprlHSwewef2vK7FAApNTiNrcPtsKTsrbGUVZ6Z4MA92LlamlKNoo
 2c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEH3pnZJvLD0zwCY2qegZFliLhqKwSFLXksz2qDwd0o=;
 b=dxqumHa568T3TderISEWEG2D7C49ITaJLYwE6cgOTHLD03XTIDOLRHwZzNh4M2CYyj
 penYpxP8LsVQUQgfPBfgunM5lDHYvWOjSmFx/GWAsQ82RG0dynn5FBMWnwXo/Rffyk7w
 yb2Ob6jOi6bFNBGvfwwQiOhtZqTNkFHCXPaKmtMHHl8j4FIBfQ4UEEeybMwNQRQqljlg
 Njix2NJlQba7bBPfTA7t8gJkY+saqAkMphzin1cUWMyp/AOpBWmZDdW2ldXSClPar85c
 eO6VpglUs2jScK31YhLekbzKQemJKGCubtc8p0nAn3VSuwm4vJGpu4yHdh1SjMwfZL3p
 g0gw==
X-Gm-Message-State: ANoB5pk4QXvR5LQsq2c4gFqgW+HZkZmH/R9YtHwLkgvdAsTeTgBizV0f
 rvB6oL8KholF2ocU1ncb/nRmvQ==
X-Google-Smtp-Source: AA0mqf5WYzukFU7nm0KUB5VLtChKqyNpg7pnF3phCbKSYsTcTDGnaSR5YLlGBt/GnTwwF9GbXEH7/g==
X-Received: by 2002:a17:906:5649:b0:7ad:a2ef:c62 with SMTP id
 v9-20020a170906564900b007ada2ef0c62mr8664821ejr.126.1670258297724; 
 Mon, 05 Dec 2022 08:38:17 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:17 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v3 11/11] arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc
 dsi-hdmi bridge
Date: Mon,  5 Dec 2022 17:37:54 +0100
Message-Id: <20221205163754.221139-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.

In order to toggle the board to enable the HDMI output,
switch #7 & #8 on the rightmost multi-switch package have
to be toggled to On.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 105 ++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 39462c659c58..3aa4ca8271e5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -29,6 +40,31 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	lt9611_1v2: lt9611-1v2-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&tlmm 49 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	lt9611_3v3: lt9611-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_3V3";
+
+		vin-supply = <&vreg_bob>;
+		gpio = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &adsp {
@@ -220,6 +256,15 @@ &dispcc {
 &dsi0 {
 	vdda-supply = <&vreg_l6b_1p2>;
 	status = "okay";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&lt9611_a>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
 };
 
 &dsi0_phy  {
@@ -231,6 +276,46 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&lt9611_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_state>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -248,6 +333,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &slpi {
 	status = "okay";
 	firmware-name = "qcom/sm8350/slpi.mbn";
@@ -544,4 +633,20 @@ usb_hub_enabled_state: usb-hub-enabled-state {
 		drive-strength = <2>;
 		output-low;
 	};
+
+	lt9611_state: lt9611-state {
+		lt9611_rst_pin {
+			pins = "gpio48";
+			function = "normal";
+
+			output-high;
+			input-disable;
+		};
+
+		lt9611_irq_pin {
+			pins = "gpio50";
+			function = "gpio";
+			bias-disable;
+		};
+	};
 };
-- 
2.34.1

