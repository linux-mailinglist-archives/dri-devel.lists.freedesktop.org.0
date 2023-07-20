Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AF75ADD9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 14:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B31110E13D;
	Thu, 20 Jul 2023 12:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F3F10E13D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 12:08:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D0836607085;
 Thu, 20 Jul 2023 13:08:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689854929;
 bh=SgDyjdxIshyausnLbV7eqEbnWRDjrZQeUuWRlVZS+wc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J0PwYIF8/wDumfdHdqTHrUB+mYUH6hZvjs99V5ljNR0EypKgTLtTpcAUKQicgRamj
 I+A2m+5+EOymq6XVYOjjhjNPatTq+kwWQCxbjhgQOYCyoy7X+2pR3EqFgash6CSXv8
 fO0xB3wNtkMqADUs9847hBs3tSwgCKR0LZ5IJeorqLXgxKaxtOgopJTodFBvMJ0Trf
 8tsVocYpmZ55WYwUpsD5MRGabhKNT+QHqKq8tCEOHN7t2STXzHUxGl2/56yT+B8pZV
 y/PbbcmSl/mTrgEHcltZTZIQITJhpMNE96HNpMFGtcI9dM02D+nTDgqmSeYEsj5IQJ
 Zpu15BHWe6uOQ==
Message-ID: <a48e9f99-2b93-9eb6-daef-be95a956c3d8@collabora.com>
Date: Thu, 20 Jul 2023 14:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3,3/3] drm/mediatek: dp: Add the audio divider to
 mtk_dp_data struct
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-4-shuijing.li@mediatek.com>
 <44cc9cc5-7dce-f7a2-f077-b62d7851ee12@baylibre.com>
 <65da6005-3c07-a7ea-6b63-db45c8915ae8@collabora.com>
 <6c3422e8-4e2e-ba3a-4f30-d24308ef7c2a@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6c3422e8-4e2e-ba3a-4f30-d24308ef7c2a@baylibre.com>
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

Il 20/07/23 14:07, Alexandre Mergnat ha scritto:
> 
> 
> On 20/07/2023 13:54, AngeloGioacchino Del Regno wrote:
>> Il 20/07/23 12:14, Alexandre Mergnat ha scritto:
>>>
>>>
>>> On 20/07/2023 10:26, Shuijing Li wrote:
>>>> Due to the difference of HW, different dividers need to be set.
>>>>
>>>> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
>>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>>> ---
>>>> Changes in v3:
>>>> Separate these two things into two different patches.
>>>> per suggestion from the previous thread:
>>>> https://lore.kernel.org/lkml/e2ad22bcba31797f38a12a488d4246a01bf0cb2e.camel@mediatek.com/
>>>> Changes in v2:
>>>> - change the variables' name to be more descriptive
>>>> - add a comment that describes the function of mtk_dp_audio_sample_arrange
>>>> - reduce indentation by doing the inverse check
>>>> - add a definition of some bits
>>>> - add support for mediatek, mt8188-edp-tx
>>>> per suggestion from the previous thread:
>>>> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
>>>> ---
>>>>   drivers/gpu/drm/mediatek/mtk_dp.c     | 7 ++++++-
>>>>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 1 +
>>>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>>>
> ...
>>>> b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> index f38d6ff12afe..6d7f0405867e 100644
>>>> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
>>>> @@ -162,6 +162,7 @@
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2    (1 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4    (2 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8    (3 << 8)
>>>> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (4 << 8)
>>>
>>> IMO, it's a bit weird to have SoC specific define in the generic header.
>>> Are you sure this bit is only available for MT8188 ?
>>>
>>
>> Eh, the P0_DIV2 bit is 5<<8 for MT8195, while for 8188 it's 4<<8, clearly :-)
>>
> 
> Ok then, to avoid this kind of issue for other SoCs in the future, is that make 
> sense for you to do a SoC specific header file beside the generic one?
> 

For just one definition? That's a bit overkill :-)

>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2    (5 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4    (6 << 8)
>>>>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8    (7 << 8)
>>>
>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>
>>
>>
> 


