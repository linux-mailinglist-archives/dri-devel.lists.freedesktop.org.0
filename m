Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F816DF6A2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301B810E7E2;
	Wed, 12 Apr 2023 13:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C510E7E2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:12:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso11592104wmo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681305170; x=1683897170; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IsrkVPeKsaynFnbWlBbnoqSaEozGzCnZBk6Qj0AOkSA=;
 b=ssqrDy/2cLPJMN/UfNNxohNjADmsWrmIPazYKu4Ca3VT51kMGJqUU1fvWcWP4RjuZo
 4dF+jf6yXYovywxAeb9lSaPiNCt6S4eT3K+uf9VRCmYJmFdY8L41VcIutelklqmDsd6V
 qEQiJk6+v2YoizYOHRkf0dteFBK+5GWCvEXstGpl1jIPIMOXUsz7nnNubKdh5OvNHnOL
 aDF6VeDl9OZ8cI5sC0EVKynLDlBXTOguFMXJZ/LRchX+pbtIPKdlFgmkzwneaoW2z/GQ
 VQFB2AhqMthknYvrUs8GSB/XmaDK1dHZobdQvl+1Y43TnONYn2GITk4eWX+S3A94HX6O
 2rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681305170; x=1683897170;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IsrkVPeKsaynFnbWlBbnoqSaEozGzCnZBk6Qj0AOkSA=;
 b=5YORrMa6FGY5ivfZvufA0pEkD+Ljxp/EGxh2cfaM/6gT3ZR7q91Pg8fsm1Ao3ED6Q5
 Jo00bJpEIJCF0G1t5hA7M0XD+fgJHaiElP7S+CEn2D6UBPwn/yabOQiIVje85Gabcia4
 fQf4ZwISsX+EXGFf8i9Izvh9jxhHN8qJuPwemb1K7QwTyyZBP0R6w4+L/ZgnClYluH9i
 CWOhmibuRsPxzCK37C7j0+YwPFUDT0+C4wHr6mKNxsnOJJBycyoch6P/NbIByr+g+bxe
 9IjZ+esgwm0xFqHsm0SSZrWan5AAbWioY20hbWz3bOjNOcYmNG4gKczCn/eYMtrdor67
 jRGQ==
X-Gm-Message-State: AAQBX9epgWHtEBNhgK3d9HXhyI8Meg1Lny5EUZk4nRp8/uPUOotgzTAv
 76HpTRS04XgaWHL4KkOuE8fudA==
X-Google-Smtp-Source: AKy350ZBjsJyLl7Rt2Og/2cr2DuEAVD7N0GXPO8YRPue1Xvb87vVf08FN6CXsl6Q/928lyD+Npa9JA==
X-Received: by 2002:a05:600c:2142:b0:3ef:62cd:1ef with SMTP id
 v2-20020a05600c214200b003ef62cd01efmr4545069wml.25.1681305170583; 
 Wed, 12 Apr 2023 06:12:50 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003ee63fe5203sm2311867wmk.36.2023.04.12.06.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:12:50 -0700 (PDT)
Message-ID: <7e53c0b1-3aed-da08-5c57-800ac2277bc6@baylibre.com>
Date: Wed, 12 Apr 2023 15:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
 <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
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
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 15:03, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 14:59, Alexandre Mergnat ha scritto:
>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>>> the same DSI PHY as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml 
>>> b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> index 26f2b887cfc1..a9f78344efdb 100644
>>> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>> @@ -24,6 +24,10 @@ properties:
>>>             - enum:
>>>                 - mediatek,mt7623-mipi-tx
>>>             - const: mediatek,mt2701-mipi-tx
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt6795-mipi-tx
>>> +          - const: mediatek,mt8173-mipi-tx
>>
>> AFAIK, it should be:
>>        - items:
>>            - const: mediatek,mt6795-mipi-tx
>>            - const: mediatek,mt8173-mipi-tx
>>
>> Since it isn't respected above for mt7623, it may be tolerated.
>> Please, take this comment as a suggestion, isn't a NAK from me.
>>
> 
> First of all, Thanks!
> I want to explain, though, the reason for that.
> 
> If you check all the commits, on some I did it as you just proposed, while
> on some others I did it with an enum before const: that's simply because I
> *totally expect* some to grow, while others (const - const) I was either
> unsure, or totally *not* expecting them to grow soon!


That's what I thought. IMHO, if someone add another compat later, he 
will be on charge to change the const by enum front of your 
"mediatek,mt6795-mipi-tx". But my opinion is probably not the most popular.

I will not make the same feedback for the other patches in this series.

-- 
Regards,
Alexandre

