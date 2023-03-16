Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406876BD593
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34D610ED65;
	Thu, 16 Mar 2023 16:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E1C10E0E9;
 Thu, 16 Mar 2023 16:29:08 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so1272926otm.11; 
 Thu, 16 Mar 2023 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678984147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vs3zfnYLiPrlyQpAWkqpXhNbQS3/J4YFuAxSGCahd48=;
 b=ikNRzbRoiKTgXyd+o2RLa29YkJb2JOn/v6YIm0chMHa6jMtz7Aukxr3sDnZHlDLCPg
 4D/22vj4EbWjYs2AIrlL21s+qmtcJrK2g0S0A9e8PiBm5W7d712LL6r2UFxgKnvXl/gm
 ktxn0TCtFmHN3n6/5Rqp3eY/tP+45cwvCQbEr4LKfIVc3NzHlCvpaRgPl1GjprXJngVK
 o/OzzczyZa0RYUhKwpPTamHjLGz0bzvRvfBPOcY80aDA3S86p0xzu2KL68NJou9/9dV3
 ledWYpzzPxEcC0LxkcP1aiyD5wyrscSI78/RWFrs6d2i7fFM8PEv3ajniZ3O3cfTJDJ4
 JOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678984147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vs3zfnYLiPrlyQpAWkqpXhNbQS3/J4YFuAxSGCahd48=;
 b=PYRF4I6b5/OuJc0tc1bN5uHFQhq9P0Y954t4Cd7swTA0iJ6XbptiqTZ0lYHcOl4unH
 xgse1IOjtBacjUUfXuN70uWziBSShUwRfZTakrH+fkpfjM+rx2ySRcKzAPy7ECM5+Jg+
 U9TXQiXY7KtTSBYHf8BQtyQ/eS/Xrgfgv++TKU3NhsjhRHfmT0hDYQKibVgnzG8je+ZC
 M0dcsr/8IFfBhg43bTvC64D9rGpGFBVRJMFBRSc86/dVH9HJ1B6jiiA9L20TxizXFRVw
 adrxjOMvULWE7KmDEPGtP/1mMLnX9iHuxJg0eMxVHtIfARSpgH2CU7Je17hcsFrXIdOS
 yKTw==
X-Gm-Message-State: AO0yUKXBkIsywhRCdEw6Ix1VTOT9w/4mDuB5k4isT78GDp8E9UDgVP3S
 iGriM9h4SLGwHcMgUV8NR8m6ophRc64zT1lrSLI=
X-Google-Smtp-Source: AK7set9IcfdpvBN64YteomtwjOCFpqzUVfHueXm0TYhNaIV/bcuG5vBYfN2vscoS0EyM3rGNZE/9BSodjB6pzEb8/aE=
X-Received: by 2002:a9d:4b8f:0:b0:696:f275:a60d with SMTP id
 k15-20020a9d4b8f000000b00696f275a60dmr3396308otf.7.1678984147388; Thu, 16 Mar
 2023 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
In-Reply-To: <ZBLg0t0tTVvuPuiJ@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Mar 2023 09:28:55 -0700
Message-ID: <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
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

On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.com>=
 wrote:
