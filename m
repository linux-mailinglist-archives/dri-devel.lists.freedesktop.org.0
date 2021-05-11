Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72C37AD7B
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055D86EAA6;
	Tue, 11 May 2021 17:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88F26EAA5;
 Tue, 11 May 2021 17:58:30 +0000 (UTC)
IronPort-SDR: G/xdTUT+qtaF9NhIFH0crBC65zM2/7XBvOOYTWg0oVLYrqKGlkvxo0e7OXMPLWfbHEJtApSQ6v
 LBSXcMVfGprg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179772133"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="179772133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 10:58:30 -0700
IronPort-SDR: W/1+ESPlVjGhtstl0qxSi41NxRgk4gjCIXoIP5iMEQWjoo3LDsDrFLC12AUZFL8QYFLxaaaHvz
 E2FyNsIFO4Yg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="408900553"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 10:58:30 -0700
Date: Tue, 11 May 2021 10:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 2/5] drm/doc/rfc: i915 new parallel
 submission uAPI plan
Message-ID: <20210511175109.GA4411@sdutt-i7>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-3-matthew.brost@intel.com>
 <YJqZlp3C97WRIilE@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJqZlp3C97WRIilE@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 04:49:58PM +0200, Daniel Vetter wrote:
> On Thu, May 06, 2021 at 10:30:46AM -0700, Matthew Brost wrote:
> > Add entry fpr i915 new parallel submission uAPI plan.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Tony Ye <tony.ye@intel.com>
> > CC: Carl Zhang <carl.zhang@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  Documentation/gpu/rfc/i915_scheduler.rst | 56 +++++++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
> > index fa6780a11c86..e3455b33edfe 100644
> > --- a/Documentation/gpu/rfc/i915_scheduler.rst
> > +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> > @@ -13,7 +13,8 @@ i915 with the DRM scheduler is:
> >  	  modparam enable_guc
> >  	* Lots of rework will need to be done to integrate with DRM scheduler so
> >  	  no need to nit pick everything in the code, it just should be
> > -	  functional and not regress execlists
> > +	  functional, no major coding style / layering errors, and not regress
> > +	  execlists
> 
> I guess this hunk should be in the previous patch?
> 

Yep, noticed this after sending.

> >  	* Update IGTs / selftests as needed to work with GuC submission
> >  	* Enable CI on supported platforms for a baseline
> >  	* Rework / get CI heathly for GuC submission in place as needed
> > @@ -67,4 +68,55 @@ levels too.
> >  
> >  New parallel submission uAPI
> >  ============================
> > -Details to come in a following patch.
> > +The existing bonding uAPI is completely broken with GuC submission because
> > +whether a submission is a single context submit or parallel submit isn't known
> > +until execbuf time activated via the I915_SUBMIT_FENCE. To submit multiple
> > +contexts in parallel with the GuC the context must be explictly registered with
> > +N contexts and all N contexts must be submitted in a single command to the GuC.
> > +This interfaces doesn't support dynamically changing between N contexts as the
> > +bonding uAPI does. Hence the need for a new parallel submission interface. Also
> > +the legacy bonding uAPI is quite confusing and not intuitive at all.
> 
> I think you should sit together with Jason on irc or so for a bit and get
> an earful of how it's all broken irrespective of GuC submission or not.
> Just to hammer in our case :-)
>

Sounds like a fun conversation, will do.
 
> > +
> > +The new parallel submission uAPI consists of 3 parts:
> > +
> > +* Export engines logical mapping
> > +* A 'set_parallel' extension to configure contexts for parallel
> > +  submission
> > +* Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > +
> > +Export engines logical mapping
> > +------------------------------
> > +Certain use cases require BBs to be placed on engine instances in logical order
> > +(e.g. split-frame on gen11+). The logical mapping of engine instances can change
> > +based on fusing. Rather than making UMDs be aware of fusing, simply expose the
> > +logical mapping with the existing query engine info IOCTL. Also the GuC
> > +submission interface currently only supports submitting multiple contexts to
> > +engines in logical order.
> 
> Maybe highlight more that this is a new restriction with GuC compared to
> execlist, which is why we need to expose this information to userspace.
> Also on the platforms thus far supported in upstream there's at most 2
> engines of the same type, so really not an issue.
>

Sure. This is a limitation of the GuC interface + really isn't needed unless we
have more than 2 engines of the same type.
 
> > +
> > +A single bit will be added to drm_i915_engine_info.flags indicating that the
> > +logical instance has been returned and a new field,
> > +drm_i915_engine_info.logical_instance, returns the logical instance.
> > +
> > +A 'set_parallel' extension to configure contexts for parallel submission
> > +------------------------------------------------------------------------
> > +The 'set_parallel' extension configures N contexts for parallel submission. It
> > +is setup step that should be called before using any of the contexts. See
> > +I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE or I915_CONTEXT_ENGINES_EXT_BOND for
> > +similar existing examples. Once the N contexts are configured for parallel
> > +submission the execbuf2 IOCTL can be called submiting 1-N BBs in a single IOCTL.
> > +Although submitting less than N BBs is allowed it is not recommended as that
> > +will likely leave parts of the hardware reserved and idle. Initially only
> > +support GuC submission. Execlist support can be added later if needed.
> 
> Can we just require that you always submit N batchbuffers, or does this
> create a problem for userspace? Allowing things just because is generally
> not a good idea with uapi, it's better to limit and then allow when
> there's a need.
>

Yes, we can limit the submit to N batchbuffers. In fact I want too. I think 1-N
is a layover from our internal discussions where we wanted this interface to be
able to do everything and anything. 
 
> Ofc if we already have a need then explain why and that's all fine.
> 
> Also detailed comments on the kerneldoc I'll do in the next patches.
> 
> > +
> > +Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
> > +i915_context_engines_parallel_submit to the uAPI to implement this extension.
> > +
> > +Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
> > +-------------------------------------------------------------------
> > +Contexts that have been configured with the 'set_parallel' extension are allowed
> > +to submit 1-N BBs in a single execbuf2 IOCTL. The BBs are either the last N
> > +objects in the drm_i915_gem_exec_object2 list or the first N if
> > +I915_EXEC_BATCH_FIRST is set.
> > +
> > +Add field 6 bit wide field to drm_i915_gem_exec_object2.flags which indicates
> > +the number of BBs - 1 included in the IOCTL.
> 
> Hm we have the nice execbuf extension chaining, any reason for not using
> that and instead opting for clever field packing?
>

I think we just drop this per the comments above. If we only allow N batch
buffers on a contexts configured with 'set_parallel' we really don't need to pass
in the number of buffers do we?

Matt
 
> Cheers, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
