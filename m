Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A76921B1A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 10:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333D86EB9B;
	Fri, 10 Jul 2020 08:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4816EB9B;
 Fri, 10 Jul 2020 08:51:11 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id e15so2575909vsc.7;
 Fri, 10 Jul 2020 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IqIVvQ2zr6ElD+RZxcXvNwfajcIvHD5hM0pq+5dyaCU=;
 b=FLn2L3Yu3a71IwsJbkyQMnv/2osNAG/OpLYe8aVWnpHC68jeftI7JiS5xkEur8kxr8
 5NHTmxbaEsLcIUnxVR6rii4rGIYH6RKZ59lfFL8So3UnrtKvIw6lxdU7uLFYBeJUNnIm
 tfEpSMgM2TOUjQEI4tpG8lTUAfHJ/RH85mI05YDwSzSztlH5AYXDWGNrnei6VmYZahKC
 AI5y3oT6Ch+wl6ujyswxkMQJKfF2kRbnx51NAIofofKcmxWWI9uyI9welkfj6IDQ34rg
 vKIlPJiXCdkk9Dk/riLmjG7zTZxG8comE2fgeJsZ7tDyRlfXSW3bnr82QgFyZWPwBDFC
 ugfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IqIVvQ2zr6ElD+RZxcXvNwfajcIvHD5hM0pq+5dyaCU=;
 b=UW95Lm3/+qG7Zvop+rVvqmZowvD5LceSOOl1Pu5jM3ODVljmVFyCMufUgj42Ammp62
 PHfigSCqtoGpHvo8US9FXHcGmyjPD93g3ti6jrrUy1dHM0S8UP05cstCb7V8b8LIpi9C
 RmIuCVu+f0rzCEgoqaXne9PqHZkPpU7TRX8E11rIAVOGjNsqRJHnZ3BuBlJj3Y/ikIze
 BJxBq+ml4fFsxEKGKwI3mkbnLGNfMlDVAjkxcXAswRkZ4NansOX7GNk9fLUoavdwveXZ
 f3t3h3frgQDcRiLRpXBxwlcRlyrG30WvQDdRA59hLJsEUzlsWF0irQAC2wWUvD4HOpZQ
 1clg==
X-Gm-Message-State: AOAM532SLT3f4YyL0ZgE38sQegBToxrCG3fS2lOwit9G4tzcA1e1mecB
 XULoZUg1T+IaIKIKPFZgKXcG8mxsla6htj+gW1c=
X-Google-Smtp-Source: ABdhPJxOxsAazACc1kbzqT6xDB5kyDVlMOltsczaiTYVbWwwDKSYWKhNV616GOdXFWDb1WiHKNt7EMLwcaMLICyoP3s=
X-Received: by 2002:a67:c90c:: with SMTP id w12mr41263992vsk.86.1594371070342; 
 Fri, 10 Jul 2020 01:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
 <20200710074143.306787-3-christian.gmeiner@gmail.com>
 <6098f2549eb96348af0ba062d87a716f20d1af1c.camel@pengutronix.de>
In-Reply-To: <6098f2549eb96348af0ba062d87a716f20d1af1c.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2020 10:50:59 +0200
Message-ID: <CAH9NwWex+9LvaBhzPkYDaYOHnvxFeK4sAMgFZi2i5b+TOSVPmA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/etnaviv: add loadavg accounting
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hoi Lucas,

Am Fr., 10. Juli 2020 um 10:19 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Hi Christian,
>
> Am Freitag, den 10.07.2020, 09:41 +0200 schrieb Christian Gmeiner:
> > The GPU has an idle state register where each bit represents the idle
> > state of a sub-GPU component like FE or TX. Sample this register
> > every 10ms and calculate a simple moving average over the sub-GPU
> > component idle states with a total observation time frame of 1s.
> >
> > This provides us with a percentage based load of each sub-GPU
> > component.
> >
> > Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 14 ++++++++++++
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 32 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 29 ++++++++++++++++++++++++
> >  3 files changed, 75 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index f9afe11c50f0..b31920241c86 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > @@ -46,6 +46,19 @@ static void load_gpu(struct drm_device *dev)
> >       }
> >  }
> >
> > +static void unload_gpu(struct drm_device *dev)
> > +{
> > +     struct etnaviv_drm_private *priv = dev->dev_private;
> > +     unsigned int i;
> > +
> > +     for (i = 0; i < ETNA_MAX_PIPES; i++) {
> > +             struct etnaviv_gpu *g = priv->gpu[i];
> > +
> > +             if (g)
> > +                     etnaviv_gpu_shutdown(g);
> > +     }
> > +}
> > +
> >  static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
> >  {
> >       struct etnaviv_drm_private *priv = dev->dev_private;
> > @@ -581,6 +594,7 @@ static void etnaviv_unbind(struct device *dev)
> >       struct drm_device *drm = dev_get_drvdata(dev);
> >       struct etnaviv_drm_private *priv = drm->dev_private;
> >
> > +     unload_gpu(drm);
> >       drm_dev_unregister(drm);
> >
> >       component_unbind_all(dev, drm);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > index a31eeff2b297..1f0eb7e00657 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -714,6 +714,28 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
> >       gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
> >  }
> >
> > +static void etnaviv_loadavg_function(struct timer_list *t)
> > +{
> > +     struct etnaviv_gpu *gpu = from_timer(gpu, t, loadavg_timer);
> > +     const u32 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);
>
> This isn't guaranteed to work on a clock/power gated GPU. Also we
> surely don't want to wake a idle system every 10ms just to sample a "no
> load" value, so this needs some integration with runtime PM, to disable
> the sampling when the GPU is powered down and enable when powered up.
> The loadavg must be able to adapt to jumps in the sampling interval
> while idle.
>

Oh yea.. runtime PM.. I thought I was missing something. Will tackle this in the
next version.

>
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> > +             if ((idle & etna_idle_module_names[i].bit))
> > +                     sma_loadavg_add(&gpu->loadavg_value[i], 0);
> > +             else
> > +                     sma_loadavg_add(&gpu->loadavg_value[i], 100);
> > +
> > +     spin_lock_bh(&gpu->loadavg_spinlock);
> > +
> > +     for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> > +             gpu->loadavg_percentage[i] = sma_loadavg_read(&gpu->loadavg_value[i]);
> > +
> > +     spin_unlock_bh(&gpu->loadavg_spinlock);
> > +
> > +     mod_timer(t, jiffies + msecs_to_jiffies(10));
>
> A jiffies based timer is much too coarse for a regular 10ms sampling.
> On a typical 100Hz system 10ms is a single jiffy, so your timer will
> fire anywhere in the range of ~0ms...~20ms. This won't get us a usable
> measurement.
>

Makes sense.. will switch to hrtimers.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
