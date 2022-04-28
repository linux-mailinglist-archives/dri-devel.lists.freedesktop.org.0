Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191C512800
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 02:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3584710E147;
	Thu, 28 Apr 2022 00:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2A810E132;
 Thu, 28 Apr 2022 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651105622; x=1682641622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f6ZaTuuR+UzWiPTqh0xEZwrIHw6AZefyLxY6L1mKgBM=;
 b=SyMVGsYnSxm4o2pIcOi4dJ6Z4hshDDULwU2Er+J6lvbnonYvUCCAtDHz
 T4q10V1JLFlfY5HOyNHfzrdrJ3XDvga5db3OdNfMc0PIGL0ejVtkNwnBQ
 NJ9gMlSTFePZDwk4on6WyRnpIHDBBpTlNLMt1z2Msk4YX+78iA//9lndz
 xgm3ReE34HCP8nNhtDsKvyVcYaSRu0Epkeakmlfs9SyOrhzVJCHZLYGmH
 sg1TEn0suNgbmy80xxOSKA7UQCydl4sENYD6IG6Z86NKq8DSH6x+Ndk8A
 WWEdDL6mkJhNJauDKLlO5E9pA2IvTUCtep8sz6TuWXPYaEytyqFnPyUgv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="291272325"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="291272325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 17:27:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="559308797"
Received: from pkumarva-server.jf.intel.com (HELO intel.com) ([10.165.21.200])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 17:27:01 -0700
Date: Wed, 27 Apr 2022 20:27:01 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/xehp: Add compute engine ABI
Message-ID: <20220428002701.GH384@intel.com>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
 <20220422195007.4019661-2-matthew.d.roper@intel.com>
 <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <643c0538-dc2a-a99b-aa53-73693ace6e38@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Szymon Morek <szymon.morek@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 11:41:36AM +0100, Tvrtko Ursulin wrote:
