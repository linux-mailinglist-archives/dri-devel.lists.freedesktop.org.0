Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788176C32C9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D886A10E782;
	Tue, 21 Mar 2023 13:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467EA10E1A0;
 Tue, 21 Mar 2023 13:24:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g17so19105444lfv.4;
 Tue, 21 Mar 2023 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679405045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hGk4QhzV6m7VkJkhXX15t1lCL2ihZM2uNosdUtyN80g=;
 b=ZUAFkm09zT/2txCWSpqDsJy7gap41A5uBCG4xjzXv5RJE4Qs9SC+liY/RHxLEsc3/C
 BwzlsT+Y8RJiFY6yi64lvi2bIQaqW8V+s+ACbtkhFW2FF4xa2G0I+Hzu8+9OtvwwYEuV
 Bg/y0Rpu6zkeq0NiA/i7AHQLH6/0QExcdS8AI5BAsAdhLZNHk6P6PuOCBU/I5HLHRKuH
 kSH9AUzcjWKazzkuACrSdkLruEZtw08TS0mXWEi4YyMw0mTQk8EDKPn5YdPjAFdFRb6M
 ScyaFTjPnnE28fPz3XIVCq9XU6OkhrquyTXKY4yC1QCNQ/Zn1/Cpb+Rv8ti+zvld8DrP
 IBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hGk4QhzV6m7VkJkhXX15t1lCL2ihZM2uNosdUtyN80g=;
 b=nPj1PcnpM7RrncSy+zzrM+C0ARzOD3jho1bKfNENjzlx8igqNvLdQqy2db6r1MufH9
 4GpouhxtZCSUBCKg+48VrOdXrQh0gtxSiE5FhhDAlSMnc9Ocg9n9lW6+zBPjiMz9FJps
 eJJYF7GeQ1dHR7hCyHGw5Wu3n49GR5Rt98XSUmDXI+iHb14Op4U626s91Y12H7OHMUZd
 ohVteNMupYyd3EvxfgaZfSwdQFbic1uwqNATYo9s5jfn6esBrGm/zZbzATYQTZrws+Lf
 jUm4l89GwsAClIwlKXFd1RibHWzopc6qJbiIvsVd6gqRNOsxkB/VloLxchW0KCUIsTf5
 t9Lw==
X-Gm-Message-State: AO0yUKUW8JiiYMCjMbLdeeO/nma+ijnF7bC3M1vgeFLPyJl+Ba6iCiYG
 c/Lx07Y34pQKJrLv5rEYU0g=
X-Google-Smtp-Source: AK7set8Pn27qOKWi4fLa6EedkEGUcEQHTxM9gDXG1TvgDvmf79vRk1o6Cx6xjJuQDq5ugLjqqqTwww==
X-Received: by 2002:ac2:43d3:0:b0:4a4:68b9:1a14 with SMTP id
 u19-20020ac243d3000000b004a468b91a14mr692901lfl.60.1679405045219; 
 Tue, 21 Mar 2023 06:24:05 -0700 (PDT)
