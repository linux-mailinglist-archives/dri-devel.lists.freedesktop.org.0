Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15A7008C0
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5EE10E6AF;
	Fri, 12 May 2023 13:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD91A10E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:12:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30786c87cdaso7285045f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897126; x=1686489126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E3Upg3aTXOSykFBuswINw2Ynr/KPWdYMePDYZ0wYPGo=;
 b=D18WqcyhsEHteDCWs+WiqPrx7Bfi9Z9vjJLQW9XSPMpl1L05XYddY4gGHzkNGgLYHk
 +frzBijkWqgPEz1j6GP3+EL3wqWndJDgFiCO0f2Ugd6/EUKZJo2Z3CUBbrwVobVww0AX
 z3LBTW5FfjrK+ugRkeD4Jn1x7ZKMDVJUZsCnkD6qLLTIzMKeoo4j5K1AqV5wvu4ZGA3u
 2+4ixIjvhAVoCs6XqBEZkf2Nv1P6CUkC0Jl4bLBYvUps+pGxsI1WqZoxSy0/XraTB1MU
 J5jqZfzRb5S/UTj/UXJNTxClmha7Pv0UR6wme/its+waC3R3ORMYzsrRMMAPlAE6as8n
 DJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897126; x=1686489126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3Upg3aTXOSykFBuswINw2Ynr/KPWdYMePDYZ0wYPGo=;
 b=QGZWJLERQERR/ZhJMCn5goqWrGxEtpQDE9KGdztneHNDAG/rIRgUeOUGBow9zJ2qbu
 a2FOaea2MEdxA1qbg0x8yywgPLmG3Zmr63FmeF9xtcjWczn+1gUElrAgo+fRc2Hg2Lly
 3ZPpE8JI4haUadPTNg2wOOyjl15jTRHbBApc3/wuMlk3d9paGRVHgE6Dx92+1+Xm/wlz
 oRt3Qq9Uw63tnqMd4YnEkZPYhvSU15bIAYmC7obedr70H2yoblVoLUC6vrCPN5e87Win
 3YF7dQRK5xo3WKvZWc2nkCFVeCmesjpc9o0F7c+6gzCz5m9qKMyC/ZKo3a3SGLSGaL7S
 zS4w==
X-Gm-Message-State: AC+VfDzgBfcnKhwBj37ct/60J+OEFNcZPmRVmlxZnShdCTnXcv9+hewp
 6bsflJRV+uX2zpM3cRg8zg1Kgg==
X-Google-Smtp-Source: ACHHUZ4tGXsd4xDhgDdFc7lEbJoFXvqExD7Gt0l3qykkz0SpblsqEw6QIG1AIvKGoKHKnq1EofVGEQ==
X-Received: by 2002:adf:fe45:0:b0:307:cf55:a7d8 with SMTP id
 m5-20020adffe45000000b00307cf55a7d8mr4294187wrs.42.1683897126615; 
 Fri, 12 May 2023 06:12:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:12:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:43 +0200
Subject: [PATCH v4 12/13] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-12-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3041;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZpI/PJO6Xf8WoOhiydrQaAvUUYE2Db1Ge8Vycxk5Hk4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsWS1bDD1T7c5jHtVh2mDmi/N/tULfkoyJonBy6
 aAYW1eGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FgAKCRB33NvayMhJ0X0hD/
 kBZHtVqfzeeLoJIm5iDoFYZXWOAwmCuCyXP4SkCEaW14dW6l+MHsVfy7MBBZDE2iy0PQXRuPHE3XUP
 TtXewezdiGStTjoz79vjbHJdmqA9IVLlPOO4SaH+Ch3QNHk1YW5a6Q0l3fT2DIDH3jUZL5/GN7Ykd6
 dynU4y5nuqtCwmVWe3/8iXzrKW24pPcx5Z3H73V2jvWyDve35hEVTJ4SAUHdLg5VaJOpI5YaUgCeBv
 jvgmC9Y8gszu0f5hxrLdRuIDC7O4N8V6QYDNMrqnLoDvLSRmeew8sNRGQBXt1XRBErjP/bJCSosPIc
 KY623vQ1OC987+OJ5O7W5LUxgPUsLYfxGon4u2Vw5p2dnR/aEafzbgqSPCnTpDDKFy0fM9lZCB7KD7
 5cufJ2HNshucaKwqPcv6Fd5k9wdTvs2ssLm7eo/neK+cEKzmO/3twdiQJjgUPZZ3uTD2xFMVi2Mbuk
 9P3axoWbL23M6qLbU5T/YVYgk5UrzCdiiPvqaYLIT+kU/QjzuiKg3K+vCm54rkdhzVenyrge2w/oAF
 N+khm9OMQ5XTzNcdGlN+xOedrnsn5ODaI2KQZjcrGIiKdXH8FHDPw5uQCachOzQg1jOlIxxl/rjjxI
 GT/OdXMkGmSWxikippEJd0yQb8M+T3jlhQ/j1Mt+JmeEK1+DyPS2ekpHWcvA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..a62fd3656406 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1662,9 +1662,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2151,6 +2170,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2188,6 +2216,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: mipi-dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit_clk", "px_clk";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1

