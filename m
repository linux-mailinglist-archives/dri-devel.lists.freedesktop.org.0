Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8B3F1055
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 04:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ED56E91F;
	Thu, 19 Aug 2021 02:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C046E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:23:51 +0000 (UTC)
X-UUID: 38e9bd8ed35643ca82fa113c522d4363-20210819
X-UUID: 38e9bd8ed35643ca82fa113c522d4363-20210819
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1794151220; Thu, 19 Aug 2021 10:23:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 10:23:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 10:23:44 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 02/13] dt-bindings: mediatek: display: split each block to
 individual yaml
Date: Thu, 19 Aug 2021 10:23:16 +0800
Message-ID: <20210819022327.13040-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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

1. Remove mediatek,dislpay.txt
2. Split each display function block to individual yaml file.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../display/mediatek/mediatek,aal.yaml        |  75 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  69 ++++++
 .../display/mediatek/mediatek,color.yaml      |  84 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ------------------
 .../display/mediatek/mediatek,dither.yaml     |  70 ++++++
 .../display/mediatek/mediatek,gamma.yaml      |  71 ++++++
 .../display/mediatek/mediatek,merge.yaml      |  57 +++++
 .../display/mediatek/mediatek,mutex.yaml      |  77 ++++++
 .../display/mediatek/mediatek,od.yaml         |  52 +++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  86 +++++++
 .../display/mediatek/mediatek,ovl.yaml        |  96 ++++++++
 .../display/mediatek/mediatek,rdma.yaml       | 110 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  56 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  59 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  86 +++++++
 15 files changed, 1048 insertions(+), 219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
