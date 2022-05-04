Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB5519B62
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EDF10FDE0;
	Wed,  4 May 2022 09:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E15410FD29
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:14:53 +0000 (UTC)
X-UUID: 62ebd6e153464bf98ffd604a148d36ff-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:25de177b-457d-4511-a4fe-1f5909c703d3, OB:80,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:95
X-CID-INFO: VERSION:1.1.4, REQID:25de177b-457d-4511-a4fe-1f5909c703d3, OB:80,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
 CTION:quarantine,TS:95
X-CID-META: VersionHash:faefae9, CLOUDID:4468ac2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:f1846824bb4a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 62ebd6e153464bf98ffd604a148d36ff-20220504
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2066523676; Wed, 04 May 2022 17:14:45 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 4 May 2022 17:14:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 17:14:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 17:14:44 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Subject: [PATCH v20 08/25] soc: mediatek: add cmdq support of mtk-mmsys config
 API for mt8195 vdosys1
Date: Wed, 4 May 2022 17:14:23 +0800
Message-ID: <20220504091440.2052-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504091440.2052-1-nancy.lin@mediatek.com>
References: <20220504091440.2052-1-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add cmdq support for mtk-mmsys config API.
The mmsys config register settings need to take effect with the other
HW settings(like OVL_ADAPTOR...) at the same vblanking time.

If we use CPU to write the mmsys reg, we can't guarantee all the
settings can be written in the same vblanking time.
Cmdq is used for this purpose. We prepare all the related HW settings
in one cmdq packet. The first command in the packet is "wait stream done",
and then following with all the HW settings. After the cmdq packet is
flush to GCE HW. The GCE waits for the "stream done event" to coming
and then starts flushing all the HW settings. This can guarantee all
the settings flush in the same vblanking.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c       | 54 +++++++++++++++++++-------
 include/linux/soc/mediatek/mtk-mmsys.h | 15 +++++--
 2 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1b9b44e0d9d9..43bb8026e6d5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -177,6 +177,7 @@ struct mtk_mmsys {
 	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
 	struct reset_controller_dev rcdev;
 	phys_addr_t io_start;
+	struct cmdq_client_reg cmdq_base;
 };
 
 static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
@@ -191,10 +192,24 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
 	return -EINVAL;
 }
 
-static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	u32 tmp;
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_pkt) {
+		if (mmsys->cmdq_base.size == 0) {
+			pr_err("mmsys lose gce property, failed to update mmsys bits with cmdq");
+			return;
+		}
+		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+				    mmsys->cmdq_base.offset + offset, val,
+				    mask);
+		return;
+	}
+#endif
+
 	tmp = readl_relaxed(mmsys->regs + offset);
 	tmp = (tmp & ~mask) | val;
 	writel_relaxed(tmp, mmsys->regs + offset);
@@ -211,7 +226,7 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
-					      routes[i].val);
+					      routes[i].val, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -225,42 +240,45 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
-			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
+			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
+				  struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
-			      ~0, height << 16 | width);
+			      ~0, height << 16 | width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
 
-void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height)
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
+			   struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
-			      be_height << 16 | be_width);
+			      be_height << 16 | be_width, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth)
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
-			      alpha << 16 | alpha);
+			      alpha << 16 | alpha, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
-			      alpha_sel << (19 + idx));
+			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
+			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt)
 {
 	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
-			      BIT(4), channel_swap << 4);
+			      BIT(4), channel_swap << 4, cmdq_pkt);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
 
@@ -273,9 +291,9 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
 	spin_lock_irqsave(&mmsys->lock, flags);
 
 	if (assert)
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0, NULL);
 	else
-		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
+		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id), NULL);
 
 	spin_unlock_irqrestore(&mmsys->lock, flags);
 
@@ -365,6 +383,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		mmsys->data = match_data->drv_data[0];
 	}
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
+#endif
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index fe620929b0f9..7a73305390ba 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -6,6 +6,10 @@
 #ifndef __MTK_MMSYS_H
 #define __MTK_MMSYS_H
 
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
 enum mtk_ddp_comp_id;
 struct device;
 
@@ -73,13 +77,16 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
-void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
+void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width,
+				  int height, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height);
+void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int be_height,
+			   struct cmdq_pkt *cmdq_pkt);
 
 void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
-			       u8 mode, u32 biwidth);
+			       u8 mode, u32 biwidth, struct cmdq_pkt *cmdq_pkt);
 
-void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
+void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
+				     struct cmdq_pkt *cmdq_pkt);
 
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0

