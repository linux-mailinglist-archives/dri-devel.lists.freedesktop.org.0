Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C0F3D04A8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 00:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9125D6E44F;
	Tue, 20 Jul 2021 22:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253576E44F;
 Tue, 20 Jul 2021 22:32:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r11so54954wro.9;
 Tue, 20 Jul 2021 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AUq62xTOdEE9yZyZ9SmyAw/53N8FF+p9iTgcqqLGQAc=;
 b=Xjb45xC/ATHW+Ja5+SAtaovYI7YvU3BVBREZpvHqi2Yr36Ug5CxT2Jh9jHTQ+rO4Wk
 a1dEGmIcFSKewgblnu3ieGcW5eAdwzbnQEyK5YiC5xoDqz9Y2kQTOFpYSEKDj39l9oHb
 qsxvHJI/jTpQ1do86Tv8jXattuEFUhdgiLT7Zuaodl9GhsCb/rlxyTLnC4t6AItH06D4
 Cv6/rUqLqW7oUYjUoNPccMLs+AqQwXB/FBK3SPaymFuYwEWimmJ/0001IEd277kUFi1W
 derIw/mOzJQhUQhR/TNjaRsNAK+DxgHfEAmqtfIPWjlk4Pfj7fh9g+shZ2+cfPL1McEG
 aa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AUq62xTOdEE9yZyZ9SmyAw/53N8FF+p9iTgcqqLGQAc=;
 b=mi2wDwbqMGGvEgB4YAp7KFoQYFsBb5BGi4wRENavOJ/3Bxa52HnT9LoEaOKPX6zOdw
 TNOc05zR1JcKze+59nsC/+nwoJhD2FG0btfIW6uq6d/RImq+oBPA9DCYe/T4BjxBU1B4
 oDBJDwklw5M0AKFZx0ymChRFd5ibSub3xwi+sn0yuy+D2WvkTFMwZqGlwdGDfF5F/y9n
 iXcIk6JcJU+TqhcdO4GRYROGSeJPx5vnxYFv4ofBfTyOWYtiELDoM5aBxYBh+C2hR44x
 gYpVxQIb+5vMv5N9/7y5ArsLoRYLPg4QJz6p2b6o1iu+bs6IvcwEHlYk+8t2xOuupsHJ
 FyAA==
X-Gm-Message-State: AOAM532IuM2ZGhruJtUS4jrs3bcELR5/p3CRffh8DPSaLB6CRtGwCAB0
 IVqBlxg1gwAFFE8tZOC1H3s0Z89doNRQ7ybcapc=
X-Google-Smtp-Source: ABdhPJxRCaU0mgbRBKXCUtmzHce0yeXRyivNRpNTgJgdzNX98VwZiuLceogME2jUho6sOGR5XAEUBw+FRtjqHARE+DE=
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr38668459wrt.132.1626820326738; 
 Tue, 20 Jul 2021 15:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
In-Reply-To: <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 Jul 2021 15:36:14 -0700
Message-ID: <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >
> > > Hi Rob,
> > >
> > > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Somehow we had neither ->wait() nor dma_fence_signal() calls, and n=
o
> > > > one noticed.  Oops.
> > >
> > >
> > > I'm not sure if that is a good idea.
> > >
> > > The dma_fence->wait() callback is pretty much deprecated and should n=
ot
> > > be used any more.
> > >
> > > What exactly do you need that for?
> >
> > Well, the alternative is to track the set of fences which have
> > signalling enabled, and then figure out which ones to signal, which
> > seems like a lot more work, vs just re-purposing the wait
> > implementation we already have for non-dma_fence cases ;-)
> >
> > Why is the ->wait() callback (pretty much) deprecated?
>
> Because if you need it that means for your driver dma_fence_add_cb is
> broken, which means a _lot_ of things don't work. Like dma_buf poll
> (compositors have patches to start using that), and I think
> drm/scheduler also becomes rather unhappy.

I'm starting to page back in how this works.. fence cb's aren't broken
(which is also why dma_fence_wait() was not completely broken),
because in retire_submits() we call
dma_fence_is_signaled(submit->hw_fence).

