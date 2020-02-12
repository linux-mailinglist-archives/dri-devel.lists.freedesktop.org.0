Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5E159ED4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 02:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04BC6E514;
	Wed, 12 Feb 2020 01:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1E36E514
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 01:58:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFB2D2086A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 01:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581472717;
 bh=5xMV5/TVGRr+5n3CDhQK+BAq0L+GSeKCKbxA7n55/wE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2h7KjcUk9Sp8aOwuyZi4JC/C8u8EEDPgWxCQewplP19CLItSG4UXpvP9eb+acJoOl
 F/TlUc0oQ5Ot12JROwBghL5wRhYNEa38T/MPyEHN9hM+GIbCCFf0OHqcnONKZHNUcq
 qHkRWYtjr3XzRQ9h52PLmLIwStzBoPna6fKAvWgo=
Received: by mail-qt1-f177.google.com with SMTP id e21so420022qtp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 17:58:36 -0800 (PST)
X-Gm-Message-State: APjAAAUTDG8IZtZQn+DXJM/fbRKc1C4xrmTQn2N/AEegv3KfIGsUc804
 muLC7Z+awXXFLKgor/YiIHha3gpN7+g1/Sfy+g==
X-Google-Smtp-Source: APXvYqzJvq766HYoGaDSEwrefuEPoAikZi/pD9TMZnClXZXfoYeHa0Z1pBt1X/JlPhjCMqHKV9W/WdNr2bG7DidQlDY=
X-Received: by 2002:aed:2344:: with SMTP id i4mr17639114qtc.136.1581472715957; 
 Tue, 11 Feb 2020 17:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
 <CAL_JsqLshgzmhGGa+XibosSgk6R_9DQkDf12s793UZcvbQbxKw@mail.gmail.com>
 <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
In-Reply-To: <CAGETcx_3-ZoVAf+Uf0Yo86pUU1nL4S4-jrS0eZi50yvhCO985g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 11 Feb 2020 19:58:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLw1fyj949KtG6wNRG_Ky6cq2wS3VH2Ku+ZykU3bSap=g@mail.gmail.com>
Message-ID: <CAL_JsqLw1fyj949KtG6wNRG_Ky6cq2wS3VH2Ku+ZykU3bSap=g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Saravana Kannan <saravanak@google.com>
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

