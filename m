Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB975ADCF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D6910E0F1;
	Thu, 20 Jul 2023 12:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3C10E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 12:07:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991c786369cso125466066b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689854826; x=1690459626; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/pQYZXvCL/vH+InQO678qhur3p7zMNQkrPa73LIehA=;
 b=b4SbQwmdb5WswWDI1wo6eR85VROuxSBN7cQHGY1PrNXLz5oDMzsxtTm/0rcFWqcEcO
 Cxp12ZA7Vf3zn5cqDYG/mBnHrBO4v9cNudmeH7WSSSkdnuG2Cj0gNUERs5mFlu+tAO9y
 GtfFSxxndfir5ZdDQ+LhaFHRfjMDYBA5VzkE0uTjX+qtIxmm6kZw0nVimMq014FZ+tBk
 rrLgP/6XC+RfCErFUiwVOldbncNbecud1Gh1Fy6y7lPkSkij50g4EcMYjlXpIn6EKESu
 BP+43KWiGPLFNIOrWa7t4KNjnfVeQfjHzBm+UbaJMfzEzRudh3lfcFuraVrctmPnq54f
 pBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689854826; x=1690459626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/pQYZXvCL/vH+InQO678qhur3p7zMNQkrPa73LIehA=;
 b=eBnUXqDoDKJq0v1NGvMZzRN6xmadbLB9ls8frmMASL2ujvYvA01ODLA6v3EA9H/yte
 1fvg5L8WXht64Zad5eg9XfoqSAuguF1pHC7wqnQ2xP4e1DTZ+6752OgiTreVUnv9rxBj
 tAmj3Zyamq8P3C71jTvnQ7KGZhxSS/8w3nplqBQ+1HxSMuVFLWalidsJU2sXOpyMMLDf
 gWnCxvQwuAosz/r+CBDCL5crUllygQ9xNDWLr+3Xv+dMnSIzWaaSbYkUZEIkopwvGORQ
 Zf+/zs41myc8JBjojM3wxq0bTBAuQ9JeA+bbOnJ2Qdw8wqcdjiXNASg2Xhj+pa89GiMQ
 RS+w==
X-Gm-Message-State: ABy/qLY21yWUF9lNOvPY7Ttrtr6gn01Ymw8wK9tmoMZKov+Jl0+S0vTH
 SgKgqQ9GrluG7dockFKnczgQ0Q==
X-Google-Smtp-Source: APBJJlE0xBhrIqBKnTaU36gyXlOT5nf8DniN0oGDkPcqlA18Hu2PRw42dkrUVAQsFiZM2IUUdeqFGg==
X-Received: by 2002:a17:906:7791:b0:992:764b:90d5 with SMTP id
 s17-20020a170906779100b00992764b90d5mr1991567ejm.71.1689854826324; 
 Thu, 20 Jul 2023 05:07:06 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a170906924b00b0098e34446464sm615265ejx.25.2023.07.20.05.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 05:07:05 -0700 (PDT)
Message-ID: <6c3422e8-4e2e-ba3a-4f30-d24308ef7c2a@baylibre.com>
Date: Thu, 20 Jul 2023 14:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-4-shuijing.li@mediatek.com>
 <44cc9cc5-7dce-f7a2-f077-b62d7851ee12@baylibre.com>
 <65da6005-3c07-a7ea-6b63-db45c8915ae8@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <65da6005-3c07-a7ea-6b63-db45c8915ae8@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/07/2023 13:54, AngeloGioacchino Del Regno wrote:
> Il 20/07/23 12:14, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/07/2023 10:26, Shuijing Li wrote:
>>> Due to the difference of HW, different dividers need to be set.
>>>
>>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>> ---
>>> Changes in v3:
>>> Separate these two things into two different patches.
>>> per suggestion from the previous thread:
>>> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
>>> Changes in v2:
>>> - change the variables' name to be more descriptive
>>> - add a comment that describes the function of 
>>> mtk_dp_audio_sample_arrange
>>> - reduce indentation by doing the inverse check
>>> - add a definition of some bits
>>> - add support for mediatek, mt8188-edp-tx
>>> per suggestion from the previous thread:
>>> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>>
...
>>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>> index f38d6ff12afe..6d7f0405867e 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>> @@ -162,6 +162,7 @@
>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2    (1 << 8)
>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4    (2 << 8)
>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8    (3 << 8)
>>> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (4 << 8)
>>
>> IMO, it's a bit weird to have SoC specific define in the generic header.
>> Are you sure this bit is only available for MT8188 ?
>>
> 
> Eh, the P0_DIV2 bit is 5<<8 for MT8195, while for 8188 it's 4<<8, 
> clearly :-)
> 

Ok then, to avoid this kind of issue for other SoCs in the future, is 
that make sense for you to do a SoC specific header file beside the 
generic one?

>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (5 << 8)
>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4    (6 << 8)
>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8    (7 << 8)
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
> 
> 

-- 
Regards,
Alexandre
