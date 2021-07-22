Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1B3D2063
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBD16E3DA;
	Thu, 22 Jul 2021 09:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F42A6E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 09:08:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w13so2887483wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=UB0wnLb1c1u3rZTJdPSDCH3l/+H3ml4Em3ZitbFw9QE=;
 b=i3EosJ+DFtXpnOFEHZDpRM51yXTvBBXgFJ4WAtey1BUZtBZdWU2GH4eQ2VsVbvuaEf
 fO7wbEZ8Voyf5KR6bCCTzV+NkvFJCMoT5CunobC5R1MBuzV32u29KSx5CbcahiB0JC81
 QgJZ2Nl60vMrjBWKgEkyLhdB5dZeYl7AVOYLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=UB0wnLb1c1u3rZTJdPSDCH3l/+H3ml4Em3ZitbFw9QE=;
 b=o7fcfeZ+CRraJMe6Z0rbOfuTdMWcdpcVJJMN4J4BXjW6QI8eWKhqayK1T4Ht9bNssE
 SgOGQy7a+PFHaYVJysKNytd6ihSiLDIS7tR5c26u7m28wCrmXVuPEISLF4AVKlDxKOQ2
 C3+yCr+o5dnIqq1j4KqQuwZlxAFgs2XRPEg3KReqmFwwkvXmHkhog28RtMzzcOn9PbMf
 INqiX7AxlC2nOVtXkMifRxYx2PEGxKMuGs/3OHB1Ha0GibFcygQFqHgJi7iesHD4P786
 6uyC/mUKmnKgSozKkF8L8rgA9twTaBQi4r+OimZgNv39pLtU8+Igi3Kw8GzV5ibYJF+C
 h75g==
X-Gm-Message-State: AOAM532s5aiUK02f358nzUTFEIF18f8lstrmfcMe26LC7CHVPj2iWzmY
 lUrg3D/L2Grbgf1Wkc+KvFuw+g==
X-Google-Smtp-Source: ABdhPJzpcmVsFP8n6h90tCKGkFWNhQIYYt2FS89jOONLHEH0e+rPqojhTedWj7Ma0ZaCXQdEUKlzeA==
X-Received: by 2002:a1c:9886:: with SMTP id
 a128mr42089950wme.150.1626944909765; 
 Thu, 22 Jul 2021 02:08:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p4sm29948823wrt.23.2021.07.22.02.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:08:29 -0700 (PDT)
