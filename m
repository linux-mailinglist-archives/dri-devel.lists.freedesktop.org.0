Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824D5AE357
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBAC10E5EE;
	Tue,  6 Sep 2022 08:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA9F10E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:45:19 +0000 (UTC)
X-UUID: f9e009fdaf78437ea63ce32e9108c810-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rFcRBn72ubAe1SKerr6GrL7Lu01yYKG7fpplkBk1IfY=; 
 b=VvQZiQG18+W7EPIkA9za06PSI/XjiHJWtCm0cPgI2M/UPjd9TDFlDsno2wQD+fC0pl8HLuFXqjgHgfDxQFpwxk/tzkXRG0JLfIL9iFFF/CpbS26E+QJWvdRUG7HSfytgSylX21QigkyNK4y5OPr2NfrPIDck9r4vHdzNoUOOdF0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:416d351c-5c8f-4ab8-8a08-997d60d38887, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:53,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:53
X-CID-META: VersionHash:84eae18, CLOUDID:5aded8d0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f9e009fdaf78437ea63ce32e9108c810-20220906
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 984042470; Tue, 06 Sep 2022 16:45:14 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 16:45:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:13 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Date: Tue, 6 Sep 2022 16:44:45 +0800
Message-ID: <20220906084449.20124-3-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
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
 wsd_upstream@mediatek.com, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

modify VDOSYS0 mmsys device tree Documentations for MT8188.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..f26f61069181 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
+              - mediatek,mt8188-mmsys
               - mediatek,mt8192-mmsys
               - mediatek,mt8195-mmsys
               - mediatek,mt8365-mmsys
-- 
2.18.0

