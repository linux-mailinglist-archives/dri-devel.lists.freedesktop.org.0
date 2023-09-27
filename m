Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989117B0342
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 13:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2571310E4DB;
	Wed, 27 Sep 2023 11:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095FE10E4DB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 11:42:25 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d81dd7d76e0so12558426276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695814945; x=1696419745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIt1l7/IgUpo4k3Bjm4G/lamSevl4u5gHJJCk6sbhjY=;
 b=BqEPWr8G8dQJJCVi8UwvpUnuDcdRigmqkWBoTpCEf8jHfylH5ST+8VUPrK5QBvdOXj
 dr51mAyfLtBLZVJqPgrtw3fBK14tboXGmfuTN1HSLP6uCl+hIaxw/iXWD9+WYhPEL+SY
 Kk31ffVcId5PeD8F27rTLVVIwwlwLyOMX/3MOeKTGXDAlnb9YZe4JumYJVF9dp1uUrLK
 Ju6TAmngnE56uhB8ETsUz+IdETBQexL7Y2pTHsy1uAmOGasr4v7sKek++bo64FZuw8Ag
 4MP28c8BQE4iYoaJDWFJleKIjFCBR4AfMZNH/1SnWC+GCKBax9t6A2XZxEu+GaoKomYP
 dBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695814945; x=1696419745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIt1l7/IgUpo4k3Bjm4G/lamSevl4u5gHJJCk6sbhjY=;
 b=CDBfm8NyWdKOFPqfWeVeO2gYNbvs45sdS6kgpMU9Oe+Q+X2SJsOpscQnG4te3Oz4GF
 Sy3pUYWHbZ3la7fkdpPrfK5IaarwI6dqin1XhtcaziAyworIy6hyU/woAkb+Uy+04DUM
 uHFBInqWk4we8v8HkYOvj6/6sDjJRcGboPtMfWE5x09V1r+6nJR7tPOmHYwCjQdWaJNJ
 N5IRUPzgQKmdZzhtSBFK15CzDvJy1Dn+QS45NEAoj55+30O7ZC0YQTyfISfKQFkOipm/
 qHGkaAXCGu25/A7TqN3Bqjzvq/TUSe4Ul/dTHOH4ICXhzE11Ta3ljs92wFNumU6OmHTC
 +Z6w==
X-Gm-Message-State: AOJu0YwGknT0/U2pDhDYXW6Qwxyfwp0JQwM2h11N8LqzpU8uTXJm4EWB
 pYDtpTHl/quZMhNGNApvzmhVesT4kXj7M52tsQQ+zQ==
X-Google-Smtp-Source: AGHT+IHBVFquJJT8K4Rl86v3hUqmDvjlekCjqCBE5F8bmAbHvZ8Ouu4MachaenQPWgpZPR02xLIw1xRN9sVjV4UBFTI=
X-Received: by 2002:a25:dccb:0:b0:d81:ce57:571a with SMTP id
 y194-20020a25dccb000000b00d81ce57571amr1701528ybe.54.1695814944913; Wed, 27
 Sep 2023 04:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
 <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
In-Reply-To: <CAMuHMdV9Ahp2ACYfRbnnnMbn9Cps939uwCQM+Md_PcCKYG=piw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Sep 2023 13:41:49 +0200
Message-ID: <CAPDyKFodCrFPVTdNo8VBG8FHs26MVaY9WcOmYyu7YwjahvuzTA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, j@jannau.net,
 Linux PM list <linux-pm@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sept 2023 at 09:32, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
