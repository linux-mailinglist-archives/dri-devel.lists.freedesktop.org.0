Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7363C627
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 18:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498010E07F;
	Tue, 29 Nov 2022 17:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E14D10E0A1;
 Tue, 29 Nov 2022 17:08:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85689B816C8;
 Tue, 29 Nov 2022 17:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453C4C433C1;
 Tue, 29 Nov 2022 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669741727;
 bh=nwP34wMNyLh/dnrxlPgAjE1IzJ0FKjOdv1+2hcVAU6I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BuCBo5Xiu9EosfZ2Dg6KNymqrMDa/jo7ob17Fvu/wbLK56N20rzptZaU9Tjx0JPiC
 KG6lF3H6/g7e9yanZI77EVNaAWDtYfBxLjZ9Lif+ouqDVAv2DIMRPkxuBNwRQHTPUP
 hFQWC1ETAPDybzQI9qydARhcPc+A5YKo3z2ILm+YCuZbeWwZpfAcw6hbrU0fWnWNhL
 PxBu+sSHKfAosDXdyUdqfdIDkkcOBI8Q+EylGueMGRr9Zhnhaz9prdhRL6BybP45qz
 va7/OTNN7yiCB3tiCKI/x0R9UcA81BEPXXEYux0RwjktuBb6Ov7uzmhsnkwoIgsSPi
 mMBC9zk77lhtA==
Received: by mail-vs1-f41.google.com with SMTP id p15so6527333vsr.5;
 Tue, 29 Nov 2022 09:08:47 -0800 (PST)
X-Gm-Message-State: ANoB5pnU6Cihuo1LxIpY5Zvl7XKmFpG/mfuih8gxK3gR4/j5fGjKNA7d
 HRRNKyzCTfifrKfZ5W13x+8h3RRvklNde7//Ew==
X-Google-Smtp-Source: AA0mqf5V7e1vsuBZ4ItGOTOOMeBB8gUy1cQEuElpB75MCBg1Cqh2Ja1KGGsHevNK00s6Li03OAangxBv/1OhP9vCwaY=
X-Received: by 2002:a67:f74e:0:b0:3aa:3766:7a23 with SMTP id
 w14-20020a67f74e000000b003aa37667a23mr22326407vso.53.1669741726198; Tue, 29
 Nov 2022 09:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20221124001708.25720-1-a39.skl@gmail.com>
 <20221124001708.25720-2-a39.skl@gmail.com>
In-Reply-To: <20221124001708.25720-2-a39.skl@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 29 Nov 2022 11:08:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkhCScw6Rbp8xiMG23UmRNsApyrexvZPabfjZmVBfD_A@mail.gmail.com>
Message-ID: <CAL_JsqLkhCScw6Rbp8xiMG23UmRNsApyrexvZPabfjZmVBfD_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: add support for SM6115
To: Adam Skladowski <a39.skl@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, phone-devel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Jason Wang <wangborong@cdjrlc.com>,
 Sean Paul <sean@poorly.run>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 6:17 PM Adam Skladowski <a39.skl@gmail.com> wrote:
>
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM6115 platform.
> Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
> Lack of dsi phy supply in example is intended
> due to fact on qcm2290, sm6115 and sm6125
> this phy is supplied via power domain, not regulator.
>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../bindings/display/msm/qcom,sm6115-dpu.yaml |  94 +++++++++
>  .../display/msm/qcom,sm6115-mdss.yaml         | 182 ++++++++++++++++++
>  2 files changed, 276 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
> new file mode 100644
> index 000000000000..4a39a3031409
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6115-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties for SM6115 target
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +$ref: /schemas/display/msm/dpu-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sm6115-dpu
> +
> +  reg:
> +    items:
> +      - description: MDP register set
> +      - description: VBIF register set
> +
> +  reg-names:
> +    items:
> +      - const: mdp
> +      - const: vbif
> +
> +  clocks:
> +    items:
> +      - description: Display AXI
> +      - description: Display AHB
> +      - description: Display core
> +      - description: Display lut
> +      - description: Display rotator
> +      - description: Display vsync
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: iface
> +      - const: core
> +      - const: lut
> +      - const: rot
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
> +    #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    display-controller@5e01000 {
> +        compatible = "qcom,sm6115-dpu";
> +        reg = <0x05e01000 0x8f000>,
> +              <0x05eb0000 0x2008>;
> +        reg-names = "mdp", "vbif";
> +
> +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +        clock-names = "bus", "iface", "core", "lut", "rot", "vsync";
> +
> +        operating-points-v2 = <&mdp_opp_table>;
> +        power-domains = <&rpmpd SM6115_VDDCX>;
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
> +                endpoint {
> +                    remote-endpoint = <&dsi0_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> new file mode 100644
> index 000000000000..a86d7f53fa84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6115-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6115 Display MDSS
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description:
> +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> +  sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> +  are mentioned for SM6115 target.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sm6115-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB clock from gcc
> +      - description: Display AXI clock
> +      - description: Display core clock
> +
> +  iommus:
> +    maxItems: 2
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm6115-dpu
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-ctrl-6g-qcm2290
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,dsi-phy-14nm-2290
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    mdss@5e00000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "qcom,sm6115-mdss";
> +        reg = <0x05e00000 0x1000>;
> +        reg-names = "mdss";
> +        power-domains = <&dispcc MDSS_GDSC>;
> +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +
> +        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        iommus = <&apps_smmu 0x420 0x2>,
> +                 <&apps_smmu 0x421 0x0>;
> +        ranges;
> +
> +        display-controller@5e01000 {
> +            compatible = "qcom,sm6115-dpu";
> +            reg = <0x05e01000 0x8f000>,
> +                  <0x05eb0000 0x2008>;
> +            reg-names = "mdp", "vbif";
> +
> +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +            clock-names = "bus", "iface", "core", "lut", "rot", "vsync";
> +
> +            operating-points-v2 = <&mdp_opp_table>;
> +            power-domains = <&rpmpd SM6115_VDDCX>;
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
> +            };
> +        };
> +
> +        dsi@5e94000 {
> +            compatible = "qcom,dsi-ctrl-6g-qcm2290";
> +            reg = <0x05e94000 0x400>;
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
> +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +            operating-points-v2 = <&dsi_opp_table>;
> +            power-domains = <&rpmpd SM6115_VDDCX>;
> +            phys = <&dsi0_phy>;
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
> +        };
> +
> +        dsi0_phy: phy@5e94400 {
> +            compatible = "qcom,dsi-phy-14nm-2290";

Now that this is in linux-next, there's a warning:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb:
phy@5e94400: 'vcca-supply' is a required property
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml

Perhaps some change in dsi-phy-14nm.yaml.

Rob
