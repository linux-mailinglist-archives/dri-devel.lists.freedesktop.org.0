Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B88C9969
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 09:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4C110E19D;
	Mon, 20 May 2024 07:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="SyIZ43pI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0F310E124
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 07:39:30 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-61bee45d035so21892537b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1716190770;
 x=1716795570; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ow9jbuVKIW09zvKzQpjf809fGluRD4ku6Wkb2RBqfMs=;
 b=SyIZ43pIwkFqdD0mAqdZKCRpwzZB6DGHdkAcPBegRT9eIM2zjtu0iHTCjdSuGc5vkT
 0oD9Hw8SLPMHKhg1l9GGkuHhcIVtm+tJMNkuQ3tIHepEvUCFwo55rMP/8k9inn5HKGGM
 pEJsuKaloPNuG5qz+teweG8Xeb2ISariklbizvM/aWhlrurW3HtSpeZHiQjuyoM2uU4W
 d+mYipzhNRqqoJHV7W9tMuHMmcT6dChcpblD1k4k79xCMRwJAXQyQHP0X1XHg8VMhEBr
 UYbhWHJlaM5QXqd1O8/pZR1k4jveOWPAoP0SIM3Qqu7l9XfScA+aT0g2hlwd2wd2+FJG
 DXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716190770; x=1716795570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ow9jbuVKIW09zvKzQpjf809fGluRD4ku6Wkb2RBqfMs=;
 b=vrHq/0jXr2Vz17DXINECpnLJWagl356v5vugzpeNipnWG5QeBTsjYuQlY6kvGVZqzg
 kBUKwOBhq/lp0+VRUL/WpMDqyXUhXvcLqdSVGDsJUC677MlyfqqgXQTByZ7FRpMcZgW6
 BCxf9Q3K72RGcnNDClz1nUBA8g647yd2p5u0pjq1B4R8wbR4lvS1DmrtWPnTVvNblbEN
 Gb05COcZntntmq5xinh21KrkA4kIzdd5KwUuJ3tqGMSqKZSAWpN7x5XDULQyHXxqZA9F
 neFuinIxH2ELTPfXdPVHLkQb/VBxQfNlSELvJwjs/yI1LUIjRU8514Yg4vPAf6O0olQj
 M5vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9jVsHqKgYZcD9u9fT9CGq2qnryjJpUg9yz6EOfFWyAveQCmA/1aRrJIkL+qpRReOlWowCSo1bFI9y3I2Mva06dE0XMytnkTtc+xlqxYvs
X-Gm-Message-State: AOJu0YzoFEP0OSAgT42yhB7KFddgAt6HHfuK7Sf2m6G59m9MxsaKlNM8
 QUzdu1quMSkJlH/k2U+9uQRmf/3uL2xU1CjQUGm6kByuPBj0lAW3i8dL9XCl25bSoT9JEUqB9d7
 5rSU=
X-Google-Smtp-Source: AGHT+IFqb9nuBFQeOXGAPvFgRgWHb0JrgkE8TxlyisKizY9+JcmzWl618Ca47S47aQ3EQIscZDd2oQ==
X-Received: by 2002:a81:a744:0:b0:618:6aa1:a972 with SMTP id
 00721157ae682-622affc78eemr254888727b3.5.1716190769777; 
 Mon, 20 May 2024 00:39:29 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e379521sm47607937b3.120.2024.05.20.00.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 00:39:29 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso2001895276.2; 
 Mon, 20 May 2024 00:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXh49GXk3Sxi6sETdjwP55qcOET/A3LE0DGJTqv0+408/5jWA9beutxvJa1JH1oZsU02H0BD/7SiF8gsSus1SdjTK2gfDkwV5/YXzLqc5WgtuN1Ijy596QRPY61ONWFFCN7aWTKVXjOckBQddeMQg==
X-Received: by 2002:a5b:7c6:0:b0:df4:969f:3dcd with SMTP id
 3f1490d57ef6-df4969f3f35mr3728366276.50.1716190768803; Mon, 20 May 2024
 00:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
In-Reply-To: <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 20 May 2024 09:39:17 +0200
X-Gmail-Original-Message-ID: <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
Message-ID: <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
>
> Hi Tomeu,
>
> Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso:
> > If we expose a render node for NPUs without rendering capabilities, the
> > userspace stack will offer it to compositors and applications for
> > rendering, which of course won't work.
> >
> > Userspace is probably right in not questioning whether a render node
> > might not be capable of supporting rendering, so change it in the kerne=
l
> > instead by exposing a /dev/accel node.
> >
> > Before we bring the device up we don't know whether it is capable of
> > rendering or not (depends on the features of its blocks), so first try
> > to probe a rendering node, and if we find out that there is no renderin=
g
> > hardware, abort and retry with an accel node.
> >
> I thought about this for a while. My opinion is that this is the wrong
> approach. We are adding another path to the kernel driver, potentially
> complicating the userspace side, as now the NPU backend needs to look
> for both render and accel nodes. While currently accel and drm are
> pretty closely related and we can share most of the driver, it might
> still be a maintenance hassle in the long run.
>
> On the other hand we already have precedence of compute only DRM
> devices exposing a render node: there are AMD GPUs that don't expose a
> graphics queue and are thus not able to actually render graphics. Mesa
> already handles this in part via the PIPE_CAP_GRAPHICS and I think we
> should simply extend this to not offer a EGL display on screens without
> that capability.

