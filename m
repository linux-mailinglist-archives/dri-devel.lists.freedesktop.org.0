Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 978423F0C5E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 22:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F736E8CA;
	Wed, 18 Aug 2021 20:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148926E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 20:03:11 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so5548685ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ym9Fm7m6sy7H5lKucRZ2VUgiDeDjeE+ZTZ3eJU7aUyo=;
 b=RGbVCrOTkLxQu2zxKW6yFhg7W5vSmAN3IfqwEs7BUS7JBgfw8qXL580OzfpS92Sfrf
 dy0+00BwMrf2PZ531X1BPHjzKL1O/53rEyQ6hVmtHKyffnG4eTjy/4hsLZkfO8oD6SSc
 i5Ty+KBOe4Ukr/MX1bOAwfT4GxEdrDGfFo+Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ym9Fm7m6sy7H5lKucRZ2VUgiDeDjeE+ZTZ3eJU7aUyo=;
 b=BDCVbm+IOizDOCerqlUArjkee0pn+aGIkza+vJ8ajx5TD8CvnZOJGNqo45ooX0E9Tx
 6l4A5/KMdWIWzPp4Zvef2OAqhzA2tXmE/aTffBbbYhaV8gYwTJuC9k0QOI8bYEnKLkpM
 1NGPdFDMnXZ/tGmrwmqVO85zLclc0NuI+UHw+YrwjfZbGUF1gRM4qVPwwSiGDKe57P+W
 yCAbM9fTK7rjBX2htybmSGt85dUPlR+KWl1pURFAoXM2DHVZpsMNeMFKYJYhB/opqRIw
 BF9l/aUeJ1C6zvu4Ml1CJgtnRvVI7rrO93WPURBJChQuwUud/6emvBz7JXKXbDdczBIX
 C30w==
X-Gm-Message-State: AOAM531M8aiN7t/8ijSQj/zSVqkZ7FoTjugjE1H4WM5iN8dh3pvkwT7H
 bC+ndUY/yl6GOSoei01AmprCfDm38H2kGKz6RKYykw==
X-Google-Smtp-Source: ABdhPJzb8BQ8psD7FT3EWZH6alcZfS1YeAhQiKsZQiGQprMq6RUws0JGjUe3Y4BcHP1uewICSj9Imei0g0m5f0WxPLw=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr8532610oti.25.1629316990507;
 Wed, 18 Aug 2021 13:03:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 13:03:10 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 18 Aug 2021 13:03:10 -0700
Message-ID: <CAE-0n504ykozx9Uf=B1zcXP+_EdE2Vqz9k1mzRpcwF9S6YpaFw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, robdclark@gmail.com, bjorn.andersson@linaro.org, 
 khsieh@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robh+dt@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-08-18 03:27:04)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index aadf55d..5be318e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1412,7 +1412,7 @@
>                         reg = <0 0xaf00000 0 0x20000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>, <0>, <0>, <0>, <0>, <0>;
> +                                <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>                                       "dsi0_phy_pll_out_byteclk",
>                                       "dsi0_phy_pll_out_dsiclk",
> @@ -1493,6 +1493,12 @@
>                                                         remote-endpoint = <&dsi0_in>;
>                                                 };
>                                         };

Newline here please.

> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dpu_intf5_out: endpoint {
> +                                                       remote-endpoint = <&edp_in>;
> +                                               };
> +                                       };
>                                 };
>
>                                 mdp_opp_table: mdp-opp-table {
> @@ -1608,6 +1614,101 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       msm_edp: edp@aea0000 {
> +                               status = "disabled";

Please pick a place to put status disabled. I don't know what qcom
maintainers want, but please be consistent.

> +                               compatible = "qcom,sc7280-edp";
> +                               reg = <0 0xaea0000 0 0x200>,
> +                                     <0 0xaea0200 0 0x200>,
> +                                     <0 0xaea0400 0 0xc00>,
> +                                     <0 0xaea1000 0 0x400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <14 IRQ_TYPE_NONE>;

Drop flags.

> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +                               clock-names = "core_xo", "core_ref",
> +                                             "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";

One line per string please.

> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +                               phys = <&edp_phy>;
> +                               phy-names = "dp";
> +
> +                               vdda-1p2-supply = <&vreg_l6b_1p2>;
> +                               vdda-0p9-supply = <&vreg_l10c_0p8>;

Can this be done here? Probably needs to move to the board dts/dtsi
file.

> +                               operating-points-v2 = <&edp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&edp_hot_plug_det>, <&edp_panel_power_on>;
> +
> +                               panel-bklt-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +                               panel-pwm-gpio = <&pm8350c_gpios 8 GPIO_ACTIVE_HIGH>;

Please no panel-bklt-gpio and panel-pwm-gpio properties.

> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               edp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf5_out>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               edp_opp_table: edp-opp-table {

edp_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-160000000 {
> +                                               opp-hz = /bits/ 64 <160000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-270000000 {
> +                                               opp-hz = /bits/ 64 <270000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-540000000 {
> +                                               opp-hz = /bits/ 64 <540000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +
> +                       edp_phy: phy@aec2000 {

Good job on using phy!

> +                               status = "disabled";
> +                               compatible = "qcom,sc7280-edp-phy";
> +                               reg = <0 0xaec2a00 0 0x19c>,
> +                                     <0 0xaec2200 0 0xa0>,
> +                                     <0 0xaec2600 0 0xa0>,
> +                                     <0 0xaec2000 0 0x1c0>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>;
> +                               clock-names = "aux", "cfg_ahb";
> +
> +                               vdda-pll-supply = <&vreg_l6b_1p2>;
> +                               vdda-phy-supply = <&vreg_l10c_0p8>;

Again, still question the ability to put this here vs. in IDP file.

> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +                       };
>                 };
>
>                 pdc: interrupt-controller@b220000 {
> @@ -1704,6 +1805,30 @@
>                                 function = "qup13";
>                         };
>
> +                       edp_hot_plug_det: edp-hot-plug-det {
> +                               pinmux {
> +                                       pins = "gpio60";
> +                                       function = "edp_hot";
> +                               };
> +                               pinconf {
> +                                       pins = "gpio60";
> +                                       bias-pull-down;
> +                                       input-enable;
> +                               };

Move pinconf stuff to board file (and combine nodes as mka stated).

> +                       };
> +
> +                       edp_panel_power_on: edp-panel-power-on {
> +                               pinmux {
> +                                       pins = "gpio80";
> +                                       function = "gpio";
> +                               };
> +                               pinconf {
> +                                       pins = "gpio80";
> +                                       bias-disable;
> +                                       output-high;
> +                               };
> +                       };
> +
>                         sdc1_on: sdc1-on {
>                                 clk {
>                                         pins = "sdc1_clk";
> --
> 2.7.4
>
