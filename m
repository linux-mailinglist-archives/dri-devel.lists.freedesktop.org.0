Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E78E50B760
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4710F77C;
	Fri, 22 Apr 2022 12:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772C510F785
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:32:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q7so3219077wrm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Igv2KnIGg2AgW82nI5acxMrMKN3Yv76Tf9kwiX97Lkg=;
 b=KjDUmXEZeOk4pJ9jdJOFjD/kVmzCoCxQpM/XF6LXyPTMZZIc8G3trjB9XODZA6ge6W
 nHvlIeklMIiGA8cCv18WiHm4vhGEh09W50NNx0VU3398kx5YPsSOLD9+13ENknZ6pPPS
 +qrs+rpca/EKY0OGYl98wcfF58sXk8x+ZRZEKJyJ/xOLLS6udS7ABAOncy0QOCNAKBUj
 hxr7hAFhkhgcD6Oe3YwpV5pfJ9eqSfw0sCr4eEIvmqIMxJ2x4lGo9nP3tZfiqJXFPisv
 oy/iyMGKCqz4GjgN20Igj/CaHWPIN/0xDkSjKbJJkY08pKyBffYFgoSM68C8N/cBUkcN
 S2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Igv2KnIGg2AgW82nI5acxMrMKN3Yv76Tf9kwiX97Lkg=;
 b=XpKayjeD42gUkctzQjMGfXQOgZCYFciRSbP9w6NVN5tSvgib5Iw9crrW9fJgHVQbic
 nJz0/SJAnjG9Y62mcGTG6nYqAWIwPgSCFxCTPIrnqG7Fj4xEyCV6rgh6c1A0cmqsok+0
 lChW2WoNdr6Bjj1dbgxJCBfDn7AqyiyXDCZwtyxOEG8EOdC/tNjniSHSm2VCzyFLIhkM
 8ancncO5wWErVrBwqRAsycnqtK9Ky3v/i1EEE7FxgHwF+HwMDRBYuVbo7Dl+rLqygyuH
 QHjMicXQNgYo7bRZmSiNpcOkKheeJqODBV+/umfvsOvqi+UlU53Pfh6cdWNmHNNN9/Zt
 jEfA==
X-Gm-Message-State: AOAM532UPW/5dLwoWAqu33NFaXWFkzsPH3GLF8aKz2iam9vPEgmdsvRK
 eceEsBCCGM1zLFGbXRfwRUQ=
X-Google-Smtp-Source: ABdhPJyXYiCSIfptEuTk5p/s02YQL8cgiGK3AqO5EJEVf3NXa1FufEMQzCD8sNGT5Fr8B+2S8ZVsSg==
X-Received: by 2002:a5d:5607:0:b0:20a:c22b:2d87 with SMTP id
 l7-20020a5d5607000000b0020ac22b2d87mr3659891wrv.714.1650630738943; 
 Fri, 22 Apr 2022 05:32:18 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b00392889d04c4sm4871867wmq.23.2022.04.22.05.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:32:18 -0700 (PDT)
