Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 049E86BCABE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635D810E063;
	Thu, 16 Mar 2023 09:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CEC10E048;
 Thu, 16 Mar 2023 09:26:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j11so1433228lfg.13;
 Thu, 16 Mar 2023 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678958806;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zBKJ7NrmRBzfIDjKoSTC1cqlNppklEr7/ciolYVooCM=;
 b=bX2R5z9vZ9k8MunExNWNbR2qhqPbDGh5Ky72E8Sp1Y0UHuyd/b0KLGbZHa4Ex5xEPI
 kHLg0w6UdDoNp7XBuf3jGJOZY+whBMVnvL9FRVcVCo9kYqPiE6UrAprn1RAx2mZOUKRR
 SegPo444hHt+KAEPRC1ybGmuzAXPck6YYfwaz+vWnDC6/I0R9yrM2u0G3EOqPssD7kr2
 6Hh7dQ4wFv0IZbYBawDoGO4zQP7vZy+ajAJUiIfilZEUSftEkDzccq5o0g8InSL74Moj
 3yYFoee/xCFn9+vD/ot5L/TsgOusK17LD78eLcWEcTEMjIfHQhCD4/Wvq2S2IponQjF2
 cN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678958806;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBKJ7NrmRBzfIDjKoSTC1cqlNppklEr7/ciolYVooCM=;
 b=csu87wGLfYo6EWbDBSMAU7ceQjXQRtlK4QZty20ytnOGzMqhhqWUmKUQjBiVaNXqZ1
 C2esaG0NoTZlOdU3RoKwAftAPYE7V5JMP/6JeRvocLfc69zBEWzNdStnUb/rnTM6seW3
 7ALVvcZktMGCI0W0wPBekxAKwPXtQB9egZnneRbJ6pIqWagtzO9B1Mj5IDrTdUhjE4XV
 9vF0wO08783mCjyD1r74nQS1rb+RtZX2Z5sIjTwHusdSoMNq+orfSiPayOs6BqBRbNl1
 ChRJjcUEDO/7OAydpAK/58KnI6HYAJ9kCk93zp2xwHJDbCLYP8Ivu8+QIasfM90TsCUA
 CoWg==
X-Gm-Message-State: AO0yUKWiF44hRDO6PHmaZt8tCIAFZjfJ9ZaDHXgTgJ/OKa9n8Tb+03qk
 FqpxZDFooUyG+7Zdy7s5vq0=
X-Google-Smtp-Source: AK7set8XenzJd+qCQYfLErlwcIu2Egv84C+weYpJ6G8Z39ksch9yfmUxE7pBpR5VirTCsEkHe7uUYQ==
X-Received: by 2002:ac2:46e1:0:b0:4a4:68b8:f4bd with SMTP id
 q1-20020ac246e1000000b004a468b8f4bdmr3030555lfo.3.1678958805808; 
 Thu, 16 Mar 2023 02:26:45 -0700 (PDT)
Received: from gmail.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac255b2000000b004db4936c866sm1149034lfg.38.2023.03.16.02.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 02:26:45 -0700 (PDT)
Date: Thu, 16 Mar 2023 10:26:42 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <ZBLg0t0tTVvuPuiJ@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
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

