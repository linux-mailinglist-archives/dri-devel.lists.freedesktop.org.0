Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36213A4D873
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB6F10E560;
	Tue,  4 Mar 2025 09:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qjoOe41T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C37B10E54B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741080780;
 bh=JF9sxbEEccR/pwV4UWR6bRzWcVi7LBjHmtUPbTE7LOg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qjoOe41TanW4TxwLEeCxJSMLuyej+aEG/K2EWazvTSV+2UZgG50JfJiJNtqJCwsY4
 l3TLqRS1ZSpZtnZPtNYQGpbhJFD0XXoAQE3jeC84LdiMxZZ1WsGcEieBCKdChIglWf
 aH9lS8ka0ynZjepKUvLtKeuHB2zUh2AdC33uV4Fq47LC3SZs9dFv97Z1+rk/TUngMh
 JX1sNGvPV099kGdv4HiBCMNPAqjRDjtbtIT+DVJ+yqy6mxevk78rNkMbXTYd/kmTwv
 vDbz0hIprjf2A5y7Si0+YUiqcC+MrcZVEubjxJAyPOC8QAN3DV2ll879Lz5YIhEe9J
 K1y4rNxCd5lbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8808917E065A;
 Tue,  4 Mar 2025 10:32:59 +0100 (CET)
Message-ID: <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
Date: Tue, 4 Mar 2025 10:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> MT8196 has 3 new hardware configuration compared with the previous SoC,
> which correspond to the 3 new driver data:
> 
> 1. mminfra_offset: For GCE data plane control
>     Since GCE has been moved into mminfra, GCE needs to append the
>     mminfra offset to the DRAM address when accessing the DRAM.
> 
> 2. gce_vm: For GCE hardware virtualization
>     Currently, the first version of the mt8196 mailbox controller only
>     requires setting the VM-related registers to enable the permissions
>     of a host VM.

I think that the GCE VM changes should go to a different commit, as that
looks like being something not critical for basic functionality of the
MMINFRA GCE.

I really like seeing support for that, but please split the basic stuff
from the extra functionality :-)

> 
> 3. dma_mask_bit: For dma address bit control
>     In order to avoid the hardware limitations of MT8196 accessing DRAM,
>     GCE needs to configure the DMA address to be less than 35 bits.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 90 +++++++++++++++++++++---
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
>   2 files changed, 84 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index d186865b8dce..0abe10a7fef9 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -43,6 +43,17 @@
>   #define GCE_CTRL_BY_SW				GENMASK(2, 0)
>   #define GCE_DDR_EN				GENMASK(18, 16)
>   
> +#define GCE_VM_ID_MAP0			0x5018
> +#define GCE_VM_MAP0_ALL_HOST			GENMASK(29, 0)
> +#define GCE_VM_ID_MAP1			0x501c
> +#define GCE_VM_MAP1_ALL_HOST			GENMASK(29, 0)
> +#define GCE_VM_ID_MAP2			0x5020
> +#define GCE_VM_MAP2_ALL_HOST			GENMASK(29, 0)
> +#define GCE_VM_ID_MAP3			0x5024
> +#define GCE_VM_MAP3_ALL_HOST			GENMASK(5, 0)
> +#define GCE_VM_CPR_GSIZE		0x50c4
> +#define GCE_VM_CPR_GSIZE_HSOT			GENMASK(3, 0)

typo: GSIZE_HOST....

...but also, if you could add some brief description of what the VMIDs are used for
and what the GSIZE is... that'd be very much appreciated from whoever is reading
this.

The GCE stuff isn't even properly described in datasheets - I do (probably!)
understand what those are for, but asking people to get years of experience on
MediaTek to understand what's going on would be a bit rude, wouldn't it? :-D

