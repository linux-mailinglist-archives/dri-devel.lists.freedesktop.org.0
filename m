Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E029F6BDC31
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3E010E396;
	Thu, 16 Mar 2023 22:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C898310E39A;
 Thu, 16 Mar 2023 22:59:38 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bj30so2541508oib.6;
 Thu, 16 Mar 2023 15:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679007578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+Q3zykGKWzwlxB7YogT8IrEAcZkZC2hIiwrlEj+NA8=;
 b=FguCteUmTFci0RgETq6WkwmDHT8UYfvA28+2vHPtlqupZdkc63sRWlKt14cz/toDJC
 9OrBL5OTqtPdvx0Yom1AZ/ZERRzGsnCoGQ12R9iA79BUgAIA9aCLusQ0BWeIZzhSTreW
 W5sPl+vDj12dM8e0QYcxCCRA8JPwxf5xpUNmlTt2pbeDYB0/YVTtILynIMdsi30h+/EQ
 L9NcPHzGJM+WJr8k0Uo7f7Pcq4dRc6nkqv6WNSFPP704XrlFMMSYb8FVYo/+lv4QygWb
 3yhjJryoyOU7Qb/ZNjVoi3NlP5l5xd0J9PIohhAAkRBsXYVnCvYSDI+1oM2KkmuIxKG0
 DMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679007578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+Q3zykGKWzwlxB7YogT8IrEAcZkZC2hIiwrlEj+NA8=;
 b=IgVFMHobdGw8nXWkFdAIaprGcS0rOAqXI+JQuG2SYfuP2T8VehZos0/omQPaMDQmS3
 qK1XU21l8iqqzQqpmmvecV5XY70S2AbYEf2kBtl39u5DQzvIhylhIbeCPPKYwxbw5t8z
 ooFxwg+/kpil837S1RyvxvvuIHnlY/kp6pbHYxKXaixbJoRW9VsgFEjxFX4qcOXaIxA1
 X+CE+W+Ua0731Z9aeRp/R9Zhrt9tZG2MY+0/b4Crcq/u6Bh6QqjRLeJHMRNrIdr0ddKS
 BilvnQEzchI8xHIrrCsWtNHtaOKKsAvzyfyzpXyzUHS9QBJ6Mj6mUbgGvrUjyOyMo67h
 DlUg==
X-Gm-Message-State: AO0yUKUI7Q1TiAqPpIRwcCneD+W9jmEz0MBJxnwaNgjymni9xHOek+e7
 AeGhsgKa33xaLslqPJQYJvDyXfDgqlOx3wFrBP8=
X-Google-Smtp-Source: AK7set8uDMT2O8oKnFiQPXA3/WP81jqHWAuiW4OEseQS11OgJqpHWpRBtD8xF3tvEjMqiVBjYC6q1TWBDyUQIMnPzCs=
X-Received: by 2002:a05:6808:902:b0:378:30dc:ae5b with SMTP id
 w2-20020a056808090200b0037830dcae5bmr2657557oih.5.1679007577776; Thu, 16 Mar
 2023 15:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
