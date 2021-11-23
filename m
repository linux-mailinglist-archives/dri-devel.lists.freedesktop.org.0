Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A343B45AB23
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD9E89B45;
	Tue, 23 Nov 2021 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672E899F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637691246;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=01x0k1o61wfJzMyaExuIPHQBp9qWDslUZ9lTMl4gXbQ=;
 b=TEjqT9+p6DtxoqEc5gMvDiiZ0uPdJE8+efwI7GEm3Cxcqwv8nNsP+VjP1HlnMvoqRZ
 oVk0To7vkM3TVVbvBWUzrHN6tgzkqQ+RbH6ISQoyU+L7Bfl7I2+RJhaWpzP92SiPDUlz
 TlcADl+R+5FmqD9g0Ou7c42VX+uQUWgYHzopUX3hpVJmLg/b7wnTPH7rrL01cT+kCyYR
 A6fj4OeeUzAWYbyXC4SzGljRFEhLXk0skhGPTBjDXRj0s/x0zZuyaDNNZm3wo+fivW64
 KsZQLO9NQtcH7Xnll4rRfdF8q2N2f4u6TgNNSjKBCDkwUz/rfxmt+bBKUqu8rJ12k5zF
 CdeQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
 with ESMTPSA id g09b5fxANIE67mc
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 23 Nov 2021 19:14:06 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
Date: Tue, 23 Nov 2021 19:13:59 +0100
Message-Id: <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

We need to hook up
* HDMI connector
* HDMI power regulator
* JZ4780_CLK_HDMI @ 27 MHz
* DDC pinmux
* HDMI and LCDC endpoint connections

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 83 +++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index b249a4f0f6b62..15cf03670693f 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -78,6 +78,18 @@ eth0_power: fixedregulator@0 {
 		enable-active-high;
 	};
 
+	hdmi_out: connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&dw_hdmi_out>;
+			};
+		};
+	};
+
 	ir: ir {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpe 3 GPIO_ACTIVE_LOW>;
@@ -102,6 +114,17 @@ otg_power: fixedregulator@2 {
 		gpio = <&gpf 14 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
+
+	hdmi_power: fixedregulator@3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "hdmi_power";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpa 25 0>;
+		enable-active-high;
+	};
 };
 
 &ext {
@@ -114,11 +137,13 @@ &cgu {
 	 * precision.
 	 */
 	assigned-clocks = <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>,
-			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>;
+			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>,
+			  <&cgu JZ4780_CLK_HDMI>;
 	assigned-clock-parents = <0>, <&cgu JZ4780_CLK_RTCLK>,
 				 <&cgu JZ4780_CLK_MPLL>,
-				 <&cgu JZ4780_CLK_SSIPLL>;
-	assigned-clock-rates = <48000000>, <0>, <54000000>;
+				 <&cgu JZ4780_CLK_SSIPLL>,
+				 <0>;
+	assigned-clock-rates = <48000000>, <0>, <54000000>, <0>, <27000000>;
 };
 
 &tcu {
@@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
 		bias-disable;
 	};
 
+	pins_hdmi_ddc: hdmi_ddc {
+		function = "hdmi-ddc";
+		groups = "hdmi-ddc";
+		bias-disable;
+	};
+
+	/* switch to PF25 as gpio driving DDC_SDA low */
+	pins_hdmi_ddc_unwedge: hdmi_ddc {
+		function = "hdmi-ddc";
+		groups = "hdmi-ddc";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
@@ -539,3 +577,42 @@ pins_mmc1: mmc1 {
 		bias-disable;
 	};
 };
+
+&hdmi {
+	status = "okay";
+
+	pinctrl-names = "default", "unwedge";
+	pinctrl-0 = <&pins_hdmi_ddc>;
+	pinctrl-1 = <&pins_hdmi_ddc_unwedge>;
+
+	hdmi-5v-supply = <&hdmi_power>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dw_hdmi_in: endpoint {
+				remote-endpoint = <&lcd_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dw_hdmi_out: endpoint {
+				remote-endpoint = <&hdmi_con>;
+			};
+		};
+	};
+};
+
+&lcdc0 {
+	status = "okay";
+
+	port {
+		lcd_out: endpoint {
+			remote-endpoint = <&dw_hdmi_in>;
+		};
+	};
+};
-- 
2.33.0

