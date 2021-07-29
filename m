Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF023DAA1B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47686EE18;
	Thu, 29 Jul 2021 17:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10486EE18
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 17:27:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so1896347wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Bn+cPu5IgvR7pIamKA5mLhVnf1yh6hiT4eICk8HZr0=;
 b=Aj4au+2Cx2smuXGJtUyolayfAnSBXZrXPPKMbxPjzANbYSbUSrtdDLiGr6MzFqNZM/
 NAP+2Wm0FCQjqLsmZKu2WV1QFajMEWCuExDj7jRZM8pCA+6DW2IkvEbEU8GthPMQvwT+
 SS1VlxS2j9JiWS1eU5V2r/P/xvVGI3kKHPKLrS94cG2ZyT3GMpXmv0fxiTLqTIMlc2tR
 yJTxfsR8bezNAHChQvPRpUciRY1J6iHNj26ARHZ2KvzJ2QxhbZeQfBA6LXso8w9De+Bx
 +99cJ7+C91NIYgZ223UuCoYKrxBbjsit068ZpD0/IXKiEm8cjPeYP/tEdFaekpU7lQk0
 0ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Bn+cPu5IgvR7pIamKA5mLhVnf1yh6hiT4eICk8HZr0=;
 b=guMakR9SFzPGak8yWpkOeOY6wFSarRgHm8ZZ+XqFauhYCXg0ItFYypiOE5RJmVdtub
 gjjTX9Mg7JWytJjTWBGRMeq9DACJI//ShMsGkF6pNPNRKfyAPm9nCFOvDAr+UIVZDMUq
 V6ltaiirePzGM0fujJreql1ou/wUCFZIOdBOYU8iYqllYVgSaJknZVCRpm+7Ze3D4MYm
 8t5sknUhGArISq/U5jwBtYPWJV6TSquXOQG79+zU5RtLJx3gjo6RHAh1Bzu32/TUmnOX
 e905gtW6Apd+7E0Ldwz2+SOmyYilQaQOOTmQx6i7OpQhEskpe6jMrRJLgrOkvFmEuuWP
 YqFA==
X-Gm-Message-State: AOAM532MJpVgB1XFWmxWrkfJPwWid17G3t2q3z1QHCcHqoMdJecTZMeE
 ZR60w0apOCBg3s6g98AeTLukzqz1oOP/+hxObkQ=
X-Google-Smtp-Source: ABdhPJwsrQ2cq2G18NekGlXa+mURpKvg8ERic3HlrF9fg4I071Fi1jDxOYZ04QeGMA1+77I735b4fYhTMmKdbju5I08=
X-Received: by 2002:a05:600c:19cb:: with SMTP id
 u11mr5869006wmq.175.1627579676269; 
 Thu, 29 Jul 2021 10:27:56 -0700 (PDT)
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
 <CAF6AEGswVQx3Vtm=Oab3CsQw1fE-yf9y2_MB2wdx_e14FLNwXQ@mail.gmail.com>
 <CAKMK7uHjtiL9TzfMMKaKWMRx=-p_ZUg07wSp9djz7gwwUjn=zw@mail.gmail.com>
