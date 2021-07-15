Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF093C9E48
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 14:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99F16E833;
	Thu, 15 Jul 2021 12:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED436E82E;
 Thu, 15 Jul 2021 12:09:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="208715756"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="208715756"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 05:09:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="460372368"
Received: from ianwarx-mobl.ger.corp.intel.com (HELO [10.249.44.71])
 ([10.249.44.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 05:09:48 -0700
Subject: Re: [PATCH 2/4] drm/i915/uapi: convert drm_i915_gem_userptr to kernel
 doc
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-3-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <fce3d89b-f9ef-994f-7bc1-a3cb2c2f5476@linux.intel.com>
Date: Thu, 15 Jul 2021 14:09:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210715101536.2606307-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 15-07-2021 om 12:15 schreef Matthew Auld:
> Add the missing kernel-doc.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 40 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 868c2ee7be60..e20eeeca7a1c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2141,14 +2141,52 @@ struct drm_i915_reset_stats {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_i915_gem_userptr - Create GEM object from user allocated memory.
> + *
> + * Userptr objects have several restrictions on what ioctls can be used with the
> + * object handle.
> + */
>  struct drm_i915_gem_userptr {
> +	/**
> +	 * @user_ptr: The pointer to the allocated memory.
> +	 *
> +	 * Needs to be aligned to PAGE_SIZE.
> +	 */
>  	__u64 user_ptr;
> +
> +	/**
> +	 * @user_size:
> +	 *
> +	 * The size in bytes for the allocated memory. This will also become the
> +	 * object size.
> +	 *
> +	 * Needs to be aligned to PAGE_SIZE, and should be at least PAGE_SIZE,
> +	 * or larger.
> +	 */
>  	__u64 user_size;
> +
> +	/**
> +	 * @flags:
> +	 *
> +	 * Supported flags:
> +	 *
> +	 * I915_USERPTR_READ_ONLY:
> +	 *
> +	 * Mark the object as readonly, this also means GPU access can only be
> +	 * readonly. This is only supported on HW which supports readonly access
> +	 * through the GTT. If the HW can't support readonly access, an error is
> +	 * returned.
> +	 *
> +	 * I915_USERPTR_UNSYNCHRONIZED:
> +	 *
> +	 * NOT USED. Setting this flag will result in an error.
> +	 */
>  	__u32 flags;
>  #define I915_USERPTR_READ_ONLY 0x1
>  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
>  	/**
> -	 * Returned handle for the object.
> +	 * @handle: Returned handle for the object.
>  	 *
>  	 * Object handles are nonzero.
>  	 */

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Can you review

https://patchwork.freedesktop.org/patch/444147/?series=92359&rev=2

?

I noticed some parts of i915_drm.h missing.

