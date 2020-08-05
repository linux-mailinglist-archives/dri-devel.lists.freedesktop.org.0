Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833623C6AB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413EE6E098;
	Wed,  5 Aug 2020 07:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de [95.129.51.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDF46E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:56:10 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 871D59614E;
 Tue,  4 Aug 2020 16:56:09 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 5922040295;
 Tue,  4 Aug 2020 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ewXB5FpohxgJpmkvbol3KpCl1csVHrG3vmcWsHV3gc=;
 b=lZemiGumuSpSI/q66uA5a9WrKtHLa4xuMZDfSUWRRizIvx+mbfG/VPtSmqYLA39Hq5et5F
 h65yZq4KGy3G6aV3NZvSEyUXMF5LL7fwTbzNGFn9dcv/CEFMlrz9IPGQCKJWZh2uYrT6Lo
 C0vGG9ubDs0zG+JWUhE5JtyWPK2ah70=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id A3D223605F9;
 Tue,  4 Aug 2020 16:56:08 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
Date: Tue,  4 Aug 2020 18:55:49 +0200
Message-Id: <20200804165555.75159-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frank Wunderlich <frank-w@public-files.de>

mt7623 uses mt2701/mt8173 for drm, but have own compatibles

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709db7a4..121220745d46 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -43,7 +43,7 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt2712 and mt8173.
+  the supported chips are mt2701, mt7623, mt2712 and mt8173.
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index 77def4456706..dc1ebd13cc88 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -7,7 +7,7 @@ output bus.
 
 Required properties:
 - compatible: "mediatek,<chip>-dpi"
-  the supported chips are mt2701 , mt8173 and mt8183.
+  the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 8e4729de8c85..f06f24d405a5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
 
 Required properties:
 - compatible: "mediatek,<chip>-mipi-tx"
-  the supported chips are mt2701, mt8173 and mt8183.
+- the supported chips are mt2701, 7623, mt8173 and mt8183.
 - reg: Physical base address and length of the controller's registers
 - clocks: PLL reference clock
 - clock-output-names: name of the output clock line to the DSI encoder
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
index 7b124242b0c5..6b1c586403e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
@@ -6,6 +6,7 @@ its parallel input.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi".
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
@@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-cec"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clock
@@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
 
 Required properties:
 - compatible: Should be "mediatek,<chip>-hdmi-ddc"
+- the supported chips are mt7623 and mt8173
 - reg: Physical base address and length of the controller's registers
 - clocks: device clock
 - clock-names: Should be "ddc-i2c".
@@ -56,6 +59,7 @@ output and drives the HDMI pads.
 
 Required properties:
 - compatible: "mediatek,<chip>-hdmi-phy"
+- the supported chips are mt2701, mt7623 and mt8173
 - reg: Physical base address and length of the module's registers
 - clocks: PLL reference clock
 - clock-names: must contain "pll_ref"
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
