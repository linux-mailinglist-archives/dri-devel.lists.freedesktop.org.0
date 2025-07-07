Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A29AFBD63
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964D10E55E;
	Mon,  7 Jul 2025 21:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="st3sr5EX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8197E10E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:32:21 +0000 (UTC)
X-UUID: 376c126c5ad211f0b33aeb1e7f16c2b6-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3MQIv0Ru2TodCm/r0/qlTSRfO8/nzt6MirQPs9V9tbU=; 
 b=st3sr5EXUXuPKVhj9f0duRSDTa+IMiefDGyJawJXhBW0N78sJTZ7g4wRwATefqrp/2hn3JXafYbEZq+VHRD0/lknj7sjcYmk2AdpDkcrKmx4SckhIdQ+NtcQmh8KberVVtTUnJDN+ZtZkr9pbjAaqc8WVdyjRpUDTsJvgkIxdFs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:bcc20fb6-fefc-4884-b5a6-33731e5d9ab1, IP:0,
 UR
 L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:25
X-CID-META: VersionHash:9eb4ff7, CLOUDID:c55b9382-cc21-4267-87cf-e75829fa6365,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 376c126c5ad211f0b33aeb1e7f16c2b6-20250707
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1705185487; Mon, 07 Jul 2025 09:32:16 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:15 +0800
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
Subject: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv binding
Date: Mon, 7 Jul 2025 09:31:45 +0800
Message-ID: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
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

Add camera isp7x module device document.

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-cam-yuv.yaml
  - Various fixes per review comments
  - Update maintainers list

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-cam-yuv.yaml     | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
new file mode 100755
index 000000000000..0de120d3c6e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,cam-yuv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The cam-yuv unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek cam-yuv is the camera YUV processing unit in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-cam-yuv
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description:
+      Base address and optional inner base address of the cam-yuv hardware block.
+
+  reg-names:
+    items:
+      - const: base
+      - const: inner_base
+    minItems: 1
+    maxItems: 2
+    description:
+      Names for each register region. Must be "base" and optionally "inner_base".
+
+  mediatek,larbs:
+    description:
+      List of phandles to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  interrupts:
+    minItems: 1
+    description: Interrupts for the cam-yuv block.
+
+  dma-ranges:
+    minItems: 1
+    description: Address information of IOMMU mapping to memory.
+
+  power-domains:
+    minItems: 1
+    description: Power domains for the cam-yuv block.
+
+  clocks:
+    minItems: 4
+    maxItems: 16
+    description: List of phandles to the clocks required by the cam-yuv block.
+
+  clock-names:
+    items:
+      - const: camsys_cam2mm0_cgpdn
+      - const: camsys_cam2mm1_cgpdn
+      - const: camsys_cam2sys_cgpdn
+      - const: camsys_yuva_larbx
+      - const: camsys_yuva_cam_cgpdn
+      - const: camsys_yuva_camtg_cgpdn
+      - const: camsys_yuvb_larbx_cgpdn
+      - const: camsys_yuvb_cam_cgpdn
+      - const: camsys_yuvb_camtg_cgpdn
+    minItems: 4
+    maxItems: 16
+    description: Names of the clocks, must match the order of the clocks property.
+
+  iommus:
+    minItems: 1
+    maxItems: 32
+    description: Points to the respective IOMMU block with master port as argument.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    soc {
+      yuv@16050000 {
+        compatible = "mediatek,mt8188-cam-yuv";
+        reg = <0 0x16050000 0 0x8000>;
+        reg-names = "base";
+        mediatek,larbs = <&larb17a>;
+        interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
+        dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_SUBA>;
+        clocks = <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
+                 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
+                 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>,
+                 <&camsys_yuva CLK_CAM_YUVA_LARBX>,
+                 <&camsys_yuva CLK_CAM_YUVA_CAM>,
+                 <&camsys_yuva CLK_CAM_YUVA_CAMTG>;
+        clock-names = "camsys_cam2mm0_cgpdn",
+                      "camsys_cam2mm1_cgpdn",
+                      "camsys_cam2sys_cgpdn",
+                      "camsys_yuva_larbx_cgpdn",
+                      "camsys_yuva_cam_cgpdn",
+                      "camsys_yuva_camtg_cgpdn";
+        iommus = <&vpp_iommu M4U_PORT_L17A_YUVO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVO_R3>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVCO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_YUVO_R2>,
+                 <&vpp_iommu M4U_PORT_L17A_RZH1N2TO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_DRZS4NO_R1>,
+                 <&vpp_iommu M4U_PORT_L17A_TNCSO_R1>;
+      };
+    };
+
+...
-- 
2.18.0

