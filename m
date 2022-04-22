Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A376A50B73F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215710F749;
	Fri, 22 Apr 2022 12:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5E10F749
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:28:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r19so5012437wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=OyXBUfzKi3LzVE4UaPKGnkm9xwQ/OYPzcBdjh0z6fcI=;
 b=EY5axFg1Og2pflpZh1XPCtv+k2VXUEY+y0G2Ty72jSbnynoMbq3N6rju63bkNyRrgW
 Hjg7LzN/dPCx9gN4HKQF3lti1zXgh64g78HvOVZ6D+gpkTQIsl2PcDc50Sp8l4ph5NFD
 pambQZurVdrQvgc5Q+akxA4y9eflgXRQsmHuXJtzsXZFBsFigMHvIzCZm7MjQw541W1m
 FoGB3H8/UjXzCFAZWAHpfwC7cXLbBBH1l7HUw8HKKNaLwccGvcgC2xK7MNgTqvKG3QO1
 Z+4ofuf5c1jfL6++nVyW/k103R/YUA8Kpe9fj4zMfyEJbLue3qNybyqptZdDEPV3VZ5X
 CIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=OyXBUfzKi3LzVE4UaPKGnkm9xwQ/OYPzcBdjh0z6fcI=;
 b=YW0nce2lKyx7FBU1Td0Kdk7Ogy2iCN6Dfg5MTSQI79zT26u9xBaqXjJrZ7edbNSYbi
 mbQrN0Sh+MBog7wM3N7mKlBZhbrV8TssAIQyDzHEXtyuOlHoIm21nT4N72OMxjDIfwCb
 pNSQUw85x1KhmHiOS0QvtYq7DYeRL67tG8zzoC9qBtu9rCsjgKHJojhqITBppX73fvkJ
 q7nyd+bm+NY7kzX4M+azoQpRtT8dYREyz54wulFXrNT/mhdZxceUKXdDx7S+qnJWdwZI
 axMSi0qX08rUt2vk+Zu75F+XdiTKjYgPQFkYk9pw1bKWAdTXRcbEL9i3KvvqMxzth+KM
 00hw==
X-Gm-Message-State: AOAM531dWRV4KFdj+/WuZlvdfEOdHBjCPl+/FFz5pFOGCQt9Ba+Kc0iP
 g9rLNirbM6V4NWQWj3619Tc=
X-Google-Smtp-Source: ABdhPJxAEUkLNeMQ7LNi+1V3Z3VwSrVwwenNFxbUF4VBRWkf/zmN6Ykj2urBLGwdmkzeMhJO1pHa9Q==
X-Received: by 2002:a05:600c:4f54:b0:392:9267:7930 with SMTP id
 m20-20020a05600c4f5400b0039292677930mr13234595wmq.63.1650630523740; 
 Fri, 22 Apr 2022 05:28:43 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm1744093wrf.10.2022.04.22.05.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:28:43 -0700 (PDT)
Message-ID: <30fcfaf9-ef68-02ee-ba7f-81eb6e1e0b0b@gmail.com>
Date: Fri, 22 Apr 2022 14:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-2-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v20 1/8] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
In-Reply-To: <20220419094143.9561-2-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 11:41, jason-jh.lin wrote:
> 1. Add mt8195 mmsys compatible for 2 vdosys.
> 2. Add io_start into each driver data of mt8195 vdosys.
> 3. Add get match data function to identify mmsys by io_start.
> 4. Add mt8195 routing table settings of vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I'm not very happy with the approach of testing against the reg property to 
decide which version of the two mmsys devices we are probing. I think a better 
approach would be, if we would have added some mediatek specific ID to the 
device tree binding (or use a two compatibles?).

But as we are at v20 I think it wouldn't be fair to ask for such an instrusive 
change. So I'll take this patch now, but maybe we can discuss if we can't do 
better in a follow-up patch. Especially I don't think it's a good approach to 
check for the io_start in the DRM driver. Couldn't we pass the information about 
which of the two mmsys blocks we are calling from through the mediatek-drm 
platform device spefic data?

I also had a look into the vdosys1 series to better understand why we need to do 
things as we do them. But honestly I wasn't able to really understand the 
implication of the patch that adds 'multi mmsys support' [1]. For this looks 
like a several patches that got squashed into one. But as I don't have to 
maintain that it is not my call to complain, the patch has the needed reviews.

For this patch, now applied to v5.18-next/soc

Thanks for all people implicated.

Regards,
Matthias

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220416020749.29010-19-nancy.lin@mediatek.com/

