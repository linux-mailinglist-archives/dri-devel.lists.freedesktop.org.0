Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3DD8CF203
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D8310E9DE;
	Sat, 25 May 2024 23:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Yk9TTsBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3739410E482
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:08:18 +0000 (UTC)
X-UUID: a8d8b78e1aeb11efbfff99f2466cf0b4-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LN8PN6WdAK9w2x83kX6kZCxmAZMlqcey6szu6viJQYg=; 
 b=Yk9TTsBvMNX04Mk5ks52iIhWpIKbEDZnkPYy6ykATd4oRL9sMdB2k5od5HSJG0JtjRYnLPkX+aX2Gr9klN9j2tCWwT78bo62lhtM/f/qxiCCfcK3TobGQzLIQU0v/Y4kwKCpFv11mZ3PVtdhu0SCOHw5J682TI/PMBg4jIg+u7c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:a7a273e8-9311-4746-84fb-138742c42b4e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:80c23693-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a8d8b78e1aeb11efbfff99f2466cf0b4-20240526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1916550598; Sun, 26 May 2024 07:08:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 1/8] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Date: Sun, 26 May 2024 07:08:03 +0800
Message-ID: <20240525230810.24623-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 2 kind of GCE event signal:
- The SW token means: a GCE event signal triggered by SW drivers.
e.g. SW driver append a GCE command to set a GCE event after a specific
GCE command. Or SW driver use CPU to write a event id to GCE register to
trigger the GCE event corresponding to that event id.

- The HW event means: a GCE event signal triggered by HW engines.
e.g. When HW OVL fetches all the data in frame buffer, HW OVL will send
a frame done irq and also send a frame done GCE event via HW bus directly.

CMDQ_SYNC_TOKEN_SECURE_THR_EOF is a SW token event that is set in the
end of each cmdq secure pkt. It is used as a secure irq to notify
CMDQ driver in the normal world that GCE secure thread has completed
a secure cmd buffer in thee secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 include/dt-bindings/gce/mt8195-gce.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/gce/mt8195-gce.h b/include/dt-bindings/gce/mt8195-gce.h
index dcfb302b8a5b..b6b3db82c381 100644
--- a/include/dt-bindings/gce/mt8195-gce.h
+++ b/include/dt-bindings/gce/mt8195-gce.h
@@ -800,6 +800,12 @@
 #define CMDQ_EVENT_WPE_VPP1_WPE_GCE_FRAME_DONE	969
 #define CMDQ_EVENT_WPE_VPP1_WPE_DONE_SYNC_OUT	970
 
+/*
+ * Notify normal CMDQ there are some secure task done,
+ * this token sync with secure world.
+ */
+#define CMDQ_SYNC_TOKEN_SECURE_THR_EOF			980
+
 #define CMDQ_EVENT_DP_TX_VBLANK_FALLING	994
 #define CMDQ_EVENT_DP_TX_VSC_FINISH	995
 
-- 
2.18.0

