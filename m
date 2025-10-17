Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113DBE6C89
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 08:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DF810EB27;
	Fri, 17 Oct 2025 06:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="PJRrm3m9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F40610EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:50:42 +0000 (UTC)
X-UUID: 936ed128ab2511f0b33aeb1e7f16c2b6-20251017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bviz2cLEdx+RtgN/6hHK3DLWNL6Mg9mRP8KFNaIDkIk=; 
 b=PJRrm3m9NNW/VNlPvjfUWJgm3m6yvW0sWV8gIFtvJVbIs5hPscU7SgIerOX1VfmZzm9YCAh0prhA5sVnkAGREn6hhqArrr+igSIANokP3Qrt2w34QVq8lMvXnYHYPOYGC8vrH58JTAf7Leen/kLkKG4KE/Y3AtFhQA5M4wBMuXY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:0e65e5af-d83e-48b3-aa70-ddeb4eb4492f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:f8d95086-2e17-44e4-a09c-1e463bf6bc47,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 936ed128ab2511f0b33aeb1e7f16c2b6-20251017
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2081574504; Fri, 17 Oct 2025 14:50:32 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:30 +0800
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
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 05/20] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_jump_rel_temp() for removing shift_pa
Date: Fri, 17 Oct 2025 14:44:30 +0800
Message-ID: <20251017065028.1676930-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
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

Since shift_pa will be stored into the cmdq_mobx_priv of cmdq_pkt, all
the shif_pa parameters in CMDQ helper APIs can be removed.

Add cmdq_pkt_jump_rel_temp() for the current users of cmdq_pkt_jump_rel(),
and then remove shift_pa after all users have migrated to the new APIs.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 0c3906e8ad19..9b6d855cacb9 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -377,6 +377,24 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
  */
 int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
 
+/**
+ * cmdq_pkt_jump_rel_temp() - Temporary wrapper for new CMDQ helper API
+ * @pkt:	the CMDQ packet
+ * @offset:	relative offset of target instruction buffer from current PC.
+ * @shift_pa:	[DEPRECATED] shift bits of physical address in CMDQ instruction.
+ *		This value is got by cmdq_get_shift_pa().
+ *
+ * This function is a temporary wrapper that was introduced only for ease of
+ * migration of the many users of the CMDQ API located in multiple kernel
+ * subsystems.
+ *
+ * This has to be removed after all users are migrated to the newer CMDQ API.
+ */
+static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
+}
+
 /**
  * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
  * @pkt:	The CMDQ packet
@@ -506,6 +524,12 @@ static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_p
 	return -EINVAL;
 }
 
+/* This wrapper has to be removed after all users migrated to jump_rel */
+static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
+{
+	return -EIMVAL;
+}
+
 static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
 {
 	return -EINVAL;
-- 
2.43.0

