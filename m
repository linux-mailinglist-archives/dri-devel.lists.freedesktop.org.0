Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EE157154
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7316EB87;
	Mon, 10 Feb 2020 08:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292FB6FCCD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 14:26:17 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id c7so946176uaf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mx9ECjfNlENLsB8AuDhvIZ40Y4vAEl7vLu8G7oMl5Mw=;
 b=RVsKo6amiSr5Aqo29IMdZvq4NC3MIh2yKZrItj3W3BKh7ZRwBATHvr4XIgGq+HWW0y
 1Fk/SH5nrIHDirlwzfet3RgfBhucXkS0+hipka6wEoWpsnCFCbGNtUIgbjjHHEGIbrgG
 YDhyvQT+oFOomZzdKEhLZiCck97MtYsh4EToH3bkWu2QIGpPMr1vfCLcKgqcGdCIW8x+
 R0PhxilGs2b1/vLxsndT/aPTEIROcvMQ0qFs7PwgR5awpgkEs9kN0TUgtcVAwxSNLa8N
 4Gmi8Rb40AgftqM7q6WG4peMXB/XUM6ZJJ8cELLN/QEwf8p6eCOxOm/yvv4kiWYM4nci
 zvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mx9ECjfNlENLsB8AuDhvIZ40Y4vAEl7vLu8G7oMl5Mw=;
 b=ce44nMNulsGOqny3FpfbgU1MoX0yVkZxoAJGw6VYdF4ZfZBPJQHYye92B9egrG7xy9
 OsLAXdlnuHLAyGHATMNkkgRjrF+WBlbvjdJ+QFOYzDcx4ZkKsarVfmGQsrTqBEy7KBVl
 bo7dFC2/2CRRktg/gsMH+EhAy29AruKr8jDnEajbr5VzYs1VbkqC7Zuu2JxJ9KXEHVBA
 DyoTaE9nMN/+ToGUDWIuHiXeKY9UJ4brTziCdiqIv0gyo1QktWT9TmIxrXAtW5qfgNRi
 EWRzGJIzEZ8JeLf3Z9pVGRq8R2Ghum6dkm5Hm7CIqVBiGPK7pj8SZxvm9W2m8nr83iy0
 2CHA==
X-Gm-Message-State: APjAAAUEwD9FAoO+hMTgR5ASPtqC0rh4jcOS4zvQ1ZyUsRUusJCIi9sx
 TkttMJp0jGIb5vfNhBgwWdNrw0tJGudQNpEpUW4lbQ==
X-Google-Smtp-Source: APXvYqw82mjBwreczPiQ8M1VhMO9zp9ILdm/YdrZXThljZ80bt7p7iJEl0CFjYXuJ6z5wNz1z6zuf+PRYxSRmbRmNSw=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr4808449uaq.100.1581085576006; 
 Fri, 07 Feb 2020 06:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-6-drinkcat@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Feb 2020 15:25:40 +0100
Message-ID: <CAPDyKFoz0gUkoofWkd6dFuOkRWqeeCDrv84UHyYYowAAgTiitw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Nicolas Boichat <drinkcat@chromium.org>
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Feb 2020 at 06:27, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> When there is a single power domain per device, the core will
> ensure the power domain is switched on (so it is technically
> equivalent to having not power domain specified at all).
>
> However, when there are multiple domains, as in MT8183 Bifrost
> GPU, we need to handle them in driver code.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Besides a minor nitpick, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

>
> ---
>
> The downstream driver we use on chromeos-4.19 currently uses 2
> additional devices in device tree to accomodate for this [1], but
> I believe this solution is cleaner.
>
> [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
>
> v4:
>  - Match the exact power domain names as specified in the compatible
>    struct, instead of just matching the number of power domains.
>    [Review: Ulf Hansson]
>  - Dropped print and reordered function [Review: Steven Price]
>  - nits: Run through latest version of checkpatch:
>    - Use WARN instead of BUG_ON.
>    - Drop braces for single expression if block.
> v3:
>  - Use the compatible matching data to specify the number of power
>    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
>    as the core will handle these 2 cases in the exact same way
>    (automatically, without driver intervention), and there should
>    be no adverse consequence in this case (the concern is about
>    switching on only some power domains and not others).
>
>  drivers/gpu/drm/panfrost/panfrost_device.c | 97 ++++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h | 11 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  2 +
>  3 files changed, 102 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 3720d50f6d9f965..8136babd3ba9935 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -5,6 +5,7 @@
>  #include <linux/clk.h>
>  #include <linux/reset.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "panfrost_device.h"
> @@ -120,6 +121,79 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
>                         pfdev->regulators);
>  }
>
> +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> +               if (!pfdev->pm_domain_devs[i])
> +                       break;
> +
> +               if (pfdev->pm_domain_links[i])
> +                       device_link_del(pfdev->pm_domain_links[i]);
> +
> +               dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> +       }
> +}
> +
> +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> +{
> +       int err;
> +       int i, num_domains;
> +
> +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> +                                                "power-domains",
> +                                                "#power-domain-cells");
> +
> +       /*
> +        * Single domain is handled by the core, and, if only a single power
> +        * the power domain is requested, the property is optional.
> +        */
> +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> +               return 0;
> +
> +       if (num_domains != pfdev->comp->num_pm_domains) {
> +               dev_err(pfdev->dev,
> +                       "Incorrect number of power domains: %d provided, %d needed\n",
> +                       num_domains, pfdev->comp->num_pm_domains);
> +               return -EINVAL;
> +       }
> +
> +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> +                       "Too many supplies in compatible structure.\n"))

