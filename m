Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DF4C6A2A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFFC10E450;
	Mon, 28 Feb 2022 11:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECC410E450
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 11:20:25 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n13-20020a05600c3b8d00b0037bff8a24ebso5523737wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NccQv4LgTdxbFFV06no50kiwLRDXEmMnkBFh0QCPhBk=;
 b=eJNhF7g9oc4xDjbR6Yf3EM+nErRCpUStHnVBRBwnjtvZ6xgdHPysfTRYYU+MZD1XRT
 nsKGXw2ByxKqC44mQl5r7boAD7j9hMUi0i44uoVPSGjDa7NdafIS0Ej1rwA3/NBVVgV2
 chA7ZPL/rGOzc7PJTjZ/SQrN2403vVHE2Hm3/qsajUIUW/yV3JcJSzXGrZhs458aC6ZK
 E0idJ9CC3XKoWjf/43G8zyBrHNP12gbW+lbR/1l/ltFSR7x/do84aiQpqKBF7pf3/jax
 5vSCBFWZveOn71YqVlKdN+Er/EsbW1A7oLhJrjo/FW7n5aXUlwrjR2nrOyhvv1G0gcIg
 w2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NccQv4LgTdxbFFV06no50kiwLRDXEmMnkBFh0QCPhBk=;
 b=khG+gkhmKUsO8g0kxWi2FMHYnEJ8LPxKb9T2BYeEgUvODRWoni3QoPiwwxjC6Oc2U6
 XVVox5mZT5u3AQYfEFUfaNwCxpLF3Xb5lYIX5NrVcDcRfTzEbd5TxdAFd8vbT3BtL82E
 dqvCK/LSwy19xK0wu0K6/pUkjeKjgHcqdJz2/jKddk1wTBMUTGjsWd9BOWpMpCMALfFU
 Jsap4FtgN5RTkjusk8/Hi1DySNllUysuXt2PStKyX3Vh51IR05NOEhMi5YAJFP4ynL0r
 Y8hJIP9dbjgJigP1V0q/3UCggmpQic5b6HxI+bOqUiYugcTYcJ5JIJ/xoO76EroGT5IC
 TO0g==
X-Gm-Message-State: AOAM532tDY56EDO5UqTXqHh8apIZVZo/sLmoqeWZz+Lz3yhzOJFB7bLK
 fiuTArK3NZ6PhJV79TQ4j8XYIKRLOlDCkA==
X-Google-Smtp-Source: ABdhPJxmBl1EpcRObVtB/hkFZeK7EFaScaFTcOoQofuXzqGQWUTkeSfN2I7XpWEitYnsdxfY9kTeVQ==
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr12762339wmj.98.1646047223541; 
 Mon, 28 Feb 2022 03:20:23 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b00380e45cd564sm12245755wmq.8.2022.02.28.03.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:20:23 -0800 (PST)
Message-ID: <ad5e8d2c-4347-00a7-9e34-18601c6e1e11@gmail.com>
Date: Mon, 28 Feb 2022 12:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4,3/5] soc: mediatek: mmsys: add mt8186 mmsys routing
 table
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org
References: <20220222052803.3570-1-rex-bc.chen@mediatek.com>
 <20220222052803.3570-4-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220222052803.3570-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/02/2022 06:28, Rex-BC Chen wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add new routing table for MT8186.
> In MT8186, there are two routing pipelines for internal and external
> display.
> 
> Internal display: OVL0->RDMA0->COLOR0->CCORR0->AAL0->GAMMA->POSTMASK0->
> 		  DITHER->DSI0
> External display: OVL_2L0->RDMA1->DPI0
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

applied, thanks!

