Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFE38B4EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 19:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7426E423;
	Thu, 20 May 2021 17:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3546E41B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 17:08:25 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c3so17040389oic.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=19vRcmplLXN5rsKze776GJzl9Zc5ZlB+YGB7+ebjG1U=;
 b=LdWbG1JohbVo0PpbgUBgm0nknB5Jrgz9zGJYezv2szJC/EWjMxqIOEYlDUZbtgaYXp
 U1TX5owkIXMWUT41mKmhgieYXtfFjwnzrpKAiqDZKQLL5il2F3suoKpQ89wR6wUeHQMx
 ed3wW4Z/PH9MvBKspeA5P70T/RwodhoujLsLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=19vRcmplLXN5rsKze776GJzl9Zc5ZlB+YGB7+ebjG1U=;
 b=s+tvahW6AQeM7WyeOr32H/u724yMdzSxIaqOZfrleI7wXcr+Y2q2q8Yw01sa3nfJyV
 ThQKHqXK3Fr5A1ErFh48mGE/imKplJZpFII5K5DPIelZcMoxl+laMSW2/s4X0CrMni93
 m4gwOkMpLuxUptDMdmo53vrIUIyegfiv7SzVVoi1293162YF4K5ATfA4PPxp4Fk7cD4f
 DnE7scNN+bhd2QDsAEl4yMmqcZjyaSEGAKJ4E9B8sSn6v1OEwRZHOrM6hE3Lk9hT75Cz
 rxZVLfVyRKFbI7B5CERkJT8s7xAJfao2bnCuxkXd0O0KG2W1oeyYVXgob+IxYbXZKIK3
 Jh8w==
X-Gm-Message-State: AOAM5327gyDCAfWqJmgSUYeiunZTq0Xtrj+SD5P7YUSl4NybsmMv7TVz
 XL66GAco12w/t5C4baKC6QREsi+G/NQvQ2ll6prlOmX28YtdMg==
X-Google-Smtp-Source: ABdhPJxFOX5qzESyK/Qlnhl0yO++z8yh0BXFjwg0t/1L8tVO0VOZCnP7yjmCBKWgN8hCRULLZYh74RTBvvvz+tw6RP8=
X-Received: by 2002:a54:4809:: with SMTP id j9mr3993051oij.14.1621530504649;
 Thu, 20 May 2021 10:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
 <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
 <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
In-Reply-To: <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 May 2021 19:08:13 +0200
Message-ID: <CAKMK7uHROqWzTaG-JDzd343WJJiJCbzEOCZ++oCmKrQJAQgo7A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 6:41 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.21 um 18:34 schrieb Daniel Vetter:
> > On Thu, May 20, 2021 at 06:01:39PM +0200, Christian K=C3=B6nig wrote:
> >> Am 20.05.21 um 16:54 schrieb Rob Clark:
> >>> On Thu, May 20, 2021 at 7:11 AM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> Am 20.05.21 um 16:07 schrieb Rob Clark:
> >>>>> On Wed, May 19, 2021 at 11:47 PM Christian K=C3=B6nig
> >>>>> <christian.koenig@amd.com> wrote:
> >>>>>> Uff, that looks very hardware specific to me.
> >>>>> Howso?  I'm not sure I agree.. and even if it was not useful for so=
me
> >>>>> hw, it should be useful for enough drivers (and harm no drivers), s=
o I
> >>>>> still think it is a good idea
> >>>>>
> >>>>> The fallback plan is to go the i915 route and stop using atomic
> >>>>> helpers and do the same thing inside the driver, but that doesn't h=
elp
> >>>>> any of the cases where you have a separate kms and gpu driver.
> >>>> Yeah, that's certainly not something we want.
> >>>>
> >>>>>> As far as I can see you can also implement completely inside the b=
ackend
> >>>>>> by starting a timer on enable_signaling, don't you?
> >>>>> Not really.. I mean, the fact that something waited on a fence coul=
d
> >>>>> be a useful input signal to gpu freq governor, but it is entirely
> >>>>> insufficient..
> >>>>>
> >>>>> If the cpu is spending a lot of time waiting on a fence, cpufreq wi=
ll
> >>>>> clock down so you spend less time waiting.  And no problem has been
> >>>>> solved.  You absolutely need the concept of a missed deadline, and =
a
> >>>>> timer doesn't give you that.
> >>>> Ok then I probably don't understand the use case here.
> >>>>
> >>>> What exactly do you try to solve?
> >>> Basically situations where you are ping-ponging between GPU and CPU..
> >>> for example if you are double buffering instead of triple buffering,
> >>> and doing vblank sync'd pageflips.  The GPU, without any extra signal=
,
> >>> could get stuck at 30fps and a low gpu freq, because it ends up idle
> >>> while waiting for an extra vblank cycle for the next back-buffer to
> >>> become available.  Whereas if it boosted up to a higher freq and
> >>> stopped missing a vblank deadline, it would be less idle due to
> >>> getting the next back-buffer sooner (due to not missing a vblank
> >>> deadline).
> >> Ok the is the why, but what about the how?
> >>
> >> How does it help to have this boost callback and not just start a time=
 on
> >> enable signaling and stop it when the signal arrives?
> > Because the render side (or drm/scheduler, if msm would use that) has n=
o
> > idea for which vblank a rendering actually is for.
>
> AH! So we are basically telling the fence backend that we have just
> missed an event we waited for.
>
> So what we want to know is how long the frontend wanted to wait instead
> of how long the backend took for rendering.

