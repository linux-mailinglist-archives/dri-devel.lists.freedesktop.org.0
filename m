Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21FB98CC4A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 07:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915D10E6A0;
	Wed,  2 Oct 2024 05:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kWB2Pu5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CFF10E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 05:16:34 +0000 (UTC)
X-UUID: 7acc07f4807d11efb66947d174671e26-20241002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hhSCBraMwebJsTv0yxGJcPfygdTG0wZoxm8bZkDpOds=; 
 b=kWB2Pu5HtoV2FkTXuDYCA9V9RAvvofItZ3/UphOcLBQ76IXIG2tkU8x6xQl4f/ShBuxg+wesHiUWaZQ8VVmZ8It+rvECwLlwm4oymd4VWEM0UM1NPp4/G4J60TfhvrEVdj/ZrLLgrCUO4S/mOdsf51w66gg/OzuNZTLhtylBtYU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:9b047307-1a98-4942-93ad-c4dce68c18c7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6dc6a47, CLOUDID:f9882a88-3a5d-4d9e-b012-e875acfb157d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1|19,IP:nil
 ,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
 1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7acc07f4807d11efb66947d174671e26-20241002
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2018064128; Wed, 02 Oct 2024 13:16:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 13:16:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 13:16:26 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rohit
 Agarwal" <rohiagar@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
 <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Subject: [PATCH v5 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Date: Wed, 2 Oct 2024 13:16:17 +0800
Message-ID: <20241002051620.2050-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002051620.2050-1-macpaul.lin@mediatek.com>
References: <20241002051620.2050-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.056800-8.000000
X-TMASE-MatchedRID: P0y1Pz0bU7nwBTQ+XvV6VYzb2GR6Ttd3YQXxsZnRwoIY0A95tjAn+9EQ
 LJPlYQqE0KHDXPxFjpCs8FHZk8InNB1YpEPWJiyzKaMQ6tw7oDLFUZ7q8HqQFFwpnAAvAwazMq+
 en+OaNuuJTSQ4G0hWQLlh5xXch+ETbC1/2cudIH8ve6W+IORwrePmXK6rwg5BzsQ8iRVyD45ZoZ
 UwtnkREuLzNWBegCW2wgn7iDBesS1YF3qW3Je6+yJGz/iQlWEgbjQ3HsjeQ9VvX1BD59umeavcA
 mjImT522QK4L+FfNK00VrGYKV5cSQ2TVMfnleX9CaN5RfGxsx4o8fxKaOKaUoSVUZZHNLr+RgV6
 Hsqyx11QaONuZ6Jr4g9k3l8EaYIcovpDXVQHzIN+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.056800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9854A0E68FA650A45118D093163C2FB7619D4D4BDDE09EA56A531646E776FEF52000:8
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

The infra-iommu node in mt8195.dtsi was triggering a CHECK_DTBS error due
to an excessively long 'interrupts' property. The error message was:

  infra-iommu@10315000: interrupts: [[0, 795, 4, 0], [0, 796, 4, 0],
                     [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]]
                     is too long

To address this issue, update the compatbile matching rule for
'interrupts' property. This change allows flexibility in the number
of interrupts for new SoCs like MT8195.
The purpose of these 5 interrupts is also added into description.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

Changes for v2:
 - commit message: re-formatting and add a description of adding 5 interrupts.
 - add 'description' and 'maxItems: 5' for 'interrupt' property of
   'mt8195-iommu-infra'
 - others keeps 'maxItems: 1'

Changes for v3:
 - Refine the description for 'interrupts' property and fixes the compatible
   matching rules.
 - Refine commit message.

Changes for v4:
  - add missing 'minItems: 5' to 'mediatek,mt8195-iommu-infra'.
    Thanks the explanation from Conor and Krzysztof. 

Changes for v5:
  - Repharse the description for interrupts property of MT8195.

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..df8b2429008e 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -96,7 +96,16 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: |
+      Usually, the IOMMU requires only one interrupt.
+
+      The infra IOMMU in MT8195 has five banks: each features one set
+      of APB registers. One for the normal world (set 0), three for the
+      protected world (sets 1-3), and one for the secure world (set 4).
+      and each set has its own interrupt. Therefore, five interrupts
+      are needed.
+    minItems: 1
+    maxItems: 5
 
   clocks:
     items:
@@ -210,6 +219,24 @@ allOf:
       required:
         - mediatek,larbs
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-iommu-infra
+
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 5
+
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.45.2

