Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A743B3DA757
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14756EDBF;
	Thu, 29 Jul 2021 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AAA6EDBF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:19:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h14so7374749wrx.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CjnIYfzbrAsq4/rt2odciYbsieuyUeldlw/sTc3eAWs=;
 b=Qv8NihFSFwZlUCIDc4aQrB90kXagzvpZHjMA7l5e1aNizhH+DMhfrjptm4Us9dDcie
 COI2r+vVVtxI4cvtrMs9GsoUhwnVOc0v0D9sguXdggnXmZpuzykxAa+dA+YrAIojSiAE
 8/cd9JUdVjyO/zjjpv90YcuHFb+JMMW9gSq7mXH0jklyU1S0ecWUGFaKq5qWtZQoPA3h
 gkofWS/r17J60vfaJo5bzrYj2Km3z92++Lw8hVwtrUIgcV8MocX6g+8qhHfZIzPuuRUk
 q/m2AkPuycqIThvZiWxQ4MCZi/khZO1vWFJBUUYZNrw+JLeumxjlN1t6cckGZdZad9ls
 zK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CjnIYfzbrAsq4/rt2odciYbsieuyUeldlw/sTc3eAWs=;
 b=kr9KcbOHjOPCIw6zmy9yclTBGxJTc8Z/RWSPss3qGY2XPdFSwj43iA9KLLwNbZEqK+
 KDWrnNw8Ihf8WyUwpRmz3Q3hvMEvb185Ca2PIG5yrlD/v1O800Zjldke2f0/WIM4lkZ0
 H6vIcR/jeogEBqDaDzryAnu0fGt+l+K6FCwqDaUXLUaYt8950l8timGNK45ci126EIr3
 IDyVS8ZQxn7R0GuckIddt1GvbDN0+lHFBR7BtCUrQgfd/Hf8KkVdNZ0/UHoBiQ4rqVOo
 UmGIcI3Zy5nUqJxtjMPgR6mgzdDOk9dmxMRuodkC8rGKHbWKPfoP7AeWOIlFvhAOpj8R
 4MpQ==
X-Gm-Message-State: AOAM531nRvrqdpCz4jPtZyEZrOY8AX3gM8R6XDzSPM/ygcU3vGiqM2nc
 O3gj15EOcLn83orpn7z1dcXjxxl6QjmyW7MrviU=
X-Google-Smtp-Source: ABdhPJzY5RuoqLtDnABekm+oWYb2oEO0QWuLRjgrUZqqx7YUuQxE7P5z+21Up2hzZxa12v2i2OhVhO4X9aB2Xd+YGk4=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr5426783wrn.147.1627571959809; 
 Thu, 29 Jul 2021 08:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <20210726233854.2453899-2-robdclark@gmail.com>
 <50b181fe-6605-b7ac-36a6-8bcda2930e6f@gmail.com>
 <CAF6AEGuNxi_aeYE37FT3a-atCUWgepxs-9EwxMfpiMaU7wgqdQ@mail.gmail.com>
 <9edd7083-e6b3-b230-c273-8f2fbe76ca17@amd.com>
 <703dc9c3-5657-432e-ca0b-25bdd67a2abd@gmail.com>
 <CAF6AEGvSpvc2po93b2eKB2cSzx_a+BtPWhQgRs-1NFFZfUbJNw@mail.gmail.com>
 <e5e71356-1c58-04ac-2609-70d268941b8d@amd.com>
 <CAF6AEGu3NMyRp1pC5iZQoHhKhu_xBFBqkkfbG36dx8bVzYdWMA@mail.gmail.com>
 <YQJSxEVUkZmfL5Cb@phenom.ffwll.local>
