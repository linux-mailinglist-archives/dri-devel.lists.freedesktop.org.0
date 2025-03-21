Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263CA6B786
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E545510E11D;
	Fri, 21 Mar 2025 09:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qjKu+9ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421AA10E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:35:24 +0000 (UTC)
X-UUID: cc7c1266063711f08eb9c36241bbb6fb-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dzn3KPVkY5CKPqLCw9mwkZHdcDl3t5MeFf7uK4V+q/U=; 
 b=qjKu+9ZW6QPp+ek9B0L2WhP5XK/U11VkB2uBW2qpaiRxCFY4NX08Kj1+5r0GH6Ski/WIJNoAv3KinUNUuiSzNrj5KmGqmPA1WbeCUFhyBG9sSIZC/fl+Pxqlrr33gnPDXYr+VwV78sizgIAVvfUCuI9G8D04rPBliMndBT8fg2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:8ebf1759-e52a-4bd5-920b-61271363162d, IP:0,
 UR
 L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:307aa1c6-16da-468a-87f7-8ca8d6b3b9f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cc7c1266063711f08eb9c36241bbb6fb-20250321
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1144991328; Fri, 21 Mar 2025 17:35:17 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 17:35:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 17:35:15 +0800
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
Subject: [PATCH v2 03/15] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Date: Fri, 21 Mar 2025 17:33:32 +0800
Message-ID: <20250321093435.94835-4-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
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

Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 .../bindings/dma/mediatek,exdma.yaml          | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mediatek,exdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
new file mode 100644
index 000000000000..de7f8283bb48
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/mediatek,exdma.yaml
@@ -0,0 +1,70 @@
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
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        disp_ovl0_exdma2: dma-controller@32850000 {
+            compatible = "mediatek,mt8196-exdma";
+            reg = <0 0x32850000 0 0x1000>;
+            clocks = <&ovlsys_config_clk 13>;
+            power-domains = <&hfrpsys 12>;
+            mediatek,larb = <&smi_larb0>;
+            iommus = <&mm_smmu 144>;
+            #dma-cells = <1>;
+        };
+    };
-- 
2.45.2

