Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FEEB058D4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C676B10E598;
	Tue, 15 Jul 2025 11:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="bZmRwCJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D890B10E598
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752579063;
 bh=7XLP8/2EgWjHsxetg5+9fnw9v4HpdEFPJtMEGTR/Kxc=;
 h=From:To:Subject:Date:Message-Id;
 b=bZmRwCJtlKRHRrCD3It24cawlC9w9ixAKEq0dlBnbuvMzC2KTklIh+8gVnbVZCPG8
 lyqYFkYU9fN01+XjlwV/6UhuHzzRjNo3a9kHUiJ3wXHCwPaPCnCW+8P4tfv8tcBzjS
 RqJUiyK6J2h8obW3CAOKqpAFb8wIVilw5BVpFR5g=
X-QQ-mid: zesmtpsz3t1752578721ta9aaee12
X-QQ-Originating-IP: ziPpytnZRUvE2L1gAOs1LkViZuJVWgTk5QV/nyGdLmA=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 19:25:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3805871955137023780
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support for
 DisplayPort
Date: Tue, 15 Jul 2025 19:24:56 +0800
Message-Id: <20250715112456.101-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250715112456.101-1-kernel@airkyi.com>
References: <20250715112456.101-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N2bAIxLK0elnxzwM3GPcOMotvexIcAj3OtKFCTTyF6Yc9XfEHGd2ujAz
 9sGeNSiU67i35f0HM9Z0MlLzvHYkc9riGlw4hCHtYsIDux2PnI99X43E5wfCTDWw5SL/J0M
 ltSJD9juF8wiTwkTidyTpmN/H4/hOPuwDOxf5P3IdQFndb3RmX0QNXIpxLpbuye3SXWhdiu
 8EfbD0LCf9lIorQ7BQDKP7KkI/5HPiuerpw0RDCQ5ubaQopF4v/hAkxcAE7ZT20mt4U/ntg
 WEtf4Zhcah/lxooGN/Pel0hfkliz9tiVcODR1gI5QPQQIbGFEVv6ffH4LL88MHqRY3SwJfd
 0iNpzOuUQdjJjyTU7NlB523HPPxD/Ct3uouywARmS3HEN72GCDlgucVaIZwG0HHqwizFL4d
 ZwFrCO6eBfVzSn5Pv/u0uHIksLvxgHy9Y/gIBuGCZn+8NI87SzzEC1cL8CBiczTv5figNZC
 6ONqdcWWKQSO10FIQrn8KQzg5lAJtkJxDHxn6ZEfJlKu1j1DFUhSofjOzSWFMYDPMsZ5tf/
 SBQ3Jmt/6FdFkF3Qy9G3xWwvLiRT3k02qoYlQNKWMKCAS1+aio6d3n3BRzpPq5qa1buNOk7
 M0dmcmR8IghkZzR7r0lDZ8n9Sb5E26wmA7/Er9SWuOOamz437KvICkTrPHJzmbbf5k5QYn3
 eIP0PUOCMrQVBhT2zCIWganuqUcq4GwTyEVvqpigHvHwgQMsoVPBE6ApR83f0LE36DMe041
 s4Djb+rbS9L4MIKCQBLPCpd7VxMaU6jcTEF1pKYEAcLKr8VqzScwUWYdMZ2HphJD8JpA2Zf
 hpws4LWC+KMimv9gKFmLaIzfEBlNTwHzfDcwCpxyaYGLQwikIywCHpZ8k8ew1Dp0F/wG1Wh
 tWVzh0TRdBZnfvhew/MxQBm50pNXtpZnAgu1S1o3Vh2vwDrXCIeaV5ixBPZZgki2eTltTj6
 IaD+VX2UNFQP98X5rMIWmKS+duAEftukgi60EKXiXwYpe7aD4wO3iNTLf
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 EVB IND board has a Type-C interface DisplayPort.
It use fusb302 chip as Type-C controller.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
index 70aee1ab904c..9ceda32456a0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/usb/pd.h>
 #include "rk3399.dtsi"
 
 / {
@@ -19,6 +20,16 @@ chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	vbus_typec: vbus-typec-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_typec0_en>;
+		regulator-name = "vbus_typec";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc5v0_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -29,6 +40,16 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 		regulator-max-microvolt = <5000000>;
 		regulator-min-microvolt = <5000000>;
 	};
+
+	sound: sound {
+		compatible = "rockchip,rk3399-gru-sound";
+		rockchip,cpu = <&i2s0 &spdif>;
+	};
+};
+
+&cdn_dp {
+	status = "okay";
+	phys = <&tcphy0_dp>;
 };
 
 &cpu_b0 {
@@ -341,6 +362,66 @@ regulator-state-mem {
 	};
 };
 
+&i2c4 {
+	i2c-scl-rising-time-ns = <475>;
+	i2c-scl-falling-time-ns = <26>;
+	status = "okay";
+
+	usbc0: fusb302@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			op-sink-microwatt = <1000000>;
+			sink-pdos =
+				<PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
+
+			displayport = <&cdn_dp>;
+
+			altmodes {
+				displayport {
+					svid = /bits/ 16 <0xff01>;
+					vdo = <0xffffffff>;
+				};
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&tcphy0_orientation_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					dp_mode_sw: endpoint {
+						remote-endpoint = <&tcphy_dp_altmode_switch>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2s2 {
 	status = "okay";
 };
@@ -354,6 +435,16 @@ &io_domains {
 };
 
 &pinctrl {
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins = <1 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vcc5v0_typec0_en: vcc5v0-typec0-en {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -400,8 +491,35 @@ &sdmmc {
 	status = "okay";
 };
 
+&sound {
+	rockchip,codec = <&cdn_dp>;
+	status = "okay";
+};
+
+&spdif {
+	status = "okay";
+};
+
 &tcphy0 {
+	mode-switch;
+	orientation-switch;
 	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		tcphy0_orientation_switch: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+
+		tcphy_dp_altmode_switch: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dp_mode_sw>;
+		};
+	};
+
 };
 
 &tcphy1 {
@@ -461,6 +579,7 @@ &usb_host1_ohci {
 };
 
 &usbdrd_dwc3_0 {
+	usb-role-switch;
 	status = "okay";
 };
 
-- 
2.49.0

