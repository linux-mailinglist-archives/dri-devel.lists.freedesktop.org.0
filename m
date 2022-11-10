Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4E624D41
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 22:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F510E101;
	Thu, 10 Nov 2022 21:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D3510E101
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 21:45:07 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h12so2460270ljg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Ycm4yI7Fjm7qLhACsZB89mJNY3y5LzgYSf1XQcN9Y4=;
 b=Q4bUJgTwdovmX1vqvVMapo117LNmOIzvO0a281XV/F3WwAHILMwd03RHWEq7tlhPDy
 XIVG7SryDYCP6zgWHaO3g9DFIcU235EUJ0uaAYxp5hRpQgYBhu7OUZQBLt0csz+xO1Fv
 vfWuAuMx/h4fIWfkGDciHM7vgG+pTlkikLp0aqPnQu1Qjy3efcr2IhroSpsWrkDiuYAF
 gbcEjP4H7mVo/fkmrf+X1Fyvap2jlyvb8Rubq7o7JKZ9PXGIh1yR8EAw0Ymenu+TGP8k
 fu4eyNFYGzy3qpSOYrNMRals6Rok32PmjtqisdWGueuoWzjFXi0hNAlz3UD+oFHr2DPo
 JVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ycm4yI7Fjm7qLhACsZB89mJNY3y5LzgYSf1XQcN9Y4=;
 b=AGTSdkhN/X2zwJiHyj3U/Rqpdlafj6WwStR0jjKRLh6Cmn0UTSMknytSutsYtuWdID
 a3IcHldyWHgb1XglYMR6ayqxvDPVMlxXjQ6/MtL8Iu/UKT7v0Ls6E0OYUv9Aj8EjcmB/
 1U57037wVssO/fYQGX6amS3B9OmoF6/RRl5nuFFI1tY720qXMOqHZeUmYgC0mzQi4Gmu
 J7G73hVD//PVtwW0cGL4a/+yPL1qKv3RHqBOjSFbWUP4m0h/WtFgMNOSMdQKzO9RxHtA
 dB53FSxaVGMOvzioCK/hlh2ucn73BxYMA/agyk+2ojsSxzoCX9nDvDY9WlGgglkUcbmr
 70+Q==
X-Gm-Message-State: ACrzQf3JzLYR+5NdRhUSzznXJ79JxGq9zRqTK6T9e86kPCeR6yo/Vy7W
 3QXK8j5Z7kYfyNqbvIcy6v0SBg==
X-Google-Smtp-Source: AMsMyM5Yl3UNkJaH9rgIXunnY/WAMaQL8CpcD1fuGcZGK75QSChlvq2RNL7B4AkfY67/O7rs7SCNQw==
X-Received: by 2002:a05:651c:1113:b0:277:515b:3dae with SMTP id
 e19-20020a05651c111300b00277515b3daemr9577709ljo.487.1668116705580; 
 Thu, 10 Nov 2022 13:45:05 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d16-20020ac24c90000000b004949a8df775sm39905lfl.33.2022.11.10.13.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 13:45:05 -0800 (PST)
Message-ID: <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
Date: Fri, 11 Nov 2022 00:45:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v9 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
 <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 14:05, Krzysztof Kozlowski wrote:
> On 24/10/2022 18:42, Dmitry Baryshkov wrote:
>> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
>>
>> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
>> will be added later, once msm8998 gains interconnect support.
> 
> 
> (...)
> 
>> +    minItems: 1
>> +    items:
>> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>> +      - description: Interconnect path from mdp1 port to the data bus
>> +
>> +  interconnect-names:
>> +    minItems: 1
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: mdp1-mem
>> +
>> +  resets:
>> +    items:
>> +      - description: MDSS_CORE reset
>> +
>> +required:
>> +  - compatible
> 
> For consistency this should not be required here, but in schema actually
> defining it.
> 
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - interrupts
>> +  - interrupt-controller
>> +  - iommus
>> +  - ranges
> 
> Keep the same order as in list of top-level properties.

But the order is the same.

Compare:
   reg:
   reg-names:
   power-domains:
   clocks:
   clock-names:
   interrupts:
   interrupt-controller: true
   iommus:
   ranges: true
   interconnects:
   interconnect-names:
   resets:

I'll add clock-names, but the rest is correct (interconnects and resets 
are optional).

> 
>> +
>> +additionalProperties: true
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