> ---
> Based on series [1]
> 
> [1] MediaTek MT8195 display binding
> - https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=295669
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    | 370 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 152 +++++++++-
>   drivers/soc/mediatek/mtk-mmsys.h       |   6 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  11 +
>   4 files changed, 528 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..13ab0ab64396
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,370 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
> +#define __SOC_MEDIATEK_MT8195_MMSYS_H
> +
> +#define MT8195_VDO0_OVL_MOUT_EN					0xf14
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
> +#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
> +#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
> +
> +#define MT8195_VDO0_SEL_IN					0xf34
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_MASK			GENMASK(1, 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK			GENMASK(4, 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK			GENMASK(5, 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK			GENMASK(8, 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK			GENMASK(9, 9)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_MASK			GENMASK(13, 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 0)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)
> +#define MT8195_SEL_IN_DSI0_FROM_MASK				GENMASK(16, 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			(0 << 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			(1 << 16)
> +#define MT8195_SEL_IN_DSI1_FROM_MASK				GENMASK(17, 17)
> +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			(0 << 17)
> +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 << 17)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_MASK			GENMASK(20, 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
> +#define MT8195_SEL_IN_DSC_WRAP1_FROM_MASK			GENMASK(21, 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0 << 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		(1 << 21)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_MASK			GENMASK(22, 22)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT					0xf38
> +#define MT8195_SOUT_DISP_DITHER0_TO_MASK			BIT(0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 << 0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 << 0)
> +#define MT8195_SOUT_DISP_DITHER1_TO_MASK			GENMASK(2, 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			(1 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 << 1)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK			GENMASK(4, 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			(0 << 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			(1 << 4)
> +#define MT8195_SOUT_VPP_MERGE_TO_MASK				GENMASK(10, 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSI1				(0 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			(2 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(3 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			(4 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK		GENMASK(11, 11)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			(0 << 11)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK			GENMASK(13, 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			(2 << 12)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK			GENMASK(17, 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			(1 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
> +		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0,
> +		MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL1,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1,
> +		MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
> +		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1,
> +		MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_OVL0,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0,
> +		MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
> +		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
> +		MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
> +		MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
> +		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
> +		MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
> +		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
> +		MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
> +		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
> +		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
> +		MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
> +		MT8195_SEL_IN_DSI1_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
> +		MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
> +		MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
> +		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
> +	}, {
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
> +		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA0_FROM_MASK,
> +		MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
> +	}, {
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER0_TO_DSI0
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
> +		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
> +		MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
> +		MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_DSI1
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN
> +	}, {
> +		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK,
> +		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
> +	}, {
> +		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
> +		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
> +		MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE
> +	}
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 4fc4c2c9ea20..548efed8dc1c 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -17,6 +17,7 @@
>   #include "mt8183-mmsys.h"
>   #include "mt8186-mmsys.h"
>   #include "mt8192-mmsys.h"
> +#include "mt8195-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
> @@ -25,26 +26,61 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   };
>   
> +static const struct mtk_mmsys_match_data mt2701_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt2701_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>   	.clk_driver = "clk-mt2712-mm",
>   	.routes = mmsys_default_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   };
>   
> +static const struct mtk_mmsys_match_data mt2712_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt2712_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
>   	.clk_driver = "clk-mt6779-mm",
>   };
>   
> +static const struct mtk_mmsys_match_data mt6779_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt6779_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
>   	.clk_driver = "clk-mt6797-mm",
>   };
>   
> +static const struct mtk_mmsys_match_data mt6797_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt6797_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8167-mm",
>   	.routes = mt8167_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
>   };
>   
> +static const struct mtk_mmsys_match_data mt8167_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8167_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8173-mm",
>   	.routes = mmsys_default_routing_table,
> @@ -52,6 +88,13 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
> +static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8173_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
> @@ -59,6 +102,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>   };
>   
> +static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8183_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8186-mm",
>   	.routes = mmsys_mt8186_routing_table,
> @@ -66,25 +116,79 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>   };
>   
> +static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8186_mmsys_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>   };
>   
> +static const struct mtk_mmsys_match_data mt8192_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8192_mmsys_driver_data,
> +	},
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
> +	.io_start = 0x1c01a000,
> +	.clk_driver = "clk-mt8195-vdo0",
> +	.routes = mmsys_mt8195_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +};
> +
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> +	.io_start = 0x1c100000,
> +	.clk_driver = "clk-mt8195-vdo1",
> +};
> +
> +static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> +	.num_drv_data = 2,
> +	.drv_data = {
> +		&mt8195_vdosys0_driver_data,
> +		&mt8195_vdosys1_driver_data,
> +	},
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
>   	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
>   };
>   
> +static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
> +	.num_drv_data = 1,
> +	.drv_data = {
> +		&mt8365_mmsys_driver_data,
> +	},
> +};
> +
>   struct mtk_mmsys {
>   	void __iomem *regs;
>   	const struct mtk_mmsys_driver_data *data;
>   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>   	struct reset_controller_dev rcdev;
> +	phys_addr_t io_start;
>   };
>   
> +static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> +					const struct mtk_mmsys_match_data *match)
> +{
> +	int i;
> +
> +	for (i = 0; i < match->num_drv_data; i++)
> +		if (mmsys->io_start == match->drv_data[i]->io_start)
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
> @@ -179,7 +283,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct platform_device *clks;
>   	struct platform_device *drm;
> +	const struct mtk_mmsys_match_data *match_data;
>   	struct mtk_mmsys *mmsys;
> +	struct resource *res;
>   	int ret;
>   
>   	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
> @@ -205,7 +311,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	mmsys->data = of_device_get_match_data(&pdev->dev);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(dev, "Couldn't get mmsys resource\n");
> +		return -EINVAL;
> +	}
> +	mmsys->io_start = res->start;
> +
> +	match_data = of_device_get_match_data(dev);
> +	if (match_data->num_drv_data > 1) {
> +		/* This SoC has multiple mmsys channels */
> +		ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
> +		if (ret < 0) {
> +			dev_err(dev, "Couldn't get match driver data\n");
> +			return ret;
> +		}
> +		mmsys->data = match_data->drv_data[ret];
> +	} else {
> +		dev_dbg(dev, "Using single mmsys channel\n");
> +		mmsys->data = match_data->drv_data[0];
> +	}
> +
>   	platform_set_drvdata(pdev, mmsys);
>   
>   	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
> @@ -226,43 +352,47 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   static const struct of_device_id of_match_mtk_mmsys[] = {
>   	{
>   		.compatible = "mediatek,mt2701-mmsys",
> -		.data = &mt2701_mmsys_driver_data,
> +		.data = &mt2701_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt2712-mmsys",
> -		.data = &mt2712_mmsys_driver_data,
> +		.data = &mt2712_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt6779-mmsys",
> -		.data = &mt6779_mmsys_driver_data,
> +		.data = &mt6779_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt6797-mmsys",
> -		.data = &mt6797_mmsys_driver_data,
> +		.data = &mt6797_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8167-mmsys",
> -		.data = &mt8167_mmsys_driver_data,
> +		.data = &mt8167_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8173-mmsys",
> -		.data = &mt8173_mmsys_driver_data,
> +		.data = &mt8173_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8183-mmsys",
> -		.data = &mt8183_mmsys_driver_data,
> +		.data = &mt8183_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8186-mmsys",
> -		.data = &mt8186_mmsys_driver_data,
> +		.data = &mt8186_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8192-mmsys",
> -		.data = &mt8192_mmsys_driver_data,
> +		.data = &mt8192_mmsys_match_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-mmsys",
> +		.data = &mt8195_mmsys_match_data,
>   	},
>   	{
>   		.compatible = "mediatek,mt8365-mmsys",
> -		.data = &mt8365_mmsys_driver_data,
> +		.data = &mt8365_mmsys_match_data,
>   	},
>   	{ }
>   };
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index 77f37f8c715b..f01ba206481d 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -87,12 +87,18 @@ struct mtk_mmsys_routes {
>   };
>   
>   struct mtk_mmsys_driver_data {
> +	const resource_size_t io_start;
>   	const char *clk_driver;
>   	const struct mtk_mmsys_routes *routes;
>   	const unsigned int num_routes;
>   	const u16 sw0_rst_offset;
>   };
>   
> +struct mtk_mmsys_match_data {
> +	unsigned short num_drv_data;
> +	const struct mtk_mmsys_driver_data *drv_data[];
> +};
> +
>   /*
>    * Routes in mt8173, mt2701, mt2712 are different. That means
>    * in the same register address, it controls different input/output
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 4bba275e235a..cff5c9adbf46 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -17,13 +17,24 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_COLOR0,
>   	DDP_COMPONENT_COLOR1,
>   	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DITHER1,
> +	DDP_COMPONENT_DP_INTF0,
> +	DDP_COMPONENT_DP_INTF1,
>   	DDP_COMPONENT_DPI0,
>   	DDP_COMPONENT_DPI1,
> +	DDP_COMPONENT_DSC0,
> +	DDP_COMPONENT_DSC1,
>   	DDP_COMPONENT_DSI0,
>   	DDP_COMPONENT_DSI1,
>   	DDP_COMPONENT_DSI2,
>   	DDP_COMPONENT_DSI3,
>   	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_MERGE0,
> +	DDP_COMPONENT_MERGE1,
> +	DDP_COMPONENT_MERGE2,
> +	DDP_COMPONENT_MERGE3,
> +	DDP_COMPONENT_MERGE4,
> +	DDP_COMPONENT_MERGE5,
>   	DDP_COMPONENT_OD0,
>   	DDP_COMPONENT_OD1,
>   	DDP_COMPONENT_OVL0,
