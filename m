Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486853CC340
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 14:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992D26EA6B;
	Sat, 17 Jul 2021 12:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220A6EA66;
 Sat, 17 Jul 2021 12:34:41 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id r135so19450123ybc.0;
 Sat, 17 Jul 2021 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yxvFjHrvKU7kzvjmFY8Hcs9h0Avl3Nz955OLqo32Nos=;
 b=iOB9c9FE+rUdzc5ddAfD23+mhtTHAf8KfrnyrDUOizoazYyE2/hWg/pwPIqJuZjaxg
 i34EoiAYByE+I8msqeJCO6pFoMSEmdbIEOZgvAkd0bTCJOSTlx1XFX36tJykhpNnY7Ys
 aMKQQn/XQddSRvL4BMkwLHhdbe0GqZLB10jibWip2uzoLzR/wKmNT9wbGv3lCMzl8Zfz
 tV6DQ8A77CW+VKlGysKjJRvLvREoX9r3wYFl1SqwKlT6s3pXjaX+gYTSc2uovBs9w3T9
 QxaMg+T4gwunRuY+vzXla6d28yexRybBmFPNsY6SsvPbUVojsTwK9sXUtDnUHFx9e2fM
 B3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yxvFjHrvKU7kzvjmFY8Hcs9h0Avl3Nz955OLqo32Nos=;
 b=eSlqsbeKacXxFP1N1cvnMGvccgWOAccFkJHMJdVyoGK4Io9ycSaqYQAscGymhU79CJ
 sNKzFMs8bK4lm4YCR3BsB6hlVSIl2qxAlLasfJfYibIW2kntBgDs83DghByumhG7gGhP
 qHnjrsXDeW2vp48TDnUNSbByeA1DloLc6kMo5sg2nB/MGqhZbY7SrK3uWKIu7zTGTKa5
 F1SIXT/nnowdvI129exFDq3/C+589vW90XxcQdLnSBtiUoKEjjPk+fDkSm4LQdOtmKPO
 Dgn7Z3DwoUoCIja6wqgckrk4NUgS1CcGRl9SjVj9kLwM9BrHzRQbo5qU74JbnBDU0d7c
 O2bA==
X-Gm-Message-State: AOAM532NXuV+lb0sBFM6JKNX3+zFsQe+8aBJ9CKV2gp0cM3IvmYQdHS1
 hr1NNM0BUJlaFrJN5wjHf9FrNc0OKOtW67xOFDE=
X-Google-Smtp-Source: ABdhPJxWhhRzIMdZenGn+NCiTQsYV/Hc0OAxSsSzXy0XCWD9dqsqKRLwa6EOYZrbaVBqYbrbx87ZnWcd1kU0S/wSJ4Q=
X-Received: by 2002:a25:a0c1:: with SMTP id i1mr19295223ybm.362.1626525280214; 
 Sat, 17 Jul 2021 05:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210716182051.218575-1-marex@denx.de>
In-Reply-To: <20210716182051.218575-1-marex@denx.de>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 17 Jul 2021 20:34:29 +0800
Message-ID: <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
To: Marek Vasut <marex@denx.de>
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
Cc: lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
>
> Instead of requesting two separate clock and then handling them
> separately in various places of the driver, use clk_bulk_*() API.
> This permits handling devices with more than "bus"/"core" clock,
> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
> clock.

I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xilinx
which has mali GPU node with an upstream kernel, where is it?

So what's the relationship between "gpu" clk and "gpu_pp0"/"gpu_pp1"
clk? Do they need to be controlled separately or we can just control the
"gpu" clk? Because the devfreq code just controls a single module clk.

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: lima@lists.freedesktop.org
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
>  drivers/gpu/drm/lima/lima_devfreq.h |  1 +
>  drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
>  drivers/gpu/drm/lima/lima_device.h  |  4 +--
>  4 files changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index 8989e215dfc9..533b36932f79 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
>         struct lima_devfreq *devfreq = &ldev->devfreq;
>         unsigned long irqflags;
>
> -       status->current_frequency = clk_get_rate(ldev->clk_gpu);
> +       status->current_frequency = clk_get_rate(devfreq->clk_gpu);
>
>         spin_lock_irqsave(&devfreq->lock, irqflags);
>
> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
>         struct lima_devfreq *ldevfreq = &ldev->devfreq;
>         struct dev_pm_opp *opp;
>         unsigned long cur_freq;
> -       int ret;
> +       int i, ret;
>
>         if (!device_property_present(dev, "operating-points-v2"))
>                 /* Optional, continue without devfreq */
>                 return 0;
>
> +       /* Find first clock which are not "bus" clock */
> +       for (i = 0; i < ldev->nr_clks; i++) {
> +               if (!strcmp(ldev->clks[i].id, "bus"))
> +                       continue;
> +               ldevfreq->clk_gpu = ldev->clks[i].clk;
> +               break;
> +       }

I'd prefer an explicit name for the required clk name. If some DTS has different
name other than "core" for the module clk (ie. "gpu"), it should be changed to
"core".

