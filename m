Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973BAAFB938
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F162910E4EF;
	Mon,  7 Jul 2025 16:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="yveiteqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418F610E4EF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=FBkOzD22uC8TIZOltlSVNHsJqb3ZyD7/5ACUKJRygzc=; b=yveiteqGRw+GqinEANa2wqFgJC
 NNpONaZ55YGsw8HuCGIfqEktn/gV9sC16ymuH5WCeG70RYOSpsYsZBHpyNLk9oOp5GgcBNxHc2w7s
 pfXFhhEavvPZYn7gywwDbQpMhpLu97n0XlUqA8+zBYhyIQy2fVsT3YyNKR+qwbQBk9YNlMzzgsLFk
 XtcatsDyQqbxq8SlHKfFgiodjFVamhh2mPD8wjDcPQeEFuzMrhahHsKLXtJz0qyzoYv3s3/c280Wz
 6YwQ/2jtexiXlZWSuMUk8aNJkozqr+++nogYOt6M1+wTZxnt7xp0BKpbitr46Jev5LtQeWLcqA4YN
 V4iaKzVA==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1y-0004yl-7q; Mon, 07 Jul 2025 18:49:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 13/13] arm64: dts: rockchip: add dm-m10r800-v3s overlay for
 roc-rk3576-pc
Date: Mon,  7 Jul 2025 18:49:06 +0200
Message-ID: <20250707164906.1445288-14-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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

Add DT-overlay for the DM-M10R800-V3S display module when connected to
the ROC-RK3576-PC board. It contains a bestar,bsd1218-a101kl68 display
and a Goodix GT911 touchscreen in one enclosed case.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3576-roc-pc-dm-m10r800-v3s.dtso         | 134 ++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db47..f320dd2b5f6f 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -145,6 +145,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc-dm-m10r800-v3s.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
@@ -225,6 +226,10 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc-dm-m10r800-v3s.dtb
+rk3576-roc-pc-dm-m10r800-v3s-dtbs := rk3576-roc-pc.dtb \
+	rk3576-roc-pc-dm-m10r800-v3s.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso
new file mode 100644
index 000000000000..2817cc585c3a
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc-dm-m10r800-v3s.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Heiko Stuebner <heiko@sntech.de>
+ *
+ * DM-M10R800-V3S display module for ROC-RK3576-PC
+ * https://en.t-firefly.com/doc/download/303.html
+ *
+ * DT-overlay for the DM-M10R800-V3S display module when connected to a
+ * ROC-RK3576-PC board. It contains a bestar,bsd1218-a101kl68 display
+ * and a Goodix GT911 touchscreen in one enclosed case.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		enable-gpios = <&gpio3 RK_PA2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&mipi_bl_en>;
+		pwms = <&pwm1_6ch_1 0 50000 1>;
+	};
+
+	vcc_tp: regulator-vcc-tp {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-tp";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		vin-supply = <&vcc5v0_device_s0>;
+	};
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "bestar,bsd1218-a101kl68", "ilitek,ili9881c";
+		reg = <0>;
+		backlight = <&backlight>;
+		power-supply = <&vcc3v3_lcd_s0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_reset_l>;
+		reset-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_LOW>;
+
+		port {
+			mipi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi_in {
+	dsi_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dsi>;
+	};
+};
+
+&dsi_out {
+	dsi_out_panel: endpoint {
+		remote-endpoint = <&mipi_panel_in>;
+	};
+};
+
+&i2c0 {
+	/* GT911 is limited to 400KHz */
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m1_xfer>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@14 {
+		compatible = "goodix,gt911";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_int>, <&touch_reset>;
+		reset-gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&vcc_tp>;
+		VDDIO-supply = <&vcc3v3_lcd_s0>;
+	};
+};
+
+&mipidcphy {
+	status = "okay";
+};
+
+&pinctrl {
+	dsi {
+		lcd_reset_l: lcd-reset-l {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		mipi_bl_en: mipi-bl-en {
+			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	touch {
+		touch_int: touch-int {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		touch_reset: touch-reset {
+			rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm1_6ch_1 {
+	status = "okay";
+};
+
+&vp1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi_in_vp1>;
+	};
+};
-- 
2.47.2