> ---
>   drivers/soc/mediatek/mt8186-mmsys.h | 113 ++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c    |  11 +++
>   2 files changed, 124 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> new file mode 100644
> index 000000000000..7de329f2d729
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
> +#define __SOC_MEDIATEK_MT8186_MMSYS_H
> +
> +#define MT8186_MMSYS_OVL_CON			0xF04
> +#define MT8186_MMSYS_OVL0_CON_MASK			0x3
> +#define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> +#define MT8186_OVL0_GO_BLEND				BIT(0)
> +#define MT8186_OVL0_GO_BG				BIT(1)
> +#define MT8186_OVL0_2L_GO_BLEND				BIT(2)
> +#define MT8186_OVL0_2L_GO_BG				BIT(3)
> +#define MT8186_DISP_RDMA0_SOUT_SEL		0xF0C
> +#define MT8186_RDMA0_SOUT_SEL_MASK			0xF
> +#define MT8186_RDMA0_SOUT_TO_DSI0			(0)
> +#define MT8186_RDMA0_SOUT_TO_COLOR0			(1)
> +#define MT8186_RDMA0_SOUT_TO_DPI0			(2)
> +#define MT8186_DISP_OVL0_2L_MOUT_EN		0xF14
> +#define MT8186_OVL0_2L_MOUT_EN_MASK			0xF
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA0			BIT(0)
> +#define MT8186_OVL0_2L_MOUT_TO_RDMA1			BIT(3)
> +#define MT8186_DISP_OVL0_MOUT_EN		0xF18
> +#define MT8186_OVL0_MOUT_EN_MASK			0xF
> +#define MT8186_OVL0_MOUT_TO_RDMA0			BIT(0)
> +#define MT8186_OVL0_MOUT_TO_RDMA1			BIT(3)
> +#define MT8186_DISP_DITHER0_MOUT_EN		0xF20
> +#define MT8186_DITHER0_MOUT_EN_MASK			0xF
> +#define MT8186_DITHER0_MOUT_TO_DSI0			BIT(0)
> +#define MT8186_DITHER0_MOUT_TO_RDMA1			BIT(2)
> +#define MT8186_DITHER0_MOUT_TO_DPI0			BIT(3)
> +#define MT8186_DISP_RDMA0_SEL_IN		0xF28
> +#define MT8186_RDMA0_SEL_IN_MASK			0xF
> +#define MT8186_RDMA0_FROM_OVL0				0
> +#define MT8186_RDMA0_FROM_OVL0_2L			2
> +#define MT8186_DISP_DSI0_SEL_IN			0xF30
> +#define MT8186_DSI0_SEL_IN_MASK				0xF
> +#define MT8186_DSI0_FROM_RDMA0				0
> +#define MT8186_DSI0_FROM_DITHER0			1
> +#define MT8186_DSI0_FROM_RDMA1				2
> +#define MT8186_DISP_RDMA1_MOUT_EN		0xF3C
> +#define MT8186_RDMA1_MOUT_EN_MASK			0xF
> +#define MT8186_RDMA1_MOUT_TO_DPI0_SEL			BIT(0)
> +#define MT8186_RDMA1_MOUT_TO_DSI0_SEL			BIT(2)
> +#define MT8186_DISP_RDMA1_SEL_IN		0xF40
> +#define MT8186_RDMA1_SEL_IN_MASK			0xF
> +#define MT8186_RDMA1_FROM_OVL0				0
> +#define MT8186_RDMA1_FROM_OVL0_2L			2
> +#define MT8186_RDMA1_FROM_DITHER0			3
> +#define MT8186_DISP_DPI0_SEL_IN			0xF44
> +#define MT8186_DPI0_SEL_IN_MASK				0xF
> +#define MT8186_DPI0_FROM_RDMA1				0
> +#define MT8186_DPI0_FROM_DITHER0			1
> +#define MT8186_DPI0_FROM_RDMA0				2
> +
> +static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_DISP_OVL0_MOUT_EN, MT8186_OVL0_MOUT_EN_MASK,
> +		MT8186_OVL0_MOUT_TO_RDMA0
> +	},
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_DISP_RDMA0_SEL_IN, MT8186_RDMA0_SEL_IN_MASK,
> +		MT8186_RDMA0_FROM_OVL0
> +	},
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_CON_MASK,
> +		MT8186_OVL0_GO_BLEND
> +	},
> +	{
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8186_DISP_RDMA0_SOUT_SEL, MT8186_RDMA0_SOUT_SEL_MASK,
> +		MT8186_RDMA0_SOUT_TO_COLOR0
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
> +		MT8186_DITHER0_MOUT_TO_DSI0,
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
> +		MT8186_DSI0_FROM_DITHER0
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_DISP_OVL0_2L_MOUT_EN, MT8186_OVL0_2L_MOUT_EN_MASK,
> +		MT8186_OVL0_2L_MOUT_TO_RDMA1
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_DISP_RDMA1_SEL_IN, MT8186_RDMA1_SEL_IN_MASK,
> +		MT8186_RDMA1_FROM_OVL0_2L
> +	},
> +	{
> +		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
> +		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_2L_CON_MASK,
> +		MT8186_OVL0_2L_GO_BLEND
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8186_DISP_RDMA1_MOUT_EN, MT8186_RDMA1_MOUT_EN_MASK,
> +		MT8186_RDMA1_MOUT_TO_DPI0_SEL
> +	},
> +	{
> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
> +		MT8186_DISP_DPI0_SEL_IN, MT8186_DPI0_SEL_IN_MASK,
> +		MT8186_DPI0_FROM_RDMA1
> +	},
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8186_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 1e448f1ffefb..0da25069ffb3 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -15,6 +15,7 @@
>   #include "mtk-mmsys.h"
>   #include "mt8167-mmsys.h"
>   #include "mt8183-mmsys.h"
> +#include "mt8186-mmsys.h"
>   #include "mt8192-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
> @@ -56,6 +57,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
> +	.clk_driver = "clk-mt8186-mm",
> +	.routes = mmsys_mt8186_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8192-mm",
>   	.routes = mmsys_mt8192_routing_table,
> @@ -242,6 +249,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8183-mmsys",
>   		.data = &mt8183_mmsys_driver_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8186-mmsys",
> +		.data = &mt8186_mmsys_driver_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8192-mmsys",
>   		.data = &mt8192_mmsys_driver_data,
