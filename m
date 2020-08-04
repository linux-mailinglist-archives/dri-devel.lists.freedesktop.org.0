Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F423BD65
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 17:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318F6E23B;
	Tue,  4 Aug 2020 15:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4694289F8B;
 Tue,  4 Aug 2020 15:43:11 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id jp10so16396288ejb.0;
 Tue, 04 Aug 2020 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XvDU7ICblMvlU4iZYYabhFUIQmUPVsxNxDRb1FZXmmQ=;
 b=e+67uSIMTJb41hxcWS6ZQmz0qzGJN+L+0LjLuEvxDP1SR0HK+KVh6uL3ACN479ohD3
 DLaWjsW/mWVnl/3x1ojrBejYHb+DM/wjSxscTaohaLbeuJCKGccPBqiFa8g732pJRXUP
 2KVSV9Z++b3X5HJPoDh6XVcCdEJjVDTWwCrdgDICS8KWTRU7O9tNn+K8roCzsUPmarEI
 oVFQSHvmt4HjwSni/SMqATRSdKoCyXEEu02bXcTrRo5SuSdGil4TT4HjFFoCewftRUi4
 8KUaA8nTjECb2DfjErOR1OjXDtcFEdROjk2TbRGxLEPAR3yWHAvbDbQDlz1dbR2WFUw1
 sEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XvDU7ICblMvlU4iZYYabhFUIQmUPVsxNxDRb1FZXmmQ=;
 b=BzAVUZF+RrWFswiGSoAkYN+3Vlct+k7LRR4leQfhkAJThWF2A0DBGlloWXCRjQGvBx
 PRCd7Ynw1weSBVlb0ylCguXZ44Vw+0nXB2TnS16RoZa72b34qF+TuSU6RfoYlswVs+dA
 1ahU1VkcEKpshjSfWuKTEo3jcucltne3e67i7ma/Wta83M3GRO6kF9QPBgq3zFYWnmdv
 H+fQj6aCU0Liypv20c7W2GgUBppjVOhNdSkacZBbANXFr7qx09mZpR2fINeBSIkuoJxY
 fbhVLWwL2sIbH2/gZrdKeVkjcRiCoqX3uwQ8tv4oEwB/a8MdEzkfRSLZNdgKaWRoR9zZ
 4IrQ==
X-Gm-Message-State: AOAM530DZI8kk7J8SfVcsllrjPw3uMNpQdcdgOWXmoiA7uS7WjG0d4lS
 04BaoBfsu1PO4zOcHew83PqaT8LY+jxq7krhCCk=
X-Google-Smtp-Source: ABdhPJyG/9OaPWsq91DUuGc0ZHEkp1Igwsy4OYzy799p9zWx9XbX3KeVYuueq33MKr+f5VDzCNWkOoFl7hDa0Dk2xRI=
X-Received: by 2002:a17:906:f14f:: with SMTP id
 gw15mr21260603ejb.245.1596555789850; 
 Tue, 04 Aug 2020 08:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
 <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1594899334-19772-2-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Aug 2020 08:43:54 -0700
Message-ID: <CAF6AEGu8GG4i1inhjQ11PDeUxEq=4E2ggVm6cL=AfNHbvNuh6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: sc7180: add bus clock to mdp node for
 sc7180 target
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> From: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Move the bus clock to mdp device node,in order
> to facilitate bus band width scaling on sc7180
> target.
>
> The parent device MDSS will not vote for bus bw,
> instead the vote will be triggered by mdp device
> node. Since a minimum vote is required to turn
> on bus clock, move the clock node to mdp device
> from where the votes are requested.
>
> This patch has dependency on the below series
> https://patchwork.kernel.org/patch/11468783/
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 4f2c0d1..31fed6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1510,10 +1510,9 @@
>                         power-domains = <&dispcc MDSS_GDSC>;
>
>                         clocks = <&gcc GCC_DISP_AHB_CLK>,
> -                                <&gcc GCC_DISP_HF_AXI_CLK>,
>                                  <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                                  <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -                       clock-names = "iface", "bus", "ahb", "core";
> +                       clock-names = "iface", "ahb", "core";
>
>                         assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>                         assigned-clock-rates = <300000000>;
> @@ -1539,12 +1538,13 @@
>                                       <0 0x0aeb0000 0 0x2008>;
>                                 reg-names = "mdp", "vbif";
>
> -                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                               clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                                          <&dispcc DISP_CC_MDSS_ROT_CLK>,
>                                          <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>                                          <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                                          <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                               clock-names = "iface", "rot", "lut", "core",
> +                               clock-names = "bus", "iface", "rot", "lut", "core",
>                                               "vsync";
>                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                                                   <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
