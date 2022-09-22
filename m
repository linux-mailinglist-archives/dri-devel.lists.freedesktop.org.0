Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568595E5BD7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE2610E40E;
	Thu, 22 Sep 2022 07:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2186D10E40E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:08:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j16so13175991lfg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=HIneEWLNrsOwwKkykvbdZDo2x825hAMkPSbdu14sbsQ=;
 b=e/sO7dmv45NjajrZnFhIMwiKCKrRw/tA63Xc9KO+sVoTeMSIs/LH1H4x0/tbhZ/Yzw
 h1jc9LmJi6bRQX0MuCD0WHNL0tDzJ0UZgaPs8PgkUtglyrZHARE+ysqS+A/TqkMjhbBf
 wxC+AHL+6tSK9DUzGabGii63Dzx+t541quhKKC18o1Dt2IoFmmpd/aSIsO7b8aRK4/aU
 bmRVNhLRMemZvZxU+jgPMsrqc+a0vS1yajjz6j+o84svos+/0NUPamm6Z7SQgXOfSgc5
 Moo5MiaZPpcLfithSYjvpAQgj60AVV79zLZhDmBmj4ga+GnOUWDF5Fw+C49nAkJJVCxO
 SFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HIneEWLNrsOwwKkykvbdZDo2x825hAMkPSbdu14sbsQ=;
 b=JhtXp98eddCBmU5PHQJNNctwnp1eECUKzZKKKzSEGOTRVH59eogXAMaP+EiM/N2D6y
 eW954zHApIff7H/FjNy0/Egri6MT5mP9CgsCF2cSU3O6LXqGtVIad/2OBCZTdkqttB03
 qUBOb6pUB4um5fPZ/gViSXeDOJ/95fU0zg9Se7pCsWQh5rGMnDEu6kyc5l5K3e5lMkmx
 OZtCPQBa14+tH1UJxBY5LkBHKgTeNXp3C7WswchSGx/s+ZQ/mwPrfL5oAo/ilQvjFdNG
 d6URRFxZzK4KpBUzkot60216cN496LksopVd4d+GyjRdUEJTj19uWDKeQ/2w9h96QRoy
 UD7A==
X-Gm-Message-State: ACrzQf23JuoT9/1s6DJ3ZjruvqkhAoP3cjyfQh1Jz+MQLzYUeTZ0+aHh
 iqATBPGz9jigEwtABetmWOoT5w==
X-Google-Smtp-Source: AMsMyM5iv24VFtkVEF5QdwxlgDfHjm9aiFcSYhwYU/69zqq8E/Mt/lUTFA701rakNtsbRi82MZS2PA==
X-Received: by 2002:a05:6512:6c8:b0:49a:1765:335d with SMTP id
 u8-20020a05651206c800b0049a1765335dmr664831lff.29.1663830492427; 
 Thu, 22 Sep 2022 00:08:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i31-20020a0565123e1f00b00497a191bf23sm782091lfv.299.2022.09.22.00.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:08:11 -0700 (PDT)
Message-ID: <94bc039f-065e-ebfa-e09b-7fdb5f4be89b@linaro.org>
Date: Thu, 22 Sep 2022 09:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-7-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-7-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7180 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Thank you for your patch. There is something to discuss/improve.

> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SC7180 target
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +

missing allOf

> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-dpu
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
> +      - description: Display ahb clock
> +      - description: Display rotator clock
> +      - description: Display lut clock
> +      - description: Display core clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: rot
> +      - const: lut
> +      - const: core
> +      - const: vsync
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sc7180-dpu";
> +        reg = <0x0ae01000 0x8f000>,
> +              <0x0aeb0000 0x2008>;
> +
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus", "iface", "rot", "lut", "core",
> +                      "vsync";
> +
> +        interrupt-parent = <&mdss>;
> +        interrupts = <0>;
> +        power-domains = <&rpmhpd SC7180_CX>;
> +        operating-points-v2 = <&mdp_opp_table>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                endpoint {
> +                    remote-endpoint = <&dp_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> new file mode 100644
> index 000000000000..e507c091b60f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7180 Display MDSS
> +
> +maintainers:
> +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> +  bindings of MDSS are mentioned for SC7180 target.
> +

missing allOf.

> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sc7180-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AHB clock from dispcc
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ahb
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sc7180-dpu
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "qcom,sc7180-mdss";
> +        reg = <0xae00000 0x1000>;
> +        reg-names = "mdss";
> +        power-domains = <&dispcc MDSS_GDSC>;
> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "ahb", "core";
> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "mdp0-mem";
> +
> +        iommus = <&apps_smmu 0x800 0x2>;
> +        ranges;

This should come with full example, so with display-controller child
(unless Rob asked not to?)

> +    };
> +...

Best regards,
Krzysztof

