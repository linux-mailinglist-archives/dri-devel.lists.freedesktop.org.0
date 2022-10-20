Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E760B6057DE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0E410E384;
	Thu, 20 Oct 2022 07:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBBB10E378
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 07:06:07 +0000 (UTC)
X-UUID: c413206ecfc343eeae46ad0a94cb80e9-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r9WeO21nD8/RBB+ni37nuqxV3+S0pvP1ptA35lbhxHs=; 
 b=vHY1SAYFueVip00KvMKIJegaqThQbSK9eCws4xHub4PHe2QHBxWg1mQbn0nbwWJyyDgPMmB2Uo3SHXCUA+MdcfLwd42AwuM86SEWzM/aY9gnIaO1FdITgdowLAX5WBfnb3uKEmHV8gXFumXMakhkiwWUeVXgemMPTSpANxXDvP0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:112f1730-c660-4f86-a32b-c2a0544f943b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.12, REQID:112f1730-c660-4f86-a32b-c2a0544f943b, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:62cd327, CLOUDID:446c64a3-73e4-48dd-a911-57b5d5484f14,
 B
 ulkID:221020150604TUJFT73E,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c413206ecfc343eeae46ad0a94cb80e9-20221020
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1735121377; Thu, 20 Oct 2022 15:06:01 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 20 Oct 2022 15:06:00 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 15:05:59 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
Subject: [PATCH,
 1/2] dt-bindings: display: mediatek: dpi: Add compatible for MediaTek
 MT8188
Date: Thu, 20 Oct 2022 15:05:52 +0800
Message-ID: <1666249553-15801-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, xinlei lee <xinlei.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinlei lee <xinlei.lee@mediatek.com>

For MT8188, the vdosys0 only supports 1T1P mode while the vdosys0 supports 2T1P mode in MT8195.

So we need to add dt-binding documentation of dpi for MediaTek MT8188 SoC.

Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e9..963f82b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
+      - mediatek,mt8188-edp-intf
       - mediatek,mt8192-dpi
       - mediatek,mt8195-dp-intf
 
-- 
2.6.4