In-Reply-To: <CAKMK7uHjtiL9TzfMMKaKWMRx=-p_ZUg07wSp9djz7gwwUjn=zw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 10:32:05 -0700
Message-ID: <CAF6AEGuQsJ5Npi4_t=qme0j_a-=03qge6ZbRMiQS5ZRWyP7JBQ@mail.gmail.com>
Subject: Re: [RFC 1/4] dma-fence: Add deadline awareness
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 9:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jul 29, 2021 at 5:19 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Jul 29, 2021 at 12:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Wed, Jul 28, 2021 at 10:58:51AM -0700, Rob Clark wrote:
> > > > On Wed, Jul 28, 2021 at 10:23 AM Christian K=C3=B6nig
> > > > <christian.koenig@amd.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Am 28.07.21 um 17:15 schrieb Rob Clark:
> > > > > > On Wed, Jul 28, 2021 at 4:37 AM Christian K=C3=B6nig
> > > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > >> Am 28.07.21 um 09:03 schrieb Christian K=C3=B6nig:
> > > > > >>> Am 27.07.21 um 16:25 schrieb Rob Clark:
> > > > > >>>> On Tue, Jul 27, 2021 at 12:11 AM Christian K=C3=B6nig
> > > > > >>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > >>>>> Am 27.07.21 um 01:38 schrieb Rob Clark:
> > > > > >>>>>> From: Rob Clark <robdclark@chromium.org>
> > > > > >>>>>>
> > > > > >>>>>> Add a way to hint to the fence signaler of an upcoming dea=
dline,
> > > > > >>>>>> such as
> > > > > >>>>>> vblank, which the fence waiter would prefer not to miss. T=
his is to
> > > > > >>>>>> aid
> > > > > >>>>>> the fence signaler in making power management decisions, l=
ike boosting
> > > > > >>>>>> frequency as the deadline approaches and awareness of miss=
ing
> > > > > >>>>>> deadlines
> > > > > >>>>>> so that can be factored in to the frequency scaling.
> > > > > >>>>>>
> > > > > >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > >>>>>> ---
> > > > > >>>>>>     drivers/dma-buf/dma-fence.c | 39
> > > > > >>>>>> +++++++++++++++++++++++++++++++++++++
> > > > > >>>>>>     include/linux/dma-fence.h   | 17 ++++++++++++++++
> > > > > >>>>>>     2 files changed, 56 insertions(+)
> > > > > >>>>>>
> > > > > >>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf=
/dma-fence.c
> > > > > >>>>>> index ce0f5eff575d..2e0d25ab457e 100644
> > > > > >>>>>> --- a/drivers/dma-buf/dma-fence.c
> > > > > >>>>>> +++ b/drivers/dma-buf/dma-fence.c
> > > > > >>>>>> @@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma=
_fence
> > > > > >>>>>> **fences, uint32_t count,
> > > > > >>>>>>     }
> > > > > >>>>>>     EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > >>>>>>
> > > > > >>>>>> +
> > > > > >>>>>> +/**
> > > > > >>>>>> + * dma_fence_set_deadline - set desired fence-wait deadli=
ne
> > > > > >>>>>> + * @fence:    the fence that is to be waited on
> > > > > >>>>>> + * @deadline: the time by which the waiter hopes for the =
fence to be
> > > > > >>>>>> + *            signaled
> > > > > >>>>>> + *
> > > > > >>>>>> + * Inform the fence signaler of an upcoming deadline, suc=
h as
> > > > > >>>>>> vblank, by
> > > > > >>>>>> + * which point the waiter would prefer the fence to be si=
gnaled
> > > > > >>>>>> by.  This
> > > > > >>>>>> + * is intended to give feedback to the fence signaler to =
aid in power
> > > > > >>>>>> + * management decisions, such as boosting GPU frequency i=
f a periodic
> > > > > >>>>>> + * vblank deadline is approaching.
> > > > > >>>>>> + */
> > > > > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktim=
e_t
> > > > > >>>>>> deadline)
> > > > > >>>>>> +{
> > > > > >>>>>> +     unsigned long flags;
> > > > > >>>>>> +
> > > > > >>>>>> +     if (dma_fence_is_signaled(fence))
> > > > > >>>>>> +             return;
> > > > > >>>>>> +
> > > > > >>>>>> +     spin_lock_irqsave(fence->lock, flags);
> > > > > >>>>>> +
> > > > > >>>>>> +     /* If we already have an earlier deadline, keep it: =
*/
> > > > > >>>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence=
->flags) &&
> > > > > >>>>>> +         ktime_before(fence->deadline, deadline)) {
> > > > > >>>>>> +             spin_unlock_irqrestore(fence->lock, flags);
> > > > > >>>>>> +             return;
> > > > > >>>>>> +     }
> > > > > >>>>>> +
> > > > > >>>>>> +     fence->deadline =3D deadline;
> > > > > >>>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->fla=
gs);
> > > > > >>>>>> +
> > > > > >>>>>> +     spin_unlock_irqrestore(fence->lock, flags);
> > > > > >>>>>> +
> > > > > >>>>>> +     if (fence->ops->set_deadline)
> > > > > >>>>>> +             fence->ops->set_deadline(fence, deadline);
> > > > > >>>>>> +}
> > > > > >>>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> > > > > >>>>>> +
> > > > > >>>>>>     /**
> > > > > >>>>>>      * dma_fence_init - Initialize a custom fence.
> > > > > >>>>>>      * @fence: the fence to initialize
> > > > > >>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma=
-fence.h
> > > > > >>>>>> index 6ffb4b2c6371..4e6cfe4e6fbc 100644
> > > > > >>>>>> --- a/include/linux/dma-fence.h
> > > > > >>>>>> +++ b/include/linux/dma-fence.h
> > > > > >>>>>> @@ -88,6 +88,7 @@ struct dma_fence {
> > > > > >>>>>>                 /* @timestamp replaced by @rcu on
> > > > > >>>>>> dma_fence_release() */
> > > > > >>>>>>                 struct rcu_head rcu;
> > > > > >>>>>>         };
> > > > > >>>>>> +     ktime_t deadline;
> > > > > >>>>> Mhm, adding the flag sounds ok to me but I'm a bit hesitati=
ng adding
> > > > > >>>>> the
> > > > > >>>>> deadline as extra field here.
> > > > > >>>>>
> > > > > >>>>> We tuned the dma_fence structure intentionally so that it i=
s only 64
> > > > > >>>>> bytes.
> > > > > >>>> Hmm, then I guess you wouldn't be a fan of also adding an hr=
timer?
> > > > > >>>>
> > > > > >>>> We could push the ktime_t (and timer) down into the derived =
fence
> > > > > >>>> class, but I think there is going to need to be some extra s=
torage
> > > > > >>>> *somewhere*.. maybe the fence signaler could get away with j=
ust
> > > > > >>>> storing the nearest upcoming deadline per fence-context inst=
ead?
> > > > > >>> I would just push that into the driver instead.
> > > > > >>>
> > > > > >>> You most likely don't want the deadline per fence anyway in c=
omplex
> > > > > >>> scenarios, but rather per frame. And a frame is usually compo=
sed from
> > > > > >>> multiple fences.
> > > > > > Right, I ended up keeping track of the nearest deadline in patc=
h 5/4
> > > > > > which added drm/msm support:
> > > > > >
> > > > > >    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F447138%2F&amp;data=3D04%7C01%7C=
christian.koenig%40amd.com%7Cce6ace85263d448bbc9f08d951d9f06c%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637630819606427306%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a=
mp;sdata=3DameszAOlClaZNeUDlYr37ZdIytVXNgiEUKuctjXLqZ0%3D&amp;reserved=3D0
> > > > > >
> > > > > > But if we do have the ktime_t in dma_fence in dma_fence, we can=
 add
