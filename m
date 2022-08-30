Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38335A5BF7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 08:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5310E53C;
	Tue, 30 Aug 2022 06:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCF010E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 06:39:43 +0000 (UTC)
X-UUID: 00fe4f578de9493a88a4e782fe7f912c-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TQs6Q3+RWefSzzUisUoYCLIBCbSdiczGmhp+W4Fkwq0=; 
 b=nK1t6B9yqpNX3ZNQ8OWYoVrWKkBIZl5HY5inE3+V7FG4txBLC/15u7lBdu2v8hTThvDkfBl9VHsLc1miDUPgx+F3YarucIYZUmBaT481CzvaEQiM2HIA4ELdxK/qsYgnRsLe4Kvzj+R7BlilbDHunViSojuB2gxDHlsGLiOmXAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6b8e30dc-5e28-4aca-962f-7deec50affc3, OB:0,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Relea
 se_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10, REQID:6b8e30dc-5e28-4aca-962f-7deec50affc3, OB:0,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS
 981B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18, CLOUDID:a6df8420-1c20-48a5-82a0-25f9c331906d,
 C
 OID:d2add9fb9bc3,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 00fe4f578de9493a88a4e782fe7f912c-20220830
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <zheng-yan.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1218137919; Tue, 30 Aug 2022 14:39:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 14:39:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 30 Aug 2022 14:39:32 +0800
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for mt8195
Date: Tue, 30 Aug 2022 14:39:27 +0800
Message-ID: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
current 9bit-to-10bit gamma-LUT.

This patch thus add constant compatible for mt8195, which means that
mt8195 should only use specified mt8195 gamma driver data.

Also, delete related compatible from enum, to ensure that
mt8195 will not accidentally get others' gamma driver data and thus
cause fatal error.

Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..fbd7b9664a78 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -25,11 +25,12 @@ properties:
           - const: mediatek,mt8173-disp-gamma
       - items:
           - const: mediatek,mt8183-disp-gamma
+      - items:
+          - const: mediatek,mt8195-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
-              - mediatek,mt8195-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
-- 
2.18.0

