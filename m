Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EC6E20CC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12EE10E12D;
	Fri, 14 Apr 2023 10:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366E010E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:31:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94a342f15e4so340177166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681468289; x=1684060289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7A3jIFNX+D4elFTnhiKETmy1MLNeTbEEPtotnHqMGuQ=;
 b=ef8OHhmk/2tUpsrGW9BAs7ADG0qRkLcn6YKfX7e8PuFF8mPfZpawfAzggGfU432iXb
 CELESl9USoOKfAs7NQZKaf94BEN9o75rea8wrdalwVcBzwCVMxS4kko1MSgWw1yLfGhl
 UgW1E3kQAzdKOOUH8hSIwoZbk4iZO3+xbtQo8+gLc0she+IgxiyseuFCePqqBtwyhsh2
 Nl9lpxH3b73x8blbg5KJkcBBOS82RXTqHNgGG988oaRjZBjEVZZSINXDqTYbRDfNMSFq
 0M0nBwdhl3O3dApDGXn2EW+zEC5rg2vr4k6dGFkmCb5qNEipvzeEdzkbcDfTMU4fxN4W
 FChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681468289; x=1684060289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7A3jIFNX+D4elFTnhiKETmy1MLNeTbEEPtotnHqMGuQ=;
 b=M15b/m18NmlZhHZXkkgnIIC//V2Os2AtM3xxgbDwIyxyE3whx7cgEmB0XPIqTdTyyh
 MClaPWmyjK1TfRk4zdZfBFLr1vSM+yec0FHypWwRPnDoN6OSj4HK2NhTT485UmVeAPJI
 tp8IOvULvYyxW1lhYMRN+TO8AEk1POLVVj6TSRtsA5zoXMZUG8gS8EAdZsUCnMSGeit1
 QGTjcdLh2YJO4lwUy2MKSflc8y1ROzJLlKC+03ss8i1qVr6nktgCl4YFP2efjev9urLU
 u7G94wpClgKiJgf2jGSfvlZ9eF20TyVnIbsmdeNXUNHHeDBAgKS/0my8flkqVOEi/6p4
 yf8Q==
X-Gm-Message-State: AAQBX9fumLgrXSCsMQsQe0Z0Qf8l6/7qyN0DloLdH5U9UCwdqh1cbBw4
 1jBX9X1Ce3WT0n9JDPjRbNyuBQ==
X-Google-Smtp-Source: AKy350Y077+BdBXdq1CcDQ8qonO9EVH5kYn/JqjMAYJj03p/5Gq3PVCVakbTgw4OSubyrs08ItiJ+A==
X-Received: by 2002:aa7:df0d:0:b0:4fd:29e4:ccfe with SMTP id
 c13-20020aa7df0d000000b004fd29e4ccfemr5082786edy.18.1681468289362; 
 Fri, 14 Apr 2023 03:31:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:40b9:8c57:b112:651d?
 ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7d6c9000000b004fa19f5ba99sm1957986edr.79.2023.04.14.03.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 03:31:28 -0700 (PDT)
Message-ID: <e7db1133-b23c-f196-547c-9deea94f0bfe@linaro.org>
Date: Fri, 14 Apr 2023 12:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
 <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
 <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
 <13fe3e54-caa5-098c-0a86-3d2f8475c23f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <13fe3e54-caa5-098c-0a86-3d2f8475c23f@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2023 12:25, AngeloGioacchino Del Regno wrote:
> Il 14/04/23 10:34, Krzysztof Kozlowski ha scritto:
>> On 14/04/2023 10:30, Uwe Kleine-König wrote:
>>> On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
>>>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>>>> block: this is the same as MT8173.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>>> index 0088bc8e7c54..153e146df7d4 100644
>>>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>>> @@ -22,7 +22,9 @@ properties:
>>>>>             - mediatek,mt8173-disp-pwm
>>>>>             - mediatek,mt8183-disp-pwm
>>>>>         - items:
>>>>> -          - const: mediatek,mt8167-disp-pwm
>>>>> +          - enum:
>>>>> +              - mediatek,mt6795-disp-pwm
>>>>> +              - mediatek,mt8167-disp-pwm
>>>>
>>>> This does not look correct. You do not add compatible, you replace
>>>> breaking all mt8167-disp-pwm. At least it looks like this from context.
>>>
>>> I thought the old semantic to be:
>>>
>>> 	"mediatek,mt8167-disp-pwm"
>>>
>>> and the new
>>>
>>> 	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"
>>>
>>> . What am I missing?
>>
>> The new is ok for mt6795 but it is not valid for mt8167.
>>
> 
> Sorry, why is it not valid for MT8167?

Eh, above example did not help me, because it missed mt8173, but I see
now the context I missed. It's already a list of two compatibles, so the
patch is fine.

Best regards,
Krzysztof

