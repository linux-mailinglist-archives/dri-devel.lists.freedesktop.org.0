Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E83458978
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31E89DFA;
	Mon, 22 Nov 2021 06:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0189DD2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:51 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id r5so14493369pgi.6
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9Gb06Vl4JIAwHibHnGhr6PW3yWUcsapENzYzoBfT0o=;
 b=V5zSIeYbUvtWulb4f/rdm2/A93kXDGfWJiHgcBD9MCOsG08/rK0qBc9IHw5MLdfb8Q
 6WWzvKlomacBLvN3Kkm8vqW9P6GwXmaNvtVAB6hTB8IwV73gktCTnvUz84qMTWStU/Ir
 rbBeqpBYLNbEP2zc6jWIo8auzJ4ONk3C65/Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9Gb06Vl4JIAwHibHnGhr6PW3yWUcsapENzYzoBfT0o=;
 b=5I8bbgSZkoN9RrXrlTHSSMfEfjBzetU682rwr5dhBR6SVsZBpWTENqaMLxuV8kbq2A
 AjngzB/+zJic7tovkGAv4f/u3pO4+zqzuHqzxKVDYmAHTQF7hnkuuoUSdoPIPCxSNvYq
 LFWYRdna5aAgYhAXp3w+17QIiHPF+QwiPq1EsMbAHy4wulEwiBhPyqBAQhAIVfYjheJX
 /BgLbTzlJ0SY06K8zLudS6w0CJUqqck/qui2kGQQofcbFpC9E27OcEPRD6bTXPpQ/UNa
 Wh6D/OpPh6ghpxu+70FXG6kvxmoitxAckhCNpkfuvGQF+7TFHjSUn9sNfM+dUR2of5vN
 AKzA==
X-Gm-Message-State: AOAM530/Q0LUH5cRenR6JcIyaKOSrzRPleI/RzRoYT+1CbYTbSf4n8S3
 N+2M7QHQd4wC2ymjzuAGOFB+rkrpqmMzyQ==
X-Google-Smtp-Source: ABdhPJzThF6a7GGnY3TkQY4u4XBQVCdKiOTyS2H0BDDSvUYZpCb4wM/Xm9oEQQKLOphmhNudqjCnCw==
X-Received: by 2002:aa7:870d:0:b0:49f:e41d:4f8d with SMTP id
 b13-20020aa7870d000000b0049fe41d4f8dmr85664275pfo.16.1637564030917; 
 Sun, 21 Nov 2021 22:53:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:50 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [DO NOT MERGE] [PATCH v5 7/7] ARM: dts: sun8i: Enable DLPC3433 Bridge
 (I2C) 
Date: Mon, 22 Nov 2021 12:22:23 +0530
Message-Id: <20211122065223.88059-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122065223.88059-1-jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
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

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 79 +++++++++++++++++--
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
index d28b7b35a3c5..c3ee6a879ddb 100644
@@ -108,6 +102,17 @@ sel-lvds-mux {
 		};
 	};
 
+	panel {
+		compatible = "ti,dlpa3000a-720p";
+		/* backlight not required */
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
@@ -147,6 +152,32 @@ &dai {
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
@@ -154,6 +185,38 @@ &ehci0 {
 &i2c1 {
 	clock-frequency = <100000>;
 	status = "okay";
+
+	bridge@1d {
+		compatible = "ti,dlpc3433";
+		reg = <0x1d>;
+		enable-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_dldo1>;
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
@@ -321,6 +384,10 @@ &sound {
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

