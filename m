Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74547B653
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 00:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE8210F394;
	Mon, 20 Dec 2021 23:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13210F394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 23:54:08 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m192so11009684qke.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 15:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ICTB8V4n+9cmca6+x37Ql0fa5KJvA8Kd4xGMSs77tp4=;
 b=GOa3Py2rvoHFE1zmqG4g4VsKavd6FCbMcxB66Q0UHthvWMGSZ4qkosE2WTkfXY5jLj
 GJEsJls1Q8hoJJe0Hz8joPOiyGiwn/He61O6Dpe3Y2sQ6iVAEfduAgGVtDQ3aKJHE+Cf
 CNf42oqdHuyZxsnhBOfuuJuEy0uOszNUBOUyIrrH612CftS0o0hXP8a1a35t3HoCwHAK
 55EDgjLU7QWhMfPUQ3lxpDHgZqZIXdT/wc+PVWVZOt2vshCjWC9xUCTJ6B7WFwZ0dwS9
 TlLRGrJ22LePnO+EgLB9+yPEVV/ZwtWz52I92Hh881azKDNEYhSvkBO35edcz4Ii6Hvs
 dOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ICTB8V4n+9cmca6+x37Ql0fa5KJvA8Kd4xGMSs77tp4=;
 b=jHf2IYYzM7Oxja/+15hAbKQ8pW7W0e2cLUipVwzQUdyEAAUyBZk4BzjKidPJWMrDQh
 EkRPVyuysmwYL5CzIe2SV2CqFooVUTY9Y+25vh8UGE1BIbfoUlct7HI4O2k9eagGkvnm
 vXrTZGevBl1D9MY5dKx3TTzPtmqarf5ASPAh4K/AShl9S+46GburAMuDy8UXBlAs2n72
 +8+zaXRQvSlTc+f4re+FEEkY44WZYOnDlnXzw+p1qnMYqEP15oELlHx9zR/dfAYT6vTi
 LVjlqCbPIw3ZTU9SR75w6YQ5ksqnmE3kf78vuui1NqJ/Zz0D8zi0+U4CrksuzgNs1mDH
 yYPA==
X-Gm-Message-State: AOAM532dfa432My9sqj8WDflC0Xp0z9vCGhUM53WdQDoWpsAcwqBAF9D
 jmA1wASx5iQLNb5Ec3AiCdj9tEccVfsLW4ZJoLY/FQ==
X-Google-Smtp-Source: ABdhPJzCxuuI7T69jGLo8Z9p5gSwkmCeAciC0CgBmGa3lxd+isswddNujRi13+rwrqy40MTb27glmY8K2mKYuRI17Ng=
X-Received: by 2002:ae9:e641:: with SMTP id x1mr432352qkl.59.1640044447562;
 Mon, 20 Dec 2021 15:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20211220184220.86328-1-david@ixit.cz>
In-Reply-To: <20211220184220.86328-1-david@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 02:53:56 +0300
Message-ID: <CAA8EJprqBELsZUCVqppAsNVBzsW3FxQbUCQ=zy_tAVY0SeTPwQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: msm: disp: remove bus from dpu bindings
To: David Heidelberg <david@ixit.cz>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Dec 2021 at 21:42, David Heidelberg <david@ixit.cz> wrote:
>
> Driver and dts has been already adjusted and bus moved out of dpu, let's
> update also dt-bindings.
>
> Fixes warnings as:
> arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: mdss
> @ae00000: clock-names: ['iface', 'core'] is too short
>         From schema: Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>
> Ref: https://lore.kernel.org/all/20210803101657.1072358-1-dmitry.baryshkov@linaro.org/
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml          | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index b4ea7c92fb3d..0dca4b3d66e4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -31,13 +31,11 @@ properties:
>    clocks:
>      items:
>        - description: Display AHB clock from gcc
> -      - description: Display AXI clock
>        - description: Display core clock
>
>    clock-names:
>      items:
>        - const: iface
> -      - const: bus
>        - const: core
>
>    interrupts:
> @@ -160,9 +158,8 @@ examples:
>            power-domains = <&dispcc MDSS_GDSC>;
>
>            clocks = <&gcc GCC_DISP_AHB_CLK>,
> -                   <&gcc GCC_DISP_AXI_CLK>,
>                     <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -          clock-names = "iface", "bus", "core";
> +          clock-names = "iface", "core";
>
>            interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>            interrupt-controller;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
