Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E0B3965F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF4910E7AF;
	Thu, 28 Aug 2025 08:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="cwUywkJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89210E6CB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:14 +0000 (UTC)
X-UUID: 43b4eb9283e611f0b33aeb1e7f16c2b6-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kCKbvKVu+6T2a+7/X6pKnWxU1a5mqBcSK1MdNCvnqY8=; 
 b=cwUywkJTiXxq7N7hgfRHWIyKuoq/65LQmC9FCldQTDcN0zBMXY7sob+TdK9OFR1lUrEP0l++DZLkCg6XklhOuE4Oef23ls4NM+7ni+ZzZelGrx+EJ91OowcIIAJpXDERtVGGo8o/OCe3MkKQqx5u1GVyttBdjiZoptowdqcBnJM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:ff097a22-0b07-48c7-a6e1-4b4c7bc66db3, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:01719d7a-966c-41bd-96b5-7d0b3c22e782,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43b4eb9283e611f0b33aeb1e7f16c2b6-20250828
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1488346254; Thu, 28 Aug 2025 16:09:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:03 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 02/19] dt-bindings: soc: mediatek: add mutex yaml for MT8196
Date: Thu, 28 Aug 2025 16:06:57 +0800
Message-ID: <20250828080855.3502514-3-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
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

From: Nancy Lin <nancy.lin@mediatek.com>

Add compatible string to support mutex for MT8196.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index a10326a9683d..1be4e139a8b5 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -36,6 +36,7 @@ properties:
       - mediatek,mt8188-vpp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8196-disp-mutex
       - mediatek,mt8195-vpp-mutex
       - mediatek,mt8365-disp-mutex
 
@@ -87,6 +88,7 @@ allOf:
               - mediatek,mt8186-mdp3-mutex
               - mediatek,mt8192-disp-mutex
               - mediatek,mt8195-disp-mutex
+              - mediatek,mt8196-disp-mutex
     then:
       required:
         - clocks
-- 
2.45.2

