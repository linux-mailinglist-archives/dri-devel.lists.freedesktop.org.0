Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E51678051
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0FC10E4DD;
	Mon, 23 Jan 2023 15:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D6410E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:46:15 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r9so10673365oie.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAsZjV/F62ehp3lu+dOQ47iT4A8AwdolBkS2EqUE/rA=;
 b=YWfuJVBaEV8h+q8+hAGxtJYkAMtOJqj+4/wY7jhchxrDVUz41Jkr4D4Lbh+ZgnZB/m
 9H3d7Dq8r/ZncBMZj7eUYiRsOXMNutmfBah9VYeYIb5N5mloXjb6pSUaXWvELem6u+uU
 ziKNznOm6td4Za/rx9TXUdhmz3K4NG0T7cuDhwrzetfv6lMYQVZ4gZEK6K0Estpw6rSn
 dKYNYR35ctWOdCMCcwm+e+lh40vAWaBnHaLU8OiOQmuCz0JJtoRJ0hT/B6j0oZQDskUk
 FdXtHl3QCbHgvp/tthCzgaa2Ex9xA/w1N0bzsDYAscfpvlzF28PM3Q/4z3ir4iCKZn9Y
 V/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAsZjV/F62ehp3lu+dOQ47iT4A8AwdolBkS2EqUE/rA=;
 b=zPjsC+MRjAz8H/Ib4MBvEN8DF9l8+jjt5YsdVZ71o8Q6YGDW9RfpCxuo9g3lFP06+Q
 OjwQ5DmP3xGq23teJffW2Tp0Doxho850zad0R+flLIBexuTl5qpVfbcUOvn0KytiNdiS
 4JK1IjY72I05ADK5e3eKZoKUzLTTEB+bCA2g3VWN77QK0BrCv4YOpYFJVTwWUhG+aYRX
 Yk5FwX9q8UrydNUX3MXSNp0fyOO2Nf7JsYEMasQyf++OPtQIR/Aoukt425Ch33u4QCQI
 t6N9l4uoDufkpkZQzSx27fPd7cH8XLpfazjHvjVCzUAfM//rIDtAj3ugNie+eeLP3lSp
 8mPA==
X-Gm-Message-State: AFqh2kr9wIS9tyY7VnAHfDWbX/IjtO9vv+DM+84LwsNPq/UmJXZ0ihv6
 c6EufjTJ1CwY2Q6eS+e8crkaCS+LTwk=
X-Google-Smtp-Source: AMrXdXuYbHqR4J82pKKdQRM5vPgIpVKffS/ltAI+6WMM81sbew5aDBjCqcM5Y+CZzaac0etn99OVdw==
X-Received: by 2002:a05:6808:171b:b0:35a:1124:227d with SMTP id
 bc27-20020a056808171b00b0035a1124227dmr13432623oib.3.1674488774199; 
 Mon, 23 Jan 2023 07:46:14 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a056808140d00b0035e7ed5daa1sm10040132oiv.26.2023.01.23.07.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:46:13 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V12 4/4] arm64: dts: rockchip: add display to RG503
Date: Mon, 23 Jan 2023 09:46:03 -0600
Message-Id: <20230123154603.1315112-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154603.1315112-1-macroalpha82@gmail.com>
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add Samsung AMS495QA01 panel to RG503.

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

