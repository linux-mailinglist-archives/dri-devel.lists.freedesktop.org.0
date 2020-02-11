Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25215A330
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2446E9A8;
	Wed, 12 Feb 2020 08:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302176E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 20:09:22 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id a22so14014519oid.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d79/juOKGQ3xhEKgN8cqkrkeeX6KR3FsfafPiPWnTjk=;
 b=iKL3T3KT/E0Iwsb3fnUfmhLupejJLrt0Xw5IOfw8B/SqKyHuAmgD6b5kRaiIeb6uQi
 4hqOAy9ePuT7GdoTUwr87pkUzlBm0LRqEEFiWmTJS7vLwJwDvOy2UWIrGEpnJS5HNg6L
 UJ3OcYCcXDup4hmac0c8ZAtTXuIBB4C4CC3djbwDvtd6WU9keMA7joMyqQ4WttYi8EBN
 vrOINTqg3CqyMUDW8SXtRJMA5A2vJY60W9spolclj6hO3pOdiey4rg0CUIfOnXDULfGo
 s6RA3SPhR9ow2ObUxJ9XLAnHJ3VD73fdhMjBf6otQbBS3osn2sT48zUHMkQ908wokOCL
 r57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d79/juOKGQ3xhEKgN8cqkrkeeX6KR3FsfafPiPWnTjk=;
 b=iO2zr0nY0n/+GE4YKrev7ZrKPSULlTVaRd2Y1f9vHLHTZnX0G0xCMmw2FybYXPs8kB
 fH4NJIfqU/426uO+Pjiyw/RriYYJeiid1biT/4wxJhokfARuNd2oKAl9ffzMlUQmiCLo
 y9S5SuX9ibVLW53SO949qgfASbc//sWS//KRirXoD9Td3T3rQ4ktZIoxJkyXUYnUJ1HG
 az/j8lAop9ZTc2gQTyDHbuIW/P0Ib5ZAfW/vOnjwHDbSWnbATxwRDAa3LbJF9JVpjzDn
 jXaRBKhFltWvPkHuDdbDxXbxkURFjGbwo5fR8SoDKwthCFwKYnmBLHedG1p4Y/jCrR5Q
 oXRQ==
X-Gm-Message-State: APjAAAU+4wOcHohZY5/aButopmfXAdb40YoDdI8fPQC3ZgUHH8gCl0Ck
 9zeOULShGrVEUP+mnjic40z+v+83/B+GYNlqp3G59Q==
X-Google-Smtp-Source: APXvYqzxjGO2mFbbESSI+X8wqwDLJmq3XqFdPvI31wvyICH6y7/2J3dCeN49E5XfR2n7WblRYhIvydxmmpi6MKoWH0c=
X-Received: by 2002:aca:ea43:: with SMTP id i64mr4107524oih.30.1581451761048; 
 Tue, 11 Feb 2020 12:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
 <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
In-Reply-To: <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 11 Feb 2020 12:08:44 -0800
Message-ID: <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>,
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

On Tue, Feb 11, 2020 at 11:44 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> +Saravana
>
> On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > When there is a single power domain per device, the core will
> > ensure the power domain is switched on (so it is technically
> > equivalent to having not power domain specified at all).
> >
> > However, when there are multiple domains, as in MT8183 Bifrost
> > GPU, we need to handle them in driver code.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ---
> >
> > The downstream driver we use on chromeos-4.19 currently uses 2
> > additional devices in device tree to accomodate for this [1], but
> > I believe this solution is cleaner.
> >
> > [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
> >
> > v4:
> >  - Match the exact power domain names as specified in the compatible
> >    struct, instead of just matching the number of power domains.
> >    [Review: Ulf Hansson]
> >  - Dropped print and reordered function [Review: Steven Price]
> >  - nits: Run through latest version of checkpatch:
> >    - Use WARN instead of BUG_ON.
> >    - Drop braces for single expression if block.
> > v3:
> >  - Use the compatible matching data to specify the number of power
> >    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
> >    as the core will handle these 2 cases in the exact same way
> >    (automatically, without driver intervention), and there should
> >    be no adverse consequence in this case (the concern is about
> >    switching on only some power domains and not others).
> >
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 97 ++++++++++++++++++++--
> >  drivers/gpu/drm/panfrost/panfrost_device.h | 11 +++
> >  drivers/gpu/drm/panfrost/panfrost_drv.c    |  2 +
> >  3 files changed, 102 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index 3720d50f6d9f965..8136babd3ba9935 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/reset.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/regulator/consumer.h>
> >
> >  #include "panfrost_device.h"
> > @@ -120,6 +121,79 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
> >                         pfdev->regulators);
> >  }
> >
> > +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> > +               if (!pfdev->pm_domain_devs[i])
> > +                       break;
> > +
> > +               if (pfdev->pm_domain_links[i])
> > +                       device_link_del(pfdev->pm_domain_links[i]);
> > +
> > +               dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> > +       }
> > +}
> > +
> > +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> > +{
> > +       int err;
> > +       int i, num_domains;
> > +
> > +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> > +                                                "power-domains",
> > +                                                "#power-domain-cells");
> > +
> > +       /*
> > +        * Single domain is handled by the core, and, if only a single power
> > +        * the power domain is requested, the property is optional.
> > +        */
> > +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> > +               return 0;
> > +
> > +       if (num_domains != pfdev->comp->num_pm_domains) {
> > +               dev_err(pfdev->dev,
> > +                       "Incorrect number of power domains: %d provided, %d needed\n",
> > +                       num_domains, pfdev->comp->num_pm_domains);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> > +                       "Too many supplies in compatible structure.\n"))
> > +               return -EINVAL;
> > +
> > +       for (i = 0; i < num_domains; i++) {
> > +               pfdev->pm_domain_devs[i] =
> > +                       dev_pm_domain_attach_by_name(pfdev->dev,
> > +                                       pfdev->comp->pm_domain_names[i]);
> > +               if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
> > +                       err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
> > +                       pfdev->pm_domain_devs[i] = NULL;
> > +                       dev_err(pfdev->dev,
> > +                               "failed to get pm-domain %s(%d): %d\n",
> > +                               pfdev->comp->pm_domain_names[i], i, err);
> > +                       goto err;
> > +               }
> > +
> > +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> > +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> > +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
>
> We're in the process of adding device links based on DT properties.
> Shouldn't we add power domains to that? See drivers/of/property.c for
> what's handled.

Rob,

drivers/of/property.c doesn't enable the RPM_ACTIVE AND PM_RUNTIME
flags. Wanted to start off conservative. But adding command line ops
to change the default flags shouldn't be difficult. But before I do
that, I want to change of_devlink to
fw_devlink=<disabled|permissive|enabled>. May be I can extend that to
"disabled, permissive, suspend, runtime".

Nicholas,

And the adding and removing of device links for power domains will be
a 2 line change. I've been meaning to add a few more bindings like
hwspinlocks and pinctrl. I can roll power domains support into that if
you want.

-Saravana
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
