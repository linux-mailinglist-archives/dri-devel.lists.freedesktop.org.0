Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064B563FF2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4226B1132C3;
	Sat,  2 Jul 2022 11:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8111358F;
 Sat,  2 Jul 2022 11:54:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o25so8430327ejm.3;
 Sat, 02 Jul 2022 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1CyXqw9OkuKSdVWBlZl1KPln+Gh+t6u1496KNl8YXmo=;
 b=MVJ4amnJnrGzfZUqZoEUrFA32dw+5Fba8ot3jnouApwnK73yqqhIFVxLuJ2+ByEqzI
 8dpXaAQfNkb1Fp44e8Lhm8XooREooXLEi3qdfbR2RrgzUIpPuEeycGuhe7aqwC5FCt/1
 ly/mZSXqh3Xxuwv4V5PciLYc7LwT0RUepEtmi3EPfSoTveD0z1D/baSAechcbgiMgu2z
 CBqSMd2LFzwZAxiFgpDQd/G7KKdfsrMpc4pV9xu2r82nVssCRlB1TemkGPuHVk2GVlQ2
 T36PSC6JLWSmiQtWkQTbORbNYxT985Q+7d14nPsdFP5uis815pp7GRqfRFQd2eUjzotl
 xMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1CyXqw9OkuKSdVWBlZl1KPln+Gh+t6u1496KNl8YXmo=;
 b=Yf3blkUE3R7MdgN6PYDX+e76o9x+Lj+MHALcNIayRTw0lbuZuF8zpfRVC3Nu36/yI1
 d3SsoN+D5KoMOA4QNskriJPJiCVsklIkS83jfh+7VkK7A0sfGZssjd7G0HwA3dddkKpm
 hrDiWIx26KJJDKJWj88o9hYtNp3Xe+t6nn82LsB6Y4F2L5VnKPBJRdfnace/IHqlIa19
 FZTZhZLKx4gI4QLoWrMDpAMj/8bX/S9rsDi5gPD8ZHF/gN8SEcT0pSVS249wvn9EK+I3
 VFRhXhyHzS8TxzM3z3sZ+VGEx1mWLG88Q8udQQN2YNp6JADzfP1quLtLo8U+9eO5KojX
 DTOw==
X-Gm-Message-State: AJIora8qnG32r4mKhs6rbzsKf6EJt1lhB/dsA6FO9Q6u7bK5YZjj3byN
 rLN/cv6aHeD80s439R5kEPm1958qRghgosfTcxg=
X-Google-Smtp-Source: AGRyM1s9wfIBIfJJk81+dNJn9FW1qInp8cfDRWXUPCsJRtezMtEVvpQY7b5XZj9HXHJgnQSSf0KZaId7UsIdTt9aU5s=
X-Received: by 2002:a17:906:4e91:b0:722:f996:fa20 with SMTP id
 v17-20020a1709064e9100b00722f996fa20mr19191345eju.733.1656762845264; Sat, 02
 Jul 2022 04:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
 <20220621072050.76229-3-christian.gmeiner@gmail.com>
 <1371d97eff945cac085d7701ed76a6f422d3cd1d.camel@pengutronix.de>
In-Reply-To: <1371d97eff945cac085d7701ed76a6f422d3cd1d.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 2 Jul 2022 13:53:54 +0200
Message-ID: <CAH9NwWckY+ihZwQvff9E-3uO-P6chZSs9io554bDpEfsLujM9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/etnaviv: add loadavg accounting
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP"
 <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Fr., 24. Juni 2022 um 11:38 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Am Dienstag, dem 21.06.2022 um 09:20 +0200 schrieb Christian Gmeiner:
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
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 14 ++++++
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 64 ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 37 ++++++++++++++++
> >  3 files changed, 114 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > index 1d2b4fb4bcf8..d5c6115e56bd 100644
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
> > @@ -557,6 +570,7 @@ static void etnaviv_unbind(struct device *dev)
> >       struct drm_device *drm = dev_get_drvdata(dev);
> >       struct etnaviv_drm_private *priv = drm->dev_private;
> >
> > +     unload_gpu(drm);
> >       drm_dev_unregister(drm);
> >
> >       component_unbind_all(dev, drm);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > index 37018bc55810..202002ae75ee 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -27,6 +27,8 @@
> >  #include "state_hi.xml.h"
> >  #include "cmdstream.xml.h"
> >
> > +static const ktime_t loadavg_polling_frequency = 10 * NSEC_PER_MSEC;
> > +
> Feeling like a nitpicker, but the thing defined here isn't a frequency,
> but a time delta/interval.
>

Will rename it in the next version of the patch series.

>
> >  static const struct platform_device_id gpu_ids[] = {
> >       { .name = "etnaviv-gpu,2d" },
> >       { },
> > @@ -745,6 +747,32 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
> >       gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
> >  }
> >
> > +static enum hrtimer_restart etnaviv_loadavg_function(struct hrtimer *t)
> > +{
> > +     struct etnaviv_gpu *gpu = container_of(t, struct etnaviv_gpu, loadavg_timer);
> > +     const u32 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);
> > +     int i;
> > +
> > +     gpu->loadavg_last_sample_time = ktime_get();
> > +
> > +     for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> > +             if ((idle & etna_idle_module_names[i].bit))
> > +                     sma_loadavg_add(&gpu->loadavg_value[i], 0);
> > +             else
> > +                     sma_loadavg_add(&gpu->loadavg_value[i], 100);
> > +
> > +     spin_lock(&gpu->loadavg_spinlock);
> > +
> > +     for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> > +             gpu->loadavg_percentage[i] = sma_loadavg_read(&gpu->loadavg_value[i]);
> > +
> > +     spin_unlock(&gpu->loadavg_spinlock);
>
> After pondering this for a bit, I don't think we need this spinlock.
> The percentage is a single value per engine, so they are already single
> write atomic. The worst thing that can happen without this spinlock is
> that on read of the loadavg some engines already have the value of
> sample period n+1 integrated, while another set is still at n, which I
> don't think we care much about, as those load values are already quite
> coarse.
>