Message-ID: <bc7b6ebe-27fa-5832-d3f2-888f744d6ac2@gmail.com>
Date: Fri, 22 Apr 2022 14:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v20 6/8] soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for
 mt8195 vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-7-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419094143.9561-7-jason-jh.lin@mediatek.com>
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
> The mmsys routing table of mt8195 vdosys0 has 2 DITHER components,
> so mmsys need to add DDP_COMPONENT_DITHER1 and change all usages of
> DITHER enum form DDP_COMPONENT_DITHER to DDP_COMPONENT_DITHER0.
> 
> But its header need to keep DDP_COMPONENT_DITHER enum
> until drm/mediatek also changed it.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mt8167-mmsys.h    |  2 +-
>   drivers/soc/mediatek/mt8183-mmsys.h    |  2 +-
>   drivers/soc/mediatek/mt8186-mmsys.h    |  4 ++--
>   drivers/soc/mediatek/mt8192-mmsys.h    |  4 ++--
>   drivers/soc/mediatek/mt8195-mmsys.h    |  8 ++++----
>   drivers/soc/mediatek/mt8365-mmsys.h    |  4 ++--
>   drivers/soc/mediatek/mtk-mutex.c       | 10 +++++-----
>   include/linux/soc/mediatek/mtk-mmsys.h |  1 +
>   8 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
> index 2772ef5e3934..f7a35b3656bb 100644
> --- a/drivers/soc/mediatek/mt8167-mmsys.h
> +++ b/drivers/soc/mediatek/mt8167-mmsys.h
> @@ -18,7 +18,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
>   		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
>   		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_RDMA0,
>   		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0
>   	}, {
>   		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> index 0c021f4b76d2..ff6be1703469 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -41,7 +41,7 @@ static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
>   		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1,
>   		MT8183_OVL1_2L_MOUT_EN_RDMA1
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0,
>   		MT8183_DITHER0_MOUT_IN_DSI0
>   	}, {
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index c72ccf86ea28..eb1ad9c37a9c 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -76,12 +76,12 @@ static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
>   		MT8186_RDMA0_SOUT_TO_COLOR0
>   	},
>   	{
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
>   		MT8186_DITHER0_MOUT_TO_DSI0,
>   	},
>   	{
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
>   		MT8186_DSI0_FROM_DITHER0
>   	},
> diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
> index 6aae0b12b6ff..a016d80b4bc1 100644
> --- a/drivers/soc/mediatek/mt8192-mmsys.h
> +++ b/drivers/soc/mediatek/mt8192-mmsys.h
> @@ -40,7 +40,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
>   		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
>   		MT8192_OVL2_2L_MOUT_EN_RDMA4
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
>   		MT8192_DITHER0_MOUT_IN_DSI0
>   	}, {
> @@ -52,7 +52,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
>   		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
>   		MT8192_AAL0_SEL_IN_CCORR0
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
>   		MT8192_DSI0_SEL_IN_DITHER0
>   	}, {
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 13ab0ab64396..abfe94a30248 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -113,7 +113,7 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>   		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
>   		MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
>   		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
>   		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
>   	}, {
> @@ -181,7 +181,7 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>   		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
>   		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
>   		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
>   	}, {
> @@ -245,11 +245,11 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
>   		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA0_FROM_MASK,
>   		MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSC0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
>   		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
>   		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
>   	}, {
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
>   		MT8195_SOUT_DISP_DITHER0_TO_DSI0
>   	}, {
> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
> index 690e3fe2dee0..24129a6c25f8 100644
> --- a/drivers/soc/mediatek/mt8365-mmsys.h
> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
> @@ -41,12 +41,12 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
>   		MT8365_DISP_COLOR_SEL_IN_COLOR0,MT8365_DISP_COLOR_SEL_IN_COLOR0
>   	},
>   	{
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
>   		MT8365_DITHER_MOUT_EN_DSI0, MT8365_DITHER_MOUT_EN_DSI0
>   	},
>   	{
> -		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
>   		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
>   		MT8365_DSI0_SEL_IN_DITHER, MT8365_DSI0_SEL_IN_DITHER
>   	},
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 729ee88035ed..9184684baf1d 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -232,7 +232,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
>   	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
>   	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
> -	[DDP_COMPONENT_DITHER] = MT8167_MUTEX_MOD_DISP_DITHER,
> +	[DDP_COMPONENT_DITHER0] = MT8167_MUTEX_MOD_DISP_DITHER,
>   	[DDP_COMPONENT_GAMMA] = MT8167_MUTEX_MOD_DISP_GAMMA,
>   	[DDP_COMPONENT_OVL0] = MT8167_MUTEX_MOD_DISP_OVL0,
>   	[DDP_COMPONENT_OVL1] = MT8167_MUTEX_MOD_DISP_OVL1,
> @@ -265,7 +265,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
>   	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
> -	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_DITHER0] = MT8183_MUTEX_MOD_DISP_DITHER0,
>   	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
>   	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
>   	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
> @@ -279,7 +279,7 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
>   	[DDP_COMPONENT_COLOR0] = MT8186_MUTEX_MOD_DISP_COLOR0,
> -	[DDP_COMPONENT_DITHER] = MT8186_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_DITHER0] = MT8186_MUTEX_MOD_DISP_DITHER0,
>   	[DDP_COMPONENT_GAMMA] = MT8186_MUTEX_MOD_DISP_GAMMA0,
>   	[DDP_COMPONENT_OVL0] = MT8186_MUTEX_MOD_DISP_OVL0,
>   	[DDP_COMPONENT_OVL_2L0] = MT8186_MUTEX_MOD_DISP_OVL0_2L,
> @@ -292,7 +292,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
>   	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
> -	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_DITHER0] = MT8192_MUTEX_MOD_DISP_DITHER0,
>   	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
>   	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
>   	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
> @@ -310,7 +310,7 @@ static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>   	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
>   	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
>   	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
> -	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
> +	[DDP_COMPONENT_DITHER0] = MT8195_MUTEX_MOD_DISP_DITHER0,
>   	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
>   	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
>   	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index cff5c9adbf46..59117d970daf 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -17,6 +17,7 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_COLOR0,
>   	DDP_COMPONENT_COLOR1,
>   	DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
>   	DDP_COMPONENT_DITHER1,
>   	DDP_COMPONENT_DP_INTF0,
>   	DDP_COMPONENT_DP_INTF1,
