Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693B21BB48
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 18:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64136EC90;
	Fri, 10 Jul 2020 16:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB066EC90;
 Fri, 10 Jul 2020 16:48:33 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id w16so6808047ejj.5;
 Fri, 10 Jul 2020 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AH6BfNEx7NMMgyW4KKGIOyQbMozTPM1cZFNmtLAMXVo=;
 b=itvOTeZzDsSKPmqWJyGD6DG0Zy9j+XU7lRcziqvd3wLRZvRrhacbBuSSAXWVPMYDiP
 O/TOXofNQ0ZEnZAPFUtEfKqH0WhpXRHQQk9dO07qaBzAU4CWsY9rCwMlrhDIsFnL9Cvq
 F24YrLP+euH2FKXaCsq2vIEFHMqDflH4YESs11zJFThC/pbNvW3PM3eHRjYrdX+v5wN/
 kpzlPtzFZLzTg4a2qC7fr4caD2Yu7hQ9cK0trZmaRpj1/9liISYEwf8VslD5Ph3jyMTO
 A+9panmjwkCMCoSArH1xEHAHCijuc1FPox0gRKyWguhTrMyQi2Z1xwg7xYP0k7fZeEcC
 VKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AH6BfNEx7NMMgyW4KKGIOyQbMozTPM1cZFNmtLAMXVo=;
 b=jSi5uz7xvHPQNcCSW5ilC8xNAFEPEVHB//o6+TTT+FM++SXC1zsJWdFUhCfovLeJL+
 1RnrlOggESCNGHkN8JXhF7FXkI6DYACyhvNHCDpAzhn60mqgK9e5f8+nwvwOBdvJ+9w1
 VWFr46bVHgZKjFbJ5TEtAvNH32mVkyEvbqOJiUILA3ddNaEvv5xJNNKaQzuTwBKKkMMk
 JaQ0AZtC61QRIzSGojfSc0KJDqYjrcUH3WRnC976s0JO1X0d4R2Sz/kucybvjFIh2pPZ
 +b3Z1rXJCfP9oUpFlM2pd6UOxzpfDou+98bhGaZVuadh9tmBtJzF4LHnENyMLvAFgzPT
 Gwow==
X-Gm-Message-State: AOAM53135vZ8YBVFB3lAlCd6lJzOehDp0vsY++VjdpgKjUbnpW7BUM9X
 /qtErabW5qIySizyBPzRxOOqwtznQIj4KOeMtSU=
X-Google-Smtp-Source: ABdhPJwDjzzbL451WTm2kBZbNaPGaYstnPw8x3nK3iC9JJrKdS8XZ1xv6MgGnlX4lvBVk3NgQSo97t3LUsAnzPha41A=
X-Received: by 2002:a17:906:7c54:: with SMTP id
 g20mr63237421ejp.460.1594399711917; 
 Fri, 10 Jul 2020 09:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Jul 2020 09:49:04 -0700
Message-ID: <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: enumerate second cursor pipe for external
 interface
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Setup an RGB HW pipe as cursor which can be used on
> secondary interface.
>
> For SC7180 2 HW pipes are enumerated as cursors
> 1 - primary interface
> 2 - secondary interface
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 8f2357d..23061fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -117,10 +117,10 @@
>                 .reg_off = 0x2AC, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>                 .reg_off = 0x2AC, .bit_off = 8},
> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -               .reg_off = 0x2B4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -               .reg_off = 0x2BC, .bit_off = 8},
> +               .reg_off = 0x2B4, .bit_off = 8},
> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +               .reg_off = 0x2C4, .bit_off = 8},

It looks like you shifted the register offset here from 0x2bc to
0x2c4, was that intentional?

BR,
-R

>         },
>  };
>
> @@ -272,10 +272,10 @@
>                 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>                 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>         SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  /*************************************************************
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
