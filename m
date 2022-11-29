Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DE63BF05
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8525310E3B8;
	Tue, 29 Nov 2022 11:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7E10E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:31:57 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id n205so14845591oib.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qzMu9Xc05+HDDx8CYs/jvTiLWUkjP3dwTnvqfMEidjI=;
 b=dY4ctQ2cdBujNwfdhbQ/zbW5AH8piKqKZf801WZhkLUhA3LHpayUE7z/Tj3NnSRTVA
 /+evM84GPCQFu9DArmTU0vmfWWcMgqy665rvmw/+Hc3JFVUHVXrguxr4b7NT7iqsmJ8s
 M0um5b9XMbzqzSY/9sCQ4k8O9rDMiryNWXDDj5G3vikKgjqnguEOJnaZL1n8e/WQfR5f
 cMZveTkH2I5W95dYhxQDA6zBwcxAy4z6+6XrYlABQhhsh8UKxxD+aqoIlpW1U+FFpn3d
 ndM/i2XvCbqI1XfF8nYAy09U705FliOFEHVLPRQB98pWAsKxVYemkqCJjBstGyjFlGU0
 L6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzMu9Xc05+HDDx8CYs/jvTiLWUkjP3dwTnvqfMEidjI=;
 b=uViucUVmcf/rNqOEzK31ssbMTsBL75Z1RONz8ttqpyWOuH2Y7JTPw59JQeic8YBdRW
 slUK6Sog54wxudmfy+nZDy1fCLvogaBBUiIfS21o2FiOuQizjJRL3S9SdY2ZsuKOxJMk
 JsxJf+VfFfpJ2DrO/Ep2cWTKcKFvkOeFO36uUZcBbjTDf6nIx2MO3LurJ8aTU+c4dxSA
 rFuJLjdHeD8uZDbFMdZxHU2xQ8kIFF0yvp8gAzgWT66KZ3m4ZcHvjpqBAJwOMpyxcSqM
 hZieMwaR+m/d+5Vr/1iE2le+A7Xn/g5Hiv1EhDZfvd211fgw5EAiWbg2KpElOUQxibNN
 yGVA==
X-Gm-Message-State: ANoB5pnmnGU+I6tZEQ4KfIovLpLAR112Bpb3z9c8O/rBM0zXHnBlchb3
 3MFHjT15w5fl0VffenKkOSfwUPMNJoY8lexaq8S9zQ==
X-Google-Smtp-Source: AA0mqf4xjDz3BQdQerAwQuQlG8F9KV63+dw9q49TDA2omJ14IngAWwVT7A8M1jfqvyV4Rueua3cCIWdEajzDFh/73bc=
X-Received: by 2002:aca:5bc4:0:b0:35a:7056:4f9c with SMTP id
 p187-20020aca5bc4000000b0035a70564f9cmr30894338oib.72.1669721517223; Tue, 29
 Nov 2022 03:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20221115111721.891404-1-robert.foss@linaro.org>
 <20221115111721.891404-3-robert.foss@linaro.org>
 <20221115164907.GB1088214-robh@kernel.org>
In-Reply-To: <20221115164907.GB1088214-robh@kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 12:31:46 +0100
Message-ID: <CAG3jFyuBrbdE9wh2Zkgq9Y6Gr33s=P8Y2juh1drHJEHCpipXmA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: display: msm: Add qcom,
 sm8350-mdss binding
To: Rob Herring <robh@kernel.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 quic_kalyant@quicinc.com, loic.poulain@linaro.org, andersson@kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 at 17:49, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 15, 2022 at 12:17:11PM +0100, Robert Foss wrote:
> > Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> > like DPU display controller, DSI etc. Add YAML schema for MDSS device
> > tree bindings
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  .../display/msm/qcom,sm8350-mdss.yaml         | 240 ++++++++++++++++++
> >  1 file changed, 240 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> > new file mode 100644
> > index 000000000000..9a0694853576
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> > @@ -0,0 +1,240 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM8350 Display MDSS
> > +
> > +maintainers:
> > +  - Robert Foss <robert.foss@linaro.org>
> > +
> > +description:
> > +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>
> Drop 'Device tree bindings for '. Describe what this h/w is.

Ack

