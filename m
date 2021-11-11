Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27844D4E3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F276EA78;
	Thu, 11 Nov 2021 10:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD3D6EA78
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:15:24 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k4so5354361plx.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReGXXSgMAWBVWqtZW7yiuvm2VXa8F8R9ZU2mQqCsZ6Y=;
 b=AODSSiz+j7VKRDXvjzjKudw18f2ncpzlSgQR6iRK4SV6lkfsPbuLMgz+R1w7ZqZoT3
 ZWpF+xyvWoyOapitMD3vp8z3UmeZ+yOcX6fPBZXVqTejc6FlnvlzEf5nvMWSr+1X2YkC
 pWj6EoKcNCe1b8QLD/q6OS9bdcKEtpctpA9qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReGXXSgMAWBVWqtZW7yiuvm2VXa8F8R9ZU2mQqCsZ6Y=;
 b=1rRfHifB91deG5o+3Xpgwwngih0VWiaVLNvAe7zxTS7ffQBGyUXYLwwWH9WrKpJzT5
 VsIBiXgNZ3RFi+WTrmhV2eMUvh5LrAA6VzqYX22TjWfEBHBNZjnC+PDcMW8SuhAf/0yM
 oSbCGDRqS9TpNamAd+BW9WRlWSldmGXf6XZC6O6eJa34naqR72CFXlxaZqQRnjgeEyil
 j/tb7CEGAJ4bl37khuNZYj6B2go2/RcN4YK7xVWbW9XSx94+CeCRJFZIUM4AKb495mxE
 uQ5rrKupPLMVToTTmIyyWl3NNzvaf390l49y454rWLmHPmaEf+kyGyTEc1FlEwOJotnf
 NPeA==
X-Gm-Message-State: AOAM532Eb/j7IfkEgmlEI5sc1ZGoMFkZ7o3a9+WVGRIWGSeIxt3N+YQg
 nfyiVpgqr6H3Bg3kpWEwNMhXVg==
X-Google-Smtp-Source: ABdhPJzYC/ToGsoJIz4oDAcvjP9aSLxWt4FpP7HRZASPJWaJ6KowAi/e2tHZUPKRWzz8Iod3AKDNsw==
X-Received: by 2002:a17:90b:33d0:: with SMTP id
 lk16mr6984798pjb.66.1636625723610; 
 Thu, 11 Nov 2021 02:15:23 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id t12sm8035667pjo.44.2021.11.11.02.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:15:23 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [RFC PATCH v2 3/3] arm64: dts: imx8mm-icore: Enable LVDS panel for
 EDIMM2.2
Date: Thu, 11 Nov 2021 15:44:56 +0530
Message-Id: <20211111101456.584061-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111101456.584061-1-jagan@amarulasolutions.com>
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
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
Cc: Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable LVDS Panel for Engicam i.Core MX8MMini EDIMM2.2 board.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
index a4a2ada14835..58065fee27f6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts
@@ -14,9 +14,45 @@ / {
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
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
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
+			};
+		};
+	};
 };
 
 &fec1 {
@@ -35,9 +71,44 @@ &i2c4 {
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
+					data-lanes = <0 1>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
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
@@ -52,6 +123,12 @@ MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
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
@@ -77,6 +154,14 @@ MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
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

