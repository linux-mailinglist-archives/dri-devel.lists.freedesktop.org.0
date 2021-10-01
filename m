Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05D41EE79
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 15:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845806E4A2;
	Fri,  1 Oct 2021 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCC36ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 13:25:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i4so39218988lfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ce1L2tN5HKfi3fvHHadmQ3q2m1uy07zcuZbE6aqO/w8=;
 b=powMYwV2MjTTSNc/t+dTNLdv1N7EGIPyjZGEPVcI3gY1sc7M027cz1jk10A8Akvayt
 xjVreVrw3OhYWDozi4k1FD15Y/REv1+kRr+cjUF2h0j1veF2W18YSPZ0Q5Yr4sHeIvE2
 xbMkeHo9U1tEXk06Mw9Kuy4lgLyOxpZSHnK0HBd2vSzL2VjpwHt/hOcHFKIy7B6LJi7A
 uoB+oX4ib19bvdTB1CDwwSKijlssZrKUF/Rsk7l+ZYlLV+xqUcOhO1E9Y9gSeqjAwXK/
 ooBHqYOXpxuJ8myCcf7rUgQtf3FwOKbuwTsCqu62SbjlUC9B1vASEJMY0Aqy8D3WeZyF
 q1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ce1L2tN5HKfi3fvHHadmQ3q2m1uy07zcuZbE6aqO/w8=;
 b=QnLWgp2hiewk+D4iBYb59t5cyITwwGqXKzKcl+7lUtL0abO4skNX5oG/XqH914QwP6
 JkK6rHIBFrF8If7Q6MoY818kTRO+ABoR3cSNAQ0Y41OZrLxwIMDrP4r7+RStMj9vjveQ
 Ey3PsfFdMnH4uXJ2Kwj6iDII6yHgbc/RQFfNyLVOq8xjiUVE+5F6fy02Hb2hFC8iFRKH
 7/CJb8gMg0/Ozf2+1LV8dMVmVtApVfYGRbgqsxjfrusRmIkgPvhLZ5gH3YpZVN6Hs4ss
 x1J2wwGq9OEThA4DLofKQb0o/YwMR/Rr06R1AljDzRGK1XnEGO1oxcph5sJedR+Ztc47
 LQQA==
X-Gm-Message-State: AOAM530uIXkdPbTj05jBcO7HiXwCskzVGoLuAxzr6biy6KrT013IooVO
 M1+ZAb7qAUwBUyGmpateujcEj7X4QtnCKqADo8zj+g==
X-Google-Smtp-Source: ABdhPJx3j8rYzIefonx7fnLDHN6Ws0loCtwYPf/Gwf8OXRLpCYIkD4HnMnNV/rnmavNwT0BrQF7QYu3k62ifmvyYjCU=
X-Received: by 2002:a19:5f4b:: with SMTP id a11mr5339726lfj.373.1633094698289; 
 Fri, 01 Oct 2021 06:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-10-digetx@gmail.com>
In-Reply-To: <20210926224058.1252-10-digetx@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 15:24:21 +0200
Message-ID: <CAPDyKFqqQvKusZ2gzHh69LNrncvi9_o04_xFKDpAkDbS-8Zecg@mail.gmail.com>
Subject: Re: [PATCH v13 09/35] gpu: host1x: Add runtime PM and OPP support
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add runtime PM and OPP support to the Host1x driver. For the starter we
> will keep host1x always-on because dynamic power management require a major
> refactoring of the driver code since lot's of code paths are missing the
> RPM handling and we're going to remove some of these paths in the future.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

[...]

> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -6,14 +6,18 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>
> +#include <soc/tegra/common.h>
> +
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/host1x.h>
>  #undef CREATE_TRACE_POINTS
> @@ -190,6 +194,9 @@ static void host1x_setup_sid_table(struct host1x *host)
>         const struct host1x_info *info = host->info;
>         unsigned int i;
>
> +       if (!info->has_hypervisor)
> +               return;
> +
>         for (i = 0; i < info->num_sid_entries; i++) {
>                 const struct host1x_sid_entry *entry = &info->sid_table[i];
>
> @@ -347,6 +354,27 @@ static void host1x_iommu_exit(struct host1x *host)
>         }
>  }
>
> +static int host1x_get_resets(struct host1x *host)
> +{
> +       int err;
> +
> +       host->resets[0].id = "mc";
> +       host->resets[1].id = "host1x";
> +       host->nresets = ARRAY_SIZE(host->resets);
> +
> +       err = devm_reset_control_bulk_get_optional_exclusive_released(
> +                               host->dev, host->nresets, host->resets);
> +       if (err) {
> +               dev_err(host->dev, "failed to get reset: %d\n", err);
> +               return err;
> +       }
> +
> +       if (WARN_ON(!host->resets[1].rstc))
> +               return -ENOENT;
> +
> +       return 0;
> +}
> +
>  static int host1x_probe(struct platform_device *pdev)
>  {
>         struct host1x *host;
> @@ -423,12 +451,9 @@ static int host1x_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       host->rst = devm_reset_control_get(&pdev->dev, "host1x");
> -       if (IS_ERR(host->rst)) {
> -               err = PTR_ERR(host->rst);
> -               dev_err(&pdev->dev, "failed to get reset: %d\n", err);
> +       err = host1x_get_resets(host);
> +       if (err)
>                 return err;
> -       }
>
>         err = host1x_iommu_init(host);
>         if (err < 0) {
> @@ -443,22 +468,10 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto iommu_exit;
>         }
>
> -       err = clk_prepare_enable(host->clk);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "failed to enable clock\n");
> -               goto free_channels;
> -       }
> -
> -       err = reset_control_deassert(host->rst);
> -       if (err < 0) {
> -               dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
> -               goto unprepare_disable;
> -       }
> -
>         err = host1x_syncpt_init(host);
>         if (err) {
>                 dev_err(&pdev->dev, "failed to initialize syncpts\n");
> -               goto reset_assert;
> +               goto free_channels;
>         }
>
>         err = host1x_intr_init(host, syncpt_irq);
> @@ -467,10 +480,18 @@ static int host1x_probe(struct platform_device *pdev)
>                 goto deinit_syncpt;
>         }
>
> -       host1x_debug_init(host);
> +       pm_runtime_enable(&pdev->dev);
> +
> +       err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
> +       if (err)
> +               goto pm_disable;
>
> -       if (host->info->has_hypervisor)
> -               host1x_setup_sid_table(host);
> +       /* the driver's code isn't ready yet for the dynamic RPM */
> +       err = pm_runtime_resume_and_get(&pdev->dev);
> +       if (err)
> +               goto pm_disable;
> +
> +       host1x_debug_init(host);
>
>         err = host1x_register(host);
>         if (err < 0)
> @@ -486,13 +507,14 @@ static int host1x_probe(struct platform_device *pdev)
>         host1x_unregister(host);
>  deinit_debugfs:
>         host1x_debug_deinit(host);
> +
> +       pm_runtime_put(&pdev->dev);

pm_runtime_put() is asynchronous, so it may not actually succeed to
trigger the ->runtime_suspend() callback to be invoked. Thus, this
could end up that we leave clocks prepared/enabled when ->probe()
fails, for example.

I guess pm_runtime_put_sync_suspend() is slightly better.

Another option is to call pm_runtime_force_suspend(), but then you
must skip the call pm_runtime_disable() afterwards, as that has
already been done inside that function.

> +pm_disable:
> +       pm_runtime_disable(&pdev->dev);
> +
>         host1x_intr_deinit(host);
>  deinit_syncpt:
>         host1x_syncpt_deinit(host);
> -reset_assert:
> -       reset_control_assert(host->rst);
> -unprepare_disable:
> -       clk_disable_unprepare(host->clk);
>  free_channels:
>         host1x_channel_list_free(&host->channel_list);
>  iommu_exit:
> @@ -507,19 +529,94 @@ static int host1x_remove(struct platform_device *pdev)
>
>         host1x_unregister(host);
>         host1x_debug_deinit(host);
> +
> +       pm_runtime_put(&pdev->dev);

Similar comment as in ->probe().

> +       pm_runtime_disable(&pdev->dev);
> +
>         host1x_intr_deinit(host);
>         host1x_syncpt_deinit(host);
> -       reset_control_assert(host->rst);
> -       clk_disable_unprepare(host->clk);
>         host1x_iommu_exit(host);
>
>         return 0;
>  }
>
> +
> +       host1x_setup_sid_table(host);
> +       host1x_syncpt_restore(host);
> +       host1x_intr_start(host);
> +
> +       return 0;
> +
> +disable_clk:
> +       clk_disable_unprepare(host->clk);
> +release_reset:
> +       reset_control_bulk_release(host->nresets, host->resets);
> +
> +       return err;
> +}
> +
> +static const struct dev_pm_ops host1x_pm = {
> +       SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
> +                          NULL)
> +       /* TODO: add system suspend-resume once driver will be ready for that */
> +};

[...]

Kind regards
Uffe
