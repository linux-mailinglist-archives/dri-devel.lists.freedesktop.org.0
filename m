Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57056C345A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E4110E798;
	Tue, 21 Mar 2023 14:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7310E240;
 Tue, 21 Mar 2023 14:34:55 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q30so4134367oiw.13;
 Tue, 21 Mar 2023 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679409294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHwEUr3xaAg6Wrhc1hbxEetETlHtHnIV3U6L8zatXy4=;
 b=Q9GA1TJ6MGiHa7ZFJAv8PTKRhX9VgjCs49Hqrz4tiHK7xTJ1sxyUg3Q/ssMxz9FBF6
 dsxkmQ2XGGcYfKZHiXXl3MdV43z6R+49ldgfcJXmSGE/XGUVV2qav9WpGjKhlbwkc4Nx
 xHXtHcThoiK6aF0+qDf+nNCOAr5kfbXUNXwv4wUpNL8+ad0h5XcbZAiGaAphlbxn+WLF
 EqkE98qP6peixYYJEvbkXH4wzw4id9iDh4QIJJwRcrDTWqmfyIZCQJkL72DYV5hIyOli
 XREBfXCRe8ng20w9VaQaCNrssKRLz2P5MT/XZEgFWDVvMdNLmQ6bXZG/ARNaEDg3C68w
 l78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679409294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHwEUr3xaAg6Wrhc1hbxEetETlHtHnIV3U6L8zatXy4=;
 b=USaxFcNMklDtd2PLaa1b/vuf646Ligj1eVGj82Ij03sSkewXzJx1xQ2JT2guI5moCV
 5CwTWIzuBTbxB0Wpnb5AuEhPJrKgzQZ0HtBXrOLM0WB+0HpPVNIZ5cr9Qt6epYUwSR4O
 k5iHkCbB3s9Nc7wf+AyNoB1n5RePH3aEfkprKcDH+pND1HkPGTruRJIufbHvp7TCxmp0
 gGA3hXNRByjJo/b4ll3Wk8jBIgbySUPYHXQthtxGCzl4ww14x9j2kGKfDJSJ0sFcqg4w
 4sIwQs8TLdxhh7kgjA7x+//jbIWpx45nKXsflJ36QPdHKbsqUkrun/4lYxN1lZQMDGQB
 az1g==
X-Gm-Message-State: AO0yUKV2fKgvUycPAIX5WbNo1VwiJybhPW/rwxatrX0dPsAsglIHKFBj
 pGJLCSrGKsRBb/3UShXqJER6InsK46YCyQDs/No=
X-Google-Smtp-Source: AK7set+pnmBqO1NIecXSUrEbR0Yq63PDamRaqBBUtbGdaaQ39PAIwunMrvCuCKU1wmIfuzjOaWPRSBI4GB8Jrqo7TtQ=
X-Received: by 2002:aca:d0e:0:b0:384:6d14:c707 with SMTP id
 14-20020aca0d0e000000b003846d14c707mr640479oin.5.1679409292898; Tue, 21 Mar
 2023 07:34:52 -0700 (PDT)
MIME-Version: 1.0
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
 <ZBmv8oTAqqAY/ZDP@gmail.com>
In-Reply-To: <ZBmv8oTAqqAY/ZDP@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Mar 2023 07:34:41 -0700
Message-ID: <CAF6AEGtAOGYGYkd_NCgyxUb9+sw8_8TQxypRj-i+brwppuXwXw@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
To: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@gmail.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Padovan <gustavo@padovan.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 6:24=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.com>=
 wrote:
>
> On Fri, Mar 17, 2023 at 08:59:48AM -0700, Rob Clark wrote:
> > On Fri, Mar 17, 2023 at 3:23=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote:
> > >
> > > On Thu, Mar 16, 2023 at 09:28:55AM -0700, Rob Clark wrote:
> > > > On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gm=
ail.com> wrote:
> > > > >
> > > > > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > > > > > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadah=
l@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > > > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <j=
adahl@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote=
:
> > > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > >
> > > > > > > > > > Add a way to hint to the fence signaler of an upcoming =
deadline, such as
> > > > > > > > > > vblank, which the fence waiter would prefer not to miss=
.  This is to aid
> > > > > > > > > > the fence signaler in making power management decisions=
, like boosting
> > > > > > > > > > frequency as the deadline approaches and awareness of m=
issing deadlines
> > > > > > > > > > so that can be factored in to the frequency scaling.
> > > > > > > > > >
> > > > > > > > > > v2: Drop dma_fence::deadline and related logic to filte=
r duplicate
> > > > > > > > > >     deadlines, to avoid increasing dma_fence size.  The=
 fence-context