> > > > > > some checks and avoid calling back to the driver if a later dea=
dline
> > > > > > is set on a fence that already has an earlier deadline.  OTOH I
> > > > > > suppose I can push all that back to the driver to start, and we=
 can
> > > > > > revisit once we have more drivers implementing deadline support=
.
> > > > >
> > > > > I still think that all of this is rather specific to your use cas=
e and
> > > > > have strong doubt that anybody else will implement that.
> > > >
> > > > i915 does already have a similar thing in it's hand-rolled atomic
> > > > commit path.  So I think msm won't be the only one.  It should be a=
lso
> > > > useful to the other mobile GPUs with a gpu vs kms driver split,
> > > > although looking at the other gpu devfreq implementations, I don't
> > > > think they've yet gotten to this point in the fine tuning..
> > >
> > > Yeah I have a dream that maybe i915 will use the atomic commit helper=
s, I
> > > originally wrote them with i915 in mind :-) even had patches!
> > >
> > > I also think we'll need this eventually in other areas, Android also =
has
> > > some hacks like this to make sure idle->first touch doesn't suck and
> > > similar things.
> >
> > input-boost is another thing I have on my roadmap.. part of the solutio=
n is:
> >
> >     commit 9bc95570175a7fbca29d86d22c54bbf399f4ad5a
> >     Author:     Rob Clark <robdclark@chromium.org>
> >     AuthorDate: Mon Jul 26 07:46:50 2021 -0700
> >     Commit:     Rob Clark <robdclark@chromium.org>
> >     CommitDate: Tue Jul 27 17:54:36 2021 -0700
> >
> >         drm/msm: Devfreq tuning
> >
> > which gives the freq a bit of a nudge if the GPU has been idle for
> > longer than a certain threshold.
> >
> > But the other part is that if the GPU has been idle for more than 66ms
> > (typical autosuspend delay for adreno) it will suspend.  For modern
> > adreno's it takes ~2ms to "boot up" the GPU from suspend.  Which is
> > something you want to take out of the submit/execbuf path if you are
> > trying to reduce input-to-pageflip latency.
> >
> > We have a downstream patch that boosts the CPUs on input events (with
> > a cooldown period to prevent spacebar-heater) and I have been thinking
> > of something along those lines to trigger resuming the GPU.. it is
> > straightforward enough for touch based devices, but gets more
> > complicated with keyboard input.  In particular, some keys you want to
> > trigger boost on key-release.  Ie. modifier keys (ctrl/shift/alt/etc..
> > the "search" key on chromebooks, etc) you want to boost on
> > key-release, not on key-press because unless you type *really* fast
> > you'll be in the cooldown period when the key-release event happens.
> > Unfortunately the kernel doesn't really know this "policy" sort of
> > information about which keys should boost on press vs release.  So I
> > think the long-term/upstream solution is to do input-boost in
> > userspace.. sysfs already has all the knobs that a userspace
> > input-boost daemon would need to twiddle, so no real need for this to
> > be in the kernel.  I guess the only drawback is the sysfs knobs are a
> > bit less standardized on the "desktop GPUs" which don't use devfreq.
>
> I think we could do a standard interface for this, either on the drm
> owner/master or somewhere in sysfs. Essentially "I expect to use the
> gpu for the very next frame, get it going". Across all hw there's a
> lot of things we can do. I think abuse is pretty easy to prevent with
> a cooldown or similar.

