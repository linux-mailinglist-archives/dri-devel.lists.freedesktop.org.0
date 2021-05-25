Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF07390448
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 16:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09A6E122;
	Tue, 25 May 2021 14:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4726E122
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:48:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v12so32567783wrq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qVfkQfbmmDuKAHyZ9b8/gZcN6+vhg09qkquadOBNNLo=;
 b=RYi9jAZHRr0m8VTwR1tI3snNlLBW3rugTeznV5FV2YhtYl0bG7iswl2vilcjo208Me
 KJpupKqrDqtcmrOZR5r/rxeRwLpMpdL+injF3Vqj7uLYpWcbYn6g8tFKPmHLLB175AUT
 YEsdTtsMBSZk6ZGcvfH6Xknkx6LV75QzcXoig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qVfkQfbmmDuKAHyZ9b8/gZcN6+vhg09qkquadOBNNLo=;
 b=oGq/HkPAJEBYD9/SwLbTKW5xWbrCGajko9RiNAK7a2wUfjfq3CYd8p4klQ73zQj8eG
 bgydl0JO+ZulqX9fxijIzLjq+ZfW1L0Ewadh4OwyUL7aWAQ4PUk0IZV06B+gvb1iLX+d
 Q/zW9f5lhxuha/RqKlgP2cqrK5VXFl5duN5oJqSShUH0TTWbhDTLhCBiSX76MBVkcYOM
 5oXteCN75iM4I7OJuXQInsN2fDlT9bbxd3wvwoOOsA5AIcyOUw/uGwIZLpyJjHTgzYud
 ru3D1VPUv0NdE34PcGisSSsB6olN9r6MiKlPbTTeD1jl3+FhU6i6yNkyB6RbTrkMhjzK
 y7fA==
X-Gm-Message-State: AOAM532+usf9XnqfKkmDFt46bQeg5YHpQiN0uu9ISKuzy1jIQDht0LNI
 84jeobok91QbSJAWGN1Ogvx9lKQHKyB/Jw==
X-Google-Smtp-Source: ABdhPJwICGt4DhrVBY0A+8jU7ZSJ0108cc+4/JMwKDnmpMO9WDTE/6VuatH8fmYp78zuVSov9msD5Q==
X-Received: by 2002:a05:6000:12cc:: with SMTP id
 l12mr27482278wrx.91.1621954079213; 
 Tue, 25 May 2021 07:47:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f18sm9873243wmc.40.2021.05.25.07.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 07:47:57 -0700 (PDT)
Date: Tue, 25 May 2021 16:47:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
Message-ID: <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mahesh.meena@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
> 
> + dri-devel as per process
> 
> On 25/05/2021 14:55, Tejas Upadhyay wrote:
> > v2: Only declare timeslicing if we can safely preempt userspace.
> 
> Commit message got butchered up somehow so you'll need to fix that at some
> point.
> 
> Regards,
> 
> Tvrtko
> 
> > Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
> >   include/uapi/drm/i915_drm.h                 | 1 +
> >   2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > index 3cca7ea2d6ea..12d165566ed2 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
> >   		MAP(HAS_PREEMPTION, PREEMPTION),
> >   		MAP(HAS_SEMAPHORES, SEMAPHORES),
> >   		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
> > +		MAP(TIMESLICE_BIT, TIMESLICING),
> >   #undef MAP
> >   	};
> >   	struct intel_engine_cs *engine;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index c2c7759b7d2e..af2212d6113c 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
> >   #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
> >   #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
> >   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> > +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)

Since this is uapi I think we should at least have some nice kerneldoc
that explains what exactly this is, what for (link to userspace) and all
that. Ideally also minimally filing in the gaps in our uapi docs for stuff
this references.
-Daniel

> >   #define I915_PARAM_HUC_STATUS		 42
> > 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