Nitpick:
Not sure this deserves a WARN. Perhaps a regular dev_err() is sufficient.

> +               return -EINVAL;
> +
> +       for (i = 0; i < num_domains; i++) {
> +               pfdev->pm_domain_devs[i] =
> +                       dev_pm_domain_attach_by_name(pfdev->dev,
> +                                       pfdev->comp->pm_domain_names[i]);
> +               if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
> +                       err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
> +                       pfdev->pm_domain_devs[i] = NULL;
> +                       dev_err(pfdev->dev,
> +                               "failed to get pm-domain %s(%d): %d\n",
> +                               pfdev->comp->pm_domain_names[i], i, err);
> +                       goto err;
> +               }
> +
> +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
> +               if (!pfdev->pm_domain_links[i]) {
> +                       dev_err(pfdev->pm_domain_devs[i],
> +                               "adding device link failed!\n");
> +                       err = -ENODEV;
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       panfrost_pm_domain_fini(pfdev);
> +       return err;
> +}
> +
>  int panfrost_device_init(struct panfrost_device *pfdev)
>  {
>         int err;
> @@ -150,37 +224,43 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>                 goto err_out1;
>         }
>
> +       err = panfrost_pm_domain_init(pfdev);
> +       if (err)
> +               goto err_out2;
> +
>         res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
>         pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
>         if (IS_ERR(pfdev->iomem)) {
>                 dev_err(pfdev->dev, "failed to ioremap iomem\n");
>                 err = PTR_ERR(pfdev->iomem);
> -               goto err_out2;
> +               goto err_out3;
>         }
>
>         err = panfrost_gpu_init(pfdev);
>         if (err)
> -               goto err_out2;
> +               goto err_out3;
>
>         err = panfrost_mmu_init(pfdev);
>         if (err)
> -               goto err_out3;
> +               goto err_out4;
>
>         err = panfrost_job_init(pfdev);
>         if (err)
> -               goto err_out4;
> +               goto err_out5;
>
>         err = panfrost_perfcnt_init(pfdev);
>         if (err)
> -               goto err_out5;
> +               goto err_out6;
>
>         return 0;
> -err_out5:
> +err_out6:
>         panfrost_job_fini(pfdev);
> -err_out4:
> +err_out5:
>         panfrost_mmu_fini(pfdev);
> -err_out3:
> +err_out4:
>         panfrost_gpu_fini(pfdev);
> +err_out3:
> +       panfrost_pm_domain_fini(pfdev);
>  err_out2:
>         panfrost_reset_fini(pfdev);
>  err_out1:
> @@ -196,6 +276,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>         panfrost_job_fini(pfdev);
>         panfrost_mmu_fini(pfdev);
>         panfrost_gpu_fini(pfdev);
> +       panfrost_pm_domain_fini(pfdev);
>         panfrost_reset_fini(pfdev);
>         panfrost_regulator_fini(pfdev);
>         panfrost_clk_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index c9468bc5573ac9d..c30c719a805940a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -21,6 +21,7 @@ struct panfrost_perfcnt;
>
>  #define NUM_JOB_SLOTS 3
>  #define MAX_REGULATORS 2
> +#define MAX_PM_DOMAINS 3
>
>  struct panfrost_features {
>         u16 id;
> @@ -61,6 +62,13 @@ struct panfrost_compatible {
>         /* Supplies count and names. */
>         int num_supplies;
>         const char * const *supply_names;
> +       /*
> +        * Number of power domains required, note that values 0 and 1 are
> +        * handled identically, as only values > 1 need special handling.
> +        */
> +       int num_pm_domains;
> +       /* Only required if num_pm_domains > 1. */
> +       const char * const *pm_domain_names;
>  };
>
>  struct panfrost_device {
> @@ -73,6 +81,9 @@ struct panfrost_device {
>         struct clk *bus_clock;
>         struct regulator_bulk_data regulators[MAX_REGULATORS];
>         struct reset_control *rstc;
> +       /* pm_domains for devices with more than one. */
> +       struct device *pm_domain_devs[MAX_PM_DOMAINS];
> +       struct device_link *pm_domain_links[MAX_PM_DOMAINS];
>
>         struct panfrost_features features;
>         const struct panfrost_compatible *comp;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 4d08507526239f2..a6e162236d67fdf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -663,6 +663,8 @@ const char * const default_supplies[] = { "mali" };
>  static const struct panfrost_compatible default_data = {
>         .num_supplies = ARRAY_SIZE(default_supplies),
>         .supply_names = default_supplies,
> +       .num_pm_domains = 1, /* optional */
> +       .pm_domain_names = NULL,
>  };
>
>  static const struct of_device_id dt_match[] = {
> --
> 2.25.0.341.g760bfbb309-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
