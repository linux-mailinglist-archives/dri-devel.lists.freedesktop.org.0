Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF538B453
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 18:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E836F4B2;
	Thu, 20 May 2021 16:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8416F4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 16:34:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so5606577wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 09:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=D/fC8cTjvNjAco9GQ5lMElWjnvmZVnjTOXVPAX+OC80=;
 b=lRzdwUQiyIC72DgMTpYMkcuSlY2LeVVmwy5VuSyIpEFfSZQBnUFZ/DKzZfZ6wMKKCG
 NJMBGuj3d1KUSHYEZiOzTA7Tvy5FDEyCQuscm8+sx+9IyWekNZtWU7ZFv4O5r0pwXUtH
 6fkJVOTCkOfp8POTQB+R9D5UTTjRbP+gB7sZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=D/fC8cTjvNjAco9GQ5lMElWjnvmZVnjTOXVPAX+OC80=;
 b=twX88snqKV17cgj+Xw18TYFzdtIgIhPusDYZOL2M8N+pgsU+9ap6qbB39xp5OStReW
 u3vxEGyqLKoYBu6IVj6DVY4fSWjoBsZETRDtR4C+3F+zIDmMIER2m4+modFB4GwFOn1N
 AWM2ZZliGqdLqsIZTtw/L6JMoHvWJDyDGDSNTYbIRmQ2VkU+iFHrPzMMgrCY5XXk5WCJ
 PkLa5hMl+qGIhtj8VSOrKs5C+kjH9Y7zsRUqRP66gJu/rqaDJ/RaWh63WbUGfoR79SUC
 V/69s3RE9S8/9OEnHpp0QDVawGAd2eaI+r+R9PtNVoMztYd4U/TYdOMBd1zA5Nz0N+bC
 KWjw==
X-Gm-Message-State: AOAM5310BG5XKCZ4j0Ke5PdK9A91UQGP0XOI35ddkXYz0mH41A5HL4KW
 4OGWOudN9x1A2KyvgQZFyW5CZA==
X-Google-Smtp-Source: ABdhPJyhdMR3oFuRjaw5S9reOQX95e2IfiwqzbyiREbxH7yL0pX59nNF5rh34EwG77dVF6QQ6945+A==
X-Received: by 2002:a1c:5449:: with SMTP id p9mr5017481wmi.61.1621528449691;
 Thu, 20 May 2021 09:34:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g206sm9800386wme.16.2021.05.20.09.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:34:09 -0700 (PDT)
Date: Thu, 20 May 2021 18:34:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] [RFC 1/3] dma-fence: Add boost fence op
Message-ID: <YKaPf3VLfjoZJRw7@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Rob Clark <robdclark@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
 <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
 <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8f3d71c-7025-deab-4dd7-14f3fa6a8810@gmail.com>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 06:01:39PM +0200, Christian König wrote:
> Am 20.05.21 um 16:54 schrieb Rob Clark:
> > On Thu, May 20, 2021 at 7:11 AM Christian König
> > <christian.koenig@amd.com> wrote:
> > > 
> > > 
> > > Am 20.05.21 um 16:07 schrieb Rob Clark:
> > > > On Wed, May 19, 2021 at 11:47 PM Christian König
> > > > <christian.koenig@amd.com> wrote:
> > > > > Uff, that looks very hardware specific to me.
> > > > Howso?  I'm not sure I agree.. and even if it was not useful for some
> > > > hw, it should be useful for enough drivers (and harm no drivers), so I
> > > > still think it is a good idea
> > > > 
> > > > The fallback plan is to go the i915 route and stop using atomic
> > > > helpers and do the same thing inside the driver, but that doesn't help
> > > > any of the cases where you have a separate kms and gpu driver.
> > > Yeah, that's certainly not something we want.
> > > 
> > > > > As far as I can see you can also implement completely inside the backend
> > > > > by starting a timer on enable_signaling, don't you?
> > > > Not really.. I mean, the fact that something waited on a fence could
> > > > be a useful input signal to gpu freq governor, but it is entirely
> > > > insufficient..
> > > > 
> > > > If the cpu is spending a lot of time waiting on a fence, cpufreq will
> > > > clock down so you spend less time waiting.  And no problem has been
> > > > solved.  You absolutely need the concept of a missed deadline, and a
> > > > timer doesn't give you that.
> > > Ok then I probably don't understand the use case here.
> > > 
> > > What exactly do you try to solve?
> > Basically situations where you are ping-ponging between GPU and CPU..
> > for example if you are double buffering instead of triple buffering,
> > and doing vblank sync'd pageflips.  The GPU, without any extra signal,
> > could get stuck at 30fps and a low gpu freq, because it ends up idle
> > while waiting for an extra vblank cycle for the next back-buffer to
> > become available.  Whereas if it boosted up to a higher freq and
> > stopped missing a vblank deadline, it would be less idle due to
> > getting the next back-buffer sooner (due to not missing a vblank
> > deadline).
> 
> Ok the is the why, but what about the how?
> 
> How does it help to have this boost callback and not just start a time on
> enable signaling and stop it when the signal arrives?

