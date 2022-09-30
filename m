Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9D5F082C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16910EC37;
	Fri, 30 Sep 2022 10:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A75610E104;
 Fri, 30 Sep 2022 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664532083; x=1696068083;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wLLvlgkfaK8iy1NaRmZIJaB4yHvwCkS1/sF2uThIIDU=;
 b=jHB5f45Gq5zgvTY8ih2n0AsNgeBUiWCRxek4o0K5oKRA5Bl4OxbrsXpx
 utc1EqM8KXKLiTt9jWSv1YAWVzkDfZbVU1hlkLyGWenDS7Jhi3i2+i4Eg
 UOYkMIjTgTR3YKhTSKnWMy2gKeFLPhpknD8C92lmN2lbWR006/zP7O6QU
 zmDL+iFagSHL9S/UKeV0lYQ0csecTNU+l3P20TA8nKVbFRqOpsOnpsfz+
 msnPIU+GBjiMeVPQMC0ZvdbbikRnqJR+JhkyUwL+J5BVPNU6F+ytF0yd7
 8YXMCfblIv/WfzgjqBaCop/ZLYfy17eXRZgEvYsdWPMyIb1hYRFiCQ7bT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="282519742"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="282519742"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:01:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622719782"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="622719782"
Received: from dtrawins-mobl1.ger.corp.intel.com (HELO [10.252.7.39])
 ([10.252.7.39])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:01:19 -0700
Message-ID: <110254ac-a4af-395c-0581-73de653e8cd9@intel.com>
Date: Fri, 30 Sep 2022 11:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 16/16] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-17-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-17-niranjana.vishwanathapura@intel.com>
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

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> Add getparam support for VM_BIND capability version.
> Add VM creation time flag to enable vm_bind_mode for the VM.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 +++++++-
>   drivers/gpu/drm/i915/i915_drv.h             |  2 ++
>   drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
>   include/uapi/drm/i915_drm.h                 | 24 ++++++++++++++++++++-
>   4 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index f4e648ec01ed..c20bd6e8aaf8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1808,9 +1808,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
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
> @@ -1828,6 +1832,9 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (err)
>   		goto err_put;
>   
> +	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND)
> +		ppgtt->vm.vm_bind_mode = true;
> +
>   	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>   	args->vm_id = id;
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 84a2f6b16f57..e77393d74c6f 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -974,6 +974,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   
>   #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>   
> +#define HAS_VM_BIND(dev_priv) (GRAPHICS_VER(dev_priv) >= 12)

s/dev_priv/i915/

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
> index f3a5b198b3e7..9a033acc254b 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -755,6 +755,27 @@ typedef struct drm_i915_irq_wait {
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
> + * 2: The restrictions on unbinding partial or multiple mappings is
> + *    lifted, Similarly, binding will replace any mappings in the given range.

Should we just remove 2 for now? It looks like 1 is this series.

> + *
> + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
> + *
> + * vm_bind versions are backward compatible.
> + */
> +#define I915_PARAM_VM_BIND_VERSION	57
> +
>   /* Must be kept compact -- no holes and well documented */
>   
>   /**
> @@ -2622,7 +2643,8 @@ struct drm_i915_gem_vm_control {
>   	/** @extensions: Zero-terminated chain of extensions. */
>   	__u64 extensions;
>   
> -	/** @flags: reserved for future usage, currently MBZ */
> +#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)

Some kernel-doc for that would be good, even if it's kind of obvious.

Acked-by: Matthew Auld <matthew.auld@intel.com>

> +#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
>   	__u32 flags;
>   
>   	/** @vm_id: Id of the VM created or to be destroyed */
