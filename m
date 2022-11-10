Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98F6242FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55110E7A3;
	Thu, 10 Nov 2022 13:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94BE10E7A3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:12:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 r203-20020a1c44d4000000b003cfa97c05cdso1642670wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VpyhbGYLbgqQGq84zDVWwGbjefm7SUvj9DOXzK2A1TU=;
 b=GHpriBMOXDvxvsugPbxR5FDEgGCUeAbYXuJ84U68kvkH74Cel95enwLZfFymDlsBaa
 zqqULN8YDsOhxTxoGbSM1Z+noOnr9D/oABkpXkxLHwMZyqnq6c00QKTjk3n3Ndu7l9XA
 ccw4xcfiBWQGR1Cbm1JULkcCG6VN6ESFbltpm8/2XvB2cxZikH8bJc2vZSf1fDHkpQF+
 XsVOD63wVvX5JElC7bwKyd57nkpmhNG8sBsU9Lli43eOU29NQVU2sbMoKR/sAUj7BBsH
 Md7T/Njj4G34P8GBPFZnYNfBgh87isM3RC+Tp6Ad11DZHkyuu4q4FubblOaZSFKs2Kf7
 bOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VpyhbGYLbgqQGq84zDVWwGbjefm7SUvj9DOXzK2A1TU=;
 b=sCzbKf59nBvRAYKDzTa7Cc2Q92Nps2gA92jTFX+/bbEcdesVKFx8dCV/EVyCqRueE2
 cl+cUNsGg8N16ECfgrTqvqgH8p9r/h+maaCap65XkRjQlJyXCb7QydG6FnGiAalWO5sl
 l84dSoaEspWRPbwT4OzcGJBv2fpVfg01R+wWVx2TFpcNXCDujKATPTWOhWSOvS1fKu4b
 82yM4t+TGj71BYX2wJMAUfauT8i6aTRMAOQG7ygqVMdH8KlOnPhBZzTjFTAR6KPq51BY
 g/a7F56R16emsNGBehlh8zw5cyZudn36IyWqDGVqAjJ2h1pGOI3Fjf9jTgC0XjsZEHMP
 5miQ==
X-Gm-Message-State: ACrzQf3hFGr4l7razUVfcMX1DJmoYMYsnHw1bU3xZl4KOvEjXHgg1dZ5
 2nMcFxQjMBysj/6tkY5oPRY=
X-Google-Smtp-Source: AMsMyM51TiWHud25bbxeDq7lKiBIwAVbUfDhjw64VUwKMxy4sQuEHhWs+GPnR0/ficWwxEYJhbBqwQ==
X-Received: by 2002:a7b:c455:0:b0:3cf:6817:297d with SMTP id
 l21-20020a7bc455000000b003cf6817297dmr42433341wmi.152.1668085924859; 
 Thu, 10 Nov 2022 05:12:04 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 j13-20020adfea4d000000b0023bb7e4b8b1sm16058508wrn.82.2022.11.10.05.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 05:12:03 -0800 (PST)
Message-ID: <aa7cab9c-8fe2-b42e-84ba-1aeb79d50190@gmail.com>
Date: Thu, 10 Nov 2022 14:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
 <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
 <20221108194351.u63k4mqzq3bkhpl7@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108194351.u63k4mqzq3bkhpl7@notapiano>
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



On 08/11/2022 20:43, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 08, 2022 at 06:37:19PM +0100, Matthias Brugger wrote:
>>
>>
>> On 07/11/2022 08:22, Nancy.Lin wrote:
>>> Simplify code for update  mmsys reg.
>>>
>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>>>    1 file changed, 16 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>> index 9a327eb5d9d7..73c8bd27e6ae 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -99,22 +99,27 @@ struct mtk_mmsys {
>>>    	struct reset_controller_dev rcdev;
>>>    };
>>> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl_relaxed(mmsys->regs + offset);
>>> +	tmp = (tmp & ~mask) | (val & mask);
>>
>> I'm not sure about the change in the implementation of
>> mtk_mmsys_update_bits(). Nicolas tried to explain it to me on IRC but I
>> wasn't totally convincing. As we have to go for at least another round of
>> this patches, I'd like to get a clear understanding while it is needed that
>> val bits are set to 1 in the mask.
> 
> The point here was to make sure that mtk_mmsys_update_bits() didn't allow
> setting bits outside of the mask, since that's never what you want: the entire
> point of having a mask is to specify the bits that should be updated (and the
> ones that should be kept unchanged). So for example if you had
> 
> mask = 0x0ff0
> val  = 0x00ff
> 
> the previous implementation would happily overwrite the 4 least significant bits
> on the destination register, despite them not being present in the mask, which
> is wrong.
> 
> This wrong behavior could easily lead to hard to trace bugs as soon as a badly
> formatted/wrong val is passed and an unrelated bit updated due to the mask being
> ignored.
> 
> For reference, _regmap_update_bits() does the same masking of the value [1].
> 
> That said, given that this function already existed and was just being moved,
> it would've been cleaner to make this change in a separate commit.
> 

Would have been better, but we can leave it as it.

Regards,
Matthias

> [1] https://elixir.bootlin.com/linux/latest/source/drivers/base/regmap/regmap.c#L3122
> 
> Thanks,
> Nícolas
> 
>>
>> Regards,
>> Matthias
>>
>>> +	writel_relaxed(tmp, mmsys->regs + offset);
>>> +}
> [..]
>>> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
>>> -{
>>> -	u32 tmp;
>>> -
>>> -	tmp = readl_relaxed(mmsys->regs + offset);
>>> -	tmp = (tmp & ~mask) | val;
>>> -	writel_relaxed(tmp, mmsys->regs + offset);
>>> -}
>>> -
> [..]
