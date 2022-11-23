Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9A635A3B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D8210E228;
	Wed, 23 Nov 2022 10:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B7D10E220
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:38:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q7so473607ljp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=seTGGYFc6lGg3lbS4N83LE8Bp6OtFcacLrP8CTGacMo=;
 b=YRPv1aLHrpgKQyrWWKzzTrcXxqQfxYuqxsSGd7uEuq981X7hksZLz+TdvyLWfdn03b
 6tjf/0pxtl1DkIn+/I4f3EOVM3m0BqaTnD4az6qT0cdntEcAdK7LlUw2zJIgNvNBwdRj
 K3LPnJQIhvo/IEvR5kEs1mCeh6qrckKtXskuE4x8s5VoFfsCf1H2QzEw2BlgMTgrOS5s
 xz0OTdERJOvpVGfS7LBXdqImjfZ7YDC6FyBTZiiB7mnIjyTSwZjEMxWbTs1fPAi7lNAW
 2vJPP6rntVFftTJdo2BlYNIJxSxLohBEWkdkpMYYe4rwVABXIAU+FuA14/6A68qcsTU9
 hIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=seTGGYFc6lGg3lbS4N83LE8Bp6OtFcacLrP8CTGacMo=;
 b=ay1PBgeF8EnJrruJUkgwlsYBpgJ/wIEcKT30Rmj/Y8reOK1mfxOQOeLExpwSzEAzm9
 R7+olOTPOSi+rzVuf0BCNy00WZNCIUQDVnRmR9xgW15t1pJLHDeEGNpGICqdzXGk/N6w
 tPFxgB+pI6tUWgEs1p3gImnQUa8VY2pZUaLuaHUwpX0/44JjZBXtBYEK11PkvQEYVPkE
 Vrpb5WxFhEL9MnaL7J2P56gc5vD8qmowLX53Yw8tJnDEoK+a9ofDH+gOZFoFjoPzcxW0
 d+RNOJxECwZKTony8uCxLw2iJPkGlnv8xN4yAnKMpACTCHf4CWi1HgmbBqDisyNYa04X
 kb1g==
X-Gm-Message-State: ANoB5pmlrx50iJjfsDSrMGVS0mgHpX/mdJbsS8b7UqOdrH2VrBDIUJU0
 C4POQRSmQUJ2oFmV8+udy14F5Q==
X-Google-Smtp-Source: AA0mqf4uRdVYTYJT9FcrmT33/8lfD0TV26DGvjJ+0jndv4ZddyX2v3XPAYCmZFruP3JnzGP+yTAgKw==
X-Received: by 2002:a2e:9d50:0:b0:26f:db16:4735 with SMTP id
 y16-20020a2e9d50000000b0026fdb164735mr9017224ljj.323.1669199906750; 
 Wed, 23 Nov 2022 02:38:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a302:5f12::1?
 (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
 by smtp.gmail.com with ESMTPSA id
 bt26-20020a056512261a00b004ab2cb8deb5sm2834451lfb.18.2022.11.23.02.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:38:26 -0800 (PST)
Message-ID: <fc3bec1d-8e07-d890-c84c-39b7cec8769d@linaro.org>
Date: Wed, 23 Nov 2022 12:38:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 05/11] dt-bindings: display/msm: add support for the
 display on SM8450
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-6-dmitry.baryshkov@linaro.org>
 <1d32c6d0-c6dc-cd24-ba52-ecb597553ef9@linaro.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1d32c6d0-c6dc-cd24-ba52-ecb597553ef9@linaro.org>
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

On 23/11/2022 12:32, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
>> SM8450 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
>>   .../display/msm/qcom,sm8450-mdss.yaml         | 352 ++++++++++++++++++
>>   2 files changed, 491 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> new file mode 100644
>> index 000000000000..8e25d456e5e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>> @@ -0,0 +1,139 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM8450 Display DPU
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +$ref: /schemas/display/msm/dpu-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm8450-dpu
>> +
>> +  reg:
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display hf axi clock
>> +      - description: Display sf axi clock
>> +      - description: Display ahb clock
>> +      - description: Display lut clock
>> +      - description: Display core clock
>> +      - description: Display vsync clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: bus
>> +      - const: nrt_bus
>> +      - const: iface
>> +      - const: lut
>> +      - const: core
>> +      - const: vsync
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    display-controller@ae01000 {
>> +        compatible = "qcom,sm8450-dpu";
>> +        reg = <0x0ae01000 0x8f000>,
>> +              <0x0aeb0000 0x2008>;
>> +        reg-names = "mdp", "vbif";
>> +
>> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +                <&gcc GCC_DISP_SF_AXI_CLK>,
>> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        clock-names = "bus",
>> +                      "nrt_bus",
>> +                      "iface",
>> +                      "lut",
>> +                      "core",
>> +                      "vsync";
>> +
>> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +        assigned-clock-rates = <19200000>;
>> +
>> +        operating-points-v2 = <&mdp_opp_table>;
>> +        power-domains = <&rpmhpd SM8450_MMCX>;
>> +
>> +        interrupt-parent = <&mdss>;
>> +        interrupts = <0>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dpu_intf1_out: endpoint {
>> +                    remote-endpoint = <&dsi0_in>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dpu_intf2_out: endpoint {
>> +                    remote-endpoint = <&dsi1_in>;
>> +                };
>> +            };
>> +        };
>> +
>> +        mdp_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-172000000{
>> +                opp-hz = /bits/ 64 <172000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <200000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-325000000 {
>> +                opp-hz = /bits/ 64 <325000000>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-375000000 {
>> +                opp-hz = /bits/ 64 <375000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-500000000 {
>> +                opp-hz = /bits/ 64 <500000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>> new file mode 100644
>> index 000000000000..73f8c5caf637
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
>> @@ -0,0 +1,352 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM8450 Display MDSS
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +
>> +description:
>> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> +  bindings of MDSS are mentioned for SM8450 target.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> I don't understand this patchset. Some tags were present, then gone.
> Items was never here, now it is... and you explicitly received such
> feedback long time ago, therefore I suspect you sent or rebased
> something old.
> 
> Go through all previous comments.

Let me check, what went wrong on my side.

> 
>> +      - const: qcom,sm8450-mdss
>> +
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