>
> > +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> > +  bindings of MDSS are mentioned for SM8350 target.
> > +
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,sm8350-mdss
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB clock from gcc
> > +      - description: Display hf axi clock
> > +      - description: Display sf axi clock
> > +      - description: Display core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: bus
> > +      - const: nrt_bus
> > +      - const: core
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    maxItems: 2
>
> Need to define the names.
>
> > +
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,sm8350-dpu
> > +
> > +  "^dsi@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,mdss-dsi-ctrl
> > +
> > +  "^phy@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,dsi-phy-5nm-8350
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> > +    #include <dt-bindings/clock/qcom,rpmh.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interconnect/qcom,sm8350.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    display-subsystem@ae00000 {
> > +        compatible = "qcom,sm8350-mdss";
> > +        reg = <0x0ae00000 0x1000>;
> > +        reg-names = "mdss";
> > +
> > +        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> > +                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> > +        interconnect-names = "mdp0-mem", "mdp1-mem";
> > +
> > +        power-domains = <&dispcc MDSS_GDSC>;
> > +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> > +
> > +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                 <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +        clock-names = "iface", "bus", "nrt_bus", "core";
> > +
> > +        iommus = <&apps_smmu 0x820 0x402>;
> > +
> > +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        display-controller@ae01000 {
> > +            compatible = "qcom,sm8350-dpu";
> > +            reg = <0x0ae01000 0x8f000>,
> > +                  <0x0aeb0000 0x2008>;
> > +            reg-names = "mdp", "vbif";
> > +
> > +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                     <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +            clock-names = "bus",
> > +                          "nrt_bus",
> > +                          "iface",
> > +                          "lut",
> > +                          "core",
> > +                          "vsync";
> > +
> > +            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +            assigned-clock-rates = <19200000>;
> > +
> > +            operating-points-v2 = <&mdp_opp_table>;
> > +            power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +            interrupt-parent = <&mdss>;
> > +            interrupts = <0>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    dpu_intf1_out: endpoint {
> > +                        remote-endpoint = <&dsi0_in>;
> > +                    };
> > +                };
> > +            };
> > +
> > +            mdp_opp_table: opp-table {
> > +                compatible = "operating-points-v2";
> > +
> > +                opp-200000000 {
> > +                    opp-hz = /bits/ 64 <200000000>;
> > +                    required-opps = <&rpmhpd_opp_low_svs>;
> > +                };
> > +
> > +                opp-300000000 {
> > +                    opp-hz = /bits/ 64 <300000000>;
> > +                    required-opps = <&rpmhpd_opp_svs>;
> > +                };
> > +
> > +                opp-345000000 {
> > +                    opp-hz = /bits/ 64 <345000000>;
> > +                    required-opps = <&rpmhpd_opp_svs_l1>;
> > +                };
> > +
> > +                opp-460000000 {
> > +                    opp-hz = /bits/ 64 <460000000>;
> > +                    required-opps = <&rpmhpd_opp_nom>;
> > +                };
> > +            };
> > +        };
> > +
> > +        dsi0: dsi@ae94000 {
> > +            compatible = "qcom,mdss-dsi-ctrl";
> > +            reg = <0x0ae94000 0x400>;
> > +            reg-names = "dsi_ctrl";
> > +
> > +            interrupt-parent = <&mdss>;
> > +            interrupts = <4>;
> > +
> > +            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> > +            clock-names = "byte",
> > +                      "byte_intf",
> > +                      "pixel",
> > +                      "core",
> > +                      "iface",
> > +                      "bus";
> > +
> > +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +                          <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +            assigned-clock-parents = <&dsi0_phy 0>,
> > +                                 <&dsi0_phy 1>;
> > +
> > +            operating-points-v2 = <&dsi_opp_table>;
> > +            power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +            phys = <&dsi0_phy>;
> > +            phy-names = "dsi";
> > +
> > +            ports {
> > +             #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    dsi0_in: endpoint {
> > +                        remote-endpoint = <&dpu_intf1_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    dsi0_out: endpoint {
> > +                    };
> > +                };
> > +            };
> > +        };
> > +
> > +        dsi0_phy: phy@ae94400 {
>
> I assume the phy has its own example somewhere else and its not really
> relevant to this binding. So drop.

Ack.

>
> > +            compatible = "qcom,dsi-phy-5nm-8350";
> > +            reg = <0x0ae94400 0x200>,
> > +                  <0x0ae94600 0x280>,
> > +                  <0x0ae94900 0x260>;
> > +            reg-names = "dsi_phy",
> > +                        "dsi_phy_lane",
> > +                        "dsi_pll";
> > +
> > +            #clock-cells = <1>;
> > +            #phy-cells = <0>;
> > +
> > +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&rpmhcc RPMH_CXO_CLK>;
> > +            clock-names = "iface", "ref";
> > +
> > +            vdds-supply = <&vreg_l5b_0p88>;
> > +        };
> > +    };
> > +...
> > --
> > 2.34.1
> >
> >
