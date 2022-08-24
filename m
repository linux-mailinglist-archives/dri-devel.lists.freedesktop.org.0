Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF659F8BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 13:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7E510E160;
	Wed, 24 Aug 2022 11:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A2A10E160
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 11:41:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so681590wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 04:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=iRd1JuCUsRDstQ4XnepFMXgh3KSENhu5rGylzjVtscw=;
 b=fbFyIyGRBd1TbKvcIv6v1FsjGJ2wjibvgSzJG6K1k1Bm7S38z4wCVF4hZxlmWHl5/b
 fU/dKju0dIcg91N4KMyF0EKx0F2NwNa3szfNglU0u28Alnoke1Csdl2xCimMmVsumlak
 WII3ZniIifAbpLASSbzkFUrjFr042tmOyDqAEu5hydqVPoGHPR4vE5PCfaQPelEWHDnr
 2bEsZKu1PD++Gn7PXqlY/Z72rV9Wns/0QG/m1icgDWM0P4NjmG0CAXEumS3vSZ01oP89
 j6QoKrjWZR0E7AySBWUPZcQCctR9sUJ46+r1YYTnAJXovSwJOk5+W7RHfQP9q3kkSeug
 ZSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iRd1JuCUsRDstQ4XnepFMXgh3KSENhu5rGylzjVtscw=;
 b=jgbYizETKO6NeZL3OkOXbQ8CqWH2+r9d9u09ZbJ9a1gKBSVVvBQHe+ClEJ2K71pa2g
 h9oExqHrRVA9ZjNPBztqRrechT1vUKQjIdAzG8TjqRusDLTN3JW+JQksqV0dg2mp2jW1
 9oCo3z3W8bbaLjOgVnhcvq4MAZlz/FaslTfcXFGMV0dgjNDjBJwaTANJuMdX4p0YNf+F
 K3Ju3sezM176NcMspEUnfx+ifLP0Wr+MUyaBeDjxiNoQ8zXmDiqalcTJ9gFsVbcvqDHr
 /7LgXp2yn1uuPmciutB4MEEDpf7YZ8PLPwJN/mVE1CG1UACOzOcTBwtzO6WlmdM0oZWw
 jXEA==
X-Gm-Message-State: ACgBeo2/L6ChzyAwrEE8j7Xcx0SeKB0Nrecn8v5HQXa40kaEGBjn3xjG
 EFXq629fCvfHRIpJpZUdHfY=
X-Google-Smtp-Source: AA6agR5Hk4GDz/jmGGQn2rMBOj9Jqo+Vp8cc07NMZwHew1fytMh4PkKeUfXK6xMdYlVuT6cqYhYf1A==
X-Received: by 2002:a05:600c:3509:b0:3a6:1888:a4bd with SMTP id
 h9-20020a05600c350900b003a61888a4bdmr5083036wmq.191.1661341275790; 
 Wed, 24 Aug 2022 04:41:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfce12000000b002253f18d87fsm13444017wrn.96.2022.08.24.04.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 04:41:14 -0700 (PDT)
Message-ID: <db271721-163f-e5ec-25d8-e90357104b6c@gmail.com>
Date: Wed, 24 Aug 2022 13:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v26 07/10] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
References: <20220819061011.7672-1-nancy.lin@mediatek.com>
 <20220819061011.7672-8-nancy.lin@mediatek.com>
 <44c86ad9-8158-0a8a-ce31-a995c8d10e0b@gmail.com>
 <140b3cd10317a5db781df180ce4efb697cdd641b.camel@mediatek.com>
 <c7c4e73f-dd03-4c88-f434-2aa3bd681e39@gmail.com>
 <7c59d86501c39fa6e0e182f4a537de814320426e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7c59d86501c39fa6e0e182f4a537de814320426e.camel@mediatek.com>
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



