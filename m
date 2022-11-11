Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F994625E11
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0010E121;
	Fri, 11 Nov 2022 15:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD5710E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 15:16:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id t25so13206921ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v6Gs/ID1PkHJt9qaF0feIbVlL1vWxtF1NS3+YgX1lE4=;
 b=nosVhdrZ31yyqOQSgrkZTZqwjyDLwHqARD0Qm9RNSvo2U64w/MVlFQU7E4/x00l6QN
 dzFEBvwbi3yTAn6MkxlO2842f/jJe9ytNMvhqi2GQhEdUxTYuI3usE49Rd684LGqEYK5
 knC1N67QlLrc6M56rsVdUCTYqjXSKu77snP03HT6uL9b5RD9g2LhVCKnzpQW5AnEqBHG
 tzbko7j2v/y1XpkLuHD5yOEShVbdf9Q2VqQDXEzqZ+FjoFbDLspFJ0xMIr2as6MkbvrQ
 8CTV2tZbASOB334oPxM5G/IE+5WnBbZOm51a9XeFN9e6HmPTUg3pPf3NSDhi4HylLAaH
 ZzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6Gs/ID1PkHJt9qaF0feIbVlL1vWxtF1NS3+YgX1lE4=;
 b=eyj963DW7Nsfuu8/o9y3A/mdLuipZ+J+xKkEMbfoxRQqZ9mJjolu4vY/KVrQe3nVp4
 d4ck6cSElcou6Kou/CVGSdVM2S8TCFqtG+lDiJoPXGGvVhW/Ykv8BtMkZd5Wyq/7Tjrw
 pJvxJcFNuHOs3NNwF8lR2s+0ftnv8KUzx3E/AlHe8TXzIZZTi+8nVXgZpckxL2xSz9IU
 QcmeX3WXXtwoeh37SipZsq1slzed5Po05qIhWReAl/6xQtyBrV37Wju5xAySbBevfvaD
 hf/Rm/WSz5efH9LC7EGA6VsE4nm0DRQrbqv19Vnf7oaDwnEG15SoSE/ZQaGLotslBcJ2
 57+w==
X-Gm-Message-State: ANoB5pnArHt9XmUSCATWV4ydxohDo/4Sq8LZiLhLtI/yebaWv9o2Wi96
 qIrGwbU1J+ixnRzymJgyHSqBXpxBttJLgS7ksxG1hQ==
X-Google-Smtp-Source: AA0mqf4/riTynWThglUiaZqRJm3Z3KgqP5bAAmVMkLt1Hpo0Wn16bNMqYAAHi1WEIO1EOI/4oSEWW9dfy+LMnU87Oh4=
X-Received: by 2002:a17:906:abc6:b0:7ac:db50:90ed with SMTP id
 kq6-20020a170906abc600b007acdb5090edmr2184898ejb.487.1668179809802; Fri, 11
 Nov 2022 07:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-8-robert.foss@linaro.org>
 <c868e55d-b808-0ca9-4e84-baf94c469182@linaro.org>