> > > > > > > > > >     implementation will need similar logic to track dea=
dlines of all
> > > > > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > > > > v6: More docs
> > > > > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd=
.com>
> > > > > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > > > > ---
> > > > > > > > >
> > > > > > > > > Hi Rob!
> > > > > > > > >
> > > > > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++=
++++++++++++++++
> > > > > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > > > > >  3 files changed, 87 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Doc=
umentation/driver-api/dma-buf.rst
> > > > > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > > >     :doc: fence signalling annotation
> > > > > > > > > >
> > > > > > > > > > +DMA Fence Deadline Hints
> > > > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > > > +
> > > > > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > > > +   :doc: deadline hints
> > > > > > > > > > +
> > > > > > > > > >  DMA Fences Functions Reference
> > > > > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-=
buf/dma-fence.c
> > > > > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct =
dma_fence **fences, uint32_t count,
> > > > > > > > > >  }
> > > > > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > > > > >
> > > > > > > > > > +/**
> > > > > > > > > > + * DOC: deadline hints
> > > > > > > > > > + *
> > > > > > > > > > + * In an ideal world, it would be possible to pipeline=
 a workload sufficiently
> > > > > > > > > > + * that a utilization based device frequency governor =
could arrive at a minimum
> > > > > > > > > > + * frequency that meets the requirements of the use-ca=
se, in order to minimize
> > > > > > > > > > + * power consumption.  But in the real world there are=
 many workloads which
> > > > > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > > > > + *
> > > > > > > > > > + * * Workloads that ping-pong between device and CPU, =
with alternating periods
> > > > > > > > > > + *   of CPU waiting for device, and device waiting on =
CPU.  This can result in
> > > > > > > > > > + *   devfreq and cpufreq seeing idle time in their res=
pective domains and in
> > > > > > > > > > + *   result reduce frequency.
> > > > > > > > > > + *
> > > > > > > > > > + * * Workloads that interact with a periodic time base=
d deadline, such as double
> > > > > > > > > > + *   buffered GPU rendering vs vblank sync'd page flip=
ping.  In this scenario,
> > > > > > > > > > + *   missing a vblank deadline results in an *increase=
* in idle time on the GPU
> > > > > > > > > > + *   (since it has to wait an additional vblank period=
), sending a signal to
> > > > > > > > > > + *   the GPU's devfreq to reduce frequency, when in fa=
ct the opposite is what is
> > > > > > > > > > + *   needed.
> > > > > > > > >
> > > > > > > > > This is the use case I'd like to get some better understa=
nding about how
> > > > > > > > > this series intends to work, as the problematic schedulin=
g behavior
> > > > > > > > > triggered by missed deadlines has plagued compositing dis=
play servers
> > > > > > > > > for a long time.
> > > > > > > > >
> > > > > > > > > I apologize, I'm not a GPU driver developer, nor an OpenG=
L driver
> > > > > > > > > developer, so I will need some hand holding when it comes=
 to
> > > > > > > > > understanding exactly what piece of software is responsib=
le for
> > > > > > > > > communicating what piece of information.
> > > > > > > > >
> > > > > > > > > > + *
> > > > > > > > > > + * To this end, deadline hint(s) can be set on a &dma_=
fence via &dma_fence_set_deadline.
> > > > > > > > > > + * The deadline hint provides a way for the waiting dr=
iver, or userspace, to
> > > > > > > > > > + * convey an appropriate sense of urgency to the signa=
ling driver.
> > > > > > > > > > + *
> > > > > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_M=
ONOTONIC for userspace
> > > > > > > > > > + * facing APIs).  The time could either be some point =
in the future (such as
> > > > > > > > > > + * the vblank based deadline for page-flipping, or the=
 start of a compositor's
> > > > > > > > > > + * composition cycle), or the current time to indicate=
 an immediate deadline
> > > > > > > > > > + * hint (Ie. forward progress cannot be made until thi=
s fence is signaled).
> > > > > > > > >
> > > > > > > > > Is it guaranteed that a GPU driver will use the actual st=
art of the
> > > > > > > > > vblank as the effective deadline? I have some memories of=
 seing
> > > > > > > > > something about vblank evasion browsing driver code, whic=
h I might have
> > > > > > > > > misunderstood, but I have yet to find whether this is som=
ething
> > > > > > > > > userspace can actually expect to be something it can rely=
 on.
> > > > > > > >
> > > > > > > > I guess you mean s/GPU driver/display driver/ ?  It makes t=
hings more
> > > > > > > > clear if we talk about them separately even if they happen =
to be the
> > > > > > > > same device.
> > > > > > >
> > > > > > > Sure, sorry about being unclear about that.
> > > > > > >
> > > > > > > >
> > > > > > > > Assuming that is what you mean, nothing strongly defines wh=
at the
> > > > > > > > deadline is.  In practice there is probably some buffering =
in the
> > > > > > > > display controller.  For ex, block based (including bandwid=
th
> > > > > > > > compressed) formats, you need to buffer up a row of blocks =
to
> > > > > > > > efficiently linearize for scanout.  So you probably need to=
 latch some
> > > > > > > > time before you start sending pixel data to the display.  B=
ut details
> > > > > > > > like this are heavily implementation dependent.  I think th=
e most
> > > > > > > > reasonable thing to target is start of vblank.
> > > > > > >
> > > > > > > The driver exposing those details would be quite useful for u=
serspace
> > > > > > > though, so that it can delay committing updates to late, but =
not too
> > > > > > > late. Setting a deadline to be the vblank seems easy enough, =
but it
> > > > > > > isn't enough for scheduling the actual commit.
> > > > > >
> > > > > > I'm not entirely sure how that would even work.. but OTOH I thi=
nk you
> > > > > > are talking about something on the order of 100us?  But that is=
 a bit
> > > > > > of another topic.
> > > > >
> > > > > Yes, something like that. But yea, it's not really related. Sched=
uling
> > > > > commits closer to the deadline has more complex behavior than tha=
t too,
> > > > > e.g. the need for real time scheduling, and knowing how long it u=
sually
> > > > > takes to create and commit and for the kernel to process.
> > > > >
> > > > > >
> > > > >
> > > > > 8-< *snip* 8-<
> > > > >
> > > > > > > >
> > > > > > > > You need a fence to set the deadline, and for that work nee=
ds to be
> > > > > > > > flushed.  But you can't associate a deadline with work that=
 the kernel
> > > > > > > > is unaware of anyways.
> > > > > > >
> > > > > > > That makes sense, but it might also a bit inadequate to have =
it as the
> > > > > > > only way to tell the kernel it should speed things up. Even w=
ith the
> > > > > > > trick i915 does, with GNOME Shell, we still end up with the f=
eedback
> > > > > > > loop this series aims to mitigate. Doing triple buffering, i.=
e. delaying
> > > > > > > or dropping the first frame is so far the best work around th=
at works,
> > > > > > > except doing other tricks that makes the kernel to ramp up it=
s clock.
> > > > > > > Having to rely on choosing between latency and frame drops sh=
ould
> > > > > > > ideally not have to be made.
> > > > > >
> > > > > > Before you have a fence, the thing you want to be speeding up i=
s the
> > > > > > CPU, not the GPU.  There are existing mechanisms for that.
> > > > >
> > > > > Is there no benefit to let the GPU know earlier that it should sp=
eed up,
> > > > > so that when the job queue arrives, it's already up to speed?
> > > >
> > > > Downstream we have input notifier that resumes the GPU so we can
> > > > pipeline the 1-2ms it takes to boot up the GPU with userspace.  But=
 we
> > > > wait to boost freq until we have cmdstream to submit, since that
> > > > doesn't take as long.  What needs help initially after input is all
> > > > the stuff that happens on the CPU before the GPU can start to do
> > > > anything ;-)
> > >
> > > How do you deal with boosting CPU speeds downstream? Does the input
> > > notifier do that too?
> >
> > Yes.. actually currently downstream (depending on device) we have 1 to
> > 3 input notifiers, one for CPU boost, one for early-PSR-exit, and one
> > to get a head start on booting up the GPU.
>
> Would be really nice to upstream these, one way or the other, be it
> actually input event based, or via some uapi to just poke the kernel. I
> realize it's not related to this thread, so this is just me wishing
> things into the void.

There was a drm/input_helper proposed maybe a year or so back, mainly
for the early-PSR-exit but I was planning to build on that for early
GPU wake-up.  I guess we should revisit it.  Might not be the right
place for cpu boost, but it solves some problems so it's a start.

As far as uapi, I think sysfs already gives you everything or at least
most everything you need.  For ex,
/sys/devices/system/cpu/cpufreq/policy*/scaling_min_freq .. on the gpu
side, for drivers using devfreq (ie. panfrost/msm/etc) there is
similar sysfs.  I'm not sure what sort of knobs are avail on
intel/amd.

