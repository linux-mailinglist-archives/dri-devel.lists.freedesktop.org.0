Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE149406C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 20:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F352710ED3B;
	Wed, 19 Jan 2022 19:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76610ED3B;
 Wed, 19 Jan 2022 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642619486; x=1674155486;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ehDVQFRTJkDWYbGMwd5bnrsZ2JNon9bvJmDRvBkD0gc=;
 b=YwJePpC7tQWzY5RLVD3KfACMUweg47Qkyhl8EUy0opY9DJHPGDbjL5Jj
 hClH2mOhlezeDp7XsB6UWLLJ3iTJvgffm3I0TEfPkKni4SIOVZY82aRBa
 r+DQF5dlVMlk3LRxttA8xXHNJ2hYcs2aSE2+bQS2EwPk9d/BvUTfaR/Mz
 PpVsfajNwIVmmmh8wMTkhD+WhHnhSEkuNsPe751iQIm6K1uotVI3/b3N9
 qQY6B8JgAL24L4C62XL0CFhRiSXQaDcLlPzGoG3jg6nOwiguTKskAhDAq
 4aIWR0SPHRv+/xchIlaqqm25dW0cmwZ2RMGubUOhR6hDzzt208BqzoEVO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245118653"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245118653"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 10:36:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="615798507"
Received: from mmansuri-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.1.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 10:36:08 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/4] drm/i915/uapi: document behaviour for DG2 64K
 support
In-Reply-To: <20220118175036.3840934-5-bob.beckett@collabora.com>
References: <20220118175036.3840934-1-bob.beckett@collabora.com>
 <20220118175036.3840934-5-bob.beckett@collabora.com>
Date: Wed, 19 Jan 2022 10:36:07 -0800
Message-ID: <87zgnrefoo.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Robert Beckett <bob.beckett@collabora.com>, Tony Ye <tony.ye@intel.com>,
 intel-gfx@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 dri-devel@lists.freedesktop.org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Robert Beckett <bob.beckett@collabora.com> writes:

> From: Matthew Auld <matthew.auld@intel.com>
>
> On discrete platforms like DG2, we need to support a minimum page size
> of 64K when dealing with device local-memory. This is quite tricky for
> various reasons, so try to document the new implicit uapi for this.
>
> v2: Fixed suggestions on formatting [Daniel]
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> cc: Simon Ser <contact@emersion.fr>
> cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 44 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 5e678917da70..486b7b96291e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
>  	/**
>  	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
>  	 * the user with the GTT offset at which this object will be pinned.
> +	 *
>  	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
>  	 * presumed_offset of the object.
> +	 *
>  	 * During execbuffer2 the kernel populates it with the value of the
>  	 * current GTT offset of the object, for future presumed_offset writes.
> +	 *
> +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
> +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
> +	 * minimum page sizes, like DG2.
>  	 */
>  	__u64 offset;
>  
> @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * The (page-aligned) allocated size for the object will be returned.
>  	 *
> -	 * Note that for some devices we have might have further minimum
> -	 * page-size restrictions(larger than 4K), like for device local-memory.
> -	 * However in general the final size here should always reflect any
> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
> -	 * extension to place the object in device local-memory.
> +	 *
> +	 * **DG2 64K min page size implications:**

Long term, I'm not sure that the "**" (for emphasis) is needed here or
below. It's interesting at the moment, but will be just another thing
baked into the kernel/user code in a month from now. :)

> +	 *
> +	 * On discrete platforms, starting from DG2, we have to contend with GTT
> +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
> +	 * objects.  Specifically the hardware only supports 64K or larger GTT
> +	 * page sizes for such memory. The kernel will already ensure that all
> +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
> +	 * sizes underneath.
> +	 *
> +	 * Note that the returned size here will always reflect any required
> +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
> +	 * such as DG2.
> +	 *
> +	 * **Special DG2 GTT address alignment requirement:**
> +	 *
> +	 * The GTT alignment will also need be at least 2M for  such objects.
> +	 *
> +	 * Note that due to how the hardware implements 64K GTT page support, we
> +	 * have some further complications:
> +	 *
> +	 *   1) The entire PDE(which covers a 2MB virtual address range), must
> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
> +	 *   PDE is forbidden by the hardware.
> +	 *
> +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> +	 *   objects.
> +	 *
> +	 * To keep things simple for userland, we mandate that any GTT mappings
> +	 * must be aligned to and rounded up to 2MB. As this only wastes virtual
> +	 * address space and avoids userland having to copy any needlessly
> +	 * complicated PDE sharing scheme (coloring) and only affects GD2, this
> +	 * id deemed to be a good compromise.

typos: GD2, id

Isn't much of this more relavent to the vma offset at exec time? Is
there actually any new restriction on the size field during buffer
creation?

I see Matthew references these notes from the offset comments, so if the
kernel devs prefer it here, then you can add my Acked-by on this patch.

-Jordan

>  	 */
>  	__u64 size;
>  	/**
> -- 
> 2.25.1
