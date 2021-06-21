Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71403AE428
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28B589E0D;
	Mon, 21 Jun 2021 07:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4389E0D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:41 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t13so1627610pgu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTGm4JdvD3Vra2uimR9VdWCccBLfDRHg1bYd/TgBubU=;
 b=PFJ+240oebdQnrjo/n/RAYbIElojZ4FKbPovvcLEqUz4yBbkyVuFvAOGUWXkm30rfe
 75bW0/Ce4RgwAgC4v3Vrk7kmCKD6qi1mkuF5f0eGUUYyW6TGPpMB4W5gED+bP1XNgU3J
 fcUqMyXjuP9ETuCKYHTX4nrwrmYudt7xQPSBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTGm4JdvD3Vra2uimR9VdWCccBLfDRHg1bYd/TgBubU=;
 b=oSPuyzALRPKbv4VsjTKOkn7B8vYwqJ5KlsyR1g4VCUzW+dL6t//YD3WQHn6SYZ5Y6I
 jnQflR/0tqDDAbI2BMavyKqQa123nr4sKpNbIEpUgPwOJELHrqgI3/ZpNjcUUVKc1XQZ
 DFyUaulPJARVvKDl2dOS9wUZ2vd+p3ngdgjGgNLqm1T76sr50b3lBLAIYs1UGci17Pn8
 HtS8xHJDCjRAGOC19p+2dXesGif8mdgk+nTYfxf7Rvgtcn/dmPgM5ayWmQ9lVAxn8OYX
 qXXghEi9KZYLWeH8UdTvh3k+8Mx8WG8DmF+Z3nOg+10ho+9me+ZvbJ5KPfAiLC/YTh5k
 Cmjw==
X-Gm-Message-State: AOAM533hte0UDhs1zhZq+4d0a7rIakzopPMhyRwn/lz/8x1xNbp18fes
 tmNgrbh/mCbYShHzgoJgUsgIpA==
X-Google-Smtp-Source: ABdhPJySHSLKRyuhIZrudYf++tyEsD+0GgBX+hyzQUfgAdzn15cvpKaHOeRlq0FvEo+n97tiu5R9dg==
X-Received: by 2002:a63:185b:: with SMTP id 27mr23058306pgy.164.1624260340808; 
 Mon, 21 Jun 2021 00:25:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:40 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 9/9] arm64: dts: imx8mm-icore: Enable LVDS panel for
 EDIMM2.2
Date: Mon, 21 Jun 2021 12:54:24 +0530
Message-Id: <20210621072424.111733-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable LVDS Panel for Engicam i.Core MX8MMini EDIMM2.2 board.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
index a4a2ada14835..f1256c9c9bd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
@@ -14,9 +14,51 @@ / {
 	compatible = "engicam,icore-mx8mm-edimm2.2", "engicam,icore-mx8mm",
 		     "fsl,imx8mm";
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm1>;
+		pwms = <&pwm1 0 1000000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <7>;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
+
+	panel {
+		compatible = "yes-optoelectronics,ytc700tlag-05-201c";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_in_dsi>;
+				data-lanes = <0 1>;
+			};
+		};
+	};
 };
 
 &fec1 {
@@ -35,9 +77,43 @@ &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c4>;
 	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&gpio3 9  GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi_bridge_enable>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in_dsi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				bridge_out_panel: endpoint {
+					remote-endpoint = <&panel_out_bridge>;
+				};
+			};
+		};
+	};
 };
 
 &iomuxc {
+	pinctrl_dsi_bridge_enable: dsibridgeenablegrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_DATA03_GPIO3_IO9	0x19
+			MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8	0x19
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
@@ -52,6 +128,12 @@ MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT     0x19
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
@@ -77,6 +159,14 @@ MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
 	};
 };
 
+&lcdif {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
-- 
2.25.1

