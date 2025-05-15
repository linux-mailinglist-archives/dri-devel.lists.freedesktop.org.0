Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E448CAB82C3
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EE510E7E1;
	Thu, 15 May 2025 09:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Cy/fCVnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FFE10E7E1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:35:09 +0000 (UTC)
X-UUID: e018c25c316f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=z+A40zibBR2GeRZ2WMNi2XbBZEpebzV9a47oTPEBYwM=; 
 b=Cy/fCVnUrS7xIJ96PsXRBsrHXeKD2CEKRQXdOlp5TLwJTX+66JidSo6pXfEFYizrtMK6XMCnskzdn7mfyL3sPXzmTfV4t2z5EDQltOrm/9ng+VEXk/keg0VMB30FGTDdVMM5C5zO6gxTVWUtAhjTM3Mn6hrrhFIIToyOvr4+Sss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:96b3202e-f773-43b4-a36a-cfe709d77145, IP:0,
 UR
 L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:f894cb73-805e-40ad-809d-9cec088f3bd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e018c25c316f11f082f7f7ac98dee637-20250515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 787879660; Thu, 15 May 2025 17:35:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:00 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 02/17] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Date: Thu, 15 May 2025 17:34:14 +0800
Message-ID: <20250515093454.1729720-3-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

Add mediatek,exdma.yaml to support EXDMA for MT8196.
The MediaTek display overlap extended DMA engine, namely
OVL_EXDMA or EXDMA, primarily functions as a DMA engine
for reading data from DRAM with various DRAM footprints
and data formats.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 .../bindings/dma/mediatek,exdma.yaml          | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
new file mode 100644
index 000000000000..eabf0cfc839e
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/mediatek,exdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek display overlap extended DMA engine
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  The MediaTek display overlap extended DMA engine, namely OVL_EXDMA or EXDMA,
+  primarily functions as a DMA engine for reading data from DRAM with various
+  DRAM footprints and data formats. For input sources in certain color formats
+  and color domains, OVL_EXDMA also includes a color transfer function
+  to process pixels into a consistent color domain.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-exdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle to the local arbiters node in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+
+  iommus:
+    maxItems: 1
+
+  '#dma-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - mediatek,larb
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        exdma: dma-controller@32850000 {
+            compatible = "mediatek,mt8196-exdma";
+            reg = <0 0x32850000 0 0x1000>;
+            clocks = <&ovlsys_config_clk 13>;
+            power-domains = <&hfrpsys 12>;
+            iommus = <&mm_smmu 144>;
+            #dma-cells = <1>;
+        };
+    };
-- 
2.45.2

