Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91A52479C
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 10:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11910FBA9;
	Thu, 12 May 2022 08:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275C210FB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 08:05:32 +0000 (UTC)
X-UUID: 01b0856a4bab4f06b1884538d7af4d8a-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cdea5565-f5b4-4ed0-965f-7f287308403c, OB:10,
 L
 OB:10,IP:0,URL:25,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ha
 m,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.4, REQID:cdea5565-f5b4-4ed0-965f-7f287308403c, OB:10,
 LOB
 :10,IP:0,URL:25,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3
 D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:faefae9, CLOUDID:068af3f1-ab23-4aed-a67b-f96514452486,
 C
 OID:9788cbe1af47,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 01b0856a4bab4f06b1884538d7af4d8a-20220512
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1063709237; Thu, 12 May 2022 16:05:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 12 May 2022 16:05:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 16:05:25 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
Subject: [PATCH v3 3/3] dt-bindings: mediatek: add ethdr definition for mt8195
Date: Thu, 12 May 2022 16:05:23 +0800
Message-ID: <20220512080523.25082-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
References: <20220512080523.25082-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Nancy.Lin" <nancy.lin@mediatek.com>

Add vdosys1 ETHDR definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
new file mode 100644
index 000000000000..be81d8873354
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
+    - const: mediatek,mt8195-disp-ethdr
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

