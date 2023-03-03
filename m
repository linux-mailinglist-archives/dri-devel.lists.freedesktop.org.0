Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8316A9CA2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 18:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B310E708;
	Fri,  3 Mar 2023 17:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4E210E708;
 Fri,  3 Mar 2023 17:03:57 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id s41so2250668oiw.13;
 Fri, 03 Mar 2023 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677863037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RZgVkTuvYky6LMx4NxO2XF22XxAb0kNEaLo11LroAxw=;
 b=aOGeJ1/EH6Ky1XYhaXU0TsJT+zNZhRX4i75gv50jJxzyk5yPx96UkyKWieOtkzVY3O
 hN8ODxeP1XYPMPf7SwNu4MHejDwj4TXGS127Jgd7gJ6noMxOwL8c8hhRkD0xL8fiHfqw
 4Yn6kAQgFlodlvPaDknI06aIebmEk6VzQYnaal/4mCm9/a6wm7kZvsf0YFFcluYALTgS
 hVPGHecfZ+8fmgoD1vBDQinhxKudGHCO+NGkek7Kz4ezJUXRP9zfBHKAKnrlnxw6V9nf
 BqbKqMBGuwUM5XnAs+Tpf8v1vFBCE2qnZK4SAiwcPR7VcM1Jpf7gTqK7EMOg7C15qs/9
 pOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677863037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RZgVkTuvYky6LMx4NxO2XF22XxAb0kNEaLo11LroAxw=;
 b=gCdhdN2izbwxpPiqqPKN1vtJcextvXo1p8IsakIAdUYeCWsCX/tLeGxbfEGXDj1P7Q
 hIrcUOSR+E18Biv/3wGgfMbJ3RBIURFOoHIC48v9c/qVaBTF1ENPEkjTEfbv9JW1Qqcp
 dPAQYz4tTEwoz6jdiWdp7P90yp3GitUEfhNpI2+VKEo6FjCr0Wd0aIGj9QG9BxQSd+6W
 diY62/F0kmvmgXeMrT0pYCWcYOx1m4VrPYofgu6T6z6N/85I7uuFQIV+iEeTjh7y/aHB
 TUGqpWHOL7VA16OzrSLG3kG9916XV3bh36nccssO/7MM/X/ZKZnieyEhR60wr/FBo+SL
 NjZw==
X-Gm-Message-State: AO0yUKVNI632C7zGFVQ3UydLHRjCSvdHuv7zdppZ/NkwaOk71jsuLei6
 MQWmXqCFZVYaq2hIPmbKSSaKGpR/ceWtoxOg8EI=
X-Google-Smtp-Source: AK7set8d1sH5CmkMtOZYFe3qHdkCNvFUCNh5IhHFhDkZUbzvMmuXQitmVFSmai3PhsUO/xlXcU4veEoq/pdQ4K3B4B8=
X-Received: by 2002:a05:6808:913:b0:384:253:642d with SMTP id
 w19-20020a056808091300b003840253642dmr796082oih.3.1677863036851; Fri, 03 Mar
 2023 09:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-13-robdclark@gmail.com>
 <a5249009-0bec-61a5-4dd2-5728ee3017e3@linaro.org>
In-Reply-To: <a5249009-0bec-61a5-4dd2-5728ee3017e3@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 3 Mar 2023 09:03:45 -0800
Message-ID: <CAF6AEGtmQu-8LEdm68vXJJSpssXq2AShEdexqTGVW0WO5VmtDQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] drm/msm: Add deadline based boost support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <ppaalanen@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 2:10=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/03/2023 01:53, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Track the nearest deadline on a fence timeline and set a timer to expir=
e
> > shortly before to trigger boost if the fence has not yet been signaled.
> >
> > v2: rebase
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_fence.c | 74 ++++++++++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/msm/msm_fence.h | 20 +++++++++
> >   2 files changed, 94 insertions(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> A small question: do we boost to fit into the deadline or to miss the
> deadline for as little as possible? If the former is the case, we might
> need to adjust 3ms depending on the workload.

The goal is as much to run with higher clock on the next frame as it
is to not miss a deadline.  Ie. we don't want devfreq to come to the
conclusion that running at <50% clks is best due to the amount of
utilization caused by missing ever other vblank.

But 3ms is mostly just "seems like a good compromise" value.  It might chan=
ge.

BR,
-R

> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index 56641408ea74..51b461f32103 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -8,6 +8,35 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_fence.h"
> > +#include "msm_gpu.h"
> > +
> > +static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
> > +{
> > +     struct msm_drm_private *priv =3D fctx->dev->dev_private;
> > +     return priv->gpu;
> > +}
> > +
> > +static enum hrtimer_restart deadline_timer(struct hrtimer *t)
> > +{
> > +     struct msm_fence_context *fctx =3D container_of(t,
> > +                     struct msm_fence_context, deadline_timer);
> > +
> > +     kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
> > +
> > +     return HRTIMER_NORESTART;
> > +}
> > +
> > +static void deadline_work(struct kthread_work *work)
> > +{
> > +     struct msm_fence_context *fctx =3D container_of(work,
> > +                     struct msm_fence_context, deadline_work);
> > +
> > +     /* If deadline fence has already passed, nothing to do: */
> > +     if (msm_fence_completed(fctx, fctx->next_deadline_fence))
> > +             return;
> > +
> > +     msm_devfreq_boost(fctx2gpu(fctx), 2);
> > +}
> >
> >
> >   struct msm_fence_context *
> > @@ -36,6 +65,13 @@ msm_fence_context_alloc(struct drm_device *dev, vola=
tile uint32_t *fenceptr,
> >       fctx->completed_fence =3D fctx->last_fence;
> >       *fctx->fenceptr =3D fctx->last_fence;
> >
> > +     hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE=
_ABS);
> > +     fctx->deadline_timer.function =3D deadline_timer;
> > +
> > +     kthread_init_work(&fctx->deadline_work, deadline_work);
> > +
> > +     fctx->next_deadline =3D ktime_get();
> > +
> >       return fctx;
> >   }
> >
> > @@ -62,6 +98,8 @@ void msm_update_fence(struct msm_fence_context *fctx,=
 uint32_t fence)
