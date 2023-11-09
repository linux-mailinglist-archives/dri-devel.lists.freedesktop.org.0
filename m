Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A341A7E660D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E1910E1F4;
	Thu,  9 Nov 2023 09:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AE010E1EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:29 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso4058895e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520427; x=1700125227; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
 b=VOe27c5fu9aVcdA8ku3Txl2WcOEO7bUSdGfyaJheSwRoxS/J8rBSRfSL8pvWEBiUog
 riK2suOvsD5WzQXw7gVfHNMly2wpBzlnEnieQ2AIWSGFDPbFGKprTLdWmEveTfAQSgTT
 U/6U1PeyAdXMioVYepPFksa0UlTHBOt/R5siwpCaVsvyiVqA+UQ+09n0qJ3jJIb/gWFI
 rMGCUYG1TUJeNpUWdqWEr9ak6hjxu2tDepKNtKZZs3Y/Y0bUuP26vfpnpargOmHl9CS+
 w7CTbFrDoCYA1h8CAAqkLgwx28v6YFxjSLsv9o/SUp2qHlC4S9RYEi52wbfzjO/tttl+
 /N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520427; x=1700125227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
 b=Fnb7RY0ViSoDjnsGWS9E3MCKgays89Qj30So1yCBnoDz4dgkB4+SHRUZH48+aA6jSh
 mfIKZEz1FeeAYvRZmg85arIEhM8Kquj/9gefTj39YqPgyy88xDH/1w3ErZCAzuNQshOc
 LF1FxrUMBb06TpHcUsz0m3tdD8F8knCVIVSGx1eUZNuTycYEU3IXidzFEv/lG/tsWQ8M
 MOb/UAiiX5UpUckb9D+7zDcPzlzS5UqqeYL7I7v+0p+Gs9X9nCPSLvKJIpbBOW/rQM0Y
 NlISzTDTDo864/el6lZ5h1NTwlgvNzG7rX7MwzrN8eVcCq9VyRKyKx+NQWTQowE9aH/6
 GS/Q==
X-Gm-Message-State: AOJu0YyDGrDAAyQA/4fv/mJn5NnptmaAoGgQXqWkoPaXy2Nin/8OO0tC
 b2Hhv3eZ8kO0fmGCktHrQHVJZQ==
X-Google-Smtp-Source: AGHT+IF0xP5+yIkmAq8ahEhbWDMWN7ty20hNDaDH1WsPO+9Kqo9njJ70NzUsnTYmAyzud0azPDvLIA==
X-Received: by 2002:a05:600c:20d:b0:409:5a92:471d with SMTP id
 13-20020a05600c020d00b004095a92471dmr4161479wmi.22.1699520427462; 
 Thu, 09 Nov 2023 01:00:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:12 +0100
Subject: [PATCH v8 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-11-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vVnkVglKsbgZynNLE29purYGyqaY5Zp+VaoRvt80IUM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+atadrtQqL4L7bB5Ny34nlZBRjSTy5m64HnPV1
 2cDnMoyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmgAKCRB33NvayMhJ0ZYID/
 0eddIXO0SwB4RK3/Cc9ULGqKnboAc6ffNSD+5548GcNIdakSOsb3os2/ZEKvQh7PxtccTpwHIPGQ/j
 EXHxheqM0yVmy6KZrdMAZZB8Ft5zZNQsmQg87c90fOFq9fy64awo4odlqLjDD+5IugUEAC4CEK9GiG
 R0hRAMYyHqHAI594nr5JKhdhHb4eRwWcClo16qPyXbM1F0fXLe6wMisVCnsr3vqo2/lQF8AsTPP8Za
 ihbIw2DIhcSCwb47rFElxlCVA3vhvqQaocMge7Ydq4WWYSC/OgsFigYS4OQoipLc+EghxZ38T+TM0u
 jEEijZZiARf0EaFfFEvQsJQDct7hvlfoszKwC9hW7MAafHjulVEa/sfdeKrVoIob1Exb2eoz2ML+XC
 eZFSZ0OdFk+xAfXYFIx/oMGnDwQw8dHgoJ29JF0JuQjcRwt4ZzPa4a1Dgf5hhbR39rn39nIWkfNp2f
 lcPDKqdgl1Kpq1d4/2GMHwC50rpTlwypKgkYjE0e08ILe1gDtYQ/yj00mtc0MtymMAUsK1hfAwDjCH
 PZnujc0b/kUgxVIvSaR3DWrvYD6dlzlCV5kaz7GTHWnm/V5iXfNV7QVPyi4Sao1V1B9B89+4qsOPXM
 Gs+HVyWQIQLzkmGHZZGzabIZomGa23pp4TnzjYlZwIdA0bVQuusP0KHpVXdg==
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

