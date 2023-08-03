Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998B76E7BD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA9510E5FE;
	Thu,  3 Aug 2023 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C1B10E5FC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 12:04:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe167d4a18so8973915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691064253; x=1691669053;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
 b=BlJxsCICzE2dZkbywMr4FudgRcFUwjd7eCm71sowAJTG9G1YRtszdbgeULBf8dYZBs
 Mr7gemr2DsEcdSvsY76kFm00+LJyJsnXDnA7Ga0UBvJarCzKbTef8d2UqvNPnF5S7RB1
 zKVz3oM6gQvkl7GXKDCNAQPjJ4KxNYE6bmhiToSlHjDiTI+Pe/sL7oHFbqf6SyGx1USl
 akIJ6zwwP2RJ2qJZPleeYmgXmSogMFGpzPw324W89D22tefn3YNUWTbRNwz6PikR0ZyD
 3lqa0bp1ERB9TZHjl/S50PJkQphaHxGvAWRHwPQzwgUx8JCtYIrLJLFVK0trucJA7q1b
 CHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691064253; x=1691669053;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
 b=YUPgd4wr5Ev21pQbK4lQRN2PbbmgYiVLGHgelPNOovjPrZ0cuXh7haxcRhogEFuQyG
 Z+xNfppNtU8G84225QhA3NQzfPCPLAGVsvdo+qqzzJbLfc40pldhnw6Sz2PMXVCGqPWl
 8WG/AfY0CfBqwwMmfnYwAqD0CY8R3HvFtuKxItAN1dhsSW/IeoAFU2sGJJME0cccKR1H
 tek2tHqwqeQnyPiL3mwD1UIRGvikWHRFYEWu4cTrmQIZET51iyO7yahVg+422EMHvhFw
 ZAOOBRmT1+QwNT6j6NTR9qpbSON9WtjXXfFp5SWh/lZwoTog7Kx3zVuYIj4xVU3Zhe+p
 hQqA==
X-Gm-Message-State: ABy/qLZO+Ma5dqVg0RZz6YQcb305Z3K6L6TDSOf2OsIYRob0BRIGVlv1
 vcSkdMsZqUjvvtUDLlGt+orgKg==
X-Google-Smtp-Source: APBJJlGa+okCrUq1qnlV4w7LNF9en8KNIyz3NEyFIqpcMvjF/X7vSC4+lMBIaIe1G+T53MU165jdxA==
X-Received: by 2002:a05:600c:2194:b0:3f7:cb42:fa28 with SMTP id
 e20-20020a05600c219400b003f7cb42fa28mr7540008wme.28.1691064253580; 
 Thu, 03 Aug 2023 05:04:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:04:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:04:01 +0200
Subject: [PATCH v7 7/9] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-7-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V+HaYnTuv4vcDBK+f0uefqR8qZNKRB03xg8yBzcvNP8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5eyDWVasX87JKDl9Q3Zwin7OqsrHI0fGH0utHFc
 TOgOcr2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsgAKCRB33NvayMhJ0Rn2D/
 wLVh+g/1kECG1mVL+f162NL4lVQLF5IWrK501lv07SxZ2avsUvW4q9EAHiEkoh4W9DVtIifjIiFOzy
 fN1gdtNOZm/O5DCGUUwhMRxW7STrS+/AQDdmDdNlvSXLTAhIVy33cTFN5qMopGnMTjFzFoXvIOecth
 /E9yIFc6f4Tzr0ixb/Dajv0Xko74SeJNZafYtEuTw6yxWB0FQnGsXGneFPCGBVngTRO3Ii9PxY2y3X
 0TwKYTS+ECqS1c0kIqSWgyCMOxYrKvQsgsXi8DnQ22Lxh208g4Yj1n3dYCtcuyhOwofwsR6hR1LoYX
 EE4SxBuOS1pIrWwJaaFJt8DMXHbmoDOytZhVqkyg3OHJG1oEQF2NGgRm1boXkSfq1o7NodBUd0Wais
 C4Qw8iOzcjjAW/RYsgu1xSVrijbobZg4NtirtuuIp0HZYrMl/saBH2buBzJfLLTBQGxGha3C3QuiD9
 UKj9WHfXJt8b2MCqImcCE8p5+kqCJX9NqDTrkImd9BaBmHHOmGXcqrmiOcpwwjD6GYy2CVnrAREXC3
 ITjbHNZhPCrtfoK0THB8pR6Z05jbXXf35ekyqmpZDqQnf/ryl3QDNy7vw65qJVKMrNCEiItAKC4XQx
 7W89jFfIfnfJLUMXY560CM93STek0ZsbgPgjR/x5j+dhYGlpw8Cbmb83OdVQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add nodes to support the Khadas TS050 panel on the
Khadas VIM3 & VIM3L boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 76 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
 3 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 16dd409051b4..81c3057143b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -98,7 +98,7 @@ &pwm_ab {
 };
 
 &pwm_AO_cd {
-	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
 	clock-names = "clkin1";
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index c9705941e4ab..0c50a32bb0c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -40,6 +40,14 @@ button-function {
 		};
 	};
 
+	panel_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_AO_cd 0 25000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <200>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -359,6 +367,23 @@ rtc: rtc@51 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	touch-controller@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <66 IRQ_TYPE_EDGE_FALLING>; /* GPIOA_5 */
+		reset-gpio = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -366,6 +391,57 @@ &ir {
 	linux,rc-map-name = "rc-khadas";
 };
 
+&mipi_dsi {
+	status = "okay";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK>,
+			  <&clkc CLKID_CTS_ENCL_SEL>,
+			  <&clkc CLKID_VCLK2_SEL>;
+	assigned-clock-parents = <0>,
+				 <&clkc CLKID_GP0_PLL>,
+				 <0>,
+				 <&clkc CLKID_VCLK2_DIV1>,
+				 <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <960000000>,
+			       <0>,
+			       <960000000>,
+			       <0>,
+			       <0>;
+
+	panel@0 {
+		compatible = "khadas,ts050";
+		reset-gpios = <&gpio_expander 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vcc_3v3>;
+		backlight = <&panel_backlight>;
+		width-mm = <64>;
+		height-mm = <118>;
+		reg = <0>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&mipi_analog_dphy {
+	status = "okay";
+};
+
+&mipi_dphy {
+	status = "okay";
+};
+
+&mipi_dsi_panel_port {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pcie {
 	reset-gpios = <&gpio GPIOA_8 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 9c0b544e2209..cb52a55ab70a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -76,7 +76,7 @@ &cpu3 {
 };
 
 &pwm_AO_cd {
-	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
 	clock-names = "clkin1";

-- 
2.34.1

