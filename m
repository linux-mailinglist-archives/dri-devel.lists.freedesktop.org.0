Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B2144D82
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8FD6F40F;
	Wed, 22 Jan 2020 08:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBDD6EDD7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 23:16:19 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 62so2272551pfu.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:from:cc:subject:to:user-agent:date;
 bh=gk/+cR1Uh1x2DHe/9AsJJHsSZHNN3UqDGvYH0Xb+zh8=;
 b=O79JN3kfznrn5eDqAjPiKLeDDyICkKbjMMxe1z4CkxRlkDvUL25WwtzsL8ATud3/0S
 vIkxXjbW39ptw0hpyird4o0jXonSy2LL5ov8w4SvjmdmvVKMK3OEfiUeikilFqXoamkO
 A8UZj9KyXGoRqivE5Z0YbU+yLPIi0wgQyo89E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:from:cc:subject:to
 :user-agent:date;
 bh=gk/+cR1Uh1x2DHe/9AsJJHsSZHNN3UqDGvYH0Xb+zh8=;
 b=HHcsJ0fQUQeAOlrfCH+tmAVxWydieTFLBx1tNHRXVJqwQoG3Q6Dq6E9MpOR9lyBthL
 0D3R+JrbjTHLZLnMkwUCTjs4XUR9mZp1tQp/T6O9x2qvokPA2CbNVUhDZTiMxJtI55Ox
 4fxk2+p6nCwGVqpDbn8SQ8DiYZ+eUyczTmzftjgF0PSDJyQ+fKV1SBnJL1ST9gyZ7sB4
 nF0ZiwANK19+jQxLST/N8tRrv67BaMVQUV4kQI5X+aVYjp+o79IqFHcIFH7dltrmwvra
 LEpIBrA3kNo51nl2xNshpGz1t05R4Jlb0xKOi9ZqquEA25OSfYrtcZEhYRqE+YQOLm9q
 ve3w==
X-Gm-Message-State: APjAAAUZ/WqSwLAkbyCvR/35doDBB9ygrjvg2h0I7huFhSllZM0oyl9B
 ugcMsNxqvfADuskOJJguRMMeQQ==
X-Google-Smtp-Source: APXvYqzc5YyY9m9Z4aytEaUg9NesrLmumCIMVJQdqT2tTi4c8P468lTNoYuY+PzXEggedpkJhGWNrQ==
X-Received: by 2002:a63:d66:: with SMTP id 38mr7812028pgn.233.1579648578855;
 Tue, 21 Jan 2020 15:16:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id u20sm41961955pgf.29.2020.01.21.15.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:16:18 -0800 (PST)
Message-ID: <5e278642.1c69fb81.5a8db.80b4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <1579621928-18619-1-git-send-email-harigovi@codeaurora.org>
References: <1579621928-18619-1-git-send-email-harigovi@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [v1] arm64: dts: sc7180: add display dt nodes
To: Harigovindan P <harigovi@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date: Tue, 21 Jan 2020 15:16:17 -0800
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Harigovindan P (2020-01-21 07:52:08)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> old mode 100644
> new mode 100755
> index 8011c5f..963f5c1
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1151,6 +1151,131 @@
>                         };
>                 };
>  
> +               mdss: mdss@ae00000 {

Is there a better node name for this? display-subsystem perhaps?

> +                       compatible = "qcom,sc7180-mdss";
> +                       reg = <0 0x0ae00000 0 0x1000>;
> +                       reg-names = "mdss";
> +
> +                       power-domains = <&dispcc MDSS_GDSC>;
> +
> +                       clocks = <&gcc GCC_DISP_AHB_CLK>,
> +                                <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       clock-names = "iface", "gcc_bus", "core";
> +
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +                       assigned-clock-rates = <300000000>;
> +
> +                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <1>;
> +
> +                       iommus = <&apps_smmu 0x800 0x2>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       mdss_mdp: mdp@ae01000 {

Is there a better node name for this? display-controller perhaps? Also,
first reg property is supposed to be the one after the @ sign. In this
case that would be ae00000.

> +                               compatible = "qcom,sc7180-dpu";
> +                               reg = <0 0x0ae00000 0 0x1000>,
> +                                     <0 0x0ae01000 0 0x8f000>,
> +                                     <0 0x0aeb0000 0 0x2008>,
> +                                     <0 0x0af03000 0 0x16>;
> +                               reg-names = "mdss","mdp", "vbif", "disp_cc";

                                                    ^
Nitpick: Add a space here after the comma.

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               clock-names = "iface", "rot", "lut", "core",
> +                                               "vsync";

Nitpick: Tabbing seems weird here. The clocks property is aligned but
not the clock-names.

> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <300000000>,
> +                                                      <19200000>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint = <&dsi0_in>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi0: qcom,mdss_dsi_ctrl0@ae94000 {

Is there a better node name for this? dsi-controller perhaps?

> +                               compatible = "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                       <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                       <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names = "byte",
> +                                              "byte_intf",
> +                                              "pixel",
> +                                              "core",
> +                                              "iface",
> +                                              "bus";

Nitpick: Tabbing is all of here too.

> +
> +                               phys = <&dsi0_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
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
> +                       };
> +
> +                       dsi0_phy: dsi-phy0@ae94400 {

Just call it 'dsi-phy' or 'phy' please. The address differentiates it and
the phandle can call it 0.

> +                               compatible = "qcom,dsi-phy-10nm";
> +                               reg = <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94a00 0 0x1e0>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;

Do you need the XO or reference clk here too? So that the PLL can generate a clk with
the reference clk?

> +                               clock-names = "iface";
> +

Nitpick: Why the extra newline? Please remove.

> +                       };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible = "qcom,sc7180-pdc", "qcom,pdc";
>                         reg = <0 0x0b220000 0 0x30000>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