BR,
-R

> >
> > > >
> > > > Btw, I guess I haven't made this clear, dma-fence deadline is tryin=
g
> > > > to help the steady-state situation, rather than the input-latency
> > > > situation.  It might take a frame or two of missed deadlines for
> > > > gpufreq to arrive at a good steady-state freq.
> > >
> > > I'm just not sure it will help. Missed deadlines set at commit hasn't
> > > been enough in the past to let the kernel understand it should speed
> > > things up before the next frame (which will be a whole frame late
> > > without any triple buffering which should be a last resort), so I don=
't
> > > see how it will help by adding a userspace hook to do the same thing.
> >
> > So deadline is just a superset of "right now" and "sometime in the
> > future".. and this has been useful enough for i915 that they have both
> > forms, when waiting on GPU via i915 specific ioctls and when pageflip
> > (assuming userspace isn't deferring composition decision and instead
> > just pushing it all down to the kernel).  But this breaks down in a
> > few cases:
> >
> > 1) non pageflip (for ex. ping-ponging between cpu and gpu) use cases
> > when you wait via polling on fence fd or wait via drm_syncobj instead
> > of DRM_IOCTL_I915_GEM_WAIT
> > 2) when userspace decides late in frame to not pageflip because app
> > fence isn't signaled yet
>
> It breaks down in practice today, because we do entering the low-freq
> feedback loop that triple buffering today effectively works around.
> That is even with non-delayed page flipping, and a single pipeline
> source (compositor only rendering) or only using already signaled ready
> client buffers when compositing.
>
> Anyway, I don't doubt its usefulness, just a bit pessimistic.
>
> >
> > And this is all done in a way that doesn't help for situations where
> > you have separate kms and render devices.  Or the kms driver doesn't
> > bypass atomic helpers (ie. uses drm_atomic_helper_wait_for_fences()).
> > So the technique has already proven to be useful.  This series just
> > extends it beyond driver specific primitives (ie.
> > dma_fence/drm_syncojb)
> >
> > > I think input latency and steady state target frequency here is tight=
ly
> > > linked; what we should aim for is to provide enough information at th=
e
> > > right time so that it does *not* take a frame or two to of missed
> > > deadlines to arrive at the target frequency, as those missed deadline=
s
> > > either means either stuttering and/or lag.
> >
> > If you have some magic way for a gl/vk driver to accurately predict
> > how many cycles it will take to execute a sequence of draws, I'm all
> > ears.
> >
> > Realistically, the best solution on sudden input is to overshoot and
> > let freqs settle back down.
> >
> > But there is a lot more to input latency than GPU freq.  In UI
> > workloads, even fullscreen animation, I don't really see the GPU going
> > above the 2nd lowest OPP even on relatively small things like a618.
> > UI input latency (touch scrolling, on-screen stylus / low-latency-ink,
> > animations) are a separate issue from what this series addresses, and
> > aren't too much to do with GPU freq.
> >
> > > That it helps with the deliberately late commit I do understand, but =
we
> > > don't do that yet, but intend to when there is kernel uapi to lets us=
 do