> >       spin_lock_irqsave(&fctx->spinlock, flags);
> >       if (fence_after(fence, fctx->completed_fence))
> >               fctx->completed_fence =3D fence;
> > +     if (msm_fence_completed(fctx, fctx->next_deadline_fence))
> > +             hrtimer_cancel(&fctx->deadline_timer);
> >       spin_unlock_irqrestore(&fctx->spinlock, flags);
> >   }
> >
> > @@ -92,10 +130,46 @@ static bool msm_fence_signaled(struct dma_fence *f=
ence)
> >       return msm_fence_completed(f->fctx, f->base.seqno);
> >   }
> >
> > +static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t de=
adline)
> > +{
> > +     struct msm_fence *f =3D to_msm_fence(fence);
> > +     struct msm_fence_context *fctx =3D f->fctx;
> > +     unsigned long flags;
> > +     ktime_t now;
> > +
> > +     spin_lock_irqsave(&fctx->spinlock, flags);
> > +     now =3D ktime_get();
> > +
> > +     if (ktime_after(now, fctx->next_deadline) ||
> > +                     ktime_before(deadline, fctx->next_deadline)) {
> > +             fctx->next_deadline =3D deadline;
> > +             fctx->next_deadline_fence =3D
> > +                     max(fctx->next_deadline_fence, (uint32_t)fence->s=
eqno);
> > +
> > +             /*
> > +              * Set timer to trigger boost 3ms before deadline, or
> > +              * if we are already less than 3ms before the deadline
> > +              * schedule boost work immediately.
> > +              */
> > +             deadline =3D ktime_sub(deadline, ms_to_ktime(3));
> > +
> > +             if (ktime_after(now, deadline)) {
> > +                     kthread_queue_work(fctx2gpu(fctx)->worker,
> > +                                     &fctx->deadline_work);
> > +             } else {
> > +                     hrtimer_start(&fctx->deadline_timer, deadline,
> > +                                     HRTIMER_MODE_ABS);
> > +             }
> > +     }
> > +
> > +     spin_unlock_irqrestore(&fctx->spinlock, flags);
> > +}
> > +
> >   static const struct dma_fence_ops msm_fence_ops =3D {
> >       .get_driver_name =3D msm_fence_get_driver_name,
> >       .get_timeline_name =3D msm_fence_get_timeline_name,
> >       .signaled =3D msm_fence_signaled,
> > +     .set_deadline =3D msm_fence_set_deadline,
> >   };
> >
> >   struct dma_fence *
> > diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_=
fence.h
> > index 7f1798c54cd1..cdaebfb94f5c 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.h
> > +++ b/drivers/gpu/drm/msm/msm_fence.h
> > @@ -52,6 +52,26 @@ struct msm_fence_context {
> >       volatile uint32_t *fenceptr;
> >
> >       spinlock_t spinlock;
> > +
> > +     /*
> > +      * TODO this doesn't really deal with multiple deadlines, like
> > +      * if userspace got multiple frames ahead.. OTOH atomic updates
> > +      * don't queue, so maybe that is ok
> > +      */
> > +
> > +     /** next_deadline: Time of next deadline */
> > +     ktime_t next_deadline;
> > +
> > +     /**
> > +      * next_deadline_fence:
> > +      *
> > +      * Fence value for next pending deadline.  The deadline timer is
> > +      * canceled when this fence is signaled.
> > +      */
> > +     uint32_t next_deadline_fence;
> > +
> > +     struct hrtimer deadline_timer;
> > +     struct kthread_work deadline_work;
> >   };
> >
> >   struct msm_fence_context * msm_fence_context_alloc(struct drm_device =
*dev,
>
> --
> With best wishes
> Dmitry
>
