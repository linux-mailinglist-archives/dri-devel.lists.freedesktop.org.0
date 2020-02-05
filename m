Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA400153A09
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B406E22A;
	Wed,  5 Feb 2020 21:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF306E22A;
 Wed,  5 Feb 2020 21:20:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g19so3617159eds.11;
 Wed, 05 Feb 2020 13:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7ctqcNXKJ4J7Rbtx+8HIj89/Qd282lOdjeL/AdHVMA=;
 b=Mhx7s0fjyUSMiVNQu9nnEnqFES3z8zSim8rJaQ7k5ciMv+L7zY7Pi+c9Ob/Jd+EbWP
 bDhAlqaenLiQNmcmB0APeOgF0lDIKMTiiqW7ErsHgU0D7Sl11UANTmvfNH9CLwqlBvuB
 NC5mUkAlJSyHVCul3gQbk23DVVqsf+weFxILl2okeAuyV9bKARLA4dOYOGBKO9WVVeg4
 0en7KmrcNYTIY1R1CYKraZG/yjIcB3wP15RuQaOlAWW2fnoxc59Yr8RlFaQ5U5vQYe99
 tR5+7+8IQ+mk+yJGefymD/BrtIY6O88VB03d5PUIUWLEU7dZKXUL9521K6MJGHHPDNG8
 qTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7ctqcNXKJ4J7Rbtx+8HIj89/Qd282lOdjeL/AdHVMA=;
 b=gLxOeHAB93H8KDySfUbCV4z9KpXy69Yb0xfa5a8nJKZk5UWBY3EGEc3fgYBLx0ZORD
 hW5D4F8d567vAByf0wP/81RuZm2QmNs5kBND26Hg69f54oQm1shaTuDnovBGIuWHIHi1
 zjZwPPre3uQf4vDMxyk3XeWcyUTeACh1wNc6Baafpu+dZivJkWlx7ZKLwh32SZIOVBRp
 rggp22za1qfQPIeC3H/PGhgJFs3f56siMMvRiA+TiqiQv7T5ycjVSuhce+aBlMH+u7kc
 FjoAMEXCYryCgleCITlXWymcFN+QlHuY5m4LKMw3RhjPC8M/Hh65bu0I3DFlnS3DO2UL
 HYFg==
X-Gm-Message-State: APjAAAWHpSmNqTqdtvY+qNArhIQ32k29ttrdxbnEOWl5M8WZNSyPqDNz
 6nbRvpYKZPFE4nBzOfGNPwaCn26osZmshN/bggcGMvTL
X-Google-Smtp-Source: APXvYqw+4BoMeXE7ATmoxBXfP94qPHEx7iBMWM46BCgH3fI3IE7J2zo9bio3AGkU8AnyryBslEZ7nwG2DoXaYG2NRjI=
X-Received: by 2002:aa7:c3c2:: with SMTP id l2mr157256edr.120.1580937621575;
 Wed, 05 Feb 2020 13:20:21 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Feb 2020 13:20:10 -0800
Message-ID: <CAF6AEGuAT77aW+1Vh82oAoNCxSHsNNH5L8aRqsnVFV2CrDGaow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>
Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")

> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..e51c723 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,18 +378,6 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> -       /*
> -        * During a previous slumber, GBIF halt is asserted to ensure
> -        * no further transaction can go through GPU before GPU
> -        * headswitch is turned off.
> -        *
> -        * This halt is deasserted once headswitch goes off but
> -        * incase headswitch doesn't goes off clear GBIF halt
> -        * here to ensure GPU wake-up doesn't fail because of
> -        * halted GPU transactions.
> -        */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>
> --
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
