Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E3619694
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 13:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51EC10E73E;
	Fri,  4 Nov 2022 12:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D0110E73E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 12:52:37 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id h10so3096776qvq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 05:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VlkkXrMP3qc3O7UVgaKaQ13gTOpZiVN/WX+OdmtFZ0Y=;
 b=I6PHIpZxMgyqprbXT52oM74eJqSe+4hW54gwGaugDZlkGxd6mvyxNcsJiE15r7cbi7
 cQwv5Bi7naAQ0aoMqV4/vtvD81ziqbGwuVKH9kuy0zQkbZUNlROGvQUoKB3dmJ5sBsXG
 CBycOQShUgE/3URhXZ+R0pkHDbqD3wmmgozMNjPj0l67ZPfpQKTPzSDsht8Ab1HuEg2a
 Q6xgxZR3K/vdfpy63MuKrmewGISC+QRolefFk6wTJ9jR+aOlJxdE5suCkGbbe+j5eLze
 aLm3J3S9qKVaJ0V/v1bSiRHlcNPbh8zXLdMN0+I4Pgw2HKbixZUQSoPo+xr6ZVVZ1Z9d
 NFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VlkkXrMP3qc3O7UVgaKaQ13gTOpZiVN/WX+OdmtFZ0Y=;
 b=8F6b6qbQW7oL+kyJ7IXa3MsEPX+mylOVstxNfNOY6Y92xSbdrAFPrXjSkork4rmJRe
 N5TZBlIGMfd7yTjQ5MAA6/mLm7yO+9IjH3VdIWFQ6uepN5fGUdaqeU25sGvLTJo/I8Sj
 D1qCgyCisjUHcEMnQ1PtgkUsNTjw5OlzDLuKbvr/25036DQ7UsMVtkA2xneKr1vWzWoS
 qhJRvFkXQf6Bpy6m2vMVJFZ8V4JT3yVOg+S1598OxpthHS2Oec+ft7mC5O6/JlHq6h4c
 9O4OtgGxdeFTbfUVfcHIIs77p/QSSDErKCclWvZ+g6U5UhQPW0H96mnuFmth5tdeybHj
 oRQg==
X-Gm-Message-State: ACrzQf0l8qcfrG6dr6oTuVUiYrAgvB8HeExplXYgoCFMz9gwdjeyu4qF
 Tg2SN25sQRSNHOve1MADVncmOw==
X-Google-Smtp-Source: AMsMyM6U6Jl/QselPPtBXjH1wXtMIO5tCVFJ4WlIMIy8tQU8YdCdrUJ2ONo41djo4/Z0JeXAveEz5w==
X-Received: by 2002:a05:6214:c26:b0:4bb:f330:fe03 with SMTP id
 a6-20020a0562140c2600b004bbf330fe03mr26071983qvd.94.1667566356445; 
 Fri, 04 Nov 2022 05:52:36 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05620a24d100b006fa7b5ea2d1sm2878901qkn.125.2022.11.04.05.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:52:35 -0700 (PDT)
Message-ID: <9badb45b-5e90-6796-061d-4166bc80a564@linaro.org>
Date: Fri, 4 Nov 2022 08:52:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
 <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
 <ee0880ad-0513-ffea-d80a-9eaac3a85c90@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ee0880ad-0513-ffea-d80a-9eaac3a85c90@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 08:34, Dmitry Baryshkov wrote:
> On 03/11/2022 17:03, Krzysztof Kozlowski wrote:
>> On 02/11/2022 19:13, Dmitry Baryshkov wrote:
>>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>>> SM8450 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>>>   .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>>>   2 files changed, 481 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>> new file mode 100644
>>> index 000000000000..b8c508c50bc5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>> @@ -0,0 +1,132 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SM8450 Display DPU
>>> +
>>> +maintainers:
>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> +
>>> +$ref: /schemas/display/msm/dpu-common.yaml#
>>
>> There is no such file and I could not fine any dependency mentioned in
>> cover letter. I guess you miss link to your refactor series?
> 
> Excuse me, yes. However the refactoring should be already a part of 
> linux-next, so I didn't think that I should especially point to it.

Not in yesterday's next.

> 
>> This also means bot won't be able to test it...
> 
> How does bot detects the base commit? Should i use --base? Or does it 
> work on top of linux-next?

