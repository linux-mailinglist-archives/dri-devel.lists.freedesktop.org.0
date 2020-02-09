Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F3156A25
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 13:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948816E7D7;
	Sun,  9 Feb 2020 12:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3A76E7D7
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 12:50:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n17so3119920qtv.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2020 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UUxkIo4yxkeRP+bZrwjD/FNTFLHW7fMlloVtMLr4fIw=;
 b=k1JVxZ8GdaxEZGeieGrpnm15pZ4+JPC8+bYPE/sod5qDCs/0UmRUfHu0wy4MINXpOW
 DihXo/5r07fOxQ6dMJP4lLbq78/jS89B0S3UYF9bGi0QnnLCHvKmJAgk8IwGJsOr0H26
 FaQH3KFacAlpODxXd2voo6Yh1qvW4pzy/NNYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UUxkIo4yxkeRP+bZrwjD/FNTFLHW7fMlloVtMLr4fIw=;
 b=JXmLJ6bxaLdAt0FrtjeTUDXt0sGuUjVFo2owoQpUGAkuaOLVu7ohCRNzWS3TM5ad+9
 Z9UfZ/33paZVRjvvPsGGoM9lMqVO4GaGMzIhzgNClSQqYbjUXkh0AW0UpdZ7iZET10wj
 kJ/2g+dAqOzsp60uadpZ9fRt+SYAno30+D4u4W4x+wiRknBa47pjtw07AQQ0eI8WGGWg
 4I0iKP01/qA234UHDA/Gm+asqcpTVTlrCMDLst7BwH8iIJdD0rI3bGS5mQbyBLoIKKNt
 35eJKK5o9/t5s2FW9+DJert0gGqUdY/6y08hbeV2IUxjb+lwZgcMMZqRCEWd/T4fotEN
 2POQ==
X-Gm-Message-State: APjAAAXmNSLtJWGzdkc5GxNbbI/EPO0lcB/pNSRvmjqOao26mXvVGjUJ
 +NbLBs5JiJdoy58osSNgb7zPO2Qzru5UdXkQMHcWJDhWoTw=
X-Google-Smtp-Source: APXvYqwL0HPYs/DVRlaJsVp3prBvI/t5NO1gP07ODLr8nGv9P4GfIkkmBVpz1yzFJ54MiCuGem5H75+HZritEl9gP4M=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr6142797qtb.278.1581252621106; 
 Sun, 09 Feb 2020 04:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-6-drinkcat@chromium.org>
 <CAPDyKFoz0gUkoofWkd6dFuOkRWqeeCDrv84UHyYYowAAgTiitw@mail.gmail.com>
In-Reply-To: <CAPDyKFoz0gUkoofWkd6dFuOkRWqeeCDrv84UHyYYowAAgTiitw@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sun, 9 Feb 2020 20:50:23 +0800
Message-ID: <CANMq1KA+3O+G+_r=xY98eK-in5i3HWg+4B4-ONk-6qWS3a9=0g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/panfrost: Add support for multiple power
 domains
To: Ulf Hansson <ulf.hansson@linaro.org>
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

On Fri, Feb 7, 2020 at 10:26 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 7 Feb 2020 at 06:27, Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > When there is a single power domain per device, the core will
> > ensure the power domain is switched on (so it is technically
> > equivalent to having not power domain specified at all).
> >
> > However, when there are multiple domains, as in MT8183 Bifrost
> > GPU, we need to handle them in driver code.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> Besides a minor nitpick, feel free to add:
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Kind regards
> Uffe
>
> [snip]
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
>
> Nitpick:
> Not sure this deserves a WARN. Perhaps a regular dev_err() is sufficient.

Ah well I had a BUG_ON before so presumably this is already a little better ,-)

You can only reach there if you set pfdev->comp->num_pm_domains >
MAX_PM_DOMAINS in the currently matched struct panfrost_compatible
(pfdev->comp->num_pm_domains == num_domains, and see below too), so
the kernel code would actually be actually broken (not the device
tree, nor anything that could be probed). So I'm wondering if the
loudness of a WARN is better in this case? Arguable ,-)

> > +               return -EINVAL;
> [snip]
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> > @@ -21,6 +21,7 @@ struct panfrost_perfcnt;
> >
> >  #define NUM_JOB_SLOTS 3
> >  #define MAX_REGULATORS 2
> > +#define MAX_PM_DOMAINS 3
> >
> >  struct panfrost_features {
> >         u16 id;
> > @@ -61,6 +62,13 @@ struct panfrost_compatible {
> >         /* Supplies count and names. */
> >         int num_supplies;
> >         const char * const *supply_names;
> > +       /*
> > +        * Number of power domains required, note that values 0 and 1 are
> > +        * handled identically, as only values > 1 need special handling.
> > +        */
> > +       int num_pm_domains;
> > +       /* Only required if num_pm_domains > 1. */
> > +       const char * const *pm_domain_names;
> >  };
> >
> >  struct panfrost_device {
> > @@ -73,6 +81,9 @@ struct panfrost_device {
> >         struct clk *bus_clock;
> >         struct regulator_bulk_data regulators[MAX_REGULATORS];
> >         struct reset_control *rstc;
> > +       /* pm_domains for devices with more than one. */
> > +       struct device *pm_domain_devs[MAX_PM_DOMAINS];
> > +       struct device_link *pm_domain_links[MAX_PM_DOMAINS];
> >
> >         struct panfrost_features features;
> >         const struct panfrost_compatible *comp;
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 4d08507526239f2..a6e162236d67fdf 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -663,6 +663,8 @@ const char * const default_supplies[] = { "mali" };
> >  static const struct panfrost_compatible default_data = {
> >         .num_supplies = ARRAY_SIZE(default_supplies),
> >         .supply_names = default_supplies,
> > +       .num_pm_domains = 1, /* optional */
> > +       .pm_domain_names = NULL,
> >  };
> >
> >  static const struct of_device_id dt_match[] = {
> > --
> > 2.25.0.341.g760bfbb309-goog
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