The problem with this is that the compositors I know don't loop over
/dev/dri files, trying to create EGL screens and moving to the next
one until they find one that works.

They take the first render node (unless a specific one has been
configured), and assumes it will be able to render with it.

To me it seems as if userspace expects that /dev/dri/renderD* devices
can be used for rendering and by breaking this assumption we would be
breaking existing software.

Which is what I understood to be the whole point behind the decision
to create a new device file hierarchy for accelerators. Or am I
missing something?

Adding Daniel Stone to CC in case he wants to give his opinion from
the compositor point of view.

Cheers,

Tomeu

> Regards,
> Lucas
>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 46 ++++++++++++++++++++++-----
> >  1 file changed, 38 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/et=
naviv/etnaviv_drv.c
> > index 6500f3999c5f..8e7dd23115f4 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/uaccess.h>
> >
> > +#include <drm/drm_accel.h>
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> > @@ -488,10 +489,10 @@ static const struct drm_ioctl_desc etnaviv_ioctls=
[] =3D {
> >       ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
> >  };
> >
> > -DEFINE_DRM_GEM_FOPS(fops);
> > +DEFINE_DRM_GEM_FOPS(render_fops);
> > +DEFINE_DRM_ACCEL_FOPS(accel_fops);
> >
> > -static const struct drm_driver etnaviv_drm_driver =3D {
> > -     .driver_features    =3D DRIVER_GEM | DRIVER_RENDER,
> > +static struct drm_driver etnaviv_drm_driver =3D {
> >       .open               =3D etnaviv_open,
> >       .postclose           =3D etnaviv_postclose,
> >       .gem_prime_import_sg_table =3D etnaviv_gem_prime_import_sg_table,
> > @@ -500,7 +501,6 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
> >  #endif
> >       .ioctls             =3D etnaviv_ioctls,
> >       .num_ioctls         =3D DRM_ETNAVIV_NUM_IOCTLS,
> > -     .fops               =3D &fops,
> >       .name               =3D "etnaviv",
> >       .desc               =3D "etnaviv DRM",
> >       .date               =3D "20151214",
> > @@ -508,15 +508,20 @@ static const struct drm_driver etnaviv_drm_driver=
 =3D {
> >       .minor              =3D 4,
> >  };
> >
> > -/*
> > - * Platform driver:
> > - */
> > -static int etnaviv_bind(struct device *dev)
> > +static int etnaviv_bind_with_type(struct device *dev, u32 type)
> >  {
> >       struct etnaviv_drm_private *priv;
> >       struct drm_device *drm;
> > +     bool is_compute_only =3D true;
> >       int ret;
> >
> > +     etnaviv_drm_driver.driver_features =3D DRIVER_GEM | type;
> > +
> > +     if (type =3D=3D DRIVER_RENDER)
> > +             etnaviv_drm_driver.fops =3D &render_fops;
> > +     else
> > +             etnaviv_drm_driver.fops =3D &accel_fops;
> > +
> >       drm =3D drm_dev_alloc(&etnaviv_drm_driver, dev);
> >       if (IS_ERR(drm))
> >               return PTR_ERR(drm);
> > @@ -553,6 +558,18 @@ static int etnaviv_bind(struct device *dev)
> >
> >       load_gpu(drm);
> >
> > +     for (unsigned int i =3D 0; i < ETNA_MAX_PIPES; i++) {
> > +             struct etnaviv_gpu *g =3D priv->gpu[i];
> > +
> > +             if (g && (g->identity.minor_features8 & chipMinorFeatures=
8_COMPUTE_ONLY) =3D=3D 0)
> > +                     is_compute_only =3D false;
> > +     }
> > +
> > +     if (type =3D=3D DRIVER_RENDER && is_compute_only) {
> > +             ret =3D -EINVAL;
> > +             goto out_unbind;
> > +     }
> > +
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >               goto out_unbind;
> > @@ -571,6 +588,19 @@ static int etnaviv_bind(struct device *dev)
> >       return ret;
> >  }
> >
> > +/*
> > + * Platform driver:
> > + */
> > +static int etnaviv_bind(struct device *dev)
> > +{
> > +     int ret =3D etnaviv_bind_with_type(dev, DRIVER_RENDER);
> > +
> > +     if (ret =3D=3D -EINVAL)
> > +             return etnaviv_bind_with_type(dev, DRIVER_COMPUTE_ACCEL);
> > +
> > +     return ret;
> > +}
> > +
> >  static void etnaviv_unbind(struct device *dev)
> >  {
> >       struct drm_device *drm =3D dev_get_drvdata(dev);
>
