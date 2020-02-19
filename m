Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D706A16598E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A0B6ED01;
	Thu, 20 Feb 2020 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC866EC69
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:10:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id x7so1383746ljc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXy/lin2Xh1wX40VjvzK4N5EhPUQ7F76cQqtDhuzdAw=;
 b=ZSmb5C/cZRYqsLdPN5VclmwPUdQnDwDtrA7+GzYBWb84Svro7eD8Goee9p+QyRNffa
 lpqAyFWy+OjRvu2rpmV7A4Jmhdsc+5LuASif2bPB98oAKK8SAwcn+GtOJIG8ms9rTe/N
 RP4ciMh5Oz0za8q1UrrAdZnxI7sqVIsyXhU/gxjc2NDufE8aa+dHG/ouZuOl4lxk5/xs
 PNhGSDzRpOqOb5liAqynz+yB+24F4ZZtRq81KpAGlGd+fDNr3x49k47xudxaB+T9qNIU
 PHdveJ7Khmi/0PaqciofTOm9bLWPWJ953WvudgraUKFCfqbcNtpMhezDXeFq8Ab8SS8K
 lGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXy/lin2Xh1wX40VjvzK4N5EhPUQ7F76cQqtDhuzdAw=;
 b=Z2kbgZZXXHYYBiKFEVb934//as8N030gaJUP9u5sySu3mFNl/sH4OYyhsbNCWY6Rpa
 uOB2I40yIqScAs0LWWgOEK7luVKAQMq7iRFF31mY0GSw4D51CtTMlvE3tTnEe6JLX+CP
 k7a2PIv5oVv0OmfDmbtPR51uM2TElW4Bsn5Uh8XSR7oeKCZ1g58f7GeAp1QsFZ0eyiSd
 NKfaDjxTqPTi2kR8b/8lqAr/giS8IOXUcwL84mdqbsYPqfOFbXHVMqUc2nNp8ItsoU5m
 r9Xa7oAm1a2yBU3cnu6dj7pvWwrcOhsdJ8n4rt5Hn7sMi9XQ4zBExfswaX37wP2ZC8Yf
 5zfg==
X-Gm-Message-State: APjAAAUoFmTlZUV6W20JEvcLGvB0bq+FKH8uNa3udn1gC8LVlkD/leT9
 EaQBwe19X6erBcOV1or/+rI=
X-Google-Smtp-Source: APXvYqwZu3/RGiLTbpL0Zcsi2lbhwfT1xxLVM2mwlQE0Ir+J5oDWNK91WxTAezMAOPajhF/43rFOuw==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr16664008ljc.279.1582135801686; 
 Wed, 19 Feb 2020 10:10:01 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 14sm183942lfz.47.2020.02.19.10.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:10:00 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: sun7i: Add LVDS panel support on A20
Date: Wed, 19 Feb 2020 20:08:56 +0200
Message-Id: <20200219180858.4806-4-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219180858.4806-1-andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
 arch/arm/boot/dts/sun7i-a20.dtsi | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 92b5be97085d..d50263c1ca9a 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -47,6 +47,7 @@
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/clock/sun7i-a20-ccu.h>
 #include <dt-bindings/reset/sun4i-a10-ccu.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -404,11 +405,12 @@
 		};
 
 		tcon0: lcd-controller@1c0c000 {
-			compatible = "allwinner,sun7i-a20-tcon";
+			compatible = "allwinner,sun7i-a20-tcon0",
+				     "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&ccu RST_TCON0>;
-			reset-names = "lcd";
+			resets = <&ccu RST_TCON0>, <&ccu RST_LVDS>;
+			reset-names = "lcd", "lvds";
 			clocks = <&ccu CLK_AHB_LCD0>,
 				 <&ccu CLK_TCON0_CH0>,
 				 <&ccu CLK_TCON0_CH1>;
@@ -444,6 +446,11 @@
 					#size-cells = <0>;
 					reg = <1>;
 
+					tcon0_out_lvds: endpoint@0 {
+						reg = <0>;
+						allwinner,tcon-channel = <0>;
+					};
+
 					tcon0_out_hdmi: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&hdmi_in_tcon0>;
@@ -454,7 +461,8 @@
 		};
 
 		tcon1: lcd-controller@1c0d000 {
-			compatible = "allwinner,sun7i-a20-tcon";
+			compatible = "allwinner,sun7i-a20-tcon1",
+				     "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0d000 0x1000>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_TCON1>;
@@ -931,6 +939,20 @@
 				function = "ir1";
 			};
 
+			/omit-if-no-ref/
+			lcd_lvds0_pins: lcd-lvds0-pins {
+				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
+				       "PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+			};
+
+			/omit-if-no-ref/
+			lcd_lvds1_pins: lcd-lvds1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13", "PD14",
+				       "PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+			};
+
 			/omit-if-no-ref/
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
