Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FF5B8EDA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 20:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900FE10E9D5;
	Wed, 14 Sep 2022 18:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECF710E9CC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 18:24:01 +0000 (UTC)
X-UUID: c97060d2d79f4cb6b77e252d1b67034a-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qGMEnfywhlnXJMtcma/+J6Y+PMrVYa9K9P7fvykh4Hw=; 
 b=UuavR/suGmooJqYxXmwQrczF79tQKppWsHiLwiZakgJoxEpYP0igbXrhtLnby7QyyEEkYFkhRRgWKAj+sZe5cPHdVlPzEDON8WJBdNIX/6hFVUV2goLZNgALcUXLOB6G0D+2LG9aGAbv9Dm0Po4Eizt/zpa4s4ANiOgMRBC3KDA=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11, REQID:a429ccbf-5604-4343-a6ba-a2cc6c8ae528, IP:0,
 U
 RL:0,TC:0,Content:59,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
 ION:quarantine,TS:154
X-CID-INFO: VERSION:1.1.11, REQID:a429ccbf-5604-4343-a6ba-a2cc6c8ae528, IP:0,
 URL
 :0,TC:0,Content:59,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_US65DF41,ACTIO
 N:quarantine,TS:154
X-CID-META: VersionHash:39a5ff1, CLOUDID:eae770ec-2856-4fce-b125-09d4c7ebe045,
 B
 ulkID:220915022357SRAKOJQE,BulkQuantity:0,Recheck:0,SF:28|17|19|48|801,TC:
 nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c97060d2d79f4cb6b77e252d1b67034a-20220915
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1710593072; Thu, 15 Sep 2022 02:23:56 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 02:23:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 02:23:55 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/5] dt-bindings: arm: mediatek: mmsys: remove the unused
 compatible for mt8195
Date: Thu, 15 Sep 2022 02:23:31 +0800
Message-ID: <20220914182331.20515-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
References: <20220914182331.20515-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The compatible properties of mt8195 have changed to mediatek,mt8195-vdosys0
and mediatek,mt8195-vdosys1 from mediatek,mt895-mmsys, so remove the unused
compatible.

Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index a53b32c0a608..bfbdd30d2092 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -31,7 +31,6 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8192-mmsys
-              - mediatek,mt8195-mmsys
               - mediatek,mt8195-vdosys0
               - mediatek,mt8195-vdosys1
               - mediatek,mt8365-mmsys
-- 
2.18.0

