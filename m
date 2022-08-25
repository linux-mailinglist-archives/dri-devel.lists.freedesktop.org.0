Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328E5A10C8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CC710E10B;
	Thu, 25 Aug 2022 12:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8729B10E106
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:40:53 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bq23so19008119lfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=d/68CgZXpdibjx3VCkPqFVb7t4FrNdrli/rV5C+BiZY=;
 b=tgILCcxdGjfytzViND0aVwmMGnWbO9RkDo4NAdEOiLaQj+y4/BiibRPHIb9fEaKUzW
 Y2QVkTG0KHoM4F+OpBVSxeuxFAzKFGxOsvaQCuRcW2P+xyvx3+5t9VawlkJslnVuTEMC
 ZrOzo2Smtx29eyq+YRkPjma1483DAjf8cU21QsqnjC7PRq/+/QFpd2bNJWLQ82nLutGz
 sJq9o84nT+XGbfp2CwbVWtGbCsR3dRMwRTa0OASqgNfifLQykSBsJVBGDfsKeUyHpgHe
 tBEiApPUno55y3ueM47B6LWZDLJKOAqNOvvf5Ar8FN+ScZOr3adMniwGyheOgSng60WU
 0udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=d/68CgZXpdibjx3VCkPqFVb7t4FrNdrli/rV5C+BiZY=;
 b=CP2CHtgA+YyXxx7DTUy+7B2D04o+bYvmg50JQTEX90xOH+GSPfuvT7SUuEU9IIWWZf
 8P6notv9yQdOfce/QOUl4F/d5YKldpAg7NqwyBgoqKj6i/6bMbH1k10W5EPJojcTkmLr
 xmWC4dX8ne5DD2uqpBZ59dqclPAW1K/O2AIO9LqhbJ9ygRh183bq14hL21DGfWtc/MzR
 5AjIYFxeipYb80VOcpPslWQ9gnxPZsZPR9ouNy25XvIcHLTD0BlgDnH7zFS+XmHRRJS1
 bmvjtT1+/aCoKqAcmITW4xceq66N7tYs3095c5YmYJm6uPZPkCBE/x/RQmwr6RZ9+DYu
 Li9A==
X-Gm-Message-State: ACgBeo0brnddvuZRtxlLruCqAQYqlwTU4HVjkEgZcqJAYS75Ay2P49pI
 VGD+ACWVnMZ8w/1AIUCIkkV/Bw==
X-Google-Smtp-Source: AA6agR6knAr76Sh3pws/tUUxlJuxgXi+jJ84QoZheAyP0f3pjbMXXgmbbgUww/Eu3pLjlGa471TJrg==
X-Received: by 2002:a19:5e19:0:b0:492:e529:61a7 with SMTP id
 s25-20020a195e19000000b00492e52961a7mr1129973lfb.635.1661431251764; 
 Thu, 25 Aug 2022 05:40:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a199219000000b00492eeabd6f8sm487038lfd.52.2022.08.25.05.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:40:51 -0700 (PDT)
Message-ID: <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
Date: Thu, 25 Aug 2022 15:40:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 03/10] dt-bindings: display/msm: move qcom, sc7180-mdss
 schema to mdss.yaml
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
 <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/08/2022 15:01, Krzysztof Kozlowski wrote:
> On 25/08/2022 12:50, Dmitry Baryshkov wrote:
>> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
>> that the dpu file describes only the DPU schema.
> 
> MDSS grows to unmanagable file. I don't think we will be able to keep it
> maintained. You will have many if-else defining subnodes and their
> characteristics. As I said before - this should be several separate
> schemas with common part.
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>>   .../devicetree/bindings/display/msm/mdss.yaml |  66 +++++++-
>>   2 files changed, 102 insertions(+), 113 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> index d3c3e4b07897..9d4ec0b60c25 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> @@ -10,151 +10,78 @@ maintainers:
>>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>   
>>   description: |
>> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> -  bindings of MDSS and DPU are mentioned for SC7180 target.
>> +  Device tree bindings for the DPU display controller for SC7180 target.
>>   
>>   properties:
>>     compatible:
>>       items:
>> -      - const: qcom,sc7180-mdss
>> +      - const: qcom,sc7180-dpu
>>   
>>     reg:
>> -    maxItems: 1
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>>   
>>     reg-names:
>> -    const: mdss
>> -
>> -  power-domains:
>> -    maxItems: 1
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>>   
>>     clocks:
>>       items:
>> -      - description: Display AHB clock from gcc
>> -      - description: Display AHB clock from dispcc
>> +      - description: Display hf axi clock
>> +      - description: Display ahb clock
>> +      - description: Display rotator clock
>> +      - description: Display lut clock
>>         - description: Display core clock
>> +      - description: Display vsync clock
>>   
>>     clock-names:
>>       items:
>> +      - const: bus
>>         - const: iface
>> -      - const: ahb
>> +      - const: rot
>> +      - const: lut
>>         - const: core
>> +      - const: vsync
> 
> All these changes point that device schemas are simply different and
> trying to unify them is not correct approach.

I'm not going the argue the mdss-common + platform specifics, but please 
note that these changes are coming from me removing one extra level of 
depth in dpu-smth.yaml. Currently these files have both mdss and dpu 
devices, I'm stripping the mdss out of them.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