In-Reply-To: <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Mar 2023 15:59:26 -0700
Message-ID: <CAF6AEGuSaNAQUfbkJf2bt+VMTxYWTf0j0jiJOS6Q-6HfCLnw6Q@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
To: Sebastian Wick <sebastian.wick@redhat.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Padovan <gustavo@padovan.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 3:22=E2=80=AFPM Sebastian Wick
<sebastian.wick@redhat.com> wrote:
>
> On Thu, Mar 16, 2023 at 5:29=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote:
> > >
> > > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > > > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@gm=
ail.com> wrote:
> > > > >
> > > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jadah=
l@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > Add a way to hint to the fence signaler of an upcoming dead=
line, such as
> > > > > > > > vblank, which the fence waiter would prefer not to miss.  T=
his is to aid
> > > > > > > > the fence signaler in making power management decisions, li=
ke boosting
> > > > > > > > frequency as the deadline approaches and awareness of missi=
ng deadlines
> > > > > > > > so that can be factored in to the frequency scaling.
> > > > > > > >
> > > > > > > > v2: Drop dma_fence::deadline and related logic to filter du=
plicate
> > > > > > > >     deadlines, to avoid increasing dma_fence size.  The fen=
ce-context
> > > > > > > >     implementation will need similar logic to track deadlin=
es of all
> > > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > > v6: More docs
> > > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > > >
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com=
>
> > > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > > ---
> > > > > > >
> > > > > > > Hi Rob!
> > > > > > >
> > > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++=
++++++++++++
> > > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > > >  3 files changed, 87 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documen=
tation/driver-api/dma-buf.rst
> > > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > >     :doc: fence signalling annotation
> > > > > > > >
> > > > > > > > +DMA Fence Deadline Hints
> > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > +
> > > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > +   :doc: deadline hints
> > > > > > > > +
> > > > > > > >  DMA Fences Functions Reference
> > > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > >
> > > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/=
dma-fence.c
> > > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_=
fence **fences, uint32_t count,
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * DOC: deadline hints
> > > > > > > > + *
> > > > > > > > + * In an ideal world, it would be possible to pipeline a w=
orkload sufficiently
> > > > > > > > + * that a utilization based device frequency governor coul=
d arrive at a minimum
> > > > > > > > + * frequency that meets the requirements of the use-case, =
in order to minimize
> > > > > > > > + * power consumption.  But in the real world there are man=
y workloads which
> > > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > > + *
> > > > > > > > + * * Workloads that ping-pong between device and CPU, with=
 alternating periods
> > > > > > > > + *   of CPU waiting for device, and device waiting on CPU.=
  This can result in
> > > > > > > > + *   devfreq and cpufreq seeing idle time in their respect=
ive domains and in
> > > > > > > > + *   result reduce frequency.
> > > > > > > > + *
> > > > > > > > + * * Workloads that interact with a periodic time based de=
adline, such as double
> > > > > > > > + *   buffered GPU rendering vs vblank sync'd page flipping=
.  In this scenario,
> > > > > > > > + *   missing a vblank deadline results in an *increase* in=
 idle time on the GPU
> > > > > > > > + *   (since it has to wait an additional vblank period), s=
ending a signal to
> > > > > > > > + *   the GPU's devfreq to reduce frequency, when in fact t=
he opposite is what is
> > > > > > > > + *   needed.
> > > > > > >
> > > > > > > This is the use case I'd like to get some better understandin=
g about how
> > > > > > > this series intends to work, as the problematic scheduling be=
havior
> > > > > > > triggered by missed deadlines has plagued compositing display=
 servers
> > > > > > > for a long time.
> > > > > > >
> > > > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL dr=
iver
> > > > > > > developer, so I will need some hand holding when it comes to
> > > > > > > understanding exactly what piece of software is responsible f=
or
> > > > > > > communicating what piece of information.
> > > > > > >
> > > > > > > > + *
> > > > > > > > + * To this end, deadline hint(s) can be set on a &dma_fenc=
e via &dma_fence_set_deadline.
> > > > > > > > + * The deadline hint provides a way for the waiting driver=
, or userspace, to
> > > > > > > > + * convey an appropriate sense of urgency to the signaling=
 driver.
