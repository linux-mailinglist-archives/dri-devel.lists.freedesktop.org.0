Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C51B39652
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282210E783;
	Thu, 28 Aug 2025 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZWS2ENiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2C310E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:14 +0000 (UTC)
X-UUID: 43b150c283e611f0b33aeb1e7f16c2b6-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ULhWCMRnfloXSUOUb5D++K1tzuZ3+YXJYVeiwkdjmeI=; 
 b=ZWS2ENiyO/IKIEliQS75kN5JGoqXry37/ZRrtgC7tnx9YAwkJizFSv5Af4hz/t5b6lD4whsexVainEtNtQNY5yAy34TqTKChMzzUJarSck+Yts/V+kt+vys6VVujjEIuyBcBrOiCoTjucJhxw7AkpCiFHK3ilZDUtoCD22WzZIE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:87b69fd8-d327-4492-b7d2-64ae4acb7080, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:05719d7a-966c-41bd-96b5-7d0b3c22e782,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 43b150c283e611f0b33aeb1e7f16c2b6-20250828
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1798748701; Thu, 28 Aug 2025 16:09:04 +0800
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
Subject: [PATCH v4 01/19] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
Date: Thu, 28 Aug 2025 16:06:56 +0800
Message-ID: <20250828080855.3502514-2-paul-pl.chen@mediatek.com>
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

In previous SoCs, a single HW pipeline was an independent mmsys,
which included the OVL module, PQ module, and display interface
module.

In the 8196, to increase the flexibility of pipeline connection
and control, the OVL module on a single HW pipeline was separated
into two mmsys, namely ovlsys0 and ovlsys1. The PQ module was also
separated into a dispsys0, and the display interface module was
separated into a dispsys1. Additionally, display power-related
settings are controlled through vdiso-ao.

For example:
The primary path and external path of the display both use
ovlsys0 -> dispsys0 -> dispsys1, forming a pipeline.

The third path of the display uses ovlsys1 -> dispsys0 -> dispsys1,
forming another pipeline.

Therefore, the 8196 needs to add 5 compatible string to support
mmsys for MT8196.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c78..5f244a8f6a47 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -39,6 +39,11 @@ properties:
               - mediatek,mt8195-vdosys1
               - mediatek,mt8195-vppsys0
               - mediatek,mt8195-vppsys1
+              - mediatek,mt8196-dispsys0
+              - mediatek,mt8196-dispsys1
+              - mediatek,mt8196-ovlsys0
+              - mediatek,mt8196-ovlsys1
+              - mediatek,mt8196-vdisp-ao
               - mediatek,mt8365-mmsys
           - const: syscon
 
-- 
2.45.2

