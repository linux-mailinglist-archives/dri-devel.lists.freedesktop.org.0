Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF216F933
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224CA89DBD;
	Wed, 26 Feb 2020 08:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772B66E265
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 08:10:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id b1so723716pgm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 00:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/9ulr35We1VvK4OKOtO+SeDdjZAIuN626KlRGL51e8=;
 b=Uj9USULV1YhIjRQTGet+GBQYuuhLAkRgQq5aOXkZU55ZeXZOwYCvjYC0XTbkwI02vn
 nMqNb637FbLBsLL+0OixEVNpFP/WYWrCLF5zLIEBTSZkXEK2J8hPyn24masq/KXBnUXK
 1WpXqTxgjbgl1eq/uxSXJMuc6aResWHy1sQuEaEYBEWdEyvPqtQts5z5Su639wYEgo9n
 wE96FuZQY46tDJyTJqt+ZJrzDYNCNenLNiqWFwxe/zxWzBuM58iQ9ur+6Ym5ldZxRpj8
 JJ2JlN+8/BPq8Wk9S0SAMAUumaOifHahGje65ULSbNA6Krngc4WuiBgliS4rekKjbPPq
 Xcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/9ulr35We1VvK4OKOtO+SeDdjZAIuN626KlRGL51e8=;
 b=gM5tM6b2Pd+PI+Gn2jDTeVe7fnGuYDKsyKrsJ3jmha/9mTg5CsFL76Q3aN5XSZT68h
 8qrk8v2njm2F9gy2MFS5F/JHSOWvqHMNiBeXL8/+vZhTMXuPhhTdkAlpIrzGoqCPJ1wI
 3jVks7fyDSicQ+4xVsLWDcN8pjM/082w2O6U1Dbm6vkLIoD4g8DFSwJdkGVDGUEMOTry
 wPRjqjIuVIPUUVNuUh7sM7ABBG56pVHoeO9xUc87+T0PxCJMwu/WmU5ILHTOonhjYWyB
 7g+MBkC+j1gYLLRxLGlJbwTGcHQHF+KQZxNutipVbm0RP10yseDhl6qYXkgJmTRc1ZFB
 X+TA==
X-Gm-Message-State: APjAAAWpgZuudxZK3u8gn7U85NB/Dd+NxxGzZRmNbQh6KyLC6pQkzEIo
 uUwDA3iOn5hXU9uPWfMhsuI=
X-Google-Smtp-Source: APXvYqwdqfkaKNsVj/z20Fl00qUooa5Fc8g4w6gy6KhAC3QgiEMz+qOhI4aMxTYoHDNd7Lx/skz8fQ==
X-Received: by 2002:a62:1883:: with SMTP id 125mr3012096pfy.166.1582704649041; 
 Wed, 26 Feb 2020 00:10:49 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id v7sm1679230pfn.61.2020.02.26.00.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 00:10:48 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@suse.de>, Icenowy Zheng <icenowy@aosc.io>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] arm64: allwinner: a64: enable LCD-related hardware for
 Pinebook
Date: Wed, 26 Feb 2020 00:10:11 -0800
Message-Id: <20200226081011.1347245-7-anarsoul@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226081011.1347245-1-anarsoul@gmail.com>
References: <20200226081011.1347245-1-anarsoul@gmail.com>
MIME-Version: 1.0
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Icenowy Zheng <icenowy@aosc.io>

Pinebook has an ANX6345 bridge connected to the RGB666 LCD output and
eDP panel input. The bridge is controlled via I2C that's connected to
R_I2C bus.

Enable all this hardware in device tree.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../dts/allwinner/sun50i-a64-pinebook.dts     | 61 ++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index c06c540e6c08..0033f6a43d98 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -48,6 +48,18 @@ lid_switch {
 		};
 	};
 
+	panel_edp: panel-edp {
+		compatible = "neweast,wjfh116008a";
+		backlight = <&backlight>;
+		power-supply = <&reg_dc1sw>;
+
+		port {
+			panel_edp_in: endpoint {
+				remote-endpoint = <&anx6345_out_edp>;
+			};
+		};
+	};
+
 	reg_vbklt: vbklt {
 		compatible = "regulator-fixed";
 		regulator-name = "vbklt";
@@ -109,6 +121,10 @@ &dai {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	phys = <&usbphy 0>;
 	phy-names = "usb";
@@ -119,6 +135,10 @@ &ehci1 {
 	status = "okay";
 };
 
+&mixer0 {
+	status = "okay";
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -177,12 +197,38 @@ &pwm {
 	status = "okay";
 };
 
-/* The ANX6345 eDP-bridge is on r_i2c */
 &r_i2c {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_i2c_pl89_pins>;
 	status = "okay";
+
+	anx6345: anx6345@38 {
+		compatible = "analogix,anx6345";
+		reg = <0x38>;
+		reset-gpios = <&pio 3 24 GPIO_ACTIVE_LOW>; /* PD24 */
+		dvdd25-supply = <&reg_dldo2>;
+		dvdd12-supply = <&reg_fldo1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx6345_in: port@0 {
+				reg = <0>;
+				anx6345_in_tcon0: endpoint {
+					remote-endpoint = <&tcon0_out_anx6345>;
+				};
+			};
+
+			anx6345_out: port@1 {
+				reg = <1>;
+				anx6345_out_edp: endpoint {
+					remote-endpoint = <&panel_edp_in>;
+				};
+			};
+		};
+	};
 };
 
 &r_pio {
@@ -357,6 +403,19 @@ &sound {
 			"MIC2", "Internal Microphone Right";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_anx6345: endpoint {
+		remote-endpoint = <&anx6345_in_tcon0>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
