Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1E9AFBD66
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A750210E566;
	Mon,  7 Jul 2025 21:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BnlR651Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B7210E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:32:08 +0000 (UTC)
X-UUID: 30e8cc8c5ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZzMOl2Ky58KKtiKwQ5AlruNWO0UQZa7Vyr+LxTHTVVA=; 
 b=BnlR651ZLf8lepxYjBZEC0oULSHtlh94pqeeAXfu9Ve2NThVjSbYJSwSKUaJA8KB7EWNG4jVezf3VCYv2/uMpvkkRQFPbZrIITQkasYaz4KOuuTw8YhVvEQ0M7hkgNzYiBzVURFFFWI0vy7+qbL15L8ASkPApkvJvjN08N4IYMQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:68331ff6-c91b-4b9d-829f-e9af432df466, IP:0,
 UR
 L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:20
X-CID-META: VersionHash:9eb4ff7, CLOUDID:3abe0260-2aa0-4c76-8faa-804d844c7164,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30e8cc8c5ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1224092829; Mon, 07 Jul 2025 09:32:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:04 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core binding
Date: Mon, 7 Jul 2025 09:31:43 +0800
Message-ID: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:54 +0000
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

From: "shangyao.lin" <shangyao.lin@mediatek.com>

1. Add camera isp7x module device document

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-seninf-core.yaml
  - Various fixes per review comments
  - Update maintainers list

Question for reviewer (CK):

Hi CK,

Thank you for your review and suggestions on this patch, especially for providing the reference patch (https://patchwork.kernel.org/project/linux-mediatek/list/?series=874617) and for mentioning in another patch ([V1,02/10] MEDIA: PLATFORM: MEDIATEK: ADD SENINF CONTROLLER) the suggestion to "Move the phy part to phy/mediatek/ folder. You could refer to phy/mediatek/phy-mtk-mipi-csi-0-5.c".

After reading your comments and the reference patches, my understanding is that only the seninf-core driver should manage all ports internally, and each port corresponds to a PHY. During probe, the driver will parse each port, obtain the corresponding PHY (e.g., devm_phy_get(dev, "csi0"), devm_phy_get(dev, "csi1"), etc.), and operate the PHY for each port individually during stream on/off or power on/off.

Could you please confirm if my understanding is correct?
If you have any additional reference patches or examples, I would greatly appreciate it.

Thank you for your guidance!

Best regards,
Shangyao

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-seninf-core.yaml | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
new file mode 100755
index 000000000000..763b96b561cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: The seninf-core top unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description: |
+  MediaTek seninf-core is the ISP sensor interface unit in MediaTek SoC.
+  The sensor interface serves as the MIPI-CSI2 top RX controller.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-seninf-core
+
+  reg:
+    minItems: 1
+    maxItems: 1
+    description: |
+      Base address register region.
+
+  reg-names:
+    items:
+      - const: base
+    minItems: 1
+    maxItems: 1
+
+  mtk_csi_phy_ver:
+    description: Describes MediaTek camera Rx controller version
+    $ref: /schemas/types.yaml#/definitions/string
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+    description: List of clock phandles required by the controller.
+
+  clock-names:
+    items:
+      - const: clk_cam_seninf
+      - const: clk_top_seninf
+      - const: clk_top_seninf1
+      - const: clk_top_camtm
+    minItems: 4
+    maxItems: 4
+
+  mediatek,larbs:
+    description: |
+      List of phandles to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  dma-ranges:
+    description: |
+      Describes the address information of IOMMU mapping to memory.
+      Defines six fields for the MediaTek IOMMU extended iova, pa, and size.
+    minItems: 1
+
+  phys:
+    description: List of phandle and args to the PHY provider.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  phy-names:
+    description: Names of the PHYs.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+    seninf@16010000 {
+      compatible = "mediatek,mt8188-seninf-core";
+      reg = <0 0x16010000 0 0x8000>;
+      reg-names = "base";
+      mtk_csi_phy_ver = "mtk_csi_phy_2_0";
+      interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH 0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_CSIRX_TOP>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_VCORE>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      clocks = <&camsys CLK_CAM_MAIN_SENINF>,
+               <&topckgen CLK_TOP_SENINF>,
+               <&topckgen CLK_TOP_SENINF1>,
+               <&topckgen CLK_TOP_CAMTM>;
+      clock-names = "clk_cam_seninf",
+                    "clk_top_seninf",
+                    "clk_top_seninf1",
+                    "clk_top_camtm";
+    };
+
+...
\ No newline at end of file
-- 
2.18.0

