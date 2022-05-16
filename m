Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EA52B318
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC520113DEA;
	Wed, 18 May 2022 07:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D70F10EBE6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 19:39:11 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gh6so30729237ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJNYDk4SvD1YtpXR0oj8NsF6HENGwzWTt8Lj8cCkpNo=;
 b=GfpaCn3LMRvcWxUW26o8K7i1OgF9OOlb+NMttVfSDfnGCO1x92FO4XgTiW/aE8cK/a
 6EPLXmEh5UIZPGY4T7AjjkJSyPvSKwZzGg/WsQlcpdF+aQT1oaX15KSys6jajMRl4daE
 Dkb/qDAMY2pyPHhL0AS/NHTNs9O4/rHbQSL9QWD2/uXlhfBPY67M6Fvrt62I4p3t1z6t
 3MrdJV2MYZJtHqV7xx+vuMYj9PN+WgalQiRsAqj4e6Ge0FxL2FgyQ+gqB7U1FYmflxs8
 wEL79+0JU40DzFh9awCDRLt/FOmSQs2etsHFSNeG/jjYqyz448nzVYV/ZhAsL9/nmz7/
 UluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJNYDk4SvD1YtpXR0oj8NsF6HENGwzWTt8Lj8cCkpNo=;
 b=7vLJt+RHi4WD08tStgi/7R5j1D0r+4xIFnFyS2ymlv/cgM3NdBc0NBfg0MzSHghvlt
 wHBQ+EPN3QoLxpP0Dqi8xirGWd2ekePinHx2uSuKVUUGlzCx15HWtv7+jOgW4UQu4WDe
 Qrk0P0HuDovsayT5s61SDY/jB21wOcYat+lx3H0bU4lw1dgEg3MpVRuZkTK+O975Lf3r
 rOZKY0rBXvUdNVOkESlxrX/nXzEbfmxzTeHC0OkjGeVg5OkiZQsvd0SUH/7KZ2e7rRCa
 lOVmD2tWUYr6kMyHwq8Pq7WNQYbt0leP//gQsjGj3mAYdXjfWEs8byefdmxRaM9vd24x
 tqKw==
X-Gm-Message-State: AOAM533l6TzWL/Ut2Ft4k/iHpFhoAXAcxr6yVNRyzBjXDnu4kcB1gIvg
 UlJRGVDj7r1691zKsdhhmsA=
X-Google-Smtp-Source: ABdhPJxoPobHPfYM65bQ9gkqOcRe7+3noo9i4Ud/hXXldy2+MIeYBuZ0nPEvonOeOo7whoyTzmPsMg==
X-Received: by 2002:a17:907:6d25:b0:6f4:d753:f250 with SMTP id
 sa37-20020a1709076d2500b006f4d753f250mr16485319ejc.580.1652729950114; 
 Mon, 16 May 2022 12:39:10 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170907272300b006f3ef214e6fsm85180ejl.213.2022.05.16.12.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 12:39:09 -0700 (PDT)
From: =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: exynos: add panel and backlight to p4note
Date: Mon, 16 May 2022 21:37:09 +0200
Message-Id: <20220516193709.10037-3-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add configuration for the LTL101AL01 panel and a pwm backlight to drive
the display in the p4note devices.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 84 ++++++++++++++++++++----
 1 file changed, 71 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 97f131b1014b..1fd051b52387 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -106,6 +106,16 @@ voltage-regulator-3 {
 		regulator-always-on;
 	};
 
+	panel_vdd: voltage-regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_ENABLE";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_enable>;
+		gpios = <&gpc0 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
 	wlan_pwrseq: sdhci3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpm3 5 GPIO_ACTIVE_LOW>;
@@ -216,6 +226,32 @@ power_supply: charger@6 {
 			monitored-battery = <&battery_cell>;
 		};
 	};
+
+	panel {
+		compatible = "samsung,ltl101al01";
+		pinctrl-0 = <&lvds_nshdn>;
+		pinctrl-names = "default";
+		power-supply = <&panel_vdd>;
+		enable-gpios = <&gpm0 5 GPIO_ACTIVE_HIGH>;
+		backlight = <&backlight>;
+
+		port {
+			lcd_ep: endpoint {
+				remote-endpoint = <&fimd_ep>;
+			};
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-0 = <&led_bl_reset>;
+		pinctrl-names = "default";
+		enable-gpios = <&gpm0 1 GPIO_ACTIVE_HIGH>;
+		pwms = <&pwm 1 78770 0>;
+		brightness-levels = <0 48 128 255>;
+		num-interpolated-steps = <8>;
+		default-brightness-level = <12>;
+	};
 };
 
 &adc {
@@ -295,22 +331,19 @@ &exynos_usbphy {
 };
 
 &fimd {
-	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
+	pinctrl-0 = <&lcd_clk &lcd_data24>;
 	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 
-	display-timings {
-		timing0 {
-			clock-frequency = <66666666>;
-			hactive = <1280>;
-			vactive = <800>;
-			hfront-porch = <18>;
-			hback-porch = <36>;
-			hsync-len = <16>;
-			vback-porch = <16>;
-			vfront-porch = <4>;
-			vsync-len = <3>;
-			hsync-active = <1>;
+	samsung,invert-vclk;
+
+	port@3 {
+		reg = <3>;
+
+		fimd_ep: endpoint {
+			remote-endpoint = <&lcd_ep>;
 		};
 	};
 };
@@ -687,6 +720,12 @@ tsp_reg_gpio_3: tsp-reg-gpio-3-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	lcd_enable: lcd-enable-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	sleep0: sleep-state {
 		PIN_SLP(gpa0-0, INPUT, NONE);
 		PIN_SLP(gpa0-1, OUT0, NONE);
@@ -809,12 +848,24 @@ uart_sel: uart-sel-pins {
 		/* 0 = CP, 1 = AP (serial output) */
 	};
 
+	led_bl_reset: led-bl-reset-pins {
+		samsung,pins = "gpm0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	tsp_rst: tsp-rst-pins {
 		samsung,pins = "gpm0-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	lvds_nshdn: lvds-nshdn-pins {
+		samsung,pins = "gpm0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	tsp_irq: tsp-irq-pins {
 		samsung,pins = "gpm2-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
@@ -1100,6 +1151,13 @@ &pmu_system_controller {
 	assigned-clock-parents = <&clock CLK_XUSBXTI>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm1_out>;
+	pinctrl-names = "default";
+	samsung,pwm-outputs = <1>;
+	status = "okay";
+};
+
 &rtc {
 	clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
 	clock-names = "rtc", "rtc_src";
-- 
2.25.1

