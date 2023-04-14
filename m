Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 125926E20B0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E410E115;
	Fri, 14 Apr 2023 10:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587DE10E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 10:26:06 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 227E5660321F;
 Fri, 14 Apr 2023 11:26:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681467961;
 bh=mNoM/ta8cg4ngqxg7oipt2WWk68MhPf2irdlQ2bTH6c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HWaowAFI7MZZLy46RcM67hcrKHR7EFPgMqFHgvDEIAiWxpvjNQicUt31wS4wYDL1S
 1KaDj/aqxFkJEeq8RwQxDv4iWZzhP5+BuJxaGDFTauwzHvJBay7+0AlEpI4hi2S2WT
 8rB98KbBmtvP6fj7GoWG/FROcIKx2n+XiN5KBI7sj2xzE5hpGwMgpWbRB83wQ9s6Zu
 RNpJkWLksBfef+SsnXarFVl1bPEzxQJWSpshnHOEDjJ1/tkYDqZe9CGGGXBfwgHl8k
 cUvig8zyWy3zW5Dg58B8CVzegX5HKHhQRhIgzyDe+cANCSJ4z+VhzYfo/Vc0yR6bUB
 +8AotLP+x+XDA==
Message-ID: <13fe3e54-caa5-098c-0a86-3d2f8475c23f@collabora.com>
Date: Fri, 14 Apr 2023 12:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
 <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
 <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
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

Il 14/04/23 10:34, Krzysztof Kozlowski ha scritto:
> On 14/04/2023 10:30, Uwe Kleine-König wrote:
>> On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
>>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>>> block: this is the same as MT8173.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> index 0088bc8e7c54..153e146df7d4 100644
>>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>>> @@ -22,7 +22,9 @@ properties:
>>>>             - mediatek,mt8173-disp-pwm
>>>>             - mediatek,mt8183-disp-pwm
>>>>         - items:
>>>> -          - const: mediatek,mt8167-disp-pwm
>>>> +          - enum:
>>>> +              - mediatek,mt6795-disp-pwm
>>>> +              - mediatek,mt8167-disp-pwm
>>>
>>> This does not look correct. You do not add compatible, you replace
>>> breaking all mt8167-disp-pwm. At least it looks like this from context.
>>
>> I thought the old semantic to be:
>>
>> 	"mediatek,mt8167-disp-pwm"
>>
>> and the new
>>
>> 	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"
>>
>> . What am I missing?
> 
> The new is ok for mt6795 but it is not valid for mt8167.
> 

Sorry, why is it not valid for MT8167?

This is changing the doc from:

OLD:
       - items:
           - const: mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
NEW:

       - items:
           - enum:
               - mediatek,mt6795-disp-pwm
               - mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm

For me, that's totally valid, as the old semantic was:

compatible = "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm";

...and the new semantic is .. the same; this commit only *adds* the
possibility to get a

compatible = "mediatek,mt6795-disp-pwm", "mediatek,mt8173-disp-pwm";

without breaking anything.

Regards,
Angelo
