Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC867C67CD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D34610E462;
	Thu, 12 Oct 2023 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48EC10E44B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:40:47 +0000 (UTC)
X-UUID: 06120ff468db11ee8051498923ad61e6-20231012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sU5EEYWlspN5kkmtOJdylKS0jIRF0xzJLsP+2D3sg2g=; 
 b=ZzzzE3Xs2HIuYkO0XjLGRmeNj+6zwx7nS3XAhPwlrbeRryyM0i2m2YFpbN2G5HzvrB+qkOqQ1E4dgoDtZSL4KCvBBNBRZ80Wn2ZFfSON0CpGMK4LxPSJsiKwu3YKv1VQfgEJoZdT6zwzs6rl3+tUHPV0qjG6n5y9Zmt+3NQnKBo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:5c0486bf-9905-41cb-bda3-76d7d1d8fe07, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:feef09c4-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06120ff468db11ee8051498923ad61e6-20231012
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 504890117; Thu, 12 Oct 2023 16:40:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Oct 2023 16:40:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Oct 2023 16:40:39 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v7 03/16] dt-bindings: media: mediatek: mdp3: add config for
 MT8195 RDMA
Date: Thu, 12 Oct 2023 16:40:24 +0800
Message-ID: <20231012084037.19376-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231012084037.19376-1-moudy.ho@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added the configuration for MT8195 RDMA. In comparison to MT8183, it
no longer shares SRAM with RSZ, and there are now preconfigured 5 mbox.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index c043204cf210..504334a76fb3 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt8183-mdp3-rdma
+      - mediatek,mt8195-mdp3-rdma
       - mediatek,mt8195-vdo1-rdma
 
   reg:
@@ -58,7 +59,7 @@ properties:
 
   mboxes:
     minItems: 1
-    maxItems: 2
+    maxItems: 5
 
   interrupts:
     maxItems: 1
@@ -98,6 +99,29 @@ allOf:
         - mboxes
         - mediatek,gce-events
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-mdp3-rdma
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RDMA clock
+
+        mboxes:
+          items:
+            - description: used for 1st data pipe from RDMA
+            - description: used for 2nd data pipe from RDMA
+            - description: used for 3rd data pipe from RDMA
+            - description: used for 4th data pipe from RDMA
+            - description: used for the data pipe from SPLIT
+
+      required:
+        - mediatek,gce-events
+
   - if:
       properties:
         compatible:
-- 
2.18.0

