Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8A46FFAC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B77D10E3CD;
	Fri, 10 Dec 2021 11:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A5C10E3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:53 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id o14so6059582plg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y58f/408ggFS0t4Z6wIbn0XNvGpa9gF+cq3fnKbXvq4=;
 b=Zg94Ty4D4jUP9ylOZDPNjOkgZl2tcZVu2FobVmPWqGtBRji42lfnSaHdUtgYO4Dpdg
 UFJggr98af08NApIlpLdH+ZqUtaVTKVkcMPpUUpe7QAgy0uERtZNo4zr70TH+9A5XO/g
 wohdZ882YOeG+dPt+WIQBuIH4yIypprVc9dHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y58f/408ggFS0t4Z6wIbn0XNvGpa9gF+cq3fnKbXvq4=;
 b=ebb/N+8gc8eDrVlctaUN8YeP9n5qd8rsMqqsQFTPauGo/vJRFrs4pERzVunsE1iLaQ
 gs23uX2VgNbgJ6QRtTfayuVwLTNQ0VoETeKSFFh5EpsZxdoSL/+fmJaQWvkVVgNNGleX
 0Iv//EO3Iybb8KKWLPt8oguBCxh3k9EPGPK2FEhyDA/Ztd9HtpRe9rDLDsDDYLnb/lSi
 pa/4Kg2qk5LkOhGcghoZNoGO1Cf591zbt0p0G3cgXRQ2VWNOy95yaVum75RQ2EYub0sH
 3lbOM849U4Nu/RFeDszZ6jRzEbOT5x7GxOTXS0SjhpaBYq/h75RD7X1dbtlJV2FNtUZH
 ZIaQ==
X-Gm-Message-State: AOAM533r4Vfe+dvaKcusqvOdKVqQDaWyBEXZ4i+jPnex95iJdaGBwWB1
 RbGRTWkoin/6OCnreuM5Fiv47Q==
X-Google-Smtp-Source: ABdhPJzAFDD6y2DwjF2jmlcaZlHOZhKXjj4Z/7auMyoCnoob9MAwhov/izo/HGKuwrD9GZNi9lQXdw==
X-Received: by 2002:a17:90b:380e:: with SMTP id
 mq14mr23759146pjb.74.1639135073054; 
 Fri, 10 Dec 2021 03:17:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:52 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v6 6/6] ARM: dts: sun8i: bananapi-m2m: Enable
 DLPC3433 Bridge (I2C)
Date: Fri, 10 Dec 2021 16:47:11 +0530
Message-Id: <20211210111711.2072660-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R16 board has DLCP3433 DSI bridge for connecting TI DMD Projectors.

Enable support for it.

Note: This is for testing purpose, DLPC3433 not available in BPI-M2M.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../boot/dts/sun8i-r16-bananapi-m2m-i2c.dts   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-i2c.dts b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-i2c.dts
index 7713cdaf6211..a96fbfd743f7 100644
--- a/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-i2c.dts
+++ b/arch/arm/boot/dts/sun8i-r16-bananapi-m2m-i2c.dts
@@ -86,6 +86,16 @@ vol-down {
 		};
 	};
 
+	panel {
+		compatible = "panel-simple";
+
+		port {
+			panel_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_panel>;
+			};
+		};
+	};
+
 	reg_vcc5v0: vcc5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0";
@@ -125,6 +135,32 @@ &dai {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dcdc1>;		/* VCC-DSI */
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_out_bridge: endpoint {
+				remote-endpoint = <&bridge_out_dsi>;
+			};
+		};
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -132,6 +168,35 @@ &ehci0 {
 &i2c1 {
 	clock-frequency = <100000>;
 	status = "okay";
+
+	bridge@1d {
+		compatible = "ti,dlpc3433";
+		reg = <0x1d>;
+		enable-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>;
+		vcc_intf-supply = <&reg_dldo1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge_in: port@0 {
+				reg = <0>;
+
+				bridge_out_dsi: endpoint {
+					remote-endpoint = <&dsi_out_bridge>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			bridge_out: port@1 {
+				reg = <1>;
+
+				bridge_out_panel: endpoint {
+					remote-endpoint = <&panel_out_bridge>;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -289,6 +354,10 @@ &sound {
 		"Right DAC", "AIF1 Slot 0 Right";
 };
 
+&tcon0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.25.1