new file mode 100644
index 000000000000..7be772d77e36
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display adaptive ambient light processor
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display adaptive ambient light processor, namely AAL,
+  is responsible for backlight power saving and sunlight visibility improving.
+  AAL device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-aal
+      - items:
+          - enum:
+              - mediatek,mt2712-disp-aal
+              - mediatek,mt8183-disp-aal
+          - enum:
+              - mediatek,mt8173-disp-aal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: AAL Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    aal@14015000 {
+        compatible = "mediatek,mt8173-disp-aal";
+        reg = <0 0x14015000 0 0x1000>;
+        interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_AAL>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
new file mode 100644
index 000000000000..5a1c27d6b3e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek Ddsplay color correction
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display color correction, namely CCORR, reproduces correct color
+  on panels with different color gamut.
+  CCORR device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-disp-ccorr
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: CCORR Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ccorr0: ccorr@1400f000 {
+        compatible = "mediatek,mt8183-disp-ccorr";
+        reg = <0 0x1400f000 0 0x1000>;
+        interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+    }
+;
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
new file mode 100644
index 000000000000..9a3edf6f0b8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display color processor
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek color processor, namely COLOR, provides hue, luma and
+  saturation adjustments to get better picture quality and to have one panel
+  resemble the other in their output characteristics.
+  COLOR device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-disp-color
+      - items:
+          - const: mediatek,mt8167-disp-color
+      - items:
+          - const: mediatek,mt8173-disp-color
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-color
+              - mediatek,mt2712-disp-color
+          - enum:
+              - mediatek,mt2701-disp-color
+      - items:
+          - enum:
+              - mediatek,mt8183-disp-color
+          - enum:
+              - mediatek,mt8173-disp-color
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: COLOR Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    color0: color@14013000 {
+        compatible = "mediatek,mt8173-disp-color";
+        reg = <0 0x14013000 0 0x1000>;
+        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
deleted file mode 100644
index fbb59c9ddda6..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ /dev/null
@@ -1,219 +0,0 @@
-Mediatek display subsystem
-==========================
-
-The Mediatek display subsystem consists of various DISP function blocks in the
-MMSYS register space. The connections between them can be configured by output
-and input selectors in the MMSYS_CONFIG register space. Pixel clock and start
-of frame signal are distributed to the other function blocks by a DISP_MUTEX
-function block.
-
-All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
-For a description of the MMSYS_CONFIG binding, see
-Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
-
-DISP function blocks
-====================
-
-A display stream starts at a source function block that reads pixel data from
-memory and ends with a sink function block that drives pixels on a display
-interface, or writes pixels back to memory. All DISP function blocks have
-their own register space, interrupt, and clock gate. The blocks that can
-access memory additionally have to list the IOMMU and local arbiter they are
-connected to.
-
-For a description of the display interface sink function blocks, see
-Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
-Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
-
-Required properties (all function blocks):
-- compatible: "mediatek,<chip>-disp-<function>", one of
-	"mediatek,<chip>-disp-ovl"   		- overlay (4 layers, blending, csc)
-	"mediatek,<chip>-disp-ovl-2l"           - overlay (2 layers, blending, csc)
-	"mediatek,<chip>-disp-rdma"  		- read DMA / line buffer
-	"mediatek,<chip>-disp-wdma"  		- write DMA
-	"mediatek,<chip>-disp-ccorr"            - color correction
-	"mediatek,<chip>-disp-color" 		- color processor
-	"mediatek,<chip>-disp-dither"           - dither
-	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
-	"mediatek,<chip>-disp-gamma" 		- gamma correction
-	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
-	"mediatek,<chip>-disp-postmask" 	- control round corner for display frame
-	"mediatek,<chip>-disp-split" 		- split stream to two encoders
-	"mediatek,<chip>-disp-ufoe"  		- data compression engine
-	"mediatek,<chip>-dsi"        		- DSI controller, see mediatek,dsi.txt
-	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
-	"mediatek,<chip>-disp-mutex" 		- display mutex
-	"mediatek,<chip>-disp-od"    		- overdrive
-  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173, mt8183 and mt8192.
-- reg: Physical base address and length of the function block register space
-- interrupts: The interrupt signal from the function block (required, except for
-  merge and split function blocks).
-- clocks: device clocks
-  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-  For most function blocks this is just a single clock input. Only the DSI and
-  DPI controller nodes have multiple clock inputs. These are documented in
-  mediatek,dsi.txt and mediatek,dpi.txt, respectively.
-  An exception is that the mt8183 mutex is always free running with no clocks property.
-
-Required properties (DMA function blocks):
-- compatible: Should be one of
-	"mediatek,<chip>-disp-ovl"
-	"mediatek,<chip>-disp-rdma"
-	"mediatek,<chip>-disp-wdma"
-  the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-- iommus: Should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Optional properties (RDMA function blocks):
-- mediatek,rdma-fifo-size: rdma fifo size may be different even in same SOC, add this
-  property to the corresponding rdma
-  the value is the Max value which defined in hardware data sheet.
-  mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
-  mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
-  mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
-
-Examples:
-
-mmsys: clock-controller@14000000 {
-	compatible = "mediatek,mt8173-mmsys", "syscon";
-	reg = <0 0x14000000 0 0x1000>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	#clock-cells = <1>;
-};
-
-ovl0: ovl@1400c000 {
-	compatible = "mediatek,mt8173-disp-ovl";
-	reg = <0 0x1400c000 0 0x1000>;
-	interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OVL0>;
-	iommus = <&iommu M4U_PORT_DISP_OVL0>;
-	mediatek,larb = <&larb0>;
-};
-
-ovl1: ovl@1400d000 {
-	compatible = "mediatek,mt8173-disp-ovl";
-	reg = <0 0x1400d000 0 0x1000>;
-	interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OVL1>;
-	iommus = <&iommu M4U_PORT_DISP_OVL1>;
-	mediatek,larb = <&larb4>;
-};
-
-rdma0: rdma@1400e000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x1400e000 0 0x1000>;
-	interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-	mediatek,larb = <&larb0>;
-	mediatek,rdma-fifosize = <8192>;
-};
-
-rdma1: rdma@1400f000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x1400f000 0 0x1000>;
-	interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-	mediatek,larb = <&larb4>;
-};
-
-rdma2: rdma@14010000 {
-	compatible = "mediatek,mt8173-disp-rdma";
-	reg = <0 0x14010000 0 0x1000>;
-	interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
-	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-	mediatek,larb = <&larb4>;
-};
-
-wdma0: wdma@14011000 {
-	compatible = "mediatek,mt8173-disp-wdma";
-	reg = <0 0x14011000 0 0x1000>;
-	interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
-	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-	mediatek,larb = <&larb0>;
-};
-
-wdma1: wdma@14012000 {
-	compatible = "mediatek,mt8173-disp-wdma";
-	reg = <0 0x14012000 0 0x1000>;
-	interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
-	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-	mediatek,larb = <&larb4>;
-};
-
-color0: color@14013000 {
-	compatible = "mediatek,mt8173-disp-color";
-	reg = <0 0x14013000 0 0x1000>;
-	interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_COLOR0>;
-};
-
-color1: color@14014000 {
-	compatible = "mediatek,mt8173-disp-color";
-	reg = <0 0x14014000 0 0x1000>;
-	interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_COLOR1>;
-};
-
-aal@14015000 {
-	compatible = "mediatek,mt8173-disp-aal";
-	reg = <0 0x14015000 0 0x1000>;
-	interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_AAL>;
-};
-
-gamma@14016000 {
-	compatible = "mediatek,mt8173-disp-gamma";
-	reg = <0 0x14016000 0 0x1000>;
-	interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_GAMMA>;
-};
-
-ufoe@1401a000 {
-	compatible = "mediatek,mt8173-disp-ufoe";
-	reg = <0 0x1401a000 0 0x1000>;
-	interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_UFOE>;
-};
-
-dsi0: dsi@1401b000 {
-	/* See mediatek,dsi.txt for details */
-};
-
-dpi0: dpi@1401d000 {
-	/* See mediatek,dpi.txt for details */
-};
-
-mutex: mutex@14020000 {
-	compatible = "mediatek,mt8173-disp-mutex";
-	reg = <0 0x14020000 0 0x1000>;
-	interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_MUTEX_32K>;
-};
-
-od@14023000 {
-	compatible = "mediatek,mt8173-disp-od";
-	reg = <0 0x14023000 0 0x1000>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	clocks = <&mmsys CLK_MM_DISP_OD>;
-};
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
new file mode 100644
index 000000000000..20419f876410
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dither.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display dither processor
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display dither processor, namely DITHER, works by approximating
+  unavailable colors with available colors and by mixing and matching available
+  colors to mimic unavailable ones.
+  DITHER device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-disp-dither
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: DITHER Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    dither0: dither@14012000 {
+        compatible = "mediatek,mt8183-disp-dither";
+        reg = <0 0x14012000 0 0x1000>;
+        interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
new file mode 100644
index 000000000000..e2a1fc218e4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,gamma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display gamma correction
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display gamma correction, namely GAMMA, provides a nonlinear operation
+  used to adjust luminance in display system.
+  GAMMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-gamma
+      - items:
+          - const: mediatek,mt8183-disp-gamma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: GAMMA Clock
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    gamma@14016000 {
+        compatible = "mediatek,mt8173-disp-gamma";
+        reg = <0 0x14016000 0 0x1000>;
+        interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
new file mode 100644
index 000000000000..4cdce11d7fcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,merge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display merge
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display merge engine is used to merge two slice-per-line inputs
+  into one side-by-side output.
+  MERGE device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-merge
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: MERGE Clock
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    merge@14017000 {
+        compatible = "mediatek,mt8173-disp-merge";
+        reg = <0 0x14017000 0 0x1000>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_MERGE>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
new file mode 100644
index 000000000000..aaba6bbfb4da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display mutex
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display mutex is used to send the triggers signals called
+  Start Of Frame (SOF)/ Error Of Frame (EOF) to each sub-modules on the
+  display data path.
+  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-disp-mutex
+      - items:
+          - const: mediatek,mt2712-disp-mutex
+      - items:
+          - const: mediatek,mt8167-disp-mutex
+      - items:
+          - const: mediatek,mt8173-disp-mutex
+      - items:
+          - const: mediatek,mt8183-disp-mutex
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: MUTEX Clock
+
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to the specific hardware event signal to gce.
+      The event id is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    mutex: mutex@14020000 {
+        compatible = "mediatek,mt8173-disp-mutex";
+        reg = <0 0x14020000 0 0x1000>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_MUTEX_32K>;
+        mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
new file mode 100644
index 000000000000..bcf3fddd9231
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,od.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display overdirve
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display overdrive, namely OD, increases the transition values
+  of pixels between consecutive frames to make LCD rotate faster.
+  OD device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2712-disp-od
+      - items:
+          - const: mediatek,mt8173-disp-od
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: OVL Clock
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    od@14023000 {
+        compatible = "mediatek,mt8173-disp-od";
+        reg = <0 0x14023000 0 0x1000>;
+        clocks = <&mmsys CLK_MM_DISP_OD>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
new file mode 100644
index 000000000000..6255074bf415
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl-2l.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display overlay 2 layer
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display overlay provides 2 more layer for OVL.
+  OVL-2L device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-disp-ovl-2l
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: OVL-2L Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,larb:
+    description:
+      This property should contain a phandle pointing to the local arbiter deviceas defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ovl_2l0: ovl@14009000 {
+        compatible = "mediatek,mt8183-disp-ovl-2l";
+        reg = <0 0x14009000 0 0x1000>;
+        interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+        iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
new file mode 100644
index 000000000000..833b0ca09b21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display overlay
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display overlay, namely OVL, can do alpha blending from the memory.
+  OVL device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+  for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-disp-ovl
+      - items:
+          - const: mediatek,mt8173-disp-ovl
+      - items:
+          - const: mediatek,mt8183-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-ovl
+              - mediatek,mt2712-disp-ovl
+          - enum:
+              - mediatek,mt2701-disp-ovl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: OVL Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,larb:
+    description:
+      This property should contain a phandle pointing to the local arbiter deviceas defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommu
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ovl0: ovl@1400c000 {
+        compatible = "mediatek,mt8173-disp-ovl";
+        reg = <0 0x1400c000 0 0x1000>;
+        interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_OVL0>;
+        iommus = <&iommu M4U_PORT_DISP_OVL0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
new file mode 100644
index 000000000000..ce3bcca30609
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display RDMA
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display RDMA stands for Read Direct Memory Access.
+  It provides real time data to the back-end panel driver, such as DSI,
+  DPI and DP_INTF.
+  It contains one line buffer to store the sufficient pixel data.
+  RDMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt2701-disp-rdma
+      - items:
+          - const: mediatek,mt8173-disp-rdma
+      - items:
+          - const: mediatek,mt8183-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt7623-disp-rdma
+              - mediatek,mt2712-disp-rdma
+          - enum:
+              - mediatek,mt2701-disp-rdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: RDMA Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,larb:
+    description:
+      This property should contain a phandle pointing to the local arbiter deviceas defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  mediatek,rdma-fifo-size:
+    description:
+      rdma fifo size may be different even in same SOC, add this property to the
+      corresponding rdma.
+      The value below is the Max value which defined in hardware data sheet
+      mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
+      mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
+      mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8192, 5120, 2048]
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    rdma0: rdma@1400e000 {
+        compatible = "mediatek,mt8173-disp-rdma";
+        reg = <0 0x1400e000 0 0x1000>;
+        interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+        mediatek,larb = <&larb0>;
+        mediatek,rdma-fifosize = <8192>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
new file mode 100644
index 000000000000..d751e0a0c3a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,split.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display split
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display split engine is used to split stream to two encoders.
+  SPLIT device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-split
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: SPLIT Clock
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    split0: split@14018000 {
+        compatible = "mediatek,mt8173-disp-split";
+        reg = <0 0x14018000 0 0x1000>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_SPLIT0>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
new file mode 100644
index 000000000000..d0249333a2bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ufoe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display UFOe
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The Mediatek display UFOe stands for Unified Frame Optimization engine.
+  UFOe can cut the data rate for DSI port which may lead to reduce power consumption.
+  UFOe device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-ufoe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: UFOe Clock
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    ufoe@1401a000 {
+        compatible = "mediatek,mt8173-disp-ufoe";
+        reg = <0 0x1401a000 0 0x1000>;
+        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_UFOE>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
new file mode 100644
index 000000000000..d7a3ba497fb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mediatek display WDMA
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+
+description: |
+  The mediatek display WDMA stands for Write Direct Memory Access.
+  It can write the data in display pipeline into DRAM.
+  WDMA device node must be siblings to the central MMSYS_CONFIG node.
+  For a description of the MMSYS_CONFIG binding, see
+  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-disp-wdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: WDMA Clock
+
+  iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+
+  mediatek,larb:
+    description:
+      This property should contain a phandle pointing to the local arbiter deviceas defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  mediatek,gce-client-reg:
+    description:
+      The register of display function block to be set by gce. There are 4 arguments,
+      such as gce node, subsys id, offset and register size. The subsys id that is
+      mapping to the register of display function blocks is defined in the gce header
+      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+
+    wdma0: wdma@14011000 {
+        compatible = "mediatek,mt8173-disp-wdma";
+        reg = <0 0x14011000 0 0x1000>;
+        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    };
+
-- 
2.18.0