> > > so without negative consequences.
> > >
> > > >
> > > > > >
> > > > > > TBF I'm of the belief that there is still a need for input base=
d cpu
> > > > > > boost (and early wake-up trigger for GPU).. we have something l=
ike
> > > > > > this in CrOS kernel.  That is a bit of a different topic, but m=
y point
> > > > > > is that fence deadlines are just one of several things we need =
to
> > > > > > optimize power/perf and responsiveness, rather than the single =
thing
> > > > > > that solves every problem under the sun ;-)
> > > > >
> > > > > Perhaps; but I believe it's a bit of a back channel of intent; th=
e piece
> > > > > of the puzzle that has the information to know whether there is n=
eed
> > > > > actually speed up is the compositor, not the kernel.
> > > > >
> > > > > For example, pressing 'p' while a terminal is focused does not ne=
ed high
> > > > > frequency clocks, it just needs the terminal emulator to draw a '=
p' and
> > > > > the compositor to composite that update. Pressing <Super> may how=
ever
> > > > > trigger a non-trivial animation moving a lot of stuff around on s=
creen,
> > > > > maybe triggering Wayland clients to draw and what not, and should=
 most
> > > > > arguably have the ability to "warn" the kernel about the upcoming=
 flood
> > > > > of work before it is already knocking on its door step.
> > > >
> > > > The super key is problematic, but not for the reason you think.  It=
 is
