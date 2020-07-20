Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27D227A7B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006D76E513;
	Tue, 21 Jul 2020 08:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933F89A16
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 20:22:18 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id a23so8025867pfk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=e/gkrMJkoJ8Gzkw35N54O/4TXm7cpCXE+s3Q+cJcAMo=;
 b=Vr+VO3GgxxJ3XgaUuzjU4jdFPwjbDokN5xrQeUMMfXgwRdTHCHwZTAE2ILc0ue7Ehw
 OgdTqABI7e9qsXUmL+ec3X+iVH3WCreGZ7gGHKH6n8INCwXUMyApeXLPOCjeRnTZTOop
 HQGjVM7mK3DZGLq21/GtNQ9dCCIGDao7lO20o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=e/gkrMJkoJ8Gzkw35N54O/4TXm7cpCXE+s3Q+cJcAMo=;
 b=gffdznrHHJ09mDl8XX/8dB+QHhO2suRHNMGDHgNg9HWJ+GFqTs4tO2e6l6kR0EhLjk
 fx/60RJ92EM7DPvWXtJ1n9YHN6m/B19H6WGq/pEtXKx/1HUH72xiUouzYJcnf7J8Lrxq
 FR/TMcFOR2FSXbjZjJwzBvqF0V8ufLSNI6ZBLhGSdjGRZtLiF+IZ5eLvrS5821uB2Pan
 bs91gviELZ7/NYiAnWsX9h97kKmN5dTkOL6niFuJEW3iHlO0uUuZFf2kytSoTZs53mN/
 +ZSq3aRARPZ2Fr80WJeoEwDTdb/BOW2e4+PytMIyM1QKjp9ldMB3/kBX/3CswyInxCdD
 C/2w==
X-Gm-Message-State: AOAM530XoFg0f4l64Kt5dVFhWSn0Bx5eJfmEVdQG9SXuB6dElZx229e1
 VosUF0h/P9IWeo8oe80QZsRvig==
X-Google-Smtp-Source: ABdhPJwY5+t3cAgBV19SyR9ntol+iXjbmlVfcj+4ZwcCHf/TU9rAdzloIULARI11bkIVcdpT1Twh2g==
X-Received: by 2002:a62:3582:: with SMTP id
 c124mr21220132pfa.288.1595276537552; 
 Mon, 20 Jul 2020 13:22:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id h18sm17980753pfr.186.2020.07.20.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 13:22:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200630195151.347-1-tanmay@codeaurora.org>
References: <20200630195151.347-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add Display Port dt node
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, seanpaul@chromium.org
Date: Mon, 20 Jul 2020 13:22:16 -0700
Message-ID: <159527653610.1987609.18177358790741857860@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: devicetree@vger.kernel.org, Tanmay Shah <tanmay@codeaurora.org>,
 aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, dri-devel@lists.freedesktop.org,
 varar@codeaurora.org, freedreno@lists.freedesktop.org, sam@ravnborg.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-30 12:51:51)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217bb5bf..271d55db62ab 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2440,6 +2447,44 @@ dsi_phy: dsi-phy@ae94400 {
>  
>                                 status = "disabled";
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000{
> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";
> +
> +                               reg = <0 0xae90000 0 0x1400>;

Please use full 8 digits in address, i.e. 0x0ae90000.

> +                               reg-names = "dp_controller";

reg-names is pretty useless here. Please remove it.

> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12 0>;

Please use irq flags instead of 0.

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                               clock-names = "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";
> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&msm_dp 1>;

Why don't we assign both clk parents here (&msm_dp 0) so that we don't
need any clk_set_parent() calls in the code?

> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf0_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dp_out: endpoint { };
> +                                       };
> +                               };
> +                       };
>                 };
>  
>                 dispcc: clock-controller@af00000 {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
