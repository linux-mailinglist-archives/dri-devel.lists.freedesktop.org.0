Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF053A086A2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 06:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842E610EFA7;
	Fri, 10 Jan 2025 05:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PW596HQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213F010EFA2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:39:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 856B8A4162D;
 Fri, 10 Jan 2025 05:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 563E9C4CEFB;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736487596;
 bh=9MtPhIjy6P6cV5dwakS8D2BmioMMImw5E9OwIvy4wrE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=PW596HQIG8jRxZHALIXJgzRPO188NhYDoMZvqpKkNXkupM+fnGU2YnMv+VRuMER6G
 EhTOEzUfJt9XLaPE+xwmCydL8nZbg8lhg+3PTQ/UAx1uSVwNxPpRJvkTt2WY6FZhcf
 qiBF/0HLBeahQ9anlaSEoW5UQLZgrWuECmU3jwFn74iXi7RuhWOtfa2+Ip99SSS+UO
 hE/TzAaaV04Z2QOF4ZYw0OYNUw3saWlrAeO73Rbm47wq5y1a3iuBObIN3m3cJ9WmUO
 uBgR0OfKbSx4EJ+xaxwhgK62nK7I2IpuqxWIXgDgJCLiXUfy8vel7J/p9aN1G8PzDS
 oG6M3iCOT7Ujw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDFCE77188;
 Fri, 10 Jan 2025 05:39:56 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:40:01 +0800
Subject: [PATCH 11/11] arm64: dts: amlogic: s4: add DRM support [1/1]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=6247;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=XuHerOPR1COry4ixXJL2bKpILc0PgbExEjuuK22BMs8=;
 b=PJJmhdfuiVW6iCkU5sshDWKvx3mCxxGLTp2FuK353sgQWkCzjibuRHzv/pfGySXCJx4j4+VVW
 wPBh2MRtFvvCW5LiVkBYILuGYfU6rDpUG5mlAT/xe/vVK7vzU4tPPrU
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
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
Reply-To: ao.xu@amlogic.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ao Xu <ao.xu@amlogic.com>

Add Device Tree support for the DRM subsystem on the Amlogic S4 SoC.
Enable nodes for canvas, vpu, and HDMI controllers.
Enable nodes for CVBS and HDMI bridge connector components.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |  39 +++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 121 +++++++++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 6730c44642d2910d42ec0c4adf49fefc3514dbec..e40206192ac0f7b80da23e629aa3044c04f7e969 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -129,6 +129,27 @@ vddcpu: regulator-vddcpu {
 				<699000 98>,
 				<689000 100>;
 	};