Date: Thu, 22 Jul 2021 11:08:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
Message-ID: <YPk1izQFR+tRV8js@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 10:42:26AM +0200, Christian König wrote:
> Am 21.07.21 um 21:03 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 09:34:43AM -0700, Rob Clark wrote:
> > > On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrote:
> > > > > On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > > > > On Tue, Jul 20, 2021 at 11:03 AM Christian König
> > > > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > > > Hi Rob,
> > > > > > > > 
> > > > > > > > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > 
> > > > > > > > > Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
> > > > > > > > > one noticed.  Oops.
> > > > > > > > 
> > > > > > > > I'm not sure if that is a good idea.
> > > > > > > > 
> > > > > > > > The dma_fence->wait() callback is pretty much deprecated and should not
> > > > > > > > be used any more.
> > > > > > > > 
> > > > > > > > What exactly do you need that for?
> > > > > > > Well, the alternative is to track the set of fences which have
> > > > > > > signalling enabled, and then figure out which ones to signal, which
> > > > > > > seems like a lot more work, vs just re-purposing the wait
> > > > > > > implementation we already have for non-dma_fence cases ;-)
> > > > > > > 
> > > > > > > Why is the ->wait() callback (pretty much) deprecated?
> > > > > > Because if you need it that means for your driver dma_fence_add_cb is
> > > > > > broken, which means a _lot_ of things don't work. Like dma_buf poll
> > > > > > (compositors have patches to start using that), and I think
> > > > > > drm/scheduler also becomes rather unhappy.
> > > > > I'm starting to page back in how this works.. fence cb's aren't broken
> > > > > (which is also why dma_fence_wait() was not completely broken),
> > > > > because in retire_submits() we call
> > > > > dma_fence_is_signaled(submit->hw_fence).
> > > > > 
> > > > > But the reason that the custom wait function cleans up a tiny bit of
> > > > > jank is that the wait_queue_head_t gets signaled earlier, before we
> > > > > start iterating the submits and doing all that retire_submit() stuff
> > > > > (unpin/unref bo's, etc).  I suppose I could just split things up to
> > > > > call dma_fence_signal() earlier, and *then* do the retire_submits()
> > > > > stuff.
> > > > Yeah reducing the latency there sounds like a good idea.
> > > > -Daniel
> > > > 
> > > Hmm, no, turns out that isn't the problem.. or, well, it is probably a
> > > good idea to call drm_fence_signal() earlier.  But it seems like
> > > waking up from wait_event_* is faster than wake_up_state(wait->task,
> > > TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
> > > the scheduler to get around to schedule the runnable task.
> 
> As far as I know wake_up_state() tries to run the thread on the CPU it was
> scheduled last, while wait_event_* makes the thread run on the CPU who
> issues the wake by default.
> 
> And yes I've also noticed this already and it was one of the reason why I
> suggested to use a wait_queue instead of the hand wired dma_fence_wait
> implementation.

The first versions had used wait_queue, but iirc we had some issues with
the callbacks and stuff and that was the reasons for hand-rolling. Or
maybe it was the integration of the lockless fastpath for
dma_fence_is_signalled().

> > > So for now, I'm going back to my own wait function (plus earlier
> > > drm_fence_signal())
> > > 
> > > Before removing dma_fence_opps::wait(), I guess we want to re-think
> > > dma_fence_default_wait().. but I think that would require a
> > > dma_fence_context base class (rather than just a raw integer).
> > Uh that's not great ... can't we fix this instead of papering over it in
> > drivers? Aside from maybe different wakeup flags it all is supposed to
> > work exactly the same underneath, and whether using a wait queue or not
> > really shouldn't matter.
> 
> Well it would have been nicer if we used the existing infrastructure instead
> of re-inventing stuff for dma_fence, but that chance is long gone.
> 
> And you don't need a dma_fence_context base class, but rather just a flag in
> the dma_fence_ops if you want to change the behavior.

If there's something broken we should just fix it, not force everyone to
set a random flag. dma_fence work like special wait_queues, so if we
differ then we should go back to that.
-Daniel

> 
> Regards,
> Christian.
> 
> > -Daniel
> > 
> > > BR,
> > > -R
> > > 
> > > > > BR,
> > > > > -R
> > > > > 
> > > > > > It essentially exists only for old drivers where ->enable_signalling
> > > > > > is unreliable and we paper over that with a retry loop in ->wait and
> > > > > > pray no one notices that it's too butchered. The proper fix is to have
> > > > > > a driver thread to guarantee that ->enable_signalling works reliable,
> > > > > > so you don't need a ->wait.
> > > > > > 
> > > > > > Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
> > > > > > this in please?
> > > > > > -Daniel
> > > > > > 
> > > > > > > BR,
> > > > > > > -R
> > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > > > Note that this removes the !timeout case, which has not been used in
> > > > > > > > > a long time.
> > > > > > > > 
> > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > ---
> > > > > > > > >    drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++--------------
> > > > > > > > >    1 file changed, 34 insertions(+), 25 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> > > > > > > > > index cd59a5918038..8ee96b90ded6 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > > > > > > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > > > > > > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
> > > > > > > > >        return (int32_t)(fctx->completed_fence - fence) >= 0;
> > > > > > > > >    }
> > > > > > > > > 
> > > > > > > > > -/* legacy path for WAIT_FENCE ioctl: */
> > > > > > > > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > > > > > > -             ktime_t *timeout, bool interruptible)
> > > > > > > > > +static signed long wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > > > > > > +             signed long remaining_jiffies, bool interruptible)
> > > > > > > > >    {
> > > > > > > > > -     int ret;
> > > > > > > > > +     signed long ret;
> > > > > > > > > 
> > > > > > > > >        if (fence > fctx->last_fence) {
> > > > > > > > >                DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
> > > > > > > > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > > > > > >                return -EINVAL;
> > > > > > > > >        }
> > > > > > > > > 
> > > > > > > > > -     if (!timeout) {
> > > > > > > > > -             /* no-wait: */
> > > > > > > > > -             ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
> > > > > > > > > +     if (interruptible) {
> > > > > > > > > +             ret = wait_event_interruptible_timeout(fctx->event,
> > > > > > > > > +                     fence_completed(fctx, fence),
> > > > > > > > > +                     remaining_jiffies);
> > > > > > > > >        } else {
> > > > > > > > > -             unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
> > > > > > > > > -
> > > > > > > > > -             if (interruptible)
> > > > > > > > > -                     ret = wait_event_interruptible_timeout(fctx->event,
> > > > > > > > > -                             fence_completed(fctx, fence),
> > > > > > > > > -                             remaining_jiffies);
> > > > > > > > > -             else
> > > > > > > > > -                     ret = wait_event_timeout(fctx->event,
> > > > > > > > > -                             fence_completed(fctx, fence),
> > > > > > > > > -                             remaining_jiffies);
> > > > > > > > > -
> > > > > > > > > -             if (ret == 0) {
> > > > > > > > > -                     DBG("timeout waiting for fence: %u (completed: %u)",
> > > > > > > > > -                                     fence, fctx->completed_fence);
> > > > > > > > > -                     ret = -ETIMEDOUT;
> > > > > > > > > -             } else if (ret != -ERESTARTSYS) {
> > > > > > > > > -                     ret = 0;
> > > > > > > > > -             }
> > > > > > > > > +             ret = wait_event_timeout(fctx->event,
> > > > > > > > > +                     fence_completed(fctx, fence),
> > > > > > > > > +                     remaining_jiffies);
> > > > > > > > > +     }
> > > > > > > > > +
> > > > > > > > > +     if (ret == 0) {
> > > > > > > > > +             DBG("timeout waiting for fence: %u (completed: %u)",
> > > > > > > > > +                             fence, fctx->completed_fence);
> > > > > > > > > +             ret = -ETIMEDOUT;
> > > > > > > > > +     } else if (ret != -ERESTARTSYS) {
> > > > > > > > > +             ret = 0;
> > > > > > > > >        }
> > > > > > > > > 
> > > > > > > > >        return ret;
> > > > > > > > >    }
> > > > > > > > > 
> > > > > > > > > +/* legacy path for WAIT_FENCE ioctl: */
> > > > > > > > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > > > > > > > > +             ktime_t *timeout, bool interruptible)
> > > > > > > > > +{
> > > > > > > > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout), interruptible);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >    /* called from workqueue */
> > > > > > > > >    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
> > > > > > > > >    {
> > > > > > > > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
> > > > > > > > >        return fence_completed(f->fctx, f->base.seqno);
> > > > > > > > >    }
> > > > > > > > > 
> > > > > > > > > +static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
> > > > > > > > > +             signed long timeout)
> > > > > > > > > +{
> > > > > > > > > +     struct msm_fence *f = to_msm_fence(fence);
> > > > > > > > > +
> > > > > > > > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >    static const struct dma_fence_ops msm_fence_ops = {
> > > > > > > > >        .get_driver_name = msm_fence_get_driver_name,
> > > > > > > > >        .get_timeline_name = msm_fence_get_timeline_name,
> > > > > > > > >        .signaled = msm_fence_signaled,
> > > > > > > > > +     .wait = msm_fence_wait,
> > > > > > > > >    };
> > > > > > > > > 
> > > > > > > > >    struct dma_fence *
> > > > > > 
> > > > > > 
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > > 
> > > > 
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