In-Reply-To: <YQJSxEVUkZmfL5Cb@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 08:23:28 -0700
Message-ID: <CAF6AEGswVQx3Vtm=Oab3CsQw1fE-yf9y2_MB2wdx_e14FLNwXQ@mail.gmail.com>
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, 
 Rob Clark <robdclark@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, 
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 12:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 28, 2021 at 10:58:51AM -0700, Rob Clark wrote:
> > On Wed, Jul 28, 2021 at 10:23 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> > >
> > >
> > >
> > > Am 28.07.21 um 17:15 schrieb Rob Clark:
> > > > On Wed, Jul 28, 2021 at 4:37 AM Christian K=C3=B6nig
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >> Am 28.07.21 um 09:03 schrieb Christian K=C3=B6nig:
> > > >>> Am 27.07.21 um 16:25 schrieb Rob Clark:
> > > >>>> On Tue, Jul 27, 2021 at 12:11 AM Christian K=C3=B6nig
> > > >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > > >>>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
> > > >>>>>> From: Rob Clark <robdclark@chromium.org>
> > > >>>>>>
> > > >>>>>> Add a way to hint to the fence signaler of an upcoming deadlin=
e,
> > > >>>>>> such as
> > > >>>>>> vblank, which the fence waiter would prefer not to miss. This =
is to
> > > >>>>>> aid
> > > >>>>>> the fence signaler in making power management decisions, like =
boosting
> > > >>>>>> frequency as the deadline approaches and awareness of missing
> > > >>>>>> deadlines
> > > >>>>>> so that can be factored in to the frequency scaling.
> > > >>>>>>
> > > >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > >>>>>> ---
> > > >>>>>>     drivers/dma-buf/dma-fence.c | 39
> > > >>>>>> +++++++++++++++++++++++++++++++++++++
> > > >>>>>>     include/linux/dma-fence.h   | 17 ++++++++++++++++
> > > >>>>>>     2 files changed, 56 insertions(+)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma=
-fence.c
> > > >>>>>> index ce0f5eff575d..2e0d25ab457e 100644
> > > >>>>>> --- a/drivers/dma-buf/dma-fence.c
> > > >>>>>> +++ b/drivers/dma-buf/dma-fence.c
> > > >>>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fen=
ce
> > > >>>>>> **fences, uint32_t count,
> > > >>>>>>     }
> > > >>>>>>     EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > >>>>>>
> > > >>>>>> +
> > > >>>>>> +/**
> > > >>>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
> > > >>>>>> + * @fence:    the fence that is to be waited on
> > > >>>>>> + * @deadline: the time by which the waiter hopes for the fenc=
e to be
> > > >>>>>> + *            signaled
> > > >>>>>> + *
> > > >>>>>> + * Inform the fence signaler of an upcoming deadline, such as
> > > >>>>>> vblank, by
> > > >>>>>> + * which point the waiter would prefer the fence to be signal=
ed
> > > >>>>>> by.  This
> > > >>>>>> + * is intended to give feedback to the fence signaler to aid =
in power
> > > >>>>>> + * management decisions, such as boosting GPU frequency if a =
periodic
> > > >>>>>> + * vblank deadline is approaching.
> > > >>>>>> + */
> > > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> > > >>>>>> deadline)
> > > >>>>>> +{
> > > >>>>>> +     unsigned long flags;
> > > >>>>>> +
> > > >>>>>> +     if (dma_fence_is_signaled(fence))
> > > >>>>>> +             return;
> > > >>>>>> +
> > > >>>>>> +     spin_lock_irqsave(fence->lock, flags);
> > > >>>>>> +
> > > >>>>>> +     /* If we already have an earlier deadline, keep it: */
> > > >>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->fl=
ags) &&
> > > >>>>>> +         ktime_before(fence->deadline, deadline)) {
> > > >>>>>> +             spin_unlock_irqrestore(fence->lock, flags);
> > > >>>>>> +             return;
> > > >>>>>> +     }
> > > >>>>>> +
> > > >>>>>> +     fence->deadline =3D deadline;
> > > >>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
> > > >>>>>> +
> > > >>>>>> +     spin_unlock_irqrestore(fence->lock, flags);
> > > >>>>>> +
> > > >>>>>> +     if (fence->ops->set_deadline)
> > > >>>>>> +             fence->ops->set_deadline(fence, deadline);
> > > >>>>>> +}
> > > >>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> > > >>>>>> +
> > > >>>>>>     /**
> > > >>>>>>      * dma_fence_init - Initialize a custom fence.
> > > >>>>>>      * @fence: the fence to initialize
> > > >>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fen=
ce.h
> > > >>>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> > > >>>>>> --- a/include/linux/dma-fence.h
> > > >>>>>> +++ b/include/linux/dma-fence.h
> > > >>>>>> @@ -88,6 +88,7 @@ struct dma_fence {
> > > >>>>>>                 /* @timestamp replaced by @rcu on
> > > >>>>>> dma_fence_release() */
> > > >>>>>>                 struct rcu_head rcu;
> > > >>>>>>         };
> > > >>>>>> +     ktime_t deadline;
> > > >>>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitating a=
dding
> > > >>>>> the
> > > >>>>> deadline as extra field here.
> > > >>>>>
> > > >>>>> We tuned the dma_fence structure intentionally so that it is on=
ly 64
> > > >>>>> bytes.
> > > >>>> Hmm, then I guess you wouldn't be a fan of also adding an hrtime=
r?
> > > >>>>
> > > >>>> We could push the ktime_t (and timer) down into the derived fenc=
e
> > > >>>> class, but I think there is going to need to be some extra stora=
ge
> > > >>>> *somewhere*.. maybe the fence signaler could get away with just
> > > >>>> storing the nearest upcoming deadline per fence-context instead?
> > > >>> I would just push that into the driver instead.
> > > >>>
> > > >>> You most likely don't want the deadline per fence anyway in compl=
ex
> > > >>> scenarios, but rather per frame. And a frame is usually composed =
from
> > > >>> multiple fences.
> > > > Right, I ended up keeping track of the nearest deadline in patch 5/=
4
> > > > which added drm/msm support:
> > > >
> > > >    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fpatchwork.freedesktop.org%2Fpatch%2F447138%2F&amp;data=3D04%7C01%7Cchri=
stian.koenig%40amd.com%7Cce6ace85263d448bbc9f08d951d9f06c%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637630819606427306%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s=
data=3DameszAOlClaZNeUDlYr37ZdIytVXNgiEUKuctjXLqZ0%3D&amp;reserved=3D0
> > > >
> > > > But if we do have the ktime_t in dma_fence in dma_fence, we can add
> > > > some checks and avoid calling back to the driver if a later deadlin=
e
> > > > is set on a fence that already has an earlier deadline.  OTOH I
> > > > suppose I can push all that back to the driver to start, and we can
> > > > revisit once we have more drivers implementing deadline support.
> > >
> > > I still think that all of this is rather specific to your use case an=
d
> > > have strong doubt that anybody else will implement that.
> >
> > i915 does already have a similar thing in it's hand-rolled atomic
> > commit path.  So I think msm won't be the only one.  It should be also
> > useful to the other mobile GPUs with a gpu vs kms driver split,
> > although looking at the other gpu devfreq implementations, I don't
> > think they've yet gotten to this point in the fine tuning..
>
> Yeah I have a dream that maybe i915 will use the atomic commit helpers, I
> originally wrote them with i915 in mind :-) even had patches!
>
> I also think we'll need this eventually in other areas, Android also has
> some hacks like this to make sure idle->first touch doesn't suck and
> similar things.