tbh I'm not sure the timestamp matters at all. What we do in i915 is
boost quite aggressively, and then let the usual clock tuning wittle
it down if we overshot. Plus soom cool-down to prevent
abuse/continuous boosting. I think we also differentiate between
display boost and userspace waits.

On the display side we also wait until the vblank has passed we aimed
for (atm always the next, we don't have target_frame support like
amdgpu), to avoid boosting when there's no point.

> > So boosting right when you've missed your frame (not what Rob implement=
s
> > currently, but fixable) is the right semantics.
> >
> > The other issue is that for cpu waits, we want to differentiate from fe=
nce
> > waits that userspace does intentially (e.g. wait ioctl) and waits that
> > random other things are doing within the kernel to keep track of progre=
ss.
> >
> > For the former we know that userspace is stuck waiting for the gpu, and=
 we
> > probably want to boost. For the latter we most definitely do _not_ want=
 to
> > boost.
> >
> > Otoh I do agree with you that the current api is a bit awkward, so perh=
aps
> > we do need a dma_fence_userspace_wait wrapper which boosts automaticall=
y
> > after a bit. And similarly perhaps a drm_vblank_dma_fence_wait, where y=
ou
> > give it a vblank target, and if the fence isn't signalled by then, we k=
ick
> > it real hard.
>
> Yeah, something like an use case driven API would be nice to have.
>
> For this particular case I suggest that we somehow extend the enable
> signaling callback.
>
> > But otherwise yes this is absolutely a thing that matters a ton. If you
> > look at Matt Brost's scheduler rfc, there's also a line item in there
> > about adding this kind of boosting to drm/scheduler.
>
> BTW: I still can't see this in my inbox.

You've replied already:

https://lore.kernel.org/dri-devel/20210518235830.133834-1-matthew.brost@int=
el.com/

It's just the big picture plan of what areas we're all trying to
tackle with some why, so that everyone knows what's coming in the next
half year at least. Probably longer until this is all sorted. I think
Matt has some poc hacked-up pile, but nothing really to show.
-Daniel

> Do you have a link?
>
> Christian.
>
> > -Daniel
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
> >>>
> >>>> Thanks,
> >>>> Christian.
> >>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>>> Christian.
> >>>>>>
> >>>>>> Am 19.05.21 um 20:38 schrieb Rob Clark:
> >>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>
> >>>>>>> Add a way to hint to the fence signaler that a fence waiter has m=
issed a
> >>>>>>> deadline waiting on the fence.
> >>>>>>>
> >>>>>>> In some cases, missing a vblank can result in lower gpu utilizati=
on,
> >>>>>>> when really we want to go in the opposite direction and boost gpu=
 freq.
> >>>>>>> The boost callback gives some feedback to the fence signaler that=
 we
> >>>>>>> are missing deadlines, so it can take this into account in it's f=
req/
> >>>>>>> utilization calculations.
> >>>>>>>
> >>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>> ---
> >>>>>>>      include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> >>>>>>>      1 file changed, 26 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.=
h
> >>>>>>> index 9f12efaaa93a..172702521acc 100644
> >>>>>>> --- a/include/linux/dma-fence.h
> >>>>>>> +++ b/include/linux/dma-fence.h
> >>>>>>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
> >>>>>>>          signed long (*wait)(struct dma_fence *fence,
> >>>>>>>                              bool intr, signed long timeout);
> >>>>>>>
> >>>>>>> +     /**
> >>>>>>> +      * @boost:
> >>>>>>> +      *
> >>>>>>> +      * Optional callback, to indicate that a fence waiter misse=
d a deadline.
> >>>>>>> +      * This can serve as a signal that (if possible) whatever s=
ignals the
> >>>>>>> +      * fence should boost it's clocks.
> >>>>>>> +      *
> >>>>>>> +      * This can be called in any context that can call dma_fenc=
e_wait().
> >>>>>>> +      */
> >>>>>>> +     void (*boost)(struct dma_fence *fence);
> >>>>>>> +
> >>>>>>>          /**
> >>>>>>>           * @release:
> >>>>>>>           *
> >>>>>>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(str=
uct dma_fence *fence, bool intr)
> >>>>>>>          return ret < 0 ? ret : 0;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +/**
> >>>>>>> + * dma_fence_boost - hint from waiter that it missed a deadline
> >>>>>>> + *
> >>>>>>> + * @fence: the fence that caused the missed deadline
> >>>>>>> + *
> >>>>>>> + * This function gives a hint from a fence waiter that a deadlin=
e was
> >>>>>>> + * missed, so that the fence signaler can factor this in to devi=
ce
> >>>>>>> + * power state decisions
> >>>>>>> + */
> >>>>>>> +static inline void dma_fence_boost(struct dma_fence *fence)
> >>>>>>> +{
> >>>>>>> +     if (fence->ops->boost)
> >>>>>>> +             fence->ops->boost(fence);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>      struct dma_fence *dma_fence_get_stub(void);
> >>>>>>>      u64 dma_fence_context_alloc(unsigned num);
> >>>>>>>
> >>> _______________________________________________
> >>> Linaro-mm-sig mailing list
> >>> Linaro-mm-sig@lists.linaro.org
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=3D04%7C01%7Cc=
hristian.koenig%40amd.com%7C69c1843a93ec4888abd308d91bad18bd%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637571252548030247%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DEJBA9rVl5xTRmdEPzyCyGX7xyZMKAGVhTmoEnsPfOxw%3D&amp;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
