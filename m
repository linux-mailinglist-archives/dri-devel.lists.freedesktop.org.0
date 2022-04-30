Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90F516023
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 21:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760510E4FB;
	Sat, 30 Apr 2022 19:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177AA10E4D7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 19:34:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id v4so14150021ljd.10
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UnE+PxMjNQxznrPiP9ilgjlD5E706JH8Np36aK30mBE=;
 b=p98EiB7J4QlUIgrOREYncurzGzla//JE5yJnez9c8jgD7+nW417+QX/+lkiMOQJJVi
 1vwvTByXfSMj26D4vcGc92RzNd4+hJ0SSlh2LOCH5bQGSJyHC1Vm5WasI1uTsMYW+9br
 iZWFrHYjaXMwm9uZ2zCnPXG+/nryDO+R3OhIIIywZyyzT8LmbIvp2PwTsMKwbtQROz0H
 iSsju6ZzK/sa5f5+tsBCk3pZHYo0ftqxd6tLsvNqRGdGzViwCR7X0tgn6nAccFcwswdA
 6xUB1Ujlv7Cx8SOyBWf8U+LOT5LSM5g5eD8nCdy+rooprlHIX68pM57tBeZEyyW1rTQK
 ApsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UnE+PxMjNQxznrPiP9ilgjlD5E706JH8Np36aK30mBE=;
 b=VRC9boq+l7IU/bkLlq8i77BdeN54CJG1la/voRiI14W4MB3Qhumwemz/JKV/B4d2C6
 s5xHEZ7osDPytkO0hqlCga2hoxBF920MSVUWxHA+nsq3bDysrzvnCxRR0EyGXPbfhlNx
 R/5hn5SOCT/cI1E9JNz3SPB4UUdVZwu8adXkPuIBHHQ7FsUkEXFoP9yf1QKlzTxCrSKm
 vGvyluij6Fq6D2MFChMKVbpWa+NSSkguvVCi6tV7S1F8FJoCW0BVtM4lDL1khBhj5XHa
 laQn3LXMkusMf75BjJn2mpMO7N8/fIwkLyPD/hkk6xWD2E6kgmisCr71MsnVdfrcGfvy
 KhzQ==
X-Gm-Message-State: AOAM5316larR/85G8sbRDZuK1EwtDJn4XTEhYN8VsW15dDNq+C8XqHUn
 ufPmwxEIfuARKgLNpi8RfwIHGg==
X-Google-Smtp-Source: ABdhPJzhPLWRpIf0sDXy+U/g999jW8WL53W0lLzW8ieWTJH9ufc+2xKqEUO0f/o3Xup47gQr/iWnnQ==
X-Received: by 2002:a05:651c:549:b0:24f:51da:6e1b with SMTP id
 q9-20020a05651c054900b0024f51da6e1bmr506089ljp.389.1651347240165; 
 Sat, 30 Apr 2022 12:34:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 w24-20020ac24438000000b0047255d2113dsm257255lfl.108.2022.04.30.12.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:33:59 -0700 (PDT)
Message-ID: <7e066b7f-943a-6a5e-7383-a05794d207dc@linaro.org>
Date: Sat, 30 Apr 2022 22:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Add binding for MSM8996 DPU
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220430161529.605843-1-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220430161529.605843-1-konrad.dybcio@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 jamipkettunen@somainline.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/04/2022 19:15, Konrad Dybcio wrote:
> Add yaml binding for MSM8996 DPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>   .../bindings/display/msm/dpu-msm8996.yaml     | 221 ++++++++++++++++++
>   1 file changed, 221 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
> new file mode 100644
> index 000000000000..10b02423224d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8996.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-msm8996.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for MSM8996 target
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@somainline.org>
> +
> +description: |
> +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that
> +  encapsulates sub-blocks like DPU display controller, DSI interfaces, etc.
> +  Device tree bindings of MDSS and DPU are mentioned for MSM8996 target.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,msm8996-mdss

With the unified MDSS driver there is no need to describe a separate 
mdss bindings. Let's skip this part for now.

> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: mdss
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  iommus:
> +    items:
> +      - description: Phandle to mdp_smmu node with SID mask for Hard-Fail port0
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    description: Node containing the properties of DPU.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,msm8996-dpu

Okay. So, this is the most interesting part. Unlike MSM8998, which is 
supported in the mdp5 driver, but was not used in the upstream DTS 
files, for the MSM8996 the MDP5 part is described, used and widely 
tested. And, unfortunately, the bindings use solely the generic 
"qcom,mdp5" compat.

I would suggest the following plan:
- Define a binding using both "qcom,msm8996-dpu" and "qcom,mdp5" 
strings. Make sure that it is fully backwards-compatible with older dts.

- Update msm8996.dtsi to follow new binding.

- Let's have a Kconfig flip switch selecting which driver to be used for 
8996/8998.


> +
> +      reg:
> +        items:
> +          - description: Address offset and size for mdp register set
> +          - description: Address offset and size for vbif register set
> +          - description: Address offset and size for non-realtime vbif register set
> +
> +      reg-names:
> +        items:
> +          - const: mdp
> +          - const: vbif
> +          - const: vbif_nrt
> +
> +      clocks:
> +        items:
> +          - description: Display ahb clock
> +          - description: Display axi clock
> +          - description: Display core clock
> +          - description: Display iommu clock
> +          - description: Display vsync clock
> +
> +      clock-names:
> +        items:
> +          - const: iface
> +          - const: bus
> +          - const: core
> +          - const: iommu
> +          - const: vsync
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +      operating-points-v2: true
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +        description: |
> +          Contains the list of output ports from DPU device. These ports
> +          connect to interfaces that are external to the DPU hardware,
> +          such as DSI, DP etc. Each output port contains an endpoint that
> +          describes how it is connected to an external interface.
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF3 (HDMI)
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description: DPU_INTF1 (DSI0)
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - clocks
> +      - interrupts
> +      - power-domains
> +      - operating-points-v2
> +      - ports
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - power-domains
> +  - clocks
> +  - interrupts
> +  - interrupt-controller
> +  - iommus
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    mdss: display-subsystem@900000 {
> +        compatible = "qcom,msm8996-mdss";
> +        reg = <0x00900000 0x1000>;
> +        reg-names = "mdss";
> +
> +        power-domains = <&mmcc MDSS_GDSC>;
> +
> +        clocks = <&mmcc MDSS_AHB_CLK>, <&mmcc MDSS_MDP_CLK>;
> +        clock-names = "iface", "core";
> +
> +        assigned-clocks = <&mmcc MDSS_MDP_CLK>;
> +        assigned-clock-rates = <300000000>;

This should not be necessary.

> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&mdp_smmu 0>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        display-controller@901000 {
> +            compatible = "qcom,msm8996-dpu";
> +            reg = <0x00901000 0x90000>,
> +                  <0x009b0000 0x1040>,
> +                  <0x009b8000 0x1040>;
> +            reg-names = "mdp", "vbif", "vbif_nrt";
> +
> +            clocks = <&mmcc MDSS_AHB_CLK>,
> +              <&mmcc MDSS_AXI_CLK>,
> +              <&mmcc MDSS_MDP_CLK>,
> +              <&mmcc SMMU_MDP_AXI_CLK>,
> +              <&mmcc MDSS_VSYNC_CLK>;
> +            clock-names = "iface", "bus", "core", "iommu", "vsync";
> +
> +            assigned-clocks = <&mmcc MDSS_MDP_CLK>,
> +                  <&mmcc MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <412500000>, <19200000>;

MDP_CLK here should not be neccessary after Vinod Polimera's patches.

> +
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmpd MSM8996_VDDMX>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                reg = <0>;
> +                dpu_intf3_out: endpoint {
> +                  remote-endpoint = <&hdmi_in>;
> +                };
> +              };
> +
> +              port@1 {
> +                reg = <1>;
> +                dpu_intf1_out: endpoint {
> +                  remote-endpoint = <&dsi0_in>;
> +                };
> +              };
> +            };
> +        };
> +    };
> +...


-- 
With best wishes
Dmitry