On Tue, Feb 11, 2020 at 2:09 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Tue, Feb 11, 2020 at 11:44 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > +Saravana
> >
> > On Thu, Feb 6, 2020 at 11:27 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > When there is a single power domain per device, the core will
> > > ensure the power domain is switched on (so it is technically
> > > equivalent to having not power domain specified at all).
> > >
> > > However, when there are multiple domains, as in MT8183 Bifrost
> > > GPU, we need to handle them in driver code.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > ---
> > >
> > > The downstream driver we use on chromeos-4.19 currently uses 2
> > > additional devices in device tree to accomodate for this [1], but
> > > I believe this solution is cleaner.
> > >
> > > [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#31
> > >
> > > v4:
> > >  - Match the exact power domain names as specified in the compatible
> > >    struct, instead of just matching the number of power domains.
> > >    [Review: Ulf Hansson]
> > >  - Dropped print and reordered function [Review: Steven Price]
> > >  - nits: Run through latest version of checkpatch:
> > >    - Use WARN instead of BUG_ON.
> > >    - Drop braces for single expression if block.
> > > v3:
> > >  - Use the compatible matching data to specify the number of power
> > >    domains. Note that setting 0 or 1 in num_pm_domains is equivalent
> > >    as the core will handle these 2 cases in the exact same way
> > >    (automatically, without driver intervention), and there should
> > >    be no adverse consequence in this case (the concern is about
> > >    switching on only some power domains and not others).
> > >
> > >  drivers/gpu/drm/panfrost/panfrost_device.c | 97 ++++++++++++++++++++--
> > >  drivers/gpu/drm/panfrost/panfrost_device.h | 11 +++
> > >  drivers/gpu/drm/panfrost/panfrost_drv.c    |  2 +
> > >  3 files changed, 102 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > index 3720d50f6d9f965..8136babd3ba9935 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > > @@ -5,6 +5,7 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > >  #include <linux/regulator/consumer.h>
> > >
> > >  #include "panfrost_device.h"
> > > @@ -120,6 +121,79 @@ static void panfrost_regulator_fini(struct panfrost_device *pfdev)
> > >                         pfdev->regulators);
> > >  }
> > >
> > > +static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
> > > +{
> > > +       int i;
> > > +
> > > +       for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> > > +               if (!pfdev->pm_domain_devs[i])
> > > +                       break;
> > > +
> > > +               if (pfdev->pm_domain_links[i])
> > > +                       device_link_del(pfdev->pm_domain_links[i]);
> > > +
> > > +               dev_pm_domain_detach(pfdev->pm_domain_devs[i], true);
> > > +       }
> > > +}
> > > +
> > > +static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> > > +{
> > > +       int err;
> > > +       int i, num_domains;
> > > +
> > > +       num_domains = of_count_phandle_with_args(pfdev->dev->of_node,
> > > +                                                "power-domains",
> > > +                                                "#power-domain-cells");
> > > +
> > > +       /*
> > > +        * Single domain is handled by the core, and, if only a single power
> > > +        * the power domain is requested, the property is optional.
> > > +        */
> > > +       if (num_domains < 2 && pfdev->comp->num_pm_domains < 2)
> > > +               return 0;
> > > +
> > > +       if (num_domains != pfdev->comp->num_pm_domains) {
> > > +               dev_err(pfdev->dev,
> > > +                       "Incorrect number of power domains: %d provided, %d needed\n",
> > > +                       num_domains, pfdev->comp->num_pm_domains);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> > > +                       "Too many supplies in compatible structure.\n"))
> > > +               return -EINVAL;
> > > +
> > > +       for (i = 0; i < num_domains; i++) {
> > > +               pfdev->pm_domain_devs[i] =
> > > +                       dev_pm_domain_attach_by_name(pfdev->dev,
> > > +                                       pfdev->comp->pm_domain_names[i]);
> > > +               if (IS_ERR_OR_NULL(pfdev->pm_domain_devs[i])) {
> > > +                       err = PTR_ERR(pfdev->pm_domain_devs[i]) ? : -ENODATA;
> > > +                       pfdev->pm_domain_devs[i] = NULL;
> > > +                       dev_err(pfdev->dev,
> > > +                               "failed to get pm-domain %s(%d): %d\n",
> > > +                               pfdev->comp->pm_domain_names[i], i, err);
> > > +                       goto err;
> > > +               }
> > > +
> > > +               pfdev->pm_domain_links[i] = device_link_add(pfdev->dev,
> > > +                               pfdev->pm_domain_devs[i], DL_FLAG_PM_RUNTIME |
> > > +                               DL_FLAG_STATELESS | DL_FLAG_RPM_ACTIVE);
> >
> > We're in the process of adding device links based on DT properties.
> > Shouldn't we add power domains to that? See drivers/of/property.c for
> > what's handled.
>
> Rob,
>
> drivers/of/property.c doesn't enable the RPM_ACTIVE AND PM_RUNTIME
> flags. Wanted to start off conservative.

I worry that you can't add it later without potentially breaking platforms.

I haven't checked, but I assume these flags make runtime PM honor
device links? That seems like the more conservative option (more
reasons why a device can't suspend).

> But adding command line ops
> to change the default flags shouldn't be difficult. But before I do
> that, I want to change of_devlink to
> fw_devlink=<disabled|permissive|enabled>. May be I can extend that to
> "disabled, permissive, suspend, runtime".

I think any command line option should be debug primarily. It's kind
of a big hammer.

Can drivers adjust the flags themselves? Just modify the flags rather
than trying to create new links?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
