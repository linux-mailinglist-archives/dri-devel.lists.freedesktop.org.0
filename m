Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3B4D3FF7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 04:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87E710E5BC;
	Thu, 10 Mar 2022 03:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFED10E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 03:55:25 +0000 (UTC)
X-UUID: 7e5d9c4ccc1d4e3b8f2083f3ebde5639-20220310
X-UUID: 7e5d9c4ccc1d4e3b8f2083f3ebde5639-20220310
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 343640381; Thu, 10 Mar 2022 11:55:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 11:55:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 11:55:17 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v14 03/22] dt-bindings: mediatek: add ethdr definition for
 mt8195
Date: Thu, 10 Mar 2022 11:54:56 +0800
Message-ID: <20220310035515.16881-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220310035515.16881-1-nancy.lin@mediatek.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vdosys1 ETHDR definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 .../display/mediatek/mediatek,ethdr.yaml      | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
new file mode 100644
index 000000000000..e16deca0dc2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Ethdr Device Tree Bindings
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  ETHDR is designed for HDR video and graphics conversion in the external display path.
+  It handles multiple HDR input types and performs tone mapping, color space/color
+  format conversion, and then combine different layers, output the required HDR or
+  SDR signal to the subsequent display path. This engine is composed of two video
+  frontends, two graphic frontends, one video backend and a mixer. ETHDR has two
+  DMA function blocks, DS and ADL. These two function blocks read the pre-programmed
+  registers from DRAM and set them to HW in the v-blanking period.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-disp-ethdr
+  reg:
+    maxItems: 7
+  reg-names:
+    items:
+      - const: mixer
+      - const: vdo_fe0
+      - const: vdo_fe1
+      - const: gfx_fe0
+      - const: gfx_fe1
+      - const: vdo_be
+      - const: adl_ds
+  interrupts:
+    minItems: 1
+  iommus:
+    description: The compatible property is DMA function blocks.
+      Should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for
+      details.
+    minItems: 1
+    maxItems: 2
+  clocks:
+    items:
+      - description: mixer clock
+      - description: video frontend 0 clock
+      - description: video frontend 1 clock
+      - description: graphic frontend 0 clock
+      - description: graphic frontend 1 clock
+      - description: video backend clock
+      - description: autodownload and menuload clock
+      - description: video frontend 0 async clock
+      - description: video frontend 1 async clock
+      - description: graphic frontend 0 async clock
+      - description: graphic frontend 1 async clock
+      - description: video backend async clock
+      - description: ethdr top clock
+  clock-names:
+    items:
+      - const: mixer
+      - const: vdo_fe0
+      - const: vdo_fe1
+      - const: gfx_fe0
+      - const: gfx_fe1
+      - const: vdo_be
+      - const: adl_ds
+      - const: vdo_fe0_async
+      - const: vdo_fe1_async
+      - const: gfx_fe0_async
+      - const: gfx_fe1_async
+      - const: vdo_be_async
+      - const: ethdr_top
+  power-domains:
+    maxItems: 1
+  resets:
+    maxItems: 5
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, gce node, subsys id, offset and
+      register size. The subsys id is defined in the gce header of each chips
+      include/include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
+      display function block.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+    #include <dt-bindings/memory/mt8195-memory-port.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    #include <dt-bindings/reset/mt8195-resets.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ethdr@1c114000 {
+                compatible = "mediatek,mt8195-disp-ethdr";
+                reg = <0 0x1c114000 0 0x1000>,
+                      <0 0x1c115000 0 0x1000>,
+                      <0 0x1c117000 0 0x1000>,
+                      <0 0x1c119000 0 0x1000>,
+                      <0 0x1c11A000 0 0x1000>,
+                      <0 0x1c11B000 0 0x1000>,
+                      <0 0x1c11C000 0 0x1000>;
+                reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                            "vdo_be", "adl_ds";
+                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;
+                clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+                         <&vdosys1 CLK_VDO1_26M_SLOW>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+                         <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+                         <&topckgen CLK_TOP_ETHDR>;
+                clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                              "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+                              "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+                              "ethdr_top";
+                power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+                iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+                         <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+                interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+                resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+                         <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+        };
+    };
+
+...
-- 
2.18.0

