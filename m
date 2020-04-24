Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49F1B800F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2826EB38;
	Fri, 24 Apr 2020 20:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21A489E41
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DA6E51454;
 Fri, 24 Apr 2020 11:37:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6MnqtvvYOSp05
 oKCDbjq338DK0xU4jQ2iQPjC8rZ2gA=; b=MfULuYr8Y6PvQTTnATo1/RLyHNSSG
 a3gtvvA1MT0V90cleaWX5MEawFg3CKr5QMfL11+XmD0iJgblqFeNIqD93VLPGgZd
 FO8OTy2H88xrKuzWSS5qBpPMYfwU5qeiuvxSF6ZQ7vA1XsOT4Jaa4wg5zla6KoxA
 o7dGttq1A51+fErk2JN3FrXnC9cjhlMOgCGe8Onalau9vDSDaThqCEQgj0zkTkiw
 G7W7OrsBYlFjUFbqCHpljeo+PB4aMbWmdrUYt9b1e2XkyweURM1jchFdKstkli0y
 UhNW7SiS7FZIpdF14vKHOaMf51Wk8lpd3l70IDIt+v7cPj6gB5CJ3ogVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=6MnqtvvYOSp05oKCDbjq338DK0xU4jQ2iQPjC8rZ2gA=; b=S1Wu8rko
 SQP4E00SMHGkPLlSho9xZvF2NyxWrN7W3yOwfwNcmjAmruH6jYXFmFMmmywIWUd+
 jb74HU71bVFOfo5gKsqF+khbAZc6WQsu/Lls+jkW+1NUL7t+PYyTxKlFS8bVmHX3
 7tiCMVeG459YNEUGjOrvIWV7TTQeJ3WZYi3HT9gnvtXrbGK54kJ+evENJDuAH8da
 xlEHKEdAoChfkzXSqsfP92vgYR+UX6VsoEAAcB+dygSa+DCAagMoJVQTO21LdvRp
 1eQAA5a45vUoh78C2InBt/KSlq7v+V9+PV5sWD0ZTj+B6y61EuuWIscjyx8Wsrqc
 9tH2Wrtuzm+oOQ==
X-ME-Sender: <xms:uQejXrqfO2ZAPpZk3AE8odgCQWQ5hRXyRObpljafIFJr1kNBYGsx0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeekvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uQejXp4TgUVdoT5joefpPH7-7oOjmKHJ_WCAfXG8ssOohzYnxbxA_Q>
 <xmx:uQejXjM76Gr03H2Z1vry_63yQzPTABa25gL9L_098pwSldMPZyh2AA>
 <xmx:uQejXjMQFAaCxj21EvQhDzkb6Gcf4VB7BcE5pz5qjwDCO9cc3tD1kQ>
 <xmx:uQejXg1csJ1Lt9nZdfVxAnHg4WaYHgdB54ryA-uw7u3Rk--ckz4Yepbq9ew>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 213B73065D9A;
 Fri, 24 Apr 2020 11:37:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 91/91] ARM: dts: bcm2711: Enable the display pipeline
Date: Fri, 24 Apr 2020 17:35:12 +0200
Message-Id: <7e7941611dad8106e5d9b03eeae06a6aefc0772c.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that all the drivers have been adjusted for it, let's bring in the
necessary device tree changes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  46 +++++++++++-
 arch/arm/boot/dts/bcm2711.dtsi        | 115 ++++++++++++++++++++++++++-
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 3205d2dfa898..0efbc4412dc9 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -220,3 +220,49 @@
 &vchiq {
 	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 };
