Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF78148B72
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 16:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD656E3EF;
	Fri, 24 Jan 2020 15:46:22 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F886E3EF
 for <dri-devel@freedesktop.org>; Fri, 24 Jan 2020 15:46:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id j17so2786715edp.3
 for <dri-devel@freedesktop.org>; Fri, 24 Jan 2020 07:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
 b=lIrmGPVnZYQWikeBK2Um2t6CV95XnstHmc5/hdWTSBbcqQ5CgqFjEZepUwga1V8uRE
 /yIPlBlghAA0djsFM9c/79B9/OelTnjo4mPQFTiPVic680JSOYl0MfWimcYzxZb+fvSS
 pWMl3Vpoz9TJubn9J3NhtNc1Dap4gYAHQ6QKkcmaXMadMPdwnzOvZkPr+hx+x+DGsBg/
 tt7Oosf1IH49+t9BdjO/G7jTkIxdZjHAPoaEEV2TUbni/W9/8YAyaryMhyP90vq9GaJG
 JydbbXuvS/h++l/QYitW4TBCw2bfKOkgdP4WXwAuEpRXwjZAZ6r0ZjG+xf23U4SGGRM2
 UqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NE3aiQszngEl/i5B8XOMfRsuYNGxae+vatiEahI26NA=;
 b=cTL0zFwH9jBJgd9Wet0y2MFD2GtMq30d8SW7qDOBaRSH2BFICpqjHY54TrKWctnlvb
 cLtv/K/3UyVIFACG1+iVQ96jfwZGZyQlb2G8vdIT1ai/4fL1WJg1b3aEzZ2FTwvjRlsM
 08oloxrnfZNCRhWen4ZUlmEZ8OJQm0pFayqK4vphPOxaLb7sKlW//lgQPmhw8IiD/NY+
 cxkXKBNF8J0k2CB4zCquzDfvWEV0ghObEyZpz1xKf0TnSIj2iIMkXq+HojbMzMWUnW4D
 d0IErS0F5Rb8xasbqOoaLGd/++1Wrz3AOH7GQQ/0LxFSz/m/CRb7zfn5ZRsHCumD+9ak
 tJtg==
X-Gm-Message-State: APjAAAXYYAaedvBuiFOgvBJnlGriu5+FWV9zmA2HlJ6oKZ1IAhMV+u0D
 m/6GdxjsHipG2LHJXrFVy2PlQsba01I7KZrogWs=
X-Google-Smtp-Source: APXvYqzr/miwHthTdWEaxos07mltjrS+dD/PMEyGO+b11mE7lhcZWdZO16H3hMQzHIhR1oyFyPiQgLEeiW1joLnTaMA=
X-Received: by 2002:a17:906:a44d:: with SMTP id
 cb13mr3333605ejb.258.1579880780744; 
 Fri, 24 Jan 2020 07:46:20 -0800 (PST)
MIME-Version: 1.0
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Jan 2020 07:46:09 -0800
Message-ID: <CAF6AEGtgbNSMnX3Bd6HKoEhViwKj64YkDPkATiqHAY87_gpT2w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank
 configuration
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
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 5:50 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Highest bank bit configuration is different for a618 gpu. Update
> it with the correct configuration which is the reset value incidentally.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Thanks, this fixes the UBWC issues on a618

Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")
Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..536d196 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Select CP0 to always count cycles */
>         gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
>
> -       gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> -       gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       if (adreno_is_a630(adreno_gpu)) {
> +               gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> +               gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> +       }
>
>         /* Enable fault detection */
>         gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
> --
> 2.7.4
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
