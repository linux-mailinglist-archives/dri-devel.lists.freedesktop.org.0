Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15E9D46A4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 05:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3460C10E867;
	Thu, 21 Nov 2024 04:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="R9meqaId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2883410E85B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 04:26:11 +0000 (UTC)
X-UUID: b9b4458ea7c011efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iYsVxPJwUafvgN3ouBHNxY+jbFDGOPc1851ZkHUAz0Q=; 
 b=R9meqaIdw4b5XPI2MkXlE8yc+zwpkHsvWKsCDpCtxSVgy5FRzv18FFvZkl9w2Ey3ADtk8CV7Z7rO+DZKMCnZ8jjDwj5E7Ui8/svATf3P20qLuKwrrvrBVXGrXt4Sn0uTTgXEUYtNDLuWgfA8aVukNrvaQS89zueIE0TP66/iOl4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:4061f6b7-6536-4dea-ba3b-9717a90cff1f, IP:0,
 U
 RL:0,TC:0,Content:54,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:54
X-CID-META: VersionHash:464815b, CLOUDID:6a1c27b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:nil,Content:3,EDM:-
 3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
 V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b9b4458ea7c011efbd192953cf12861f-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2069235542; Thu, 21 Nov 2024 12:26:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Moudy
 Ho" <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/8] dt-bindings: mailbox: mediatek: Add MT8196 support for
 gce-mailbox
Date: Thu, 21 Nov 2024 12:25:56 +0800
Message-ID: <20241121042602.32730-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.390200-8.000000
X-TMASE-MatchedRID: hnk2xlnUc9YD2WXLXdz+ARbjReJSRusbpsZw4P6Q+TmjxYyRBa/qJQJj
 6WxgWJYb5MIx11wv+CPGVuWouVipch3y9EPQ29hTS4QvMgPi4rT00uCJK/yUIdV+smgttBpwMA0
 aaWeqSaKniFIa4757SbiNqDm+7pwF4HIrrZ284hLKTveX26lSvY6H7DI0GsVcMmI24qiENwrMpI
 bcl3IoA+q1XYAYw09qIdY9jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.390200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 54E379BF026BF219D9EA77783C85C521D5323C141728D201CE6D173B3C59F7D52000:8
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

Add compatible name and iommus property for MT8196.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..73d6db34d64a 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8188-gce
           - mediatek,mt8192-gce
           - mediatek,mt8195-gce
+          - mediatek,mt8196-gce
       - items:
           - const: mediatek,mt6795-gce
           - const: mediatek,mt8173-gce
@@ -49,6 +50,9 @@ properties:
     items:
       - const: gce
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - "#mbox-cells"
-- 
2.43.0