> +
> +       if (!ldevfreq->clk_gpu)
> +               return -ENODEV;
> +
>         spin_lock_init(&ldevfreq->lock);
>
>         ret = devm_pm_opp_set_clkname(dev, "core");
> @@ -135,7 +146,7 @@ int lima_devfreq_init(struct lima_device *ldev)
>
>         lima_devfreq_reset(ldevfreq);
>
> -       cur_freq = clk_get_rate(ldev->clk_gpu);
> +       cur_freq = clk_get_rate(ldevfreq->clk_gpu);
>
>         opp = devfreq_recommended_opp(dev, &cur_freq, 0);
>         if (IS_ERR(opp))
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
> index b8e50feaeab6..ffef5c91795d 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.h
> +++ b/drivers/gpu/drm/lima/lima_devfreq.h
> @@ -17,6 +17,7 @@ struct lima_devfreq {
>         struct devfreq *devfreq;
>         struct thermal_cooling_device *cooling;
>         struct devfreq_simple_ondemand_data gov_data;
> +       struct clk *clk_gpu;
>
>         ktime_t busy_time;
>         ktime_t idle_time;
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> index 65fdca366e41..9f7bde7e9d22 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -85,29 +85,23 @@ static int lima_clk_enable(struct lima_device *dev)
>  {
>         int err;
>
> -       err = clk_prepare_enable(dev->clk_bus);
> +       err = clk_bulk_prepare_enable(dev->nr_clks, dev->clks);
>         if (err)
>                 return err;
>
> -       err = clk_prepare_enable(dev->clk_gpu);
> -       if (err)
> -               goto error_out0;
> -
>         if (dev->reset) {
>                 err = reset_control_deassert(dev->reset);
>                 if (err) {
>                         dev_err(dev->dev,
>                                 "reset controller deassert failed %d\n", err);
> -                       goto error_out1;
> +                       goto error;
>                 }
>         }
>
>         return 0;
>
> -error_out1:
> -       clk_disable_unprepare(dev->clk_gpu);
> -error_out0:
> -       clk_disable_unprepare(dev->clk_bus);
> +error:
> +       clk_bulk_disable_unprepare(dev->nr_clks, dev->clks);
>         return err;
>  }
>
> @@ -115,31 +109,23 @@ static void lima_clk_disable(struct lima_device *dev)
>  {
>         if (dev->reset)
>                 reset_control_assert(dev->reset);
> -       clk_disable_unprepare(dev->clk_gpu);
> -       clk_disable_unprepare(dev->clk_bus);
> +       clk_bulk_disable_unprepare(dev->nr_clks, dev->clks);
>  }
>
>  static int lima_clk_init(struct lima_device *dev)
>  {
>         int err;
>
> -       dev->clk_bus = devm_clk_get(dev->dev, "bus");
> -       if (IS_ERR(dev->clk_bus)) {
> -               err = PTR_ERR(dev->clk_bus);
> +       err = devm_clk_bulk_get_all(dev->dev, &dev->clks);
> +       if (err < 1) {
> +               if (err == 0)   /* No clock at all is an error too */
> +                       err = -ENODEV;
>                 if (err != -EPROBE_DEFER)
> -                       dev_err(dev->dev, "get bus clk failed %d\n", err);
> -               dev->clk_bus = NULL;
> +                       dev_err(dev->dev, "get clk failed %d\n", err);
>                 return err;
>         }
>
> -       dev->clk_gpu = devm_clk_get(dev->dev, "core");
> -       if (IS_ERR(dev->clk_gpu)) {
> -               err = PTR_ERR(dev->clk_gpu);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(dev->dev, "get core clk failed %d\n", err);
> -               dev->clk_gpu = NULL;
> -               return err;
> -       }
> +       dev->nr_clks = err;
>
>         dev->reset = devm_reset_control_array_get_optional_shared(dev->dev);
>         if (IS_ERR(dev->reset)) {
> @@ -412,8 +398,10 @@ int lima_device_init(struct lima_device *ldev)
>         INIT_LIST_HEAD(&ldev->error_task_list);
>         mutex_init(&ldev->error_task_list_lock);
>
> -       dev_info(ldev->dev, "bus rate = %lu\n", clk_get_rate(ldev->clk_bus));
> -       dev_info(ldev->dev, "mod rate = %lu", clk_get_rate(ldev->clk_gpu));
> +       for (i = 0; i < ldev->nr_clks; i++) {
> +               dev_info(ldev->dev, "clk %s = %lu Hz\n", ldev->clks[i].id,
> +                        clk_get_rate(ldev->clks[i].clk));
> +       }
>
>         return 0;
>
> diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
> index 41b9d7b4bcc7..de11570c9903 100644
> --- a/drivers/gpu/drm/lima/lima_device.h
> +++ b/drivers/gpu/drm/lima/lima_device.h
> @@ -85,8 +85,8 @@ struct lima_device {
>         int num_pp;
>
>         void __iomem *iomem;
> -       struct clk *clk_bus;
> -       struct clk *clk_gpu;
> +       struct clk_bulk_data *clks;
> +       int nr_clks;
>         struct reset_control *reset;
>         struct regulator *regulator;
>
> --
> 2.30.2
>