> > > > > > > > + *
> > > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOT=
ONIC for userspace
> > > > > > > > + * facing APIs).  The time could either be some point in t=
he future (such as
> > > > > > > > + * the vblank based deadline for page-flipping, or the sta=
rt of a compositor's
> > > > > > > > + * composition cycle), or the current time to indicate an =
immediate deadline
> > > > > > > > + * hint (Ie. forward progress cannot be made until this fe=
nce is signaled).
> > > > > > >
> > > > > > > Is it guaranteed that a GPU driver will use the actual start =
of the
> > > > > > > vblank as the effective deadline? I have some memories of sei=
ng
> > > > > > > something about vblank evasion browsing driver code, which I =
might have
> > > > > > > misunderstood, but I have yet to find whether this is somethi=
ng
> > > > > > > userspace can actually expect to be something it can rely on.
> > > > > >
> > > > > > I guess you mean s/GPU driver/display driver/ ?  It makes thing=
s more
> > > > > > clear if we talk about them separately even if they happen to b=
e the
> > > > > > same device.
> > > > >
> > > > > Sure, sorry about being unclear about that.
> > > > >
> > > > > >
> > > > > > Assuming that is what you mean, nothing strongly defines what t=
he
> > > > > > deadline is.  In practice there is probably some buffering in t=
he
> > > > > > display controller.  For ex, block based (including bandwidth
> > > > > > compressed) formats, you need to buffer up a row of blocks to
> > > > > > efficiently linearize for scanout.  So you probably need to lat=
ch some
> > > > > > time before you start sending pixel data to the display.  But d=
etails
> > > > > > like this are heavily implementation dependent.  I think the mo=
st
> > > > > > reasonable thing to target is start of vblank.
> > > > >
> > > > > The driver exposing those details would be quite useful for users=
pace
> > > > > though, so that it can delay committing updates to late, but not =
too
> > > > > late. Setting a deadline to be the vblank seems easy enough, but =
it
> > > > > isn't enough for scheduling the actual commit.
> > > >
> > > > I'm not entirely sure how that would even work.. but OTOH I think y=
ou
> > > > are talking about something on the order of 100us?  But that is a b=
it
> > > > of another topic.
> > >
> > > Yes, something like that. But yea, it's not really related. Schedulin=
g
> > > commits closer to the deadline has more complex behavior than that to=
o,
> > > e.g. the need for real time scheduling, and knowing how long it usual=
ly
> > > takes to create and commit and for the kernel to process.
>
> Vblank can be really long, especially with VRR where the additional
> time you get to finish the frame comes from making vblank longer.
> Using the start of vblank as a deadline makes VRR useless. It really
> would be nice to have some feedback about the actual deadline from the
> kernel, maybe in `struct drm_event_vblank`.

note that here we are only talking about the difference between
start/end of vblank and the deadline for the hw to latch a change for
the next frame.  (Which I _expect_ generally amounts to however long
it takes to slurp in a row of tiles)

> But yes, sorry, off topic...
>
> > > >
> > >
> > > 8-< *snip* 8-<
> > >
> > > > > >
> > > > > > You need a fence to set the deadline, and for that work needs t=
o be
> > > > > > flushed.  But you can't associate a deadline with work that the=
 kernel
> > > > > > is unaware of anyways.
> > > > >
> > > > > That makes sense, but it might also a bit inadequate to have it a=
s the
> > > > > only way to tell the kernel it should speed things up. Even with =
the
> > > > > trick i915 does, with GNOME Shell, we still end up with the feedb=
ack
> > > > > loop this series aims to mitigate. Doing triple buffering, i.e. d=
elaying
> > > > > or dropping the first frame is so far the best work around that w=
orks,
> > > > > except doing other tricks that makes the kernel to ramp up its cl=
ock.
> > > > > Having to rely on choosing between latency and frame drops should
> > > > > ideally not have to be made.
> > > >
> > > > Before you have a fence, the thing you want to be speeding up is th=
e
> > > > CPU, not the GPU.  There are existing mechanisms for that.
> > >
> > > Is there no benefit to let the GPU know earlier that it should speed =
up,
> > > so that when the job queue arrives, it's already up to speed?
> >
> > Downstream we have input notifier that resumes the GPU so we can
> > pipeline the 1-2ms it takes to boot up the GPU with userspace.  But we
> > wait to boost freq until we have cmdstream to submit, since that
> > doesn't take as long.  What needs help initially after input is all
> > the stuff that happens on the CPU before the GPU can start to do
> > anything ;-)
> >
> > Btw, I guess I haven't made this clear, dma-fence deadline is trying
> > to help the steady-state situation, rather than the input-latency
> > situation.  It might take a frame or two of missed deadlines for
> > gpufreq to arrive at a good steady-state freq.
>
> The mutter issue also is about a suboptimal steady-state.
>
> Truth be told, I'm not sure if this fence deadline idea fixes the
> issue we're seeing or at least helps sometimes. It might, it might
> not. What annoys me is that the compositor *knows* before any work is
> submitted that some work will be submitted and when it has to finish.
> We could maximize the chances to get everything right but having to
> wait for a fence to materialize in the compositor to do anything about
> it is suboptimal.

