Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1342873C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 09:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70856E429;
	Mon, 11 Oct 2021 07:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125F16E424
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 07:03:06 +0000 (UTC)
X-UUID: b6efe4497eb443a5870b17ec80a87153-20211011
X-UUID: b6efe4497eb443a5870b17ec80a87153-20211011
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1810623179; Mon, 11 Oct 2021 15:03:05 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Oct 2021 15:03:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Oct 2021 15:03:03 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Mon, 11 Oct 2021 15:02:45 +0800
Message-ID: <20211011070247.792-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011070247.792-1-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Adds decoder dt-bindings for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v7: Re-write dtsi for hardware architecture changed
---
 .../media/mediatek,vcodec-comp-decoder.yaml   | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
new file mode 100644
index 000000000000..7c2a85afbf90
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,vcodec-comp-decoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Video Decode Accelerator With Multi Hardware
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities. Required
+  master and component node.
+
+  About the Decoder Hardware Block Diagram, please check below:
+
+    +---------------------------------+------------------------------------+
+    |                                 |                                    |
+    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
+    |            ||                   |                     ||             |
+    +------------||-------------------+---------------------||-------------+
+                 ||       lat thread  |  core thread        ||     <master>
+    -------------||-----------------------------------------||----------------
+                 ||                                         ||     <component>
+                 \/ <----------------HW index-------------->\/
+           +------------------------------------------------------+
+           |                    enable/disable                    |
+           |           clk     power    irq    iommu port         |
+           |                 (lat/lat soc/core0/core1)            |
+           +------------------------------------------------------+
+
+  As above, <master> mean in master device, <component> mean in component device.
+  The information of each hardware will be stored in each component device. There
+  are two thread in master device: lat and core. Enable/disable the lat clk/power/irq
+  when lat hardware need to work through hardware index, core is the same.
+
+  Normally the smi common may not the same for each hardware, can't combine all
+  hardware in one node, or leading to iommu fault when access dram data.
+
+properties:
+  compatible:
+      - enum:
+          - mediatek,mt8192-vcodec-dec  # for lat hardware
+          - mediatek,mtk-vcodec-lat     # for core hardware
+          - mediatek,mtk-vcodec-core
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: vdec-sel
+      - const: vdec-soc-vdec
+      - const: vdec-soc-lat
+      - const: vdec-vdec
+      - const: vdec-top
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description:
+      Describes point to scp.
+
+required:
+      - compatible
+      - reg
+      - iommus
+
+allOf:
+  - if: #master node
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec  # for lat hardware
+
+    then:
+      required:
+        - mediatek,scp
+        - dma-ranges
+
+  - if: #component node
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mtk-vcodec-lat     # for core hardware
+              - mediatek,mtk-vcodec-core
+
+    then:
+      required:
+        - interrupts
+        - clocks
+        - clock-names
+        - assigned-clocks
+        - assigned-clock-parents
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt8192-larb-port.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/power/mt8192-power.h>
+
+    vcodec_dec: vcodec_dec@16000000 {
+        compatible = "mediatek,mt8192-vcodec-dec";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+        reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+        mediatek,scp = <&scp>;
+        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+        vcodec_lat {
+            compatible = "mediatek,mtk-vcodec-lat";
+            reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+            reg-name = "reg-misc";
+            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+                 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+                 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+                 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+                 <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+        };
+
+        vcodec_core {
+            compatible = "mediatek,mtk-vcodec-core";
+            reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+            reg-names = "reg-misc";
+            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+                 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                 <&vdecsys CLK_VDEC_VDEC>,
+                 <&vdecsys CLK_VDEC_LAT>,
+                 <&vdecsys CLK_VDEC_LARB1>,
+                 <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+        };
+    };
\ No newline at end of file
-- 
2.25.1

