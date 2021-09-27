Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE0419982
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455489F03;
	Mon, 27 Sep 2021 16:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [85.215.255.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47AE89EB8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632761076;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=H3NxTpI4pXBoo4dw/8ZdM/IDMISjQFk7ziraP3D1Awk=;
 b=nTIlICPMlHJza5585/y4P0Bnb4NN9sam/hbk9AVpUzCxomnDNjdJBrhogcXogzPxmx
 QBeUEWcNYMAR/SazJqwgv8vVurYi16kpq0O0eIaBZ/8S5Z3RNqsRt4U+4GiWY3A23A9n
 ZwEfkkv1EHdSBWdUz8nUbTxLSQZTfpSQnCU+ZQdII9ZT5gQ2Fq1MVggudt+UI9tQUSki
 cfZYX+/6R07Weyy0Grf+L9K/8RYlQT5n3yBdAkIEo7snF6Az6NdiTtWsuBXJrKBffV0P
 LSfKKeyGYWVC46Wvg2ThLISeW+5yJjIntZ2GIuOI7+u3gJ7ehfyFrLGy21SCYnXttdul
 Mavw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFrDb4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
 with ESMTPSA id I01f74x8RGiaavH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 27 Sep 2021 18:44:36 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 08/10] MIPS: DTS: CI20: Add DT nodes for HDMI setup
Date: Mon, 27 Sep 2021 18:44:26 +0200
Message-Id: <b9c245a727349f9c6516f4418a8cb207246996f8.1632761068.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

We need to hook up
* HDMI connector
* HDMI power regulator
* DDC pinmux
* HDMI and LCDC endpoint connections

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 67 +++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index a688809beebc..4776be35b14d 100644
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
+		gpio = <&gpa 25 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 };
 
 &ext {
@@ -506,6 +529,12 @@ pins_i2c4: i2c4 {
 		bias-disable;
 	};
 
+	pins_hdmi_ddc: hdmi_ddc {
+		function = "hdmi-ddc";
+		groups = "hdmi-ddc";
+		bias-disable;
+	};
+
 	pins_nemc: nemc {
 		function = "nemc";
 		groups = "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
@@ -536,3 +565,41 @@ pins_mmc1: mmc1 {
 		bias-disable;
 	};
 };
+
+&hdmi {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_hdmi_ddc>;
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
2.31.1

