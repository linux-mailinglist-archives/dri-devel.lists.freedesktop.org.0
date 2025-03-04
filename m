Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD6A4D8A7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914E10E542;
	Tue,  4 Mar 2025 09:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SYsFw1XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD95910E53F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741081041;
 bh=O+9rlfF/uzRCAS1prhuz8xBGKDW0RRz/qKexdWg2yVs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SYsFw1XTKGn8nlc9yGX98hysdmfTLwmrKPyhJ5f/AOf3GEnpmEgtgOcuym/Lbywf2
 drGLXcgVkOWwW6a+o9VD1HK0PYaFKCSg5Uc9waeVycLHxL4djvQEMUGX5RT9qLE8j7
 VezMteK7KIQ03Chmgc+PQR3YGIb1yYrEFwWrf3utdxXvu1f2wT7E4pvetrKgsI6F8s
 pwgP4ERTLHmrKj6LersjzLz6NzjBjcPBBVBJprDynLV7kxbgbs70u76JMVE0RAS551
 Z8TBl46NuCVESgDiKXzaaD4c4/NwOvdSL3HuqlNsyfoFIJ7OrI/DzV3Lb5Z07D+cT0
 ADsdzhXOHYaHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 61DDC17E0630;
 Tue,  4 Mar 2025 10:37:20 +0100 (CET)
Message-ID: <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
Date: Tue, 4 Mar 2025 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
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
 <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
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
> Since GCE has been moved to mminfra in MT8196, all transactions from
> mminfra to DRAM will have their addresses adjusted by subtracting a
> mminfra offset.
> This information should be handled inside the CMDQ driver, allowing
> CMDQ users to call CMDQ APIs as usual.
> 
> Therefore, CMDQ driver needs to use the mbox API to get the
> mminfra_offset value of the SoC, and then add it to the DRAM address
> when generating instructions to ensure GCE accesses the correct DRAM
> address.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 35 ++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index aa9853100d78..f2853a74af01 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -314,10 +314,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
>   
>   int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
>   {
> +	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
>   	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
>   	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
>   	int ret;
>   
> +	if (!cl) {
> +		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
> +		return -EINVAL;
> +	}
> +
> +	if (cmdq_addr_need_offset(cl->chan, src_addr))
> +		src_addr += cmdq_get_offset_pa(cl->chan);

If the offset is just DRAM IOSTART, you could manage that differently in the cmdq
helper as well as the cmdq mailbox... :-)

> +
> +	if (cmdq_addr_need_offset(cl->chan, dst_addr))
> +		dst_addr += cmdq_get_offset_pa(cl->chan);
> +
Cheers,
Angelo
