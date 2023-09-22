Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8F7AB398
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F223F10E66B;
	Fri, 22 Sep 2023 14:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8D310E631
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 07:21:26 +0000 (UTC)
X-UUID: a0588cb4591811ee8051498923ad61e6-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RkPdE+JpZv0itBrojOt0/OyskmwK7mG0qvuyuXxtTvc=; 
 b=jNEjCDkXh8yH3cmQm+7QaiGg+WWR4LVk5IM/ZhB7qYoGWVSYj/aXVnReUNfJ/GaIgsx7e5OzCCrsE0vV5akdyZp/xB81XIlWoZRXmBjXnn9PGVVl0v6oXE5LTBoU6lQyOITz68xqjW58zkiGB+nsE2f6L7t1c7waa1u9LDKWhAE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:78030788-70f0-4d64-ba75-549e17492ecb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:d48a00f0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a0588cb4591811ee8051498923ad61e6-20230922
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1785431379; Fri, 22 Sep 2023 15:21:19 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v6 11/16] dt-bindings: display: mediatek: aal: add compatible
 for MT8195
Date: Fri, 22 Sep 2023 15:21:11 +0800
Message-ID: <20230922072116.11009-12-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.483900-8.000000
X-TMASE-MatchedRID: jhJi18RLqAImeoNhEXvE7APZZctd3P4BKhNpTcvbdUKbKItl61J/yfJv
 ocwUrWp7FBpuM64i9KELbigRnpKlKZvjAepGmdoOYoA+nD7xVad5qhBJY5JJjmakIbtSjeZf+AH
 DiUteGjEPI7HokaJEMKpR55DoyBe8BrKBANChwr75p1ytgG5qdI5TTO5rqA7wSZrfNhP3sgUBh9
 AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.483900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 702825D3CBC96F7A3D6D82BBBC654B6051F82FBA5CAC3C640907218BFCCE434F2000:8
X-MTK: N
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:28:57 +0000
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
 dri-devel@lists.freedesktop.org, Moudy
 Ho <moudy.ho@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string for the AAL block in MediaTek MT8195 that
is controlled by MDP3.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 7fd42c8fdc32..b4c28e96dd55 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
+          - mediatek,mt8195-mdp3-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
-- 
2.18.0

