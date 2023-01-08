Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD9661AFA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:11:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67D610E21B;
	Sun,  8 Jan 2023 23:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667510E21B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:11:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu8so10457499lfb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pR5KBR9M2a0gR8v5N2Z0tD6kXX63pwaqLo3XajymAx4=;
 b=uNo6cl5acLYsixpxbDlP2+idmOiRR6U7qZYUgj2uX8pr+COEqfRhSvww2djZ59qU28
 FtNQP6ITrQTzoDmXT0oKhU5A/s6JDJtfHow1dYY7wnVEYjO089t4JQGtCl93KHzRKzTS
 o2HoMIjF4GtuErJcUEbv9GwAUDFDEiPGk0fGBpQSm/kHXoXEnXv5znCexkcFdZLnQ16h
 qUrSrtjBUuy6NDz4hMlU432wkrtnTut74koQNCDU/vvzOq8ftN8BPznGcTRZBspceTV4
 5nONvB8xvpIO862KS9Uqx5gvWML+zRGdB+SrWIqKJWmohOVT9cTLWLL+Yr4yuxQ7KvDa
 DKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pR5KBR9M2a0gR8v5N2Z0tD6kXX63pwaqLo3XajymAx4=;
 b=byAm0KpJj61UpsOSiFrwXjat6n/LufoPbRBBO+c4UiYnfcivoYSQq//2pvSL8H5DjI
 PqidLr4nRkhlL9epAi/GzPXKMwPfAgxj5z8apSEUDbs7eOSF9A5RIjWi8G6g8TmySisu
 vaZ560zT17E4dKaeLMaV727RQSi+YX4i9Kh1P/M077OpNJFlMw8iB7FqidB9+DeCt1bN
 s4jCqdBnnXm2uuuiBHXAX1lM6OTOCjcI/Nq+ABSgDDmgP8NqpHG4VN/p9OEBOXO3DWAx
 Kyli8IGNw7ebY3DI5vXHeEf7mbii+obTxWSJYzO5mn3NNJ89vi5Zqycw8zx96My+gybT
 1mwg==
X-Gm-Message-State: AFqh2krn8E+tzaubYfQ00DQskgPbGm2dF1XY1xrXtPreX5hsJp86BfaC
 Vkxx232sYBS8qxsBqqcQONOdXA==
X-Google-Smtp-Source: AMrXdXuS7PgH4C8Q6IPcmrLFNmgDvvRsK5w5b59oSP8Mvlv2lBFn8bFE0xfKXkptLiKjtuZgnB5Muw==
X-Received: by 2002:a05:6512:258b:b0:4b5:b85a:5ba6 with SMTP id
 bf11-20020a056512258b00b004b5b85a5ba6mr18763319lfb.20.1673219493459; 
 Sun, 08 Jan 2023 15:11:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a056512202300b004b097f2c73dsm1274621lfs.253.2023.01.08.15.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:11:32 -0800 (PST)
Message-ID: <d9b3d764-8f37-4504-d5e6-d483b39b15a0@linaro.org>
Date: Mon, 9 Jan 2023 01:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: document the display
 hardware for SM8550
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-2-9ccd7e652fcd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-2-9ccd7e652fcd@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:08, Neil Armstrong wrote:
> Document the MDSS and DPU blocks found on the Qualcomm SM8550
> platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Please split this into two patches: one for mdss, one for dpu.

> ---
>   .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++
>   .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>   2 files changed, 465 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
> new file mode 100644
> index 000000000000..c3d5a98fe3c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8550-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8550 Display DPU
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-dpu
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
> +      - description: Display AHB
> +      - description: Display hf axi
> +      - description: Display MDSS ahb
> +      - description: Display lut
> +      - description: Display core
> +      - description: Display vsync
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
> +    #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8550.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@ae01000 {
> +        compatible = "qcom,sm8550-dpu";
> +        reg = <0x0ae01000 0x8f000>,
> +              <0x0aeb0000 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                <&gcc GCC_DISP_HF_AXI_CLK>,
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
> +        power-domains = <&rpmhpd SM8550_MMCX>;
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
> +            opp-514000000 {
> +                opp-hz = /bits/ 64 <514000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> new file mode 100644
> index 000000000000..71b5b5f75969
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> @@ -0,0 +1,331 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm8550-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8550 Display MDSS
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  SM8550 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8550-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display MDSS AHB
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8550-dpu
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
> +        const: qcom,dsi-phy-4nm-8550

qcom,sm8550-dsi-phy-4nm

> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,sm8550.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,sm8550-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +
> +        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
> +                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>
> +        interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +        power-domains = <&dispcc MDSS_GDSC>;
> +
> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "nrt_bus", "core";
> +
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x1c00 0x2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        display-controller@ae01000 {
> +            compatible = "qcom,sm8550-dpu";
> +            reg = <0x0ae01000 0x8f000>,
> +                  <0x0aeb0000 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                    <&gcc GCC_DISP_HF_AXI_CLK>,
> +                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                    <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                    <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "bus",
> +                          "nrt_bus",
> +                          "iface",
> +                          "lut",
> +                          "core",
> +                          "vsync";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +            assigned-clock-rates = <19200000>;
> +
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmhpd SM8550_MMCX>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&dsi0_in>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf2_out: endpoint {
> +                        remote-endpoint = <&dsi1_in>;
> +                    };
> +                };
> +            };
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-200000000 {
> +                    opp-hz = /bits/ 64 <200000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-325000000 {
> +                    opp-hz = /bits/ 64 <325000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-514000000 {
> +                    opp-hz = /bits/ 64 <514000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        dsi@ae94000 {
> +            compatible = "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae94000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +            operating-points-v2 = <&dsi_opp_table>;
> +            power-domains = <&rpmhpd SM8550_MMCX>;
> +
> +            phys = <&dsi0_phy>;
> +            phy-names = "dsi";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dsi0_out: endpoint {
> +                    };
> +                };
> +            };
> +
> +            dsi_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-187500000 {
> +                    opp-hz = /bits/ 64 <187500000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-300000000 {
> +                    opp-hz = /bits/ 64 <300000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,dsi-phy-4nm-8550";
> +            reg = <0x0ae95000 0x200>,
> +                  <0x0ae95200 0x280>,
> +                  <0x0ae95500 0x400>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +        };
> +
> +        dsi@ae96000 {
> +            compatible = "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae96000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <5>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +                     <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +                              <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +            assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
> +            operating-points-v2 = <&dsi_opp_table>;
> +            power-domains = <&rpmhpd SM8550_MMCX>;
> +
> +            phys = <&dsi1_phy>;
> +            phy-names = "dsi";
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dsi1_in: endpoint {
> +                        remote-endpoint = <&dpu_intf2_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dsi1_out: endpoint {
> +                    };
> +                };
> +            };
> +        };
> +
> +        dsi1_phy: phy@ae96400 {
> +            compatible = "qcom,dsi-phy-4nm-8550";
> +            reg = <0x0ae97000 0x200>,
> +                  <0x0ae97200 0x280>,
> +                  <0x0ae97500 0x400>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +        };
> +    };
> +...
> 

-- 
With best wishes
Dmitry