On 24/08/2022 04:44, Nancy.Lin wrote:
> Hi Matthias,
> 
> Thanks for your comment.
> 
> On Tue, 2022-08-23 at 14:08 +0200, Matthias Brugger wrote:
>>
>> On 23/08/2022 13:30, Nancy.Lin wrote:
>>> Hi Matthias,
>>>
>>> Thanks for the review.
>>>
>>> On Tue, 2022-08-23 at 12:20 +0200, Matthias Brugger wrote:
>>>>
>>>> On 19/08/2022 08:10, Nancy.Lin wrote:
>>>>> Add mmsys for support 64 reset bits. It is a preparation for
>>>>> MT8195
>>>>> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
>>>>>
>>>>> 1. Add the number of reset bits in mmsys private data
>>>>> 2. move the whole "reset register code section" behind the
>>>>> "get mmsys->data" code section for getting the num_resets in
>>>>> mmsys-
>>>>>> data.
>>>>>
>>>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>>> angelogioacchino.delregno@collabora.com>
>>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>>>> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>>>> ---
>>>>>     drivers/soc/mediatek/mtk-mmsys.c | 40 +++++++++++++++++++++-
>>>>> ---
>>>>> -------
>>>>>     drivers/soc/mediatek/mtk-mmsys.h |  1 +
>>>>>     2 files changed, 27 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>>>> index 999be064103b..20ae751ad8a7 100644
>>>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>>> @@ -20,6 +20,8 @@
>>>>>     #include "mt8195-mmsys.h"
>>>>>     #include "mt8365-mmsys.h"
>>>>>     
>>>>> +#define MMSYS_SW_RESET_PER_REG 32
>>>>> +
>>>>>     static const struct mtk_mmsys_driver_data
>>>>> mt2701_mmsys_driver_data = {
>>>>>     	.clk_driver = "clk-mt2701-mm",
>>>>>     	.routes = mmsys_default_routing_table,
>>>>> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8173_mmsys_driver_data = {
>>>>>     	.routes = mmsys_default_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>>>>>     	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8173_mmsys_match_data
>>>>> = {
>>>>> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8183_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8183_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>>>>>     	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8183_mmsys_match_data
>>>>> = {
>>>>> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8186_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8186_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>>>>>     	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8186_mmsys_match_data
>>>>> = {
>>>>> @@ -128,6 +133,7 @@ static const struct mtk_mmsys_driver_data
>>>>> mt8192_mmsys_driver_data = {
>>>>>     	.routes = mmsys_mt8192_routing_table,
>>>>>     	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
>>>>>     	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
>>>>> +	.num_resets = 32,
>>>>
>>>> You didn't reply to Nicolas regarding the reset numbers. I
>>>> actually
>>>> agree with
>>>> him that we will need the num_resets declared for all devices.
>>>> Why do
>>>> you think
>>>> this is not the case?
>>>>
>>>> Regards,
>>>> Matthias
>>>>
>>>
>>> Sorry, I lost Nicolas's email.
>>>
>>> I checked with the mmsys git log with reset controller function.
>>>
>>> 1. Enric add mmsys reset controller function in [1]/[2].
>>>      => in mtk_mmsys_reset_update(), all mmsys reset offset is
>>> MMSYS_SW0_RST_B (0x140).
>>>
>>> 2. After Enric's patch, Rex add sw0_rst_offset in mmsys driver data
>>> in
>>> [3].
>>>
>>> So, I think sw0_rst_offset is not zero. Instead of only add
>>> num_resets
>>> but also need to add sw0_rst_offset for all mmsys. What do you
>>> think ?
>>>
>>
>> Good point. It seems we have a bug in the driver. Either all SoCs
>> have the
>> reset, but it's broken since
>> 62dc30150c06 ("soc: mediatek: mmsys: add sw0_rst_offset in mmsys
>> driver data")
>> or we are adding a reset controller independently if the silicon has
>> one, which
>> would be an error in:
>> f27ef2856343 ("soc: mediatek: mmsys: Add reset controller support")
>>
>> We have to find that out.
>>
>> Regards,
>> Matthias
> 
> 
> In [2], I think the first revision of Enric's reset controller is added
> for 8173 and 8183, not for all mmsys device.
>      =>[v3,4/7] arm64: dts: mt8173: Add the mmsys reset bit to reset the
> dsi0
>      =>[v3,5/7] arm64: dts: mt8183: Add the mmsys reset bit to reset the
> dsi0
> 
> In [3], Rex only add sw0_rst_offset in 8173 and 8183 mmsys driver data.
>>
> 
> For other SoCs, like mt2701,mt2712..., these SoCs even don't define
> mmsys hw reset bit[4]. So I think only set the num_resets to 32 or 64
> to those mmsys devices who really need the reset control, others set to
> 0(same as my v26 patch).
> 

Thanks for looking into this, please see my comment further below.


> 
> [4]mt2701-resets.h
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/reset/mt2701-resets.h?id=62dc30150c06774a8122c52aedd0eddaceaf5940
> 
> Regards,
> Nancy
> 
> 
>>> [1]
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=f27ef2856343e2ddc392975d7b15120442e4d7b7__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_fKynszs$
>>>   
>>> [2]
>>>
>>>
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/cover/20210825102632.601614-1-enric.balletbo@collabora.com/__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_cH-3nM8$
>>>   
>>> [3]
>>>
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=62dc30150c06774a8122c52aedd0eddaceaf5940__;!!CTRNKA9wMg0ARbw!3cWAYlD1mrWRmNZy0zoJs8MNiD3s7K9PteJI9cGEvu_qp3VShfqxsBTb_VXEsbNa$
>>>   
>>>
>>> Regards,
>>> Nancy
>>>>
>>>>>     };
>>>>>     
>>>>>     static const struct mtk_mmsys_match_data
>>>>> mt8192_mmsys_match_data
>>>>> = {
>>>>> @@ -288,13 +294,19 @@ static int mtk_mmsys_reset_update(struct
>>>>> reset_controller_dev *rcdev, unsigned l
>>>>>     {
>>>>>     	struct mtk_mmsys *mmsys = container_of(rcdev, struct
>>>>> mtk_mmsys,
>>>>> rcdev);
>>>>>     	unsigned long flags;
>>>>> +	u32 offset;
>>>>> +	u32 reg;
>>>>> +
>>>>> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
>>>>> +	id = id % MMSYS_SW_RESET_PER_REG;
>>>>> +	reg = mmsys->data->sw0_rst_offset + offset;
>>>>>     
>>>>>     	spin_lock_irqsave(&mmsys->lock, flags);
>>>>>     
>>>>>     	if (assert)
>>>>> -		mtk_mmsys_update_bits(mmsys, mmsys->data-
>>>>>> sw0_rst_offset, BIT(id), 0, NULL);
>>>>>
>>>>> +		mtk_mmsys_update_bits(mmsys, reg, BIT(id), 0,
>>>>> NULL);
>>>>>     	else
>>>>> -		mtk_mmsys_update_bits(mmsys, mmsys->data-
>>>>>> sw0_rst_offset, BIT(id), BIT(id), NULL);
>>>>>
>>>>> +		mtk_mmsys_update_bits(mmsys, reg, BIT(id),
>>>>> BIT(id),
>>>>> NULL);
>>>>>     
>>>>>     	spin_unlock_irqrestore(&mmsys->lock, flags);
>>>>>     
>>>>> @@ -351,18 +363,6 @@ static int mtk_mmsys_probe(struct
>>>>> platform_device *pdev)
>>>>>     		return ret;
>>>>>     	}
>>>>>     
>>>>> -	spin_lock_init(&mmsys->lock);
>>>>> -
>>>>> -	mmsys->rcdev.owner = THIS_MODULE;
>>>>> -	mmsys->rcdev.nr_resets = 32;
>>>>> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>>>>> -	mmsys->rcdev.of_node = pdev->dev.of_node;
>>>>> -	ret = devm_reset_controller_register(&pdev->dev,
>>>>> &mmsys-
>>>>>> rcdev);
>>>>>
>>>>> -	if (ret) {
>>>>> -		dev_err(&pdev->dev, "Couldn't register mmsys
>>>>> reset
>>>>> controller: %d\n", ret);
>>>>> -		return ret;
>>>>> -	}
>>>>> -
>>>>>     	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>>     	if (!res) {
>>>>>     		dev_err(dev, "Couldn't get mmsys resource\n");
>>>>> @@ -384,6 +384,18 @@ static int mtk_mmsys_probe(struct
>>>>> platform_device *pdev)
>>>>>     		mmsys->data = match_data->drv_data[0];
>>>>>     	}
>>>>>     
>>>>> +	spin_lock_init(&mmsys->lock);
>>>>> +
>>>>> +	mmsys->rcdev.owner = THIS_MODULE;
>>>>> +	mmsys->rcdev.nr_resets = mmsys->data->num_resets;
>>>>> +	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>>>>> +	mmsys->rcdev.of_node = pdev->dev.of_node;
>>>>> +	ret = devm_reset_controller_register(&pdev->dev,
>>>>> &mmsys-
>>>>>> rcdev);
>>>>>
>>>>> +	if (ret) {
>>>>> +		dev_err(&pdev->dev, "Couldn't register mmsys
>>>>> reset
>>>>> controller: %d\n", ret);
>>>>> +		return ret;
>>>>> +	}
>>>>> +


This code is only relevant if mmsys->data->num_resets > 0. Let's check for that 
before setting up and registering an interrupt controller. What do you think?

Regards,
Matthias

>>>>>     #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>>>>>     	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base,
>>>>> 0);
>>>>>     	if (ret)
>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.h
>>>>> b/drivers/soc/mediatek/mtk-mmsys.h
>>>>> index f01ba206481d..20a271b80b3b 100644
>>>>> --- a/drivers/soc/mediatek/mtk-mmsys.h
>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.h
>>>>> @@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
>>>>>     	const struct mtk_mmsys_routes *routes;
>>>>>     	const unsigned int num_routes;
>>>>>     	const u16 sw0_rst_offset;
>>>>> +	const u32 num_resets;
>>>>>     };
>>>>>     
>>>>>     struct mtk_mmsys_match_data {
>>>>
>>>>
> 