Received: from gmail.com (host-95-193-64-255.mobileonline.telia.com.
 [95.193.64.255]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac251b5000000b004eaf2207a33sm161998lfk.223.2023.03.21.06.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:24:04 -0700 (PDT)
Date: Tue, 21 Mar 2023 14:24:02 +0100
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <ZBmv8oTAqqAY/ZDP@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <ZBQ/qoxP+EGI0E7R@gmail.com>
 <CAF6AEGvj6SuA63M=tBBfek0ESgU3fRvPcJLKDMn3_hgL3OdnTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvj6SuA63M=tBBfek0ESgU3fRvPcJLKDMn3_hgL3OdnTA@mail.gmail.com>
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

On Fri, Mar 17, 2023 at 08:59:48AM -0700, Rob Clark wrote:
> On Fri, Mar 17, 2023 at 3:23 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> >
> > On Thu, Mar 16, 2023 at 09:28:55AM -0700, Rob Clark wrote:
> > > On Thu, Mar 16, 2023 at 2:26 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > > > > On Wed, Mar 15, 2023 at 6:53 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > > > > On Fri, Mar 10, 2023 at 7:45 AM Jonas Ådahl <jadahl@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > >
> > > > > > > > > Add a way to hint to the fence signaler of an upcoming deadline, such as
> > > > > > > > > vblank, which the fence waiter would prefer not to miss.  This is to aid
> > > > > > > > > the fence signaler in making power management decisions, like boosting
> > > > > > > > > frequency as the deadline approaches and awareness of missing deadlines
> > > > > > > > > so that can be factored in to the frequency scaling.
> > > > > > > > >
> > > > > > > > > v2: Drop dma_fence::deadline and related logic to filter duplicate
> > > > > > > > >     deadlines, to avoid increasing dma_fence size.  The fence-context
> > > > > > > > >     implementation will need similar logic to track deadlines of all
> > > > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > > > v6: More docs
> > > > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > > > >
> > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > > > ---
> > > > > > > >
> > > > > > > > Hi Rob!
> > > > > > > >
> > > > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++++++
> > > > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > > > >  3 files changed, 87 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > > > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > >     :doc: fence signalling annotation
> > > > > > > > >
> > > > > > > > > +DMA Fence Deadline Hints
> > > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > > +
> > > > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > > +   :doc: deadline hints
> > > > > > > > > +
> > > > > > > > >  DMA Fences Functions Reference
> > > > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > > > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
> > > > > > > > >  }
> > > > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > > > >
> > > > > > > > > +/**
> > > > > > > > > + * DOC: deadline hints
> > > > > > > > > + *
> > > > > > > > > + * In an ideal world, it would be possible to pipeline a workload sufficiently
> > > > > > > > > + * that a utilization based device frequency governor could arrive at a minimum
> > > > > > > > > + * frequency that meets the requirements of the use-case, in order to minimize
> > > > > > > > > + * power consumption.  But in the real world there are many workloads which
> > > > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > > > + *
> > > > > > > > > + * * Workloads that ping-pong between device and CPU, with alternating periods
> > > > > > > > > + *   of CPU waiting for device, and device waiting on CPU.  This can result in
> > > > > > > > > + *   devfreq and cpufreq seeing idle time in their respective domains and in
> > > > > > > > > + *   result reduce frequency.
> > > > > > > > > + *
> > > > > > > > > + * * Workloads that interact with a periodic time based deadline, such as double
> > > > > > > > > + *   buffered GPU rendering vs vblank sync'd page flipping.  In this scenario,
> > > > > > > > > + *   missing a vblank deadline results in an *increase* in idle time on the GPU
> > > > > > > > > + *   (since it has to wait an additional vblank period), sending a signal to
> > > > > > > > > + *   the GPU's devfreq to reduce frequency, when in fact the opposite is what is
> > > > > > > > > + *   needed.
> > > > > > > >
> > > > > > > > This is the use case I'd like to get some better understanding about how
> > > > > > > > this series intends to work, as the problematic scheduling behavior
> > > > > > > > triggered by missed deadlines has plagued compositing display servers
> > > > > > > > for a long time.
> > > > > > > >
> > > > > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL driver
> > > > > > > > developer, so I will need some hand holding when it comes to
> > > > > > > > understanding exactly what piece of software is responsible for
> > > > > > > > communicating what piece of information.
> > > > > > > >
> > > > > > > > > + *
> > > > > > > > > + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fence_set_deadline.
> > > > > > > > > + * The deadline hint provides a way for the waiting driver, or userspace, to
> > > > > > > > > + * convey an appropriate sense of urgency to the signaling driver.
> > > > > > > > > + *
> > > > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for userspace
> > > > > > > > > + * facing APIs).  The time could either be some point in the future (such as
> > > > > > > > > + * the vblank based deadline for page-flipping, or the start of a compositor's
> > > > > > > > > + * composition cycle), or the current time to indicate an immediate deadline
> > > > > > > > > + * hint (Ie. forward progress cannot be made until this fence is signaled).
> > > > > > > >
> > > > > > > > Is it guaranteed that a GPU driver will use the actual start of the
> > > > > > > > vblank as the effective deadline? I have some memories of seing
> > > > > > > > something about vblank evasion browsing driver code, which I might have
> > > > > > > > misunderstood, but I have yet to find whether this is something
> > > > > > > > userspace can actually expect to be something it can rely on.
> > > > > > >
> > > > > > > I guess you mean s/GPU driver/display driver/ ?  It makes things more
> > > > > > > clear if we talk about them separately even if they happen to be the
> > > > > > > same device.
> > > > > >
> > > > > > Sure, sorry about being unclear about that.
> > > > > >
> > > > > > >
> > > > > > > Assuming that is what you mean, nothing strongly defines what the
> > > > > > > deadline is.  In practice there is probably some buffering in the
> > > > > > > display controller.  For ex, block based (including bandwidth
> > > > > > > compressed) formats, you need to buffer up a row of blocks to
> > > > > > > efficiently linearize for scanout.  So you probably need to latch some
> > > > > > > time before you start sending pixel data to the display.  But details
> > > > > > > like this are heavily implementation dependent.  I think the most
> > > > > > > reasonable thing to target is start of vblank.
> > > > > >
> > > > > > The driver exposing those details would be quite useful for userspace
> > > > > > though, so that it can delay committing updates to late, but not too
> > > > > > late. Setting a deadline to be the vblank seems easy enough, but it
> > > > > > isn't enough for scheduling the actual commit.
> > > > >
> > > > > I'm not entirely sure how that would even work.. but OTOH I think you
> > > > > are talking about something on the order of 100us?  But that is a bit
> > > > > of another topic.
> > > >
> > > > Yes, something like that. But yea, it's not really related. Scheduling
> > > > commits closer to the deadline has more complex behavior than that too,
> > > > e.g. the need for real time scheduling, and knowing how long it usually
> > > > takes to create and commit and for the kernel to process.
> > > >
> > > > >
> > > >
> > > > 8-< *snip* 8-<
> > > >
> > > > > > >
> > > > > > > You need a fence to set the deadline, and for that work needs to be
> > > > > > > flushed.  But you can't associate a deadline with work that the kernel
> > > > > > > is unaware of anyways.
> > > > > >
> > > > > > That makes sense, but it might also a bit inadequate to have it as the
> > > > > > only way to tell the kernel it should speed things up. Even with the
> > > > > > trick i915 does, with GNOME Shell, we still end up with the feedback
> > > > > > loop this series aims to mitigate. Doing triple buffering, i.e. delaying
> > > > > > or dropping the first frame is so far the best work around that works,
> > > > > > except doing other tricks that makes the kernel to ramp up its clock.
> > > > > > Having to rely on choosing between latency and frame drops should
> > > > > > ideally not have to be made.
> > > > >
> > > > > Before you have a fence, the thing you want to be speeding up is the
> > > > > CPU, not the GPU.  There are existing mechanisms for that.
> > > >
> > > > Is there no benefit to let the GPU know earlier that it should speed up,
> > > > so that when the job queue arrives, it's already up to speed?
> > >
> > > Downstream we have input notifier that resumes the GPU so we can
> > > pipeline the 1-2ms it takes to boot up the GPU with userspace.  But we
> > > wait to boost freq until we have cmdstream to submit, since that
> > > doesn't take as long.  What needs help initially after input is all
> > > the stuff that happens on the CPU before the GPU can start to do
> > > anything ;-)
> >
> > How do you deal with boosting CPU speeds downstream? Does the input
> > notifier do that too?
> 
> Yes.. actually currently downstream (depending on device) we have 1 to
> 3 input notifiers, one for CPU boost, one for early-PSR-exit, and one
> to get a head start on booting up the GPU.

Would be really nice to upstream these, one way or the other, be it
actually input event based, or via some uapi to just poke the kernel. I
realize it's not related to this thread, so this is just me wishing
things into the void.

> 
> > >
> > > Btw, I guess I haven't made this clear, dma-fence deadline is trying
> > > to help the steady-state situation, rather than the input-latency
> > > situation.  It might take a frame or two of missed deadlines for
> > > gpufreq to arrive at a good steady-state freq.
> >
> > I'm just not sure it will help. Missed deadlines set at commit hasn't
> > been enough in the past to let the kernel understand it should speed
> > things up before the next frame (which will be a whole frame late
> > without any triple buffering which should be a last resort), so I don't
> > see how it will help by adding a userspace hook to do the same thing.
> 
> So deadline is just a superset of "right now" and "sometime in the
> future".. and this has been useful enough for i915 that they have both
> forms, when waiting on GPU via i915 specific ioctls and when pageflip
> (assuming userspace isn't deferring composition decision and instead
> just pushing it all down to the kernel).  But this breaks down in a
> few cases:
> 
> 1) non pageflip (for ex. ping-ponging between cpu and gpu) use cases
> when you wait via polling on fence fd or wait via drm_syncobj instead
> of DRM_IOCTL_I915_GEM_WAIT
> 2) when userspace decides late in frame to not pageflip because app
> fence isn't signaled yet

It breaks down in practice today, because we do entering the low-freq
feedback loop that triple buffering today effectively works around.
That is even with non-delayed page flipping, and a single pipeline
source (compositor only rendering) or only using already signaled ready
client buffers when compositing.

Anyway, I don't doubt its usefulness, just a bit pessimistic.

> 
> And this is all done in a way that doesn't help for situations where
> you have separate kms and render devices.  Or the kms driver doesn't
> bypass atomic helpers (ie. uses drm_atomic_helper_wait_for_fences()).
> So the technique has already proven to be useful.  This series just
> extends it beyond driver specific primitives (ie.
> dma_fence/drm_syncojb)
> 
> > I think input latency and steady state target frequency here is tightly
> > linked; what we should aim for is to provide enough information at the
> > right time so that it does *not* take a frame or two to of missed
> > deadlines to arrive at the target frequency, as those missed deadlines
> > either means either stuttering and/or lag.
> 
> If you have some magic way for a gl/vk driver to accurately predict
> how many cycles it will take to execute a sequence of draws, I'm all
> ears.
> 
> Realistically, the best solution on sudden input is to overshoot and
> let freqs settle back down.
> 
> But there is a lot more to input latency than GPU freq.  In UI
> workloads, even fullscreen animation, I don't really see the GPU going
> above the 2nd lowest OPP even on relatively small things like a618.
> UI input latency (touch scrolling, on-screen stylus / low-latency-ink,
> animations) are a separate issue from what this series addresses, and
> aren't too much to do with GPU freq.
> 
> > That it helps with the deliberately late commit I do understand, but we
> > don't do that yet, but intend to when there is kernel uapi to lets us do
> > so without negative consequences.
> >
> > >
> > > > >
> > > > > TBF I'm of the belief that there is still a need for input based cpu
> > > > > boost (and early wake-up trigger for GPU).. we have something like
> > > > > this in CrOS kernel.  That is a bit of a different topic, but my point
> > > > > is that fence deadlines are just one of several things we need to
> > > > > optimize power/perf and responsiveness, rather than the single thing
> > > > > that solves every problem under the sun ;-)
> > > >
> > > > Perhaps; but I believe it's a bit of a back channel of intent; the piece
> > > > of the puzzle that has the information to know whether there is need
> > > > actually speed up is the compositor, not the kernel.
> > > >
> > > > For example, pressing 'p' while a terminal is focused does not need high
> > > > frequency clocks, it just needs the terminal emulator to draw a 'p' and
> > > > the compositor to composite that update. Pressing <Super> may however
> > > > trigger a non-trivial animation moving a lot of stuff around on screen,
> > > > maybe triggering Wayland clients to draw and what not, and should most
> > > > arguably have the ability to "warn" the kernel about the upcoming flood
> > > > of work before it is already knocking on its door step.
> > >
> > > The super key is problematic, but not for the reason you think.  It is
> > > because it is a case where we should boost on key-up instead of
> > > key-down.. and the second key-up event comes after the cpu-boost is
> > > already in it's cool-down period.  But even if suboptimal in cases
> > > like this, it is still useful for touch/stylus cases where the
> > > slightest of lag is much more perceptible.
> >
> > Other keys are even more problematic. Alt, for example, does nothing,
> > Alt + Tab does some light rendering, but Alt + KeyAboveTab will,
> > depending on the current active applications, suddenly trigger N Wayland
> > surfaces to start rendering at the same time.
> >
> > >
> > > This is getting off topic but I kinda favor coming up with some sort
> > > of static definition that userspace could give the kernel to let the
> > > kernel know what input to boost on.  Or maybe something could be done
> > > with BPF?
> >
> > I have hard time seeing any static information can be enough, it's
> > depends too much on context what is expected to happen. And can a BPF
> > program really help? Unless BPF programs that pulls some internal kernel
> > strings to speed things up whenever userspace wants I don't see how it
> > is that much better.
> >
> > I don't think userspace is necessarily too slow to actively particitpate
> > in providing direct scheduling hints either. Input processing can, for
> > example, be off loaded to a real time scheduled thread, and plumbing any
> > hints about future expectations from rendering, windowing and layout
> > subsystems will be significantly easier to plumb to a real time input
> > thread than translated into static informations or BPF programs.
> 
> I mean, the kernel side input handler is called from irq context long
> before even the scheduler gets involved..
> 
> But I think you are over-thinking the Alt + SomeOtherKey case.  The
> important thing isn't what the other key is, it is just to know that
> Alt is a modifier key (ie. handle it on key-up instead of key-down).
> No need to over-complicate things.  It's probably enough to give the
> kernel a list of modifier+key combo's that do _something_..

Perhaps I'm over thinking it, it just seems all so unnecessary to
complicate the kernel so that it's able to predict when GUI animations
will happen instead of the GUI itself doing it when it is actually
beneficial. All it'd take (naively) is uapi for the three kind of boosts
downstream now does automatically from input events.

> 
> And like I've said before, keyboard input is the least problematic in
> terms of latency.  It is a _lot_ easier to notice lag with touch
> scrolling or stylus (on screen).  (The latter case, I think wayland
> has some catching up to do compared to CrOS or android.. you really
> need a way to allow the app to do front buffer rendering to an overlay
> for the stylus case, because even just 16ms delay is _very_
> noticeable.)

Sure, but here too userpsace (rt thread in the compositor) is probably a
good enough place to predict when to boost since it will be the one
proxies e.g. the stylus input events to the application.

Front buffering on the other hand is a very different topic ;)


Jonas

> 
> BR,
> -R
