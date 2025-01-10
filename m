Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1BA09203
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631C910F0BF;
	Fri, 10 Jan 2025 13:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IMmSdu95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB9B10F0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:31:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso15070795e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515889; x=1737120689;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=;
 b=IMmSdu95W/TW10C6ngUbkYPSnpzxx1Je52zytyVrPMlLJuvLC3EmzLQeF+ckcAms8p
 UUW84FZyDFe8U7WYwk3QdA/iV/Zsr+oFKAVytWnaftZ9k9/vhX8Z0DpF02Q/HdqCa22i
 IxSjxoAMc8CbQ941SjbhjPfrfIGbWCNEJaHJR5ZDj4UT8D5CIJzRCLz1U0yjfBNNiNEC
 qLUlQS1dLcKWs5OgtHwMk4Vh5Q5KgVfZW5PXJ1kAPoJw72LtrWoGqswJIcnBAkEFPkIg
 XyJ6tZ20nkSPA6EBPiublLdFFrf9ZbhG+AyDCRqzl76gpG/9lnZQWYwOZIj6BduzCSXf
 tSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515889; x=1737120689;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+ydmhpp1ri+ZdLuckw0JQJHXAllkad5qgHwwB9SlMQ=;
 b=oL7w7PXNSULYaqlgaj9uqab/EGfgL2VSIs4fSb8Xi/pfjs491AJhu/zhUxqpCNBzG2
 E+If3jzvpbemSTKe1ozcH6DYhqeBgL7vNyn6XIo+6DdvIsx8oC74EaRB0N1D7NqqP/r4
 nXLucPMhGI5FtpnOucsJB+ov5BWxrR0/IQSgf78DOnKvuSfhQN3oPjSVTqN91LCS5nVY
 GujhG4AWoPsQlz8F9YXsSMWV9pvmsiZDwkOoBSy2OFKeB9fEQuHxk7a5+UKIODo4W4FL
 QLgwHzshW/T4FbVSlvriR1LOEKFgra1b2nvX7OuBew9wo1m6I3ZLRnFBLe85N7Y/SKl3
 /zQA==
X-Gm-Message-State: AOJu0YzCi3Pdc6Jcn6OlVtx/cPt7MFYvZH9AEJgKJr/JN6NfC8ANOtwW
 ERcpGY68LwpctCP6u5uVJv0iKufBIee8oB1nFArtDSYvb2NoDEMIQUdlpwObyco=
X-Gm-Gg: ASbGncvq29rDtLCEf5GwDkcojsog79d7fkqBsoovpr9LbIQQpSOCGFfQDvvnyhtwSBH
 bVxAq+Ig8ynm9HDMFaxKF7C5xflQ99hbwZO/OMLoFgmbHwibyXoIUX+bppJ9BlBQo49UJucJpkn
 RmiX7jnAjs6ffCkMDhxaGpdnAEIKHc7/lHzsAxUtICJNJLQW1JnB6pP8It8rOg6KYaIZ6tpLG+1
 5yPZjM51dBP17QN7JheSEb9+K6bswJjfUKfo/0q1Yzzbf+C0rvh73lu27Co
X-Google-Smtp-Source: AGHT+IHOgBZiG80PdI6gQkHthMh4B3T84IIQ+Ibyw1a2z2GuYKQogQiNJn1l8VXim5ZVmA32oxHBEg==
X-Received: by 2002:a05:600c:5129:b0:434:a315:19c with SMTP id
 5b1f17b1804b1-436e2697002mr94418255e9.3.1736515888894; 
 Fri, 10 Jan 2025 05:31:28 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:31:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 10 Jan 2025 14:31:16 +0100
