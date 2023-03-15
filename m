Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B721A6BB535
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 14:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082410E282;
	Wed, 15 Mar 2023 13:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422810E1D0;
 Wed, 15 Mar 2023 13:53:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z42so19496382ljq.13;
 Wed, 15 Mar 2023 06:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678888385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xywjGE32DAT8qJ4ZwaPTufjQoXhOtj0QTVUTRGOUaEI=;
 b=TMIC8ghS/N1NJJfoQlv2OZm6jq+mAkZ9eEDTR43scT6bQ+m49SqAY8pQegQJAcaUE3
 X5zexO9XmRi1krVKsbDyVCsRI/SBIdV+ZqIpwnh/+j4e+lF28Amt3n7sHSDDJ2K7wv6z
 FlU3YLFLZrEuRbHft70jNeAcNQlG//JAUX0BkmFtQ/FU2ieXjUouxnWiZJHdg5NnM7L4
 3qDdMDOfkvf24r/Gi/BpmqhtxV4mjvwxNN5VM/7j9ySKHX0xx5b/VU/hVtvS9ju+e4lh
 9bx2CYBUlnmMcP/kzd9MGs2wdIc5s30c+rHo4xw7uRu69WkR+Foh2K6IisrTNFywpq9c
 mA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678888385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xywjGE32DAT8qJ4ZwaPTufjQoXhOtj0QTVUTRGOUaEI=;
 b=Fm7Ow+0Dt6kc0XCCkEinZMy0NQoAYTiT/2a6l+LSqWzz3BfFwkPdCBB2R5pdt5XFbF
 QVBD0wSbrYT/mcjVBaIwRhdEc2+gUDi1QAgFcL7jc3WzKio9S5sJjKB1ebFPRu5CFfeJ
 +ZuvnjyY2MvgYas+xZc6V2/OgpYKQPaU3tb0fF+47/PWhFrKlELyYMr/kssiMqYnwkcw
 exr9LxUr49jKre61y4QfIHEJx8jfUYrphecq6Vu0Locu7idmB9ZjROv1Ay3Wmeq6erda
 W7OiB7lg+FarTKGTWfYmiUIGgX7AFwaYfuBlIte+wqFupCRiqY/Fzl5wbKWoxya7b3pE
 U1jg==
X-Gm-Message-State: AO0yUKW6RWEFCYrRdya9aHBMB2A5gFQ3K8q4t67PXCh2BlJQsvK2W+xJ
 FlCWQIuyvC4meileTTHmgvU6aOfSwoXG8w==
X-Google-Smtp-Source: AK7set9FaGgfMRZ0oR+IMQRZZtGUt5Io9dZ0I5V8xpDXqwB1QnSHGetUp9FiXvQeGYy9kox/zSzjew==
X-Received: by 2002:a05:651c:ca:b0:295:a5e1:8346 with SMTP id
 10-20020a05651c00ca00b00295a5e18346mr943239ljr.11.1678888384707; 
 Wed, 15 Mar 2023 06:53:04 -0700 (PDT)