> > > > because it is a case where we should boost on key-up instead of
> > > > key-down.. and the second key-up event comes after the cpu-boost is
> > > > already in it's cool-down period.  But even if suboptimal in cases
> > > > like this, it is still useful for touch/stylus cases where the
> > > > slightest of lag is much more perceptible.
> > >
> > > Other keys are even more problematic. Alt, for example, does nothing,
> > > Alt + Tab does some light rendering, but Alt + KeyAboveTab will,
> > > depending on the current active applications, suddenly trigger N Wayl=
and
> > > surfaces to start rendering at the same time.
> > >
> > > >
> > > > This is getting off topic but I kinda favor coming up with some sor=
t
> > > > of static definition that userspace could give the kernel to let th=
e
> > > > kernel know what input to boost on.  Or maybe something could be do=
ne
> > > > with BPF?
> > >
> > > I have hard time seeing any static information can be enough, it's
> > > depends too much on context what is expected to happen. And can a BPF
> > > program really help? Unless BPF programs that pulls some internal ker=
nel
> > > strings to speed things up whenever userspace wants I don't see how i=
t
> > > is that much better.
> > >
> > > I don't think userspace is necessarily too slow to actively particitp=
ate
> > > in providing direct scheduling hints either. Input processing can, fo=
r
> > > example, be off loaded to a real time scheduled thread, and plumbing =
any
> > > hints about future expectations from rendering, windowing and layout
> > > subsystems will be significantly easier to plumb to a real time input
> > > thread than translated into static informations or BPF programs.
> >
> > I mean, the kernel side input handler is called from irq context long
> > before even the scheduler gets involved..
> >
> > But I think you are over-thinking the Alt + SomeOtherKey case.  The
> > important thing isn't what the other key is, it is just to know that
> > Alt is a modifier key (ie. handle it on key-up instead of key-down).
> > No need to over-complicate things.  It's probably enough to give the
> > kernel a list of modifier+key combo's that do _something_..
>
> Perhaps I'm over thinking it, it just seems all so unnecessary to
> complicate the kernel so that it's able to predict when GUI animations
> will happen instead of the GUI itself doing it when it is actually
> beneficial. All it'd take (naively) is uapi for the three kind of boosts
> downstream now does automatically from input events.
>
> >
> > And like I've said before, keyboard input is the least problematic in
> > terms of latency.  It is a _lot_ easier to notice lag with touch
> > scrolling or stylus (on screen).  (The latter case, I think wayland
> > has some catching up to do compared to CrOS or android.. you really
> > need a way to allow the app to do front buffer rendering to an overlay
> > for the stylus case, because even just 16ms delay is _very_
> > noticeable.)
>
> Sure, but here too userpsace (rt thread in the compositor) is probably a
> good enough place to predict when to boost since it will be the one
> proxies e.g. the stylus input events to the application.
>
> Front buffering on the other hand is a very different topic ;)
>
>
> Jonas
>
> >
> > BR,
> > -R
