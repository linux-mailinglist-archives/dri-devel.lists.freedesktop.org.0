Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79A288C29
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B2B6ED11;
	Fri,  9 Oct 2020 15:05:25 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8550D6ED0E
 for <dri-devel@freedesktop.org>; Fri,  9 Oct 2020 15:05:24 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id y194so5121781vsc.4
 for <dri-devel@freedesktop.org>; Fri, 09 Oct 2020 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
 b=Joaf6MfmCGF25mUhtUk8dw/KXhE9rOyy9cTfuhkZlrJrF5/AOOW+PGSTxiaz7deqDa
 J7icjzTVlWIo0zqGLDB6KJhXPIsrcv6jdY7k1u/VGev5bdPaZJN//YsjneEDCJWWCTCY
 KCh7oNHZcnOKkCwkzJEVqtmjUFyaavX+BdV8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5jmyRhySind9c0afwtQ0KGtByGsUKvjJEoZbk8E1rg=;
 b=RIQKEsQLYTT0Il9jFZEKHXvlaJ1xxC15OeuIK+CntAAjhg1gkbjeycKr078y69xUZi
 vjy3Dc42VA1X0OzypQbuPq4ZEKcPLm/xV9Kn7baxLdRdDd/QeD611BugdrUfQv4E85Lf
 Q9KXrFbgOxyC3rax8vQgt08Mq+mxssxCQ24lk0SuU+8KWQxHyWHfznfPtOqAmwUiUlYH
 oqFewMoyAdnAKnA9KOCFGb4kvKxNYWz6tuJ+gpoyNiYf1hgcK0BFGFQ0BUqGO9w0vqpL
 PykbY2ZLpD9ZAlvvgiQagnM37mFxKVJdc2+iLeIkNIwQYB8IeGSlqdRFJitv6uTdwg0+
 /xJw==
X-Gm-Message-State: AOAM531lVRNEYJ2cotKsx5By9pmsOWE6laugIyI3q8+rMULVCb1dPUvg
 H5Mhq7LLuXeI3WpG5NAhbETDaYm6rOJpjw==
X-Google-Smtp-Source: ABdhPJxVwl5OPBTe/o4mcr3YU8bCi9HOSrznpZ/CmBPzm8d5Zr1E4NzfbEKGl7gseQqzJkP04Ap8bQ==
X-Received: by 2002:a67:ea4e:: with SMTP id r14mr7669227vso.37.1602255922997; 
 Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id t71sm1231971vkb.7.2020.10.09.08.05.22
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id d19so927944vso.10
 for <dri-devel@freedesktop.org>; Fri, 09 Oct 2020 08:05:22 -0700 (PDT)
X-Received: by 2002:a67:bc0d:: with SMTP id t13mr8045062vsn.4.1602255921448;
 Fri, 09 Oct 2020 08:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1602176947-17385-1-git-send-email-akhilpo@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Oct 2020 08:05:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
Message-ID: <CAD=FV=WjWv040TyBaqU8ZAuxGi-YpJ2tsVcUbOV4Htv=_-n8fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Add gpu cooling support
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 8, 2020 at 10:10 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Add cooling-cells property and the cooling maps for the gpu tzones
> to support GPU cooling.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..40d6a28 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * SC7180 SoC device tree source
>   *
> - * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019-20, The Linux Foundation. All rights reserved.
>   */
>
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> @@ -1885,6 +1885,7 @@
>                         iommus = <&adreno_smmu 0>;
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
> +                       #cooling-cells = <2>;

Presumably we should add this to the devicetree bindings, too?


>                         interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;
>                         interconnect-names = "gfx-mem";
> @@ -3825,16 +3826,16 @@
>                 };
>
>                 gpuss0-thermal {
> -                       polling-delay-passive = <0>;
> +                       polling-delay-passive = <100>;

Why did you make this change?  I'm pretty sure that we _don't_ want
this since we're using interrupts for the thermal sensor.  See commit
22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode in
Thermal-zones node").


>                         polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 13>;
>
>                         trips {
>                                 gpuss0_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <95000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "passive";

Matthias probably knows better, but I wonder if we should be making
two passive trip levels like we do with CPU.  IIRC this is important
if someone wants to be able to use this with IPA.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
