Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C6617ECB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8E010E5EC;
	Thu,  3 Nov 2022 14:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E8D10E5F2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 14:03:37 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id x15so1172266qvp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHAYd9v806CHYxGjbJi/tWpPyfof1VR6bfZw5V0SGN8=;
 b=djX1EUWpsYPLPOQttoRQjnZ4MwqP3I9oeB9pKHR8NmUrEO0cbwvxdWgdM9cZcIzp0u
 ROebyE5PWFXfoDCLcJwpg2sGBPiQKG86orzMmzyCQ6M+W9dbs9ePmql5L+8QrQBMpBII
 wU5xDgXfxpPtYLooaSMe8qAvvCsg+EgkwI/UxGhqjPea/Q6z0b4zJ2/x2ezyjmFcw9zG
 91+0+FTCLTbpffKBm9yhKNLFj9oW27m7lTS9i6O2VqSiCXgaRQ1vfpjh+/jy0DyLcnw7
 fvDnp8Vr3/G4S5tNsDn8scO5/J9bpcGPlXggs2/RHwuKOqpfwC0m9wx8R/FB9dmXW2GI
 2m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHAYd9v806CHYxGjbJi/tWpPyfof1VR6bfZw5V0SGN8=;
 b=0zmuzGSJZIzLSIYaUq1YysBdZJrM3b3PAnHKXcLPYSOAu8xi5yZSj192Cy97FXgxO0
 M1QWacda0aqtzqDYSSrFr0a4BxMkjNINMAUCxleKsug2+tRhY30RjifuC+uoh78iZs/f
 5XaRe31x0Wk6Lu/27xvEHdu4zdqvM3wYT8Hrg3gYpmEgsd2VhxgvNRPoTJFN3SN8gTIT
 9yvzDNGEzAs6bxSu4xkctPufRhwPtrU1TxnuzhldM3y8yxoNtH0qZQ3HhzFbbZvhXA8R
 +ynwkTuwh/LTpDDyeARxvoPQjUuxl2SrAm7D2XeBRysjn5xY9go2lCbhlmtBScUNuMfo
 dung==
X-Gm-Message-State: ACrzQf1+yNdlKACfyj1OwyVNyzGngjtg9uQUkD+RrO7IWAiFml4YySwn
 bWZn684FcLEA5qlmSz1ibhNIjQ==
X-Google-Smtp-Source: AMsMyM52xpyvoyN9D6luNsPa1lr9VyMio+bUKMfR5s6jFKIXz6gt9D3Uhqks8mwAhi7q94kMRG3ofg==
X-Received: by 2002:a05:6214:2b0b:b0:4bc:27a3:f43f with SMTP id
 jx11-20020a0562142b0b00b004bc27a3f43fmr6937438qvb.8.1667484216984; 
 Thu, 03 Nov 2022 07:03:36 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 bl12-20020a05620a1a8c00b006ed61f18651sm839183qkb.16.2022.11.03.07.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 07:03:35 -0700 (PDT)
Message-ID: <bcc246a0-d682-33db-35d9-7738922756c0@linaro.org>
Date: Thu, 3 Nov 2022 10:03:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-4-dmitry.baryshkov@linaro.org>
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

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
>  .../display/msm/qcom,sm8450-mdss.yaml         | 349 ++++++++++++++++++
>  2 files changed, 481 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> new file mode 100644
> index 000000000000..b8c508c50bc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
> @@ -0,0 +1,132 @@
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

There is no such file and I could not fine any dependency mentioned in
cover letter. I guess you miss link to your refactor series?

This also means bot won't be able to test it...

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

Drop "clock", less typing.

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
> index 000000000000..05c606e6ada3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> @@ -0,0 +1,349 @@
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

Drop "Device tree bindings for" and rewrite the sentence (e.g. drop "that").

> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SM8450 target.

Drop last sentence.

> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: qcom,sm8450-mdss

> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock

Drop trailing "clocks" (the first "AHB clock" is ok)

> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2

You need specific names here.

> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8450-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-5nm-8450
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