>
> CC genpd
>
> On Mon, Sep 18, 2023 at 10:24=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> > Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
> > > From: Janne Grunau <j@jannau.net>
> > >
> > > Multiple power domains need to be handled explicitly in each driver. =
The
> > > driver core can not handle it automatically since it is not aware of
> > > power sequencing requirements the hardware might have. This is not a
> > > problem for simpledrm since everything is expected to be powered on b=
y
> > > the bootloader. simpledrm has just ensure it remains powered on durin=
g
> > > its lifetime.
> > > This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> > > systems. The HDMI output initialized by the bootloader requires keepi=
ng
> > > the display controller and a DP phy power domain on.
> > >
> > > Signed-off-by: Janne Grunau <j@jannau.net>
>
> Thanks for your patch, which is now commit 61df9ca231075e70
> ("drm/simpledrm: Add support for multiple "power-domains"") in
> drm-misc/for-linux-next.
>
> > As a simpledrm patch:
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Do you want to wait for another review from  someone with
> > power-management expertise?
>
> Yeah, why not? Let's CC them, so they become aware...
>
> > Do we need a similar patch for ofdrm?

Drivers/subsystems for devices that are attached to multiple PM
domains are getting more and more common. Clearly there is boilerplate
code in drivers that we could get rid of, by using some common helper
functions to deal with attach/detach.

I believe there have been some attempts to add such helpers too, but
we didn't quite reach a point where those were ready to be applied. It
sounds like someone (me? :-)) needs to find some time to revisit this.
Until then, there is no other way than having each driver to deal with
this.

Kind regards
Uffe

