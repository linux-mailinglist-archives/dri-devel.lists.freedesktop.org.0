Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0A3A0DEE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C966E3C4;
	Wed,  9 Jun 2021 07:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868EC6E3C4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 07:42:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r9so7615964wrz.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=So7c7JWPkLjUFwh5Mbzg+5acl7ZVlcpT5mPSiX7o4aQ=;
 b=ak/Oj0b7S2bRhaYUxnwunkIfDMKJLwBrLUHurksp7KJFEWifeLlzqDfEF118CCOREt
 W35tGqAIrHkjCav8TxrI2FTqonrRPWvTYYyCWJ2onfsLlc/8CJ5lcpgIqZPIMRhTKrub
 75ZxBq1Pi0iHFRlomG/3yoGuxe39NXEB7kehy9oz6lJcauqhWi7/5oFiUDJGK61WQWlu
 lJ1KqjdotIDP7f6mrXKg6x/jLK0VRMmEj3Ge98U0LWpYrgzdPOTmYVoP20GGWLnkPr+W
 jKL+jHNr8Cv3qJfkL//tu20lqsZof1ry8uhdJ+sRy8jpv8y5LJT3BxfaiGiYvDoOqYLd
 67dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=So7c7JWPkLjUFwh5Mbzg+5acl7ZVlcpT5mPSiX7o4aQ=;
 b=R46e9YOlokBDBavuQb03p3huUhj3Z3N2+1P14ow5k8tGjMBgWmf8FTW1jPiIV40cC7
 W+5IGrS59qiO/dsp+vLmotRbO8LIat+kRP7h7QX0c1RLNaz3JKTXqeooeeyuqt9ga1JC
 U8qKdFclrl3hFc4RhIRQ/jhAOY+KaNxgmOJVSZIYMlsjADZBjOTgIedwq/bPtVDaA7D8
 lFae/ZAm/688OdMyLo2/Vu+GWc0qmdvFayALknXuI/9K2f0sVjGdaVD/NUwX3xSxYiDx
 eAct1t6xO6x7NBvDlq+ApSko3eKvsOtpnb4PP9KPB8iyEz+FAlrSOqY+tIzk5/XlEmkV
 cJqA==
X-Gm-Message-State: AOAM532Ry94p5sq1sKR4B9oEXb9j+98gm8uL/RPcx73R038i0KlP0dK8
 0sbCGJcD4j7MbCi1xSFSj1k=
X-Google-Smtp-Source: ABdhPJzlKoBTyl107ZDIoOMGsxhiXisYxLa5tONf+ZkcfDuiJGC/CjWXYkP3mkHWKyfav5i5xCwmsw==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr26786450wrp.356.1623224546286; 
 Wed, 09 Jun 2021 00:42:26 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id n7sm4709769wmq.37.2021.06.09.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:42:25 -0700 (PDT)
Subject: Re: [PATCH v5, 4/4] soc: mediatek: mmsys: Add mt8192 mmsys routing
 table
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com>
 <f7fd0d7038361c7efae54ba96924105baa3fb033.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2e855ea5-232f-1fe6-46df-aeafd01a9ba6@gmail.com>
Date: Wed, 9 Jun 2021 09:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <f7fd0d7038361c7efae54ba96924105baa3fb033.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/06/2021 00:59, Chun-Jie Chen wrote:
> On Mon, 2021-04-12 at 22:04 +0800, Yongqiang Niu wrote:
>> mt8192 has different routing registers than mt8183
>>
>> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
>> ---
>>  drivers/soc/mediatek/mt8192-mmsys.h | 68
>> +++++++++++++++++++++++++++++++++++++
>>  drivers/soc/mediatek/mtk-mmsys.c    |  7 ++++
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
>>
>> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h
>> b/drivers/soc/mediatek/mt8192-mmsys.h
>> new file mode 100644
>> index 0000000..3179029
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __SOC_MEDIATEK_MT8192_MMSYS_H
>> +#define __SOC_MEDIATEK_MT8192_MMSYS_H
>> +
>> +#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
>> +#define MT8192_DISP_OVL1_2L_MOUT_EN		0xf08
>> +#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
>> +#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
>> +#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
>> +#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
>> +#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
>> +#define MT8192_DISP_AAL0_SEL_IN			0xf38
>> +#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
>> +#define MT8192_DISP_DSI0_SEL_IN			0xf40
>> +#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
>> +
>> +#define MT8192_DISP_OVL0_GO_BLEND			BIT(0)
>> +#define MT8192_DITHER0_MOUT_IN_DSI0			BIT(0)
>> +#define MT8192_OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
>> +#define MT8192_OVL2_2L_MOUT_EN_RDMA4			BIT(0)
>> +#define MT8192_DISP_OVL0_GO_BG				BIT(1)
>> +#define MT8192_DISP_OVL0_2L_GO_BLEND			BIT(2)
>> +#define MT8192_DISP_OVL0_2L_GO_BG			BIT(3)
>> +#define MT8192_OVL1_2L_MOUT_EN_RDMA1			BIT(4)
>> +#define MT8192_OVL0_MOUT_EN_OVL0_2L			BIT(4)
>> +#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
>> +#define MT8192_RDMA0_SOUT_COLOR0			0x1
>> +#define MT8192_CCORR0_SOUT_AAL0				0x1
>> +#define MT8192_AAL0_SEL_IN_CCORR0			0x1
>> +#define MT8192_DSI0_SEL_IN_DITHER0			0x1
>> +
>> +static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] =
>> {
>> +	{
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_DISP_OVL0_2L_MOUT_EN,
>> MT8192_OVL0_MOUT_EN_DISP_RDMA0,
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
>> +		MT8192_DISP_OVL2_2L_MOUT_EN,
>> MT8192_OVL2_2L_MOUT_EN_RDMA4
>> +	}, {
>> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>> +		MT8192_DISP_DITHER0_MOUT_EN,
>> MT8192_DITHER0_MOUT_IN_DSI0
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L
>> +	}, {
>> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
>> +		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0
>> +	}, {
>> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
>> +		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0
>> +	}, {
>> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
>> +		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0
>> +	}, {
>> +		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
>> +		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0
>> +	}, {
>> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
>> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_GO_BG,
>> +	}, {
>> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
>> +		MT8192_MMSYS_OVL_MOUT_EN, MT8192_DISP_OVL0_2L_GO_BLEND,
>> +	}
>> +};
>> +
>> +#endif /* __SOC_MEDIATEK_MT8192_MMSYS_H */
>> +
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>> b/drivers/soc/mediatek/mtk-mmsys.c
>> index 79e5515..c755617 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -12,6 +12,7 @@
>>  
>>  #include "mtk-mmsys.h"
>>  #include "mt8183-mmsys.h"
>> +#include "mt8192-mmsys.h"
>>  
>>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data =
>> {
>>  	.clk_driver = "clk-mt2701-mm",
>> @@ -45,6 +46,12 @@
>>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>>  };
>>  
>> +static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
>> {
>> +	.clk_driver = "clk-mt8192-mm",
>> +	.routes = mmsys_mt8192_routing_table,
>> +	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>> +};
>> +
>>  struct mtk_mmsys {
>>  	void __iomem *regs;
>>  	const struct mtk_mmsys_driver_data *data;
> 
> Hi Yongqiang,
> 
> There is 8192 mmsys compatible data in [1], but seems to lack of it in
> this patch, because mm clock driver will be bound to platform device 
> in mtk_mmsys_probe.
> 
> [1] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com/

Yes, you should add a match in of_match_mtk_mmsys[] for the compatbile. The
clock driver should be implemented as a platform device.

Regards,
Matthias
