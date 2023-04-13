Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B620E6E0983
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBDD10EA8F;
	Thu, 13 Apr 2023 08:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D1D10EA87
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 08:59:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s12so4986210wrb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681376340; x=1683968340;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7g5hV3NWDVn1/V7aQRt4oQ8CBf16T6HKdjwb2x5bdk=;
 b=dBQhg5EbOvayR7mx31g2Jml4oYq5/XXxJlntstydhf4l7HpHShRVId/butsUy55+3P
 EsfmjNNOvORzCCy9QrCrhfQ+NTZ2L3YPpyILbRZZh4Z0DC80Bk+ylhxVs+zuIVYeiEk6
 WMSrTGlcRp94aMhIDPa9q1PpS6Fdk/5/eCF820KZyQ0No/UnjIG0HBi/m1RC4M68XKHy
 XeOSWDFKffbUpGzlPRgMTgi2c9AkCSK5nQdePDFLEjMBVDR0WcU73xrKpxaPEEVPltjN
 9zZdFEN8Rws2NkH82yXHFR2q4Udm2qOj4psP4gaDMK4HtgQ1oRZANyNdzRZYpIeGAE18
 vujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376340; x=1683968340;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7g5hV3NWDVn1/V7aQRt4oQ8CBf16T6HKdjwb2x5bdk=;
 b=MYHNvD10juGB6HFekhaSze1eTgvNkid5Flfc3KGAONtOsE4rHCb+yMBhlLR/GkrGoV
 2aR7yAc1jC65liCSt6LXJKyhZe8iy9CBbuZh8YbaQK2ma5MmCt4a8sh9Oh/cXhjq2NLs
 TyRhSfdTVSJk3WbbsF1x2+4g0/fZ5G2lTBst+fQbs+R6xEYzjvHCE/j4YiPm+MCxGn4e
 vNHaBjlWln/B1YO1r9O2JJWT54x351v/yJbEWAIDdAtF9CJrVlXt6MJ3W/IQqfmE8UXh
 NEfzZyn6+vembMRCLMBxgNqoNCpCx87YHmZd4kK/zSptBpp/f+XJ61b5t7IpXeaYEKwt
 JgIA==
X-Gm-Message-State: AAQBX9ejm6cJeBsdMp/KDJ+fSmA4wvjB5bhu7aYC+yaJ1T313cfRDeMA
 bdmJ8O1wNiDmkuYa5wuoWr8=
X-Google-Smtp-Source: AKy350Zxv3Ko4eW0Fum9TmN1yb7aYSGe0D9dQ8XHg0Ai6fR9/Rf1dH0XSwLKNKkfZjY0IWUaTBv/eg==
X-Received: by 2002:adf:ef51:0:b0:2f0:2e3a:cc04 with SMTP id
 c17-20020adfef51000000b002f02e3acc04mr1138305wrp.8.1681376340325; 
 Thu, 13 Apr 2023 01:59:00 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d5644000000b002f02df4c7a3sm819861wrw.30.2023.04.13.01.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 01:58:59 -0700 (PDT)
Message-ID: <4b5a6233-c8f3-4d12-7508-45df8b7548f5@gmail.com>
Date: Thu, 13 Apr 2023 10:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
 <20684378-cf3e-0299-d390-287b7bafbda5@baylibre.com>
 <eb770f19-ada5-81bb-5ea3-798edabca70f@collabora.com>
 <7e53c0b1-3aed-da08-5c57-800ac2277bc6@baylibre.com>
 <e129b3ff-90b1-3df7-871e-09fba0a960f4@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek, dsi-phy: Add compatible
 for MT6795 Helio X10
In-Reply-To: <e129b3ff-90b1-3df7-871e-09fba0a960f4@collabora.com>
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



On 12/04/2023 15:17, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 15:12, Alexandre Mergnat ha scritto:
>> On 12/04/2023 15:03, AngeloGioacchino Del Regno wrote:
>>> Il 12/04/23 14:59, Alexandre Mergnat ha scritto:
>>>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>>>> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
>>>>> the same DSI PHY as MT8173.
>>>>>
>>>>> Signed-off-by: AngeloGioacchino Del Regno 
>>>>> <angelogioacchino.delregno@collabora.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml 
>>>>> b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> index 26f2b887cfc1..a9f78344efdb 100644
>>>>> --- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
>>>>> @@ -24,6 +24,10 @@ properties:
>>>>>             - enum:
>>>>>                 - mediatek,mt7623-mipi-tx
>>>>>             - const: mediatek,mt2701-mipi-tx
>>>>> +      - items:
>>>>> +          - enum:
>>>>> +              - mediatek,mt6795-mipi-tx
>>>>> +          - const: mediatek,mt8173-mipi-tx
>>>>
>>>> AFAIK, it should be:
>>>>        - items:
>>>>            - const: mediatek,mt6795-mipi-tx
>>>>            - const: mediatek,mt8173-mipi-tx
>>>>
>>>> Since it isn't respected above for mt7623, it may be tolerated.
>>>> Please, take this comment as a suggestion, isn't a NAK from me.
>>>>
>>>
>>> First of all, Thanks!
>>> I want to explain, though, the reason for that.
>>>
>>> If you check all the commits, on some I did it as you just proposed, while
>>> on some others I did it with an enum before const: that's simply because I
>>> *totally expect* some to grow, while others (const - const) I was either
>>> unsure, or totally *not* expecting them to grow soon!
>>
>>
>> That's what I thought. IMHO, if someone add another compat later, he will be 
>> on charge to change the const by enum front of your "mediatek,mt6795-mipi-tx". 
>> But my opinion is probably not the most popular.
>>
>> I will not make the same feedback for the other patches in this series.
>>
> 
> I honestly don't know what's the most popular opinion about that... but whatever,
> in any case... just want to make sure to communicate that I don't really have
> strong opinions about doing it one way or the other.
> 
> The arguments in favor and against that are probably 1:1... :-D
> 

Then let me throw in another one :)

Take into account that if we expect the compatible to be added somtimes in the 
future (not the near future) this code will lay around for some time. People 
will take this code as an example for new code, then we will need to explain 
it... In that sense it would make more sense to have all made const: const: and 
change this to enum once a new compatible is added to the mix.

Said all this, I leave it to the DT maintainers to decide :D

Regards,
Matthias
