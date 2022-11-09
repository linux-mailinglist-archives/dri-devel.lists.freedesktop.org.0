Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F07622A27
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BAE10E034;
	Wed,  9 Nov 2022 11:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7D310E593
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 11:18:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id cl5so25230115wrb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
 b=dr/5x8PeQugDwz9zS/lRvw1wyHROVXsoNERq/mQA55Cw10aTLyWLE2xDhkrbNtQfQb
 9U9ZeAtu6osFQScxobESpVYxg9LEmAVE8HEeNV5p0q8b4wIrmlq4NAjb049xmjXOe1z7
 f6tt9aEucdDBFAC9y9DQzKLxobC2tK3YuO/tXHFlQuO4OttdIbIrcQ7PLQHLWcoTSIX5
 4LRqPSf5D/ez+6dfzAV/pliSjSzX1x6uV8vwhTnTSb3I9zeOhmnYC+BCqQ/uWSAlyx75
 ZbaBIF5K4KGAXl2kKxGIGpEx0+rNm7F0+l2rI2FHW6EQ8Uve+1vm+vmcKfayY/uFAjzA
 mtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvtdKEg5HPVz3X+JgHtwGowTHYk1pgsNrv53DSwRrFA=;
 b=loSmsF6+MLY4FEAJVwvlluZ37vWnofyUsrab+cVkJKXJjjUsSbqKg0lc0Umf+G3QEK
 TGtjNN+FbLZ8i8pQqaWVjofLDJnn0lAO8RBC8fzdQDA18/mpgS9J9AdDKhV3eQ1lKYis
 gIPZtWBaP+7BcKOl3zAL7fmXn88xnV+bfJu+Qj3St4CVsUBCRFWyTFnu8E7QaKjg66hh
 teIAlSm6dYGna2k8AppA9rF3ZKoWJ+kmMKbyiXoBUv1OePz29egC7fY3rOgG3xv73hjc
 UcAS9X3s/4Y5XyB1pwarqTXn2b29Zj6+0STSYGqvnojNx2o8Cj+hxJO2AYmNJIBJaMrg
 77kg==
X-Gm-Message-State: ACrzQf3TcGfp5LmpknMpPO0p7wIwcB3GAWmMYpz0jHbdGnz9ADwMAS2Z
 fJKe3vJsuucksox2QuFt6n0=
X-Google-Smtp-Source: AMsMyM6WJqLIdMRVHiViy2TilAyD/0aBmIfS1ZkVy/xQ6rNS2kHQtvnt87DvaPbI24ekuh55jHC+Hw==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id
 a6-20020adfeec6000000b00236aabb8c90mr31041409wrp.199.1667992715589; 
 Wed, 09 Nov 2022 03:18:35 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c6f426467fsm1333419wmq.40.2022.11.09.03.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 03:18:34 -0800 (PST)
Message-ID: <7eac9be2-a880-8971-117d-ec533eebaf4a@gmail.com>
Date: Wed, 9 Nov 2022 12:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 04/11] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys1
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-5-nancy.lin@mediatek.com>
 <90d8dfb1-2a37-e79a-b912-c77076e493c6@gmail.com>
 <20221108191008.lsasjskm7tzvpa42@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108191008.lsasjskm7tzvpa42@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wim@linux-watchdog.org, singo.chang@mediatek.com, linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/11/2022 20:10, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 08, 2022 at 06:46:54PM +0100, Matthias Brugger wrote:
>> On 07/11/2022 08:22, Nancy.Lin wrote:
> [..]
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -80,6 +80,12 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>>>    	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
>>>    };
>>> +static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>>> +	.clk_driver = "clk-mt8195-vdo1",
>>> +	.routes = mmsys_mt8195_vdo1_routing_table,
>>> +	.num_routes = ARRAY_SIZE(mmsys_mt8195_vdo1_routing_table),
>>> +};
>>> +
>>>    static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>>>    	.clk_driver = "clk-mt8365-mm",
>>>    	.routes = mt8365_mmsys_routing_table,
>>> @@ -292,6 +298,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>>>    		.compatible = "mediatek,mt8195-vdosys0",
>>>    		.data = &mt8195_vdosys0_driver_data,
>>
>> It seems we are missing a patch in the series. vdosys0 also correct was
>> never introduced in the driver...
> 
> Hi Matthias,
> 
> as mentioned in the cover letter, this series is based on the series "Change
> mmsys compatible for mt8195 mediatek-drm" [1], which introduces vdosys0. This
> compatible entry specifically is added on patch 3 of that series [2].
> 
> [1] https://lore.kernel.org/all/20220927152704.12018-1-jason-jh.lin@mediatek.com/

My bad. Thanks for the link. I realized that yesterday but had to leave 
urgently. I'll have a look on this series now.

Regards,
Matthias

> [2] https://lore.kernel.org/all/20220927152704.12018-4-jason-jh.lin@mediatek.com/
> 
> Thanks,
> Nícolas
> 
>>
>>>    	},
>>> +	{
>>> +		.compatible = "mediatek,mt8195-vdosys1",
>>> +		.data = &mt8195_vdosys1_driver_data,
>>> +	},
>>>    	{
>>>    		.compatible = "mediatek,mt8365-mmsys",
>>>    		.data = &mt8365_mmsys_driver_data,
