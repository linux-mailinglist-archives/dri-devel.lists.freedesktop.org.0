Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22454E002
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 13:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA5911A3AE;
	Thu, 16 Jun 2022 11:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 580 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 11:27:56 UTC
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202D111A3AA;
 Thu, 16 Jun 2022 11:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id A51573F5C7;
 Thu, 16 Jun 2022 13:18:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.337
X-Spam-Level: 
X-Spam-Status: No, score=-3.337 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.228,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNTRgXCm1Qnk; Thu, 16 Jun 2022 13:18:11 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E19703F53A;
 Thu, 16 Jun 2022 13:18:08 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.54])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B9E5C362691;
 Thu, 16 Jun 2022 13:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1655378288; bh=iduCYen/I2Ut2uoofPd3A3NqGUEhh7j9FR2hAk3Js5A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zf/3E7XxVNB4wUXRKFOu9oYNID2SoMOz8SHXGNyrKWtzp3sSwv5K7hVpwF1obbR7i
 Tz76+kW3IxJ8GmEqXZ9N0i2bqr9GhlxhSN2dg6PssMIDE2Ztoo7m1Nd18RWlU8vJnl
 wnKX/q7DQ55YSoXJo8Y0FQGPmj76cNsFXZYNiroI=
Message-ID: <00da92df-5336-4fa3-2ec5-59bbbe8d3fe5@shipmail.org>
Date: Thu, 16 Jun 2022 13:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH 01/10] drm/doc: add rfc section for small BAR
 uapi
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220525184337.491763-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, mesa-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/22 20:43, Matthew Auld wrote:
> Add an entry for the new uapi needed for small BAR on DG2+.
>
> v2:
>    - Some spelling fixes and other small tweaks. (Akeem & Thomas)
>    - Rework error capture interactions, including no longer needing
>      NEEDS_CPU_ACCESS for objects marked for capture. (Thomas)
>    - Add probed_cpu_visible_size. (Lionel)
> v3:
>    - Drop the vma query for now.
>    - Add unallocated_cpu_visible_size as part of the region query.
>    - Improve the docs some more, including documenting the expected
>      behaviour on older kernels, since this came up in some offline
>      discussion.
> v4:
>    - Various improvements all over. (Tvrtko)
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> Cc: mesa-dev@lists.freedesktop.org
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Acked-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   Documentation/gpu/rfc/i915_small_bar.h   | 189 +++++++++++++++++++++++
>   Documentation/gpu/rfc/i915_small_bar.rst |  47 ++++++
>   Documentation/gpu/rfc/index.rst          |   4 +
>   3 files changed, 240 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.h
>   create mode 100644 Documentation/gpu/rfc/i915_small_bar.rst
>
> diff --git a/Documentation/gpu/rfc/i915_small_bar.h b/Documentation/gpu/rfc/i915_small_bar.h
> new file mode 100644
> index 000000000000..752bb2ceb399
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_small_bar.h
> @@ -0,0 +1,189 @@
> +/**
> + * struct __drm_i915_memory_region_info - Describes one region as known to the
> + * driver.
> + *
> + * Note this is using both struct drm_i915_query_item and struct drm_i915_query.
> + * For this new query we are adding the new query id DRM_I915_QUERY_MEMORY_REGIONS
> + * at &drm_i915_query_item.query_id.
> + */
> +struct __drm_i915_memory_region_info {
> +	/** @region: The class:instance pair encoding */
> +	struct drm_i915_gem_memory_class_instance region;
> +
> +	/** @rsvd0: MBZ */
> +	__u32 rsvd0;
> +
> +	/**
> +	 * @probed_size: Memory probed by the driver (-1 = unknown)
> +	 *
> +	 * Note that it should not be possible to ever encounter a zero value
> +	 * here, also note that no current region type will ever return -1 here.
> +	 * Although for future region types, this might be a possibility. The
> +	 * same applies to the other size fields.
> +	 */
> +	__u64 probed_size;
> +
> +	/**
> +	 * @unallocated_size: Estimate of memory remaining (-1 = unknown)
> +	 *
> +	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable accounting.
> +	 * Without this (or if this is an older kernel) the value here will
> +	 * always equal the @probed_size. Note this is only currently tracked
> +	 * for I915_MEMORY_CLASS_DEVICE regions (for other types the value here
> +	 * will always equal the @probed_size).
> +	 */
> +	__u64 unallocated_size;
> +
> +	union {
> +		/** @rsvd1: MBZ */
> +		__u64 rsvd1[8];
> +		struct {
> +			/**
> +			 * @probed_cpu_visible_size: Memory probed by the driver
> +			 * that is CPU accessible. (-1 = unknown).
> +			 *
> +			 * This will be always be <= @probed_size, and the
> +			 * remainder (if there is any) will not be CPU
> +			 * accessible.
> +			 *
> +			 * On systems without small BAR, the @probed_size will
> +			 * always equal the @probed_cpu_visible_size, since all
> +			 * of it will be CPU accessible.
> +			 *
> +			 * Note this is only tracked for
> +			 * I915_MEMORY_CLASS_DEVICE regions (for other types the
> +			 * value here will always equal the @probed_size).
> +			 *
> +			 * Note that if the value returned here is zero, then
> +			 * this must be an old kernel which lacks the relevant
> +			 * small-bar uAPI support (including
> +			 * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS), but on
> +			 * such systems we should never actually end up with a
> +			 * small BAR configuration, assuming we are able to load
> +			 * the kernel module. Hence it should be safe to treat
> +			 * this the same as when @probed_cpu_visible_size ==
> +			 * @probed_size.
> +			 */
> +			__u64 probed_cpu_visible_size;
> +
> +			/**
> +			 * @unallocated_cpu_visible_size: Estimate of CPU
> +			 * visible memory remaining (-1 = unknown).
> +			 *
> +			 * Note this is only tracked for
> +			 * I915_MEMORY_CLASS_DEVICE regions (for other types the
> +			 * value here will always equal the
> +			 * @probed_cpu_visible_size).
> +			 *
> +			 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> +			 * accounting.  Without this the value here will always
> +			 * equal the @probed_cpu_visible_size. Note this is only
> +			 * currently tracked for I915_MEMORY_CLASS_DEVICE
> +			 * regions (for other types the value here will also
> +			 * always equal the @probed_cpu_visible_size).
> +			 *
> +			 * If this is an older kernel the value here will be
> +			 * zero, see also @probed_cpu_visible_size.
> +			 */
> +			__u64 unallocated_cpu_visible_size;
> +		};
> +	};
> +};
> +
> +/**
> + * struct __drm_i915_gem_create_ext - Existing gem_create behaviour, with added
> + * extension support using struct i915_user_extension.
> + *
> + * Note that new buffer flags should be added here, at least for the stuff that
> + * is immutable. Previously we would have two ioctls, one to create the object
> + * with gem_create, and another to apply various parameters, however this
> + * creates some ambiguity for the params which are considered immutable. Also in
> + * general we're phasing out the various SET/GET ioctls.
> + */
> +struct __drm_i915_gem_create_ext {
> +	/**
> +	 * @size: Requested size for the object.
> +	 *
> +	 * The (page-aligned) allocated size for the object will be returned.
> +	 *
> +	 * Note that for some devices we have might have further minimum
> +	 * page-size restrictions (larger than 4K), like for device local-memory.
> +	 * However in general the final size here should always reflect any
> +	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
> +	 * extension to place the object in device local-memory. The kernel will
> +	 * always select the largest minimum page-size for the set of possible
> +	 * placements as the value to use when rounding up the @size.
> +	 */
> +	__u64 size;
> +
> +	/**
> +	 * @handle: Returned handle for the object.
> +	 *
> +	 * Object handles are nonzero.
> +	 */
> +	__u32 handle;
> +
> +	/**
> +	 * @flags: Optional flags.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS - Signal to the kernel that
> +	 * the object will need to be accessed via the CPU.
> +	 *
> +	 * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, and only
> +	 * strictly required on configurations where some subset of the device
> +	 * memory is directly visible/mappable through the CPU (which we also
> +	 * call small BAR), like on some DG2+ systems. Note that this is quite
> +	 * undesirable, but due to various factors like the client CPU, BIOS etc
> +	 * it's something we can expect to see in the wild. See
> +	 * &__drm_i915_memory_region_info.probed_cpu_visible_size for how to
> +	 * determine if this system applies.
> +	 *
> +	 * Note that one of the placements MUST be I915_MEMORY_CLASS_SYSTEM, to
> +	 * ensure the kernel can always spill the allocation to system memory,
> +	 * if the object can't be allocated in the mappable part of
> +	 * I915_MEMORY_CLASS_DEVICE.
> +	 *
> +	 * Also note that since the kernel only supports flat-CCS on objects
> +	 * that can *only* be placed in I915_MEMORY_CLASS_DEVICE, we therefore
> +	 * don't support I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS together with
> +	 * flat-CCS.
> +	 *
> +	 * Without this hint, the kernel will assume that non-mappable
> +	 * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note that the
> +	 * kernel can still migrate the object to the mappable part, as a last
> +	 * resort, if userspace ever CPU faults this object, but this might be
> +	 * expensive, and so ideally should be avoided.
> +	 *
> +	 * On older kernels which lack the relevant small-bar uAPI support (see
> +	 * also &__drm_i915_memory_region_info.probed_cpu_visible_size),
> +	 * usage of the flag will result in an error, but it should NEVER be
> +	 * possible to end up with a small BAR configuration, assuming we can
> +	 * also successfully load the i915 kernel module. In such cases the
> +	 * entire I915_MEMORY_CLASS_DEVICE region will be CPU accessible, and as
> +	 * such there are zero restrictions on where the object can be placed.
> +	 */
> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
> +	__u32 flags;
> +
> +	/**
> +	 * @extensions: The chain of extensions to apply to this object.
> +	 *
> +	 * This will be useful in the future when we need to support several
> +	 * different extensions, and we need to apply more than one when
> +	 * creating the object. See struct i915_user_extension.
> +	 *
> +	 * If we don't supply any extensions then we get the same old gem_create
> +	 * behaviour.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
> +	 * struct drm_i915_gem_create_ext_memory_regions.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> +	 * struct drm_i915_gem_create_ext_protected_content.
> +	 */
> +#define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +	__u64 extensions;
> +};
> diff --git a/Documentation/gpu/rfc/i915_small_bar.rst b/Documentation/gpu/rfc/i915_small_bar.rst
> new file mode 100644
> index 000000000000..a322481cea8b
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_small_bar.rst
> @@ -0,0 +1,47 @@
> +==========================
> +I915 Small BAR RFC Section
> +==========================
> +Starting from DG2 we will have resizable BAR support for device local-memory(i.e
> +I915_MEMORY_CLASS_DEVICE), but in some cases the final BAR size might still be
> +smaller than the total probed_size. In such cases, only some subset of
> +I915_MEMORY_CLASS_DEVICE will be CPU accessible(for example the first 256M),
> +while the remainder is only accessible via the GPU.
> +
> +I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS flag
> +----------------------------------------------
> +New gem_create_ext flag to tell the kernel that a BO will require CPU access.
> +This becomes important when placing an object in I915_MEMORY_CLASS_DEVICE, where
> +underneath the device has a small BAR, meaning only some portion of it is CPU
> +accessible. Without this flag the kernel will assume that CPU access is not
> +required, and prioritize using the non-CPU visible portion of
> +I915_MEMORY_CLASS_DEVICE.
> +
> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
> +   :functions: __drm_i915_gem_create_ext
> +
> +probed_cpu_visible_size attribute
> +---------------------------------
> +New struct__drm_i915_memory_region attribute which returns the total size of the
> +CPU accessible portion, for the particular region. This should only be
> +applicable for I915_MEMORY_CLASS_DEVICE. We also report the
> +unallocated_cpu_visible_size, alongside the unallocated_size.
> +
> +Vulkan will need this as part of creating a separate VkMemoryHeap with the
> +VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT set, to represent the CPU visible portion,
> +where the total size of the heap needs to be known. It also wants to be able to
> +give a rough estimate of how memory can potentially be allocated.
> +
> +.. kernel-doc:: Documentation/gpu/rfc/i915_small_bar.h
> +   :functions: __drm_i915_memory_region_info
> +
> +Error Capture restrictions
> +--------------------------
> +With error capture we have two new restrictions:
> +
> +    1) Error capture is best effort on small BAR systems; if the pages are not
> +    CPU accessible, at the time of capture, then the kernel is free to skip
> +    trying to capture them.
> +
> +    2) On discrete we now reject error capture on recoverable contexts. In the
> +    future the kernel may want to blit during error capture, when for example
> +    something is not currently CPU accessible.

Change this to all upcoming hardware so that we are more likely to be 
able to allocate memory outside of a fence signalling critical section?

/Thomas


> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> index 91e93a705230..5a3bd3924ba6 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -23,3 +23,7 @@ host such documentation:
>   .. toctree::
>   
>       i915_scheduler.rst
> +
> +.. toctree::
> +
> +    i915_small_bar.rst