Received: from gmail.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 p13-20020a2e740d000000b00298a7936ae4sm576334ljc.32.2023.03.15.06.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 06:53:04 -0700 (PDT)
Date: Wed, 15 Mar 2023 14:53:01 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <ZBHNvT3BLgS3qvV5@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Padovan <gustavo@padovan.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> On Fri, Mar 10, 2023 at 7:45 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add a way to hint to the fence signaler of an upcoming deadline, such as
> > > vblank, which the fence waiter would prefer not to miss.  This is to aid
> > > the fence signaler in making power management decisions, like boosting
> > > frequency as the deadline approaches and awareness of missing deadlines
> > > so that can be factored in to the frequency scaling.
> > >
> > > v2: Drop dma_fence::deadline and related logic to filter duplicate
> > >     deadlines, to avoid increasing dma_fence size.  The fence-context
> > >     implementation will need similar logic to track deadlines of all
> > >     the fences on the same timeline.  [ckoenig]
> > > v3: Clarify locking wrt. set_deadline callback
> > > v4: Clarify in docs comment that this is a hint
> > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > v6: More docs
> > > v7: Fix typo, clarify past deadlines
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > ---
> >
> > Hi Rob!
> >
> > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++++++
> > >  include/linux/dma-fence.h            | 22 +++++++++++
> > >  3 files changed, 87 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > > index 622b8156d212..183e480d8cea 100644
> > > --- a/Documentation/driver-api/dma-buf.rst
> > > +++ b/Documentation/driver-api/dma-buf.rst
> > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > >     :doc: fence signalling annotation
> > >
> > > +DMA Fence Deadline Hints
> > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > +   :doc: deadline hints
> > > +
> > >  DMA Fences Functions Reference
> > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > index 0de0482cd36e..f177c56269bb 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
> > >  }
> > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > >
> > > +/**
> > > + * DOC: deadline hints
> > > + *
> > > + * In an ideal world, it would be possible to pipeline a workload sufficiently
> > > + * that a utilization based device frequency governor could arrive at a minimum
> > > + * frequency that meets the requirements of the use-case, in order to minimize
> > > + * power consumption.  But in the real world there are many workloads which
> > > + * defy this ideal.  For example, but not limited to:
> > > + *
> > > + * * Workloads that ping-pong between device and CPU, with alternating periods
> > > + *   of CPU waiting for device, and device waiting on CPU.  This can result in
> > > + *   devfreq and cpufreq seeing idle time in their respective domains and in
> > > + *   result reduce frequency.
> > > + *
> > > + * * Workloads that interact with a periodic time based deadline, such as double
> > > + *   buffered GPU rendering vs vblank sync'd page flipping.  In this scenario,
> > > + *   missing a vblank deadline results in an *increase* in idle time on the GPU
> > > + *   (since it has to wait an additional vblank period), sending a signal to
> > > + *   the GPU's devfreq to reduce frequency, when in fact the opposite is what is
> > > + *   needed.
> >
> > This is the use case I'd like to get some better understanding about how
> > this series intends to work, as the problematic scheduling behavior
> > triggered by missed deadlines has plagued compositing display servers
> > for a long time.
> >
> > I apologize, I'm not a GPU driver developer, nor an OpenGL driver
> > developer, so I will need some hand holding when it comes to
> > understanding exactly what piece of software is responsible for
> > communicating what piece of information.
> >
> > > + *
> > > + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
> > > + * The deadline hint provides a way for the waiting driver, or userspace, to
> > > + * convey an appropriate sense of urgency to the signaling driver.
> > > + *
> > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for userspace
> > > + * facing APIs).  The time could either be some point in the future (such as
> > > + * the vblank based deadline for page-flipping, or the start of a compositor's
> > > + * composition cycle), or the current time to indicate an immediate deadline
> > > + * hint (Ie. forward progress cannot be made until this fence is signaled).
> >
> > Is it guaranteed that a GPU driver will use the actual start of the
> > vblank as the effective deadline? I have some memories of seing
> > something about vblank evasion browsing driver code, which I might have
> > misunderstood, but I have yet to find whether this is something
> > userspace can actually expect to be something it can rely on.
> 
> I guess you mean s/GPU driver/display driver/ ?  It makes things more
> clear if we talk about them separately even if they happen to be the
> same device.

Sure, sorry about being unclear about that.

> 
> Assuming that is what you mean, nothing strongly defines what the
> deadline is.  In practice there is probably some buffering in the
> display controller.  For ex, block based (including bandwidth
> compressed) formats, you need to buffer up a row of blocks to
> efficiently linearize for scanout.  So you probably need to latch some
> time before you start sending pixel data to the display.  But details
> like this are heavily implementation dependent.  I think the most
> reasonable thing to target is start of vblank.

The driver exposing those details would be quite useful for userspace
though, so that it can delay committing updates to late, but not too
late. Setting a deadline to be the vblank seems easy enough, but it
isn't enough for scheduling the actual commit.

> 
> Also, keep in mind the deadline hint is just that.  It won't magically
> make the GPU finish by that deadline, but it gives the GPU driver
> information about lateness so it can realize if it needs to clock up.

Sure, even if the GPU ramped up clocks to the max, if the job queue is
too large, it won't magically invent more cycles to squeeze in.

> 
> > Can userspace set a deadline that targets the next vblank deadline
> > before GPU work has been flushed e.g. at the start of a paint cycle, and
> > still be sure that the kernel has the information it needs to know it should
> > make its clocks increase their speed in time for when the actual work
> > has been actually flushed? Or is it needed that the this deadline is set
> > at the end?
> 
> You need a fence to set the deadline, and for that work needs to be
> flushed.  But you can't associate a deadline with work that the kernel
> is unaware of anyways.

That makes sense, but it might also a bit inadequate to have it as the
only way to tell the kernel it should speed things up. Even with the
trick i915 does, with GNOME Shell, we still end up with the feedback
loop this series aims to mitigate. Doing triple buffering, i.e. delaying
or dropping the first frame is so far the best work around that works,
except doing other tricks that makes the kernel to ramp up its clock.
Having to rely on choosing between latency and frame drops should
ideally not have to be made.

> 
> > What I'm more or less trying to ask is, will a mode setting compositor
> > be able to tell the kernel to boost its clocks at the time it knows is
> > best, and how will it in practice achieve this?
> 
> The anticipated usage for a compositor is that, when you receive a
> <buf, fence> pair from an app, you immediately set a deadline for
> upcoming start-of-vblank on the fence fd passed from the app.  (Or for
> implicit sync you can use DMA_BUF_IOCTL_EXPORT_SYNC_FILE).  For the
> composite step, no need to set a deadline as this is already done on
> the kernel side in drm_atomic_helper_wait_for_fences().

So it sounds like the new uapi will help compositors that do not draw
with the intention of page flipping anything, and compositors that
deliberately delay the commit. I suppose with proper target presentation
time integration EGL/Vulkan WSI can set deadlines them as well. All that
sounds like a welcomed improvement, but I'm not convinced it's enough to
solve the problems we currently face.

> 
> > For example relying on the atomic mode setting commit setting the
> > deadline is fundamentally flawed, since user space will at times want to
> > purposefully delay committing until as late as possible, without doing
> > so causing an increased risk of missing the deadline due to the kernel
> > not speeding up clocks at the right time for GPU work that has already
> > been flushed long ago.
> 
> Right, this is the point for exposing the ioctl to userspace.
> 
> > Relying on commits also has no effect on GPU work queued by
> > a compositor drawing only to dma-bufs that are never intended to be
> > presented using mode setting. How can we make sure a compositor can
> > provide hints that the kernel will know to respect despite the
> > compositor not being drm master?
> 
> It doesn't matter if there are indirect dependencies.  Even if the
> compositor completely ignores deadline hints and fancy tricks like
> delaying composite decisions, the indirect dependency (app rendering)
> will delay the direct dependency (compositor rendering) of the page
> flip.  So the driver will still see whether it is late or early
> compared to the deadline, allowing it to adjust freq in the
> appropriate direction for the next frame.

Is it expected that WSI's will set their own deadlines, or should that
be the job of the compositor? For example by using compositors using
DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to set a
deadline matching the vsync it most ideally will be committed to?


Jonas

> 
> BR,
> -R
> 
> >
> > Jonas
> >
> > > + *
> > > + * Multiple deadlines may be set on a given fence, even in parallel.  See the
> > > + * documentation for &dma_fence_ops.set_deadline.
> > > + *
> > > + * The deadline hint is just that, a hint.  The driver that created the fence
> > > + * may react by increasing frequency, making different scheduling choices, etc.
> > > + * Or doing nothing at all.
> > > + */
> > > +
> > > +/**
> > > + * dma_fence_set_deadline - set desired fence-wait deadline hint
> > > + * @fence:    the fence that is to be waited on
> > > + * @deadline: the time by which the waiter hopes for the fence to be
> > > + *            signaled
> > > + *
> > > + * Give the fence signaler a hint about an upcoming deadline, such as
> > > + * vblank, by which point the waiter would prefer the fence to be
> > > + * signaled by.  This is intended to give feedback to the fence signaler
> > > + * to aid in power management decisions, such as boosting GPU frequency
> > > + * if a periodic vblank deadline is approaching but the fence is not
> > > + * yet signaled..
> > > + */
> > > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> > > +{
> > > +     if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> > > +             fence->ops->set_deadline(fence, deadline);
> > > +}
> > > +EXPORT_SYMBOL(dma_fence_set_deadline);
> > > +
> > >  /**
> > >   * dma_fence_describe - Dump fence describtion into seq_file
> > >   * @fence: the 6fence to describe
> > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > index 775cdc0b4f24..d54b595a0fe0 100644
> > > --- a/include/linux/dma-fence.h
> > > +++ b/include/linux/dma-fence.h
> > > @@ -257,6 +257,26 @@ struct dma_fence_ops {
> > >        */
> > >       void (*timeline_value_str)(struct dma_fence *fence,
> > >                                  char *str, int size);
> > > +
> > > +     /**
> > > +      * @set_deadline:
> > > +      *
> > > +      * Callback to allow a fence waiter to inform the fence signaler of
> > > +      * an upcoming deadline, such as vblank, by which point the waiter
> > > +      * would prefer the fence to be signaled by.  This is intended to
> > > +      * give feedback to the fence signaler to aid in power management
> > > +      * decisions, such as boosting GPU frequency.
> > > +      *
> > > +      * This is called without &dma_fence.lock held, it can be called
> > > +      * multiple times and from any context.  Locking is up to the callee
> > > +      * if it has some state to manage.  If multiple deadlines are set,
> > > +      * the expectation is to track the soonest one.  If the deadline is
> > > +      * before the current time, it should be interpreted as an immediate
> > > +      * deadline.
> > > +      *
> > > +      * This callback is optional.
> > > +      */
> > > +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
> > >  };
> > >
> > >  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> > > @@ -583,6 +603,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
> > >       return ret < 0 ? ret : 0;
> > >  }
> > >
> > > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> > > +
> > >  struct dma_fence *dma_fence_get_stub(void);
> > >  struct dma_fence *dma_fence_allocate_private_stub(void);
> > >  u64 dma_fence_context_alloc(unsigned num);
> > > --
> > > 2.39.2
> > >