input-boost is another thing I have on my roadmap.. part of the solution is=
:

    commit 9bc95570175a7fbca29d86d22c54bbf399f4ad5a
    Author:     Rob Clark <robdclark@chromium.org>
    AuthorDate: Mon Jul 26 07:46:50 2021 -0700
    Commit:     Rob Clark <robdclark@chromium.org>
    CommitDate: Tue Jul 27 17:54:36 2021 -0700

        drm/msm: Devfreq tuning

which gives the freq a bit of a nudge if the GPU has been idle for
longer than a certain threshold.

But the other part is that if the GPU has been idle for more than 66ms
(typical autosuspend delay for adreno) it will suspend.  For modern
adreno's it takes ~2ms to "boot up" the GPU from suspend.  Which is
something you want to take out of the submit/execbuf path if you are
trying to reduce input-to-pageflip latency.

We have a downstream patch that boosts the CPUs on input events (with
a cooldown period to prevent spacebar-heater) and I have been thinking
of something along those lines to trigger resuming the GPU.. it is
straightforward enough for touch based devices, but gets more
complicated with keyboard input.  In particular, some keys you want to
trigger boost on key-release.  Ie. modifier keys (ctrl/shift/alt/etc..
the "search" key on chromebooks, etc) you want to boost on
key-release, not on key-press because unless you type *really* fast
you'll be in the cooldown period when the key-release event happens.
Unfortunately the kernel doesn't really know this "policy" sort of
information about which keys should boost on press vs release.  So I
think the long-term/upstream solution is to do input-boost in
userspace.. sysfs already has all the knobs that a userspace
input-boost daemon would need to twiddle, so no real need for this to
be in the kernel.  I guess the only drawback is the sysfs knobs are a
bit less standardized on the "desktop GPUs" which don't use devfreq.

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > >> Thinking more about it we could probably kill the spinlock pointer=
 and
