Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D859DAA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D88A9B8E;
	Tue, 23 Aug 2022 10:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AAF9947C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:26:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bq23so10005811lfb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=c1dA5oASWGj0rrUZ/WWyyCO38Uiq0TAfsSxGYmfkPlY=;
 b=pJou0ZXsL1X+99tYH/vTpA2PAeq8TQDtnnogZ2rT/Gn4lNZu9+uWGqmUq28zaFjoW6
 1Xv2tfJrgzApfi1rTqb+a4Kb3sH2AsyD34KBsrjbLezWjFOzFxhW1Ts93ES6j9z4evOD
 2Otl/3yI1hHdn+tr0dvn+QQbGkfb5V+/i6E8YbbghU0fchDUg5GRjmNWLW+0+QS6LLr9
 qpR9XOygAvLdBbbQgd2azeymUwWj4VSagVxzULPtVjIdlmLU1Op5nj+empBcEx3R27ym
 GlZt6nWioLJSfZaizWat8u6OoABAC2mQKeXUD9ryImR8pgT2FoHeWfUyvLdEMUCTHj0g
 /CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=c1dA5oASWGj0rrUZ/WWyyCO38Uiq0TAfsSxGYmfkPlY=;
 b=4b9/9G8ufVh65ByUFJpMkokqBJLtx6XIFQkGSiFmOAcn8T3drOEh3AQ3dP0xYyeFxA
 +hgXxaJnaH1cy8sb2bW4FIyoNwWGDDSIEHAH73YQs+li4I6uZwl7kHfFsHDjMy06PwCv
 HArYzo0Lu7S32IenQnhxZqCzrGocbn3MoGY8XCuf04igQv8rwCPZ3Uzmsz2sq5h4oFaX
 vyOyy49pFXLnvEE0WY1dsTNhtc+2DWJYWtm1Bl1/J3JIZJKKsCIxXutDMcBSxpQxcM2v
 ZxBbg4DAtKajhG2rb6npCwNPxqsYuZMx4E/fIvmYquNQc5Rt9Etwfyu5ogQ7vLy/iz58
 y/nA==
X-Gm-Message-State: ACgBeo29/ESK7kYcu4PjUNhmX6FCUvACNqBFUV4Akwg8cV8xxMY7BRzu
 7ZNCdRsH+bq+Q2ygKwL0ZmEFZA==
X-Google-Smtp-Source: AA6agR7wM+x9s2G0l80E0LnJODLA/PG74+Qk16IJ5VwKsCc/MbDJLPh5C/Qmli+xGAgcR8f845D2Tw==
X-Received: by 2002:a05:6512:258b:b0:492:f472:3058 with SMTP id
 bf11-20020a056512258b00b00492f4723058mr857168lfb.337.1661250377095; 
 Tue, 23 Aug 2022 03:26:17 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a056512391000b0048aa9d67483sm2437921lfu.160.2022.08.23.03.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 03:26:16 -0700 (PDT)
Message-ID: <2d6a6603-ae0b-6874-d92a-eeebef6abf17@linaro.org>
Date: Tue, 23 Aug 2022 13:26:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] dt-bindings: display/msm/gmu: account for different
 GMU variants
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-4-dmitry.baryshkov@linaro.org>
 <7b504ecb-b05a-549e-e2ce-18c539f68655@linaro.org>
 <a3a917b3-5dfc-761e-e5f6-5955c89db4a4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a3a917b3-5dfc-761e-e5f6-5955c89db4a4@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 20:58, Dmitry Baryshkov wrote:
> On 06/07/2022 18:52, Krzysztof Kozlowski wrote:
>> On 06/07/2022 16:52, Dmitry Baryshkov wrote:
>>> Make display/msm/gmu.yaml describe all existing GMU variants rather than
>>> just the 630.2 (SDM845) version of it.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../devicetree/bindings/display/msm/gmu.yaml  | 166 +++++++++++++++---
>>>   1 file changed, 146 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> index fe55611d2603..67fdeeabae0c 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> @@ -20,35 +20,24 @@ description: |
>>>   properties:
>>>     compatible:
>>>       items:
>>> -      - enum:
>>> -          - qcom,adreno-gmu-630.2
>>> +      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
>>>         - const: qcom,adreno-gmu
>>>   
>>>     reg:
>>> -    items:
>>> -      - description: Core GMU registers
>>> -      - description: GMU PDC registers
>>> -      - description: GMU PDC sequence registers
>>> +    minItems: 3
>>> +    maxItems: 4
>>>   
>>>     reg-names:
>>> -    items:
>>> -      - const: gmu
>>> -      - const: gmu_pdc
>>> -      - const: gmu_pdc_seq
>>> +    minItems: 3
>>> +    maxItems: 4
>>>   
>>>     clocks:
>>> -    items:
>>> -      - description: GMU clock
>>> -      - description: GPU CX clock
>>> -      - description: GPU AXI clock
>>> -      - description: GPU MEMNOC clock
>>> +    minItems: 4
>>> +    maxItems: 7
>>>   
>>>     clock-names:
>>> -    items:
>>> -      - const: gmu
>>> -      - const: cxo
>>> -      - const: axi
>>> -      - const: memnoc
>>> +    minItems: 4
>>> +    maxItems: 7
>>>   
>>>     interrupts:
>>>       items:
>>> @@ -76,6 +65,9 @@ properties:
>>>   
>>>     operating-points-v2: true
>>>   
>>> +  opp-table:
>>> +    type: object
>>
>> instead: opp-table:true
> 
> Wouldn't this allow e.g. using just 'opp-table;' as a flag?

You're right and Rob also corrected me. Your original patch was correct
(type:object).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
