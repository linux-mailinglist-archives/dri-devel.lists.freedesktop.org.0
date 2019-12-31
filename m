Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE312D5DC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 03:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D86E0A1;
	Tue, 31 Dec 2019 02:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B686E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 02:54:32 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id y23so11758572ual.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 18:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H5QlGlfzRatArhTvp8wYudLbOSfRILXy/4Oo8V1qp9w=;
 b=PBD/Sq6hzHU3mW8oASJv+wyxhtEK8/Ks3MPguZWQZ5mbUuwJamPThYg0daZ2GnXRKr
 AAvxfeVIPy3dQ0zwisPh+4sP5CWUEk6fG4k9Nrf4Fe+cQesPYPphXmx8H4NmaA32Lm9W
 EpKRu4211BD5MEbKmDMG9Xpi0EyrUS3oZq0N0QQ4yJoi0oE3Zjt1Rex2LEN61EUUKSOf
 6rFcoNhh051j93TNiGwK1Wz1OB1OQAgya7K5nJ3/Hn8oXDtM6vuUEgTdQvawf9xK7z9N
 fpS8BjGAziPehFYedlr7edmfZVJmQdJ/Cfweh6fOkzo0Jie8FZGSR9bVUqPz9UyVNgy3
 HEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5QlGlfzRatArhTvp8wYudLbOSfRILXy/4Oo8V1qp9w=;
 b=H0M13rx8FGsq1+GaGpe1k8hFL2nm/ewBBgcX0Oru+T5AZFTbonr6xotsp4NIkGnhRC
 IJODI1Kc6c4F0fa1aKRvjJTQ6H+8zTGz0MnbLUOErV0IhQHF2q3Vz8tABfj7UJ5IbFWX
 /gGNGqjgu/pAjxUsWYt/3PRPnfWpreovoJFKekX4BuA/geB6eMs29jK+i8h+wshILSQD
 2ahvi7aald1WtLkyLszMzcOyhTH7i0go4k6iSEMzJ8VKnA962FSS5fZsvSlTmsmYwZ7x
 DpVM3sYe3Y6af2Opp2X9Ucd0knw2xr+mrJuW2aOYopYc52zOsOey3v39NpR+Zq9mPbKe
 ThZA==
X-Gm-Message-State: APjAAAUCKWO5eSF014OG1kmPaKFJlL3Ia3qkLgPHB0WmuHW8On1YiBxn
 9Qbu27aLYRanqMxLp52eFeaMNJe67FU+MhimQ+Q=
X-Google-Smtp-Source: APXvYqzam2q8BimDSYM4zYJvecKA+V12ZBPksmdnkuV8XjBH5ZC5oty4Ov88gpW0CDm7Vw/RDDtCZMV3xUGsuXgUwO8=
X-Received: by 2002:ab0:21cb:: with SMTP id u11mr39565203uan.16.1577760871301; 
 Mon, 30 Dec 2019 18:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 31 Dec 2019 10:54:19 +0800
