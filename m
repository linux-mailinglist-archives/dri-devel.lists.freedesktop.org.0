Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4666540342
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 18:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68410E296;
	Tue,  7 Jun 2022 16:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9310E296;
 Tue,  7 Jun 2022 16:02:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso3930377wml.1; 
 Tue, 07 Jun 2022 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sj24kgZtfXREXFgvbZGYuSQpYVOwbaKfG0SgT6LrWaE=;
 b=ftJs193nBakUNsSpferoDs0mNetkJfhPd+Av5tn8HvVLQPnQ/mfAjzz0pR30ZPtmlc
 E6Y6ZTLvFbWhQjY/brXMcv+vIQxAhOGZuCu3Wg31BDHZ7lfh29nINMKF+srY+P29g5GJ
 axVLYxIBk/KXfVSZ3/fYCobsKViM3MbgwtPSb9lcipwKfS4erGn64wg3QchUFIE1+EFQ
 vCcKYgyYWXgNEjxF+RZbElm0k6EkeLd8XsxYsSbvO2izDqpn2TnpG9UyuEG+JHiZE6AQ
 /kEnZBicwCJPOgeJTu3rRlV99PCZEUdW80MEZ03fKgWLpo+vkaKw2mm/Z42MRpwrPnfH
 dpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sj24kgZtfXREXFgvbZGYuSQpYVOwbaKfG0SgT6LrWaE=;
 b=tjK9/4ZSiEJ4OiH1BuEpOtyT7cJbixYSyuGiG2GTEVR0CR6yUPozvHU8ETLQuCiY9w
 m22oyj5rRT601vAx7H3yDDmvZxHgi/NW2TfWF3whatXe3296zYVr0+KYR0Rs01Kpb0ED
 qABcgnoSZnUptSeKUTMx2QaIgd7GeKd7tOVbZ2icLSZ8QFwxXFKs6Evuy/Gf7HgJJrnH
 NOiXbVE/qTLpAHAhv+2vadIfGjBw7ovTERcKCWWf3PmQMDc2jb049j6Fa0dUA77LEKHg
 7Re9Y1IAyMOgs5Rwwmx/zoWt6NWe4nt83ounOgSm9eJ8PAR4CjL7zuDA9yTriLORU7p1
 TwTQ==
X-Gm-Message-State: AOAM530cSJkKr0vOUPKHpzlvf9veOLDVYctjdBZXOhJH3LIwavI3WJjf
 f5iHsk2xqWZS9aBjL3MfU3Rda8gTPttqdL/pCkw=
X-Google-Smtp-Source: ABdhPJz1AwFLbZUP/0B3BxalhsNcEj84N9ifwi8GBOLICnwgwhSVzFynaFbkOlJtEQdzmBAi+e/AM/s7QWf55/Zz22c=
X-Received: by 2002:a05:600c:4f8e:b0:39c:52d6:3cc5 with SMTP id
 n14-20020a05600c4f8e00b0039c52d63cc5mr10311109wmq.84.1654617718464; Tue, 07
 Jun 2022 09:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220606195432.1888346-1-robdclark@gmail.com>
 <20220606195432.1888346-2-robdclark@gmail.com>
 <8559b6f0-0322-9232-7000-534087e786fe@linux.intel.com>
In-Reply-To: <8559b6f0-0322-9232-7000-534087e786fe@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jun 2022 09:02:00 -0700
Message-ID: <CAF6AEGv0heF1fj0W3XALtQwZBE0yJTszXisg2CQR+-hFOmHSng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm: Expose client engine utilization via
 fdinfo
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 1:56 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 06/06/2022 20:54, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Similar to AMD commit
> > 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> > infrastructure added in previous patches, we add basic client info
> > and GPU engine utilisation for msm.
> >
> > Example output:
> >
> >       # cat /proc/`pgrep glmark2`/fdinfo/6
> >       pos:    0
> >       flags:  02400002
> >       mnt_id: 21
> >       ino:    162
> >       drm-driver:     msm
> >       drm-client-id:  7
> >       drm-engine-gpu: 1734371319 ns
> >       drm-cycles-gpu: 1153645024
> >       drm-maxfreq-gpu:        800000000 Hz
> >
> > See also: https://patchwork.freedesktop.org/patch/468505/
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
> >   drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
> >   drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
> >   drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
> >   4 files changed, 77 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > index 6c9f166a8d6f..60e5cc9c13ad 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> >   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> >   indicating kibi- or mebi-bytes.
> >
> > +- drm-cycles-<str> <uint>
> > +
> > +Engine identifier string must be the same as the one specified in the
> > +drm-engine-<str> tag and shall contain the number of busy cycles for the given
> > +engine.
> > +
> > +Values are not required to be constantly monotonic if it makes the driver
> > +implementation easier, but are required to catch up with the previously reported
> > +larger value within a reasonable period. Upon observing a value lower than what
> > +was previously read, userspace is expected to stay with that larger previous
> > +value until a monotonic update is seen.
> > +
> > +- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
> > +
> > +Engine identifier string must be the same as the one specified in the
> > +drm-engine-<str> tag and shall contain the maxium frequence for the given
>
> maximum frequency
>
> > +engine.  Taken together with drm-cycles-<str>, this can be used to calculate
> > +percentage utilization of the engine, whereas drm-engine-<str> only refects
>
> reflects
>
> > +time active without considering what frequency the engine is operating as a
> > +percentage of it's maximum frequency.
>
> Cycles vs max freq sounds very useful. My reservations is that how come
> the idea hasn't happened in the CPU world. Or maybe it has and I am
> un-informed?

