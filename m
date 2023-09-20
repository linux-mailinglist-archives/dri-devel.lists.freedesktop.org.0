Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CB87A8867
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 17:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020C10E513;
	Wed, 20 Sep 2023 15:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54C10E513
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 15:31:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-530a6cbbb47so6439589a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695223874; x=1695828674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ybFgEpWZ1M1MITqAxxwPHlJhDui5BwB2PGcw3ZpdJCI=;
 b=DT7/W2kI6zrBPCvMuNYb1J79aJqhrH32+bs7IeJWjh1J9wKqYuqqqmmbFMuopwtX1N
 5FBHUDR2ZQS0fWz0AoEQUBnf/AjXzsh9E9AIsvx6OxfVaNMCR16Mc+VhYOaYCDxui7FM
 Qv90VBtibBzZhUQ/W9dIpp+EqmxSR8PNxO5xfILN7/BIGJqfKGhBvmzIBqMCZJ4JNrU0
 i5p/hQOOagS+KUyEg3U/tFb3MRKghTlLU/YaIxkMlxoa1ToDgJXb8OKyEsgy++HdAHkJ
 e2v6tf0+u3AtWNyOkIPLThHarorv5Z5/IIHcH8ysFw/H7ZbULPnK0wrhHZX+pODrRNjQ
 D48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695223874; x=1695828674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybFgEpWZ1M1MITqAxxwPHlJhDui5BwB2PGcw3ZpdJCI=;
 b=syMbhUg/lZeMUbZFWEnLGLTuFKfZUbxpTm3pUSo2962BbNo3NLTmW6sqqu/MNUc7sA
 IQ+nvN56hyuTfE4eD1DQh06NFpQUDJP97XrADQPSat0PWW5J1TE/U02QsccZSCRBvzTJ
 YHyjP9EpoGURyMd+ee2YNoyfNHT1HQrty2aW1d6gL/hZ0Hwuj2Z3g118y8fHB/NsOorx
 rUiRSq8kl+zbAoPXER7qmPu2ZHnSduBPj/xi7M5Bm11FWfrf1dr/qNvZJU4E9RUhlOxN
 xfTB7uUo+4R0B7M6v1ziWtDvXvIxcZ/tA6ksjKRjxY0+TkrmYX1O0gh0gZdtAG0N/RZW
 meug==
X-Gm-Message-State: AOJu0YxXL/FLblvOy2T6yxuXvq1FRSp7KT7U2mCHE6DFxUk8VmXuwQus
 BRXjnQWb6N3Hf9/LvRQyjU8j8w==
X-Google-Smtp-Source: AGHT+IFY+e3lRmc+q5LcbEbsI0vU40fn7Akg/ai3v4QIQisIdccOEQ5kCjYcyjjZ6WzIvSbSeufJGA==
X-Received: by 2002:a05:6402:34c3:b0:532:edda:3bb8 with SMTP id
 w3-20020a05640234c300b00532edda3bb8mr3151207edc.16.1695223874642; 
 Wed, 20 Sep 2023 08:31:14 -0700 (PDT)
Received: from [172.25.81.108] ([217.67.225.27])
 by smtp.gmail.com with ESMTPSA id
 ee17-20020a056402291100b005308fa6ef7fsm7575358edb.16.2023.09.20.08.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 08:31:10 -0700 (PDT)
Message-ID: <7288339e-7d8f-6c12-5072-cab53d542dab@linaro.org>
Date: Wed, 20 Sep 2023 17:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 14/15] dt-bindings: gpu: mali-valhall-csf: Add initial
 bindings for panthor driver
Content-Language: en-US
To: Liviu Dudau <Liviu.Dudau@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-15-boris.brezillon@collabora.com>
 <3517f2e9-d9d7-5bf8-1905-62f52d68c512@linaro.org>
 <ZQr2cTMz1-PsOMRP@e110455-lin.cambridge.arm.com>
 <ed4cb30d-2eec-580f-0b4a-1b108a745a9a@linaro.org>
 <ZQsA4DTuWjNwRiOk@e110455-lin.cambridge.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZQsA4DTuWjNwRiOk@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2023 16:25, Liviu Dudau wrote:
> On Wed, Sep 20, 2023 at 03:51:36PM +0200, Krzysztof Kozlowski wrote:
>> On 20/09/2023 15:41, Liviu Dudau wrote:
>>>>> +properties:
>>>>> +  $nodename:
>>>>> +    pattern: '^gpu@[a-f0-9]+$'
>>>>> +
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>
>>>> Drop oneOf.
>>>
>>> The idea was to allow for future compatible strings to be added later, but
>>> I guess we can re-introduce the oneOf entry later. Will remove it.
>>
>> If you already predict that new list will be added (so new fallback
>> compatible!), then it's fine.
>>
>>>
>>>>
>>>>> +      - items:
>>>>> +          - enum:
>>>>> +              - rockchip,rk3588-mali
>>>>> +          - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    items:
>>>>> +      - description: Job interrupt
>>>>> +      - description: MMU interrupt
>>>>> +      - description: GPU interrupt
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: job
>>>>> +      - const: mmu
>>>>> +      - const: gpu
>>>>> +
>>>>> +  clocks:
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>> +
>>>>> +  clock-names:
>>>>> +    minItems: 1
>>>>> +    items:
>>>>> +      - const: core
>>>>> +      - const: coregroup
>>>>> +      - const: stacks
>>>>> +
>>>>> +  mali-supply: true
>>>>> +
>>>>> +  sram-supply: true
>>>>> +
>>>>> +  operating-points-v2: true
>>>>
>>>> Missing opp-table.
>>>
>>> This is the main topic I want to clarify. See further down for the main comment,
>>> but I would like to understand what you are asking here. To copy the schema
>>> from bindings/opp/opp-v2.yaml and bindings/opp/opp-v2-base.yaml?
>>
>> No, "opp-table" property.
>> git grep "opp-table:"
> 
> You mean adding
> 
>      opp-table:
>        type: object
> 
> as property? What's the difference between opp-table: true (like in
> 'display/msm/dp-controller.yaml') and 'opp-table: type: object' like in other

There is no opp-table: true. Nowhere.

...

>>>
>>>>
>>>>> +    };
>>>>> +
>>>>> +    gpu_opp_table: opp-table {
>>>>
>>>> Opp table should be inside the device node.
>>>
>>> I cannot find any device tree that supports your suggested usage. Most (all?) of
>>
>> Really? All Qcom have it embedded.
> 
> The arm,mali-* ones seem to have them outside the gpu node. See "arm,mali-midgard.yaml"

You said you cannot find any, so I pointed out that's not true.

Best regards,
Krzysztof

