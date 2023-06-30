Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F0743FCD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B367510E4BE;
	Fri, 30 Jun 2023 16:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4579410E4B6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-313e34ab99fso2228227f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142566; x=1690734566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
 b=FMMaaVIczRbZN8SKA6J+30ZFKoazIu5NC0oiq3Q0ClUKAvEoWt9mMIZiOdmwBajbOu
 307ahCyBT5fn3fYQ07vMbq0vz2qyRKHYnzzmRhoM06KNXLx9FzgEmOAOfd8ApeGNLkeG
 8gHgMyhYf+28qDgn4ekUQNSHFZOlPUismy15ZpvHNTiMHSKeqXtHPuVi4cpwFk6dVWcg
 zFsGZhuQ/gb0mHxFx40KSN5OGO9WemmZXGHPIRoQKVpA6sjLSYLBddN61I3dKDIaGsbz
 2xp85rygEzhhcpHeIxJKEHTzfs+cgcRT0ayifZZ3D28A7X9NuFxoxhar5GLyRrt4Trst
 rjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142566; x=1690734566;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
 b=RtPYu9lHmWTzrXG90An2p4I+hrQHGNWKRo7XA2sGQ9Iiggad3fL2qF7o2fE93McZMn
 V4WkO6vqzjg2N4x/5YYSoHZbhQpqNgGWmn/Chv0shLWiZ5NlER4Sw6T7V67Mc4MpFSa4
 8oVnIY/C0vxcH3tchOiAeURQ2w2vwoIICpWBCqLSvwvDbhiLXxxWlRXZXzPT1iIeHcZ8
 2TrDVnq4+0ar0Ijmw/n3gGFSKycA4uFs9i2AeHK0RHiq+R+NLdcsiU49VAh7s8HmeVvG
 e/KdgfZJdWT90s1RxGM5YdzfZJu4GuVw4w39kd+ziVqD4VGmng3T7z07jM7huvRINnwE
 xl/Q==
X-Gm-Message-State: ABy/qLanpACvvDIBtGKXJeaOcHqPd8CDcU8O40so1ksTJm4cB0XLlIsB
 9RjwGgHOJf2aM+6WASq8wff8Hw==
X-Google-Smtp-Source: APBJJlG3GF1tCE6KG+x4wKIY6bVSokF/lpnQ2jIzxeOEbArYnqL4o525ZbGRuw0e0jhFRVd2PQVTUA==
X-Received: by 2002:a5d:6305:0:b0:314:1e86:e75d with SMTP id
 i5-20020a5d6305000000b003141e86e75dmr2395645wru.34.1688142566368; 
 Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:13 +0200
Subject: [PATCH v6 6/9] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-6-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLcsgk052mDMf07RozlmP66QINWAsClClpnlhPk
 T2Rz2FeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3AAKCRB33NvayMhJ0U3yEA
 CXIKNEzyskErTqAdrVua2iL6TY2Dk7FV7/gCiPutuOzDx74zBLEYlYDBuYYv3fK/7nCb9F8+p2JlKt
 0Hecw1k/oaijFIwkYhjvjzcLlqFeGNFL/19V+bX0K5O6QBz4Gcqprb98BhFO8gXpZ0FitFjBvSCSVT
 dFezRKQcdHQBMOG7/UuIhi9tBG1YA7ao1JjcMBhjBwVF7gO7csys6t3nqR3DtkFivDvaEFr5JFuRjF
 dG7SduVaEWSftMqI3vspv4MATtRdGOmOOQ1H5eBlg9b04KROtt4DRgbq/ktLzWLvQLZN/bPhb6TxBH
 DtaiCl1kpqyboH2h/KEwyzqfyi6dwdBdk8VW5YLqVfXRG3ECYuxCm5SxitXFdc17uKIU2m5A7zQgKM
 Ag9nAR8Rd6Zh2MOvsgIb5K9BwONDuDtFx0sWp9uLOps7j9WqVCPXcR6lPHiKSIZxVlYh4ezpQPmsNU
 u8A8h34UAHGpTtl+Mzj4AM1lX4l96BNcmBLpgedZULLOwuFWG/VJYJIR4eciOunxbY2gM+0apP5Ku1
 nErGm0MiQ0k43/cdtiq3QItMsqlhyILnaraJrhm8OViStzEHV5l2PYGCuPU3+CVWFhJvzZ6uWyZnOg
 ECi8OLjsnWZmZQnwjxnNfPN/7BZGOoure0hEIzDoDFKKhUDG6aTgZbNNQXXA==
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
index 0c49655cc90c..e2d890e72940 100644
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
+				clock-names = "pclk", "bit", "px";
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

