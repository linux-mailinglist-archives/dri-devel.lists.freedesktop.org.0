Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO1MFY3Kc2mQygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3117A1F4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D54510EBBC;
	Fri, 23 Jan 2026 19:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17F4710EBC0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:22:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32F8F1476;
 Fri, 23 Jan 2026 11:22:42 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B858C3F632;
 Fri, 23 Jan 2026 11:22:46 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec
 HD702E
Date: Fri, 23 Jan 2026 19:22:23 +0000
Message-Id: <2bbc2e62ae9b54ac7594355001ce2b15885d3493.1769191673.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,lists.infradead.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[sntech.de,linaro.org,chromium.org,gmail.com,ravnborg.org];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_SPAM(0.00)[0.038];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,arm.com:mid,arm.com:email,friendlyelec.com:url]
X-Rspamd-Queue-Id: DF3117A1F4
X-Rspamd-Action: no action

Add an overlay to support FriendlyElec's HD702E 7" eDP LCD touchscreen
module for the NanoPC-T4 board:

https://www.friendlyelec.com/index.php?route=product/product&path=81&product_id=230

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2:
 - Add pinctrl, tweak some naming [Doug]
 - Add main 3.3v regulator to tidy up power supplies
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 +
 .../dts/rockchip/rk3399-nanopc-t4-hd702e.dtso | 96 +++++++++++++++++++
 2 files changed, 101 insertions(+)
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
index 000000000000..66ac530392b7
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
@@ -0,0 +1,96 @@
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
+	vdd_3_3v: regulator-vdd_3_3v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd_3.3v";
+		vin-supply = <&vcc12v0_sys>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 25000 0>;
+		enable-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		default-brightness-level = <200>;
+		num-interpolated-steps = <255>;
+		pinctrl-0 = <&bl_en>;
+		pinctrl-names = "default";
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
+			backlight = <&backlight>;
+			no-hpd;
+			power-supply = <&vdd_3_3v>;
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
+		pinctrl-0 = <&touch_int &touch_rst>;
+		pinctrl-names = "default";
+		AVDD28-supply = <&vdd_3_3v>;
+		VDDIO-supply = <&vdd_3_3v>;
+	};
+};
+
+&pinctrl {
+	backlight {
+		bl_en: bl-en {
+			rockchip,pins = <4 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	touchscreen {
+		touch_int: touch-int {
+			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		touch_rst: touch-rst {
+			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.34.1

