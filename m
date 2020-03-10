Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA25180C6C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EEC6E8EC;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from web0081.zxcs.nl (web0081.zxcs.nl [IPv6:2a06:2ec0:1::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65996E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L3GvXNnEXmuJVoup/eLsmOX5KMTithZdS4oNLFrbqXQ=; b=F7Bb0Wxcv1WS3CXnoWaNr9niQl
 BR+WHbdHHKQ5hZO7wNiYeqDLKkrHfX9HXY64zP42l7fa112c8NXDw9JHhNIU0MYtd35XNalL5wLlV
 8/2pEEhrBZSERBZZd0oyJGYJhnMsTz/vkreQVac0CloHXHVquk3IwnYzvpIwPL/xqpVoXnO0dzIJg
 qXQVtoMig7FYxiNXjDDphlvnGIMRlOyVwbt9pVjtSVhkrFwnWzGC8Z72YGwMtNW+HZeIeAaS63PUT
 9pjuVK2qyuaUE4QIHriRJyUW3o2hPXo4BXlfHD8yF1zrRz+IqAVqBggx1nt9sPLE3G5tGWzAUf8yt
 5ukKJuGw==;
Received: from ip565b1bc7.direct-adsl.nl ([86.91.27.199]:35430
 helo=localhost.localdomain)
 by web0081.zxcs.nl with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92.3) (envelope-from <dev@pascalroeleven.nl>)
 id 1jBc84-0017It-Hj; Tue, 10 Mar 2020 11:28:52 +0100
From: Pascal Roeleven <dev@pascalroeleven.nl>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: sun4i: Add support for Topwise A721 tablet
Date: Tue, 10 Mar 2020 11:27:24 +0100
Message-Id: <20200310102725.14591-3-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310102725.14591-1-dev@pascalroeleven.nl>
References: <20200310102725.14591-1-dev@pascalroeleven.nl>
MIME-Version: 1.0
X-Authenticated-Id: dev@pascalroeleven.nl
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: linux-sunxi@googlegroups.com, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Topwise A721/LY-F1 tablet is a tablet sold around 2012 under
different brands. The mainboard mentions A721 clearly, so this tablet
is best known under this name.

Signed-off-by: Pascal Roeleven <dev@pascalroeleven.nl>
---
 arch/arm/boot/dts/Makefile                   |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts | 302 +++++++++++++++++++
 2 files changed, 304 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 78f144e33..6e6141e00 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1040,7 +1040,8 @@ dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-olinuxino-lime.dtb \
 	sun4i-a10-pcduino.dtb \
 	sun4i-a10-pcduino2.dtb \
-	sun4i-a10-pov-protab2-ips9.dtb
+	sun4i-a10-pov-protab2-ips9.dtb \
+	sun4i-a10-topwise-a721.dtb
 dtb-$(CONFIG_MACH_SUN5I) += \
 	sun5i-a10s-auxtek-t003.dtb \
 	sun5i-a10s-auxtek-t004.dtb \
diff --git a/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts b/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts
new file mode 100644
index 000000000..ff43c9c12
--- /dev/null
+++ b/arch/arm/boot/dts/sun4i-a10-topwise-a721.dts
@@ -0,0 +1,302 @@
+/*
+ * Copyright 2020 Pascal Roeleven <dev@pascalroeleven.nl>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "sun4i-a10.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	model = "Topwise A721";
+	compatible = "topwise,a721", "allwinner,sun4i-a10";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 100000 PWM_POLARITY_INVERTED>;
+		power-supply = <&reg_vbat>;
+		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+		brightness-levels = <0 30 40 50 60 70 80 90 100>;
+		default-brightness-level = <8>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	panel: panel {
+		compatible = "starry,kr070pe2t";
+		backlight = <&backlight>;
+		power-supply = <&reg_lcd_power>;
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&tcon0_out_panel>;
+			};
+		};
+	};
+
+	reg_lcd_power: reg-lcd-power {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_power_pin>;
+		regulator-name = "reg-lcd-power";
+		gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+		enable-active-high;
+	};
+
+	reg_vbat: reg-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+};
+
+&codec {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupts = <0>;
+	};
+};
+
+#include "axp209.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	mma7660: accelerometer@4c {
+		compatible = "fsl,mma7660";
+		reg = <0x4c>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	ft5406ee8: touchscreen@38 {
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		vcc-supply = <&reg_vcc3v3>;
+	};
+};
+
+&lradc {
+	vref-supply = <&reg_ldo2>;
+	status = "okay";
+
+	button-vol-down {
+		label = "Volume Down";
+		linux,code = <KEY_VOLUMEDOWN>;
+		channel = <0>;
+		voltage = <761904>;
+	};
+
+	button-vol-up {
+		label = "Volume Up";
+		linux,code = <KEY_VOLUMEUP>;
+		channel = <0>;
+		voltage = <571428>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH01 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-ph-supply = <&reg_vcc3v3>;
+
+	lcd_power_pin: lcd-power-pin {
+		pins = "PH8";
+		function = "gpio_out";
+		bias-pull-up;
+	};
+
+	usb0_id_detect_pin: usb0-id-detect-pin {
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
+	};
+
+	usb0_vbus_detect_pin: usb0-vbus-detect-pin {
+		pins = "PH5";
+		function = "gpio_in";
+		bias-pull-down;
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin>;
+	status = "okay";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1250000>;
+	regulator-max-microvolt = <1250000>;
+	regulator-name = "vdd-int-dll";
+};
+
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_usb0_vbus {
+	status = "okay";
+};
+
+&reg_usb1_vbus {
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_panel: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
+	usb0_id_det-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_vbus_det-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
