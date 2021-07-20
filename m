Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C58673D036A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286686E17A;
	Tue, 20 Jul 2021 20:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5811E6E542
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 20:55:51 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w188so599746oif.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0FQ82C/BDxcwvqgrHBgcLPp625UNp5/w2TKk6xmMVnk=;
 b=KjPwXABt1PYA4lXlmqRcKo/UhZkXVnJpWcYWrBKPXBcF9VKfFRLo21TwI+OyUdgzLs
 gDF0b+Lz41zSaYobRXX6QG1HT8VG+3GECdGGccD+cykHHTbrzzzjtLEsduKbKbyA4brk
 TmHou4NpNRxbhms9ARD+Pu4SO11RzqykGySGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0FQ82C/BDxcwvqgrHBgcLPp625UNp5/w2TKk6xmMVnk=;
 b=FDduAjOW5VCl2SJPTZPD/13tqC3hvh/3o7P75ccbngwyUXtDeiutc3eUkFL2x+oa3I
 fBkCz2zxzMAoO8nao3x4g7y5b92MiTKpNYjdcwX6qkf587IcGyRoI4+6As86Viy55o6O
 iE33GNKE0pm6q1bfhRxnP8LFVoXlQLiZPe2MOWnl3hLrtZzF8H9sa5+KH+8m/zZ7xIx9
 zOUPfhordQUf6LHMOoYYJAkEeENQZjlU3uUGXzqs6lyb1T6s/QXMfjy0acdpSh93aGX6
 gpcEbWE7VtWAms6ABVuvXDqWCedd4Ih2P1H0xrtzrAqU5wHylBl+7E+8p30l/xLNoWmd
 wcIw==
X-Gm-Message-State: AOAM531rizBW1uYBqj5LrXL0p7apsqwfrGvA7Kgo4UfvF/4H3/jmXXfj
 s5vFKlda8xSnnOHpQC+hqPGvnmMkOPZ8ucIM7Do8XQ==
X-Google-Smtp-Source: ABdhPJzYXoCxha1rxN7bdt/YYSiGbqPjD7v773ymPQkBBlM7PfF21QIL9NPCc7be3ecyZV3iFh61z8dmCCpZQ1n3F9g=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr291067oig.14.1626814550571; 
 Tue, 20 Jul 2021 13:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 20 Jul 2021 22:55:39 +0200
Message-ID: <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: Rob Clark <robdclark@gmail.com>
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

On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Hi Rob,
> >
> > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
> > > one noticed.  Oops.
> >
> >
> > I'm not sure if that is a good idea.
> >
> > The dma_fence->wait() callback is pretty much deprecated and should not
> > be used any more.
> >
> > What exactly do you need that for?
>
> Well, the alternative is to track the set of fences which have
> signalling enabled, and then figure out which ones to signal, which
> seems like a lot more work, vs just re-purposing the wait
> implementation we already have for non-dma_fence cases ;-)
>
> Why is the ->wait() callback (pretty much) deprecated?

Because if you need it that means for your driver dma_fence_add_cb is
broken, which means a _lot_ of things don't work. Like dma_buf poll
(compositors have patches to start using that), and I think
drm/scheduler also becomes rather unhappy.

It essentially exists only for old drivers where ->enable_signalling
is unreliable and we paper over that with a retry loop in ->wait and
pray no one notices that it's too butchered. The proper fix is to have
a driver thread to guarantee that ->enable_signalling works reliable,
so you don't need a ->wait.

Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
this in please?
-Daniel

>
> BR,
> -R
>
> > Regards,
> > Christian.
> >
> > >
> > > Note that this removes the !timeout case, which has not been used in
> > > a long time.
> >
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++-----------=
---
> > >   1 file changed, 34 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/ms=
m_fence.c
> > > index cd59a5918038..8ee96b90ded6 100644
> > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fen=
ce_context *fctx, uint32_t fenc
> > >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> > >   }
> > >
> > > -/* legacy path for WAIT_FENCE ioctl: */
> > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > -             ktime_t *timeout, bool interruptible)
> > > +static signed long wait_fence(struct msm_fence_context *fctx, uint32=
_t fence,
> > > +             signed long remaining_jiffies, bool interruptible)
> > >   {
> > > -     int ret;
> > > +     signed long ret;
> > >
> > >       if (fence > fctx->last_fence) {
> > >               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u=
 (of %u)\n",
> > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx=
, uint32_t fence,
> > >               return -EINVAL;
> > >       }
> > >
> > > -     if (!timeout) {
> > > -             /* no-wait: */
> > > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> > > +     if (interruptible) {
> > > +             ret =3D wait_event_interruptible_timeout(fctx->event,
> > > +                     fence_completed(fctx, fence),
> > > +                     remaining_jiffies);
> > >       } else {
> > > -             unsigned long remaining_jiffies =3D timeout_to_jiffies(=
timeout);
> > > -
> > > -             if (interruptible)
> > > -                     ret =3D wait_event_interruptible_timeout(fctx->=
event,
> > > -                             fence_completed(fctx, fence),
> > > -                             remaining_jiffies);
> > > -             else
> > > -                     ret =3D wait_event_timeout(fctx->event,
> > > -                             fence_completed(fctx, fence),
> > > -                             remaining_jiffies);
> > > -
> > > -             if (ret =3D=3D 0) {
> > > -                     DBG("timeout waiting for fence: %u (completed: =
%u)",
> > > -                                     fence, fctx->completed_fence);
> > > -                     ret =3D -ETIMEDOUT;
> > > -             } else if (ret !=3D -ERESTARTSYS) {
> > > -                     ret =3D 0;
> > > -             }
> > > +             ret =3D wait_event_timeout(fctx->event,
> > > +                     fence_completed(fctx, fence),
> > > +                     remaining_jiffies);
> > > +     }
> > > +
> > > +     if (ret =3D=3D 0) {
> > > +             DBG("timeout waiting for fence: %u (completed: %u)",
> > > +                             fence, fctx->completed_fence);
> > > +             ret =3D -ETIMEDOUT;
> > > +     } else if (ret !=3D -ERESTARTSYS) {
> > > +             ret =3D 0;
> > >       }
> > >
> > >       return ret;
> > >   }
> > >
> > > +/* legacy path for WAIT_FENCE ioctl: */
> > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > +             ktime_t *timeout, bool interruptible)
> > > +{
> > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout), int=
erruptible);
> > > +}
> > > +
> > >   /* called from workqueue */
> > >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fenc=
e)
> > >   {
> > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence=
 *fence)
> > >       return fence_completed(f->fctx, f->base.seqno);
> > >   }
> > >
> > > +static signed long msm_fence_wait(struct dma_fence *fence, bool intr=
,
> > > +             signed long timeout)
> > > +{
> > > +     struct msm_fence *f =3D to_msm_fence(fence);
> > > +
> > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > +}
> > > +
> > >   static const struct dma_fence_ops msm_fence_ops =3D {
> > >       .get_driver_name =3D msm_fence_get_driver_name,
> > >       .get_timeline_name =3D msm_fence_get_timeline_name,
> > >       .signaled =3D msm_fence_signaled,
> > > +     .wait =3D msm_fence_wait,
> > >   };
> > >
> > >   struct dma_fence *
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
