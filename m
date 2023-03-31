Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2836D2336
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307AC10F293;
	Fri, 31 Mar 2023 14:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12DE10F292
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:55:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q19so19640829wrc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680274530;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1v1oqbGwtutANfbZAgt8lNsLuoBjX9Am//6Vl/oFEfA=;
 b=K46Ne0U68WOC0jQyu1f6ef7pr7GDPh7f4Pjgd6JONmZ5vhy5RMvhlW4VUj7raalPXN
 aEAk419VYn+zMv1le8W80jEHTMAuP6mrf+zTSZazTT2K9obzDGaxQ54JqA4M3jRsWzm/
 dzQYQmw7NFmeKkZcjrgHRL1q1/DLzK2Ia3Iiay9q3+FhUszWuTwM65xERLQfBXgCe/Ot
 5yHZkVsNtjhU+MYbUZNaBz9IKuQO6lM1tlRrF7954KM39osWlOJHgnX0fDRKaOPXByTn
 BlYJiRupf+OVpQDWadhViNPq7nGEQqunlLJhVmTKX4eUDkUnW3y6BS7FTCh9aneafmAG
 g6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274530;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1v1oqbGwtutANfbZAgt8lNsLuoBjX9Am//6Vl/oFEfA=;
 b=7bzwcvtZQZABTpiDpOjApiDzwhJ66xpGXbr7fLN7SdXNnnC9oubSuu8kk3uotplz/F
 cZrvK0qXjL+PgSio8M6x/R23pSgZblxr1RKOkyiCYMecbjx/lLuHXH4u3va0C3hzQmyL
 1A/ysoNEsAuHsyQTHCEQ/fLIrmFKqTWS+OP7tvovH6NJl3SzRApeGKbHMmnxqM5TpoEf
 2uqMUdnSF8DZuI/ljMa1ix4SwG9x5GVOTeoo7joRncfvjWckkcLtJFOOXQ5bi+Qu6R62
 TjrvB1JCb0iEmlg773vhiPZ4QqUZKaug6AYIy/lg+fiXnjW28TE1FhAHFk101x5Jmdhi
 8w0g==
X-Gm-Message-State: AAQBX9duMW1p7OrmNHv4uaiecrXhK8vPWf6GcvezBc/J1gTGqjMwVEH4
 a9S/ncUang3fKzZFdYzbBi8=
X-Google-Smtp-Source: AKy350YSKtIqzT8X8vCZa/0jBsvl+GqGNYLY0iKeyTokK7bymrPZFg5K6qU89SULQhw0gw/NXjZGpw==
X-Received: by 2002:a5d:4dcb:0:b0:2ca:8da1:db96 with SMTP id
 f11-20020a5d4dcb000000b002ca8da1db96mr19386253wru.50.1680274530116; 
 Fri, 31 Mar 2023 07:55:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g6-20020adfe406000000b002d743eeab39sm2398567wrm.58.2023.03.31.07.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:55:29 -0700 (PDT)
Message-ID: <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
Date: Fri, 31 Mar 2023 16:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
 <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
In-Reply-To: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang Hu,

On 13/03/2023 16:02, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> Alexandre Mergnat <amergnat@baylibre.com> 於 2023年3月9日 週四 下午10:23寫道：
>>
>> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 

I'm a bit puzzled that you give your reviewed by while I would have expected 
that you will take the display binding patches. Will you take these or do you 
want someone else to take them?

Regards,
Matthias

>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> index d4d585485e7b..d47bc72f09c0 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - mediatek,mt8186-disp-aal
>>                 - mediatek,mt8192-disp-aal
>>                 - mediatek,mt8195-disp-aal
>> +              - mediatek,mt8365-disp-aal
>>             - const: mediatek,mt8183-disp-aal
>>
>>     reg:
>>
>> --
>> b4 0.10.1
