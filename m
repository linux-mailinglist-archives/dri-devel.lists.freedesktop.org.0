Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9777E6607
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C980610E1F1;
	Thu,  9 Nov 2023 09:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD010E1E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507a62d4788so797627e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520426; x=1700125226; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=efTwWrWdbHbCcmX8IyA5fzVlEaBXdLmBu1+Pzz5pqycxLxaxHEcC1xqNDxdOnuIWdj
 3fme0uDKTkAwDSZTrPmTtIPa413yuxS+E6ErHhyrYbK0Q4zfdhbihgfurEBR1dOkRqPl
 doZOBl6dBhiGo3B+OTdyCt/MsT0LNV8IE4VRdQd8A8U38xrB1vC5imZnZjFb4eSkPSv8
 D+VE29OL5HwrShr5eXtHNYnnobdC8nw7f6vC2qNc897UWbYjWQvx2iSiC1D9CoKW5AhG
 lC7gFaRAtqteExu9JtGJmHByclUvSqAQ8QpXSdHR8OWavC8iqgcDa2C/B5ivcu+XUQEQ
 uBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520426; x=1700125226;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
 b=KMNKhNy05BswLOjNJgvkQPLJPTMPbIqD0ism+M8TleIYsAmtCpz0fUwWOCcwqLd6h5
 K6pzDe9c9D0GE+0Mt92C7vMTC9uVzPzcdiVHuMcmtn7Jkef0ESYiVooxHPSZ7PKG+P4h
 4luvFJDmqgvtyQaQn3upMK/vFbeKy05X1amNk1UjB1sG++ErtuHLoEZ3nFeRgyLpY9mR
 wbqFgGupJ5aNqwtwbgqBrjy1r4E6Sg2YjQR3byALY45JJsyzJVosQN4FpnBFxpiRyxOV
 852VJg2ACXklzlJzeeWbuQGxvEz8W6qM86SrmK2uEYwYe/nxlni5ras/qAw0QcfMCwet
 To8g==
X-Gm-Message-State: AOJu0YyVcQ3g5vFivW1rJNUX2+zjhwDYeuUAbLvEub8dzm9qqqACYe6t
 NgsGgtir8caorEavgXITTK3Yzw==
X-Google-Smtp-Source: AGHT+IFp6a7B+08Qs7kzVjwz5xE/v2ASX3jMKbrYx5nFLBXZBjgW+CvtIZunwhDWGP4a8erXu/q34g==
X-Received: by 2002:a05:6512:911:b0:507:f0f2:57bd with SMTP id
 e17-20020a056512091100b00507f0f257bdmr755918lft.66.1699520426132; 
 Thu, 09 Nov 2023 01:00:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:11 +0100
Subject: [PATCH v8 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-10-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+ZCu6htgUtFxFaXFAKQp1sZxpR7+IzNQz6TU6c
 bVMpqCaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0dbQD/
 9jQPYUo+YgcSZCmVFq6YmWrr0+Kkyas8OumKOcdeD3c0ym2NBiqCdKuAzkZ2V4+n2xhsTtSetTgXVs
 N67M8YGG8ZLEeTFicfNF1EcFgZeleWg8hoDnLQkSt4XUkTwREnBcFFy3QhCFhJDDU//OvvrA3CK9hC
 UHlbtR3s3qrRhPfgSpiLgvOLt/bnZIXlbe8OEfnjt4/FjgFIcZFjf+Li5y7Js2GG4GP0Y48uivqyKY
 V7vMXV+wFLbXkzHbn2lhoAhc2Xc23wIDPa3fL+VEp9fIFMwOt3dXeiFx+gmWmPB49Q7NCHxSUopXVo
 1+qpWPC3AfaWIEorcrnTiTu4fn32pxFQQNDozadRAb90jELPM7bwMKdJAc6WWKHt6fmR6j2cQAE351
 43dhzroLc9BQGz8wWt1kiKy8tKnmP3/zbTHFBdOi0gftwtDiqNKCYcSrbHupbSLDXttpUqHUd97LwS
 oE0nugHWLLZmqLAIhJJmce+XXrdupLYJrxduf/d/BPFYYoN85gPc7hB3ZDvXCWT9nYpIXzrQQ3G6Lf
 Tk+w5oteJ9HgbzOBX0eIGC1J9UpqjsDo/YVBgSqS99JYkRpTVp0htzv65jnKRB0Guy/Npmtxq6PGxV
 hUnf45HtzEj9BKucV52ykAekSH5w3RPphPUDNEsHfhyz8/dzMTzj4KRaykUA==
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
index ff68b911b729..7300408262d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1663,9 +1663,28 @@ pwrc: power-controller {
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
@@ -2152,6 +2171,15 @@ hdmi_tx_out: endpoint {
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
@@ -2189,6 +2217,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: dsi@7000 {
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