>
> On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote:
> > >
> > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jadahl@gm=
ail.com> wrote:
> > > > >
> > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Add a way to hint to the fence signaler of an upcoming deadline=
, such as
> > > > > > vblank, which the fence waiter would prefer not to miss.  This =
is to aid
> > > > > > the fence signaler in making power management decisions, like b=
oosting
> > > > > > frequency as the deadline approaches and awareness of missing d=
eadlines
> > > > > > so that can be factored in to the frequency scaling.
> > > > > >
> > > > > > v2: Drop dma_fence::deadline and related logic to filter duplic=
ate
> > > > > >     deadlines, to avoid increasing dma_fence size.  The fence-c=
ontext
> > > > > >     implementation will need similar logic to track deadlines o=
f all
> > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > v6: More docs
> > > > > > v7: Fix typo, clarify past deadlines
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > ---
> > > > >
> > > > > Hi Rob!
> > > > >
> > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++=
++++++++
> > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > >  3 files changed, 87 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentati=
on/driver-api/dma-buf.rst
> > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > >     :doc: fence signalling annotation
> > > > > >
> > > > > > +DMA Fence Deadline Hints
> > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > +
> > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > +   :doc: deadline hints
> > > > > > +
> > > > > >  DMA Fences Functions Reference
> > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-=
fence.c
> > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fenc=
e **fences, uint32_t count,
> > > > > >  }
> > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > >
> > > > > > +/**
> > > > > > + * DOC: deadline hints
> > > > > > + *
> > > > > > + * In an ideal world, it would be possible to pipeline a workl=
oad sufficiently
> > > > > > + * that a utilization based device frequency governor could ar=
rive at a minimum
> > > > > > + * frequency that meets the requirements of the use-case, in o=
rder to minimize
> > > > > > + * power consumption.  But in the real world there are many wo=
rkloads which
> > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > + *
> > > > > > + * * Workloads that ping-pong between device and CPU, with alt=
ernating periods
> > > > > > + *   of CPU waiting for device, and device waiting on CPU.  Th=
is can result in
> > > > > > + *   devfreq and cpufreq seeing idle time in their respective =
domains and in
> > > > > > + *   result reduce frequency.
> > > > > > + *
> > > > > > + * * Workloads that interact with a periodic time based deadli=
ne, such as double
> > > > > > + *   buffered GPU rendering vs vblank sync'd page flipping.  I=
n this scenario,
> > > > > > + *   missing a vblank deadline results in an *increase* in idl=
e time on the GPU
> > > > > > + *   (since it has to wait an additional vblank period), sendi=
ng a signal to
> > > > > > + *   the GPU's devfreq to reduce frequency, when in fact the o=
pposite is what is
> > > > > > + *   needed.
> > > > >
> > > > > This is the use case I'd like to get some better understanding ab=
out how
> > > > > this series intends to work, as the problematic scheduling behavi=
or
> > > > > triggered by missed deadlines has plagued compositing display ser=
vers
> > > > > for a long time.
> > > > >
> > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL driver
> > > > > developer, so I will need some hand holding when it comes to
> > > > > understanding exactly what piece of software is responsible for
> > > > > communicating what piece of information.
> > > > >
> > > > > > + *
> > > > > > + * To this end, deadline hint(s) can be set on a &dma_fence vi=
a &dma_fence_set_deadline.
> > > > > > + * The deadline hint provides a way for the waiting driver, or=
 userspace, to
> > > > > > + * convey an appropriate sense of urgency to the signaling dri=
ver.
> > > > > > + *
> > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC=
 for userspace
> > > > > > + * facing APIs).  The time could either be some point in the f=
uture (such as
> > > > > > + * the vblank based deadline for page-flipping, or the start o=
f a compositor's
> > > > > > + * composition cycle), or the current time to indicate an imme=
diate deadline
> > > > > > + * hint (Ie. forward progress cannot be made until this fence =
is signaled).
> > > > >
> > > > > Is it guaranteed that a GPU driver will use the actual start of t=
he
> > > > > vblank as the effective deadline? I have some memories of seing
> > > > > something about vblank evasion browsing driver code, which I migh=
t have
> > > > > misunderstood, but I have yet to find whether this is something
> > > > > userspace can actually expect to be something it can rely on.
> > > >
> > > > I guess you mean s/GPU driver/display driver/ ?  It makes things mo=
re
> > > > clear if we talk about them separately even if they happen to be th=
e
> > > > same device.
> > >
> > > Sure, sorry about being unclear about that.
> > >
> > > >
> > > > Assuming that is what you mean, nothing strongly defines what the
> > > > deadline is.  In practice there is probably some buffering in the
> > > > display controller.  For ex, block based (including bandwidth
> > > > compressed) formats, you need to buffer up a row of blocks to
> > > > efficiently linearize for scanout.  So you probably need to latch s=
ome
> > > > time before you start sending pixel data to the display.  But detai=
ls
> > > > like this are heavily implementation dependent.  I think the most
> > > > reasonable thing to target is start of vblank.
> > >
> > > The driver exposing those details would be quite useful for userspace
> > > though, so that it can delay committing updates to late, but not too
> > > late. Setting a deadline to be the vblank seems easy enough, but it
> > > isn't enough for scheduling the actual commit.
> >
> > I'm not entirely sure how that would even work.. but OTOH I think you
> > are talking about something on the order of 100us?  But that is a bit
> > of another topic.
>
> Yes, something like that. But yea, it's not really related. Scheduling
> commits closer to the deadline has more complex behavior than that too,
> e.g. the need for real time scheduling, and knowing how long it usually
> takes to create and commit and for the kernel to process.
>
> >
>
> 8-< *snip* 8-<
>
> > > >
> > > > You need a fence to set the deadline, and for that work needs to be
> > > > flushed.  But you can't associate a deadline with work that the ker=
nel
> > > > is unaware of anyways.
> > >
> > > That makes sense, but it might also a bit inadequate to have it as th=
e
> > > only way to tell the kernel it should speed things up. Even with the
> > > trick i915 does, with GNOME Shell, we still end up with the feedback
> > > loop this series aims to mitigate. Doing triple buffering, i.e. delay=
ing
> > > or dropping the first frame is so far the best work around that works=
,
> > > except doing other tricks that makes the kernel to ramp up its clock.
> > > Having to rely on choosing between latency and frame drops should
> > > ideally not have to be made.
> >
> > Before you have a fence, the thing you want to be speeding up is the
> > CPU, not the GPU.  There are existing mechanisms for that.
>
> Is there no benefit to let the GPU know earlier that it should speed up,
> so that when the job queue arrives, it's already up to speed?

Downstream we have input notifier that resumes the GPU so we can
pipeline the 1-2ms it takes to boot up the GPU with userspace.  But we
wait to boost freq until we have cmdstream to submit, since that
doesn't take as long.  What needs help initially after input is all
the stuff that happens on the CPU before the GPU can start to do
anything ;-)

Btw, I guess I haven't made this clear, dma-fence deadline is trying
to help the steady-state situation, rather than the input-latency
situation.  It might take a frame or two of missed deadlines for
gpufreq to arrive at a good steady-state freq.

> >
> > TBF I'm of the belief that there is still a need for input based cpu
> > boost (and early wake-up trigger for GPU).. we have something like
> > this in CrOS kernel.  That is a bit of a different topic, but my point
> > is that fence deadlines are just one of several things we need to
> > optimize power/perf and responsiveness, rather than the single thing
> > that solves every problem under the sun ;-)
>
> Perhaps; but I believe it's a bit of a back channel of intent; the piece
> of the puzzle that has the information to know whether there is need
> actually speed up is the compositor, not the kernel.
>
> For example, pressing 'p' while a terminal is focused does not need high
> frequency clocks, it just needs the terminal emulator to draw a 'p' and
> the compositor to composite that update. Pressing <Super> may however
> trigger a non-trivial animation moving a lot of stuff around on screen,
> maybe triggering Wayland clients to draw and what not, and should most
> arguably have the ability to "warn" the kernel about the upcoming flood
> of work before it is already knocking on its door step.

The super key is problematic, but not for the reason you think.  It is
because it is a case where we should boost on key-up instead of
key-down.. and the second key-up event comes after the cpu-boost is
already in it's cool-down period.  But even if suboptimal in cases
like this, it is still useful for touch/stylus cases where the
slightest of lag is much more perceptible.

This is getting off topic but I kinda favor coming up with some sort
of static definition that userspace could give the kernel to let the
kernel know what input to boost on.  Or maybe something could be done
with BPF?

> >
>
> 8-< *snip* 8-<
>
> > >
> > > Is it expected that WSI's will set their own deadlines, or should tha=
t
> > > be the job of the compositor? For example by using compositors using
> > > DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to set a
> > > deadline matching the vsync it most ideally will be committed to?
> > >
> >
> > I'm kind of assuming compositors, but if the WSI somehow has more
> > information about ideal presentation time, then I suppose it could be
> > in the WSI?  I'll defer to folks who spend more time on WSI and
> > compositors to hash out the details ;-)
>
> With my compositor developer hat on, it might be best to let it be up to
> the compositor, it's the one that knows if a client's content will
> actually end up anywhere visible.
>

wfm

BR,
-R

>
> Jonas
>
> >
> > BR,
> > -R
