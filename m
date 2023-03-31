Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E876D2F07
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 10:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40010E04A;
	Sat,  1 Apr 2023 08:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Fri, 31 Mar 2023 11:03:00 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4DB10F1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:03:00 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id CF9F4C0008;
 Fri, 31 Mar 2023 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1680260578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fgmk/mwe5whG0BvKW+Z4uq6pXrcxqgZ9/TVRoi9sWUA=;
 b=ZY2HadDt2JF8K1PV9nVTSFDSJAjXCqYQsRmHyPNh/OHG7bIQO4PNhjxdtXN9wA0+PL38tW
 WbDh1gA0BXiZWen9rXj6rZbrGNqFMNmSgKJ6eSU5X2OV7eGMQPNSAOanjnIuLLq/bScptt
 PEsgeVvppmCBnBdUKEBCISCKYiduBfoN/CIAxFkRbAQxljb5V3/9rLAazwDnH6WZoS/nYG
 51FmXo1jSLdNPp4WKyrLzhjU7DdOeoY+qWLaedGlvq7WgvFdsCBY1Wm39UpPKnuWHIBYh+
 jhGmYiNq58lGUkrOLUigAPQdpr0h9KcczO8/cpix3TcrYpo/2ofL+Jkhf1U/kA==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/3] ARM: dts: sunxi: rename tcon's clock output
Date: Fri, 31 Mar 2023 13:02:44 +0200
Message-Id: <20230331110245.43527-3-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230331110245.43527-1-me@crly.cz>
References: <20230331110245.43527-1-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 01 Apr 2023 08:14:47 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
outputs, this doesn't hold for DSI. According manuals from Allwinner,
DCLK is an abbrebiation of Data Clock, not dotclock, so go with that
instead.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 arch/arm/boot/dts/sun5i.dtsi                  | 2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             | 2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 250d6b87ab4d..2f901a013676 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -286,7 +286,7 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb",
 				      "tcon-ch0",
 				      "tcon-ch1";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			status = "disabled";
 
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index f630ab55bb6a..ddc87cc15e51 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -190,7 +190,7 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb",
 				      "tcon-ch0",
 				      "lvds-alt";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_LCD>,
 				 <&ccu RST_BUS_LVDS>;
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 82fdb04122ca..94eb3bfc989e 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -456,7 +456,7 @@ tcon0: lcd-controller@1c0c000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
 			clock-names = "ahb", "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index db194c606fdc..ab2a0e1235e4 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -191,7 +191,7 @@ tcon0: lcd-controller@1c0c000 {
 				 <&ccu CLK_TCON0>;
 			clock-names = "ahb",
 				      "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>;
 			reset-names = "lcd";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..e3b17575699c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -407,7 +407,7 @@ tcon0: lcd-controller@1c0c000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
 			clock-names = "ahb", "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
-- 
2.32.0 (Apple Git-132)

