Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79E63C588
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A42810E0A9;
	Tue, 29 Nov 2022 16:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC1210E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:47:33 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id b126so1311364oif.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7kXbb2debLj7TyugLurIchRFn9a7ch9x7YBOye0bNKQ=;
 b=pPw8eVEshbxlS7dZ+C2YrNdQbuE8ScN214dLKfVHx0c3Pspn+RGQXlAiAyCTezaUnd
 cXe3ILMLPGQgC82L1tfr/Lu96N5RSXB8zTuNoUIil3UfkkVA5+apqtC85KBaqKM1HA0c
 9VfmyrLNBUtQcrRGBRf9VBvDqySyWai7cfHbL9WH0UgNqv/bxfgpk43RRslbsXi6ujKL
 7zLeo1Tso90JX3Y3vG93u169seNXbbL3e3AMjDfjeMvTJufHf8ivpa8fO13QizIEdGA4
 m99CrJDEoOTOzQiFjggt//KNt4Rjh29ritVadrMoAKLxRWuLhznY3bNhxLU8clTD/LNe
 Wi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kXbb2debLj7TyugLurIchRFn9a7ch9x7YBOye0bNKQ=;
 b=thtVudRV6UW3Q7G3hf7vUTJ7BERMMEAiytPgn1aOUxCA/fa00yRJZGitf35M7Blge7
 0sr6WZVAS93TtBvr4l9vrzWCd5csOiRRH+NqhPTy8pOR3Xc4pGCOV0dYk6IRDAdbtgAv
 ahxeigxMDfj7/h8DSo3GOPrhVIQaO8p3Zk8EHtn0eAsMZRgt45GhI9Su0eUi1Qe1iWsX
 g5+D4t0Df9lJDEDFah70TQ5dkg+9ZlJ76/gJXPjiLfCMre+WzmHmb0mVoppL1hbYlKy2
 kLmYi3dAMCPiGksvUC+OqP6kTGmqpzUdcVyZHsCMUpZ5nZnPBinQtsESTU9O3M6ctbPR
 d5kg==
X-Gm-Message-State: ANoB5pl1JbkcUwaqSyJSFU90n+pZhuxcZ7dP9XEwMjR3tMBP+5tDlqT+
 9gmOxa5lrP4YT6V8/7DLZF4kE6LAvrwJafQRZnX2iw==
X-Google-Smtp-Source: AA0mqf5G0qftXHLnjQxuinsaIkxFnEkbqqyy6UGhWiPGyZWqvQ6KQgoj0Ov4AgxjKvzTfh5xk72Tsjr+YFHqr1Aut+I=
X-Received: by 2002:aca:2801:0:b0:35a:13f4:d875 with SMTP id
 1-20020aca2801000000b0035a13f4d875mr30396280oix.190.1669740451971; Tue, 29
 Nov 2022 08:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-11-robert.foss@linaro.org>
 <dc138171-f7b1-2761-d800-620e85afd6d9@linaro.org>
In-Reply-To: <dc138171-f7b1-2761-d800-620e85afd6d9@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 17:47:21 +0100
Message-ID: <CAG3jFyuC59iX9p9eB7WT0Lx34DszZrwbOSnRyV_X02=TnVs6tg@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: sm8350: Add display system
 nodes
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@somainline.org, quic_vpolimer@quicinc.com,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_khsieh@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Nov 2022 at 14:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 15/11/2022 14:31, Robert Foss wrote:
> > Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> > nodes the display subsystem is configured to support
> > one DSI output.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350.dtsi | 197 ++++++++++++++++++++++++++-
> >   1 file changed, 193 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 434f8e8b12c1..5c98e5cf5ad0 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2020, Linaro Limited
> >    */
> >
> > +#include <dt-bindings/interconnect/qcom,sm8350.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
> >   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> > @@ -2536,14 +2537,201 @@ usb_2_dwc3: usb@a800000 {
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
> > +                     iommus = <&apps_smmu 0x820 0x402>;
> > +
> > +                     status = "disabled";
> > +
> > +                     #address-cells = <2>;
> > +                     #size-cells = <2>;
> > +                     ranges;
> > +
> > +                     mdss_mdp: display-controller@ae01000 {
> > +                             compatible = "qcom,sm8350-dpu";
> > +                             reg = <0 0x0ae01000 0 0x8f000>,
> > +                                   <0 0x0aeb0000 0 0x2008>;
> > +                             reg-names = "mdp", "vbif";
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
> > +                             status = "disabled";
> It doesn't make sense to disable mdp separately, as mdss is essentially
> useless without it.

Ack

>
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
> > +                             mdp_opp_table: opp-table {
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
> I think that was dropped as of late.

Ack

>
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
> > +                     dsi0_phy: phy@ae94400 {
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
> > +                                     compatible = "operating-points-v2";
> > +
> > +                                     opp-187500000 {
> > +                                             opp-hz = /bits/ 64 <187500000>;
> > +                                             required-opps = <&rpmhpd_opp_low_svs>;
> > +                                     };
> > +
> > +                                     opp-300000000 {
> > +                                             opp-hz = /bits/ 64 <300000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs>;
> > +                                     };
> > +
> > +                                     opp-358000000 {
> > +                                             opp-hz = /bits/ 64 <358000000>;
> > +                                             required-opps = <&rpmhpd_opp_svs_l1>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> >               dispcc: clock-controller@af00000 {
> >                       compatible = "qcom,sm8350-dispcc";
> >                       reg = <0 0x0af00000 0 0x10000>;
> >                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> > -                              <0>,
> > -                              <0>,
> > -                              <0>,
> > -                              <0>,
> > +                              <&dsi0_phy 0>, <&dsi0_phy 1>,
> > +                              <0>, <0>,
> >                                <0>,
> >                                <0>;
> >                       clock-names = "bi_tcxo",
> > @@ -2558,6 +2746,7 @@ dispcc: clock-controller@af00000 {
> >                       #power-domain-cells = <1>;
> >
> >                       power-domains = <&rpmhpd SM8350_MMCX>;
> > +                     required-opps = <&rpmhpd_opp_turbo>;
> A turbo vote is required for it to function? Seems a bit high..

Dmitry hit a snag using &rpmhpd_opp_low_svs, so this was a dummy
value. I can't replicate that issue, but am having a conversation with
him off-list about this.

On my sm8350-hdk board &rpmhpd_opp_low_svs is working fine.

>
> Konrad
> >               };
> >
> >               adsp: remoteproc@17300000 {
