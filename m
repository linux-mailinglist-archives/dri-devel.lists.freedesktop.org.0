Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5F60DB71
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 08:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17AF10E1B0;
	Wed, 26 Oct 2022 06:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ED810E1B0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:38:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3749B61D56
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B56C43143
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666766333;
 bh=61Hb6HxumLKiyn9KEa/suPToYAXki8IY7g9gAEJU+m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ix/J1CBu0zNHI4/yZvUVCuCYLOIm6BMTQfW4E0VeVobQ+Nl7GXZtwdaCMN4A1VMsT
 zZzztMXs9JbonquBj6U+ssowTM8C3pWK7ZK3PbPS4pI82mfQRA5djbbQbSZ7Pn9eqw
 6aB48A3dTvH3zs5m0KLjClohaDe3UnVaO8oWHT1piY4+t0yZ9dCnsnRWuovDK1JoCz
 t2oiCXW5no2LvtjrZccYqm9LiH1Vb4qPHXCY+j0IzxNoX97RVW54a+pA3e2LPcqd+n
 QTuGoM0w6OvcTJiDeYlZjatA0JmF661nJ/kdMx0l0gRyk6XxnqaxLdi5Dx8Po6ujWO
 uWKcOzkTAp/3A==
Received: by mail-lj1-f170.google.com with SMTP id b8so13778578ljf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 23:38:53 -0700 (PDT)
X-Gm-Message-State: ACrzQf27dIfwXbtMpmMNJ0C6NNGzqzOVPu1uhR8AQf0kWNY6cSIlaFAe
 iDANxrfPXLfyQL3dRVK7AcySXVGl6fPwKU3x+FM=
X-Google-Smtp-Source: AMsMyM66J0TK1LkxGYBKU8UrlEn6zd7Urf//t7Wuf68mxaxnpS0HD2lFafWDcfkGTMvGGHsNtc7opgHrSn5gjZQVKWM=
X-Received: by 2002:a05:6402:270b:b0:45d:61cd:73cc with SMTP id
 y11-20020a056402270b00b0045d61cd73ccmr39530200edd.136.1666766320964; Tue, 25
 Oct 2022 23:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <CGME20221022214657epcas1p18a2625c84cd6470b5404cb71f9836cc8@epcas1p1.samsung.com>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <20221025154330.a3a839357363da6d5de96c89@samsung.com>
In-Reply-To: <20221025154330.a3a839357363da6d5de96c89@samsung.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 26 Oct 2022 09:38:13 +0300
X-Gmail-Original-Message-ID: <CAFCwf11kg-ZvYjEKf=VrvgvM03QZp7GejFhJ=gbCp4up++4h2w@mail.gmail.com>
Message-ID: <CAFCwf11kg-ZvYjEKf=VrvgvM03QZp7GejFhJ=gbCp4up++4h2w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
To: Jiho Chu <jiho.chu@samsung.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 9:43 AM Jiho Chu <jiho.chu@samsung.com> wrote:
>
>
> On Sun, 23 Oct 2022 00:46:22 +0300
> Oded Gabbay <ogabbay@kernel.org> wrote:
>
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index b58ffb1433d6..c13701a8d4be 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
> >  static DEFINE_SPINLOCK(drm_minor_lock);
> >  static struct idr drm_minors_idr;
> >
> > +static DEFINE_SPINLOCK(accel_minor_lock);
> > +static struct idr accel_minors_idr;
> > +
> >  /*
> >   * If the drm core fails to init for whatever reason,
> >   * we should prevent any drivers from registering with it.
> > @@ -94,6 +97,8 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> >               return &dev->primary;
> >       case DRM_MINOR_RENDER:
> >               return &dev->render;
> > +     case DRM_MINOR_ACCEL:
> > +             return &dev->accel;
> >       default:
> >               BUG();
> >       }
> > @@ -108,9 +113,15 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> >
> >       put_device(minor->kdev);
> >
> > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > -     idr_remove(&drm_minors_idr, minor->index);
> > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +     if (minor->type == DRM_MINOR_ACCEL) {
> > +             spin_lock_irqsave(&accel_minor_lock, flags);
> > +             idr_remove(&accel_minors_idr, minor->index);
> > +             spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +     } else {
> > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > +             idr_remove(&drm_minors_idr, minor->index);
> > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +     }
> >  }
> >
> >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > @@ -127,13 +138,23 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >       minor->dev = dev;
> >
> >       idr_preload(GFP_KERNEL);
> > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > -     r = idr_alloc(&drm_minors_idr,
> > -                   NULL,
> > -                   64 * type,
> > -                   64 * (type + 1),
> > -                   GFP_NOWAIT);
> > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +     if (type == DRM_MINOR_ACCEL) {
> > +             spin_lock_irqsave(&accel_minor_lock, flags);
> > +             r = idr_alloc(&accel_minors_idr,
> > +                     NULL,
> > +                     64 * (type - DRM_MINOR_ACCEL),
> > +                     64 * (type - DRM_MINOR_ACCEL + 1),
> > +                     GFP_NOWAIT);
> > +             spin_unlock_irqrestore(&accel_minor_lock, flags);
> > +     } else {
> > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > +             r = idr_alloc(&drm_minors_idr,
> > +                     NULL,
> > +                     64 * type,
> > +                     64 * (type + 1),
> > +                     GFP_NOWAIT);
> > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +     }
>
> Hi,
> There are many functions which checks drm type and decides its behaviors. It's good to
> re-use exiting codes, but accel devices use totally different major/minor, and so it needs to be moved to
> /drvier/accel/ (maybe later..). How about seperating functions for alloc/release minor (accel_minor_alloc..)?
> also, for others which have drm type related codes.
My feeling was moving the minor code handling to a different file (in
addition to moving the major code handling) will cause too much
duplication.
My main theme is that an accel minor is another minor in drm, even if
a bit different. i.e. It uses the same drm_minor structure.
The driver declares he wants to use this minor using a drm driver feature flag.
imo, all of that indicates the code should be inside drm.
>
>
>
>
> > @@ -607,6 +652,14 @@ static int drm_dev_init(struct drm_device *dev,
> >       /* no per-device feature limits by default */
> >       dev->driver_features = ~0u;
> >
> > +     if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> > +                             (drm_core_check_feature(dev, DRIVER_RENDER) ||
> > +                             drm_core_check_feature(dev, DRIVER_MODESET))) {
> > +
> > +             DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
> > +             return -EINVAL;
> > +     }
> > +
>
> It's fine for the device only for acceleration, but can't graphic devices have acceleration feature?
Of course they can :) In that case, and if they want to expose an
accel device char, they should write an accel driver and connect it to
their main graphics driver via auxiliary bus.

I could have added two flags - compute_accel, and compute_accel_only
(similar to a patch that was sent to add render only flag), but imo it
would make the code more convoluted. I prefer the clean separation and
using standard auxiliary bus.

Thanks,
Oded

>
>
> Thanks,
> Jiho Chu
