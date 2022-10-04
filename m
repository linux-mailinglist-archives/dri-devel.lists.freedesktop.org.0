Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE335F452B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 16:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FBF10E5F8;
	Tue,  4 Oct 2022 14:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AD510E5F8;
 Tue,  4 Oct 2022 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664892537; x=1696428537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NufrIMXEyh/krbXboFFo1zeD2uhg5pv6DFpqUnd2GUo=;
 b=VxymmV9CnYLgmeumx51mqksYkpoJUFMWkTIE/zTNhOK9Q5s4R15TK3Ls
 NmHrctPPkVzSaAeI+/nAyIy2dudABmHhRYYgjsBH5gD1D6tVSd/5wSCiJ
 UJuUFZ0zjg+pfB5LWV0Oqo49i7N+hMFjkxvGIsevI7Hzx2XILNjtpG6d0
 NjTRWydJ63CUUB9ea2zVq4Nw5VWo9kAz6VdFSc9ykCpDAroYgBNy9sXlE
 VzUjjXtIpA6AXqvU3c4xrMgQNBEKKtEMVF/TBTZqGJ/qJ35O/OgKLehXy
 Zj1T1kXLNEApqYrusn7rX2VaBAdc12HHmwMilfQp0jCgpa6r+aD1OtpwK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="286107391"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="286107391"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 07:08:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="601632603"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="601632603"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.22.232])
 ([10.252.22.232])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 07:08:35 -0700
Message-ID: <c2414cd6-334c-765d-f46a-c1291f3abce0@linux.intel.com>
Date: Tue, 4 Oct 2022 16:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/2] drm/i915/uapi: expose GTT alignment
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221004114915.221708-1-matthew.auld@intel.com>
 <20221004114915.221708-2-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20221004114915.221708-2-matthew.auld@intel.com>
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
 Yang A Shi <yang.a.shi@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, dri-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/4/2022 1:49 PM, Matthew Auld wrote:
> On some platforms we potentially have different alignment restrictions
> depending on the memory type. We also now have different alignment
> restrictions for the same region across different kernel versions.
> Extend the region query to return the minimum required GTT alignment.
>
> Testcase: igt@gem_create@create-ext-placement-alignment
> Testcase: igt@i915_query@query-regions-sanity-check
> Suggested-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Yang A Shi <yang.a.shi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_query.c |  1 +
>   include/uapi/drm/i915_drm.h       | 29 +++++++++++++++++++++++++++--
>   2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 6ec9c9fb7b0d..111377f210ed 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -498,6 +498,7 @@ static int query_memregion_info(struct drm_i915_private *i915,
>   		info.region.memory_class = mr->type;
>   		info.region.memory_instance = mr->instance;
>   		info.probed_size = mr->total;
> +		info.gtt_alignment = mr->min_page_size;
>   
>   		if (mr->type == INTEL_MEMORY_LOCAL)
>   			info.probed_cpu_visible_size = mr->io_size;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 08d69e36fb66..2e613109356b 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3346,8 +3346,33 @@ struct drm_i915_memory_region_info {
>   	/** @region: The class:instance pair encoding */
>   	struct drm_i915_gem_memory_class_instance region;
>   
> -	/** @rsvd0: MBZ */
> -	__u32 rsvd0;
> +	union {
> +		/** @rsvd0: MBZ */
> +		__u32 rsvd0;
> +		/**
> +		 * @gtt_alignment:
> +		 *
> +		 * The minimum required GTT alignment for this type of memory.
> +		 * When allocating a GTT address it must be aligned to this
> +		 * value or larger. On some platforms the kernel might opt to
> +		 * using 64K pages for I915_MEMORY_CLASS_DEVICE, where 64K GTT
> +		 * pages can then be used if we also use 64K GTT alignment.
> +		 *
> +		 * NOTE: If this is zero then this must be an older
> +		 * kernel which lacks support for this field.
> +		 *
> +		 * Side note: For larger objects (especially for
> +		 * I915_MEMORY_CLASS_DEVICE), like 2M+ in size, userspace should
> +		 * consider potentially bumping the GTT alignment to say 2M,
> +		 * which could potentially increase the likelihood of the kernel
> +		 * being able to utilise 2M GTT pages underneath, if the layout
> +		 * of the physical pages allows it.  On some configurations we
> +		 * can then also use a more efficient page-table layout, if we
> +		 * can't use the more desirable 2M GTT page, so long as we know
> +		 * that the entire page-table will be used by this object.
> +		 */
> +		__u32 gtt_alignment;
> +	};
>   
>   	/**
>   	 * @probed_size: Memory probed by the driver