> 
> On 22/04/2022 20:50, Matt Roper wrote:
> > We're now ready to start exposing compute engines to userspace.
> > 
> > While we're at it, let's extend the kerneldoc description for the other
> > engine types as well.
> > 
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Szymon Morek <szymon.morek@intel.com>
> > UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14395
> > UMD (compute): https://github.com/intel/compute-runtime/pull/451
> 
> The compute one points to a commit named "Add compute engine class for xehp"
> but content of which seems more about engine query, including the yet
> non-existent distance query (and more)?! I certainly does not appear to be
> adding a definition of I915_ENGINE_CLASS_COMPUTE. This needs clarifying.
> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_user.c |  2 +-
> >   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
> >   drivers/gpu/drm/i915/i915_drm_client.c      |  1 +
> >   drivers/gpu/drm/i915/i915_drm_client.h      |  2 +-
> >   include/uapi/drm/i915_drm.h                 | 62 +++++++++++++++++++--
> >   5 files changed, 60 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > index 0f6cd96b459f..46a174f8aa00 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > @@ -47,7 +47,7 @@ static const u8 uabi_classes[] = {
> >   	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
> >   	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
> >   	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
> > -	/* TODO: Add COMPUTE_CLASS mapping once ABI is available */
> > +	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
> >   };
> >   static int engine_cmp(void *priv, const struct list_head *A,
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > index 92394f13b42f..c96e123496a5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > @@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
> >   		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
> >   		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
> >   		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
> > +		[COMPUTE_CLASS]			= GEN12_GFX_TLB_INV_CR,
> 
> Do you know what 0xcf04 is?
The mmio 0xcf04 is the one we should use for compute class. 
And the context bit in 0xcf04 represents engine instance.

GEN12_GFX_TLB_INV_CR is for render class.

Thanks,
Prathap
> 
> Or if GEN12_GFX_TLB_INV_CR is correct then I think get_reg_and_bit() might
> need adjusting to always select bit 0 for any compute engine instance. Not
> sure how hardware would behave if value other than '1' would be written into
> 0xced8.
> 
> Regards,
> 
> Tvrtko
> 
> >   	};
> >   	struct drm_i915_private *i915 = gt->i915;
> >   	struct intel_uncore *uncore = gt->uncore;
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> > index 475a6f824cad..18d38cb59923 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.c
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> > @@ -81,6 +81,7 @@ static const char * const uabi_class_names[] = {
> >   	[I915_ENGINE_CLASS_COPY] = "copy",
> >   	[I915_ENGINE_CLASS_VIDEO] = "video",
> >   	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
> > +	[I915_ENGINE_CLASS_COMPUTE] = "compute",
> >   };
> >   static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> > diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> > index 5f5b02b01ba0..f796c5e8e060 100644
> > --- a/drivers/gpu/drm/i915/i915_drm_client.h
> > +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> > @@ -13,7 +13,7 @@
> >   #include "gt/intel_engine_types.h"
> > -#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_VIDEO_ENHANCE
> > +#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
> >   struct drm_i915_private;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 35ca528803fd..a2def7b27009 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -154,21 +154,71 @@ enum i915_mocs_table_index {
> >   	I915_MOCS_CACHED,
> >   };
> > -/*
> > +/**
> > + * enum drm_i915_gem_engine_class - uapi engine type enumeration
> > + *
> >    * Different engines serve different roles, and there may be more than one
> > - * engine serving each role. enum drm_i915_gem_engine_class provides a
> > - * classification of the role of the engine, which may be used when requesting
> > - * operations to be performed on a certain subset of engines, or for providing
> > - * information about that group.
> > + * engine serving each role.  This enum provides a classification of the role
> > + * of the engine, which may be used when requesting operations to be performed
> > + * on a certain subset of engines, or for providing information about that
> > + * group.
> >    */
> >   enum drm_i915_gem_engine_class {
> > +	/**
> > +	 * @I915_ENGINE_CLASS_RENDER:
> > +	 *
> > +	 * Render engines support instructions used for 3D, Compute (GPGPU),
> > +	 * and programmable media workloads.  These instructions fetch data and
> > +	 * dispatch individual work items to threads that operate in parallel.
> > +	 * The threads run small programs (called "kernels" or "shaders") on
> > +	 * the GPU's execution units (EUs).
> > +	 */
> >   	I915_ENGINE_CLASS_RENDER	= 0,
> > +
> > +	/**
> > +	 * @I915_ENGINE_CLASS_COPY:
> > +	 *
> > +	 * Copy engines (also referred to as "blitters") support instructions
> > +	 * that move blocks of data from one location in memory to another,
> > +	 * or that fill a specified location of memory with fixed data.
> > +	 * Copy engines can perform pre-defined logical or bitwise operations
> > +	 * on the source, destination, or pattern data.
> > +	 */
> >   	I915_ENGINE_CLASS_COPY		= 1,
> > +
> > +	/**
> > +	 * @I915_ENGINE_CLASS_VIDEO:
> > +	 *
> > +	 * Video engines (also referred to as "bit stream decode" (BSD) or
> > +	 * "vdbox") support instructions that perform fixed-function media
> > +	 * decode and encode.
> > +	 */
> >   	I915_ENGINE_CLASS_VIDEO		= 2,
> > +
> > +	/**
> > +	 * @I915_ENGINE_CLASS_VIDEO_ENHANCE:
> > +	 *
> > +	 * Video enhancement engines (also referred to as "vebox") support
> > +	 * instructions related to image enhancement.
> > +	 */
> >   	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
> > -	/* should be kept compact */
> > +	/**
> > +	 * @I915_ENGINE_CLASS_COMPUTE:
> > +	 *
> > +	 * Compute engines support a subset of the instructions available
> > +	 * on render engines:  compute engines support Compute (GPGPU) and
> > +	 * programmable media workloads, but do not support the 3D pipeline.
> > +	 */
> > +	I915_ENGINE_CLASS_COMPUTE	= 4,
> > +
> > +	/* Values in this enum should be kept compact. */
> > +	/**
> > +	 * @I915_ENGINE_CLASS_INVALID:
> > +	 *
> > +	 * Placeholder value to represent an invalid engine class assignment.
> > +	 */
> >   	I915_ENGINE_CLASS_INVALID	= -1
> >   };
