Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401C64E159
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341210E522;
	Thu, 15 Dec 2022 18:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2C010E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:52:22 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 e12-20020a4ab98c000000b004a081e811beso32558oop.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=R2zO+t7nr+aKZeFcIqNjJdDuzyg9ArEuMc9RAnA2RV8wUsWaBNtdyp37mBaeRt7+8+
 G4QQzSbtA5dJru3BCO7mgYs1IMenpTgKww8wUcL1udzID+jcZnshCJ5H0ywuDIMGOKLP
 g9j56u2ug/IKiPLOttx5T/bD++cmQ3FWnRgsQHVsbX/9hV+Qn0oLxGeyGzda6nUOmaap
 8DpEfo6QSNVKiR+qrUesjD/tJ5xbLDxHtRz2cv1xLDeH4bzHiU9VE2AxFfuGYhgoTsnx
 ZMHc6em0/SBN4fYfMZR14UfUGABCeseV5m/ZtVJnGhSm2CU2t+IxmUkhWWMQd9v1+sMF
 L6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=5RVQE3uqaO9WRzdfJJd+imDabPEfxW+bjBGUiAwtCqGf9ucV4Od478ZDS6uC4OgWQS
 tbZaY95sZML341ckX5ysl7lRaUwoOko5saC+JlBUkqsKXdMa9rXVgREbU/rUl0l5NEty
 FVB88pMEd3M6Si9RoKQint7fw+b4GXnCWR7rQeS4CRKJ5SzYPW6nxAldsMKNEHtsiylw
 3Ry4Fxal9cY0f0geAMp7MV20LYzfAZjRgWVwZV0H2gQ1UI1fJQ2XM88UY2paXpjQAHZr
 JMoHw41sx6+p+lFHKhzTR1wG+vKKImn9GVYqkbKmv7d+GLww2XyqgsDEOO0b3bO87XKn
 635w==
X-Gm-Message-State: ANoB5pmQHW8NQzUVfx6tB/pNUnQ4ebNk4ewp3kcbN44KSOBD5D7YTvuV
 mFzv0Ilci7gAVdoQnXv8ARAytLj83sw=
X-Google-Smtp-Source: AA0mqf51VnHChzflEHwPYqgqklV9DYyCaptTFBBoCLZRwltPPvDECieuhv4Hem5uCmz853ZgYkWHrA==
X-Received: by 2002:a4a:b287:0:b0:4a0:2ddf:9da2 with SMTP id
 k7-20020a4ab287000000b004a02ddf9da2mr12199267ooo.5.1671130341879; 
 Thu, 15 Dec 2022 10:52:21 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a4ad84b000000b004a09df5a1dbsm72264oov.8.2022.12.15.10.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:52:21 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 4/4] arm64: dts: rockchip: add display to RG503
Date: Thu, 15 Dec 2022 12:52:11 -0600
Message-Id: <20221215185211.1560736-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215185211.1560736-1-macroalpha82@gmail.com>
References: <20221215185211.1560736-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add Samsung AMS495QA01 panel to RG503.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../dts/rockchip/rk3566-anbernic-rg503.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
index 5dafcc86296b..b4b2df821cba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
@@ -47,6 +47,21 @@ gpio_spi: spi {
 		mosi-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		cs-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 		num-chipselects = <0>;
+
+		panel@0 {
+			compatible = "samsung,ams495qa01";
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&lcd_reset>;
+			reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&vcc_3v3>;
+
+			port {
+				mipi_in_panel: endpoint {
+					remote-endpoint = <&mipi_out_panel>;
+				};
+			};
+		};
 	};
 
 	/* Channels reversed for both headphones and speakers. */
@@ -94,6 +109,32 @@ &cru {
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
@@ -146,6 +187,13 @@ spk_amp_enable_h: spk-amp-enable-h {
 		};
 	};
 
+	gpio-lcd {
+		lcd_reset: lcd-reset {
+			rockchip,pins =
+				<4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gpio-spi {
 		spi_pins: spi-pins {
 			rockchip,pins =
@@ -164,3 +212,10 @@ rk817_charger: charger {
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
2.34.1

