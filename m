Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0D6C6B55
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BF310E10F;
	Thu, 23 Mar 2023 14:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6010E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 14:44:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso1366361wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679582665;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ek4wZhl4Mg0GrDMidRpjCLxiT+Jj8TNIew80B1+dS8=;
 b=t3Vp7RyFM8QV+VOhJkauXK9ZBmgTbo+zXmbbdNc5YTzFZhULmKx7ULUx2hi9UKIvj4
 yIAo+gNJ6mUmL6zRsgWruEYkTL1nqJr4XVGp9j53f1R59pcJo9BvjgV6ZGPCOWExngg3
 9lwyhlQ7PfizNhOXlnvJ2BjCjfCnW+3z+rA2W9HGw5O1aPBlgxrSE/lr6RkeFNqBSoPK
 gJ3bS3SEKIW41PNmlixE4c62EWhsHJcY3ftPuqZ/F3JOmp8dUDVFskJH15Bv/IRWLTtI
 VmGC96o6jb8k6ouaD0vV0GREdN870JpBDWppohe72sFOYfxOkxkoAarzmhvWz0vtwhhG
 l4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679582665;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ek4wZhl4Mg0GrDMidRpjCLxiT+Jj8TNIew80B1+dS8=;
 b=Eb2fP6imDrkH2t8n4Sv51cvgyzMKHfYOG60AE88QTgieD3J52vEJBvaSi3NI+Z+oTX
 /LRjMq8Bo59z803R3t/ppvIx4d/ki3dDYPlte6GiIhpvrno+gl5aH8sSdQfN+2l0hc6P
 UqEnfwrF4YElqETJZ6Oj6l/vtRaAQo0SLsEfATQ22kFd24OTfB4v9YsrTFbbvKX8+cNK
 fd3bxqB7hbqDmxgYvii2zNofneAVrVIM/zTD+OhwQfsFCKgBFJwncoei8TXaVdn1miVB
 KXqxO0vYUQTQxFn3TZKUZnkO9cKf6g4N9rgg5HnvQGVqcy7czuDPuKK75h4EkbTHvTF4
 zfAw==
X-Gm-Message-State: AO0yUKV7rEXlcREVM8CPskrvnKrwQTb4zlea+hStlSMNrVQ5u4HNruH3
 0qNgDdij6xgbrM4r4VMrFADJEQ==
X-Google-Smtp-Source: AK7set/LnBgJwUokuNj+rBAbXxBzVAIv6jLo1Im7boQzr5ZnmQ5GFZnXrwDgWbSR8lrMohjRlVuXtQ==
X-Received: by 2002:a05:600c:2c48:b0:3eb:39e0:3530 with SMTP id
 r8-20020a05600c2c4800b003eb39e03530mr2306311wmg.41.1679582664667; 
 Thu, 23 Mar 2023 07:44:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc852000000b003ed2c0a0f37sm2045208wml.35.2023.03.23.07.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 07:44:23 -0700 (PDT)
Message-ID: <381cad84-da61-5a55-73eb-869294aa1d1c@linaro.org>
Date: Thu, 23 Mar 2023 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/8] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org>
 <167957963042.3095255.5445133387110199668.robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <167957963042.3095255.5445133387110199668.robh@kernel.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 14:58, Rob Herring wrote:
> 
> On Thu, 23 Mar 2023 11:25:16 +0100, Neil Armstrong wrote:
>> The DSI compatible changed between patchset revisions, but that wasn't
>> reflected in the bindings. Fix it.
>>
>> 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: display-subsystem@ae00000: phy@ae96400:compatible:0: 'qcom,sm8450-dsi-phy-5nm' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae94400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']
> Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.example.dtb: /example-0/display-subsystem@ae00000/phy@ae96400: failed to match any schema with compatible: ['qcom,dsi-phy-5nm-8450']


Indeed I forgot to fix the bindings example....

Thx,
Neil

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-1-3ead1e418fe4@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

