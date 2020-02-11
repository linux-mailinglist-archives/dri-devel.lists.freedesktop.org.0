Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97E1599F6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 20:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54796E1C0;
	Tue, 11 Feb 2020 19:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0606E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 19:43:58 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98EB124690
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581450238;
 bh=DvzM0ydj4D5pq1pifhh+bBq3fqq6xA8Afwwx469Vkho=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UNht+1KGl/nLZWZpg26EufuWcgrSTOX3VAIgakbRdyF2CL16G2d4+TZBX36/+LFWD
 hZVpXwfUvNeNOeXs4r2ZZDOuxALHac6LbPjwBx8kLxlOLqouwe2fLw1ue4BoFTRlbA
 TsB1ToXb6pvScjFYZwFZQLoiCU5100lh5WwswRSI=
Received: by mail-qv1-f54.google.com with SMTP id n8so5561050qvg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:43:58 -0800 (PST)
X-Gm-Message-State: APjAAAUR7CBhwKNr4erc2OLioD04aKR2CWhDMSFTMwBNV+9WU57ClSMW
 VHJEiMAEozdu3qCP4TlpiahmDOx3St9FKI/vpg==
X-Google-Smtp-Source: APXvYqwWjbNjReDsgQKr6XDaSggOqqPVRJvQCHJ/GYq2amBCeGZ41X9dHAmHfM9j4TENY3W9kgIrEy30L5K8rEJVBI8=
X-Received: by 2002:a05:6214:11ac:: with SMTP id
 u12mr4422199qvv.85.1581450237590; 
 Tue, 11 Feb 2020 11:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
In-Reply-To: <20200207052627.130118-6-drinkcat@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 11 Feb 2020 13:43:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
Message-ID: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Nicolas Boichat <drinkcat@chromium.org>,
 Saravana Kannan <saravanak@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Saravana

On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> When there is a single power domain per device, the core will
> ensure the power domain is switched on (so it is technically
> equivalent to having not power domain specified at all).
>
> However, when there are multiple domains, as in MT8183 Bifrost
> GPU, we need to handle them in driver code.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
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

We're in the process of adding device links based on DT properties.
Shouldn't we add power domains to that? See drivers/of/property.c for
what's handled.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
