Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF11250B643
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 13:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B7E10F539;
	Fri, 22 Apr 2022 11:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A0F10F513
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 11:37:23 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s21-20020a0568301e1500b006054da8e72dso5292882otr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vlZn9Fi0P9yMNdagcLbI/5cAQLpglB2hUiQX2NP/3po=;
 b=dbRnPQc/4YlwjQpR8ScZhURvIB0BVu4D6r1Ole3iIW+Rl7K6NwzUj1fMkbdM2At171
 4RQrKG/49dJa8fYe/iMpv6+zPUAv3dthIq3WDlvZfHfa5vipZ27OiXk8r1aNxGmJCNQG
 XoY/ev+ecGAraZVYpooCw/N6O4OKDnsc0FUcGOjD/qLn5SOLILOyITzwktYY/SURC8XR
 +OqTsK+3gJd6LbQhhEvjhnbccmr6Skl9EBHvEH8vhVpoZFi2J34MuWweg9cWADNr7mAa
 vkWGih+wpUHBm44Fu18yU7hyVjASC7wyv9aoKtaWEIlf1J5+K2D7OJ19djyEq2b98VEJ
 4EcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vlZn9Fi0P9yMNdagcLbI/5cAQLpglB2hUiQX2NP/3po=;
 b=AH/HHdC/0vyZwA+5NhJTW5nr86c0qMUdrUoRJ8MRy5G9++sx4hF0/159UUi4fhArly
 z00pqojl37dv5T70BP/hwBUJMENopFrv5D+n0WCeaSM1E1HH8YPTJE8Af7nkxRXE23Ig
 A7m/74SD5GXka7mRVIqtW4SJ8yWzQDlF93f3ATC2r0fGMMDxVo/y/9pi5Xc7vWAKRtUL
 +vtesJu4HERteCuLcdzoMic7Fi2MV2dllkix761qd73/EHnAgWui+FF48fW15AKNncvO
 uvODJptSPMEOR8aLLN5tlD9FJIB3OkQHCDBHBYeSWsChMObgeeP/5OnOZ0GcJaHor+e1
 8lDg==
X-Gm-Message-State: AOAM532cnwfOxcDV1CtFGnWsqMVmuovMSx0OrbPc0htn/8DdKk9b/mPr
 DY7Uw4pzeA09qIcZsBqfDl0=
X-Google-Smtp-Source: ABdhPJysVFALggRZYOphtxg3XKdkPQ43XCmhqa3I1LI785e3lXPB+h5jhVwcL6EFhDwJGqRhvXPcvw==
X-Received: by 2002:a9d:4796:0:b0:601:94e2:ce0b with SMTP id
 b22-20020a9d4796000000b0060194e2ce0bmr1504913otf.197.1650627443160; 
 Fri, 22 Apr 2022 04:37:23 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 6-20020aca0706000000b002f9d20b3134sm646148oih.7.2022.04.22.04.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:37:22 -0700 (PDT)
Message-ID: <6e06f2a0-ee9b-4cf4-85a3-243ed3121c50@gmail.com>
Date: Fri, 22 Apr 2022 13:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 07/21] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-8-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220416020749.29010-8-nancy.lin@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/04/2022 04:07, Nancy.Lin wrote:
> MT8195 vdosys1 has more than 32 reset bits and a different reset base
> than other chips. Modify mmsys for support 64 bit and different reset
> base.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h |  1 +
>   drivers/soc/mediatek/mtk-mmsys.c    | 39 ++++++++++++++++++-----------
>   drivers/soc/mediatek/mtk-mmsys.h    |  1 +
>   3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 5469073e3073..0a286fa5a824 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -139,6 +139,7 @@
>   #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
>   #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
>   
> +#define MT8195_VDO1_SW0_RST_B		0x1d0
>   #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
>   #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
>   #define MT8195_VDO1_HDR_TOP_CFG		0xd00
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ea04aa2c3840..d7c806f9e494 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,8 @@
>   #include "mt8195-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.clk_driver = "clk-mt2701-mm",
>   	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.routes = mmsys_default_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.routes = mmsys_mt8186_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> @@ -148,6 +153,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.clk_driver = "clk-mt8195-vdo1",
>   	.routes = mmsys_mt8195_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
> +	.num_resets = 64,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> @@ -234,18 +241,22 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> +	u32 offset;
>   	u32 reg;
>   
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
> +
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset + offset);
>   
>   	if (assert)
>   		reg &= ~BIT(id);
>   	else
>   		reg |= BIT(id);
>   
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset + offset);
>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   
> @@ -360,18 +371,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;
> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> -	mmsys->rcdev.of_node = pdev->dev.of_node;
> -	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> -		return ret;
> -	}
> -

I'm not sure why you move that code block. It's not explained in the commit message.

Regards,
Matthias
