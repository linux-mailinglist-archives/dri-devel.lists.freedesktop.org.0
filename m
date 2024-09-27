Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BBE987EAC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 08:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B6710E1D6;
	Fri, 27 Sep 2024 06:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HBjJax65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4878C10E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 06:50:51 +0000 (UTC)
X-UUID: d1a0c2e87c9c11ef8b96093e013ec31c-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x73fzQ1iBtBXNbD5gQqazkTyid377T6UD2pefzFgjGs=; 
 b=HBjJax65jrh0fwFFjyNj5ITWkFE25JUlMxMkoditWY3/Wm5wcACpTwgjGV5xC6itTrj+5y8Fv1dLTO270cyxTUwvLFsEBfpIUXHWrNi7u8L8llqx55KxFqR6t9I7od9O5X8bhNATxpv1mMA7h/bUUfDIXXXj+WywdgzalTqeVXc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:13e8fe6b-f189-411b-ab6c-7007c5219794, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:5b675718-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d1a0c2e87c9c11ef8b96093e013ec31c-20240927
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 369317385; Fri, 27 Sep 2024 14:50:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 14:50:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 14:50:43 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, Ben Lok
 <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, Alexandre Mergnat
 <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, Chris-qj
 chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Subject: [PATCH v3 2/5] dt-bindings: iommu: mediatek: Fix interrupt count
 constraint for new SoCs
Date: Fri, 27 Sep 2024 14:50:38 +0800
Message-ID: <20240927065041.15247-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927065041.15247-1-macpaul.lin@mediatek.com>
References: <20240927065041.15247-1-macpaul.lin@mediatek.com>
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
 .../bindings/iommu/mediatek,iommu.yaml        | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

Changes for v2:
 - commit message: re-formatting and add a description of adding 5 interrupts.
 - add 'description' and 'maxItems: 5' for 'interrupt' property of
   'mt8195-iommu-infra'
 - others keeps 'maxItems: 1'

Changes for v3:
 - Refine the description for 'interrupts' property and fixes the compatible
   matching rules.
 - Refine commit message.

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index ea6b0f5f24de..10e2bb0f0704 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -96,7 +96,13 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    description: |
+      Usually, the IOMMU requires only 1 interrupt.
+
+      The IOMMU of MT8195 has 5 banks: 0/1/2/3/4.
+      Each bank has a set of APB registers corresponding to the
+      normal world, protected world 1/2/3, and secure world, respectively.
+      Therefore, 5 interrupt numbers are needed for MT8195.
 
   clocks:
     items:
@@ -210,6 +216,23 @@ allOf:
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

