Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF9BC42371
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E34510E1B7;
	Sat,  8 Nov 2025 01:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="r3kyRRXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CBB10E182
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:10:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251108010457euoutp01cedb2c8262766eb1481041d2c81944ca~14obFmMqQ2093120931euoutp01V;
 Sat,  8 Nov 2025 01:04:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251108010457euoutp01cedb2c8262766eb1481041d2c81944ca~14obFmMqQ2093120931euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762563897;
 bh=KZDMheUIPVF8t1/EjXIGU5z5BgHTqhezvC9uuZ+yk4w=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=r3kyRRXeT9wkwgWjYLENKSzeOqhQIXAOPGkBH8ALiDqiXV+fnr75uGL45pauFAbC2
 ucIsQ68pdfqbDCT7et3UH83FEFUxN9aftU5Bft/VMlS/Vb86ReGgyPxHHLb2tfdYi2
 M2N8FK5G4jwu+6JeRHL5wdsYGMrtCI7CQNUiNH8M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010456eucas1p2a8b17a5c7403ce133e8ed2dd3481c4f0~14oZ_LScs0821708217eucas1p2A;
 Sat,  8 Nov 2025 01:04:56 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20251108010454eusmtip2c99c393e840653a6a60f6de581bc622c~14oYiDJKP2515425154eusmtip2Y;
 Sat,  8 Nov 2025 01:04:54 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Sat, 08 Nov 2025 02:04:37 +0100
Subject: [PATCH RFC 03/13] dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-jh7110-clean-send-v1-3-06bf43bb76b1@samsung.com>
In-Reply-To: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Conor Dooley
 <conor@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Xingyu
 Wu <xingyu.wu@starfivetech.com>, Vinod Koul <vkoul@kernel.org>,  Kishon
 Vijay Abraham I <kishon@kernel.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Icenowy Zheng <uwu@icenowy.me>,  Maud Spierings
 <maudspierings@gocontroll.com>, Andy Yan <andyshrk@163.com>,  Heiko Stuebner
 <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251108010456eucas1p2a8b17a5c7403ce133e8ed2dd3481c4f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251108010456eucas1p2a8b17a5c7403ce133e8ed2dd3481c4f0
X-EPHeader: CA
X-CMS-RootMailID: 20251108010456eucas1p2a8b17a5c7403ce133e8ed2dd3481c4f0
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
 <CGME20251108010456eucas1p2a8b17a5c7403ce133e8ed2dd3481c4f0@eucas1p2.samsung.com>
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

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.

This device is a child of the starfive,jh7110-hdmi-mfd node. It
functions as both a PHY provider for the controller and as a clock
provider for the variable pixel clock (hdmi_pclk), which it generates
from its refoclk.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a737ba767d4aa7c6cba197dc0314bdbb163930c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon INNO HDMI PHY
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The PHY portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-phy
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: refoclk
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    const: hdmi_pclk
+
+  '#phy-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - clock-output-names
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        hdmi_mfd: hdmi@29590000 {
+            compatible = "starfive,jh7110-hdmi-mfd";
+            reg = <0x29590000 0x4000>;
+
+            hdmi_phy: phy {
+                compatible = "starfive,jh7110-inno-hdmi-phy";
+                clocks = <&xin24m>;
+                clock-names = "refoclk";
+                #clock-cells = <0>;
+                clock-output-names = "hdmi_pclk";
+                #phy-cells = <0>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 99434e54dc39494153677a6ca359d70f2ba2ddb3..a75ba7a44ee84db6a75b91c1a0867a37db2ebcdb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24047,6 +24047,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 STARFIVE JH7110 DISPLAY SUBSYSTEM
 M:	Michal Wilczynski <m.wilczynski@samsung.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
 F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
 
 STARFIVE JH7110 DPHY RX DRIVER

-- 
2.34.1