On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> On Wed, Mar 15, 2023 at 6:53 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > On Fri, Mar 10, 2023 at 7:45 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Add a way to hint to the fence signaler of an upcoming deadline, such as
> > > > > vblank, which the fence waiter would prefer not to miss.  This is to aid
> > > > > the fence signaler in making power management decisions, like boosting
> > > > > frequency as the deadline approaches and awareness of missing deadlines
> > > > > so that can be factored in to the frequency scaling.
> > > > >
> > > > > v2: Drop dma_fence::deadline and related logic to filter duplicate
> > > > >     deadlines, to avoid increasing dma_fence size.  The fence-context
> > > > >     implementation will need similar logic to track deadlines of all
> > > > >     the fences on the same timeline.  [ckoenig]
> > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > v4: Clarify in docs comment that this is a hint
> > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > v6: More docs
> > > > > v7: Fix typo, clarify past deadlines
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > ---
> > > >
> > > > Hi Rob!
> > > >
> > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++++++
> > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > >  3 files changed, 87 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > > > > index 622b8156d212..183e480d8cea 100644
> > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > >     :doc: fence signalling annotation
> > > > >
> > > > > +DMA Fence Deadline Hints
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > +
> > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > +   :doc: deadline hints
> > > > > +
> > > > >  DMA Fences Functions Reference
> > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
> > > > >  }
> > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > >
> > > > > +/**
> > > > > + * DOC: deadline hints
> > > > > + *
> > > > > + * In an ideal world, it would be possible to pipeline a workload sufficiently
> > > > > + * that a utilization based device frequency governor could arrive at a minimum
> > > > > + * frequency that meets the requirements of the use-case, in order to minimize
> > > > > + * power consumption.  But in the real world there are many workloads which
> > > > > + * defy this ideal.  For example, but not limited to:
> > > > > + *
> > > > > + * * Workloads that ping-pong between device and CPU, with alternating periods
> > > > > + *   of CPU waiting for device, and device waiting on CPU.  This can result in
> > > > > + *   devfreq and cpufreq seeing idle time in their respective domains and in
> > > > > + *   result reduce frequency.
> > > > > + *
> > > > > + * * Workloads that interact with a periodic time based deadline, such as double
> > > > > + *   buffered GPU rendering vs vblank sync'd page flipping.  In this scenario,
> > > > > + *   missing a vblank deadline results in an *increase* in idle time on the GPU
> > > > > + *   (since it has to wait an additional vblank period), sending a signal to
> > > > > + *   the GPU's devfreq to reduce frequency, when in fact the opposite is what is
> > > > > + *   needed.
> > > >
> > > > This is the use case I'd like to get some better understanding about how
> > > > this series intends to work, as the problematic scheduling behavior
> > > > triggered by missed deadlines has plagued compositing display servers
> > > > for a long time.
> > > >
> > > > I apologize, I'm not a GPU driver developer, nor an OpenGL driver
> > > > developer, so I will need some hand holding when it comes to
> > > > understanding exactly what piece of software is responsible for
> > > > communicating what piece of information.
> > > >
> > > > > + *
> > > > > + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
> > > > > + * The deadline hint provides a way for the waiting driver, or userspace, to
> > > > > + * convey an appropriate sense of urgency to the signaling driver.
> > > > > + *
> > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for userspace
> > > > > + * facing APIs).  The time could either be some point in the future (such as
> > > > > + * the vblank based deadline for page-flipping, or the start of a compositor's
> > > > > + * composition cycle), or the current time to indicate an immediate deadline
> > > > > + * hint (Ie. forward progress cannot be made until this fence is signaled).
> > > >
> > > > Is it guaranteed that a GPU driver will use the actual start of the
> > > > vblank as the effective deadline? I have some memories of seing
> > > > something about vblank evasion browsing driver code, which I might have
> > > > misunderstood, but I have yet to find whether this is something
> > > > userspace can actually expect to be something it can rely on.
> > >
> > > I guess you mean s/GPU driver/display driver/ ?  It makes things more
> > > clear if we talk about them separately even if they happen to be the
> > > same device.
> >
> > Sure, sorry about being unclear about that.
> >
> > >
> > > Assuming that is what you mean, nothing strongly defines what the
> > > deadline is.  In practice there is probably some buffering in the
> > > display controller.  For ex, block based (including bandwidth
> > > compressed) formats, you need to buffer up a row of blocks to
> > > efficiently linearize for scanout.  So you probably need to latch some
> > > time before you start sending pixel data to the display.  But details
> > > like this are heavily implementation dependent.  I think the most
> > > reasonable thing to target is start of vblank.
> >
> > The driver exposing those details would be quite useful for userspace
> > though, so that it can delay committing updates to late, but not too
> > late. Setting a deadline to be the vblank seems easy enough, but it
> > isn't enough for scheduling the actual commit.
> 
> I'm not entirely sure how that would even work.. but OTOH I think you
> are talking about something on the order of 100us?  But that is a bit
> of another topic.

Yes, something like that. But yea, it's not really related. Scheduling
commits closer to the deadline has more complex behavior than that too,
e.g. the need for real time scheduling, and knowing how long it usually
takes to create and commit and for the kernel to process.

> 

8-< *snip* 8-<

> > >
> > > You need a fence to set the deadline, and for that work needs to be
> > > flushed.  But you can't associate a deadline with work that the kernel
> > > is unaware of anyways.
> >
> > That makes sense, but it might also a bit inadequate to have it as the
> > only way to tell the kernel it should speed things up. Even with the
> > trick i915 does, with GNOME Shell, we still end up with the feedback
> > loop this series aims to mitigate. Doing triple buffering, i.e. delaying
> > or dropping the first frame is so far the best work around that works,
> > except doing other tricks that makes the kernel to ramp up its clock.
> > Having to rely on choosing between latency and frame drops should
> > ideally not have to be made.
> 
> Before you have a fence, the thing you want to be speeding up is the
> CPU, not the GPU.  There are existing mechanisms for that.

Is there no benefit to let the GPU know earlier that it should speed up,
so that when the job queue arrives, it's already up to speed?

> 
> TBF I'm of the belief that there is still a need for input based cpu
> boost (and early wake-up trigger for GPU).. we have something like
> this in CrOS kernel.  That is a bit of a different topic, but my point
> is that fence deadlines are just one of several things we need to
> optimize power/perf and responsiveness, rather than the single thing
> that solves every problem under the sun ;-)

Perhaps; but I believe it's a bit of a back channel of intent; the piece
of the puzzle that has the information to know whether there is need
actually speed up is the compositor, not the kernel.

For example, pressing 'p' while a terminal is focused does not need high
frequency clocks, it just needs the terminal emulator to draw a 'p' and
the compositor to composite that update. Pressing <Super> may however 
trigger a non-trivial animation moving a lot of stuff around on screen,
maybe triggering Wayland clients to draw and what not, and should most
arguably have the ability to "warn" the kernel about the upcoming flood
of work before it is already knocking on its door step.

> 

8-< *snip* 8-<

> >
> > Is it expected that WSI's will set their own deadlines, or should that
> > be the job of the compositor? For example by using compositors using
> > DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to set a
> > deadline matching the vsync it most ideally will be committed to?
> >
> 
> I'm kind of assuming compositors, but if the WSI somehow has more
> information about ideal presentation time, then I suppose it could be
> in the WSI?  I'll defer to folks who spend more time on WSI and
> compositors to hash out the details ;-)

With my compositor developer hat on, it might be best to let it be up to
the compositor, it's the one that knows if a client's content will
actually end up anywhere visible.


Jonas

> 
> BR,
> -R
