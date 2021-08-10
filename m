Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90BD3E53EE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 08:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97789EB7;
	Tue, 10 Aug 2021 06:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106B189EB7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 06:53:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b13so24817349wrs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 23:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iPGkjUvZLLyYA/rI7LQMHBhVSnRtl5Sh6agt6OGXXRI=;
 b=eshl9EANZAwtl1b60zu4KnShHvq+aFbzT1Mx9sWBTny7GsutzlfGeKOznPS6ws/N+n
 BS7uy5+thImiXwLJIWHG80V0SRBNGHeDwnRIMAsQdLXSdFhI2Yag72UK2txu+JBC0kS6
 00xGeI9TwmQhUHv3nh4t/uqXfboLzzqv3sDm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iPGkjUvZLLyYA/rI7LQMHBhVSnRtl5Sh6agt6OGXXRI=;
 b=o2l5oZ9oobdR2Gd/sSRAHt1EopnnqgCXhJ2hH5Sqc/tdQgz0ho/CuvviEwAGaUMQ6/
 o/41Hh3fDSmpml0m1M2Ln05PLR36O80uIXeoJJ97E7jgx51bSpyxvblivW+IeWy7uJO2
 Eudc/RXNC2voAd0EQd5zhHO4MsbnGmdD9G6WvNNOFEYATMX2ORaYnutcUhgsQ84C4Pw/
 SCQ71PdKzDr7/gMAIeSxNjs1kOz68QKOWOcBdOnxOsEgIxVD0Em77qwVizHoykqxOX+J
 jeNPZKlhfKhZMdU0WxNL9/M6m/bYJoDH1qYsrAuU3QdErYK4qaMZDR32BSmNNi2Q35Bc
 i20w==
X-Gm-Message-State: AOAM531sgRawHBCFy5U8Rbm/gLsqN7pKy15hvE7DRlujuwf0/B4SpTG0
 mrYiUP3zk+7uF+HLQNYy7k+0Sw==
X-Google-Smtp-Source: ABdhPJxAsuKsEaB+h3jbybVR7twSsd6XqRIOb6aAPxDL281biRsnniYeTNRw2Ivdh2zwnphlRvWbHw==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr11470948wrw.202.1628578398477; 
 Mon, 09 Aug 2021 23:53:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e3sm8450226wro.15.2021.08.09.23.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:53:17 -0700 (PDT)
Date: Tue, 10 Aug 2021 08:53:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/46] drm/i915: Expose logical engine instance to user
Message-ID: <YRIiXL1sToOPMveN@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-15-matthew.brost@intel.com>
 <YRE77nFgpGQUX/Sc@phenom.ffwll.local>
 <20210809183701.GA123627@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809183701.GA123627@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 06:37:01PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 04:30:06PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:11PM -0700, Matthew Brost wrote:
> > > Expose logical engine instance to user via query engine info IOCTL. This
> > > is required for split-frame workloads as these needs to be placed on
> > > engines in a logically contiguous order. The logical mapping can change
> > > based on fusing. Rather than having user have knowledge of the fusing we
> > > simply just expose the logical mapping with the existing query engine
> > > info IOCTL.
> > > 
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Uapi must have a link to the userspace MR/patch set using this, and to the
> > igt patch set validating it.
> > 
> 
> Have an IGT:
> https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
> 
> Not sure when the media UMD is going to be updated upstream to use this.
> Does that mean I can't merge this until the media UMD is ready? Seems
> like it but isn't that a circular dependency? How can the media team
> develop for a new uAPI that isn't in the kernel yet?

Yes and no. Full explainer here:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

In the drm subsystem this is pretty much the only rule where if you break
it the book will be thrown at you with extreme prejudice.

Also wrt circular: If the umd aren't set up to test their branches against
kernel branches they need to fix their stuff. I know that internally
that's not been done, and its a disaster, but in upstream there's no room
for excuses. Both kernel and userspace needs to be in branches until it's
ready for merging.

> For what it is worth the downstream release is already using this.

Yeah which is another problem, shipping new uapi in downstream before it's
in upstream is decidedly not great.
-Daniel

> 
> Matt
> 
> > Ideally in each patch, since it's way too hard to unfortunately find the
> > cover letter late on.
> > 
> > Jason even went as far as making this a hard requirement because he wasted
> > a bit too much time trying to find the userspace for new uapi:
> > 
> > https://lore.kernel.org/dri-devel/20210804185704.624883-1-jason@jlekstrand.net/
> > 
> > Cheers, Daniel
> > 
> > >---
> > >  drivers/gpu/drm/i915/i915_query.c | 2 ++
> > >  include/uapi/drm/i915_drm.h       | 8 +++++++-
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > > index e49da36c62fb..8a72923fbdba 100644
> > > --- a/drivers/gpu/drm/i915/i915_query.c
> > > +++ b/drivers/gpu/drm/i915/i915_query.c
> > > @@ -124,7 +124,9 @@ query_engine_info(struct drm_i915_private *i915,
> > >  	for_each_uabi_engine(engine, i915) {
> > >  		info.engine.engine_class = engine->uabi_class;
> > >  		info.engine.engine_instance = engine->uabi_instance;
> > > +		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
> > >  		info.capabilities = engine->uabi_capabilities;
> > > +		info.logical_instance = ilog2(engine->logical_mask);
> > >  
> > >  		if (copy_to_user(info_ptr, &info, sizeof(info)))
> > >  			return -EFAULT;
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index 7f13d241417f..ef72e07fe08c 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -2706,14 +2706,20 @@ struct drm_i915_engine_info {
> > >  
> > >  	/** @flags: Engine flags. */
> > >  	__u64 flags;
> > > +#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
> > >  
> > >  	/** @capabilities: Capabilities of this engine. */
> > >  	__u64 capabilities;
> > >  #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
> > >  #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
> > >  
> > > +	/** @logical_instance: Logical instance of engine */
> > > +	__u16 logical_instance;
> > > +
> > >  	/** @rsvd1: Reserved fields. */
> > > -	__u64 rsvd1[4];
> > > +	__u16 rsvd1[3];
> > > +	/** @rsvd2: Reserved fields. */
> > > +	__u64 rsvd2[3];
> > >  };
> > >  
> > >  /**
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
