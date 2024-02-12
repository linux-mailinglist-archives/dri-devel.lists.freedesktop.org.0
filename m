Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1257B851D41
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADCC10E7A6;
	Mon, 12 Feb 2024 18:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XYLxCIe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA13D10E7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 18:50:03 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5961a2726aaso2303705eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707763803; x=1708368603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+Zsk6HBC5/Pag8q1TO8vPoQmQRPTUSpwHWT3Y8NpYM=;
 b=XYLxCIe4u+oxS97weZCW06VHO9Ln3SqFamCz/QZ3Y+Ai84S3m0Hlo8Z9R1Xi+tW+9D
 l+9Pw8U8UsAl9Xy1CMKGfnWq8EeXr9tfQVaUE8yzzNZ54dbRudBHci2MYqvA5gpZRxTd
 4wIoSZM5rRglJLT+/6fllwqLeAXn0Lyzh4Q8z32oAXX1fDbVLgxAW94dqVIE0Xhsfyu1
 Lg1iKfVk0r5U4VXxVgAt0BnqRGsKxOIvansH+8p4AJF9EMML1jSX3fh5oWxprHpMhIMM
 VbuZbOwBJPmY2GS0URmc3LM5zUUjFsnoGDqnHbQmt2gUFjybKyA+939II5hYeu8JM2+4
 ZFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707763803; x=1708368603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+Zsk6HBC5/Pag8q1TO8vPoQmQRPTUSpwHWT3Y8NpYM=;
 b=RYFn0yRNm5pdoyU6lbJcGe8b+msvrI0+dUX4e6XuEU+zPWDErFLMQCeGTD7mbewQyL
 gMoOrvZCEuUy1ecgiHNearHNH9lm7aOTqcA8XfeDfGoj8gSztaw1HRdpzBofFaOaY84v
 aioFg6ToIYGXNZ/0SqMxYvyN18hBD5i+EbE54I4J7zlvJ9tqARM8yq+lf93qMdtVAFRL
 sF2qAm9LHxGnDkhIIFTb9I/02qg6Q4dC9BsOiQkc1IEktVHBDA3nm1y4avxf9BXfv5zi
 qPj4zWfZ9BfVOdujhGfEZiaLlgVASv1kr57uqaTgCoWh7MPuB34WMUtURoGK78KjHHrN
 SvQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzZrbD9moUx9iA0xErzFGd2EAqe3uDrasTKjYvqYR0zudGaYeRnqjtSBCW2MS7JKXOJFkWvAbRDvVh0sqbSXfMDYn4/bByJ6y0d94EfEk+
X-Gm-Message-State: AOJu0Yw/QvGWI+O/ztgoXJHyjHWYHR2gMbBlwpgGMMFrzPTrwblcgERs
 qhftTe4kDcmwTcmtp5AHnQ3zy+QcL2fFcZpKis4M+2jY11IT39Rl
X-Google-Smtp-Source: AGHT+IF2GtLHuizmdNtPctob4UCqvZ0KarbccbJZkSF7dyb21zuVDYoLXsv8+3H2OR5F+vrRXpMP7w==
X-Received: by 2002:a4a:d283:0:b0:59a:e43f:f209 with SMTP id
 h3-20020a4ad283000000b0059ae43ff209mr5458362oos.9.1707763803015; 
 Mon, 12 Feb 2024 10:50:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkcxxpuI7IaKTDaMNEyKIuCQFx+EcAU6C17eWvs29APm+/yndvP422Msq0A74VjkoeOUbqBWNE9QDMySfBvBPprHJkR8bvckjfRer6slxaVMN2IxXpXtcV6oxy5Y1kAL68GdfuZDxJVgdJfwVGKE4zic9H54ehSUzDlgvCudEqpzWZof9uTI9gvZrTp8DZo62wVSLhhpFVGfPi0kpman5aMJGUaDjJl/v46z8VtFx1liYQwed3353f8eKYhP1Xh+vE/gDNqm4UesDeDJG33KPO+y06GUMlXg4R/Yh0PEXCgKGGuEuVHZ3LUYQqXvIU+Mv6zsF8jHJo+o417O8up4w5Na96uCLGx8uI0gpOc20mC8yQzw9nttZp4OeMM9IhBy4wZHUGhFqtgssenBcRs55QqN+6clXb0ky3xCDwBFQEwUnNyGxFGwjOC/dUsfan8hTSBb6MUhfkcleCXXedhD5Qu67T8Yup6DJtfn0CI6oCTx26Zvo8B/LipsDyCwA3HKh/Z5fFvL+6oskSZlUxcI7MvLula5K3D+Deco9EXJsk81i/E3Jq0X352tDZ
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a4a3407000000b0059d5360c62esm171939ooa.11.2024.02.12.10.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 10:50:02 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: Add Powkiddy RGB10MAX3
Date: Mon, 12 Feb 2024 12:49:50 -0600
Message-Id: <20240212184950.52210-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RGB10MAX3. The Powkiddy RGB10MAX3 is a
handheld gaming device with a 720p 5.0 inch screen powered by the
Rockchip RK3566 SoC. It includes a Realtek 8723ds WiFi/BT module, 2 ADC
joysticks powered by a 4-way muxed ADC channel, and several GPIO
face buttons. There are 2 SDMMC slots (sdmmc1 and sdmmc3), 3 pwm
controlled LEDs, and the device includes 1GB of RAM.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../rockchip/rk3566-powkiddy-rgb10max3.dts    | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index a7b30e11beaf..3c4f87e4db61 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.2.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb10max3.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-x55.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
new file mode 100644
index 000000000000..fd1a01744a25
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566-powkiddy-rk2023.dtsi"
+
+/ {
+	model = "Powkiddy RGB10MAX3";
+	compatible = "powkiddy,rgb10max3", "rockchip,rk3566";
+};
+
+&bluetooth {
+	compatible = "realtek,rtl8723ds-bt";
+};
+
+&cru {
+	assigned-clocks = <&pmucru CLK_RTC_32K>, <&cru PLL_GPLL>,
+			  <&pmucru PLL_PPLL>, <&cru PLL_VPLL>;
+	assigned-clock-rates = <32768>, <1200000000>,
+			       <200000000>, <126400000>;
+};
+
+&dsi0 {
+	panel: panel@0 {
+		compatible = "powkiddy,rgb10max3-panel";
+		reg = <0>;
+		backlight = <&backlight>;
+		iovcc-supply = <&vcc3v3_lcd0_n>;
+		pinctrl-0 = <&lcd_rst>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+		rotation = <270>;
+		vcc-supply = <&vcc3v3_lcd0_n>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+};
+
+&green_led {
+	default-state = "on";
+	function = LED_FUNCTION_POWER;
+};
+
+&i2c0 {
+	vdd_cpu: regulator@40 {
+		compatible = "fcs,fan53555";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1390000>;
+		regulator-name = "vdd_cpu";
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc_sys>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&leds {
+	amber_led: led-2 {
+		color = <LED_COLOR_ID_AMBER>;
+		function = LED_FUNCTION_CHARGING;
+		max-brightness = <255>;
+		pwms = <&pwm0 0 25000 0>;
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0m1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&red_led {
+	default-state = "off";
+	function = LED_FUNCTION_STATUS;
+};
-- 
2.34.1

