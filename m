Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CBE7652CE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 13:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4D310E56E;
	Thu, 27 Jul 2023 11:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E925010E572
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 11:45:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so4468778a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690458319; x=1691063119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1qeXnvcAiq6YWv+BROwmiyjzVjwKIDX/fTfibW2U9Ng=;
 b=haj4JLRqU16kQ/pCAc2zXSfGD4y2xOyhQZRlT94PCb08V82hArXlO7r+VBURosiLYF
 hWxtoN1Q2Qr3zilvKIyJogZjp+ey0Wt9oMCeoZtE0Fq4avoYOoYh0Bey45uEA2+v0IHD
 akKnLl/QQ2Kur95MNKXJTRaVSNjTs+jxxPyhIIIjphYwTWqLm3fjnFBlFMWBsFnXxTd0
 OMVxkX/2AwCbwAq8mQTRKu3hmfYPuQVaZlmhOmT+9M/+Hd10CJb1ErjEQ8t3KsIXZTOM
 DhR9Yk8mZws/ifAa8/gJvYwhRaHEwayj51zlajXVhKLSoBof0i/RPiHRtZYZQB9e4huu
 s8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690458319; x=1691063119;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qeXnvcAiq6YWv+BROwmiyjzVjwKIDX/fTfibW2U9Ng=;
 b=k/RcUZ/TZAVz8mwdCRAmdJo/PuSK7m4Q9OmTC/2PaI7mFVm8Q1oERi5W5moi1ZaqqR
 n9ROcYRbts6FDSQWTqu0pDCd5ojz9PVNtt9bD8d9y0P5JBUQQuT+P8TL/BUdxe0+BIuJ
 NavK/Qcx5BL2+TcBMW6hUc48GE8dvFpj6Mdcl+Xh8gYkMcSiLYYECO7iDHscxZcqTNBW
 MVTiufj6uR9pmg3u3XoZqjqMj3BfZzcSc4wjISda5Kbk8Ck0c9rDU5U8ckn2qWUQAgu0
 s9btXCf2fGp29sUrtAnx/gli5Hit61ypEuQjY6eWe/GhCakrFUA8uxvQtsJ++aVU+v4C
 2b/w==
X-Gm-Message-State: ABy/qLYH749B+qBgNVxKqKuwBkFlHkAKC8y0Xf4/ov4P5Kvl3lgllz5g
 lRwKxZextq0dp4ukFrG3lgzdhA==
X-Google-Smtp-Source: APBJJlGkjcM0tXeGSbsXIHSEtxD4pxFRr5EaDSYdzWNrpPx1y6oDJ7i0CJP0zJjVwc+iwJNrOkN8LA==
X-Received: by 2002:a17:906:2d2:b0:989:450:e565 with SMTP id
 18-20020a17090602d200b009890450e565mr2267093ejk.23.1690458319274; 
 Thu, 27 Jul 2023 04:45:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 pv24-20020a170907209800b009920e9a3a73sm660346ejb.115.2023.07.27.04.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 04:45:18 -0700 (PDT)
Message-ID: <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
Date: Thu, 27 Jul 2023 13:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: qcom: Update RPMHPD entries for some SoCs
Content-Language: en-US
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, Rob Herring <robh@kernel.org>
References: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
 <169045659774.1058731.6391693092002547810.robh@kernel.org>
 <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
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
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 vladimir.zapolskiy@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 13:19, Rohit Agarwal wrote:
> 
> On 7/27/2023 4:46 PM, Rob Herring wrote:
>> On Thu, 27 Jul 2023 14:39:13 +0530, Rohit Agarwal wrote:
>>> Update the RPMHPD references with new bindings defined in rpmhpd.h
>>> for Qualcomm SoCs SM8[2345]50.
>>>
>>> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml   | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml  | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml    | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml   | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml  | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml   | 4 ++--
>>>   Documentation/devicetree/bindings/clock/qcom,videocc.yaml         | 4 ++--
>>>   .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml          | 4 ++--
>>>   .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml         | 8 ++++----
>>>   .../devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml          | 4 ++--
>>>   .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml         | 6 +++---
>>>   .../devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml          | 4 ++--
>>>   .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++----
>>>   .../devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml          | 4 ++--
>>>   .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml         | 8 ++++----
>>>   Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml    | 4 ++--
>>>   Documentation/devicetree/bindings/mmc/sdhci-msm.yaml              | 4 ++--
>>>   Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 6 +++---
>>>   18 files changed, 44 insertions(+), 44 deletions(-)
>>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dts:21:18: fatal error: dt-bindings/power/qcom,rpmhpd.h: No such file or directory
>>     21 |         #include <dt-bindings/power/qcom,rpmhpd.h>
>>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.example.dtb] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1500: dt_binding_check] Error 2
>> make: *** [Makefile:234: __sub-make] Error 2
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
> This should be ignored as the patch that creates the new header is 
> already applied.
> Please follow this series
> 
> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/

Please mention the dependency in patch changelog ---, so it is obvious
for people applying it and also for the bot.

Best regards,
Krzysztof