+
+	cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
 };
 
 &pwm_ef {
@@ -235,3 +256,21 @@ &ethmac {
 	phy-handle = <&internal_ephy>;
 	phy-mode = "rmii";
 };
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0675a503115e1ccbc4387c2051620..ce4a24f0880c09cf4fd06d2046b520335d62a6cd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/meson-s4-gpio.h>
 #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+#include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 #include <dt-bindings/power/meson-s4-power.h>
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 
@@ -102,6 +103,50 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			dmc: bus@36000 {
+				compatible = "simple-bus";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x36000 0x0 0x2000>;
+
+				canvas: video-lut@48 {
+					compatible = "amlogic,canvas";
+					reg = <0x0 0x48 0x0 0x14>;
+				};
+			};
+
+			hdmi_tx: hdmi-tx@300000 {
+				compatible = "amlogic,meson-s4-dw-hdmi";
+				reg = <0x0 0x300000 0x0 0x10000>;
+				interrupts = <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>;
+				resets = <&reset RESET_HDMITX_APB>,
+					 <&reset RESET_HDMITXPHY>,
+					 <&reset RESET_HDMI_TX>;
+				reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
+				clocks = <&clkc_periphs CLKID_HDMI>,
+					 <&clkc_periphs CLKID_HDMITX_APB>,
+					 <&clkc_periphs CLKID_VPU_INTR>;
+				clock-names = "isfr", "iahb", "venci";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#sound-dai-cells = <0>;
+				status = "disabled";
+
+				/* VPU VENC Input */
+				hdmi_tx_venc_port: port@0 {
+					reg = <0>;
+
+					hdmi_tx_in: endpoint {
+						remote-endpoint = <&hdmi_tx_out>;
+					};
+				};
+
+				/* TMDS Output */
+				hdmi_tx_tmds_port: port@1 {
+					reg = <1>;
+				};
+			};
+
 			clkc_periphs: clock-controller@0 {
 				compatible = "amlogic,s4-peripherals-clkc";
 				reg = <0x0 0x0 0x0 0x49c>;
@@ -584,6 +629,24 @@ mux {
 					};
 				};
 
+				hdmitx_hpd_pins: hdmitx-hpd {
+					mux {
+						groups = "hdmitx_hpd_in";
+						function = "hdmitx";
+						bias-disable;
+					};
+				};
+
+				hdmitx_ddc_pins: hdmitx-ddc {
+					mux {
+						groups = "hdmitx_sda",
+								"hdmitx_sck";
+						function = "hdmitx";
+						bias-disable;
+						drive-strength-microamp = <4000>;
+					};
+				};
+
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -848,5 +911,63 @@ emmc: mmc@fe08c000 {
 			no-sd;
 			status = "disabled";
 		};
+
+		vpu: vpu@ff000000 {
+			compatible = "amlogic,meson-s4-vpu";
+			reg = <0x0 0xff000000 0x0 0x40000>,
+				  <0x0 0xfe008000 0x0 0x2000>,
+				  <0x0 0xfe000000 0x0 0x2000>,
+				  <0x0 0xfe00c000 0x0 0x0800>,
+				  <0x0 0xfe010000 0x0 0x0100>;
+			reg-names = "vpu", "hhi", "clkctrl", "pwrctrl", "sysctrl";
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			amlogic,canvas = <&canvas>;
+			power-domains = <&pwrc PWRC_S4_VPU_HDMI_ID>;
+
+			clocks = <&clkc_periphs CLKID_VPU>,
+				 <&clkc_periphs CLKID_VAPB>;
+			clock-names = "vpu", "vapb";
+
+			/*
+			 * VPU clocking is provided by two identical clock paths
+			 * VPU_0 and VPU_1 muxed to a single clock by a glitch
+			 * free mux to safely change frequency while running.
+			 * Same for VAPB but with a final gate after the glitch free mux.
+			 */
+			assigned-clocks = <&clkc_periphs CLKID_VPU_0_SEL>,
+					  <&clkc_periphs CLKID_VPU_0>,
+					  <&clkc_periphs CLKID_VPU>, /* Glitch free mux */
+					  <&clkc_periphs CLKID_VAPB_0_SEL>,
+					  <&clkc_periphs CLKID_VAPB_0>,
+					  <&clkc_periphs CLKID_VAPB>; /* Glitch free mux */
+			assigned-clock-parents = <&clkc_periphs CLKID_FCLK_DIV3>,
+						 <0>, /* Do Nothing */
+						 <&clkc_periphs CLKID_VPU_0>,
+						 <&clkc_periphs CLKID_FCLK_DIV4>,
+						 <0>, /* Do Nothing */
+						 <&clkc_periphs CLKID_VAPB_0>;
+			assigned-clock-rates = <0>, /* Do Nothing */
+					       <666666666>,
+					       <0>, /* Do Nothing */
+					       <0>, /* Do Nothing */
+					       <250000000>,
+					       <0>; /* Do Nothing */
+
+			/* CVBS VDAC output port */
+			cvbs_vdac_port: port@0 {
+				reg = <0>;
+			};
+
+			/* HDMI-TX output port */
+			hdmi_tx_port: port@1 {
+				reg = <1>;
+
+				hdmi_tx_out: endpoint {
+					remote-endpoint = <&hdmi_tx_in>;
+				};
+			};
+		};
 	};
 };

-- 
2.43.0


