Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25048C172
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F2810F2DA;
	Wed, 12 Jan 2022 09:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2730A10F59E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 09:49:55 +0000 (UTC)
X-UUID: 9ba22167f417475ab94cb5078288e0ab-20220112
X-UUID: 9ba22167f417475ab94cb5078288e0ab-20220112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1327875115; Wed, 12 Jan 2022 17:49:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 12 Jan 2022 17:49:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:48 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v18,
 15/19] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Wed, 12 Jan 2022 17:49:19 +0800
Message-ID: <20220112094923.16839-16-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds decoder dt-bindings for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++++
 1 file changed, 265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
new file mode 100644
index 000000000000..d587fc3e39fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -0,0 +1,265 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek Video Decode Accelerator With Multi Hardware
+
+maintainers:
+  - Yunfei Dong <yunfei.dong@mediatek.com>
+
+description: |
+  Mediatek Video Decode is the video decode hardware present in Mediatek
+  SoCs which supports high resolution decoding functionalities. Required
+  parent and child device node.
+
+  About the Decoder Hardware Block Diagram, please check below:
+
+    +---------------------------------+------------------------------------+
+    |                                 |                                    |
+    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
+    |            ||                   |                     ||             |
+    +------------||-------------------+---------------------||-------------+
+              lat workqueue           |              core workqueue     <parent>
+    -------------||-----------------------------------------||------------------
+                 ||                                         ||          <child>
+                 \/ <----------------HW index-------------->\/
+           +------------------------------------------------------+
+           |                    enable/disable                    |
+           |           clk     power    irq    iommu              |
+           |                 (lat/lat soc/core0/core1)            |
+           +------------------------------------------------------+
+
+  As above, there are parent and child devices, child mean each hardware. The child device
+  controls the information of each hardware independent which include clk/power/irq.
+
+  There are two workqueues in parent device: lat workqueue and core workqueue. They are used
+  to lat and core hardware deocder. Lat workqueue need to get input bitstream and lat buffer,
+  then enable lat to decode, writing the result to lat buffer, dislabe hardware when lat decode
+  done. Core workqueue need to get lat buffer and output buffer, then enable core to decode,
+  writing the result to output buffer, disable hardware when core decode done. These two
+  hardwares will decode each frame cyclically.
+
+  For the smi common may not the same for each hardware, can't combine all hardware in one node,
+  or leading to iommu fault when access dram data.
+
+properties:
+  compatible:
+    const: mediatek,mt8192-vcodec-dec
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: |
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of system control processor (SCP), using
+      the remoteproc & rpmsg framework.
+
+  dma-ranges:
+    maxItems: 1
+    description: |
+      Describes the physical address space of IOMMU maps to memory.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+# Required child node:
+patternProperties:
+  '^vcodec-lat@[0-9a-f]+$':
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mtk-vcodec-lat
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      clocks:
+        maxItems: 5
+
+      clock-names:
+        items:
+          - const: sel
+          - const: soc-vdec
+          - const: soc-lat
+          - const: vdec
+          - const: top
+
+      assigned-clocks:
+        maxItems: 1
+
+      assigned-clock-parents:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - iommus
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
+  '^vcodec-core@[0-9a-f]+$':
+    type: object
+
+    properties:
+      compatible:
+        const: mediatek,mtk-vcodec-core
+
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        minItems: 1
+        maxItems: 32
+        description: |
+          List of the hardware port in respective IOMMU block for current Socs.
+          Refer to bindings/iommu/mediatek,iommu.yaml.
+
+      clocks:
+        maxItems: 5
+
+      clock-names:
+        items:
+          - const: sel
+          - const: soc-vdec
+          - const: soc-lat
+          - const: vdec
+          - const: top
+
+      assigned-clocks:
+        maxItems: 1
+
+      assigned-clock-parents:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+      - iommus
+      - clocks
+      - clock-names
+      - assigned-clocks
+      - assigned-clock-parents
+      - power-domains
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iommus
+  - mediatek,scp
+  - dma-ranges
+  - ranges
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
+    video-codec@16000000 {
+        compatible = "mediatek,mt8192-vcodec-dec";
+        mediatek,scp = <&scp>;
+        iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+        dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x16000000 0x40000>;
+        reg = <0x16000000 0x1000>;		/* VDEC_SYS */
+        vcodec-lat@10000 {
+            compatible = "mediatek,mtk-vcodec-lat";
+            reg = <0x10000 0x800>;
+            interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+                <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+                <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+                <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+                <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+        };
+
+        vcodec-core@25000 {
+            compatible = "mediatek,mtk-vcodec-core";
+            reg = <0x25000 0x1000>;
+            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+            iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+                <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+            clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+                <&vdecsys CLK_VDEC_VDEC>,
+                <&vdecsys CLK_VDEC_LAT>,
+                <&vdecsys CLK_VDEC_LARB1>,
+                <&topckgen CLK_TOP_MAINPLL_D4>;
+            clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+            assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+            assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+            power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+        };
+    };
-- 
2.25.1

