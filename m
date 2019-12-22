Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3134128E32
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 14:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11176E532;
	Sun, 22 Dec 2019 13:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E836E532
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 13:29:55 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y14so7800065pfm.13
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 05:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xq2qov66+ZKQzbRfM2Ia41hD0OqHDHdZrt8IUGMciys=;
 b=aN/z+SvOEIOG7pKfL3EAs/o2YJxa4fGDyhDurxf9BFee4oUQOYmh5YDzvcR0++/wgO
 /UTCY/yccmcyFCUrb3G+F+ufbTU4HXVCd7avRL5pQXSUmTfQVhcoU3sY2/gnEzWFBgd2
 V4V2g8nvEvUnNSKNJoHUWTG97hocXPGtyNhps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xq2qov66+ZKQzbRfM2Ia41hD0OqHDHdZrt8IUGMciys=;
 b=cuDzMMlE3xf1pgi0Lt6+EeB/vHOCRCTzGf2AYv9drPSfHnzUfV7v1l6P2u/YPqL6UP
 K1DnzXYuHM8CXbhjjgVoGorGQ5ozwgqNeRJ5eJb1vminHCEB2qeEEKAs2tsShKvYlRdh
 UzO6m8yvqJh4BKQkXAyNGzyOa0bZAMcRC/YMuE4GT3bXJZWCdvYMjlh+A/tIGmjtzrNu
 V/8FGJpDtA2Q8VYFcfD4H1nvcJxPEKXo14vpp/I6Eswg6Hr44y6pNhkeeDuShovbc8Rd
 TMyWEEPLnQKzsyQrQ+QgfmxjXGHxMW54Rhonk/st1EbDp2hu2WS1bNLsUtmqhXyo4jmn
 OSgw==
X-Gm-Message-State: APjAAAWr2XThaYqhBD7hoGHWhgWMyXGnj7i7zEA8JSyJIdmvzXzzQvTU
 0gfpqJA/Ha6UynZ//h28MtfV3w==
X-Google-Smtp-Source: APXvYqxHOIWV1QpzQpqIk+oG3B9jfIK2/Lz4J3qY5Xg5MsBrwBHFlLSPubYChCJEMqxNWmsb1jEwpA==
X-Received: by 2002:a63:e911:: with SMTP id i17mr26186191pgh.42.1577021395126; 
 Sun, 22 Dec 2019 05:29:55 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.16])
 by smtp.gmail.com with ESMTPSA id o2sm12073058pjo.26.2019.12.22.05.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 05:29:54 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v14 6/7] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Sun, 22 Dec 2019 18:52:28 +0530
Message-Id: <20191222132229.30276-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191222132229.30276-1-jagan@amarulasolutions.com>
References: <20191222132229.30276-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI DSI pipeline for Allwinner A64.

- dsi node, with A64 compatible since it doesn't support
  DSI_SCLK gating unlike A33
- dphy node, with A64 compatible with A33 fallback since
  DPHY on A64 and A33 is similar
- finally, attach the dsi_in to tcon0 for complete MIPI DSI

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
Changes for v14:
- none

 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 27e48234f1c2..1db8378f59a4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -382,6 +382,12 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+
+					tcon0_out_dsi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dsi_in_tcon0>;
+						allwinner,tcon-channel = <1>;
+					};
 				};
 			};
 		};
@@ -1014,6 +1020,37 @@
 			status = "disabled";
 		};
 
+		dsi: dsi@1ca0000 {
+			compatible = "allwinner,sun50i-a64-mipi-dsi";
+			reg = <0x01ca0000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>;
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			phys = <&dphy>;
+			phy-names = "dphy";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port {
+				dsi_in_tcon0: endpoint {
+					remote-endpoint = <&tcon0_out_dsi>;
+				};
+			};
+		};
+
+		dphy: d-phy@1ca1000 {
+			compatible = "allwinner,sun50i-a64-mipi-dphy",
+				     "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01ca1000 0x1000>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&ccu CLK_DSI_DPHY>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
