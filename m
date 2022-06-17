Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74554F930
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 16:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FE810E0FF;
	Fri, 17 Jun 2022 14:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2D10E0FF;
 Fri, 17 Jun 2022 14:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BEAC33F627;
 Fri, 17 Jun 2022 16:30:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.337
X-Spam-Level: 
X-Spam-Status: No, score=-3.337 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.228,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQNlOFmtbdkE; Fri, 17 Jun 2022 16:30:48 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 86BA63F588;
 Fri, 17 Jun 2022 16:30:48 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A0333362636;
 Fri, 17 Jun 2022 16:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1655476248; bh=g+oXWQgYzgNubMiRvar+jSobA7zHKNeAN/wJTh4Xa8A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AnG3Du7ugq0wQDxqIBYB1dApccR8tcxxCEkIus5ofW8UAqKrlN3yXZMZoO8AOG5SV
 k9tbYicItp94wEWFoI9VjLVMNxR1+kkaAGxez0l8jPcfZhbLf/vuQxJ/D74/ZnzV8V
 +uTToqRc8D/XknExqQ60efsQsEzTlwirc3E0J08I=
Message-ID: <883a9b59-d289-c8fb-09c0-d6d122d42b1c@shipmail.org>
Date: Fri, 17 Jun 2022 16:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH 06/10] drm/i915/uapi: add NEEDS_CPU_ACCESS hint
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-7-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220525184337.491763-7-matthew.auld@intel.com>
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
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/22 20:43, Matthew Auld wrote:
> If set, force the allocation to be placed in the mappable portion of
> I915_MEMORY_CLASS_DEVICE. One big restriction here is that system memory
> (i.e I915_MEMORY_CLASS_SYSTEM) must be given as a potential placement for the
> object, that way we can always spill the object into system memory if we
> can't make space.
>
> Testcase: igt@gem-create@create-ext-cpu-access-sanity-check
> Testcase: igt@gem-create@create-ext-cpu-access-big
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 26 ++++++---
>   include/uapi/drm/i915_drm.h                | 61 +++++++++++++++++++---
>   2 files changed, 71 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index d094cae0ddf1..33673fe7ee0a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -241,6 +241,7 @@ struct create_ext {
>   	struct drm_i915_private *i915;
>   	struct intel_memory_region *placements[INTEL_REGION_UNKNOWN];
>   	unsigned int n_placements;
> +	unsigned int placement_mask;
>   	unsigned long flags;
>   };
>   
> @@ -337,6 +338,7 @@ static int set_placements(struct drm_i915_gem_create_ext_memory_regions *args,
>   	for (i = 0; i < args->num_regions; i++)
>   		ext_data->placements[i] = placements[i];
>   
> +	ext_data->placement_mask = mask;
>   	return 0;
>   
>   out_dump:
> @@ -411,7 +413,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_gem_object *obj;
>   	int ret;
>   
> -	if (args->flags)
> +	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>   		return -EINVAL;
>   
>   	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
> @@ -427,13 +429,21 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   		ext_data.n_placements = 1;
>   	}
>   
> -	/*
> -	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
> -	 * can override this.
> -	 */
> -	if (ext_data.n_placements > 1 ||
> -	    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
> -		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
> +	if (args->flags & I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS) {
> +		if (ext_data.n_placements == 1)
> +			return -EINVAL;
> +
> +		/*
> +		 * We always need to be able to spill to system memory, if we
> +		 * can't place in the mappable part of LMEM.
> +		 */
> +		if (!(ext_data.placement_mask & BIT(INTEL_REGION_SMEM)))
> +			return -EINVAL;
> +	} else {
> +		if (ext_data.n_placements > 1 ||
> +		    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
> +			ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
> +	}
>   
>   	obj = __i915_gem_object_create_user_ext(i915, args->size,
>   						ext_data.placements,
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index e30f31a440b3..5b0a10e6a1b8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3366,11 +3366,11 @@ struct drm_i915_query_memory_regions {
>    * struct drm_i915_gem_create_ext - Existing gem_create behaviour, with added
>    * extension support using struct i915_user_extension.
>    *
> - * Note that in the future we want to have our buffer flags here, at least for
> - * the stuff that is immutable. Previously we would have two ioctls, one to
> - * create the object with gem_create, and another to apply various parameters,
> - * however this creates some ambiguity for the params which are considered
> - * immutable. Also in general we're phasing out the various SET/GET ioctls.
> + * Note that new buffer flags should be added here, at least for the stuff that
> + * is immutable. Previously we would have two ioctls, one to create the object
> + * with gem_create, and another to apply various parameters, however this
> + * creates some ambiguity for the params which are considered immutable. Also in
> + * general we're phasing out the various SET/GET ioctls.
>    */
>   struct drm_i915_gem_create_ext {
>   	/**
> @@ -3378,7 +3378,6 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * The (page-aligned) allocated size for the object will be returned.
>   	 *
> -	 *
>   	 * DG2 64K min page size implications:
>   	 *
>   	 * On discrete platforms, starting from DG2, we have to contend with GTT
> @@ -3390,7 +3389,9 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * Note that the returned size here will always reflect any required
>   	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
> -	 * such as DG2.
> +	 * such as DG2. The kernel will always select the largest minimum
> +	 * page-size for the set of possible placements as the value to use when
> +	 * rounding up the @size.
>   	 *
>   	 * Special DG2 GTT address alignment requirement:
>   	 *
> @@ -3414,14 +3415,58 @@ struct drm_i915_gem_create_ext {
>   	 * is deemed to be a good compromise.
>   	 */
>   	__u64 size;
> +
>   	/**
>   	 * @handle: Returned handle for the object.
>   	 *
>   	 * Object handles are nonzero.
>   	 */
>   	__u32 handle;
> -	/** @flags: MBZ */
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
> +	 * &drm_i915_memory_region_info.probed_cpu_visible_size for how to
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
> +	 * also &drm_i915_memory_region_info.probed_cpu_visible_size),
> +	 * usage of the flag will result in an error, but it should NEVER be
> +	 * possible to end up with a small BAR configuration, assuming we can
> +	 * also successfully load the i915 kernel module. In such cases the
> +	 * entire I915_MEMORY_CLASS_DEVICE region will be CPU accessible, and as
> +	 * such there are zero restrictions on where the object can be placed.
> +	 */
> +#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
>   	__u32 flags;
> +
>   	/**
>   	 * @extensions: The chain of extensions to apply to this object.
>   	 *

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


