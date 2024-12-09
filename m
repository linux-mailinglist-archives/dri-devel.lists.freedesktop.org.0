Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74DD9E93FD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE410E712;
	Mon,  9 Dec 2024 12:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="SvBsaXHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24B5410E70B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=nwbBr
 VKk+dAN+u4ZRk+RUtW0AAay6ePMRzsXnGzmP1w=; b=SvBsaXHYLYaAzuOjMUmxH
 jSgmWuRgIob488bmHIn0DiLCAC7Z7FFlvemmsnrQQC9UvVwbEL9VhMCgqoxprtCZ
 nKG7nre3rl57twrtVHzTQtt86+TTpOdlhAbHw14oRFPsAA6bIY+OdEDshkvz2Y/B
 nFYNaX5JDuDfLm2F2zzsZU=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S4;
 Mon, 09 Dec 2024 20:29:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andyshrk@163.com>
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI display for rk3588 Cool Pi
 GenBook
Date: Mon,  9 Dec 2024 20:29:12 +0800
Message-ID: <20241209122943.2781431-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1ftryDGF17Ar4rGFyrCrg_yoW8Zr1kp3
 ZrZrZ5GFn7urW3JwsxAryxJF15twsYkFW3GryfZFy7Kr47ZF9Yywn7Wrn2vFyDAFWxZ3yf
 CF1kJF1j9F1jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_R6whUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR+wXmdW3c3VqgAAsG
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

Enable hdmi display output on Cool Pi GenBook.

Signed-off-by: Andy Yan <andyshrk@163.com>
Link: https://lore.kernel.org/r/20241028123503.384866-4-andyshrk@163.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../rockchip/rk3588-coolpi-cm5-genbook.dts    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 6418286efe40d..9ec2374c6cdfa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-coolpi-cm5.dtsi"
 
 / {
@@ -35,6 +36,17 @@ charger: dc-charger {
 		gpios = <&gpio1 RK_PC0 GPIO_ACTIVE_LOW>;
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -136,6 +148,28 @@ vcc5v0_usb_host0: vcc5v0_usb30_host: vcc5v0-usb-host-regulator {
 	};
 };
 
+/* HDMI CEC is not used */
+&hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c4 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -347,3 +381,18 @@ &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.34.1