Subject: [PATCH v7 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-6-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8129; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=mR5QEUL3a78L+sYq6qQGF6wk0gc8QlcnD6i8hjpBduI=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEnfupoAl+fwmQa5qOSTPAbmJIL6hR4373elmf0
 458SX+OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURW0yEA
 CuPFV9Fo6HVc/tU0xJSXz0nxrF5RnoRINBK8NcymyFOqgQ01YsgxmbQ7EOkMpZYEC7rwdPEf6m76kL
 IO/J742uJp4PrMo8y5HIT2M7JHt2iDeN+6lqD6l2LLbrR4PB8/jbm7+MUx3sWb1glQ4gZR6+PYP2ly
 BYtfizhiXHI2fbUlTx7hAJgI4UJLH6GknFmdymks71QFUuZCagNVeLyOmOz4n8SAVG01Q3gI0wOy0O
 I/PssY++/CDoMTCrOBDCYnGZFl7c9Gn6RGqnQqib56iAqpEASBVClNvZzLI77agTswyIF9/F6qG3Mh
 DlGuJClcHtx286YeKZV434rSLbrSo2U5ekcdDXVLTeOlu5sh1DlYuqiRvFDEGNXI/D4hIno2QfP8v1
 3FBi7DJgSLQ3mOSvxnMYDGwmIR0PJwbpBs4b2p95Eqoxmh3EFsD7Zi+gGLaGOrAUG6i30g98EN+IgH
 fwJ90H/YGThYyhQjfG6fS5F5jW+TIfTIBEfKBvN0OBqOYXeUuT+bG33biHBX7STnySbNYx8Zv4n6Wg
 SZ1YJOMRWqt9HOeyPee9j6r4VSI8h6iGHLzCb8ehS2wGCL8JFzWnOwlG0SNDmbnJR+/UWWVeuIiqxJ
 178DdqVE7lEUy5fqMHXVmbU16vtFtLiOPcwjFfpGTWAUAt8ohG3kV0Soznzg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Fix a typo in the ethernet node.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 245 +++++++++++++++++++++++++++-
 1 file changed, 244 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..c72b2f6f8ef4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -27,6 +27,21 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_connector_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -104,6 +119,16 @@ sound: sound {
 		pinctrl-5 = <&aud_mosi_on_pins>;
 		mediatek,platform = <&afe>;
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+
 };
 
 &afe {
@@ -131,13 +156,102 @@ &cpu3 {
 	sram-supply = <&mt6357_vsram_proc_reg>;
 };
 
+&dither0_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	/*
+	 * Ethernet and HDMI (DPI0) are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on LAN position
+	 */
+	status = "disabled";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dpi0_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&rdma1_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dpi0_out: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&it66121_in>;
+			};
+		};
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		reg = <0>;
+		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			panel_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			dsi0_in: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dither0_out>;
+			};
+		};
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			dsi0_out: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &ethernet {
 	pinctrl-0 = <&ethernet_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&eth_phy>;
 	phy-mode = "rmii";
 	/*
-	 * Ethernet and HDMI (DSI0) are sharing pins.
+	 * Ethernet and HDMI (DPI0) are sharing pins.
 	 * Only one can be enabled at a time and require the physical switch
 	 * SW2101 to be set on LAN position
 	 * mt6357_vibr_reg and mt6357_vsim2_reg are needed to supply ethernet
@@ -161,6 +275,56 @@ &i2c0 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121_hdmi: hdmi@4c {
+		compatible = "ite,it66121";
+		reg = <0x4c>;
+		#sound-dai-cells = <0>;
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				it66121_in: endpoint@0 {
+					reg = <0>;
+					bus-width = <12>;
+					remote-endpoint = <&dpi0_out>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				hdmi_connector_out: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
@@ -205,6 +369,11 @@ &mt6357_pmic {
 	mediatek,micbias1-microvolt = <1700000>;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 &pio {
 	aud_default_pins: audiodefault-pins {
 		clk-dat-pins {
@@ -267,6 +436,49 @@ clk-dat-pins {
 		};
 	};
 
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <4>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -308,6 +520,33 @@ pins {
 		};
 	};
 
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
@@ -463,6 +702,10 @@ &pwm {
 	status = "okay";
 };
 
+&rdma1_out {
+	remote-endpoint = <&dpi0_in>;
+};
+
 &ssusb {
 	dr_mode = "otg";
 	maximum-speed = "high-speed";

-- 
2.25.1