In-Reply-To: <c868e55d-b808-0ca9-4e84-baf94c469182@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 16:16:38 +0100
Message-ID: <CAG3jFyudDcNFYyCLEJUYHh5cVUd-6dDRTUCT=pR6k+vJpj23+A@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] arm64: dts: qcom: sm8350: Add display system nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Oct 2022 at 00:01, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2022 08:08, Robert Foss wrote:
> > Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> > nodes the display subsystem is configured to support
> > one DSI output.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 196 ++++++++++++++++++++++++++-
> >  1 file changed, 192 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index b6e44cd3b394..eaa3cdee1860 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2020, Linaro Limited
> >   */
> >
> > +#include <dt-bindings/interconnect/qcom,sm8350.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
> >  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> > @@ -2535,14 +2536,200 @@ usb_2_dwc3: usb@a800000 {
> >                       };
> >               };
> >
> > +             mdss: mdss@ae00000 {
> > +                     compatible = "qcom,sm8350-mdss";
> > +                     reg = <0 0x0ae00000 0 0x1000>;
> > +                     reg-names = "mdss";
> > +
> > +                     interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> > +                                     <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> > +                     interconnect-names = "mdp0-mem", "mdp1-mem";
> > +
> > +                     power-domains = <&dispcc MDSS_GDSC>;
> > +                     resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> > +
> > +                     clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                              <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                              <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                              <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +                     clock-names = "iface", "bus", "nrt_bus", "core";
> > +
> > +                     interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <1>;
> > +
> > +                     status = "ok";
>
> No need for this.

Ack, I'll switch to disabled.

>
> > +
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> > +
> > +                     mdss_mdp: mdp@ae01000 {
>
> Node name: display-controller

Ack.

> > +                             compatible = "qcom,sm8350-dpu";
> > +                             reg = <0 0x0ae01000 0 0x8f000>,
> > +                                   <0 0x0aeb0000 0 0x2008>;
> > +                             reg-names = "mdp", "vbif";
> > +                             iommus = <&apps_smmu 0x820 0x402>;
> > +
> > +                             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                                     <&gcc GCC_DISP_SF_AXI_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +                             clock-names = "bus",
> > +                                           "nrt_bus",
> > +                                           "iface",
> > +                                           "lut",
> > +                                           "core",
> > +                                           "vsync";
> > +
> > +                             assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +                             assigned-clock-rates = <19200000>;
> > +
> > +                             operating-points-v2 = <&mdp_opp_table>;
> > +                             power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +                             interrupt-parent = <&mdss>;
> > +                             interrupts = <0>;
> > +
> > +                             status = "ok";
> > +
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +                                             dpu_intf1_out: endpoint {
> > +                                                     remote-endpoint = <&dsi0_in>;
> > +                                             };
> > +                                     };
> > +                             };
> > +
> > +                             mdp_opp_table: mdp-opp-table {
>
> I have doubts that it passes dtbs_checks... opp-table

Ack.

>
> > +                                     compatible = "operating-points-v2";
> > +
> > +                                     opp-200000000 {
> > +                                             opp-hz = /bits/ 64 <200000000>;
> > +                                             required-opps = <&rpmhpd_opp_low_svs>;
> > +                                     };
> > +
> > +                                     opp-300000000 {
> > +                                             opp-hz = /bits/ 64 <300000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs>;
> > +                                     };
> > +
> > +                                     opp-345000000 {
> > +                                             opp-hz = /bits/ 64 <345000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs_l1>;
> > +                                     };
> > +
> > +                                     opp-460000000 {
> > +                                             opp-hz = /bits/ 64 <460000000>;
> > +                                             required-opps = <&rpmhpd_opp_nom>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0: dsi@ae94000 {
> > +                             compatible = "qcom,mdss-dsi-ctrl";
> > +                             reg = <0 0x0ae94000 0 0x400>;
> > +                             reg-names = "dsi_ctrl";
> > +
> > +                             interrupt-parent = <&mdss>;
> > +                             interrupts = <4>;
> > +
> > +                             clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> > +                                      <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                      <&gcc GCC_DISP_HF_AXI_CLK>;
> > +                             clock-names = "byte",
> > +                                           "byte_intf",
> > +                                           "pixel",
> > +                                           "core",
> > +                                           "iface",
> > +                                           "bus";
> > +
> > +                             assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +                                               <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +                             assigned-clock-parents = <&dsi0_phy 0>,
> > +                                                      <&dsi0_phy 1>;
> > +
> > +                             operating-points-v2 = <&dsi_opp_table>;
> > +                             power-domains = <&rpmhpd SM8350_MMCX>;
> > +
> > +                             phys = <&dsi0_phy>;
> > +                             phy-names = "dsi";
> > +
> > +                             status = "disabled";
> > +
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +                                             dsi0_in: endpoint {
> > +                                                     remote-endpoint = <&dpu_intf1_out>;
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg = <1>;
> > +                                             dsi0_out: endpoint {
> > +                                             };
> > +                                     };
> > +                             };
> > +                     };
> > +
> > +                     dsi0_phy: dsi-phy@ae94400 {
>
> Just "phy". I think Dmitry was renaming all of these.

Ack.

>
> > +                             compatible = "qcom,dsi-phy-5nm-8350";
> > +                             reg = <0 0x0ae94400 0 0x200>,
> > +                                   <0 0x0ae94600 0 0x280>,
> > +                                   <0 0x0ae94900 0 0x260>;
> > +                             reg-names = "dsi_phy",
> > +                                         "dsi_phy_lane",
> > +                                         "dsi_pll";
> > +
> > +                             #clock-cells = <1>;
> > +                             #phy-cells = <0>;
> > +
> > +                             clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                                      <&rpmhcc RPMH_CXO_CLK>;
> > +                             clock-names = "iface", "ref";
> > +
> > +                             status = "disabled";
> > +
> > +                             dsi_opp_table: dsi-opp-table {
>
> opp-table

Ack

>
> Run `make dtbs_check`

I had a look after fixing the above and I'm seeing some other issues.
Due to the dts/dt-binding rework that Dmitry is doing, I'll leave some
warnings, which can be addressed once the rework changes have landed.

>
>
> Best regards,
> Krzysztof
>
