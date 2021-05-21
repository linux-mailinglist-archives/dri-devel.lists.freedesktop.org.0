Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B838C91C
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 16:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CCC892E0;
	Fri, 21 May 2021 14:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B018916B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 14:21:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x7so1650450wrt.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=wG9Dta0CaSLcShWSym55/bpGe6Fxr6HiM0MjsqM0GpA=;
 b=RDX2hdnIo6f3DUh4nJ1K97BcaNQN8gpv0wjGqd3ja+QqP0Y9yzrTT2zz1IMk/Biyxm
 x3Fwn1AO/sbgoy1cP2EoklOMdwh1IPMjOc3SeVCUUvEbftCzeBbec7peNNbL0p78q5q9
 K8eXGg7lsqV7FacR6TtJQzQiV1Vi1VOKJc9BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=wG9Dta0CaSLcShWSym55/bpGe6Fxr6HiM0MjsqM0GpA=;
 b=WEpVYWqBxAd/Frw8qKaN2JJdKBcjsbOKvkQrR30YLMTc0snPNgwYyJGKqTfSQNYNy3
 2GJIOHDfBHx/4Qeybv7KDX1Yow6qIGBQP6EX8cmmepvVKQ9ENuNj+CjmeeLsoNDN7zO8
 f+Nay2E1vUdMe37CQLV3baaTOH+mb8EIRm8map57K8elB3fZrw+J3YBn47m1hCtAZY/O
 SERANSGPCPymI6bUGzWsslKWDhhTS+8aIL96DtAbO/Jx5ETRE1d3yrw3c6pqFeAHP97t
 Qm7BCnQcWv/urARaYJJANsr2hUta/dLsWyxt32gXClWzmJgMNJwRKfvkU+T807o285GQ
 lXoA==
X-Gm-Message-State: AOAM533Ad+VSsHC9pPqMZfAW0LpJeWrLbosFCNf33vZJTFmx3SotdlOV
 spT9ZSHJAQzS5j9gadDD3MggNQ==
X-Google-Smtp-Source: ABdhPJy4RupA0RXG/bNF7PD78NvJ0QKf6Vd2VyhKKxTlhoDXSliYWWTxh9uksBg5g2Gs/DhKchOnWw==
X-Received: by 2002:a5d:5257:: with SMTP id k23mr9894401wrc.328.1621606870495; 
 Fri, 21 May 2021 07:21:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q62sm6358399wma.42.2021.05.21.07.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 07:21:09 -0700 (PDT)
Date: Fri, 21 May 2021 16:21:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
Message-ID: <YKfB06kpmrb56etU@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
 <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
 <4244879a-e2b8-7994-e3fb-f63c0e115a2c@amd.com>
 <CAKMK7uHROqWzTaG-JDzd343WJJiJCbzEOCZ++oCmKrQJAQgo7A@mail.gmail.com>
 <17f7e755-fce2-b7cf-dd6f-0a0dec618bba@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17f7e755-fce2-b7cf-dd6f-0a0dec618bba@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 09:43:59AM +0200, Christian König wrote:
> Am 20.05.21 um 19:08 schrieb Daniel Vetter:
> > [SNIP]
> > > AH! So we are basically telling the fence backend that we have just
> > > missed an event we waited for.
> > > 
> > > So what we want to know is how long the frontend wanted to wait instead
> > > of how long the backend took for rendering.
> > tbh I'm not sure the timestamp matters at all. What we do in i915 is
> > boost quite aggressively, and then let the usual clock tuning wittle
> > it down if we overshot. Plus soom cool-down to prevent
> > abuse/continuous boosting. I think we also differentiate between
> > display boost and userspace waits.
> 
> I was not thinking about time stamps here, but more like which information
> we need at which place.
> 
> > On the display side we also wait until the vblank has passed we aimed
> > for (atm always the next, we don't have target_frame support like
> > amdgpu), to avoid boosting when there's no point.
> > 
> > > > So boosting right when you've missed your frame (not what Rob implements
> > > > currently, but fixable) is the right semantics.
> > > > 
> > > > The other issue is that for cpu waits, we want to differentiate from fence
> > > > waits that userspace does intentially (e.g. wait ioctl) and waits that
> > > > random other things are doing within the kernel to keep track of progress.
> > > > 
> > > > For the former we know that userspace is stuck waiting for the gpu, and we
> > > > probably want to boost. For the latter we most definitely do _not_ want to
> > > > boost.
> > > > 
> > > > Otoh I do agree with you that the current api is a bit awkward, so perhaps
> > > > we do need a dma_fence_userspace_wait wrapper which boosts automatically
> > > > after a bit. And similarly perhaps a drm_vblank_dma_fence_wait, where you
> > > > give it a vblank target, and if the fence isn't signalled by then, we kick
> > > > it real hard.
> > > Yeah, something like an use case driven API would be nice to have.
> > > 
> > > For this particular case I suggest that we somehow extend the enable
> > > signaling callback.
> > > 
> > > > But otherwise yes this is absolutely a thing that matters a ton. If you
> > > > look at Matt Brost's scheduler rfc, there's also a line item in there
> > > > about adding this kind of boosting to drm/scheduler.
> > > BTW: I still can't see this in my inbox.
> > You've replied already:
> > 
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210518235830.133834-1-matthew.brost%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce4f3688b832842c4236e08d91bb1e148%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571273080820910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=uk3Gs%2FW42BDqMuMJtujcAH5GvN8mOlDnmywK8x1I%2F0k%3D&amp;reserved=0
> 
> Yeah, but doesn't that also require some changes to the DRM scheduler?
> 
> I was expecting that this is a bit more than just two patches.

