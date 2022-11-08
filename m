Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581B7621AFF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4F10E4DD;
	Tue,  8 Nov 2022 17:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489710E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:46:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 5so9302787wmo.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LNEngN/aazKdBxzh9IZpCwhO22X6knnGGYpZ9jnmook=;
 b=JMJaQqwQR+FLQ11vQRgia/14Q4fvDH+72bAskivC0dtZYXk+Z+2t6uMWFghRttXMji
 dfY9liaPGrrQP/Yb6F2ggpUjnCAYeoiMVGCtTxd0/LJ8VOWDeDoQz6Du/fq2BuToRXp4
 yY228TTlnEjHoyN7ZuZunpLWkEr/tc/hZGG43WgvK1saPsswmAVmtGkWSlma2SsMOr8B
 OGyRnGBBGAii4Yr3K6fwr2azHDlPnBK2i/0xWGM+JoQb3UOWv8Fo6xWRCpJbtTK46bFv
 h44v6gJfGAFyNdIzt8BPUcYtwSmjDHjUYeYpdjQ0Vaid3ydyHeo6lrFpPWBJR8/wfRuY
 2mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNEngN/aazKdBxzh9IZpCwhO22X6knnGGYpZ9jnmook=;
 b=au2J9qf0fXLtEthOZuasMvPju+39R1X8II4HWfHKLPx05lMPhfNifMSmGV2Ak5uvFX
 xRYMLChmh6S610N/dg/t7ZGQ4hsCIsDAvKEOfAfgrujak2QSXGr5Jw3/ZD1nLv5AQnuc
 NcraPahR/qqhmsVVyHlrJK9ocPPZgf4ozyBayEar8qVUMWaEgK3BTY07Gw4kobKjrhGd
 rea0IlnIWWvQDapJVGVoGF/9z6sZgJmwuEClBxSCDTGZL8BR+W3EowOFI1gaIHOqBU0B
 2wmymtMx2qrpwGIGMGS5Ars32vEtwpikCdRpmBwFQsYgsij7gRWeIymu7yyUi/NwQ3nX
 hzHA==
X-Gm-Message-State: ACrzQf3kYNCtAy3KfJyxuoeYypP9gFHLrInvDFBAxxuuxcb1+chj5ois
 /mIgL8T+nf6Ki4yv1jijdMk=
X-Google-Smtp-Source: AMsMyM6C7qAD/7GhCBJPvR2IlWtN3jQBvZbmuXnO2obN6g0JgP4V3a9tvR5SBH41wBXLzLf/d6saaA==
X-Received: by 2002:a05:600c:1d8f:b0:3cf:54f4:ef4 with SMTP id
 p15-20020a05600c1d8f00b003cf54f40ef4mr44744108wms.190.1667929617615; 
 Tue, 08 Nov 2022 09:46:57 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d554b000000b0023655e51c14sm10943042wrw.32.2022.11.08.09.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 09:46:55 -0800 (PST)
Message-ID: <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
Date: Tue, 8 Nov 2022 18:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 04/11] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-5-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221107072243.15748-5-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/11/2022 08:22, Nancy.Lin wrote:
> Add mt8195 vdosys1 routing table to the driver data of mtk-mmsys.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h | 139 ++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c    |  10 ++
>   2 files changed, 149 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index abfe94a30248..fd7b455bd675 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -75,6 +75,70 @@
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
>   
> +#define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
> +#define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
> +
> +#define MT8195_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
> +#define MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1			1
> +
> +#define MT8195_VDO1_DISP_DPI1_SEL_IN				0xf10
> +#define MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT			0
> +
> +#define MT8195_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
> +#define MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT		0
> +
> +#define MT8195_VDO1_MERGE4_SOUT_SEL				0xf18
> +#define MT8195_MERGE4_SOUT_TO_DPI1_SEL					2
> +#define MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL				3
> +
> +#define MT8195_VDO1_MIXER_IN1_SEL_IN				0xf24
> +#define MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT			1
> +
> +#define MT8195_VDO1_MIXER_IN2_SEL_IN				0xf28
> +#define MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT			1
> +
> +#define MT8195_VDO1_MIXER_IN3_SEL_IN				0xf2c
> +#define MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT			1
> +
> +#define MT8195_VDO1_MIXER_IN4_SEL_IN				0xf30
> +#define MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT			1
> +
> +#define MT8195_VDO1_MIXER_OUT_SOUT_SEL				0xf34
> +#define MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL				1
> +
> +#define MT8195_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
> +#define MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2			1
> +
> +#define MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
> +#define MT8195_SOUT_TO_MIXER_IN1_SEL					1
> +
> +#define MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
> +#define MT8195_SOUT_TO_MIXER_IN2_SEL					1
> +
> +#define MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
> +#define MT8195_SOUT_TO_MIXER_IN3_SEL					1
> +
> +#define MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
> +#define MT8195_SOUT_TO_MIXER_IN4_SEL					1
> +
> +#define MT8195_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
> +#define MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT			1
> +
> +#define MT8195_VDO1_MIXER_IN1_SOUT_SEL				0xf58
> +#define MT8195_MIXER_IN1_SOUT_TO_DISP_MIXER				0
> +
> +#define MT8195_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
> +#define MT8195_MIXER_IN2_SOUT_TO_DISP_MIXER				0
> +
> +#define MT8195_VDO1_MIXER_IN3_SOUT_SEL				0xf60
> +#define MT8195_MIXER_IN3_SOUT_TO_DISP_MIXER				0
> +
> +#define MT8195_VDO1_MIXER_IN4_SOUT_SEL				0xf64
> +#define MT8195_MIXER_IN4_SOUT_TO_DISP_MIXER				0
> +
> +#define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
> +#define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
> +
>   static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>   	{
>   		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> @@ -367,4 +431,79 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>   	}
>   };
>   
> +static const struct mtk_mmsys_routes mmsys_mt8195_vdo1_routing_table[] = {
> +	{
> +		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
> +		MT8195_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> +	}, {
> +		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
> +		MT8195_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> +	}, {
> +		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
> +		MT8195_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
> +		MT8195_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> +	}, {
> +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN1_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN2_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN3_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_SOUT_TO_MIXER_IN4_SEL
> +	}, {
> +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
> +		MT8195_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
> +		MT8195_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
> +		MT8195_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> +	}, {
> +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
> +		MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> +	}, {
> +		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
> +		MT8195_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
> +		MT8195_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +		MT8195_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
> +		MT8195_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_MERGE4_SOUT_TO_DPI1_SEL
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
> +		MT8195_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> +	}, {
> +		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> +		MT8195_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
> +		MT8195_MERGE4_SOUT_TO_DP_INTF0_SEL
> +	}
> +};
>   #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 146a78ba06c1..9a327eb5d9d7 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -80,6 +80,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>   };
>   
> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> +	.clk_driver = "clk-mt8195-vdo1",
> +	.routes = mmsys_mt8195_vdo1_routing_table,
> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
> +};
> +
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8365-mm",
>   	.routes = mt8365_mmsys_routing_table,
> @@ -292,6 +298,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8195-vdosys0",
>   		.data = &mt8195_vdosys0_driver_data,

It seems we are missing a patch in the series. vdosys0 also correct was never 
introduced in the driver...

>   	},
> +	{
> +		.compatible = "mediatek,mt8195-vdosys1",
> +		.data = &mt8195_vdosys1_driver_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8365-mmsys",
>   		.data = &mt8365_mmsys_driver_data,
