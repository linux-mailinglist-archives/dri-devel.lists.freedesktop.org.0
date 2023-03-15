Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01416BB44B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 14:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210D910E047;
	Wed, 15 Mar 2023 13:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B7010E047
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 13:17:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id cn21so45233433edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678886242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xb3QrMvZd6yXgo618qylfqMF5lEqCyijeAUK/t+b8pY=;
 b=tllWpTVkNiFevbCV6hrsro8EDioioGuXMk8U7uog+O3LTKQ+iwWPKkRrK2a6/gFt5T
 KwLk2WSdmaLSw+gfle9g2We2K7WaRPNyZefDvVsHAna15v3BHpv77DQTr9pWOkmNC4Fa
 /BgHTwnJJ9jluRuRVQULjJbYi5tK3ItpWVTJBKEmpsz/nkG3RIRNcGGKCsMrhxjGhIL1
 RXGOIpfj/3xbldFNygvv8MeKNPspTZ6uEJahOCtvAvU16zTpPJIFPt8K0LF8Rl3rOBrF
 4E9YCPTFe/5T1pbj4Z8UQEI0WAdq8sKV3npKVuuklm/+UvBjD02NfY57buCnifJZWVoW
 OQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678886242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xb3QrMvZd6yXgo618qylfqMF5lEqCyijeAUK/t+b8pY=;
 b=Po6wR1lZRppzA/L4iuuUUrqUJBGb2bIOfPneR7wO4Xl2jCT8C8+jLNguAqbbHaDRmD
 MIXg8BMvsdh9ztyV+zmBbHCq/8JP1Mipa4QhnoU83V0nh/sUiWdkOAa3s6fufLUWU7Q0
 aFBEyxAHagn91Lzo/n5sh9jdooAPzzmNk5MViTdXjKnb5w6Jfu/jSJO4Pu9KAtgqUuSZ
 WyxJlNzx+DMTzcNsx0vusLKqq2xmowFR01W5fTTBdDUm5alAl+c+j8UMCz6NX5wkMfJc
 Ow858fPjprMnHY0fUA9w5g6iy4fc76/Ix1dsWpNw/g9H+i7PCKnQzX+Yt9qTRpbmLpyo
 O1zA==
X-Gm-Message-State: AO0yUKVGSla0YZFNkfh9s1VcsezCycapikHEslgwLHXPavmxhpQPP8bX
 01s3+5u6zid53IYuYk7UTtV0xw==
X-Google-Smtp-Source: AK7set8XLwvi0YYJ2zeYnMe04uDSQnmdw08tghX2TWXAj6C5xYII9tMdLb9fM2JagC5ZFNQlGrwrlA==
X-Received: by 2002:a05:6402:455:b0:4fc:b83d:c31f with SMTP id
 p21-20020a056402045500b004fcb83dc31fmr2560472edw.16.1678886242456; 
 Wed, 15 Mar 2023 06:17:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a50c009000000b004c13fe8fabfsm2414078edb.84.2023.03.15.06.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 06:17:21 -0700 (PDT)
Message-ID: <37c2c7de-792e-0289-4551-24bbb9fe31d9@linaro.org>
Date: Wed, 15 Mar 2023 14:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
 <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
 <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9p0qmfypP2DDJN1vEhJYciVfgFXZWLmvQOdpE=qgSDvKQ@mail.gmail.com>
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
Cc: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/03/2023 09:01, Alexandre Mergnat wrote:
> Le ven. 10 mars 2023 à 09:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> a écrit :
>>
>> On 09/03/2023 15:23, Alexandre Mergnat wrote:
>>> Add compatible for the MT8365 SoC.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> index ca0ca549257d..931d66893dff 100644
>>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>>> @@ -34,6 +34,7 @@ properties:
>>>        - mediatek,mt8186-mdp3-mutex
>>>        - mediatek,mt8192-disp-mutex
>>>        - mediatek,mt8195-disp-mutex
>>> +      - mediatek,mt8365-disp-mutex
>>
>> All these look compatible. Either make mt8635 compatible with something
>> or even rework entire list and make everything compatible.
> 
> All of them use "mtk_mutec.c" but have specific data.
> 
>       .data = &mt8173_mutex_driver_data},
>     { .compatible = "mediatek,mt8183-disp-mutex",
>       .data = &mt8183_mutex_driver_data},
>     { .compatible = "mediatek,mt8186-disp-mutex",
>       .data = &mt8186_mutex_driver_data},
>     { .compatible = "mediatek,mt8186-mdp3-mutex",
>       .data = &mt8186_mdp_mutex_driver_data},
>     { .compatible = "mediatek,mt8192-disp-mutex",
>       .data = &mt8192_mutex_driver_data},
>     { .compatible = "mediatek,mt8195-disp-mutex",
>       .data = &mt8195_mutex_driver_data},
>     { .compatible = "mediatek,mt8365-disp-mutex",
>       .data = &mt8365_mutex_driver_data},
> 
> I don't see any SoC compatible with mt8635, and I have no idea which
> rework you have in mind. Can you please point me an example ?

You are right, I looked at wrong of_device_id.

Best regards,
Krzysztof

