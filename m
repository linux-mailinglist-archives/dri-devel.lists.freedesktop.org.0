Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AC12D8C7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135B86E227;
	Tue, 31 Dec 2019 13:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F66E227
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:06:22 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c13so15903147pls.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXe17pB2YX4+a+B1E8N8lDCTkuNeVa3zzzOGyzeuSys=;
 b=Xf+YTt7DfVvRCedUsAinpV3gLCg7SQWb27vKaMoWf0AxV5Ig7mLEyrsAaBoKisMnpo
 kGQVw1Tzx4RxuNcQ8CW292dVNXAccfNluNAT1XJL9XHIe1o5EriOTeHp6Z/Izy71lKNf
 ieLQ7eq/kP+w1W9qC/RIQ3WAHWZG3kTzWynY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXe17pB2YX4+a+B1E8N8lDCTkuNeVa3zzzOGyzeuSys=;
 b=X3f+9c8H+Jj/Vh1ekY3zz0jiDeuWDgIokotsEzhHiOLt/C5ZR/wV+WhQ8oST/b6+Ra
 DUc2id9oW8rkkm0bwa0X35dRlwf2gyQITwnLZ2QBan1VonO24S51JGXRtGhUJI7laXHC
 ciJgmU2JN1njJpYuXgYLmzKyIS+cCzvCzhWDhJ0rztgLVU1PVEabVZdPc5YV3OXTc48K
 kxiV4hrnmTsytbx5tlnGTiusAymxG83lQwJXw+KOO0TDGf3+gGYxUqBk9ZKfSzqFbvDC
 jNDLG06LF4Fl+17Y2nvOt2ViW0L+Fe3KzDeLjmij9P+e7ANmzdyqE/Z0HJA62ax8AJ73
 RYYg==
X-Gm-Message-State: APjAAAXGVe0bXm26wzNE2ps217tnRaXxix9dpHbrd9arA0bJJmqfLUsf
 Vk0qQue4ZvexXUQovDqihh3jIA==
X-Google-Smtp-Source: APXvYqwgs9Bcy+Z1Q95DxDdQGebtt2lr2Jj5jnrCw2RqXNwEkWy7kQOj9wu1KDy5cwYGG9UM+31XiA==
X-Received: by 2002:a17:90a:e657:: with SMTP id
 ep23mr5986713pjb.105.1577797582087; 
 Tue, 31 Dec 2019 05:06:22 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.115])
 by smtp.gmail.com with ESMTPSA id i3sm55204089pfg.94.2019.12.31.05.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 05:06:21 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 8/9] ARM: dts: sun8i: r40: Add MIPI DSI pipeline
Date: Tue, 31 Dec 2019 18:35:27 +0530
Message-Id: <20191231130528.20669-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191231130528.20669-1-jagan@amarulasolutions.com>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI DSI pipeline for Allwinner R40.

Unlike conventional Display pipeline in allwinner, R40 have
TCON TCOP which would interact various block like muxes,
tcon lcd, tcon_tv for better pipeline fitting.

For MIPI DSI pipeline, we have to configure the tcon_lcd0
block which would interact with tcon_top for upper pipeline
connections and dsi block for lower pipeline connections.

So, this patch created that pipeline by adding new nodes
for tcon_lcd0, dsi, dphy and connet them to make proper
pipeline fitting.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- drop clock-names in dsi node

 arch/arm/boot/dts/sun8i-r40.dtsi | 72 ++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 3faa35d43afa..4c61e93d9a0b 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -628,6 +628,7 @@
 
 					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
 						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
 					};
 
 					tcon_top_mixer0_out_tcon_lcd1: endpoint@1 {
@@ -706,6 +707,45 @@
 			};
 		};
 
+		tcon_lcd0: lcd-controller@1c71000 {
+			compatible = "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x01c71000 0x1000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-pixel-clock";
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_lcd0_out_dsi_out: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dsi_in_tcon_lcd0_out>;
+					};
+				};
+			};
+		};
+
 		tcon_tv0: lcd-controller@1c73000 {
 			compatible = "allwinner,sun8i-r40-tcon-tv";
 			reg = <0x01c73000 0x1000>;
@@ -803,6 +843,38 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		dsi: dsi@1ca0000 {
+			compatible = "allwinner,sun8i-r40-mipi-dsi",
+				     "allwinner,sun50i-a64-mipi-dsi";
+			reg = <0x01ca0000 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>;
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			phys = <&dphy>;
+			phy-names = "dphy";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port {
+				dsi_in_tcon_lcd0_out: endpoint {
+					remote-endpoint = <&tcon_lcd0_out_dsi_out>;
+				};
+			};
+		};
+
+		dphy: d-phy@1ca1000 {
+			compatible = "allwinner,sun8i-r40-mipi-dphy",
+				     "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01ca1000 0x1000>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&tcon_top CLK_TCON_TOP_DSI>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun8i-r40-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
