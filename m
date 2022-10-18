Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB1603074
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 18:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD44110E15C;
	Tue, 18 Oct 2022 16:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9039410E15C;
 Tue, 18 Oct 2022 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666109032; x=1697645032;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=anDPgf/52fWJe6lw/QschQDr2GcXEKw5v38N/PKXyIk=;
 b=JFc+cBNFPZexwcxfs48RQazSzulBY8/zzMPRRBU0OdCk78HQcjFSafnA
 2q/g1bBh4UoSCYN2NJRiaXnarDNEL3hTXfNeNXlOA+pDrviADYrTys9c7
 Z2bE5fv5sJwnOPdEEN8apOUI8JK1nzk00TRb47VlSHGHUIX1j880sOyuI
 KtAV7gkGlJ/19UX2CtfZuzLkraPZrOQ8l7nuI3nGC/eEBCoynwJg2K4ao
 wnGoYr5pfbpDn8wZqGqBn2SDm5LkPHoqz0MvI6guDW4h0WgW/+BQmjAMi
 TDv5N/F1Z0lWKT3VjtFUh5TU3jCRaFR8BzgOWUMgLlzPAYyKWPsrmbpcA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="306136976"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="306136976"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:03:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="754115297"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="754115297"
Received: from kmaslows-mobl.ger.corp.intel.com (HELO [10.252.26.162])
 ([10.252.26.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:03:19 -0700
Message-ID: <4e3cfa72-b5d4-edf6-09b2-0a21b1e255d8@intel.com>
Date: Tue, 18 Oct 2022 17:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 17/17] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-18-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-18-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Add getparam support for VM_BIND capability version.
> Add VM creation time flag to enable vm_bind_mode for the VM.
> 
> v2: update kernel-doc
> v3: create vm->root_obj only upon I915_VM_CREATE_FLAGS_USE_VM_BIND
> v4: replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 +++++++++++++++++++--
>   drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +--
>   drivers/gpu/drm/i915/gt/intel_gtt.c         |  2 ++
>   drivers/gpu/drm/i915/i915_drv.h             |  2 ++
>   drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
>   include/uapi/drm/i915_drm.h                 | 22 +++++++++++++++++-
>   6 files changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 76c6419b7ae0..0376adbbeecc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1803,9 +1803,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (!HAS_FULL_PPGTT(i915))
>   		return -ENODEV;
>   
> -	if (args->flags)
> +	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
>   		return -EINVAL;
>   
> +	if ((args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) &&
> +	    !HAS_VM_BIND(i915))
> +		return -EOPNOTSUPP;
> +
>   	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
>   	if (IS_ERR(ppgtt))
>   		return PTR_ERR(ppgtt);
> @@ -1818,15 +1822,32 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>   			goto err_put;
>   	}
>   
> +	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) {
> +		struct drm_i915_gem_object *obj;
> +
> +		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
> +		if (IS_ERR(obj)) {
> +			err = PTR_ERR(obj);
> +			goto err_put;
> +		}
> +
> +		ppgtt->vm.root_obj = obj;
> +	}
> +
>   	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
>   		       xa_limit_32b, GFP_KERNEL);
>   	if (err)
> -		goto err_put;
> +		goto err_root_obj_put;
>   
>   	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>   	args->vm_id = id;
>   	return 0;
>   
> +err_root_obj_put:
> +	if (ppgtt->vm.root_obj) {
> +		i915_gem_object_put(ppgtt->vm.root_obj);
> +		ppgtt->vm.root_obj = NULL;
> +	}
>   err_put:
>   	i915_vm_put(&ppgtt->vm);
>   	return err;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index e8b41aa8f8c4..b53aef2853cb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -150,8 +150,7 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
>    */
>   static inline bool i915_gem_vm_is_vm_bind_mode(struct i915_address_space *vm)
>   {
> -	/* No support to enable vm_bind mode yet */
> -	return false;
> +	return !!vm->root_obj;
>   }
>   
>   struct i915_address_space *
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 50648ab9214a..ae66fdd4bce9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -178,6 +178,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>   void i915_address_space_fini(struct i915_address_space *vm)
>   {
>   	drm_mm_takedown(&vm->mm);
> +	if (vm->root_obj)
> +		i915_gem_object_put(vm->root_obj);
>   	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>   	mutex_destroy(&vm->vm_bind_lock);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 7c64f8a17493..f4e7f3d4aff9 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -972,6 +972,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>   				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>   
> +#define HAS_VM_BIND(i915) (GRAPHICS_VER(i915) >= 12)
> +
>   /* intel_device_info.c */
>   static inline struct intel_device_info *
>   mkwrite_device_info(struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 342c8ca6414e..f45b3c684bcf 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -175,6 +175,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   	case I915_PARAM_PERF_REVISION:
>   		value = i915_perf_ioctl_version();
>   		break;
> +	case I915_PARAM_VM_BIND_VERSION:
> +		value = HAS_VM_BIND(i915);
> +		break;
>   	default:
>   		DRM_DEBUG("Unknown parameter %d\n", param->param);
>   		return -EINVAL;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index fe7ee8f19c83..c2dce8633005 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -771,6 +771,22 @@ typedef struct drm_i915_irq_wait {
>   /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
>   #define I915_PARAM_HAS_USERPTR_PROBE 56
>   
> +/*
> + * VM_BIND feature version supported.
> + *
> + * The following versions of VM_BIND have been defined:
> + *
> + * 0: No VM_BIND support.
> + *
> + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
> + *    previously with VM_BIND, the ioctl will not support unbinding multiple
> + *    mappings or splitting them. Similarly, VM_BIND calls will not replace
> + *    any existing mappings.
> + *
> + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
> + */
> +#define I915_PARAM_VM_BIND_VERSION	57
> +
>   /* Must be kept compact -- no holes and well documented */
>   
>   /**
> @@ -2622,6 +2638,9 @@ struct drm_i915_gem_context_destroy {
>    * on the same file. Extensions can be provided to configure exactly how the
>    * address space is setup upon creation.
>    *
> + * If I915_VM_CREATE_FLAGS_USE_VM_BIND flag is set, VM created will work in
> + * VM_BIND mode.
> + *
>    * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
>    * returned in the outparam @id.
>    *
> @@ -2638,7 +2657,8 @@ struct drm_i915_gem_vm_control {
>   	/** @extensions: Zero-terminated chain of extensions. */
>   	__u64 extensions;
>   
> -	/** @flags: reserved for future usage, currently MBZ */

This looks to remove the kernel-doc completely, instead of updating it.

> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
> +#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
>   	__u32 flags;
>   
>   	/** @vm_id: Id of the VM created or to be destroyed */