The userspace input-boost ends up needing to be either part of the
compositor, or a privileged process, in order to sniff input events..
so I don't think the kernel needs to try to prevent abuse here (but
the userspace part defn wants a cooldown period)

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > >> Thinking more about it we could probably kill the spinlock poi=
nter and
> > > > > >> make the flags 32bit if we absolutely need that here.
> > > > > > If we had a 'struct dma_fence_context' we could push the spinlo=
ck, ops
> > > > > > pointer, and u64 context into that and replace with a single
> > > > > > dma_fence_context ptr, fwiw
> > > > >
> > > > > That won't work. We have a lot of use cases where you can't alloc=
ate
> > > > > memory, but must allocate a context.
> > > > >
> > > > > Christian.
> > > > >
> > > > > >
> > > > > > BR,
> > > > > > -R
> > > > > >
> > > > > >> But I still don't see the need for that, especially since most=
 drivers
> > > > > >> probably won't implement it.
> > > > > >>
> > > > > >> Regards,
> > > > > >> Christian.
> > > > > >>
> > > > > >>> Regards,
> > > > > >>> Christian.
> > > > > >>>
> > > > > >>>> BR,
> > > > > >>>> -R
> > > > > >>>>
> > > > > >>>>> Regards,
> > > > > >>>>> Christian.
> > > > > >>>>>
> > > > > >>>>>>         u64 context;
> > > > > >>>>>>         u64 seqno;
> > > > > >>>>>>         unsigned long flags;
> > > > > >>>>>> @@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
> > > > > >>>>>>         DMA_FENCE_FLAG_SIGNALED_BIT,
> > > > > >>>>>>         DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > > > > >>>>>>         DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > > > > >>>>>> +     DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > > > >>>>>>         DMA_FENCE_FLAG_USER_BITS, /* must always be last m=
ember */
> > > > > >>>>>>     };
> > > > > >>>>>>
> > > > > >>>>>> @@ -261,6 +263,19 @@ struct dma_fence_ops {
> > > > > >>>>>>          */
> > > > > >>>>>>         void (*timeline_value_str)(struct dma_fence *fence=
,
> > > > > >>>>>>                                    char *str, int size);
> > > > > >>>>>> +
> > > > > >>>>>> +     /**
> > > > > >>>>>> +      * @set_deadline:
> > > > > >>>>>> +      *
> > > > > >>>>>> +      * Callback to allow a fence waiter to inform the fe=
nce
> > > > > >>>>>> signaler of an
> > > > > >>>>>> +      * upcoming deadline, such as vblank, by which point=
 the
> > > > > >>>>>> waiter would
> > > > > >>>>>> +      * prefer the fence to be signaled by.  This is inte=
nded to
> > > > > >>>>>> give feedback
> > > > > >>>>>> +      * to the fence signaler to aid in power management
> > > > > >>>>>> decisions, such as
> > > > > >>>>>> +      * boosting GPU frequency.
> > > > > >>>>>> +      *
> > > > > >>>>>> +      * This callback is optional.
> > > > > >>>>>> +      */
> > > > > >>>>>> +     void (*set_deadline)(struct dma_fence *fence, ktime_=
t deadline);
> > > > > >>>>>>     };
> > > > > >>>>>>
> > > > > >>>>>>     void dma_fence_init(struct dma_fence *fence, const str=
uct
> > > > > >>>>>> dma_fence_ops *ops,
> > > > > >>>>>> @@ -586,6 +601,8 @@ static inline signed long dma_fence_wa=
it(struct
> > > > > >>>>>> dma_fence *fence, bool intr)
> > > > > >>>>>>         return ret < 0 ? ret : 0;
> > > > > >>>>>>     }
> > > > > >>>>>>
> > > > > >>>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktim=
e_t
> > > > > >>>>>> deadline);
> > > > > >>>>>> +
> > > > > >>>>>>     struct dma_fence *dma_fence_get_stub(void);
> > > > > >>>>>>     struct dma_fence *dma_fence_allocate_private_stub(void=
);
> > > > > >>>>>>     u64 dma_fence_context_alloc(unsigned num);
> > > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