I do often pay attention to both where tasks get scheduled, and the
individual CPU freq when I'm profiling CPU side stuff (eg. in
perfetto)

I could also report "always-count" cycles, I think, which could be
used by gputop to derive freq.  I'd have to think about that a bit,
since keeping the result monotinic(ish) might be a bit tricky (the hw
counter loses state across runtime suspend)

> In any case, if going with this I think we need to clarify the text that
> the value should reflect the current soft limit, where the driver
> supports that, in case it has been set to lower than the maximum
> frequency hardware can support. I am thinking about avoiding "my gpu
> cannot hit 100%" support incidents in cases when user/admin lowered the
> soft limit for some reason. Possibly does not apply to msm but can apply
> to i915, if we decided to export the same data.

Yes, with pm-qos thermal or userspace could limit the max freq.. but
we also internally use a pm-qos constraint to reduce freq when the GPU
is idle, and I don't think there is a good way to differentiate
*which* constraint is which.  I'll add something involving the word
"recommended" ;-)

BR,
-R

>
> No other gotchas come to mind at the moment.
>
> Regards,
>
> Tvrtko
>
> > +
> >   ===============================
> >   Driver specific implementations
> >   ===============================
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 14ab9a627d8b..57a66093e671 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -948,7 +948,24 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> >   };
> >
> > -DEFINE_DRM_GEM_FOPS(fops);
> > +static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> > +{
> > +     struct drm_file *file = f->private_data;
> > +     struct drm_device *dev = file->minor->dev;
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +     if (!priv->gpu)
> > +             return;
> > +
> > +     msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> > +}
> > +
> > +static const struct file_operations fops = {
> > +     .owner = THIS_MODULE,
> > +     DRM_GEM_FOPS,
> > +     .show_fdinfo = msm_fop_show_fdinfo,
> > +};
> >
> >   static const struct drm_driver msm_driver = {
> >       .driver_features    = DRIVER_GEM |
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index eb8a6663f309..333a9a299b41 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -4,6 +4,8 @@
> >    * Author: Rob Clark <robdclark@gmail.com>
> >    */
> >
> > +#include "drm/drm_drv.h"
> > +
> >   #include "msm_gpu.h"
> >   #include "msm_gem.h"
> >   #include "msm_mmu.h"
> > @@ -146,6 +148,16 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
> >       return 0;
> >   }
> >
> > +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > +                      struct drm_printer *p)
> > +{
> > +     drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
> > +     drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
> > +     drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
> > +     drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
> > +     drm_printf(p, "drm-maxfreq-gpu:\t%lu Hz\n", gpu->fast_rate);
> > +}
> > +
> >   int msm_gpu_hw_init(struct msm_gpu *gpu)
> >   {
> >       int ret;
> > @@ -652,7 +664,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >   {
> >       int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
> >       volatile struct msm_gpu_submit_stats *stats;
> > -     u64 elapsed, clock = 0;
> > +     u64 elapsed, clock = 0, cycles;
> >       unsigned long flags;
> >
> >       stats = &ring->memptrs->stats[index];
> > @@ -660,12 +672,17 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >       elapsed = (stats->alwayson_end - stats->alwayson_start) * 10000;
> >       do_div(elapsed, 192);
> >
> > +     cycles = stats->cpcycles_end - stats->cpcycles_start;
> > +
> >       /* Calculate the clock frequency from the number of CP cycles */
> >       if (elapsed) {
> > -             clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> > +             clock = cycles * 1000;
> >               do_div(clock, elapsed);
> >       }
> >
> > +     submit->queue->ctx->elapsed_ns += elapsed;
> > +     submit->queue->ctx->cycles     += cycles;
> > +
> >       trace_msm_gpu_submit_retired(submit, elapsed, clock,
> >               stats->alwayson_start, stats->alwayson_end);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 6def00883046..4911943ba53b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -361,6 +361,22 @@ struct msm_file_private {
> >       /** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
> >       char *cmdline;
> >
> > +     /**
> > +      * elapsed:
> > +      *
> > +      * The total (cumulative) elapsed time GPU was busy with rendering
> > +      * from this context in ns.
> > +      */
> > +     uint64_t elapsed_ns;
> > +
> > +     /**
> > +      * cycles:
> > +      *
> > +      * The total (cumulative) GPU cycles elapsed attributed to this
> > +      * context.
> > +      */
> > +     uint64_t cycles;
> > +
> >       /**
> >        * entities:
> >        *
> > @@ -544,6 +560,9 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
> >   int msm_gpu_pm_suspend(struct msm_gpu *gpu);
> >   int msm_gpu_pm_resume(struct msm_gpu *gpu);
> >
> > +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > +                      struct drm_printer *p);
> > +
> >   int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
> >   struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
> >               u32 id);
