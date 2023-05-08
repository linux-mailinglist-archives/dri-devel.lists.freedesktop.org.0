Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE866FA26B
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4E10E0CC;
	Mon,  8 May 2023 08:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF6C10E185
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:38:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4efe9a98736so4809302e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 01:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683535130; x=1686127130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7M+LYvpo0uL6DRxOtraYhuPAgoiRvl+qFGnzZSo79f4=;
 b=w3GXeMtyzwuRY7sysKSaMD++ZLTRpHQQAxAhiRO+cBGtPVZwBPcfj+CVxdPugtuHtj
 e0jGozykIPHw5c9oZwVLX8uwlyUdbj2k8HVOcEaKtDonm73JFiFk0vOZ5QpvC/lbEJjZ
 gNw9+uexlJCgR0LjtLiJy4hcGh2PNmrb91VcwpuP4LKMNMiJTjIdEVIOKJMm7Ah7Vdva
 UZ0Ukpm0CB3oJ9RMa82eQ8RCq4FLpyjPIy6iF6bXapEF92JcVGEFZY9jpyX5pJVij2h1
 bwcvGE7KevjjBG1wbaIWnL4K4Hh7bdXdH499QfbJ0qKzJFa/P2oOJye7I9Y1IMX46t/m
 3GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683535130; x=1686127130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7M+LYvpo0uL6DRxOtraYhuPAgoiRvl+qFGnzZSo79f4=;
 b=EAAixdpf0hueeqaFU8/6b11nzKqZ+ju9THR7AAfhUcqhp97LRYfeNFPPIa8B//k/8z
 B1of+DJeXBygR3kmscemmmN9NO2+aOUcm4kzalo2z5t0YMTcYJBsbgwEyi14LtWkpahz
 QELZtPeHjmqB6YZJF3xO27+HtzvlqbHAxM3Nor51KFS1Wiud/ii22JhXb63x+LVgX5ec
 h00jLZWjhW4s/GGs/xwkiUGENmGvx5j8ytibQtqe6ddpDHoSBF3mlXD59qb+z1tdyG1j
 s5NVkK77z1ssYtQU+55uFl/vujdCt3MRaekrSZLf1s1x7Kb461qjOyz3pWB1tI1iXn3c
 JzKQ==
X-Gm-Message-State: AC+VfDyw3VSwgWz/iA2RKg4mYlMUIG1nbqUc7WUjSh20j8EkU/WZGmxI
 O+poEkpzSxlwPIJOp+pa9+/AyQ==
X-Google-Smtp-Source: ACHHUZ7BOe90sL4z+719tAJbqmfFOlSnY6F/doGifg/JqPAqaNHcSKmqP/u6JkByUE0L1pZ0R1Ag1g==
X-Received: by 2002:ac2:52a9:0:b0:4f1:4602:fb63 with SMTP id
 r9-20020ac252a9000000b004f14602fb63mr2201009lfm.41.1683535130246; 
 Mon, 08 May 2023 01:38:50 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05651221a500b004f143c11cbcsm1227074lft.51.2023.05.08.01.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:38:49 -0700 (PDT)
Message-ID: <faa64d3d-48bd-b6db-535e-05d6d50aebd7@linaro.org>
Date: Mon, 8 May 2023 10:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
 <20230411-topic-straitlagoon_mdss-v3-3-9837d6b3516d@linaro.org>
 <31147c6d-e77a-8abd-0b55-73ead2385bb9@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <31147c6d-e77a-8abd-0b55-73ead2385bb9@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7.05.2023 10:14, Krzysztof Kozlowski wrote:
> On 05/05/2023 23:40, Konrad Dybcio wrote:
>> SC7180, SM6350 and SM6375 use a rather similar hw setup for DPU, with
>> the main exception being that the last one requires an additional
>> throttle clock.
>>
>> It is not well understood yet, but failing to toggle it on makes the
>> display hardware stall and not output any frames.
>>
>> Document SM6350 and SM6375 DPU.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sc7180-dpu.yaml      | 23 +++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> index 1fb8321d9ee8..630b11480496 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> @@ -13,7 +13,10 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,sc7180-dpu
>> +    enum:
>> +      - qcom,sc7180-dpu
>> +      - qcom,sm6350-dpu
>> +      - qcom,sm6375-dpu
>>  
>>    reg:
>>      items:
>> @@ -26,6 +29,7 @@ properties:
>>        - const: vbif
>>  
>>    clocks:
>> +    minItems: 6
>>      items:
>>        - description: Display hf axi clock
>>        - description: Display ahb clock
>> @@ -33,8 +37,10 @@ properties:
>>        - description: Display lut clock
>>        - description: Display core clock
>>        - description: Display vsync clock
>> +      - description: Display core throttle clock
>>  
>>    clock-names:
>> +    minItems: 6
>>      items:
>>        - const: bus
>>        - const: iface
>> @@ -42,6 +48,7 @@ properties:
>>        - const: lut
>>        - const: core
>>        - const: vsync
>> +      - const: throttle
>>  
>>  required:
>>    - compatible
>> @@ -52,6 +59,20 @@ required:
>>  
>>  unevaluatedProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: qcom,sm6375-dpu
> 
> And the two other variants? Is the clock valid there or not? If not
> really, then you should have else: with maxItems: 6.
Oh right!

> 
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 7
>> +
>> +        clock-names:
>> +          minItems: 7
> 
> If there is going new version - put allOf: before
> unevaluatedProperties:. Otherwise it is fine.
Thanks!

Konrad
> 
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>>
> 
> Best regards,
> Krzysztof
> 
