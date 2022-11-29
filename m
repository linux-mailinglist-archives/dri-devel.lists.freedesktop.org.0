Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82C63C671
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5DF10E114;
	Tue, 29 Nov 2022 17:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557C10E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 17:29:22 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so9570369otb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnrU/S9jrTo7VMkSItxfe7rQNqEwCFm0vszgPLvFvNM=;
 b=FMuZUNvNuprAFguviKR51jVrDAzZLGUbDQOtZNexD2xXwNxzNHQ63ay2m4eYEODfYH
 Vw5VfMDlwMd5w+Kawaujb4SSHVrenwVnHwa+gXBzg8bH7dzpPLP8G13oF4kH2DBS3YOU
 qRHHKSq2EeSSOmsE7aWaAYUci/uFIW4M4srljDLfJkHLAhULKrjARc0LGDIdhqqFbCPL
 fvaxcxHqS+6UQkTtkbvA1UaaSxxGpUmPwEeuMEySUI4SIOFUZd4MNvbnuIs187Nca9Ma
 8rRbLWJ7K048+wtP2BHjMDii4Tqzrl9Wab7XsRtTIQM5fS78iIiY48voYS7+l6IedHJR
 7Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fnrU/S9jrTo7VMkSItxfe7rQNqEwCFm0vszgPLvFvNM=;
 b=xf3QNZrKt2iIR3PkhvV9utVJyo7oKXZ7pbP8LVtRvpfok+LOztgux044umNklqQVFY
 psmwyAO20+O4xxstOur+szmlTb5R0G7rgg2eLFFiLpuvtUcepgP4aPoGTopdKnFlcvJw
 mYfmIUzuA/apGDEVDj5RMPETz3Qcl5VOICWCU3Pyf19pEBayiQKF+EIw6oM8UKFJKSHH
 Qx5BQul/Ga4eBw5lu9tOU3ijaVI/dAusoyRczay3dGeg0IFpDt72L7nAEncNOSNr2PEE
 KPQeI3jnscauDmbNtTOtI0vKxldnZb/aP3HEeGeIWvzQwY0g+QgIvJCvUMBqtW9uGZZG
 AHog==
X-Gm-Message-State: ANoB5plEOyhG7y8Idcj181zqAdJY0KnBAUxbEy6TW9nFvlvRk8vstvTk
 AxiO5LtE7xxrtQ7p0XtgolM=
X-Google-Smtp-Source: AA0mqf5HcnIQkAF9BdufN5q1s2cozIdu6aBXSB91VDBMW6tg6Xl5I2gKp8jDb3SVdelMdCKx9aUNcA==
X-Received: by 2002:a9d:5d04:0:b0:66b:85b7:ac37 with SMTP id
 b4-20020a9d5d04000000b0066b85b7ac37mr21802163oti.363.1669742962229; 
 Tue, 29 Nov 2022 09:29:22 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a9d709a000000b00661b46cc26bsm6224546otj.9.2022.11.29.09.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 09:29:21 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 3/3] arm64: dts: rockchip: add display to RG503
Date: Tue, 29 Nov 2022 11:29:12 -0600
Message-Id: <20221129172912.9576-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129172912.9576-1-macroalpha82@gmail.com>
References: <20221129172912.9576-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add Samsung AMS495QA01 panel to RG503.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../dts/rockchip/rk3566-anbernic-rg503.dts    | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
index 5dafcc86296b..23442e38a751 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
@@ -47,6 +47,22 @@ gpio_spi: spi {
 		mosi-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		cs-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 		num-chipselects = <0>;
+
+		panel@0 {
+			compatible = "samsung,ams495qa01";
+			reg = <0>;
+			enable-gpios = <&gpio4 RK_PB7 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lcd_enable>, <&lcd_reset>;
+			reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc3v3_lcd0_n>;
+
+			port {
+				mipi_in_panel: endpoint {
+					remote-endpoint = <&mipi_out_panel>;
+				};
+			};
+		};
 	};
 
 	/* Channels reversed for both headphones and speakers. */
@@ -94,6 +110,32 @@ &cru {
 	assigned-clock-rates = <1200000000>, <200000000>, <500000000>;
 };
 
+&dsi_dphy0 {
+	status = "okay";
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		dsi0_in: port@0 {
+			reg = <0>;
+
+			dsi0_in_vp1: endpoint {
+				remote-endpoint = <&vp1_out_dsi0>;
+			};
+		};
+
+		dsi0_out: port@1 {
+			reg = <1>;
+
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+};
+
 &gpio_keys_control {
 	button-a {
 		gpios = <&gpio3 RK_PC1 GPIO_ACTIVE_LOW>;
@@ -146,6 +188,18 @@ spk_amp_enable_h: spk-amp-enable-h {
 		};
 	};
 
+	gpio-lcd {
+		lcd_enable: lcd-enable {
+			rockchip,pins =
+				<4 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		lcd_reset: lcd-reset {
+			rockchip,pins =
+				<4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-spi {
 		spi_pins: spi-pins {
 			rockchip,pins =
@@ -164,3 +218,10 @@ rk817_charger: charger {
 		rockchip,sleep-filter-current-microamp = <100000>;
 	};
 };
+
+&vp1 {
+	vp1_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp1>;
+	};
+};
-- 
2.25.1

