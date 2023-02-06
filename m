Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F268BB2D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 12:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728E810E374;
	Mon,  6 Feb 2023 11:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013D10E374
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 11:20:24 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id q19so11293711edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 03:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uhqMPSXHkvCWfILufq4Ld5aNdSejDT2hVXfv3Ko2CUk=;
 b=raPqjNh3bznGcgDJNpjJBoLmU9KWkSOkMrFpN7R1Hgnir1F0Uqs123HqifgHra8qQi
 EAMz90ugLBZPLTZ3LmsJD1AT4+N6KRqgbdAoxb+oL860KL+oHsW60dI90Tspq5hhBVcF
 jgbIJ9LO4oabGBLUewmdyw5AxF+uY634xAsdogI/47oL2guzk4+kGzQePDmJjZCUf1s9
 qnJjRHiFVMR4FmFqXG5KiLfYDhJZh11oQngLr6eoKjqSnPaCR9T3/yYJHws6sqOpQEQT
 MniwC2wyCE+o/0l/HWIJPV4rpLL6rSBr/KPhIiqwuL3M6dZZFy0Y6SV7egdvEjH4vrPL
 Suaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uhqMPSXHkvCWfILufq4Ld5aNdSejDT2hVXfv3Ko2CUk=;
 b=VH33+NcWB4l9rh5vygr29FQ7fqzu0az1KPgVdUake+IXE0gNxJXhqB0MW2U1VrfK7Q
 OTbl2PigaoMk8YW6tAi3vDRdjqS5RbwvYRUs0cSM3u27Zbc+ksatInN+mDktoMcHRRV1
 zBPnDq0w5kzF7obBojsFke53JjWKS8e2KebiwvnX/rAAdSWDLxdZW9xzD9asV8TLEOYY
 Yep2L/qyz/LGI+GI22FMH7wqaE+QjiitITkSbGPDqiWx+JRXNNtiPfYE6CvegmjQw5Sk
 +R9nq7HG35ieIKUnQEarxNQ7R2BtYz3HziG+ZLryjOGMNu56CnSkk4Ipov+3iv7ynmFP
 gm5A==
X-Gm-Message-State: AO0yUKUZodWpuIW+nW2UrEsXE5mc0iYnFJP/dKPJkfK7VE86asLgaSTX
 YrGhvnc49ngmoDfddID/VWjqHQ==
X-Google-Smtp-Source: AK7set/hlkKx+T8IiESp6Csj2ct0GVBLugzKhydhbyw/fPZb4IlnO73KtOwKu/XBQbnVKeR1sPtxPw==
X-Received: by 2002:a05:6402:3603:b0:4a0:e237:2cef with SMTP id
 el3-20020a056402360300b004a0e2372cefmr20831204edb.4.1675682423357; 
 Mon, 06 Feb 2023 03:20:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa7dbd1000000b004a249a97d84sm4903348edt.23.2023.02.06.03.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:20:23 -0800 (PST)
Message-ID: <a2ad7b78-d848-df9d-2646-476cb306c505@linaro.org>
Date: Mon, 6 Feb 2023 13:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
 <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f1665a8f-5b5b-7d98-a94e-d1b1df04afdf@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 12:33, Krzysztof Kozlowski wrote:
> On 06/02/2023 11:17, Neil Armstrong wrote:
>> The SM8450 & SM350 shares the same DT TX IP version, use the
>> SM8350 compatible as fallback for SM8450.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 0e8d8df686dc..98bae326e655 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -25,6 +25,10 @@ properties:
>>         - qcom,sc8280xp-edp
>>         - qcom,sdm845-dp
>>         - qcom,sm8350-dp
>> +      - items:
>> +          - enum:
>> +            - qcom,sm8450-dp
> 
> Indentation looks wrong here. Testing should fail, did you test it?

Moreover it also breaks dt-schema, see 
https://github.com/devicetree-org/dt-schema/issues/98

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

