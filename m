Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0A397568
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EECE6EA7D;
	Tue,  1 Jun 2021 14:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFAC6EA7D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 14:26:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c5so3375795wrq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cBvoLv5ImwFWPolBi0/sqL+d2j6RxuxN/8LJWDz60/8=;
 b=f/MZkNTMD1PYlSc2kCqv4ftIvxKnbJeRBBaTiODD4rKc6JswioKiX10OTHiQ7/1kJ8
 Ft4DVTOAHMD4QaODhP167sq2N5YlpGsh4LjP9ZbWVeiHl0GzPK9e5PmjxWuu7bzsdD20
 ALzD8kxgq5qXdGadkPFna475hNJauy7hBqxYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cBvoLv5ImwFWPolBi0/sqL+d2j6RxuxN/8LJWDz60/8=;
 b=Z3ibpK+awPfkUvgLJZ43ZzirIDQRKjI0ziUATr6Rluef5sEBVe5PQKijO1gOZ/AXNf
 HDoR6rmxGjbhjRRBIs6rCg8qrZ/lEKmQHWmGPBwJLmdcabHaro74OL5+LjKRWQsj/M9Z
 8F6H5Mice6IqldbabXfa8BL5qBiwlAthAELO22UIZE26GSn7uvOwwVy7M62+tUmaKAwg
 yjhISMwyPURljzJOIGDaJH2C72z0NkPNtXVVkzXmn9TXYhVlCAFtjkLeZBYpC+MB7bhB
 EmNTocBO6O/WTASakmi+0PplpeNrP031kqJB/wSanErAtTDTnqrO1INgKBvZU/b/ziOl
 0dTQ==
X-Gm-Message-State: AOAM532JpIy8ZALDjzdkigITS5VyQII9ootpI6xBQGeCzLU0ZkOVI2wE
 ODbaUTrAs+mBN+tM/mrpkX+zRw==
X-Google-Smtp-Source: ABdhPJyEFH5xIhbUFP6ohcyXS1DLH/v63UtEoC70u76RK1w1n9DSz3PshcqT/17HqNc7dmS2uc4Q8A==
X-Received: by 2002:a5d:4578:: with SMTP id a24mr20312855wrc.388.1622557559735; 
 Tue, 01 Jun 2021 07:25:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c206sm2908172wmf.12.2021.06.01.07.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:25:59 -0700 (PDT)
Date: Tue, 1 Jun 2021 16:25:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
Message-ID: <YLZDdUV/COdD9d4v@phenom.ffwll.local>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
 <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
 <8cf2c5f4-87a3-ce6b-150c-65fa054586a4@linux.intel.com>
 <YK9wrCayUwSDzMWG@phenom.ffwll.local>
 <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
 <YK90LkRrMXTC/hF3@phenom.ffwll.local>
 <e96668b6-47a0-f426-51a8-d9824afd8887@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e96668b6-47a0-f426-51a8-d9824afd8887@linux.intel.com>
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

On Tue, Jun 01, 2021 at 11:09:47AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/05/2021 11:27, Daniel Vetter wrote:
> > On Thu, May 27, 2021 at 11:22:16AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 27/05/2021 11:13, Daniel Vetter wrote:
> > > > On Wed, May 26, 2021 at 11:20:13AM +0100, Tvrtko Ursulin wrote:
> > > > > 
> > > > > On 25/05/2021 15:47, Daniel Vetter wrote:
> > > > > > On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
> > > > > > > 
> > > > > > > + dri-devel as per process
> > > > > > > 
> > > > > > > On 25/05/2021 14:55, Tejas Upadhyay wrote:
> > > > > > > > v2: Only declare timeslicing if we can safely preempt userspace.
> > > > > > > 
> > > > > > > Commit message got butchered up somehow so you'll need to fix that at some
> > > > > > > point.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > 
> > > > > > > Tvrtko
> > > > > > > 
> > > > > > > > Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
> > > > > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > > > ---
> > > > > > > >      drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
> > > > > > > >      include/uapi/drm/i915_drm.h                 | 1 +
> > > > > > > >      2 files changed, 2 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > > > index 3cca7ea2d6ea..12d165566ed2 100644
> > > > > > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > > > > > @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
> > > > > > > >      		MAP(HAS_PREEMPTION, PREEMPTION),
> > > > > > > >      		MAP(HAS_SEMAPHORES, SEMAPHORES),
> > > > > > > >      		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
> > > > > > > > +		MAP(TIMESLICE_BIT, TIMESLICING),
> > > > > > > >      #undef MAP
> > > > > > > >      	};
> > > > > > > >      	struct intel_engine_cs *engine;
> > > > > > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > > > > > index c2c7759b7d2e..af2212d6113c 100644
> > > > > > > > --- a/include/uapi/drm/i915_drm.h
> > > > > > > > +++ b/include/uapi/drm/i915_drm.h
> > > > > > > > @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
> > > > > > > >      #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
> > > > > > > >      #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
> > > > > > > >      #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> > > > > > > > +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
> > > > > > 
> > > > > > Since this is uapi I think we should at least have some nice kerneldoc
> > > > > > that explains what exactly this is, what for (link to userspace) and all
> > > > > > that. Ideally also minimally filing in the gaps in our uapi docs for stuff
> > > > > > this references.
> > > > > 
> > > > > IIUC there is no userspace apart from IGT needing it not to fail scheduling
> > > > > tests on ADL.
> > > > > 
> > > > > Current tests use "has preemption + has semaphores" as a proxy to answer the
> > > > > "does the kernel support timeslicing" question. This stops working with the
> > > > > Guc backend because GuC decided not to support semaphores (for reasons yet
> > > > > unknown, see other thread), so explicit "has timeslicing" flag is needed in
> > > > > order for tests to know that GuC is supposed to support timeslicing, even if
> > > > > it doesn't use semaphores for inter-ring synchronisation.
> > > > 
> > > > Since this if for igt only: Cant we do just extend the check in igt with
> > > > an || GEN >= 12? I really hope that our future hw will continue to support
> > > > timeslicing ...
> > > 
> > > Not the gen 12 check, but possible I think. Explicit feature test would be better, but if definitely not allowed then along the lines of:
> > > 
> > > has_timeslicing =
> > > 	(has_preemption && has_semaphores) || uses_guc_submission;
> > 
> > That works too. Otoh what exactly is the "uses guc submission" flag and
> > why do we have that? I've seen media use it as a stand-in for "does the
> > kernel want bonded or parallel ctx?". Maybe another thing to check.
> > 
> > Another option, if you really think the feature flag is the best approach
> > (because future hw will drop timeslicing for some reason), then debugfs is
> > the place of igt-only api.
> 
> Maybe check and potentially remove all I915_SCHEDULER_CAP_.. flags. It could
> be another easy pickings with a lot of IGT work type endeavour.

Yeah there's a lot unfortunately. I'll make a note internally that we need
to look at this again maybe next year, but for now we're going to only
concentrate on stuff that has actual architecture/design impact. In the
grand scheme of things exporting a bunch of flags for igt in the uapi is
mostly harmless. There's much bigger fish to fry were we allow igt to make
changes to objects that should be all immutable. Those need to be worked
out first.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
