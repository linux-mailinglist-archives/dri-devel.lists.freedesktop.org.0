Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF651E33B
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9110F2CB;
	Sat,  7 May 2022 01:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106E610F2CB
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:46:28 +0000 (UTC)
X-UUID: f2c1dc4896d242fdbb0743e71b31a94d-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:36c4c418-22cd-4f38-b9ca-14ee12f19233, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:70328516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f2c1dc4896d242fdbb0743e71b31a94d-20220507
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1580044985; Sat, 07 May 2022 09:46:24 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 7 May 2022 09:46:22 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 7 May 2022 09:46:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 7 May 2022 09:46:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v5,
 1/7] dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings
 for lat soc
Date: Sat, 7 May 2022 09:46:12 +0800
Message-ID: <20220507014618.29412-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507014618.29412-1-yunfei.dong@mediatek.com>
References: <20220507014618.29412-1-yunfei.dong@mediatek.com>
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
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 51 +++++++++++++------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 6415c9f29130..6854e7f2ce9f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -17,20 +17,20 @@ description: |
 
   About the Decoder Hardware Block Diagram, please check below:
 
-    +---------------------------------+------------------------------------+
-    |                                 |                                    |
-    | input -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output |
-    |            ||                   |                     ||             |
-    +------------||-------------------+---------------------||-------------+
-              lat workqueue           |              core workqueue     <parent>
-    -------------||-----------------------------------------||------------------
-                 ||                                         ||          <child>
-                 \/ <----------------HW index-------------->\/
-           +------------------------------------------------------+
-           |                    enable/disable                    |
-           |           clk     power    irq    iommu              |
-           |                 (lat/lat soc/core0/core1)            |
-           +------------------------------------------------------+
+    +------------------------------------------------+-------------------------------------+
+    |                                                |                                     |
+    |  input -> lat soc HW -> lat HW -> lat buffer --|--> lat buffer -> core HW -> output  |
+    |            ||             ||                   |                     ||              |
+    +------------||-------------||-------------------+---------------------||--------------+
+                 ||     lat     ||                   |               core workqueue  <parent>
+    -------------||-------------||-------------------|---------------------||---------------
+                 ||<------------||----------------HW index---------------->||        <child>
+                 \/             \/                                         \/
+               +-------------------------------------------------------------+
+               |                          enable/disable                     |
+               |                 clk     power    irq    iommu               |
+               |                   (lat/lat soc/core0/core1)                 |
+               +-------------------------------------------------------------+
 
   As above, there are parent and child devices, child mean each hardware. The child device
   controls the information of each hardware independent which include clk/power/irq.
@@ -45,6 +45,13 @@ description: |
   For the smi common may not the same for each hardware, can't combine all hardware in one node,
   or leading to iommu fault when access dram data.
 
+  Lat soc is a hardware which is related with some larb(local arbiter) ports. For mt8195
+  platform, there are some ports like RDMA, UFO in lat soc larb, need to enable its power and
+  clock when lat start to work, don't have interrupt.
+
+  mt8195: lat soc HW + lat HW + core HW
+  mt8192: lat HW + core HW
+
 properties:
   compatible:
     enum:
@@ -88,7 +95,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mtk-vcodec-lat
+        enum:
+          - mediatek,mtk-vcodec-lat
+          - mediatek,mtk-vcodec-lat-soc
 
       reg:
         maxItems: 1
@@ -126,7 +135,6 @@ patternProperties:
     required:
       - compatible
       - reg
-      - interrupts
       - iommus
       - clocks
       - clock-names
@@ -197,6 +205,17 @@ required:
   - dma-ranges
   - ranges
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mtk-vcodec-lat
+
+then:
+  required:
+    - interrupts
+
 additionalProperties: false
 
 examples:
-- 
2.18.0

