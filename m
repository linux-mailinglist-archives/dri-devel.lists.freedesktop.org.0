Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E999856BCFD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 17:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D6210E72C;
	Fri,  8 Jul 2022 15:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87310E72C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 15:42:34 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id n9so8910954ilq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1qbexzS6sol5qJ39FyR4R0bbeTrcJijBH7KTqUd0Ou8=;
 b=SwjJ9VYJLFyQCQJDmktrB+p9IemrszRWS/6xHtGftz6bTaFQ60Ai5c/vhHvJ/HoYpj
 x3DMyzXOy9AC+leTEXpHVf/JhsvZXoT0LCbRNrd7Unk/gWj/gNmcCQoqZHGasCcEN8SH
 Bn7psIeduhzabFb9TecVtcYFsBKumv3iG00LabLyDU1dmJWUXDU3xkF7ChFDMuyHTSip
 hrkRrBmh2iqJDFN7RIEQqEPY9ZJIhE2qKqWrJaTjIQX9JLTTq2iW6gRKgmD6pC9V4yif
 02nApBb+hbZLzP+h2lomwhGm9NWEki3RDudjL8QcW1RysgIlKk0mL1TT2IgnNpXChR+D
 dgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1qbexzS6sol5qJ39FyR4R0bbeTrcJijBH7KTqUd0Ou8=;
 b=7SS5CvCu4wvwkYmrDSzsAMIv5MVEFaH7ggovk9yKQaspLQZaXBo49VGmREp/SzRCq4
 l2EowuwBIL9HYcVK0GKQyTcCJKFBVrQJepXH84f8vH0O2Y29hm9oZh8phHPb168+yQHl
 pDKiLHtAowY/Fdlbz5kVXqKR/baJcNsDjYy3IT5sTUO0aV9MHoEFy/SQ/F0zW0g0rdKd
 JhvuVa+RZ9NE4sCAmK2nOaN6l27S8I+AW/fbZchyagUJxma/i061pPFMD+ghfPJnYsa3
 gMKZNVL0irDbU0v2Y47sDNCONhUy71trNLF1TP/TEfPK0Lpraz+8wWiKV/YTadLYWh/C
 uKAA==
X-Gm-Message-State: AJIora+96WshmfNrJmZP5cXZP65dg9KKpSpT0pSBd/Eo9yeuoOP56Qsf
 CBH5byjKGo29frM4MO3X0Fw=
X-Google-Smtp-Source: AGRyM1vz8B/CoTAGqci2yIFVCBapyRIex1680cllaQQhyX5o64k7/OZUGHA80vWS9TD2sV6E27bDfA==
X-Received: by 2002:a05:6e02:174a:b0:2da:c72f:e3a6 with SMTP id
 y10-20020a056e02174a00b002dac72fe3a6mr2446019ill.309.1657294954008; 
 Fri, 08 Jul 2022 08:42:34 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a92c709000000b002dc133c9468sm5698548ilp.6.2022.07.08.08.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 08:42:32 -0700 (PDT)
Message-ID: <5841cdea-2587-5bd8-3e6c-19e49121677a@gmail.com>
Date: Fri, 8 Jul 2022 17:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v24 07/10] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
 <20220622130824.29143-8-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220622130824.29143-8-nancy.lin@mediatek.com>
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



On 22/06/2022 15:08, Nancy.Lin wrote:
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys->data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++++++++------------
>   drivers/soc/mediatek/mtk-mmsys.h |  1 +
>   2 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 16be77d5acac..47b72ae72cc2 100644
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
> @@ -288,10 +293,14 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> +	u32 offset;
> +
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
> +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset + offset, BIT(id),
>   			      assert ? 0 : BIT(id), NULL);

reg = mmsys->data->sw0_rst_offset + offset;
mtk_mmsys_update_bits(mmsys, reg, BIT(id),
                       assert ? 0 : BIT(id), NULL);

Other then that, patch looks good.
By the way setting val depending on assert in the function call gets (for me) 
hard to read, as I said earlier.

Regards,
Matthias

>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
> @@ -349,18 +358,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
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
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
>   		dev_err(dev, "Couldn't get mmsys resource\n");
> @@ -382,6 +379,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		mmsys->data = match_data->drv_data[0];
>   	}
>   
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> +	mmsys->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> +		return ret;
> +	}
> +
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
>   	if (ret)
> diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
> index f01ba206481d..20a271b80b3b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.h
> +++ b/drivers/soc/mediatek/mtk-mmsys.h
> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>   	const struct mtk_mmsys_routes *routes;
>   	const unsigned int num_routes;
>   	const u16 sw0_rst_offset;
> +	const u32 num_resets;
>   };
>   
>   struct mtk_mmsys_match_data {
