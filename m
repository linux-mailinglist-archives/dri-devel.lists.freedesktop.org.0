Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D527B6E8664
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6D110E4BA;
	Thu, 20 Apr 2023 00:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0F310E43C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:26:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4eca0563b31so220896e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950365; x=1684542365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Psl4T4YpjUg01XfnlEjBI8pEA1fZTD2Nzhy7cDEKavA=;
 b=vJMv3A7l2uf768EgIZu+u9ouZ7G0Jl/dK3aLvq56cvfi5VadrrlT+1ndg37h3ofzMl
 XYydubodYZpRp/sJ60Hd4ZjVSdARprGguczDF8A0P8orqve/vxsC1YWBvZ8J7+rJxg5/
 GRf+ppxO9HEjf+LFcruSnHgNXTd6y6ydht8fOltFOLLIms2PBWLN4sfKSnsffq3hhXdP
 J18wcfDn2k+BywOIITi8rcM0eRdITq3UfxZB8+ISAWEA7E8ilDZupJko95Jmz+8n7em1
 AH05H2mSw3tRt2S3hT7mdbAs5LCr4UacI03mDiuf8ViMGuYqXMbnpSoXRR9fn5SNZ94/
 eSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950365; x=1684542365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Psl4T4YpjUg01XfnlEjBI8pEA1fZTD2Nzhy7cDEKavA=;
 b=QtaPg1MnTChiJu6A/hdAQl2aFsMD3SqhT8DYoXnevBq/QopXuMd+BH9X7khjRrEkDC
 vFGFIVmnXfOz3XAgcA6ESrAqB8Ago5FpLM0lbDqyhV6VYa9dZXFntu8j7+sj4i2FlEGr
 EGAhm+sbvr8OS+oHyx4fOyLKNU2FTcP6/eCYvqOtWjPbgmLMeh8ZYpV+lIpofAb/3MR5
 43ezA/tokr4dAl5MjUywnGlyY45j9hksxeUJjb6ZErvJtwfDXtq4cI1Ywv8qEk0dUAN/
 YiVXaSgQVy3E/9cCBHl7KyBeUlIheoS2d9vZvGWcUD/QhqXNe4kaIiTajH8JNc0yOix1
 6pRA==
X-Gm-Message-State: AAQBX9cqMbYe8K8X55MpDzxFX0Qo707hqjk4S4brOUYkjxYY4SeZA3UF
 6UM+B9v2SXYciaUEyCSG4ncqkw==
X-Google-Smtp-Source: AKy350bHHMfLKUnerA/JSf8lkT6nEjfYsQY40HJ6o/cWTpT9y6js94xXiQScUYrEnL+7ULilAE3lsw==
X-Received: by 2002:ac2:4a9c:0:b0:4eb:40d4:e0d2 with SMTP id
 l28-20020ac24a9c000000b004eb40d4e0d2mr4690145lfp.38.1681950365504; 
 Wed, 19 Apr 2023 17:26:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u6-20020ac248a6000000b004eb51cfb147sm52251lfg.115.2023.04.19.17.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:26:04 -0700 (PDT)
Message-ID: <62f99cee-ecc2-2969-22da-d8f43b8b7064@linaro.org>
Date: Thu, 20 Apr 2023 03:26:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH 1/5] dt-bindings: display/msm: Add reg bus
 interconnect
Content-Language: en-GB
To: Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-1-06fbdc1643c0@linaro.org>
 <c20433cb-02e4-bd82-99ab-bd25a49771d4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c20433cb-02e4-bd82-99ab-bd25a49771d4@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2023 23:05, Jeykumar Sankaran wrote:
> Resending the question as the previous one was sent only to the 
> freedreno list. Apologies for spamming!
> 
> On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>> another path that needs to be handled to ensure MDSS functions properly,
>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>
>> Gating that path may have a variety of effects.. from none to otherwise
>> inexplicable DSI timeouts..
>>
>> Describe it in bindings to allow for use in device trees.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml 
>> b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> index ccd7d6417523..9eb5b6d3e0b9 100644
>> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
>> @@ -72,6 +72,7 @@ properties:
>>       items:
>>         - const: mdp0-mem
>>         - const: mdp1-mem
>> +      - const: cpu-cfg
> If posted already, please point to the DTSI patch for this ICC path.

Probably it's worth updating the example in one of mdss schemas.

>>     resets:
>>       items:
>>

-- 
With best wishes
Dmitry