> +
>   #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
>   #define CMDQ_THR_ENABLED		0x1
>   #define CMDQ_THR_DISABLED		0x0
> @@ -87,11 +98,24 @@ struct cmdq {
>   struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
> +	dma_addr_t mminfra_offset;

It looks like this is exactly the DRAM's iostart... at least, I can see that in the
downstream devicetree that's where it starts.

	memory: memory@80000000 {
		device_type = "memory";
		reg = <0 0x80000000 0 0x40000000>;
	};

It doesn't really look like being a coincidence, but, for the sake of asking:
is this just a coincidence? :-)

>   	bool control_by_sw;
>   	bool sw_ddr_en;
> +	bool gce_vm;
> +	u32 dma_mask_bit;
>   	u32 gce_num;
>   };
>   
> +static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
> +{
> +	return ((addr + pdata->mminfra_offset) >> pdata->shift);
> +}
> +
> +static inline u32 cmdq_reg_revert_addr(dma_addr_t addr, const struct gce_plat *pdata)
> +{
> +	return ((addr << pdata->shift) - pdata->mminfra_offset);
> +}

I'm not sure that you really need those two functions... probably it's simply
cleaner and easier to just write that single line every time... and I'm
saying that especially for how you're using those functions, with some readl()
passed directly as param, decreasing human readability by "a whole lot" :-)

> +
>   static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
>   {
>   	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
> @@ -112,6 +136,30 @@ u8 cmdq_get_shift_pa(struct mbox_chan *chan)
>   }
>   EXPORT_SYMBOL(cmdq_get_shift_pa);
>   
> +dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan)
> +{
> +	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
> +
> +	return cmdq->pdata->mminfra_offset;
> +}
> +EXPORT_SYMBOL(cmdq_get_offset_pa);

I think I remember this get_offset_pa from the old times, then CK removed it (and I
was really happy about that disappearing), or am I confusing this with something
else?

