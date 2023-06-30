Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26DF743FC6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503B110E4BD;
	Fri, 30 Jun 2023 16:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0232D10E4BB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso3363973e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142567; x=1690734567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
 b=wAwFQV2X9ECaKkoshte0FA6EwAdA+wThHG6n4mdsc59MsjglCJEkXxRlC94ukwVOBe
 mRyOCZP4jEO8ViSqYR8FmvGLDRMIfHx9S//ap/Pm+VqxgjgJ/hVlJgpdanethZkmWfbD
 7iIFWm4kNZCLPzOtcicIRLv+OWJRcqJFshzUG7F4kuLfWyi0m3GHE98Ba9QptpU/0avE
 s1NojOtNCJb7q2ttzoJXYrhB94MWr7lacUz1/3TdbPybOGe0fB/Z+QAcUbeZDacx1bBu
 HZxIccG04I3DKN+cNSsR2U22j8+swSG/G/9FNqdOVhoew1ZvM0MINy7Pj/VA2wNopxHe
 xZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142567; x=1690734567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
 b=bHo8D2BZyB+OtNwi12P/HSHVjnWQi/gte0jL1uQR4rbiABggw6FpheFQy3PtCMu/Py
 F/nvwz8n8OC5s7K5jjPXqMywM0nPEQSHm/xy1nUaGoSbtKqEn7Xz34OCalBBQo08zxRP
 mcBweGVjcwwe1o+/LRNQisAVGERLrPRKxWkN3ikziub41nGWT7MiggzNH9OmX5ZeG9kc
 Gjg+zOkpdwPShdeHoUqS0Z909Oglj5piH+git2tN8VzxvC08pynxSRHzUdcrqdmlCvOD
 B8CFB17wHL76QSCV/sSeN5dM/S12WfDZtL0XF/XrmS56qO/rYjh/CeLo+CAIouAUxoAE
 bavw==
X-Gm-Message-State: ABy/qLbIZccQp6JkyswfXjHREGprc4IBcLKwMvlObfneftd49jycJJYF
 LG/GDMCsQVp7OQ8rYFmiHepMXQ==
X-Google-Smtp-Source: APBJJlEB8ucPoXGV16yz56034eKMOn4SFzQlIaE1i/+P76o9qaw4cJOA5TmZjHYIL0OdCNFc7mdz5Q==
X-Received: by 2002:a05:6512:328b:b0:4f8:7697:5207 with SMTP id
 p11-20020a056512328b00b004f876975207mr2421807lfe.23.1688142567477; 
 Fri, 30 Jun 2023 09:29:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:14 +0200
Subject: [PATCH v6 7/9] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-7-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V+HaYnTuv4vcDBK+f0uefqR8qZNKRB03xg8yBzcvNP8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLcEQZ3ts9MJx1UlfFGAn5UARcUcUncyzD3K7SE
 EYPSpUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3AAKCRB33NvayMhJ0Z5TD/
 9sOOkJl0iyml3TJxxQ4hgNTw0eO+RWMM+6iHVcPJzqIxwDlJOEhURsefVMiAlnHaxPmajztLpiiwNz
 xdQhv9aqamZjhnIYnXWZ3qKEp47AL6QXTuBHokKhVCmp7i6LHtbID+gT486lVzcKGvufg+/oPy6hsC
 ikJ2kC2UTUDahdSuoz4XU547nEuXluEF1juQue6sFcTl1FfmlxbUghOsb0fvYuTsTE+qpFBrCqq3qq
 VCI+wgFJk+bVV8idvarZYMxBp04b/9k4MBMVOie1LNxcD+UXd2zgFOjq0kmIiCYLavueKjLkhmbekB
 YF02VFWGGPW/9nsxw/sV7TBNJDPZ0BOnAy67cAu3DkLved6ciadFovsH0C5/pFHAaZtM+pOWAnisN6
 ubViXFuNq+pLJHiHz0qQ+/I4bU5vFu4IlRgkv7IbxmIgN1y/1RUDcztNhsV9Z5UHiYpcGtzeyZWsAS
 5OTUryRr7e1zKQAfV0k5xQwnCimN99H+Uo4suU6X4fbStPNP0mMyZoz0CRUgi+C8qVB9EX05nWibnq
 6U/IYMFWMLQ9YX91KAaGnEE2xC+2m5Nzle4Fd3wt8Z9v0KyCq5UQp1CM7hs93rMe/tAhUIyUiffqV1
 jIyMIDwSQCCld71vTIo9taC+ySAcciFnrFhJOpV1XAzxBTQBwyFe64i6rjdA==
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

