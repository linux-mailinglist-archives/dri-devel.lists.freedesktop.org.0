Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD89922BF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 04:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30D510E1C8;
	Mon,  7 Oct 2024 02:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="R8vJSV7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D372A10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 02:28:42 +0000 (UTC)
X-UUID: db545a8e845311ef8b96093e013ec31c-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KzPUQbEjOiXpx6ijP6tPbRsMDmZ7MKDhzyzVeLNXZBc=; 
 b=R8vJSV7HAJvmLOFyOreH9N6qz7iNpCVEnyBs6tG1cQcKA0Ryj6AKu+lgie/FKyFRBYFzDlhU4+r216qP4MEFm+MXT2LLvbMQvKnOwPdY8oOulIo9Z3gvRxR4X+xZNAPwshZ8J0JHyXxJKvxfAfnVFrguv4jqCKxzJTiU61L2Iak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:67219dd3-9de8-4ad2-9678-7f5e511fe5f2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:d3566126-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: db545a8e845311ef8b96093e013ec31c-20241007
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1273646072; Mon, 07 Oct 2024 10:28:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 10:28:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 10:28:35 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v5] dt-bindings: display: mediatek: split: add subschema
 property constraints
Date: Mon, 7 Oct 2024 10:28:34 +0800
Message-ID: <20241007022834.4609-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'clocks' property:
  display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long

To resolve this issue, the constraints for 'clocks' and
other properties within the subschemas will be reinforced.

Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

--
This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195

Changes since v4:
  - Eliminate the possibility of varying quantities in the 'clocks'
    property of mt8195.
  - Move the constraint for 'power-domains' to the top-level.

Changes since v3:
  - Correct the compatible name for the mt8173 split in the subschema.

Changes since v2:
  - Revise the commit message.
  - Enhance the descriptions of 'clocks'.
  - Strengthen the conditions within the subschema.

Changes since v1:
  - Adding functional descriptions and quantity restrictions.
---
 .../display/mediatek/mediatek,split.yaml      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index e4affc854f3d..4b6ff546757e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -38,6 +38,7 @@ properties:
     description: A phandle and PM domain specifier as defined by bindings of
       the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description:
@@ -57,6 +58,9 @@ properties:
   clocks:
     items:
       - description: SPLIT Clock
+      - description: Used for interfacing with the HDMI RX signal source.
+      - description: Paired with receiving HDMI RX metadata.
+    minItems: 1
 
 required:
   - compatible
@@ -72,9 +76,24 @@ allOf:
             const: mediatek,mt8195-mdp3-split
 
     then:
+      properties:
+        clocks:
+          minItems: 3
+
       required:
         - mediatek,gce-client-reg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-disp-split
+
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

