Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCD61966F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 13:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7867010E0B8;
	Fri,  4 Nov 2022 12:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0D310E0B8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 12:45:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j4so7323868lfk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FvboXhj8KjyqdPoeiCN2lb+BeTNUFPqnKJjE5L7Rgjw=;
 b=Ky42DZM27vCCbaHpCg7ZLJUC8lDtMRRqC/uSYDVINXUXFBVFEGtPQ4kqpXm7c2uhfv
 iq1Ohcn/p2LToIti84k3NebbF2pvxD5eeso6ZsGMrKspA1D8O+ZxtN1N4dbuHU1Da6kL
 pKRpfAtw8NoSYpyWENMzeUoHj6fI3SLGLj72W2YMIbdSeGcyZgF+ojDhlPj3UdkOHWSj
 v+PD30SOyhTlE3yNzYngKbBZ1hysbIQWV9+iP0dwKick3lo26e1PGDybZZnGzLoMQz3Y
 AEEYuSY9r+HZvJgrNRInHmeI652IBuQMtY0h7LbVAgeYRrmonY13x3d/Eq4ZNLDiZJoD
 oIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FvboXhj8KjyqdPoeiCN2lb+BeTNUFPqnKJjE5L7Rgjw=;
 b=oPe9u+lytdVCcuy9yXt1a9ESY0yvfpx9XypRI+PpZE4sa6XjLy8mEIxLL/jWmCOIvC
 Han6BwOdVXr8VbjyNvIUHGCuA6EJ6wK493ayhjASh+9eMayI3G0Ur0lQN8VY8Qfzqbrq
 1w9DD/NQt9H0uK++wiC2wcx1LA+BOTnYlqlOMAIMPytaDGO6Yn6B11wMJXZzSECXBp3l
 VbpoxEYOpoZx6ZeiCejFfIq3oN7I2JgUpjpE0yE+VUv5MgvyFQ05uVQ9puWL73/mmqYB
 FZWlxRtfQ7AZTSf/ypVMOa5jyHvrbDQYfQEwiVOvfy4BIApDOK+1GXYgMRfJ3EmHvKo6
 6I6A==
X-Gm-Message-State: ACrzQf2oS69Z+gGjOcORDrD6qp1gROxi7oj/7wxwo84/j/j+ZcvsAePN
 XQcRBjEuGeuRLBM7wMSN/otqpA==
X-Google-Smtp-Source: AMsMyM7hDTo71AcIhzG+IOWZbRcDh4kdE15oJZfFru4jRAk0CN+cc1oyqnCgMyTu8fcg5aLQv8kpgw==
X-Received: by 2002:a19:6a05:0:b0:4b0:291b:9487 with SMTP id
 u5-20020a196a05000000b004b0291b9487mr12680096lfu.623.1667565924980; 
 Fri, 04 Nov 2022 05:45:24 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 x23-20020ac24897000000b0048aee825e2esm445984lfc.282.2022.11.04.05.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:45:24 -0700 (PDT)
Message-ID: <ec774d8b-b6b1-8dca-ec14-8e39e0a4f0f4@linaro.org>
Date: Fri, 4 Nov 2022 15:45:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
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

On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>> SM8450 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>   .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>   2 files changed, 481 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>

[skipped]

>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:

[skipped]

>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: bus
>> +      - const: nrt_bus
>> +      - const: core
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    maxItems: 2
> 
> You need specific names here.
> 

The names are described in mdss-common.yaml


-- 
With best wishes
Dmitry

