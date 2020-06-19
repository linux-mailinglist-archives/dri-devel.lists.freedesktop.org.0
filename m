Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDCC200257
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979BC6EC27;
	Fri, 19 Jun 2020 06:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3010B6EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 01:12:50 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id b201so3681401pfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
 b=oLZbVHf8BIG6+THknBsryI8MvBmceKvdaIGFcE3E8GegV/CVRGi6iE+Kwgyq9mrL17
 XRSoTGChHFP9fypFoBBia72WZxyDSkB0DKPHBdJZDUNsFAhLAEFRLc/D+ClLJBVEUj5u
 8TfIW2yPdC0tRHqgM6ZlMpL1HE2kF0GK5OWBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
 b=msXvg0rtnT4o0orj3Imjl+5jv16elSoRMgeS5J33n9Y95GN4EGoOkJAdWXqTzr+SjX
 bpGP67axeROhhwmKX+XMg+rwpaD3YebsTSf5F4SOBCCDGz4dK/JZdItShtEVOUrDrCEU
 PaomRjyYmgbxgIYr/+lK3RL+QR/FUDOYxRwofAwDVZulxvc4mKZ0Z02Zyn155uitRzPB
 ntjaOtTI3fC464nq6BOxRYJ1hieKpxbbw1Knb+pjYuEMtpA2jqF8myu8kRJbIwebIvXd
 1JqyVFnwvwkTm3vbTf4/ahdxiEzVNqoZWcfe7YC2ggNVLpGrd3wd/Y4l0FdBRwyGVuGg
 64DQ==
X-Gm-Message-State: AOAM5320Hl/YMdZh74uaY7uVryJgnMdYA9rd5Tdk4yBOUZ/psu3F+vUD
 qENvBgjaSjzko0XNt93B+OXinw==
X-Google-Smtp-Source: ABdhPJzpkIA9xRXSKhL1HR6SniZnYA3qMlfoJJoj709qP03uEsU3yPapKSC/mT40nipGsCn4VwPPgg==
X-Received: by 2002:a65:614b:: with SMTP id o11mr995414pgv.443.1592529169747; 
 Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id n1sm3622207pjn.24.2020.06.18.18.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200618232113.22687-1-tanmay@codeaurora.org>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, agross@kernel.org
Date: Thu, 18 Jun 2020 18:12:47 -0700
Message-ID: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Cc: devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-18 16:21:13)
> Enable DP driver for sc7180.

Add DP device node on sc7180? This isn't a driver.

> 
> This change depends-on following series:
> https://patchwork.freedesktop.org/series/78583/
> and https://patchwork.freedesktop.org/patch/351990/
> 
> Changes in v2:
> 
> - Add assigned-clocks and assigned-clock-parents
> - Remove cell-index and pixel_rcg
> - Change compatible to qcom,sc7180-dp
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 916401f7e87c..26fe623e3b0f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2216,10 +2216,19 @@ ports {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>  
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint =
> +                                                                <&dsi0_in>;
> +                                               };
> +                                       };
> +
>                                         port@0 {
>                                                 reg = <0>;
> -                                               dpu_intf1_out: endpoint {
> -                                                       remote-endpoint = <&dsi0_in>;
> +                                               dpu_intf0_out: endpoint {
> +                                                       remote-endpoint =
> +                                                                <&dp_in>;
>                                                 };
>                                         };
>                                 };

I thought this wasn't supposed to change? At least according to the
binding it shouldn't be needed.

> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>                         };
>                 };
>  
> +               msm_dp: displayport-controller@ae90000{
> +                       status = "ok";

Please use status = "disabled";

> +                       compatible = "qcom,sc7180-dp";
> +
> +                       reg = <0 0xae90000 0 0x1400>;
> +                       reg-names = "dp_controller";
> +
> +                       interrupt-parent = <&mdss>;

Any reason why this isn't under the mdss node like the other display
device nodes?

> +                       interrupts = <12 0>;
> +
> +                       clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                       clock-names = "core_aux", "ctrl_link",
> +                                     "ctrl_link_iface", "stream_pixel";
> +                       #clock-cells = <1>;
> +                       assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                       assigned-clock-parents = <&msm_dp 1>;
> +
> +                       data-lanes = <0 1>;

This can and should be left to the board files. At the SoC level my
understanding is that there are four lanes possible, so no need to
artificially limit it here.

> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               port@0 {
> +                                       reg = <0>;
> +                                       dp_in: endpoint {
> +                                               remote-endpoint =
> +                                                        <&dpu_intf0_out>;

I'd prefer these were on one line, regardless of the 80 character line
limit/suggestion.

> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       dp_out: endpoint { };
> +                               };
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible = "qcom,sc7180-dispcc";
>                         reg = <0 0x0af00000 0 0x200000>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
