Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165B7653BA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 14:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653CA10E575;
	Thu, 27 Jul 2023 12:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F42610E575
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 12:24:46 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so13035991fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690460684; x=1691065484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dM1dkUrxTZP0LCfoLzwjbnmeZ73oqlRwBBWQaUJPc/4=;
 b=ZT0q62/Ws05TLE5nzjdkbyA3dQxNWG4eLH/vbeMz+hJTEBdzqb6uC7sYtdmIIMKDbV
 a+DeEPndOlLMd1xm+7W+OdIUK+JK0+GMmvgZFZMiPk/mJm8KP71zOfCLMAL4tg8BWyL9
 J3Q9t2zoLWH9Vp4X5W4k83zmqbD/RiyDyVqM5R8yyy83jY30IByXpcSjWBKgnVJXVf5f
 lWhFNfAyWe0sB+EPTAvXVRPl25pgGdrV72B+zqueSR9EBxf6dkjEQIwMDLGKumVWU7ZH
 jg39w/Pk+oAechsDOZeE4pNGAeI7guzrqfp2z/NHdQIyslq+3N69KPgnTpmzPbZ59sBM
 M3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690460684; x=1691065484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dM1dkUrxTZP0LCfoLzwjbnmeZ73oqlRwBBWQaUJPc/4=;
 b=AyVifvsC5PD1OlWF8PQx/j9QqrRjIC/vHlDiAE8sS+e+zNLVByfe7gwVgCRwP7Yqp0
 B6BZpjEyjrVGdO9XLfaIPFa/FEVVSdBSKK+bwBHKvp77yJ+aOyKDxOyGqAqVi6Yaa3m0
 AgFqHh3oe+b5s5c+1JkRSMPeEtv78AwuA8Wzdt01iz5MsSw2HaCXOBPX+gS2cyKW6KWM
 IS3AWVyTJSrG868jHxAFsIARJT+eEjCvBgQB62MonKsqZyEufRIA1+0qC+zK4VMsBrVL
 IKo/YN7g9z1gaAPfZXQSpp2dsErKhieNQwebNGscMOwg7I0qkSylSan4G/bBdq30YygW
 fWLw==
X-Gm-Message-State: ABy/qLbdZS7fKnMxho4IgStf9qP7kIxr1/FttwmrA6Q7q8kXd6dxkpoK
 BgZX6JQErptGpnpEppKKo/Vd1g==
X-Google-Smtp-Source: APBJJlGh70K+MIn7fYVMGvP4ZpEm8iCKX+iWp15lCHVIMc9Gx4e1SlOUav0TkN6/elkL3YftSZJFhg==
X-Received: by 2002:a2e:91c2:0:b0:2b9:4b2e:5420 with SMTP id
 u2-20020a2e91c2000000b002b94b2e5420mr1602856ljg.52.1690460684271; 
 Thu, 27 Jul 2023 05:24:44 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a17090637d500b009937e7c4e54sm710367ejc.39.2023.07.27.05.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 05:24:43 -0700 (PDT)
Message-ID: <c246ab77-0dcd-e6a1-bbec-0924c0923a75@linaro.org>
Date: Thu, 27 Jul 2023 15:24:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Content-Language: en-GB
To: Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
 <169045659774.1058731.6391693092002547810.robh@kernel.org>
 <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
 <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
 <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, linux-clk@vger.kernel.org, rfoss@kernel.org,
 jonathan@marek.ca, stanimir.k.varbanov@gmail.com, agross@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 bhupesh.sharma@linaro.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, mchehab@kernel.org,
 sean@poorly.run, neil.armstrong@linaro.org, mathieu.poirier@linaro.org,
 sboyd@kernel.org, andersson@kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
 freedreno@lists.freedesktop.org, vladimir.zapolskiy@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 15:21, Rohit Agarwal wrote:
> 
> On 7/27/2023 5:15 PM, Krzysztof Kozlowski wrote:
>> On 27/07/2023 13:19, Rohit Agarwal wrote:
>>> On 7/27/2023 4:46 PM, Rob Herring wrote:
>>>> On Thu, 27 Jul 2023 14:39:13 +0530, Rohit Agarwal wrote:
>>>>> Update the RPMHPD references with new bindings defined in rpmhpd.h
>>>>> for Qualcomm SoCs SM8[2345]50.
>>>>>
>>>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>>>> ---
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml   | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml  | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml    | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml   | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml  | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml   | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/clock/qcom,videocc.yaml         | 
>>>>> 4 ++--
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml          | 
>>>>> 4 ++--
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 
>>>>> 8 ++++----
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml          | 
>>>>> 4 ++--
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 
>>>>> 6 +++---
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml          | 
>>>>> 4 ++--
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 
>>>>> 8 ++++----
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml          | 
>>>>> 4 ++--
>>>>>    
>>>>> .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 
>>>>> 8 ++++----
>>>>>    
>>>>> Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/mmc/sdhci-msm.yaml              | 
>>>>> 4 ++--
>>>>>    
>>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 
>>>>> 6 +++---
>>>>>    18 files changed, 44 insertions(+), 44 deletions(-)
>>>>>
>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>
>>>> yamllint warnings/errors:
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dts:21:18: fatal error: dt-bindings/power/qcom,rpmhpd.h: No such file or directory
>>>>      21 |         #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> compilation terminated.
>>>> make[2]: *** [scripts/Makefile.lib:419: 
>>>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dtb] Error 1
>>>> make[2]: *** Waiting for unfinished jobs....
>>>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: 
>>>> dt_binding_check] Error 2
>>>> make: *** [Makefile:234: __sub-make] Error 2
>>>>
>>>> doc reference errors (make refcheckdocs):
>>>>
>>>> See 
>>>> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com
>>>>
>>>> The base for the series is generally the latest rc1. A different 
>>>> dependency
>>>> should be noted in *this* patch.
>>>>
>>>> If you already ran 'make dt_binding_check' and didn't see the above
>>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>>> date:
>>>>
>>>> pip3 install dtschema --upgrade
>>>>
>>>> Please check and re-submit after running the above command yourself. 
>>>> Note
>>>> that DT_SCHEMA_FILES can be set to your schema file to speed up 
>>>> checking
>>>> your schema. However, it must be unset to test all examples with 
>>>> your schema.
>>> This should be ignored as the patch that creates the new header is
>>> already applied.
>>> Please follow this series
>>>
>>> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/
>> Please mention the dependency in patch changelog ---, so it is obvious
>> for people applying it and also for the bot.
> Sure. Will send a cover letter for this patch mentioning the changelogs 
> and will
> keep the version as v2 since there no change at all in the patch.

What would be the merge strategy? Even if you split it per subsystem, I 
probably can not pick up display parts. Is there an immutable branch 
with the new header? Otherwise I can either ack Bjorn picking up this 
patch or it will have to wait for the next cycle.

> 
> Thanks,
> Rohit.
>> Best regards,
>> Krzysztof
>>

-- 
With best wishes
Dmitry

