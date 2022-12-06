Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4541B643B1B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 03:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2897810E2E4;
	Tue,  6 Dec 2022 02:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293110E033
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 02:01:06 +0000 (UTC)
X-UUID: bd63968982cf45ed9125be6c2ef06197-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=q0rmszaIlOQsExzVsiW72bLqTU3pd9gd+JOsVARxfE4=; 
 b=oEh9pnN5mErSe379dId4imJccUsKScbWRcEKKdhQ9tq/7/+U32XusuiCy6998qpxYw1D3fJx12VuZA0UmWL5GYZbQU2qjT4Sk/84gSZlgt9e0DE6zoT5des0T+O5+4k2Q3km6xySubRz5k/diPjaexQM8tnXwq4KH9Qdpem+ikg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:5d1ef73d-0400-478e-b8b0-f6ab5dbebd92, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.14, REQID:5d1ef73d-0400-478e-b8b0-f6ab5dbebd92, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:dcaaed0, CLOUDID:b579a116-b863-49f8-8228-cbdfeedd1fa4,
 B
 ulkID:221206100102RGKMGNFH,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bd63968982cf45ed9125be6c2ef06197-20221206
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1701441810; Tue, 06 Dec 2022 10:01:00 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 10:00:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 10:00:59 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/6] dt-bindings: mediatek: modify VDOSYS0 mutex device
 tree Documentations for MT8188
Date: Tue, 6 Dec 2022 10:00:43 +0800
Message-ID: <20221206020046.11333-4-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221206020046.11333-1-nathan.lu@mediatek.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, devicetree@vger.kernel.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

modify VDOSYS0 mutex device tree Documentations for MT8188.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 9241e5fc7cff..15c133cac315 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -32,6 +32,7 @@ properties:
       - mediatek,mt8183-disp-mutex
       - mediatek,mt8186-disp-mutex
       - mediatek,mt8186-mdp3-mutex
+      - mediatek,mt8188-disp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
 
-- 
2.18.0

