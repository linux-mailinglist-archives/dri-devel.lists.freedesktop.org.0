Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF0A392C8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 06:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5310E61A;
	Tue, 18 Feb 2025 05:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="f5oD9v4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DBC10E61A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:44:15 +0000 (UTC)
X-UUID: 5f209fa0edbb11efaae1fd9735fae912-20250218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CmKjnil7lcbxmdcElWmLhqnEMMS7umr+u7D6jla4PQg=; 
 b=f5oD9v4R+k+v6eYlbql2YiQF5/rUn96UPqKtP31gs+mu0UNCQJwYt1FbZdFCMn0/zn5DY6JqCWZlWfz34dv1IA7b0mxaoDZ3IlW4oAb66kOxhb3zfmG2zBN6gdRLN19dagpo7LhUWkIQ7+1ePm+HnegQ9JnPt00X4FxJFOVq+4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:9938223f-17fe-4e0c-a0d0-edbc5490c780, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:60aa074, CLOUDID:9482770b-46a1-4805-887b-d6afca075802,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
 IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
 0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f209fa0edbb11efaae1fd9735fae912-20250218
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 4999; Tue, 18 Feb 2025 13:44:08 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 18 Feb 2025 13:44:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 18 Feb 2025 13:44:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang
 <xavier.chang@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Date: Tue, 18 Feb 2025 13:41:48 +0800
Message-ID: <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
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

MT8196 has 3 new hardware configuration compared with the previous SoC,
which correspond to the 3 new driver data:

1. mminfra_offset: For GCE data plane control
   Since GCE has been moved into mminfra, GCE needs to append the
   mminfra offset to the DRAM address when accessing the DRAM.

2. gce_vm: For GCE hardware virtualization
   Currently, the first version of the mt8196 mailbox controller only
   requires setting the VM-related registers to enable the permissions
   of a host VM.

3. dma_mask_bit: For dma address bit control
   In order to avoid the hardware limitations of MT8196 accessing DRAM,
   GCE needs to configure the DMA address to be less than 35 bits.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 90 +++++++++++++++++++++---
 include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
 2 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index d186865b8dce..0abe10a7fef9 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -43,6 +43,17 @@
 #define GCE_CTRL_BY_SW				GENMASK(2, 0)
 #define GCE_DDR_EN				GENMASK(18, 16)
 
+#define GCE_VM_ID_MAP0			0x5018
+#define GCE_VM_MAP0_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP1			0x501c
+#define GCE_VM_MAP1_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP2			0x5020
+#define GCE_VM_MAP2_ALL_HOST			GENMASK(29, 0)
+#define GCE_VM_ID_MAP3			0x5024
+#define GCE_VM_MAP3_ALL_HOST			GENMASK(5, 0)
+#define GCE_VM_CPR_GSIZE		0x50c4
+#define GCE_VM_CPR_GSIZE_HSOT			GENMASK(3, 0)
+
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
 #define CMDQ_THR_DISABLED		0x0
@@ -87,11 +98,24 @@ struct cmdq {
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	dma_addr_t mminfra_offset;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool gce_vm;
+	u32 dma_mask_bit;
 	u32 gce_num;
 };
 
+static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
+{
+	return ((addr + pdata->mminfra_offset) >> pdata->shift);
+}
+
+static inline u32 cmdq_reg_revert_addr(dma_addr_t addr, const struct gce_plat *pdata)
+{
+	return ((addr << pdata->shift) - pdata->mminfra_offset);
+}
+
 static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
 {
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
@@ -112,6 +136,30 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL(cmdq_get_shift_pa);
 
+dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	return cmdq->pdata->mminfra_offset;
+}
+EXPORT_SYMBOL(cmdq_get_offset_pa);
+
+bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t addr)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	if (cmdq->pdata->mminfra_offset == 0)
+		return false;
+
+	/*
+	 * mminfra will recognize the addr that greater than the mminfra_offset
+	 * as a transaction to DRAM.
+	 * So the caller needs to append mminfra_offset for the true case.
+	 */
+	return (addr >= cmdq->pdata->mminfra_offset);
+}
+EXPORT_SYMBOL(cmdq_addr_need_offset);
+
 static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
 {
 	u32 status;
@@ -143,6 +191,17 @@ static void cmdq_init(struct cmdq *cmdq)
 	u32 gctl_regval = 0;
 
 	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
+
+	if (cmdq->pdata->gce_vm) {
+		/* config cpr size for host vm */
+		writel(GCE_VM_CPR_GSIZE_HSOT, cmdq->base + GCE_VM_CPR_GSIZE);
+		/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
+		writel(GCE_VM_MAP0_ALL_HOST, cmdq->base + GCE_VM_ID_MAP0);
+		writel(GCE_VM_MAP1_ALL_HOST, cmdq->base + GCE_VM_ID_MAP1);
+		writel(GCE_VM_MAP2_ALL_HOST, cmdq->base + GCE_VM_ID_MAP2);
+		writel(GCE_VM_MAP3_ALL_HOST, cmdq->base + GCE_VM_ID_MAP3);
+	}
+
 	if (cmdq->pdata->control_by_sw)
 		gctl_regval = GCE_CTRL_BY_SW;
 	if (cmdq->pdata->sw_ddr_en)
@@ -199,7 +258,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
 				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
 		(u64)CMDQ_JUMP_BY_PA << 32 |
-		(task->pa_base >> task->cmdq->pdata->shift);
+		cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
 	dma_sync_single_for_device(dev, prev_task->pa_base,
 				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
 
@@ -264,7 +323,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	else
 		return;
 
-	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
+	curr_pa = cmdq_reg_shift_addr(readl(thread->base + CMDQ_THR_CURR_ADDR), cmdq->pdata);
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
@@ -416,9 +475,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
-		writel(task->pa_base >> cmdq->pdata->shift,
+		writel(cmdq_reg_shift_addr(task->pa_base, cmdq->pdata),
 		       thread->base + CMDQ_THR_CURR_ADDR);
-		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
+		writel(cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata),
 		       thread->base + CMDQ_THR_END_ADDR);
 
 		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
@@ -426,10 +485,10 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
 	} else {
 		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
-		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
-			cmdq->pdata->shift;
-		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
-			cmdq->pdata->shift;
+		curr_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_CURR_ADDR),
+					       cmdq->pdata);
+		end_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_END_ADDR),
+					      cmdq->pdata);
 		/* check boundary */
 		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
 		    curr_pa == end_pa) {
@@ -663,6 +722,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (cmdq->pdata->dma_mask_bit)
+		dma_set_coherent_mask(dev, DMA_BIT_MASK(cmdq->pdata->dma_mask_bit));
+
 	cmdq->mbox.dev = dev;
 	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
 					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
@@ -782,6 +844,17 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_mt8196 = {
+	.thread_nr = 32,
+	.shift = 3,
+	.mminfra_offset = 0x80000000, /* 2GB */
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_vm = true,
+	.dma_mask_bit = 35,
+	.gce_num = 2
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
@@ -790,6 +863,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
+	{.compatible = "mediatek,mt8196-gce", .data = (void *)&gce_plat_mt8196},
 	{}
 };
 MODULE_DEVICE_TABLE(of, cmdq_of_ids);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..79398bf95f8d 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -79,5 +79,7 @@ struct cmdq_pkt {
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
+dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan);
+bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t addr);
 
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0