It's just the rfc document, per the new rfc process:

https://dri.freedesktop.org/docs/drm/gpu/rfc/

It's rather obviously not any piece of code in there, but just meant to
check rough direction before we go rewrite the entire i915 execbuf
frontend.
-Daniel

> 
> Christian.
> 
> > 
> > It's just the big picture plan of what areas we're all trying to
> > tackle with some why, so that everyone knows what's coming in the next
> > half year at least. Probably longer until this is all sorted. I think
> > Matt has some poc hacked-up pile, but nothing really to show.
> > -Daniel
> > 
> > > Do you have a link?
> > > 
> > > Christian.
> > > 
> > > > -Daniel
> > > > 
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > BR,
> > > > > > -R
> > > > > > 
> > > > > > > Thanks,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > > BR,
> > > > > > > > -R
> > > > > > > > 
> > > > > > > > > Christian.
> > > > > > > > > 
> > > > > > > > > Am 19.05.21 um 20:38 schrieb Rob Clark:
> > > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > > 
> > > > > > > > > > Add a way to hint to the fence signaler that a fence waiter has missed a
> > > > > > > > > > deadline waiting on the fence.
> > > > > > > > > > 
> > > > > > > > > > In some cases, missing a vblank can result in lower gpu utilization,
> > > > > > > > > > when really we want to go in the opposite direction and boost gpu freq.
> > > > > > > > > > The boost callback gives some feedback to the fence signaler that we
> > > > > > > > > > are missing deadlines, so it can take this into account in it's freq/
> > > > > > > > > > utilization calculations.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > > ---
> > > > > > > > > >       include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> > > > > > > > > >       1 file changed, 26 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > > > > > > > index 9f12efaaa93a..172702521acc 100644
> > > > > > > > > > --- a/include/linux/dma-fence.h
> > > > > > > > > > +++ b/include/linux/dma-fence.h
> > > > > > > > > > @@ -231,6 +231,17 @@ struct dma_fence_ops {
> > > > > > > > > >           signed long (*wait)(struct dma_fence *fence,
> > > > > > > > > >                               bool intr, signed long timeout);
> > > > > > > > > > 
> > > > > > > > > > +     /**
> > > > > > > > > > +      * @boost:
> > > > > > > > > > +      *
> > > > > > > > > > +      * Optional callback, to indicate that a fence waiter missed a deadline.
> > > > > > > > > > +      * This can serve as a signal that (if possible) whatever signals the
> > > > > > > > > > +      * fence should boost it's clocks.
> > > > > > > > > > +      *
> > > > > > > > > > +      * This can be called in any context that can call dma_fence_wait().
> > > > > > > > > > +      */
> > > > > > > > > > +     void (*boost)(struct dma_fence *fence);
> > > > > > > > > > +
> > > > > > > > > >           /**
> > > > > > > > > >            * @release:
> > > > > > > > > >            *
> > > > > > > > > > @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
> > > > > > > > > >           return ret < 0 ? ret : 0;
> > > > > > > > > >       }
> > > > > > > > > > 
> > > > > > > > > > +/**
> > > > > > > > > > + * dma_fence_boost - hint from waiter that it missed a deadline
> > > > > > > > > > + *
> > > > > > > > > > + * @fence: the fence that caused the missed deadline
> > > > > > > > > > + *
> > > > > > > > > > + * This function gives a hint from a fence waiter that a deadline was
> > > > > > > > > > + * missed, so that the fence signaler can factor this in to device
> > > > > > > > > > + * power state decisions
> > > > > > > > > > + */
> > > > > > > > > > +static inline void dma_fence_boost(struct dma_fence *fence)
> > > > > > > > > > +{
> > > > > > > > > > +     if (fence->ops->boost)
> > > > > > > > > > +             fence->ops->boost(fence);
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > >       struct dma_fence *dma_fence_get_stub(void);
> > > > > > > > > >       u64 dma_fence_context_alloc(unsigned num);
> > > > > > > > > > 
> > > > > > _______________________________________________
> > > > > > Linaro-mm-sig mailing list
> > > > > > Linaro-mm-sig@lists.linaro.org
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.linaro.org%2Fmailman%2Flistinfo%2Flinaro-mm-sig&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce4f3688b832842c4236e08d91bb1e148%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571273080820910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=lOOKD4J4h7byys2ifx0Ibn5vVr9gwZGGGsgrNmaymc4%3D&amp;reserved=0
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
