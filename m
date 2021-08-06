Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A73E2990
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 13:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EDA6E8DC;
	Fri,  6 Aug 2021 11:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767B6E92B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 11:28:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n12so589829wrr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 04:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d8FSL7ZCHhgZJIiY+idJw40OTs70Iw57nrfJP9BGnbE=;
 b=cAxKsiIaDgfRnuK/zxPsdagpkDcHcEQp5x82mqYiacbzYQa3b0Zu6LFIilYHKIVPdR
 rKu1lxz4DWx6nkMHVgdDVchdZWQjp8L7BPpKS9SQzBLXkzMDcl6alTwARujqfvTWttKd
 xIZy2d53EtPkoJN6x6qi9/OwutqKvxidTFBfqPL7gwuuazxQY1xF7um9sBOSD+M7dnW6
 iC+UO/Rgt0wnvV5NQXSkEqkDATOupE9PWXVpeOPFdrwTkhIWV8t6rQ3jwYjDB7XBrb4X
 RMO6egnUCa+vQyRJ6ivPZ/yIsG5Gn3DHedzcV+EZc1wLwFOktehl6pqlIH/L74KJNDMi
 OQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d8FSL7ZCHhgZJIiY+idJw40OTs70Iw57nrfJP9BGnbE=;
 b=n+fd7SP4PzMCaWRUkIZzm11KAmEj28AJzqJIWig3duoFS7IuU0xVY8XXyIgfXm4KI9
 tqxPb+irlPfzW9MVkkspzE54OKkRskRvAv/euo5trJbOnntKEHJsPLrObMpPLfqsOhGy
 oZ+nIgu+jbPLieRI8gF7h5rtG+AgQzYxEzTMq3wzdbcWPid7C1el6k7zmuivijvZt+CV
 BK9owFcDFumB/jxiWbhKgyWxNzo+id807O0cavkumpb7LqMbvNA12V0BAuL+KGZVRwed
 +YkacjQcneTuS6uVxWwCADTsg/FrzA4ktR97XAlM2dxukV/ufIQBOOmVnMr8T6K6DtyJ
 yJvQ==
X-Gm-Message-State: AOAM530x6wfRIfm2QGFbZVeHHCaF06VKm7bN5mujvjqIMuz/aeVxWkuu
 SVI3CXbMGfo2xDZqYhYm7PRAbUqfO93fcA==
X-Google-Smtp-Source: ABdhPJwVaisygyPEmh8rvqau5LUUoWi2AYDqvKoquWsOcIg0kkdBtKCdCMtJJY8NSXuStdH+ruD4dA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr9920048wrp.175.1628249302788; 
 Fri, 06 Aug 2021 04:28:22 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id j1sm11411934wmo.4.2021.08.06.04.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 04:28:22 -0700 (PDT)
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, hsinyi@chromium.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 2/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Message-ID: <28cc4599-6eda-4784-3d8f-4570c9ab60e8@gmail.com>
Date: Fri, 6 Aug 2021 13:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805205226.24880-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Jason,

On 05/08/2021 22:52, jason-jh.lin wrote:
> Add mt8195 vdosys0 clock driver name and routing table to
> the driver data of mtk-mmsys.
> 

I'd like to see the implementation of vdosys1 as well, to better understand why
we need two compatibles.

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
> 
> [1] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210805171346.24249-2-jason-jh.lin@mediatek.com/

Please add the binding description to this series.

> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    | 96 ++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 11 +++
>  include/linux/soc/mediatek/mtk-mmsys.h |  9 +++
>  3 files changed, 116 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> new file mode 100644
> index 000000000000..9339a786ec5d
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -0,0 +1,96 @@
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
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)
> +#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5)
> +#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
> +#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)
> +#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)
> +#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)
> +#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			(0 << 16)
> +#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			(1 << 16)
> +#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			(0 << 17)
> +#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 << 17)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
> +#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0 << 21)
> +#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		(1 << 21)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
> +#define MT8195_SEL_IN_DISP_WDMA0_FROM_VPP_MERGE			(1 << 22)
> +
> +#define MT8195_VDO0_SEL_OUT					0xf38
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 << 0)
> +#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 << 0)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			(1 << 1)
> +#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 << 1)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			(0 << 4)
> +#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			(1 << 4)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSI1				(0 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			(2 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(3 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			(4 << 8)
> +#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			(0 << 11)
> +#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA0			(1 << 11)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 << 12)
> +#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			(2 << 12)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			(1 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
> +#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
> +
> +static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0

Please update the struct to the new version that includes a mask field.

Regards,
Matthias
