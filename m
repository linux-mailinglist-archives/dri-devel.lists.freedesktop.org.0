Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF590C25FA0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278710EBE4;
	Fri, 31 Oct 2025 16:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="X6D4jiYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB7A10EBDF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 16:03:27 +0000 (UTC)
X-UUID: 1d956c7eb67311f0b33aeb1e7f16c2b6-20251101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7VW5yzR5FOdc8JVybDqTI0Gq7an7XEzc/MvAdJiSE20=; 
 b=X6D4jiYDr8mTf8riw0NO3O6bZZfdUkKBhY5mWv+4wfva4aqc7mFLGoBvEu5kzuszvtlA0ZE+q6W6+DE7Umo7oEO/CkNzrBfnu9DeDE8ZR8phpqdi2gtxrfRIT1Amu6c72NjBOBILonYSM0dpa4AFNX+Ar0JG3FQ2X1ig9X7hy4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:0aaff7ef-5980-4440-8175-43a979f60f35, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:27c6fedf-3890-4bb9-a90e-2a6a4ecf6c66,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d956c7eb67311f0b33aeb1e7f16c2b6-20251101
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 378000813; Sat, 01 Nov 2025 00:03:18 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:03:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:03:16 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>, CK Hu
 <ck.hu@mediatek.com>
Subject: [PATCH 3/5] drm/mediatek:Use reg_write function pointer for subsys ID
 compatibility
Date: Sat, 1 Nov 2025 00:01:58 +0800
Message-ID: <20251031160309.1654761-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to reg_write and reg_write_mask function pointers for register
access, enabling compatibility with platforms regardless of subsys ID
support.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262..282620cf3567 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -72,8 +72,8 @@ void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		cmdq_reg->pkt_write(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+				    cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel(value, regs + offset);
@@ -85,8 +85,8 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		cmdq_reg->pkt_write(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+				    cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel_relaxed(value, regs + offset);
@@ -98,8 +98,8 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
-				    cmdq_reg->offset + offset, value, mask);
+		cmdq_reg->pkt_write_mask(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+					 cmdq_reg->offset + offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
-- 
2.43.0