Okay.. will remove the spinlock.

> > +
> > +     hrtimer_forward_now(t, loadavg_polling_frequency);
> > +
> > +     return HRTIMER_RESTART;
> > +}
> > +
> >  int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> >  {
> >       struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> > @@ -839,6 +867,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> >       for (i = 0; i < ARRAY_SIZE(gpu->event); i++)
> >               complete(&gpu->event_free);
> >
> > +     /* Setup loadavg timer */
> > +     hrtimer_init(&gpu->loadavg_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_SOFT);
> > +     gpu->loadavg_timer.function = etnaviv_loadavg_function;
> > +     hrtimer_start(&gpu->loadavg_timer, loadavg_polling_frequency, HRTIMER_MODE_ABS_SOFT);
> > +
> >       /* Now program the hardware */
> >       mutex_lock(&gpu->lock);
> >       etnaviv_gpu_hw_init(gpu);
> > @@ -859,6 +892,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
> >       return ret;
> >  }
> >
> > +void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu)
> > +{
> > +     hrtimer_cancel(&gpu->loadavg_timer);
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  struct dma_debug {
> >       u32 address[2];
> > @@ -1585,6 +1623,8 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
> >  static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
> >  {
> >       if (gpu->initialized && gpu->fe_running) {
> > +             hrtimer_cancel(&gpu->loadavg_timer);
> > +
> This isn't symmetric. Here you only cancel the timer when FE was
> running, but in the resume function you unconditionally start the
> timer.
>
>
> Moving the timer start into etnaviv_gpu_start_fe() seems to be a good
> idea. Sampling the idle state of a GPU with the FE not running doesn't
> make much sense in the first place, as it will unsurprisingly be fully
> idle. Doing this would also allow you to drop the
> etnaviv_gpu_shutdown() and unload_gpu() functions, as the timer doesn't
> need to be started when initializing the GPU.
>

Will try that.

>
> >               /* Replace the last WAIT with END */
> >               mutex_lock(&gpu->lock);
> >               etnaviv_buffer_end(gpu);
> > @@ -1608,7 +1648,8 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
> >  #ifdef CONFIG_PM
> >  static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
> >  {
> > -     int ret;
> > +     s64 missing_samples;
> > +     int ret, i, j;
> >
> >       ret = mutex_lock_killable(&gpu->lock);
> >       if (ret)
> > @@ -1617,7 +1658,27 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
> >       etnaviv_gpu_update_clock(gpu);
> >       etnaviv_gpu_hw_init(gpu);
> >
> > +     /* Update loadavg based on delta of suspend and resume ktime.
> > +      *
> > +      * Our SMA algorithm uses a fixed size of 100 items to be able
> > +      * to calculate the mean over one second as we sample every 10ms.
> > +      */
> > +     missing_samples = div_s64(ktime_ms_delta(ktime_get(), gpu->loadavg_last_sample_time), 10);
>
> In the timer function you use the loadavg_polling_frequency const for
> this value. It would be good to be consistent here. Probably just
> #define the polling interval and use this both here and in the timer
> function.
>

Okay.

> > +     missing_samples = min(missing_samples, (s64)100);
> > +
> > +     spin_lock_bh(&gpu->loadavg_spinlock);
> > +
> > +     for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++) {
> > +             struct sma_loadavg *loadavg = &gpu->loadavg_value[i];
> > +
> > +             for (j = 0; j < missing_samples; j++)
> > +                     sma_loadavg_add(loadavg, 0);
> > +     }
> > +
> > +     spin_unlock_bh(&gpu->loadavg_spinlock);
> > +
> >       mutex_unlock(&gpu->lock);
> > +     hrtimer_start(&gpu->loadavg_timer, loadavg_polling_frequency, HRTIMER_MODE_ABS_SOFT);
> >
> >       return 0;
> >  }
> > @@ -1787,6 +1848,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
> >       gpu->dev = &pdev->dev;
> >       mutex_init(&gpu->lock);
> >       mutex_init(&gpu->fence_lock);
> > +     spin_lock_init(&gpu->loadavg_spinlock);
> >
> >       /* Map registers: */
> >       gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > index 85eddd492774..881f071f640e 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> > @@ -10,6 +10,8 @@
> >  #include "etnaviv_gem.h"
> >  #include "etnaviv_mmu.h"
> >  #include "etnaviv_drv.h"
> > +#include "etnaviv_sma.h"
> > +#include "state_hi.xml.h"
> >
> >  struct etnaviv_gem_submit;
> >  struct etnaviv_vram_mapping;
> > @@ -91,6 +93,33 @@ struct clk;
> >
> >  #define ETNA_NR_EVENTS 30
> >
> > +DECLARE_SMA(loadavg, 100)
> > +
> > +static const struct {
> > +    const char *name;
> > +    u32 bit;
> > +} etna_idle_module_names[] = {
>
> Drop the _names prefix. This isn't just enumerating names, but also the
> bit positions in the state register.
>

Okay.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
