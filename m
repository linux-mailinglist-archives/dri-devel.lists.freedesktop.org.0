Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E368E656833
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 09:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B224710E2E9;
	Tue, 27 Dec 2022 08:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EE710E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 08:10:17 +0000 (UTC)
X-UUID: ceef53713c724c5098244314aca9c164-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XNpyGlgBl9SZPhFeKALEIhFld+lzd+Z0HIMWFtYFTLM=; 
 b=b5WkLdGXS4Bg4av8QOvbuebzfexerflvuEnRlVqeLQAKja1VqEiPjpP84OHO00G62aDUHvostuXTpnjyqO+R1fjHybNwoMEH08H150Y3la51N62SLMcaN5wZk1i6n9aTFAf3n/nDrJ0MtR4BeHeMB5Acj4sMf47raZ5Nls+nB0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:490777fe-468a-4718-b252-a542f01a3760, IP:0,
 U
 RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:7bdce852-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ceef53713c724c5098244314aca9c164-20221227
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 523076953; Tue, 27 Dec 2022 16:10:13 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 16:10:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 16:10:12 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Tue, 27 Dec 2022 16:10:05 +0800
Message-ID: <20221227081011.6426-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227081011.6426-1-nancy.lin@mediatek.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
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
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vdosys1 ETHDR definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
new file mode 100644
index 000000000000..3b11e47a8834
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,ethdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Ethdr Device
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  ETHDR (ET High Dynamic Range) is a MediaTek internal HDR engine and is
+  designed for HDR video and graphics conversion in the external display path.
+  It handles multiple HDR input types and performs tone mapping, color
+  space/color format conversion, and then combine different layers,
+  output the required HDR or SDR signal to the subsequent display path.
+  This engine is composed of two video frontends, two graphic frontends,
+  one video backend and a mixer. ETHDR has two DMA function blocks, DS and ADL.
+  These two function blocks read the pre-programmed registers from DRAM and
+  set them to HW in the v-blanking period.
+
+properties:
+  compatible:
+    const: mediatek,mt8195-disp-ethdr
+
+  reg:
+    maxItems: 7
+
+  reg-names:
+    items:
+      - const: mixer
+      - const: vdo_fe0
+      - const: vdo_fe1
+      - const: gfx_fe0
+      - const: gfx_fe1
+      - const: vdo_be
+      - const: adl_ds
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+
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
+
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
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: video frontend 0 async reset
+      - description: video frontend 1 async reset
+      - description: graphic frontend 0 async reset
+      - description: graphic frontend 1 async reset
+      - description: video backend async reset
+
+  reset-names:
+    items:
+      - const: vdo_fe0_async
+      - const: vdo_fe1_async
+      - const: gfx_fe0_async
+      - const: gfx_fe1_async
+      - const: vdo_be_async
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The register of display function block to be set by gce.
+      There are 4 arguments in this property, gce node, subsys id, offset and
+      register size. The subsys id is defined in the gce header of each chips
+      include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
+      function block.
+    items:
+      items:
+        - description: phandle of GCE
+        - description: GCE subsys id
+        - description: register offset
+        - description: register size
+    minItems: 7
+    maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - resets
+  - mediatek,gce-client-reg
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
+        hdr-engine@1c114000 {
+                compatible = "mediatek,mt8195-disp-ethdr";
+                reg = <0 0x1c114000 0 0x1000>,
+                      <0 0x1c115000 0 0x1000>,
+                      <0 0x1c117000 0 0x1000>,
+                      <0 0x1c119000 0 0x1000>,
+                      <0 0x1c11a000 0 0x1000>,
+                      <0 0x1c11b000 0 0x1000>,
+                      <0 0x1c11c000 0 0x1000>;
+                reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+                            "vdo_be", "adl_ds";
+                mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
+                                          <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
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
+                reset-names = "vdo_fe0_async", "vdo_fe1_async", "gfx_fe0_async",
+                              "gfx_fe1_async", "vdo_be_async";
+        };
+    };
+...
-- 
2.18.0

