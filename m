Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE00A073A5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CDF10ED5B;
	Thu,  9 Jan 2025 10:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ux23tQv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F9B10ED5B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:46:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4368a293339so9341895e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419523; x=1737024323;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vZ/yuW4Po3Wa7uQ7H3PQRzHMx7G89peGWB3JemyD704=;
 b=ux23tQv+G1XS36ROoPfN4xhPnq3Yvhs0xT8gSZ7SSpUl3bmUN9S4OLPefgGT+BZPGT
 NF4gMjfp5fdxWfYTQl4slwI/DwKvXfrcuSy9d2tK3N82eVPFBK+C4WO5UUAM6++99A7D
 38uPaP3FzxVURMLaak+8LXzYQea1qsjYrsFt4Y8eUJh9jUGDa/0n0AZ26z3P6x+7xgr6
 lcugQFnuXuMTAnfVX4MawiWsxeQRpdy2JQyq3oWUCiGE3imPmVBTkjv91taJtW4YA1JS
 71utUEGX7DACG/85uI6AaVYpM28Sqf8rWynfCVViJIOjREMnH50cob+bUKQgkiOD5Fya
 obwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419523; x=1737024323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZ/yuW4Po3Wa7uQ7H3PQRzHMx7G89peGWB3JemyD704=;
 b=AB1EVccvf+FCY5YpIpbSp8mtKyOX43U0dIRWcS5GoKo9pNkxLORLxCSq8IpzXwdrZX
 d6VXXA6MLyzew5x4avBgJdEdzHMpRxgI+3gpxDSzSNB7/Q6RwCbExHXkVtt+xvS+gmRA
 deezKhxN8NQTXZdL9R/3I5r3VE0vyaRsEflLJGMnyBkJCm/sFsGjc/UxSBsJt8IH5j6i
 33TDWaBpnhQo22bO87uc2Wy7sbpl/u8aZuUic6I5yqK5OIg17lwuMPdldjXTJt3iRTD9
 1M60cuNW9luIHCJkRfhf0cVab/c93wNpRuiJW/hr6yFBarX9jJYhzM227fV6Xm/vzVGX
 MRQw==
X-Gm-Message-State: AOJu0YwdywnTICFmz3EnsnLq/1qFaZEX86+0U0jMnkHFcClbpmS9LsiG
 zbeJEFNul3OUgSa9N/dO++D7oWGOEMI+XIxAB1DxVaSCGLB7ERhKbxHe3L7Llt5AB6ZcxaowYuc
 +z2U=
X-Gm-Gg: ASbGncvrOGHDhhEV2v82cAEupCBG9Fi6LKu7QcW00HIDGlv3n6MDuszwLxYB2gYDxpz
 XMpQ76/13JggDMaqz2jNNfC5ZV2efzZrMpWKwcXwfHNBkU61Hbme9vwu/POoRuLwhYIPaDITaad
 J0mG7Pk8U7PcZH+EHdC7grMGHxGtdliTJ+dQSpMFtoVFP51c+xrE7jpdFxOjKumZ+JKrEJYf3US
 XziL0Vi9USK23SkToGpgACyRtB8QsfOY6N6oxo38CF0zHrAFyGkotyNKRQ=
X-Google-Smtp-Source: AGHT+IGidGdff9wncpR0dAN9C5cxYpczWW5b/UgFwJxDJZWgHfv6PEiuGxVnTf1Wdj2/9iFvx/uysA==
X-Received: by 2002:a05:6000:1884:b0:385:ea2b:12cc with SMTP id
 ffacd0b85a97d-38a8730442fmr5597293f8f.13.1736419084702; 
 Thu, 09 Jan 2025 02:38:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 02:38:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:59 +0100
Subject: [PATCH v6 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7455; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=1m0qXFh3//q6MfFG9r23qNtH2/2eBC0zfGtjoyKtcMk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cEDGICc17Hemx5nRkuZ9JxbBR8+kxV7ERRfeXo
 SRi3edaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nBAAKCRArRkmdfjHURaaiEA
 DGgdGaSssQFlNm/QRhC+stujjMXix1zvGVcbmgJP0Vwm9BPsdMBhNnr4l2uoNjGKf+FBC9aewrOa8h
 LrsHrfLjCdDFtmOK7W4ANHtW9652n3BzzO4alc+uhp/JNVu+5eotfPePMi8Oa3cc7uaBVF1Mc6C4a1
 gbA+GLyAknVaPnwAZpGqcY7NYJ2AFGWne4iYCPA1JmhOQ5mZSQyww9synvAEa/l5VsQ/A/IvOBqsR3
 FO8ovLt8wfmZNSQiMUzSW2jxp2hy/k1GNnpaMYKgWqvwLn5+HQjQ0iFI4B0MaIeRe0ik1mLhBSx5kk
 FBMSQeehlbXSzKZRRF5Ri09F+BZQMuAXQDKhXCk0pnuiEqdp9wZY0Xmh3flV9egRPgLKipryhz7uvx
 1ARDq+cUxJkh1XS5GF1jV96xxek6CxyzyKE8nQJGOj+WjwmdI2CfNmCVxsydMZp9Zw0GJOwB+DtvIt
 av0KV7oABDv4Lpic+8UCP53MC/tG7opgESt4tspppWll0bSayzdWAIECVTFbiuW6snezvGoXyY4flG
 YcWElOjaN3IOS/GkNWCDzMQ/exz7JWSgYUShwVfStbTQqDmRbw00ndOkyLLERAvhVeQxzGHxnpb+Zi
 lbVyY2iH+b069r+BIe6f41P6CSgrZD/QYiZLuhfks1GXH3NnJOKLqWtQFD1A==
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 236 ++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..70bd49a9d02f 100644
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
@@ -131,6 +156,88 @@ &cpu3 {
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
@@ -161,6 +268,56 @@ &i2c0 {
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
@@ -205,6 +362,11 @@ &mt6357_pmic {
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
@@ -267,6 +429,49 @@ clk-dat-pins {
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
@@ -308,6 +513,33 @@ pins {
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
@@ -463,6 +695,10 @@ &pwm {
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

