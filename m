Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C43DA77A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157156EDC6;
	Thu, 29 Jul 2021 15:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B476EDC2;
 Thu, 29 Jul 2021 15:23:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso4315227wmp.1; 
 Thu, 29 Jul 2021 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBpQQ4PrkRZY0WtM7KbjU/FjfELe0vopn+N+lTuqMUk=;
 b=Dr+kc8ks6iyXT9LWSb5Du3HdAHPz7RDalBOKm0Og6v/tOp9R0FVfTLQLEb6YjgcFAZ
 OODEOtCXWQbWffIcrKm4DBgFkXgZzYwHrt+TnvY8sHMYbODXN5+AC287YYQ1Ml2myFyc
 lrSos/ncgWbQkBjX/3rJpjjDb/w6OxPEEKcNHNnikoGDo+nLRGD2Lw+wleq+XK+7sWBw
 xn+dBHPBJMl5k0iAstt3pf8RPQLevB6s/P7bjl/Cxbw+u1yMBrE24gQMmZmmeVacKJeS
 a5VfkAXtDy6sJ6hPFJv0pet+bPSamucYCLdgJS/zhsmD74VZ85w4fHPzJiF4Ge1OKqbA
 dyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBpQQ4PrkRZY0WtM7KbjU/FjfELe0vopn+N+lTuqMUk=;
 b=sYrB4l4axmS7oNpWEih0OZ7nKKKVD+SNIzFC+mtHkSt8MHY/3kJJ7S1RRYh0Z9RJ8D
 jSMhErEWAjgTiXv83ZaHiBcuoK0Lv6w/UnQ1WyVtoenX9eXscyaQjEldKwVZsyvEji5e
 VzXZJoZaneaFr5Mm73Gwng9CNiZ8fa44G4dC/WPdn9t5RD77cj5b2g+NXqR7a+jeC5/e
 wZ8bHm1qsdoGdGW0OSbARq7Q56sa1pjy6pS3d7w/tRVBVxDlJp6sbTvbz1QTeD+BlB+S
 SzymnLgXgDCS45YAlYm60kICo1xxKgzFe8zwOJVyLLZrdScC9E8pCef4M4BpzfDG1LN6
 E3wg==
X-Gm-Message-State: AOAM530KEe4hV6zQMnEZboytiqyqIiG4VKfCbp84vexVX4xcGuGXu7mY
 8S8ucL1CgiYsu+hcP/dvPs0BsdzC/toc86ygrww=
X-Google-Smtp-Source: ABdhPJxzPEUgqOVmodbHdeZsVfk006v7VDK8qP5MqAnzI/Dj02PkT1mP2Sz1xjDX1yMh4Lyhth6wY2YnuSQUJxmpC8s=
X-Received: by 2002:a05:600c:4401:: with SMTP id
 u1mr15603401wmn.49.1627572195705; 
 Thu, 29 Jul 2021 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210729200230.v2.1.I110b87677ef16d97397fb7c81c07a16e1f5d211e@changeid>
 <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
In-Reply-To: <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 08:27:25 -0700
Message-ID: <CAF6AEGtv0R=SjwpV7NEX6-4sHTF_CxbqgFXNWN+PT9hJJb7N2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/a6xx: Use rev to identify SKU
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 7:33 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Use rev instead of revn to identify the SKU. This is in
> preparation to the introduction of 7c3 gpu which won't have a
> revn.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 183b9f9..0da1a66 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> -static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
> +static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>  {
>         u32 val = UINT_MAX;
>
> -       if (revn == 618)
> +       if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))

Looks like adreno_cmp_rev() ended up in patch 3/3 when it should have
been in this patch..

But I guess we could also move this into adreno_is_a618() and use that here

BR,
-R

>                 val = a618_get_speed_bin(fuse);
>
>         if (val == UINT_MAX) {
> @@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
>         return (1 << val);
>  }
>
> -static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> -               u32 revn)
> +static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  {
>         u32 supp_hw = UINT_MAX;
>         u16 speedbin;
> @@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>         }
>         speedbin = le16_to_cpu(speedbin);
>
> -       supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
> +       supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
>
>  done:
>         ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> @@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
>
> -       ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
> +       ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>         if (ret) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
>                 return ERR_PTR(ret);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