> >
> > Best regards
> > Thomas
> >
> > > ---
> > > Changes in v2:
> > > - removed broken drm_err() log statement only ment for debugging
> > > - removed commented cast
> > > - use correct format spcifier for 'int' in log statement
> > > - add 'continue;' after failure to get device for power_domain
> > > - use drm_warn() in non fatal error cases
> > > - removed duplicate PTR_ERR conversion
> > > - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-p=
ower-domains-v1-1-f8718aefc685@jannau.net
> > > ---
> > >   drivers/gpu/drm/tiny/simpledrm.c | 105 ++++++++++++++++++++++++++++=
+++++++++++
> > >   1 file changed, 105 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/=
simpledrm.c
> > > index ff86ba1ae1b8..9c597461d1e2 100644
> > > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > > @@ -6,6 +6,7 @@
> > >   #include <linux/of_address.h>
> > >   #include <linux/platform_data/simplefb.h>
> > >   #include <linux/platform_device.h>
> > > +#include <linux/pm_domain.h>
> > >   #include <linux/regulator/consumer.h>
> > >
> > >   #include <drm/drm_aperture.h>
> > > @@ -227,6 +228,12 @@ struct simpledrm_device {
> > >       unsigned int regulator_count;
> > >       struct regulator **regulators;
> > >   #endif
> > > +     /* power-domains */
> > > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > > +     int pwr_dom_count;
> > > +     struct device **pwr_dom_devs;
> > > +     struct device_link **pwr_dom_links;
> > > +#endif
> > >
> > >       /* simplefb settings */
> > >       struct drm_display_mode mode;
> > > @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(str=
uct simpledrm_device *sdev)
> > >   }
> > >   #endif
> > >
> > > +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> > > +/*
> > > + * Generic power domain handling code.
> > > + *
> > > + * Here we handle the power-domains properties of our "simple-frameb=
uffer"
> > > + * dt node. This is only necessary if there is more than one power-d=
omain.
> > > + * A single power-domains is handled automatically by the driver cor=
e. Multiple
> > > + * power-domains have to be handled by drivers since the driver core=
 can't know
> > > + * the correct power sequencing. Power sequencing is not an issue fo=
r simpledrm
> > > + * since the bootloader has put the power domains already in the cor=
rect state.
> > > + * simpledrm has only to ensure they remain active for its lifetime.
> > > + *
> > > + * When the driver unloads, we detach from the power-domains.
> > > + *
> > > + * We only complain about errors here, no action is taken as the mos=
t likely
> > > + * error can only happen due to a mismatch between the bootloader wh=
ich set
> > > + * up the "simple-framebuffer" dt node, and the PM domain providers =
in the
> > > + * device tree. Chances are that there are no adverse effects, and i=
f there are,
> > > + * a clean teardown of the fb probe will not help us much either. So=
 just
> > > + * complain and carry on, and hope that the user actually gets a wor=
king fb at
> > > + * the end of things.
> > > + */
> > > +static void simpledrm_device_detach_genpd(void *res)
> > > +{
> > > +     int i;
> > > +     struct simpledrm_device *sdev =3D res;
> > > +
> > > +     if (sdev->pwr_dom_count <=3D 1)
> > > +             return;
> > > +
> > > +     for (i =3D sdev->pwr_dom_count - 1; i >=3D 0; i--) {
> > > +             if (!sdev->pwr_dom_links[i])
> > > +                     device_link_del(sdev->pwr_dom_links[i]);
> > > +             if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> > > +                     dev_pm_domain_detach(sdev->pwr_dom_devs[i], tru=
e);
> > > +     }
> > > +}
> > > +
> > > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sd=
ev)
> > > +{
> > > +     struct device *dev =3D sdev->dev.dev;
> > > +     int i;
> > > +
> > > +     sdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node=
, "power-domains",
> > > +                                                      "#power-domain=
-cells");
> > > +     /*
> > > +      * Single power-domain devices are handled by driver core nothi=
ng to do
> > > +      * here. The same for device nodes without "power-domains" prop=
erty.
> > > +      */
> > > +     if (sdev->pwr_dom_count <=3D 1)
> > > +             return 0;
> > > +
> > > +     sdev->pwr_dom_devs =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > > +                                            sizeof(*sdev->pwr_dom_de=
vs),
> > > +                                            GFP_KERNEL);
> > > +     if (!sdev->pwr_dom_devs)
> > > +             return -ENOMEM;
> > > +
> > > +     sdev->pwr_dom_links =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> > > +                                             sizeof(*sdev->pwr_dom_l=
inks),
> > > +                                             GFP_KERNEL);
> > > +     if (!sdev->pwr_dom_links)
> > > +             return -ENOMEM;
> > > +
> > > +     for (i =3D 0; i < sdev->pwr_dom_count; i++) {
> > > +             sdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(de=
v, i);
> > > +             if (IS_ERR(sdev->pwr_dom_devs[i])) {
> > > +                     int ret =3D PTR_ERR(sdev->pwr_dom_devs[i]);
> > > +                     if (ret =3D=3D -EPROBE_DEFER) {
> > > +                             simpledrm_device_detach_genpd(sdev);
> > > +                             return ret;
> > > +                     }
> > > +                     drm_warn(&sdev->dev,
> > > +                              "pm_domain_attach_by_id(%u) failed: %d=
\n", i, ret);
> > > +                     continue;
> > > +             }
> > > +
> > > +             sdev->pwr_dom_links[i] =3D device_link_add(dev,
> > > +                                                      sdev->pwr_dom_=
devs[i],
> > > +                                                      DL_FLAG_STATEL=
ESS |
> > > +                                                      DL_FLAG_PM_RUN=
TIME |
> > > +                                                      DL_FLAG_RPM_AC=
TIVE);
> > > +             if (!sdev->pwr_dom_links[i])
> > > +                     drm_warn(&sdev->dev, "failed to link power-doma=
in %d\n", i);
> > > +     }
> > > +
> > > +     return devm_add_action_or_reset(dev, simpledrm_device_detach_ge=
npd, sdev);
> > > +}
> > > +#else
> > > +static int simpledrm_device_attach_genpd(struct simpledrm_device *sd=
ev)
> > > +{
> > > +     return 0;
> > > +}
> > > +#endif
> > > +
> > >   /*
> > >    * Modesetting
> > >    */
> > > @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_=
create(struct drm_driver *drv,
> > >       if (ret)
> > >               return ERR_PTR(ret);
> > >       ret =3D simpledrm_device_init_regulators(sdev);
> > > +     if (ret)
> > > +             return ERR_PTR(ret);
> > > +     ret =3D simpledrm_device_attach_genpd(sdev);
> > >       if (ret)
> > >               return ERR_PTR(ret);
> > >
> > >
> > > ---
> > > base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> > > change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