Message-ID: <CAKGbVbs365C_44p9VyW33n5r2s7VKgOzpZWCZ2rAHZ+f2sic1A@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 28, 2019 at 1:37 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Most platforms with a Mali-400 or Mali-450 GPU also have support for
> changing the GPU clock frequency. Add devfreq support so the GPU clock
> rate is updated based on the actual GPU usage when the
> "operating-points-v2" property is present in the board.dts.
>
> The actual devfreq code is taken from panfrost_devfreq.c and modified so
> it matches what the lima hardware needs:
> - a call to dev_pm_opp_set_clkname() during initialization because there
>   are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
>   the GPU so we need to control it using devfreq.
> - locking when reading or writing the devfreq statistics because (unlike
>   than panfrost) we have multiple PP and GP IRQs which may finish jobs
>   concurrently.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 183 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  17 +++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 244 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>
> diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
> index 571dc369a7e9..cdd24b68b5d4 100644
> --- a/drivers/gpu/drm/lima/Kconfig
> +++ b/drivers/gpu/drm/lima/Kconfig
> @@ -10,5 +10,6 @@ config DRM_LIMA
>         depends on OF
>         select DRM_SCHED
>         select DRM_GEM_SHMEM_HELPER
> +       select PM_DEVFREQ
>         help
>           DRM driver for ARM Mali 400/450 GPUs.
> diff --git a/drivers/gpu/drm/lima/Makefile b/drivers/gpu/drm/lima/Makefile
> index a85444b0a1d4..5e5c29875e9c 100644
> --- a/drivers/gpu/drm/lima/Makefile
> +++ b/drivers/gpu/drm/lima/Makefile
> @@ -14,6 +14,7 @@ lima-y := \
>         lima_sched.o \
>         lima_ctx.o \
>         lima_dlbu.o \
> -       lima_bcast.o
> +       lima_bcast.o \
> +       lima_devfreq.o
>
>  obj-$(CONFIG_DRM_LIMA) += lima.o
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> new file mode 100644
> index 000000000000..a5fd6b8faa77
> --- /dev/null
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> + *
> + * Based on panfrost_devfreq.c:
> + *   Copyright 2019 Collabora ltd.
> + */
> +#include <linux/clk.h>
> +#include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +
> +#include "lima_device.h"
> +#include "lima_devfreq.h"
> +
> +static void lima_devfreq_update_utilization(struct lima_device *ldev)
> +{
> +       unsigned long irqflags;
> +       ktime_t now, last;
> +
> +       if (!ldev->devfreq.devfreq)
> +               return;
> +
> +       spin_lock_irqsave(&ldev->devfreq.lock, irqflags);
> +
> +       now = ktime_get();
> +       last = ldev->devfreq.time_last_update;
> +
> +       if (atomic_read(&ldev->devfreq.busy_count) > 0)
> +               ldev->devfreq.busy_time += ktime_sub(now, last);
> +       else
> +               ldev->devfreq.idle_time += ktime_sub(now, last);
> +
> +       ldev->devfreq.time_last_update = now;
> +
> +       spin_unlock_irqrestore(&ldev->devfreq.lock, irqflags);
> +}
> +
> +static int lima_devfreq_target(struct device *dev, unsigned long *freq,
> +                              u32 flags)
> +{
> +       struct dev_pm_opp *opp;
> +       int err;
> +
> +       opp = devfreq_recommended_opp(dev, freq, flags);
> +       if (IS_ERR(opp))
> +               return PTR_ERR(opp);
> +       dev_pm_opp_put(opp);
> +
> +       err = dev_pm_opp_set_rate(dev, *freq);
> +       if (err)
> +               return err;
> +
> +       return 0;
> +}
> +
> +static void lima_devfreq_reset(struct lima_device *ldev)
> +{
> +       unsigned long irqflags;
> +
> +       spin_lock_irqsave(&ldev->devfreq.lock, irqflags);
> +
> +       ldev->devfreq.busy_time = 0;
> +       ldev->devfreq.idle_time = 0;
> +       ldev->devfreq.time_last_update = ktime_get();
> +
> +       spin_unlock_irqrestore(&ldev->devfreq.lock, irqflags);
> +}
> +
> +static int lima_devfreq_get_dev_status(struct device *dev,
> +                                      struct devfreq_dev_status *status)
> +{
> +       struct lima_device *ldev = dev_get_drvdata(dev);
> +       unsigned long irqflags;
> +
> +       lima_devfreq_update_utilization(ldev);
> +
> +       status->current_frequency = clk_get_rate(ldev->clk_gpu);
> +
> +       spin_lock_irqsave(&ldev->devfreq.lock, irqflags);
> +
> +       status->total_time = ktime_to_ns(ktime_add(ldev->devfreq.busy_time,
> +                                                  ldev->devfreq.idle_time));
> +       status->busy_time = ktime_to_ns(ldev->devfreq.busy_time);
> +
> +       spin_unlock_irqrestore(&ldev->devfreq.lock, irqflags);
> +
> +       lima_devfreq_reset(ldev);
> +
> +       dev_dbg(ldev->dev, "busy %lu total %lu %lu %% freq %lu MHz\n",
> +               status->busy_time, status->total_time,
> +               status->busy_time / (status->total_time / 100),
> +               status->current_frequency / 1000 / 1000);
> +
> +       return 0;
> +}
> +
> +static struct devfreq_dev_profile lima_devfreq_profile = {
> +       .polling_ms = 50, /* ~3 frames */
> +       .target = lima_devfreq_target,
> +       .get_dev_status = lima_devfreq_get_dev_status,
> +};
> +
> +int lima_devfreq_init(struct lima_device *ldev)
> +{
> +       struct thermal_cooling_device *cooling;
> +       struct device *dev = &ldev->pdev->dev;
> +       struct devfreq *devfreq;
> +       struct dev_pm_opp *opp;
> +       unsigned long cur_freq;
> +       int ret;
> +
> +       spin_lock_init(&ldev->devfreq.lock);
> +
> +       ldev->devfreq.opp_table = dev_pm_opp_set_clkname(dev, "core");
> +       if (IS_ERR(ldev->devfreq.opp_table))
> +               return PTR_ERR(ldev->devfreq.opp_table);
> +
> +       ret = dev_pm_opp_of_add_table(dev);
> +       if (ret == -ENODEV) /* Optional, continue without devfreq */
> +               return 0;
> +       else if (ret)
> +               return ret;
> +
> +       lima_devfreq_reset(ldev);
> +
> +       cur_freq = clk_get_rate(ldev->clk_gpu);
> +
> +       opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> +       if (IS_ERR(opp))
> +               return PTR_ERR(opp);
> +
> +       lima_devfreq_profile.initial_freq = cur_freq;
> +       dev_pm_opp_put(opp);
> +
> +       devfreq = devm_devfreq_add_device(dev, &lima_devfreq_profile,
> +                                         DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
> +       if (IS_ERR(devfreq)) {
> +               dev_err(dev, "Couldn't initialize GPU devfreq\n");
> +               dev_pm_opp_of_remove_table(dev);
> +               return PTR_ERR(devfreq);
> +       }
> +
> +       ldev->devfreq.devfreq = devfreq;
> +
> +       cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
> +       if (IS_ERR(cooling))
> +               dev_info(dev, "Failed to register cooling device\n");
> +       else
> +               ldev->devfreq.cooling = cooling;
> +
> +       return 0;
> +}
> +
> +void lima_devfreq_fini(struct lima_device *ldev)
> +{
> +       if (ldev->devfreq.cooling)
> +               devfreq_cooling_unregister(ldev->devfreq.cooling);
> +
> +       if (ldev->devfreq.opp_table) {
> +               dev_pm_opp_put_clkname(ldev->devfreq.opp_table);
> +               ldev->devfreq.opp_table = NULL;
> +       }
> +
> +       dev_pm_opp_of_remove_table(&ldev->pdev->dev);
> +}
> +
> +void lima_devfreq_record_busy(struct lima_device *ldev)
> +{
> +       lima_devfreq_update_utilization(ldev);
> +       atomic_inc(&ldev->devfreq.busy_count);
> +}
> +
> +void lima_devfreq_record_idle(struct lima_device *ldev)
> +{
> +       int count;
> +
> +       lima_devfreq_update_utilization(ldev);
> +       count = atomic_dec_if_positive(&ldev->devfreq.busy_count);
> +       WARN_ON(count < 0);
> +}
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
> new file mode 100644
> index 000000000000..fe4f8a437033
> --- /dev/null
> +++ b/drivers/gpu/drm/lima/lima_devfreq.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com> */
> +
> +#ifndef __LIMA_DEVFREQ_H__
> +#define __LIMA_DEVFREQ_H__
> +
> +struct lima_device;
> +
> +int lima_devfreq_init(struct lima_device *ldev);
> +void lima_devfreq_fini(struct lima_device *ldev);
> +
> +void lima_devfreq_record_busy(struct lima_device *ldev);
> +void lima_devfreq_record_idle(struct lima_device *ldev);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> index 19829b543024..7f1f7a1c03e5 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -214,6 +214,8 @@ static int lima_init_gp_pipe(struct lima_device *dev)
>         struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_gp;
>         int err;
>
> +       pipe->ldev = dev;
> +
>         err = lima_sched_pipe_init(pipe, "gp");
>         if (err)
>                 return err;
> @@ -244,6 +246,8 @@ static int lima_init_pp_pipe(struct lima_device *dev)
>         struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_pp;
>         int err, i;
>
> +       pipe->ldev = dev;
> +
>         err = lima_sched_pipe_init(pipe, "pp");
>         if (err)
>                 return err;
> diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
> index 31158d86271c..26f0efdd17f1 100644
> --- a/drivers/gpu/drm/lima/lima_device.h
> +++ b/drivers/gpu/drm/lima/lima_device.h
> @@ -5,6 +5,7 @@
>  #define __LIMA_DEVICE_H__
>
>  #include <drm/drm_device.h>
> +#include <linux/atomic.h>
>  #include <linux/delay.h>
>
>  #include "lima_sched.h"
> @@ -94,6 +95,22 @@ struct lima_device {
>
>         u32 *dlbu_cpu;
>         dma_addr_t dlbu_dma;
> +
> +       struct {
> +               struct devfreq *devfreq;
> +               struct opp_table *opp_table;
> +               struct thermal_cooling_device *cooling;
> +               ktime_t busy_time;
> +               ktime_t idle_time;
> +               ktime_t time_last_update;
> +               atomic_t busy_count;
> +               /*
> +                * Protect busy_time, idle_time and time_last_update because
> +                * these can be updated concurrently - for example by the GP
> +                * and PP interrupts.
> +                */
> +               spinlock_t lock;
> +       } devfreq;
>  };
>
>  static inline struct lima_device *
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index 124efe4fa97b..b64b1777f220 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_prime.h>
>  #include <drm/lima_drm.h>
>
> +#include "lima_devfreq.h"
>  #include "lima_drv.h"
>  #include "lima_gem.h"
>  #include "lima_vm.h"
> @@ -296,18 +297,26 @@ static int lima_pdev_probe(struct platform_device *pdev)
>         if (err)
>                 goto err_out1;
>
> +       err = lima_devfreq_init(ldev);
> +       if (err) {
> +               dev_err(&pdev->dev, "Fatal error during devfreq init\n");
> +               goto err_out2;
> +       }
> +
>         /*
>          * Register the DRM device with the core and the connectors with
>          * sysfs.
>          */
>         err = drm_dev_register(ddev, 0);
>         if (err < 0)
> -               goto err_out2;
> +               goto err_out3;
>
>         return 0;
>
> -err_out2:
> +err_out3:
>         lima_device_fini(ldev);
> +err_out2:
> +       lima_devfreq_fini(ldev);
>  err_out1:
>         drm_dev_put(ddev);
>  err_out0:
> @@ -321,6 +330,7 @@ static int lima_pdev_remove(struct platform_device *pdev)
>         struct drm_device *ddev = ldev->ddev;
>
>         drm_dev_unregister(ddev);
> +       lima_devfreq_fini(ldev);
>         lima_device_fini(ldev);
>         drm_dev_put(ddev);
>         lima_sched_slab_fini();
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index f522c5f99729..851c496a168b 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -5,6 +5,7 @@
>  #include <linux/slab.h>
>  #include <linux/xarray.h>
>
> +#include "lima_devfreq.h"
>  #include "lima_drv.h"
>  #include "lima_sched.h"
>  #include "lima_vm.h"
> @@ -213,6 +214,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
>          */
>         ret = dma_fence_get(task->fence);
>
> +       lima_devfreq_record_busy(pipe->ldev);
> +
>         pipe->current_task = task;
>
>         /* this is needed for MMU to work correctly, otherwise GP/PP
> @@ -280,6 +283,8 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
>         pipe->current_vm = NULL;
>         pipe->current_task = NULL;
>
> +       lima_devfreq_record_idle(pipe->ldev);
> +
>         drm_sched_resubmit_jobs(&pipe->base);
>         drm_sched_start(&pipe->base, true);
>  }
> @@ -348,6 +353,8 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>
>  void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
>  {
> +       lima_devfreq_record_idle(pipe->ldev);

This should be moved to the else {} part of the following code. As you
have added the save
idle record to the lima_sched_handle_error_task which is just the if
{} part of the following
code, so no need to call it twice for error tasks. BTW.
lima_sched_handle_error_task is also
used for timeout tasks, so add idle record in it is fine.

Regards,
Qiang

> +
>         if (pipe->error)
>                 schedule_work(&pipe->error_work);
>         else {
> diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
> index 928af91c1118..9ae7df7d7fbb 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -6,6 +6,7 @@
>
>  #include <drm/gpu_scheduler.h>
>
> +struct lima_device;
>  struct lima_vm;
>
>  struct lima_sched_task {
> @@ -41,6 +42,8 @@ struct lima_sched_pipe {
>         u32 fence_seqno;
>         spinlock_t fence_lock;
>
> +       struct lima_device *ldev;
> +
>         struct lima_sched_task *current_task;
>         struct lima_vm *current_vm;
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
