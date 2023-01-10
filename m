Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD21664CEA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 21:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4610610E244;
	Tue, 10 Jan 2023 20:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59810E65C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 20:03:08 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 c190-20020a4a4fc7000000b004a3addd10b5so3511524oob.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=J5wl9aZ1IGVKg3lxEsQz4tnGLe3hwvrXmSc6JvIcjnH9Qk+O/wKX6InDxVsiLFF7HI
 nElQ3Tdyo29n+VERdoB4PBD3HnjdmlHL48hCL/FqvLqTb1jatMoEBMqrz4zCNR3Ltx4J
 SGnktX0yevWOFId052bDTYFckwojX1RXTdYuBmZV9/1hoKyiQu0FekR8zRoiqxtmmFrp
 DZqEicdPijXJvtEgoiaUnJwDEwer4qP0+y05oZ0AiBgsBvwCPqmpLhJRIAudwRjGuQ8z
 DditkC69Hsf57phbBQFTQKhwr840n2PXLpWs5b5reDRS2lClfMSxuRAnfhaw10/ANiXy
 Q6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xn0RWIp29/DDAGotFO+F2cDyIEYDf7WQu136TlHaqBY=;
 b=qPckgRHfd6hIwNINMEgukeuM7NH+/CNNacXhfqDa/8n7Y0RWKvs+Ix3H4qR17TeTKx
 1QLJ/GqzLxlZxF4QX6zLwy0WckcMC8VUe4wy11Zp/u5rDRdj1VlvMBuTlD1jtuCi3CFK
 oSzcrG203OU2IF00dyiDVgzj2LB8LklCitIoztpKBiriQXZma4B0fU2onbmrERjYBTLD
 qjKwyRmwdICsFvPNemlVxWItn0M2/qvKz9WmLzfpz2lKJRPX5guwur0/d48wCtPqgnYM
 xkik3sNrThVuBAylz45hqdIK1Brh4/05svPYDdzYKSuoGKI7SjoE0yryUddPK9KIwOtG
 sK5w==
X-Gm-Message-State: AFqh2krpJi6/o2g36hUUgMiBB20VsVRpAu9DIQxfZi6eU0X527B9t1nn
 vNif6UtiqpV/YXrhY4bDq0JuO8l5Ccc=
X-Google-Smtp-Source: AMrXdXsUnCZFrgXKeAiUQMlpciK+Y2fvmBkeu+sGeN5vr+2gS/lMTnHiixfEKYg1f/tLIXAiTGxg2A==
X-Received: by 2002:a4a:ce8b:0:b0:4b0:ddb0:e0a6 with SMTP id
 f11-20020a4ace8b000000b004b0ddb0e0a6mr30972164oos.3.1673380986977; 
 Tue, 10 Jan 2023 12:03:06 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a4aad04000000b004a394578e14sm6089779oon.32.2023.01.10.12.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:03:06 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 4/4] arm64: dts: rockchip: add display to RG503
Date: Tue, 10 Jan 2023 14:02:55 -0600
Message-Id: <20230110200255.1218738-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110200255.1218738-1-macroalpha82@gmail.com>
References: <20230110200255.1218738-1-macroalpha82@gmail.com>
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