> > > >> make the flags 32bit if we absolutely need that here.
> > > > If we had a 'struct dma_fence_context' we could push the spinlock, =
ops
> > > > pointer, and u64 context into that and replace with a single
> > > > dma_fence_context ptr, fwiw
> > >
> > > That won't work. We have a lot of use cases where you can't allocate
> > > memory, but must allocate a context.
> > >
> > > Christian.
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >> But I still don't see the need for that, especially since most dri=
vers
> > > >> probably won't implement it.
> > > >>
> > > >> Regards,
> > > >> Christian.
> > > >>
> > > >>> Regards,
> > > >>> Christian.
> > > >>>
> > > >>>> BR,
> > > >>>> -R
> > > >>>>
> > > >>>>> Regards,
> > > >>>>> Christian.
> > > >>>>>
> > > >>>>>>         u64 context;
> > > >>>>>>         u64 seqno;
> > > >>>>>>         unsigned long flags;
> > > >>>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> > > >>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
> > > >>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > > >>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > > >>>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > >>>>>>         DMA_FENCE_FLAG_USER_BITS, /* must always be last membe=
r */
> > > >>>>>>     };
> > > >>>>>>
> > > >>>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
> > > >>>>>>          */
> > > >>>>>>         void (*timeline_value_str)(struct dma_fence *fence,
> > > >>>>>>                                    char *str, int size);
> > > >>>>>> +
> > > >>>>>> +     /**
> > > >>>>>> +      * @set_deadline:
> > > >>>>>> +      *
> > > >>>>>> +      * Callback to allow a fence waiter to inform the fence
> > > >>>>>> signaler of an
> > > >>>>>> +      * upcoming deadline, such as vblank, by which point the
> > > >>>>>> waiter would
> > > >>>>>> +      * prefer the fence to be signaled by.  This is intended=
 to
> > > >>>>>> give feedback
> > > >>>>>> +      * to the fence signaler to aid in power management
> > > >>>>>> decisions, such as
> > > >>>>>> +      * boosting GPU frequency.
> > > >>>>>> +      *
> > > >>>>>> +      * This callback is optional.
> > > >>>>>> +      */
> > > >>>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_t de=
adline);
> > > >>>>>>     };
> > > >>>>>>
> > > >>>>>>     void dma_fence_init(struct dma_fence *fence, const struct
> > > >>>>>> dma_fence_ops *ops,
> > > >>>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(s=
truct
> > > >>>>>> dma_fence *fence, bool intr)
> > > >>>>>>         return ret < 0 ? ret : 0;
> > > >>>>>>     }
> > > >>>>>>
> > > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t
> > > >>>>>> deadline);
> > > >>>>>> +
> > > >>>>>>     struct dma_fence *dma_fence_get_stub(void);
> > > >>>>>>     struct dma_fence *dma_fence_allocate_private_stub(void);
> > > >>>>>>     u64 dma_fence_context_alloc(unsigned num);
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
