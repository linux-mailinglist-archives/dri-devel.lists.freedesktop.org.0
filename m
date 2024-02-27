Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6032869132
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 14:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788B110E4C3;
	Tue, 27 Feb 2024 13:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRhGzyes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1EC10E4C3;
 Tue, 27 Feb 2024 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709038916; x=1740574916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hVNMnSvbLYCbx95XY3vaP/ldl/K5ZThG0IBfwTtrGOM=;
 b=GRhGzyesxQUuK47WPKGPl4StfUm2sDrCdCWl8mRiogjMq8LkEVlMiSbX
 Lf6YMiT+G/MMzS0ypC23T0Wudh5IRiIJnvyyKh7p+GYAq3qBtuDa2gEG6
 rL/Oz5xGsYqsdVzYNtyr6cCBF1FCt4eOhZHMk25AB6agk47cOn1Qge4Tr
 CbQzG7Vg+c5dxIMpD6ES1hp7GcLpGIhcYO3ly8LafVltb6WSSo8a3M8pC
 Jce/sIYMbvAs+Kn3TYh/e3gwvXTiPjhfzc3TKmJght5swLe2/8Bo42cG8
 IAUJx9c85jfdzpZuRswbOfllZPqRVsfZWOV/oGKDJUvkxWJnhSeifOQF0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6324538"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6324538"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 05:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11802124"
Received: from ahirstiu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.11])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 05:01:51 -0800
Date: Tue, 27 Feb 2024 14:01:48 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915/gt: Set default CCS mode '1'
Message-ID: <Zd3dPFEFWJsD_JlC@ashyti-mobl2.lan>
References: <20240220142034.257370-1-andi.shyti@linux.intel.com>
 <20240220142034.257370-3-andi.shyti@linux.intel.com>
 <87bk82je2u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk82je2u.fsf@intel.com>
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

Hi Jani,

thanks, there has been a v2 after this and your comments have
been addressed somehow.

There will be a v3, as well.

Thanks,
Andi

On Tue, Feb 27, 2024 at 02:18:01PM +0200, Jani Nikula wrote:
> On Tue, 20 Feb 2024, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> > Since CCS automatic load balancing is disabled, we will impose a
> > fixed balancing policy that involves setting all the CCS engines
> > to work together on the same load.
> >
> > Simultaneously, the user will see only 1 CCS rather than the
> > actual number. As of now, this change affects only DG2.
> >
> > Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.2+
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt.c      | 11 +++++++++++
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
> >  drivers/gpu/drm/i915/i915_drv.h         | 17 +++++++++++++++++
> >  drivers/gpu/drm/i915/i915_query.c       |  5 +++--
> >  4 files changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index a425db5ed3a2..e19df4ef47f6 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
> >  	}
> >  }
> >  
> > +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> > +{
> > +	if (!IS_DG2(gt->i915))
> > +		return;
> > +
> > +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> > +}
> > +
> >  int intel_gt_init_hw(struct intel_gt *gt)
> >  {
> >  	struct drm_i915_private *i915 = gt->i915;
> > @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
> >  
> >  	intel_gt_init_swizzling(gt);
> >  
> > +	/* Configure CCS mode */
> > +	intel_gt_apply_ccs_mode(gt);
> > +
> >  	/*
> >  	 * At least 830 can leave some of the unused rings
> >  	 * "active" (ie. head != tail) after resume which
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index cf709f6c05ae..c148113770ea 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1605,6 +1605,8 @@
> >  #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> >  #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
> >  
> > +#define XEHP_CCS_MODE                          _MMIO(0x14804)
> > +
> >  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
> >  #define   GEN11_CSME				(31)
> >  #define   GEN12_HECI_2				(30)
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index e81b3b2858ac..0853ffd3cb8d 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -396,6 +396,23 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
> >  	     (engine__); \
> >  	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
> >  
> > +/*
> > + * Exclude unavailable engines.
> > + *
> > + * Only the first CCS engine is utilized due to the disabling of CCS auto load
> > + * balancing. As a result, all CCS engines operate collectively, functioning
> > + * essentially as a single CCS engine, hence the count of active CCS engines is
> > + * considered '1'.
> > + * Currently, this applies to platforms with more than one CCS engine,
> > + * specifically DG2.
> > + */
> > +#define for_each_available_uabi_engine(engine__, i915__) \
> 
> Hrmh, I've been trying to pester folks to move the existing engine
> iterator macros away from i915_drv.h, so not happy to see more.
> 
> But since this is Cc: stable, better do that in a follow-up. Please?
> 
> > +	for_each_uabi_engine(engine__, i915__) \
> > +		if ((IS_DG2(i915__)) && \
> > +		    ((engine__)->uabi_class == I915_ENGINE_CLASS_COMPUTE) && \
> > +		    ((engine__)->uabi_instance)) { } \
> > +		else
> 
> We have for_each_if for this.
> 
> > +
> >  #define INTEL_INFO(i915)	((i915)->__info)
> >  #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
> >  #define DRIVER_CAPS(i915)	(&(i915)->caps)
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index fa3e937ed3f5..2d41bda626a6 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
> >  	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
> >  }
> >  
> > +
> 
> Superfluous newline change.
> 
> >  static int
> >  query_engine_info(struct drm_i915_private *i915,
> >  		  struct drm_i915_query_item *query_item)
> > @@ -140,7 +141,7 @@ query_engine_info(struct drm_i915_private *i915,
> >  	if (query_item->flags)
> >  		return -EINVAL;
> >  
> > -	for_each_uabi_engine(engine, i915)
> > +	for_each_available_uabi_engine(engine, i915)
> >  		num_uabi_engines++;
> >  
> >  	len = struct_size(query_ptr, engines, num_uabi_engines);
> > @@ -155,7 +156,7 @@ query_engine_info(struct drm_i915_private *i915,
> >  
> >  	info_ptr = &query_ptr->engines[0];
> >  
> > -	for_each_uabi_engine(engine, i915) {
> > +	for_each_available_uabi_engine(engine, i915) {
> >  		info.engine.engine_class = engine->uabi_class;
> >  		info.engine.engine_instance = engine->uabi_instance;
> >  		info.flags = I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE;
> 
> -- 
> Jani Nikula, Intel