Why would the app not immediately send the fence+buf to the compositor
as soon as it is submitted to the kernel on client process side?

At any rate, it really doesn't matter how early the kernel finds out
about the deadline, since the point is to let the kernel driver know
if it is missing the deadline so that it doesn't mis-interpret stall
time waiting for the _next_ vblank after the one we wanted.

> > > >
> > > > TBF I'm of the belief that there is still a need for input based cp=
u
> > > > boost (and early wake-up trigger for GPU).. we have something like
> > > > this in CrOS kernel.  That is a bit of a different topic, but my po=
int
> > > > is that fence deadlines are just one of several things we need to
> > > > optimize power/perf and responsiveness, rather than the single thin=
g
> > > > that solves every problem under the sun ;-)
> > >
> > > Perhaps; but I believe it's a bit of a back channel of intent; the pi=
ece
> > > of the puzzle that has the information to know whether there is need
> > > actually speed up is the compositor, not the kernel.
> > >
> > > For example, pressing 'p' while a terminal is focused does not need h=
igh
> > > frequency clocks, it just needs the terminal emulator to draw a 'p' a=
nd
> > > the compositor to composite that update. Pressing <Super> may however
> > > trigger a non-trivial animation moving a lot of stuff around on scree=
n,
> > > maybe triggering Wayland clients to draw and what not, and should mos=
t
> > > arguably have the ability to "warn" the kernel about the upcoming flo=
od
> > > of work before it is already knocking on its door step.
> >
> > The super key is problematic, but not for the reason you think.  It is
> > because it is a case where we should boost on key-up instead of
> > key-down.. and the second key-up event comes after the cpu-boost is
> > already in it's cool-down period.  But even if suboptimal in cases
> > like this, it is still useful for touch/stylus cases where the
> > slightest of lag is much more perceptible.
> >
> > This is getting off topic but I kinda favor coming up with some sort
> > of static definition that userspace could give the kernel to let the
> > kernel know what input to boost on.  Or maybe something could be done
> > with BPF?
>
> Why? Do you think user space is so slow that it can't process the
> input events and then do a syscall? We need to have all input devices
> open anyway that can affect the system and know more about how they
> affect behavior than the kernel can ever know.

Again this is getting off into a different topic.  But my gut feel is
that the shorter the path to input cpu freq boost, the better.. since
however many extra cycles you add, they will be cycles with cpu (and
probably ddr) at lowest freq

BR,
-R

> >
> > > >
> > >
> > > 8-< *snip* 8-<
> > >
> > > > >
> > > > > Is it expected that WSI's will set their own deadlines, or should=
 that
> > > > > be the job of the compositor? For example by using compositors us=
ing
> > > > > DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to se=
t a
> > > > > deadline matching the vsync it most ideally will be committed to?
> > > > >
> > > >
> > > > I'm kind of assuming compositors, but if the WSI somehow has more
> > > > information about ideal presentation time, then I suppose it could =
be
> > > > in the WSI?  I'll defer to folks who spend more time on WSI and
> > > > compositors to hash out the details ;-)
> > >
> > > With my compositor developer hat on, it might be best to let it be up=
 to
> > > the compositor, it's the one that knows if a client's content will
> > > actually end up anywhere visible.
> > >
> >
> > wfm
> >
> > BR,
> > -R
> >
> > >
> > > Jonas
> > >
> > > >
> > > > BR,
> > > > -R
> >
>