But the reason that the custom wait function cleans up a tiny bit of
jank is that the wait_queue_head_t gets signaled earlier, before we
start iterating the submits and doing all that retire_submit() stuff
(unpin/unref bo's, etc).  I suppose I could just split things up to
call dma_fence_signal() earlier, and *then* do the retire_submits()
stuff.

BR,
-R

> It essentially exists only for old drivers where ->enable_signalling
> is unreliable and we paper over that with a retry loop in ->wait and
> pray no one notices that it's too butchered. The proper fix is to have
> a driver thread to guarantee that ->enable_signalling works reliable,
> so you don't need a ->wait.
>
> Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
> this in please?
> -Daniel
>
> >
> > BR,
> > -R
> >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > Note that this removes the !timeout case, which has not been used i=
n
> > > > a long time.
> > >
> > >
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++---------=
-----
> > > >   1 file changed, 34 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/=
msm_fence.c
> > > > index cd59a5918038..8ee96b90ded6 100644
> > > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_f=
ence_context *fctx, uint32_t fenc
> > > >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> > > >   }
> > > >
> > > > -/* legacy path for WAIT_FENCE ioctl: */
> > > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > -             ktime_t *timeout, bool interruptible)
> > > > +static signed long wait_fence(struct msm_fence_context *fctx, uint=
32_t fence,
> > > > +             signed long remaining_jiffies, bool interruptible)
> > > >   {
> > > > -     int ret;
> > > > +     signed long ret;
> > > >
> > > >       if (fence > fctx->last_fence) {
> > > >               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: =
%u (of %u)\n",
> > > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fc=
tx, uint32_t fence,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > -     if (!timeout) {
> > > > -             /* no-wait: */
> > > > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> > > > +     if (interruptible) {
> > > > +             ret =3D wait_event_interruptible_timeout(fctx->event,
> > > > +                     fence_completed(fctx, fence),
> > > > +                     remaining_jiffies);
> > > >       } else {
> > > > -             unsigned long remaining_jiffies =3D timeout_to_jiffie=
s(timeout);
> > > > -
> > > > -             if (interruptible)
> > > > -                     ret =3D wait_event_interruptible_timeout(fctx=
->event,
> > > > -                             fence_completed(fctx, fence),
> > > > -                             remaining_jiffies);
> > > > -             else
> > > > -                     ret =3D wait_event_timeout(fctx->event,
> > > > -                             fence_completed(fctx, fence),
> > > > -                             remaining_jiffies);
> > > > -
> > > > -             if (ret =3D=3D 0) {
> > > > -                     DBG("timeout waiting for fence: %u (completed=
: %u)",
> > > > -                                     fence, fctx->completed_fence)=
;
> > > > -                     ret =3D -ETIMEDOUT;
> > > > -             } else if (ret !=3D -ERESTARTSYS) {
> > > > -                     ret =3D 0;
> > > > -             }
> > > > +             ret =3D wait_event_timeout(fctx->event,
> > > > +                     fence_completed(fctx, fence),
> > > > +                     remaining_jiffies);
> > > > +     }
> > > > +
> > > > +     if (ret =3D=3D 0) {
> > > > +             DBG("timeout waiting for fence: %u (completed: %u)",
> > > > +                             fence, fctx->completed_fence);
> > > > +             ret =3D -ETIMEDOUT;
> > > > +     } else if (ret !=3D -ERESTARTSYS) {
> > > > +             ret =3D 0;
> > > >       }
> > > >
> > > >       return ret;
> > > >   }
> > > >
> > > > +/* legacy path for WAIT_FENCE ioctl: */
> > > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > +             ktime_t *timeout, bool interruptible)
> > > > +{
> > > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout), i=
nterruptible);
> > > > +}
> > > > +
> > > >   /* called from workqueue */
> > > >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fe=
nce)
> > > >   {
> > > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fen=
ce *fence)
> > > >       return fence_completed(f->fctx, f->base.seqno);
> > > >   }
> > > >
> > > > +static signed long msm_fence_wait(struct dma_fence *fence, bool in=
tr,
> > > > +             signed long timeout)
> > > > +{
> > > > +     struct msm_fence *f =3D to_msm_fence(fence);
> > > > +
> > > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > > +}
> > > > +
> > > >   static const struct dma_fence_ops msm_fence_ops =3D {
> > > >       .get_driver_name =3D msm_fence_get_driver_name,
> > > >       .get_timeline_name =3D msm_fence_get_timeline_name,
> > > >       .signaled =3D msm_fence_signaled,
> > > > +     .wait =3D msm_fence_wait,
> > > >   };
> > > >
> > > >   struct dma_fence *
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
