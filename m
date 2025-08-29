Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84BB3B6E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B372210EB75;
	Fri, 29 Aug 2025 09:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fFa2JM+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16E10E124
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:17:35 +0000 (UTC)
X-UUID: fce927e084b811f0b33aeb1e7f16c2b6-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gJ0fGW8LBFDyCYyGl0z+4IhGB806t2gObXrk4IGCHXQ=; 
 b=fFa2JM+kuvyWdCo8RZn/Zalnc6hhneVr5jLDpVU16RFt3M44Og6hXWBU9s2VMsBBuF9chpgCWhf5FZMnkGAHlu1fHFn/3qVENoKEx86Zi5L2Y2NgRUWgk56oH3v+dtOqMfsZDjvBdcMb3Plh4YraYDGjEAx5J9evsh2iZjxPbfw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:73de13f5-ff43-498b-88b7-0867abf6a52a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:8e37fe6b-8443-424b-b119-dc42e68239b0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fce927e084b811f0b33aeb1e7f16c2b6-20250829
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1471814497; Fri, 29 Aug 2025 17:17:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 17:17:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 17:17:28 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
 <sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 "Jarried Lin" <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>
Subject: [PATCH v2 3/3] media: platform: mtk-mdp3: Add pm_runtime support for
 GCE power control
Date: Fri, 29 Aug 2025 17:16:00 +0800
Message-ID: <20250829091727.3745415-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
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

Call pm_runtime_resume_and_get() before accessing GCE hardware in
mbox_send_message(), and invoke pm_runtime_put_autosuspend() in the
cmdq callback to release the PM reference and start autosuspend for
GCE. This ensures correct power management for the GCE device.

Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index e5ccf673e152..bb7a895318af 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -6,6 +6,7 @@
 
 #include <linux/mailbox_controller.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include "mtk-mdp3-cfg.h"
 #include "mtk-mdp3-cmdq.h"
 #include "mtk-mdp3-comp.h"
@@ -521,6 +522,9 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
 	mdp = cmd->mdp;
 	dev = &mdp->pdev->dev;
 
+	pm_runtime_mark_last_busy(mdp->cmdq_clt[cmd->pp_idx]->chan->mbox->dev);
+	pm_runtime_put_autosuspend(mdp->cmdq_clt[cmd->pp_idx]->chan->mbox->dev);
+
 	INIT_WORK(&cmd->auto_release_work, mdp_auto_release_work);
 	if (!queue_work(mdp->clock_wq, &cmd->auto_release_work)) {
 		struct mtk_mutex *mutex;
@@ -702,6 +706,13 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 					   cmd[i]->pkt.pa_base, cmd[i]->pkt.cmd_buf_size,
 					   DMA_TO_DEVICE);
 
+		ret = pm_runtime_resume_and_get(mdp->cmdq_clt[i]->chan->mbox->dev);
+		if (ret < 0) {
+			dev_err(dev, "pm_runtime_resume_and_get fail: %d!\n", ret);
+			i = pp_used;
+			goto err_clock_off;
+		}
+
 		ret = mbox_send_message(mdp->cmdq_clt[i]->chan, &cmd[i]->pkt);
 		if (ret < 0) {
 			dev_err(dev, "mbox send message fail %d!\n", ret);
-- 
2.43.0

