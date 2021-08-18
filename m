Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9693F0C3E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9A6E934;
	Wed, 18 Aug 2021 19:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB866E937
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 19:59:35 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 h7-20020a4ab4470000b0290263c143bcb2so1066689ooo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Kbl2rut4rs05Gb47fn+fLcGDcQB3ZfWsMkd/ogdwojY=;
 b=ayXmpFaVf9gLjyf5iQTDu3yhPbQ1e/R792xuozeUlxwoGEtfu6sNdbYJZsp2T7oaez
 m9oQ/RsByN9xd+yEoKJ21eCLr2hHs5JjDAz1d7+JBr+WsOyTVUIKvQIzeDRohqcybtfP
 fR1xsYuQ0H6YlVnXX1us/atl9xVrC6L0QhsSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Kbl2rut4rs05Gb47fn+fLcGDcQB3ZfWsMkd/ogdwojY=;
 b=h4194LEbkBlRmU/7OBTGwbLcSQi0eb0wWPqrxxGNxY+R3uR2ldwywgHdWdC266NkU0
 lA/W1Uy5KFOcSKlDTaBD5b0Ic6KHpCg2+qR0Yq5ITWjSf8ggJQaaeqt+vyTdejKOu+u3
 6mAAf2UhxGCAskzgj6aMFc/T0pi4QR1GuQP6vAQoY0gXiLcyffDJQ2BY4UAgpNuW/m+q
 LYspkQMCGEbO0PTc6crrR5X+FPVcJJuNbSC57b/15Pp51oVwbj8hh7WKOAhQunImUBJi
 NEW1OJnZcM4enBTevJTANeSQDTgQ1VngGbLg0diUHLOFmrCDvAnW8/nvh+g+5l/Krd2A
 4HrA==
X-Gm-Message-State: AOAM531DZbRhacKlM317lVIrpyLQqTgyIMGpS0JWChPHaQG8iZLhIMxQ
 smngT+aG81Z9GPgeVlJGkegLeAM3GoxQDzBbNYFKMg==
X-Google-Smtp-Source: ABdhPJyGRWBU7UV1cjOTGM+Yo7Up2DBfhglDhGTBusbRPyvM2WJkliQTCdZp58CBulZ9jetWAa/ZNuHvM9ntxKdLKx0=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr8162982ooe.92.1629316774589; 
 Wed, 18 Aug 2021 12:59:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 12:59:34 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 18 Aug 2021 12:59:34 -0700
Message-ID: <CAE-0n52Sc4h9eZDiRPucv2oSj5TH9A00H0mOJfxxs=6aGpObhA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sc7280: Add DSI display nodes
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rajeev Nandan <rajeevny@codeaurora.org>, kalyan_t@codeaurora.org, 
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com, 
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
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

Quoting Krishna Manikandan (2021-08-18 03:27:03)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index fd7ff1c..aadf55d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1507,6 +1519,95 @@
>                                         };
>                                 };
>                         };
> +
> +                       dsi0: dsi@ae94000 {
> +                               compatible = "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;

Drop flags as the #interrupt-cells is 0 for mdss

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               phys = <&dsi_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dsi0_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +
> +                               dsi_opp_table: dsi-opp-table {

dsi_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-187500000 {
> +                                               opp-hz = /bits/ 64 <187500000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-300000000 {
> +                                               opp-hz = /bits/ 64 <300000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-358000000 {
> +                                               opp-hz = /bits/ 64 <358000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_phy: dsi-phy@ae94400 {

phy@ae94400

> +                               compatible = "qcom,sc7280-dsi-phy-7nm";
> +                               reg = <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94900 0 0x280>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface", "ref";
> +
> +                               status = "disabled";
> +                       };