I think bot tests on rc1, so even next would not help here. Anyway
that's just a remark that you won't get automated test email.

> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,sm8450-dpu
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: Address offset and size for mdp register set
>>> +      - description: Address offset and size for vbif register set
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: mdp
>>> +      - const: vbif
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Display hf axi clock
>>> +      - description: Display sf axi clock
>>> +      - description: Display ahb clock
>>> +      - description: Display lut clock
>>> +      - description: Display core clock
>>> +      - description: Display vsync clock
>>
>> Drop "clock", less typing.
> 
> Ack
> 
>>
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: bus
>>> +      - const: nrt_bus
>>> +      - const: iface
>>> +      - const: lut
>>> +      - const: core
>>> +      - const: vsync
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
>>> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>> +
>>> +    display-controller@ae01000 {
>>> +        compatible = "qcom,sm8450-dpu";
>>> +        reg = <0x0ae01000 0x8f000>,
>>> +              <0x0aeb0000 0x2008>;
>>> +        reg-names = "mdp", "vbif";
>>> +
>>> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>>> +                <&gcc GCC_DISP_SF_AXI_CLK>,
>>> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>>> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
>>> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>> +        clock-names = "bus",
>>> +                      "nrt_bus",
>>> +                      "iface",
>>> +                      "lut",
>>> +                      "core",
>>> +                      "vsync";
>>> +
>>> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>>> +        assigned-clock-rates = <19200000>;
>>> +
>>> +        operating-points-v2 = <&mdp_opp_table>;
>>> +        power-domains = <&rpmhpd SM8450_MMCX>;
>>> +
>>> +        interrupt-parent = <&mdss>;
>>> +        interrupts = <0>;
>>> +
>>> +        ports {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            port@0 {
>>> +                reg = <0>;
>>> +                dpu_intf1_out: endpoint {
>>> +                    remote-endpoint = <&dsi0_in>;
>>> +                };
>>> +            };
>>> +
>>> +            port@1 {
>>> +                reg = <1>;
>>> +                dpu_intf2_out: endpoint {
>>> +                    remote-endpoint = <&dsi1_in>;
>>> +                };
>>> +            };
>>> +        };
>>> +
>>> +        mdp_opp_table: opp-table {
>>> +            compatible = "operating-points-v2";
>>> +
>>> +            opp-172000000{
>>> +                opp-hz = /bits/ 64 <172000000>;
>>> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
>>> +            };
>>> +
>>> +            opp-200000000 {
>>> +                opp-hz = /bits/ 64 <200000000>;
>>> +                required-opps = <&rpmhpd_opp_low_svs>;
>>> +            };
>>> +
>>> +            opp-325000000 {
>>> +                opp-hz = /bits/ 64 <325000000>;
>>> +                required-opps = <&rpmhpd_opp_svs>;
>>> +            };
>>> +
>>> +            opp-375000000 {
>>> +                opp-hz = /bits/ 64 <375000000>;
>>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>>> +            };
>>> +
>>> +            opp-500000000 {
>>> +                opp-hz = /bits/ 64 <500000000>;
>>> +                required-opps = <&rpmhpd_opp_nom>;
>>> +            };
>>> +        };
>>> +    };
>>> +...
>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>> new file mode 100644
>>> index 000000000000..05c606e6ada3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>> @@ -0,0 +1,349 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SM8450 Display MDSS
>>> +
>>> +maintainers:
>>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> +
>>> +description:
>>> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>>
>> Drop "Device tree bindings for" and rewrite the sentence (e.g. drop "that").
>>
>>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>>> +  bindings of MDSS are mentioned for SM8450 target.
>>
>> Drop last sentence.
>>
>>> +
>>> +$ref: /schemas/display/msm/mdss-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>
>> Drop items.
>>
>>> +      - const: qcom,sm8450-mdss
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Display AHB clock from gcc
>>> +      - description: Display hf axi clock
>>> +      - description: Display sf axi clock
>>> +      - description: Display core clock
>>
>> Drop trailing "clocks" (the first "AHB clock" is ok)
> 
> Hmm, not sure that I understand the difference, but fine with me.

Not much different, but for me AHB is a bus, so "Display AHB from gcc"
suggests a bit gcc provides some bus, but you want bus clock. AXI is
also a bus... so maybe drop clock everywhere.


Best regards,
Krzysztof

