Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4A4C0375
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 21:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CEF10E67C;
	Tue, 22 Feb 2022 20:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A8B10E66F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 20:58:07 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id x193so16032951oix.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 12:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NynQNF0vX996pWM8oXRiHAyv1zn8urGitpw21EUF3Ig=;
 b=L/8fx6WNUMxviiyfdvx+MGczbT7qrRWXltvUI3yYAlhX786QC8OveavbrQQljj6iAB
 XSYVJXmNJhCpKFngP93KQCqgOXuVJ8JuEiIX2Pa3TYI46TQVRX7lavz7/HA9pcZ/GRwr
 Pazm7NAEKcHpghc7LdbcTZgvieufT8c5NUjQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NynQNF0vX996pWM8oXRiHAyv1zn8urGitpw21EUF3Ig=;
 b=zk7lx6XOjqeBz1A4RnJPYoeDyYnf3J794ObtNq5pLNepp6s00MnXR6wTaaOr7wqKeU
 LFkkrsqZtCPhkrt8o3VumPyrmuSSCgAFbxyilOxFmrwiRywyTf0Foj9roanSONp/eSRM
 eLsx7piaemUKgfEWHTwVx+QWpQH0OrCw1PaMx+Ssk8B+8Frz6emIncOZTBtq78e+yqjZ
 ACD23urpkXV/5fsl/2qVMGeE1hqgXw7SV1KNv3nshQipFisnghvBGL0b+LyolKZWA+4/
 FS9AaUffnzQfYrXovKoHjqIRqruV+k6MBVXxuXZutwrjPo2eafc4Iw+95q4r7bOB3yYL
 qhEA==
X-Gm-Message-State: AOAM532DyXBRx/XThBWX8g1o+MsozNr0yYX9nqpfbJMayY8y5HvfOxuQ
 9n6LPAis3ZkWjD1KwwZeNMI/cCfVy1bXo2ftFYkGww==
X-Google-Smtp-Source: ABdhPJx6fQYRY7rvcoUFumSJbC7mrI8sA642kTB5r6LSvTKI5ctWF6uGfP0c5mRHN4PAc2LCLE3717+B+ntjiMevFFI=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr2943846oiw.112.1645563486853; Tue, 22
 Feb 2022 12:58:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Feb 2022 20:58:06 +0000
MIME-Version: 1.0
In-Reply-To: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1645449126-17718-1-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Feb 2022 20:58:06 +0000
Message-ID: <CAE-0n507XcYRz4=Uw-K37kPsLRqi_gN2L9y1wcu_X-UJP+6ySg@mail.gmail.com>
Subject: Re: [v1] arm64/dts/qcom/sc7280: update mdp clk to max supported value
 to support higher refresh rates
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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
Cc: dmitry.baryshkov@linaro.org, quic_kalyant@quicinc.com,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-21 05:12:06)
> Panels with higher refresh rate will need mdp clk above 300Mhz.
> Select max frequency for mdp clock during bootup, dpu driver will
> scale down the clock as per usecase when first update from the framework is received.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Please add a Fixes tag.

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index baf1653..7af96fc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2895,7 +2895,7 @@
>                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
>                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> -                               assigned-clock-rates = <300000000>,
> +                               assigned-clock-rates = <506666667>,

Why not simply remove the clock assignment and set the rate based on the
OPP when the driver probes?

>                                                         <19200000>,
>                                                         <19200000>;
>                                 operating-points-v2 = <&mdp_opp_table>;
