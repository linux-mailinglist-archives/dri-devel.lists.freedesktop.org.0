Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7E15BA95
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049E28826D;
	Thu, 13 Feb 2020 08:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47366E11F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 22:25:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n25so2779728lfl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P2sufO4LLXac8EpPRG82WEu62FbVXGdtrzG0LXHZeOc=;
 b=qWCgfyyaZcVlwnASB423iewuwd4fmtQcfKUkenO0oPI3pkWLGoRCTD9Fk/kaJW0CjH
 //r1Yth+Eqaq0+HtY38lAOhJQ69YyTEGFlnVRffyeb7AmMJdvsL9PELN35JM6nB2cKuy
 Y3cja1QMzIOqJxVK6+4lAHDuXG02HNegLzdn5G0ycXzutBpdU9qEPbU+H09ZGnSR6wE4
 X2OqusGjh1VDDNjsn2bsVIA2CLJ30WysxmJKeYafXTNFWGS3dHb7zOqcN1i/V0Ht2GGt
 KlMAhWNJShkvfwdlVpgEHu7/by0Jkq0c3SCAUr7SFH4lRfVFrFFBqjiUZobk1UOQcN1c
 90UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2sufO4LLXac8EpPRG82WEu62FbVXGdtrzG0LXHZeOc=;
 b=Xz9ufxLmtDW+5uKT0UKwKLhrLyeFNxkkz9tZ7+MIMGO88ZE5ilN7fe4LE9dpxOEXap
 GCJ5BqkQQnZYkZz8J0+2psXQ6M+5Jg51wHN7E/yZRVa6oYyDz9WspW1UMwBuY2buoq7N
 ysFa01e1VIewSn5RgJCj9eL/GkTJZChu8Qj07h9oiHGw7AxTARTiLZNJla/8O0nkfslj
 EIt6GKpsMxDxWjQHwLl3L30oZ3/MWQ2DkErCAy/6OK6E1GS6RMONIC6jvLeJELOTql7z
 Y1cm0YeBPrMTvOIS5RYepZF8Q+ZBQ6qf1TXltaFwZyMOejbze9xeaacLLfVNxa9cW7Dg
 muCA==
X-Gm-Message-State: APjAAAUxM0lyHukLG/UIlCR/7Go2lIejzZAXF27+C55acBaPU5ym+hq8
 VIOMhU6/J3b5qia/osJZs2g=
X-Google-Smtp-Source: APXvYqzbSsCCf3UaK7PD3uxjPodMUnmbNyBSe6Xyg4gzlkdOwnEbZsG8gzDBCSwmJ7KSr76ZxQ1kNA==
X-Received: by 2002:ac2:523c:: with SMTP id i28mr7610773lfl.104.1581546337071; 
 Wed, 12 Feb 2020 14:25:37 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 126sm188008lfm.38.2020.02.12.14.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 14:25:36 -0800 (PST)
From: andrey.lebedev@gmail.com
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Date: Thu, 13 Feb 2020 00:23:57 +0200
Message-Id: <20200212222355.17141-2-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210195633.GA21832@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: Andrey Lebedev <andrey@lebedev.lt>, linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

Define pins for LVDS channels 0 and 1, configure reset line for tcon0 and
provide sample LVDS panel, connected to tcon0.

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 45 +++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 92b5be97085d..b05fdf8df32e 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -47,6 +47,7 @@
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/clock/sun7i-a20-ccu.h>
 #include <dt-bindings/reset/sun4i-a10-ccu.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -407,8 +408,8 @@
 			compatible = "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&ccu RST_TCON0>;
-			reset-names = "lcd";
+			resets = <&ccu RST_TCON0>, <&ccu RST_LVDS>;
+			reset-names = "lcd", "lvds";
 			clocks = <&ccu CLK_AHB_LCD0>,
 				 <&ccu CLK_TCON0_CH0>,
 				 <&ccu CLK_TCON0_CH1>;
@@ -444,6 +445,11 @@
 					#size-cells = <0>;
 					reg = <1>;
 
+					tcon0_out_lvds: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&lvds_in_tcon0>;
+						allwinner,tcon-channel = <0>;
+					};
 					tcon0_out_hdmi: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&hdmi_in_tcon0>;
@@ -686,6 +692,19 @@
 			};
 		};
 
+		lvds_panel: panel@1c16500 {
+			compatible = "panel-lvds";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			port {
+				lvds_in_tcon0: endpoint {
+					remote-endpoint = <&tcon0_out_lvds>;
+				};
+			};
+		};
+
 		spi2: spi@1c17000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c17000 0x1000>;
@@ -872,7 +891,7 @@
 			gmac_rgmii_pins: gmac-rgmii-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-				        "PA7", "PA8", "PA10",
+					"PA7", "PA8", "PA10",
 				       "PA11", "PA12", "PA13",
 				       "PA15", "PA16";
 				function = "gmac";
@@ -1162,6 +1181,26 @@
 				pins = "PI20", "PI21";
 				function = "uart7";
 			};
+
+			/omit-if-no-ref/
+			lcd_lvds0_pins: lcd_lvds0_pins {
+				allwinner,pins =
+					"PD0", "PD1", "PD2", "PD3", "PD4",
+					"PD5", "PD6", "PD7", "PD8", "PD9";
+				allwinner,function = "lvds0";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
+
+			/omit-if-no-ref/
+			lcd_lvds1_pins: lcd_lvds1_pins {
+				allwinner,pins =
+					"PD10", "PD11", "PD12", "PD13", "PD14",
+					"PD15", "PD16", "PD17", "PD18", "PD19";
+				allwinner,function = "lvds1";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+			};
 		};
 
 		timer@1c20c00 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