(of course, this wasn't used for mminfra, but for something else!)

> +
> +bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t addr)
> +{
> +	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
> +
> +	if (cmdq->pdata->mminfra_offset == 0)
> +		return false;
> +
> +	/*
> +	 * mminfra will recognize the addr that greater than the mminfra_offset
> +	 * as a transaction to DRAM.
> +	 * So the caller needs to append mminfra_offset for the true case.
> +	 */
> +	return (addr >= cmdq->pdata->mminfra_offset);


/**
  * cmdq_is_mminfra_gce() - Brief description
  * @args.....
  *
  * The MMINFRA GCE will recognize an address greater than DRAM iostart as a
  * DRAM transaction instead of ....xyz
  *
  * In order for callers to perform (xyz) transactions through the CMDQ, those
  * need to know if they are using a GCE located in MMINFRA.
  */
bool cmdq_is_mminfra_gce(...)
{
	return cmdq->pdata->mminfra_offset &&
	       (addr >= cmdq->pdata->mminfra_offset)

> +}
> +EXPORT_SYMBOL(cmdq_addr_need_offset);
> +

...but then, is there really no way of just handling the GCE being in MMINFRA
transparently from the callers? Do the callers really *need* to know that they're
using a new GCE?!

Another way of saying: can't we just handle the address translation in here instead
of instructing each and every driver about how to communicate with the new GCE?!


Cheers,
Angelo

>   static int cmdq_thread_suspend(struct cmdq *cmdq, struct cmdq_thread *thread)
>   {
>   	u32 status;
> @@ -143,6 +191,17 @@ static void cmdq_init(struct cmdq *cmdq)
>   	u32 gctl_regval = 0;
>   
>   	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
> +
> +	if (cmdq->pdata->gce_vm) {
> +		/* config cpr size for host vm */
> +		writel(GCE_VM_CPR_GSIZE_HSOT, cmdq->base + GCE_VM_CPR_GSIZE);
> +		/* config CPR_GSIZE before setting VM_ID_MAP to avoid data leakage */
> +		writel(GCE_VM_MAP0_ALL_HOST, cmdq->base + GCE_VM_ID_MAP0);
> +		writel(GCE_VM_MAP1_ALL_HOST, cmdq->base + GCE_VM_ID_MAP1);
> +		writel(GCE_VM_MAP2_ALL_HOST, cmdq->base + GCE_VM_ID_MAP2);
> +		writel(GCE_VM_MAP3_ALL_HOST, cmdq->base + GCE_VM_ID_MAP3);
> +	}
> +
>   	if (cmdq->pdata->control_by_sw)
>   		gctl_regval = GCE_CTRL_BY_SW;
>   	if (cmdq->pdata->sw_ddr_en)
> @@ -199,7 +258,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>   				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>   	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
>   		(u64)CMDQ_JUMP_BY_PA << 32 |
> -		(task->pa_base >> task->cmdq->pdata->shift);
> +		cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
>   	dma_sync_single_for_device(dev, prev_task->pa_base,
>   				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>   
> @@ -264,7 +323,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   	else
>   		return;
>   
> -	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
> +	curr_pa = cmdq_reg_shift_addr(readl(thread->base + CMDQ_THR_CURR_ADDR), cmdq->pdata);
>   
>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>   				 list_entry) {
> @@ -416,9 +475,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   		 */
>   		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>   
> -		writel(task->pa_base >> cmdq->pdata->shift,
> +		writel(cmdq_reg_shift_addr(task->pa_base, cmdq->pdata),
>   		       thread->base + CMDQ_THR_CURR_ADDR);
> -		writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->pdata->shift,
> +		writel(cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata),
>   		       thread->base + CMDQ_THR_END_ADDR);
>   
>   		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
> @@ -426,10 +485,10 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   		writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
>   	} else {
>   		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> -		curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) <<
> -			cmdq->pdata->shift;
> -		end_pa = readl(thread->base + CMDQ_THR_END_ADDR) <<
> -			cmdq->pdata->shift;
> +		curr_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_CURR_ADDR),
> +					       cmdq->pdata);
> +		end_pa = cmdq_reg_revert_addr(readl(thread->base + CMDQ_THR_END_ADDR),
> +					      cmdq->pdata);
>   		/* check boundary */
>   		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
>   		    curr_pa == end_pa) {
> @@ -663,6 +722,9 @@ static int cmdq_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	if (cmdq->pdata->dma_mask_bit)
> +		dma_set_coherent_mask(dev, DMA_BIT_MASK(cmdq->pdata->dma_mask_bit));
> +
>   	cmdq->mbox.dev = dev;
>   	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->pdata->thread_nr,
>   					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
> @@ -782,6 +844,17 @@ static const struct gce_plat gce_plat_mt8195 = {
>   	.gce_num = 2
>   };
>   
> +static const struct gce_plat gce_plat_mt8196 = {
> +	.thread_nr = 32,
> +	.shift = 3,
> +	.mminfra_offset = 0x80000000, /* 2GB */
> +	.control_by_sw = true,
> +	.sw_ddr_en = true,
> +	.gce_vm = true,
> +	.dma_mask_bit = 35,
> +	.gce_num = 2
> +};
> +
>   static const struct of_device_id cmdq_of_ids[] = {
>   	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_mt6779},
>   	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_mt8173},
> @@ -790,6 +863,7 @@ static const struct of_device_id cmdq_of_ids[] = {
>   	{.compatible = "mediatek,mt8188-gce", .data = (void *)&gce_plat_mt8188},
>   	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_mt8192},
>   	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_mt8195},
> +	{.compatible = "mediatek,mt8196-gce", .data = (void *)&gce_plat_mt8196},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, cmdq_of_ids);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index a8f0070c7aa9..79398bf95f8d 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -79,5 +79,7 @@ struct cmdq_pkt {
>   };
>   
>   u8 cmdq_get_shift_pa(struct mbox_chan *chan);
> +dma_addr_t cmdq_get_offset_pa(struct mbox_chan *chan);
> +bool cmdq_addr_need_offset(struct mbox_chan *chan, dma_addr_t addr);
>   
>   #endif /* __MTK_CMDQ_MAILBOX_H__ */

