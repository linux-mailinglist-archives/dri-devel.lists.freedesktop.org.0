Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF846359FB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 11:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8443A10E21C;
	Wed, 23 Nov 2022 10:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25210E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 10:32:52 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l8so20855211ljh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 02:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gFLf46+XYeldlY4nkKiQt/+sonBGtDvMLHdsO3ftd3Y=;
 b=tJ1oW38tPItN3sO1UT3WiaUNIEbE/Qv51sdZ4Xr4gxzZsMjFUWvjArH2FfZ6oql58R
 3XiHv433f3bAIEmVz5YgaNIPO2T3O3x56+zIDm4XNd/WeeVE8MyrzhdBu0txkuZd3RTR
 vGmvC0JyAL/ETUbuDhZEHNKdwoIOjb6gXSj55ppxIuC/rZEeIKOA2yzBHwpLZgdeDDqM
 lbl9uvLP9w4rrTjxYcaUBYEWKT9nIVicsABTNQDLVExHauESOXyICVzciCUfAN0VpZQD
 tMZ9ZQ7vMWiRkMnIIIeRKkOU6KinrdnFZC1KSrdeqdk+ukxVdEk3uinohinJTh8Ms2gq
 ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFLf46+XYeldlY4nkKiQt/+sonBGtDvMLHdsO3ftd3Y=;
 b=aOf+sC0Bg2RjZWhFDrj3i3aBQEUPUR/d6jarwz4WYW8Kajk3khifHUwUCrYsyaBZK5
 i7tGrp7jnzdwj+x+6ZS6+Um6YY3G9xorYk0pADbDSeRqVlxbmIY2YK4mr7DMtZm3sirX
 PPSFOkbcQqf/jzQBig0tcnpFJ7kqHvL8lMiaeC6Nk+G5ch4NlJ92y1GKIV+4USGHlXar
 A3PzC6eZjlVmv6mizwlFKYmSMZpreKugSnomxWSIJ/UqTq0WapFFWscrzSlWDh/aNNUi
 7lr/qNHklacK+DJbb/rDXL7nERxrbedryU9rGrn8K7T+8wvUg3ZNsSWFgbXzMnk/YGmt
 GLRg==
X-Gm-Message-State: ANoB5pnwjPH78AICCDNpwML/DOtMrc4exhfe9EuH+zH5EgUu5NKZ320U
 RoBK0UkqKMWMU4pV+hzLlk9YhQ==
X-Google-Smtp-Source: AA0mqf4gfB0TP4AT+H5cGdxbuYXABQQCpnMyLcKxDXCWX56c6m80KC3+RdSnTd1JRbXcoWp6/aINQg==
X-Received: by 2002:a2e:3806:0:b0:277:b84:81b6 with SMTP id
 f6-20020a2e3806000000b002770b8481b6mr8334004lja.425.1669199571295; 
 Wed, 23 Nov 2022 02:32:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q3-20020ac25283000000b004b3b2a9f506sm2828122lfm.4.2022.11.23.02.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:32:50 -0800 (PST)
Message-ID: <1d32c6d0-c6dc-cd24-ba52-ecb597553ef9@linaro.org>
Date: Wed, 23 Nov 2022 11:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 05/11] dt-bindings: display/msm: add support for the
 display on SM8450
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-6-dmitry.baryshkov@linaro.org>
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

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 352 ++++++++++++++++++
>  2 files changed, 491 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 


> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> new file mode 100644
> index 000000000000..8e25d456e5e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8450 Display DPU
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8450-dpu
> +
> +  reg:
> +    items:
> +      - description: Address offset and size for mdp register set
> +      - description: Address offset and size for vbif register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display ahb clock
> +      - description: Display lut clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: nrt_bus
> +      - const: iface
> +      - const: lut
> +      - const: core
> +      - const: vsync
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8450-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8450.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8450.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sm8450-dpu";
> +        reg = <0x0ae01000 0x8f000>,
> +              <0x0aeb0000 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                <&gcc GCC_DISP_SF_AXI_CLK>,
> +                <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus",
> +                      "nrt_bus",
> +                      "iface",
> +                      "lut",
> +                      "core",
> +                      "vsync";
> +
> +        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        assigned-clock-rates = <19200000>;
> +
> +        operating-points-v2 = <&mdp_opp_table>;
> +        power-domains = <&rpmhpd SM8450_MMCX>;
> +
> +        interrupt-parent = <&mdss>;
> +        interrupts = <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dpu_intf1_out: endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dpu_intf2_out: endpoint {
> +                    remote-endpoint = <&dsi1_in>;
> +                };
> +            };
> +        };
> +
> +        mdp_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-172000000{
> +                opp-hz = /bits/ 64 <172000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz = /bits/ 64 <200000000>;
> +                required-opps = <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-325000000 {
> +                opp-hz = /bits/ 64 <325000000>;
> +                required-opps = <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-375000000 {
> +                opp-hz = /bits/ 64 <375000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-500000000 {
> +                opp-hz = /bits/ 64 <500000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> new file mode 100644
> index 000000000000..73f8c5caf637
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> @@ -0,0 +1,352 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8450-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8450 Display MDSS
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM8450 target.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:

I don't understand this patchset. Some tags were present, then gone.
Items was never here, now it is... and you explicitly received such
feedback long time ago, therefore I suspect you sent or rebased
something old.

Go through all previous comments.

> +      - const: qcom,sm8450-mdss
> +

Best regards,
Krzysztof

