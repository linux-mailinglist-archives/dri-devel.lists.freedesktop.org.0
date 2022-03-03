Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760B4CCA4E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F126B10E300;
	Thu,  3 Mar 2022 23:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF2210E300
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 23:51:02 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id bm39so5302778qkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
 b=DFpGnpSMnFmOUvMJOYbl261thgAry2SYgtDsyMBZuLiJDYxlUr+vXHe5DRn1OOPG55
 lbAU5uyEJ6BCRngz3QV/NzOlgo9IdG/lUiQi7nmDxqL9XgwJIVmhdSPBnyODd43C5Hq8
 ztcOXHnG5slmbzAFJ9tFDftjvWJnxU4V/Tvk9whBObB1E75KVBul2XY8XdWshFO4Lp7j
 yDZub7Qd094o4eV03t3BQzIwoffa9QfyD1XaIeHpqqnEeqcp15O3d+fZlyCrSYlD8iI5
 l/lRSc3ayN3yttX+4Ndi7Aw6gvAahTmo0Jbul3oLc+yzqhYgXJWoyjtrumJMmlOeVkhY
 LkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEUDph6pdILfOjFK/V90NsjsmH/ILVmOF+Vdrb+tua8=;
 b=sBZA1QTO+Pug81HUjLgKfzHHGoLKXigikSjhuqoi0ccSbrQIwZGykgQkzIYQg10vlq
 QkADEz6qJWwK066B7jnzeMf0J34LfsgjtlFkqON+sUQsa0BdRqW3H1si/iXEWk3Bx0wZ
 SJ52D0OWYbvvPoQoDfb1MAJql/gtHN7+pSbkTYGp7sd5Ge2ZAV+aP5RvK5ZdC2WaorZ+
 WuVNoLhiErcHnCL7DQFjTFL6UduNTh1IVbcJ/n8TQ85lzHXeD3c5JlaIVPL5USBjXObL
 hk02MpEqWup3rJMfh4w+9wvB8F8wXb2cGjD5rQECTqzlYxqGxKvEX6FrnxFhgcl1rpS5
 rqnQ==
X-Gm-Message-State: AOAM5334Aa4+yOvoNTa4bCWFBSwOdPcXz15I3OA/LGvZSyIYHf0ZC8iU
 OyBUolk8srvlWqtW6kPyviDBvWya1uunPFhBIgUHGQ==
X-Google-Smtp-Source: ABdhPJxO/chGuWgVCSeW611qh1w44gEqrV7Xsc4Oh8x15acfkpz3bzzXTGhRfR1YREAZMdmJovlbjCD2iHuTu/of2xE=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1036802qki.59.1646351461812; Thu, 03
 Mar 2022 15:51:01 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 02:50:50 +0300
Message-ID: <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")

Please remove the Fixes tags from all commits. Otherwise the patches
might be picked up into earlier kernels, which do not have a patch
adding a vote on the MDP clock.

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index fdaf303..2105eb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3164,9 +3164,6 @@
>                                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
>                         clock-names = "iface", "bus", "nrt_bus", "core";
>
> -                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -                       assigned-clock-rates = <460000000>;
> -
>                         interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
> @@ -3191,10 +3188,8 @@
>                                          <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>                                 clock-names = "iface", "bus", "core", "vsync";
>
> -                               assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                               assigned-clock-rates = <460000000>,
> -                                                      <19200000>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                               assigned-clock-rates = <19200000>;
>
>                                 operating-points-v2 = <&mdp_opp_table>;
>                                 power-domains = <&rpmhpd SM8250_MMCX>;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
