Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93D7F6E9B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA14210E7B7;
	Fri, 24 Nov 2023 08:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B900E10E7B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso15301745e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815299; x=1701420099; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
 b=vnjDHxnFCcutdQSdckz0MzMOXCs7nUNa40IpYLfXsALS2zmFuiT8F1k3ClVLdoLv7M
 6fhrOdKRETPYB5QtCXUScsCGFnrvg3XC6K4h3TtleyPj+P9KFG2xiUcUyzaA6jCDBDr7
 PUoq4xGBb3UsVJVbXbkyMxzMZXFEaCulHP320iS+UykYmQO9uq/4imirnpchpL0kNYPV
 gNrnChkYYLZ75OMCuWQrsvne1jJDwEeuIRD6epMOMBwvnv7JAsn0PqswMX5/64TPwa/r
 9BcaeW/yQ06jO5gGQ9jolqnAhQRt32CM7mgQ+qII2WlNMXEOTS8TUwKOEVZSgPijARXh
 nqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815299; x=1701420099;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
 b=rhw1AHWx1wyVp6P7Yt/l9j3iH32lXWTMA0Sp6Vs0Sw1NzoXBTtGRSLRnhf608ecW2v
 goTQG1+w7tI8QByUEt0yhgdVd6n8UOtyTJqpMDUO6kRCQNjswd8DgDJv8WEKEqhcstnS
 F3iY2YzwBMb5EzWwsEwqL1jtuLNUI3qUxWesSdy4kK25DnEU0aWz0GKoyMEzDEtDmM14
 rNiXAFXYceTwiO8l0M0pybul63KfkZ2SPiLBef+cdrHm6t7a40/Cv514jrhUT4KaBT9O
 8PDV5G1wROxoGx9aD0c22scMEiNABU+XCldbSPlFNv/NKyXCBwDCUUG48jcN1ug4vSkg
 mAEw==
X-Gm-Message-State: AOJu0YyOoR1cQYVklS2ryn9TGS8MfhsnI4Bs9TB8dndGQZm5nhK6Xokf
 h+xwbFMpItnHw8CQhVp6ZKC8JQ==
X-Google-Smtp-Source: AGHT+IFGqKrpRXgPFNo8Nkj0CWSwWM0Jqha5XIccXvobCjVcVPFXEmRnh1JCVbV1DXZZuPNvfqYsVg==
X-Received: by 2002:adf:ea8e:0:b0:332:e697:3a71 with SMTP id
 s14-20020adfea8e000000b00332e6973a71mr1425565wrm.6.1700815298893; 
 Fri, 24 Nov 2023 00:41:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:22 +0100
Subject: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vVnkVglKsbgZynNLE29purYGyqaY5Zp+VaoRvt80IUM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGyfllM1YRje8HUcgrMolQ8GmfhPjEmFfKjkobM
 v1z+k2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsgAKCRB33NvayMhJ0e6nEA
 CuiWO/LKQiz4QcUUBOWcKn2vcKoGaXbd5lgmuGG5W9x6QWdtqriO/sRYcMO6ayXATzZqtJiRrJ3lp1
 J0grDt38OP49YRZmYRmtThzUcW5CUIMzx4g6tVbVlZqS0MBP0WuGjk1RHZCACfubMDJNNxzDtl/Clq
 YIQMNIytm3iQkSd4TzVEG3S8JcisprJ8z839AfEaABbx7CmywmXrsv73LarMB7Keqx/jfYD6GjSKoZ
 hNvIePUgTGDspHspJTTUOX/mGRg7qip5ChOGcklAkHPWR9rnEVG6UMhX8uCQcLPaWdaFv0qOeoIGwR
 xuAvobmfe1vZBRCYf1jVFGRPMQ9qrLRYJLhuSyhgsEyC4k8Ml0ie9/hsqj1skwDjlseftk4MFKL1oS
 +frlZ5e0rEllrMSSMzZhx+uYNLlSzvD8b9dKfZipNXDMGAyd11BjTnU94l6ZLwolrqCLD45vXz72OI
 5aZvoE4Ac0l3Tf81K+wwtFRiUC4LlEf7xozrhbbx5GCZyt2h5CeeFx6KIE3bP+sgmSOMbil1E17fxH
 U7qsAyLvAXhyhLW2X8Obi0C0uA5AW5LsXQMl8EmJjGLJyomUa6t3yg+N1wmw/13o4YHI4atFZkeEVJ
 dMoLfwx/8UEWlRW+o1BjZ7ypcqv/xxXHTSeSthG4zknnIYHEcgqYHlFTOkTA==
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
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add nodes to support the Khadas TS050 panel on the
Khadas VIM3 & VIM3L boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
 3 files changed, 76 insertions(+), 2 deletions(-)

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
index 514a6dd4b124..aafc37863f2e 100644
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
 
@@ -358,6 +366,23 @@ rtc: rtc@51 {
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
+		reset-gpios = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -365,6 +390,55 @@ &ir {
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