+
+&vc4 {
+	status = "okay";
+};
+
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
+&pixelvalve2 {
+	status = "okay";
+};
+
+&pixelvalve3 {
+	status = "okay";
+};
+
+&pixelvalve4 {
+	status = "okay";
+};
+
+&hdmi0 {
+	clocks = <&firmware_clocks 13>, <&dvp 0>;
+	status = "okay";
+};
+
+&ddc0 {
+	status = "okay";
+};
+
+&hdmi1 {
+	clocks = <&firmware_clocks 13>, <&dvp 1>;
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&hvs {
+	clocks = <&firmware_clocks 4>;
+};
diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 00bcaed1be32..a6549fa6e62b 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -12,6 +12,11 @@
 
 	interrupt-parent = <&gicv2>;
 
+	vc4: gpu {
+		compatible = "brcm,bcm2711-vc5";
+		status = "disabled";
+	};
+
 	clk_108MHz: clk-108M {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -238,6 +243,27 @@
 			status = "disabled";
 		};
 
+		pixelvalve0: pixelvalve@7e206000 {
+			compatible = "brcm,bcm2711-pixelvalve0";
+			reg = <0x7e206000 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		pixelvalve1: pixelvalve@7e207000 {
+			compatible = "brcm,bcm2711-pixelvalve1";
+			reg = <0x7e207000 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		pixelvalve2: pixelvalve@7e20a000 {
+			compatible = "brcm,bcm2711-pixelvalve2";
+			reg = <0x7e20a000 0x100>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		pwm1: pwm@7e20c800 {
 			compatible = "brcm,bcm2835-pwm";
 			reg = <0x7e20c800 0x28>;
@@ -248,10 +274,25 @@
 			status = "disabled";
 		};
 
-		hvs@7e400000 {
+		pixelvalve4: pixelvalve@7e216000 {
+			compatible = "brcm,bcm2711-pixelvalve4";
+			reg = <0x7e216000 0x100>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		hvs: hvs@7e400000 {
+			compatible = "brcm,bcm2711-hvs";
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pixelvalve3: pixelvalve@7ec12000 {
+			compatible = "brcm,bcm2711-pixelvalve3";
+			reg = <0x7ec12000 0x100>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		dvp: clock@7ef00000 {
 			compatible = "brcm,brcm2711-dvp";
 			reg = <0x7ef00000 0x10>;
@@ -259,6 +300,78 @@
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		hdmi0: hdmi@7ef00700 {
+			compatible = "brcm,bcm2711-hdmi0";
+			reg = <0x7ef00700 0x300>,
+			      <0x7ef00300 0x200>,
+			      <0x7ef00f00 0x80>,
+			      <0x7ef00f80 0x80>,
+			      <0x7ef01b00 0x200>,
+			      <0x7ef01f00 0x400>,
+			      <0x7ef00200 0x80>,
+			      <0x7ef04300 0x100>,
+			      <0x7ef20000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			clock-names = "hdmi", "clk-108M";
+			resets = <&dvp 0>;
+			ddc = <&ddc0>;
+			dmas = <&dma 10>;
+			dma-names = "audio-rx";
+			status = "disabled";
+		};
+
+		ddc0: i2c@7ef04500 {
+			compatible = "brcm,bcm2711-hdmi-i2c";
+			reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
+			reg-names = "bsc", "auto-i2c";
+			clock-frequency = <390000>;
+			status = "disabled";
+		};
+
+		hdmi1: hdmi@7ef05700 {
+			compatible = "brcm,bcm2711-hdmi1";
+			reg = <0x7ef05700 0x300>,
+			      <0x7ef05300 0x200>,
+			      <0x7ef05f00 0x80>,
+			      <0x7ef05f80 0x80>,
+			      <0x7ef06b00 0x200>,
+			      <0x7ef06f00 0x400>,
+			      <0x7ef00280 0x80>,
+			      <0x7ef09300 0x100>,
+			      <0x7ef20000 0x100>;
+			reg-names = "hdmi",
+				    "dvp",
+				    "phy",
+				    "rm",
+				    "packet",
+				    "metadata",
+				    "csc",
+				    "cec",
+				    "hd";
+			ddc = <&ddc1>;
+			clock-names = "hdmi", "clk-108M";
+			resets = <&dvp 1>;
+			dmas = <&dma 17>;
+			dma-names = "audio-rx";
+			status = "disabled";
+		};
+
+		ddc1: i2c@7ef09500 {
+			compatible = "brcm,bcm2711-hdmi-i2c";
+			reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
+			reg-names = "bsc", "auto-i2c";
+			clock-frequency = <390000>;
+			status = "disabled";
+		};
 	};
 
 	/*
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