Because the render side (or drm/scheduler, if msm would use that) has no
idea for which vblank a rendering actually is for.

So boosting right when you've missed your frame (not what Rob implements
currently, but fixable) is the right semantics.

The other issue is that for cpu waits, we want to differentiate from fence
waits that userspace does intentially (e.g. wait ioctl) and waits that
random other things are doing within the kernel to keep track of progress.

For the former we know that userspace is stuck waiting for the gpu, and we
probably want to boost. For the latter we most definitely do _not_ want to
boost.

Otoh I do agree with you that the current api is a bit awkward, so perhaps
we do need a dma_fence_userspace_wait wrapper which boosts automatically
after a bit. And similarly perhaps a drm_vblank_dma_fence_wait, where you
give it a vblank target, and if the fence isn't signalled by then, we kick
it real hard.

But otherwise yes this is absolutely a thing that matters a ton. If you
look at Matt Brost's scheduler rfc, there's also a line item in there
about adding this kind of boosting to drm/scheduler.
-Daniel


> 
> Regards,
> Christian.
> 
> > 
> > BR,
> > -R
> > 
> > > Thanks,
> > > Christian.
> > > 
> > > > BR,
> > > > -R
> > > > 
> > > > > Christian.
> > > > > 
> > > > > Am 19.05.21 um 20:38 schrieb Rob Clark:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > 
> > > > > > Add a way to hint to the fence signaler that a fence waiter has missed a
> > > > > > deadline waiting on the fence.
> > > > > > 
> > > > > > In some cases, missing a vblank can result in lower gpu utilization,
> > > > > > when really we want to go in the opposite direction and boost gpu freq.
> > > > > > The boost callback gives some feedback to the fence signaler that we
> > > > > > are missing deadlines, so it can take this into account in it's freq/
> > > > > > utilization calculations.
> > > > > > 
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >     include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> > > > > >     1 file changed, 26 insertions(+)
> > > > > > 
> > > > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > > > index 9f12efaaa93a..172702521acc 100644
> > > > > > --- a/include/linux/dma-fence.h
> > > > > > +++ b/include/linux/dma-fence.h
> > > > > > @@ -231,6 +231,17 @@ struct dma_fence_ops {
> > > > > >         signed long (*wait)(struct dma_fence *fence,
> > > > > >                             bool intr, signed long timeout);
> > > > > > 
> > > > > > +     /**
> > > > > > +      * @boost:
> > > > > > +      *
> > > > > > +      * Optional callback, to indicate that a fence waiter missed a deadline.
> > > > > > +      * This can serve as a signal that (if possible) whatever signals the
> > > > > > +      * fence should boost it's clocks.
> > > > > > +      *
> > > > > > +      * This can be called in any context that can call dma_fence_wait().
> > > > > > +      */
> > > > > > +     void (*boost)(struct dma_fence *fence);
> > > > > > +
> > > > > >         /**
> > > > > >          * @release:
> > > > > >          *
> > > > > > @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
> > > > > >         return ret < 0 ? ret : 0;
> > > > > >     }
> > > > > > 
> > > > > > +/**
> > > > > > + * dma_fence_boost - hint from waiter that it missed a deadline
> > > > > > + *
> > > > > > + * @fence: the fence that caused the missed deadline
> > > > > > + *
> > > > > > + * This function gives a hint from a fence waiter that a deadline was
> > > > > > + * missed, so that the fence signaler can factor this in to device
> > > > > > + * power state decisions
> > > > > > + */
> > > > > > +static inline void dma_fence_boost(struct dma_fence *fence)
> > > > > > +{
> > > > > > +     if (fence->ops->boost)
> > > > > > +             fence->ops->boost(fence);
> > > > > > +}
> > > > > > +
> > > > > >     struct dma_fence *dma_fence_get_stub(void);
> > > > > >     u64 dma_fence_context_alloc(unsigned num);
> > > > > > 
> > _______________________________________________
> > Linaro-mm-sig mailing list
> > Linaro-mm-sig@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
