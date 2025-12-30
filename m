Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59561CEA4E8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B562F10E6E3;
	Tue, 30 Dec 2025 17:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEF5010E763
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:20:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 833AB1650;
 Tue, 30 Dec 2025 09:20:52 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75E623F63F;
 Tue, 30 Dec 2025 09:20:57 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
Date: Tue, 30 Dec 2025 17:20:34 +0000
Message-Id: <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
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

Add an overlay to support FriendlyElec's HD702E 7" eDP LCD touchscreen
module for the NanoPC-T4 board:

https://www.friendlyelec.com/index.php?route=product/product&path=81&product_id=230

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3399-nanopc-t4-hd702e.dtso | 62 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index dbdda9783e93..4ab58a5961aa 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -62,6 +62,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-khadas-edge-v.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-kobol-helios64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-leez-p710.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4-hd702e.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-neo4.dtb
@@ -238,6 +239,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou-haikou-video-demo.dtb
 px30-ringneck-haikou-haikou-video-demo-dtbs := px30-ringneck-haikou.dtb \
 	px30-ringneck-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4-hd702e.dtb
+rk3399-nanopc-t4-hd702e-dtbs := rk3399-nanopc-t4.dtb \
+	rk3399-nanopc-t4-hd702e.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
new file mode 100644
index 000000000000..ab643a1edd7b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FriendlyElec HD702E LCD on NanoPC-T4 board
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	pwm_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 25000 0>;
+		enable-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		default-brightness-level = <200>;
+		num-interpolated-steps = <255>;
+	};
+};
+
+&edp {
+	force-hpd;
+	status = "okay";
+
+	aux-bus {
+		edp-panel {
+			compatible = "friendlyarm,hd702e";
+			backlight = <&pwm_bl>;
+			no-hpd;
+			power-supply = <&vcc12v0_sys>;
+
+			port {
+				panel_in_edp: endpoint {
+					remote-endpoint = <&edp_out_panel>;
+				};
+			};
+		};
+	};
+};
+
+&edp_out {
+	edp_out_panel: endpoint {
+		remote-endpoint = <&panel_in_edp>;
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.34.1

