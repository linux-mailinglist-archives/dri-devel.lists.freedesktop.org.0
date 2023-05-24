Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CC70F507
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 13:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6A10E65B;
	Wed, 24 May 2023 11:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFC010E65A;
 Wed, 24 May 2023 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684927464; x=1716463464;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OnaUHEfbRHoCqiDVb2oM+splN97FkVcL52QWGPfWGJg=;
 b=VY+H7I7WHwtAcJ2AE3QSFxlco1DIG8bjOjGvv8QdmQOBeZtdJ+fu+fVD
 1qM4WZ3C4kJv7YlYXaKLxiXWQSKSYGCBzpJldjGq/R3JOFTDmEvrSLZTA
 0F23WZCQ65yiPfT9LmhnGx/pWZEXlLNzgGvhfXfJsRYAavtUZEPQXF156
 cVo8NyipxF+t4v6Ynvf1zlKiT05fUhU4xTM2KhC4b3zprPGZ/VCi53jyW
 0lzYgWI1uxCE82wW1t+sIlWzS9cxqRsVp3TxfO+Hn8sBvucTLnD07KNxh
 vI+oseWltpSWV1zB1xRdBvMaUhEIdVdiHFrOZowlZ8qXT/dPq8fK65QGI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="351046822"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="351046822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="950970624"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="950970624"
Received: from davidbel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.5])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 04:24:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: pengfuyuan <pengfuyuan@kylinos.cn>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/i915:fix kernel-doc trivial warnings
In-Reply-To: <20230524102332.1483249-1-pengfuyuan@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230524102332.1483249-1-pengfuyuan@kylinos.cn>
Date: Wed, 24 May 2023 14:24:16 +0300
Message-ID: <87r0r6j7kv.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, k2ci <kernel-bot@kylinos.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023, pengfuyuan <pengfuyuan@kylinos.cn> wrote:
> The test robot reports some make warnings.
>
> Fix those warnings:
>     drivers/gpu/drm/i915/i915_gpu_error.c:2174: warning: Function parameter or member 'dump_flags' not described in 'i915_capture_error_state'
>     drivers/gpu/drm/i915/i915_perf.c:5307: warning: Function parameter or member 'i915' not described in 'i915_perf_ioctl_version'
>     drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'active' not described in '__i915_active_fence_init'
>     drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fence' not described in '__i915_active_fence_init'
>     drivers/gpu/drm/i915/i915_active.h:66: warning: Function parameter or member 'fn' not described in '__i915_active_fence_init'
>     drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'active' not described in 'i915_active_fence_set'
>     drivers/gpu/drm/i915/i915_active.h:89: warning: Function parameter or member 'rq' not described in 'i915_active_fence_set'
>     drivers/gpu/drm/i915/i915_active.h:102: warning: Function parameter or member 'active' not described in 'i915_active_fence_get'
>     drivers/gpu/drm/i915/i915_active.h:122: warning: Function parameter or member 'active' not described in 'i915_active_fence_isset'
>     drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'OP' not described in '__wait_for'
>     drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'COND' not described in '__wait_for'
>     drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'US' not described in '__wait_for'
>     drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'Wmin' not described in '__wait_for'
>     drivers/gpu/drm/i915/i915_utils.h:284: warning: Function parameter or member 'Wmax' not described in '__wait_for'
>     drivers/gpu/drm/i915/i915_scatterlist.h:164: warning: Function parameter or member 'release' not described in 'i915_refct_sgt_ops'
>     drivers/gpu/drm/i915/i915_scatterlist.h:187: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_put'
>     drivers/gpu/drm/i915/i915_scatterlist.h:198: warning: Function parameter or member 'rsgt' not described in 'i915_refct_sgt_get'
>     drivers/gpu/drm/i915/i915_scatterlist.h:214: warning: Function parameter or member 'rsgt' not described in '__i915_refct_sgt_init'
>     drivers/gpu/drm/i915/i915_vma_resource.h:129: warning: Function parameter or member 'wakeref' not described in 'i915_vma_resource'
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>

Thanks for your patches. However, this and all the other kernel-doc
warnings have already been fixed by commits:

c6948d8c221a drm/i915/ttm: fix i915_ttm_to_gem() kernel-doc
9d7fe94d3552 drm/i915/scatterlist: fix kernel-doc
08272a5a4187 drm/i915/gem: fix function pointer member kernel-doc
e971121350e7 drm/i915/vma: fix struct i915_vma_bindinfo kernel-doc
8b2a7394e51d drm/i915/scatterlist: fix kernel-doc parameter documentation
70b9933c09b8 drm/i915/pxp: fix kernel-doc for member dev_link
7bc30374f84c drm/i915/pmu: drop kernel-doc
8802628237ac drm/i915/active: fix kernel-doc for function parameters
f05e526e44cb drm/i915/guc: drop lots of kernel-doc markers
3a21c6b4298d drm/i915/guc: add dbgfs_node member kernel-doc
1f5cf999bedc drm/i915/engine: hide preempt_hang selftest member from kernel-doc
e798a3b30dcb drm/i915/gtt: fix i915_vm_resv_put() kernel-doc parameter name
71ca9b87a72b drm/i915/context: fix kernel-doc parameter descriptions
9c55105be0a7 drm/i915/engine: fix kernel-doc function name for intel_engine_cleanup_common()
faa19ce89b0b drm/i915/gem: fix i915_gem_object_lookup_rcu() kernel-doc parameter name
d7b7332c0e99 drm/i915/request: drop kernel-doc
88629feedcc4 drm/i915/error: fix i915_capture_error_state() kernel-doc
9570b0390751 drm/i915/perf: fix i915_perf_ioctl_version() kernel-doc
144c3f7b1909 drm/i915/utils: drop kernel-doc from __wait_for()
e1172b617a93 drm/i915/vma: fix kernel-doc function name for i915_vma_size()
67f2dd9f38ab drm/i915/gvt: fix intel_vgpu_alloc_resource() kernel-doc parameter
b358793c3bf2 drm/i915/wakeref: fix kernel-doc comment
efd812745405 drm/i915/tc: demote a kernel-doc comment to a regular comment

Please use the drm-tip branch or linux-next to look at the latest
source.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/i915_active.h       | 14 +++++++-------
>  drivers/gpu/drm/i915/i915_gpu_error.c    |  1 +
>  drivers/gpu/drm/i915/i915_perf.c         |  1 +
>  drivers/gpu/drm/i915/i915_scatterlist.h  |  9 +++++----
>  drivers/gpu/drm/i915/i915_utils.h        |  6 ++++++
>  drivers/gpu/drm/i915/i915_vma_resource.h |  1 +
>  6 files changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
> index 7eb44132183a..77c676ecc263 100644
> --- a/drivers/gpu/drm/i915/i915_active.h
> +++ b/drivers/gpu/drm/i915/i915_active.h
> @@ -49,9 +49,9 @@ void i915_active_noop(struct dma_fence *fence, struct dma_fence_cb *cb);
>  
>  /**
>   * __i915_active_fence_init - prepares the activity tracker for use
> - * @active - the active tracker
> - * @fence - initial fence to track, can be NULL
> - * @func - a callback when then the tracker is retired (becomes idle),
> + * @active: the active tracker
> + * @fence: initial fence to track, can be NULL
> + * @fn: a callback when then the tracker is retired (becomes idle),
>   *         can be NULL
>   *
>   * i915_active_fence_init() prepares the embedded @active struct for use as
> @@ -77,8 +77,8 @@ __i915_active_fence_set(struct i915_active_fence *active,
>  
>  /**
>   * i915_active_fence_set - updates the tracker to watch the current fence
> - * @active - the active tracker
> - * @rq - the request to watch
> + * @active: the active tracker
> + * @rq: the request to watch
>   *
>   * i915_active_fence_set() watches the given @rq for completion. While
>   * that @rq is busy, the @active reports busy. When that @rq is signaled
> @@ -89,7 +89,7 @@ i915_active_fence_set(struct i915_active_fence *active,
>  		      struct i915_request *rq);
>  /**
>   * i915_active_fence_get - return a reference to the active fence
> - * @active - the active tracker
> + * @active: the active tracker
>   *
>   * i915_active_fence_get() returns a reference to the active fence,
>   * or NULL if the active tracker is idle. The reference is obtained under RCU,
> @@ -111,7 +111,7 @@ i915_active_fence_get(struct i915_active_fence *active)
>  
>  /**
>   * i915_active_fence_isset - report whether the active tracker is assigned
> - * @active - the active tracker
> + * @active: the active tracker
>   *
>   * i915_active_fence_isset() returns true if the active tracker is currently
>   * assigned to a fence. Due to the lazy retiring, that fence may be idle
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f020c0086fbc..dae8b7ff9725 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -2162,6 +2162,7 @@ void i915_error_state_store(struct i915_gpu_coredump *error)
>   * i915_capture_error_state - capture an error record for later analysis
>   * @gt: intel_gt which originated the hang
>   * @engine_mask: hung engines
> + * @dump_flags: flags specifying additional options for capturing the error state
>   *
>   *
>   * Should be called when an error is detected (either a hang or an error
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 050b8ae7b8e7..2bbf359c18b3 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -5300,6 +5300,7 @@ void i915_perf_fini(struct drm_i915_private *i915)
>  
>  /**
>   * i915_perf_ioctl_version - Version of the i915-perf subsystem
> + * @i915: i915 device instance
>   *
>   * This version number is used by userspace to detect available features.
>   */
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index b0a1db44f895..50b379bac6fd 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -154,6 +154,7 @@ bool i915_sg_trim(struct sg_table *orig_st);
>  
>  /**
>   * struct i915_refct_sgt_ops - Operations structure for struct i915_refct_sgt
> + * @release: Free the memory of the struct i915_refct_sgt
>   */
>  struct i915_refct_sgt_ops {
>  	/**
> @@ -167,7 +168,7 @@ struct i915_refct_sgt_ops {
>   * struct i915_refct_sgt - A refcounted scatter-gather table
>   * @kref: struct kref for refcounting
>   * @table: struct sg_table holding the scatter-gather table itself. Note that
> - * @table->sgl = NULL can be used to determine whether a scatter-gather table
> + * table->sgl = NULL can be used to determine whether a scatter-gather table
>   * is present or not.
>   * @size: The size in bytes of the underlying memory buffer
>   * @ops: The operations structure.
> @@ -181,7 +182,7 @@ struct i915_refct_sgt {
>  
>  /**
>   * i915_refct_sgt_put - Put a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to put.
> + * @rsgt: the struct i915_refct_sgt to put.
>   */
>  static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>  {
> @@ -191,7 +192,7 @@ static inline void i915_refct_sgt_put(struct i915_refct_sgt *rsgt)
>  
>  /**
>   * i915_refct_sgt_get - Get a refcounted sg-table
> - * @rsgt the struct i915_refct_sgt to get.
> + * @rsgt: the struct i915_refct_sgt to get.
>   */
>  static inline struct i915_refct_sgt *
>  i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
> @@ -203,7 +204,7 @@ i915_refct_sgt_get(struct i915_refct_sgt *rsgt)
>  /**
>   * __i915_refct_sgt_init - Initialize a refcounted sg-list with a custom
>   * operations structure
> - * @rsgt The struct i915_refct_sgt to initialize.
> + * @rsgt: The struct i915_refct_sgt to initialize.
>   * @size: Size in bytes of the underlying memory buffer.
>   * @ops: A customized operations structure in case the refcounted sg-list
>   * is embedded into another structure.
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index 2c430c0c3bad..8e8d1f937e60 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -257,6 +257,12 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>   * important that we check the condition again after having timed out, since the
>   * timeout could be due to preemption or similar and we've never had a chance to
>   * check the condition before the timeout.
> + *
> + * @OP: operation to perform on each iteration.
> + * @COND: condition to check for.
> + * @US: timeout duration in microseconds.
> + * @Wmin: recommended minimum for usleep (in microseconds).
> + * @Wmax: maximum wait duration (in microseconds).
>   */
>  #define __wait_for(OP, COND, US, Wmin, Wmax) ({ \
>  	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
> diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
> index c1864e3d0b43..6bb7d6d19216 100644
> --- a/drivers/gpu/drm/i915/i915_vma_resource.h
> +++ b/drivers/gpu/drm/i915/i915_vma_resource.h
> @@ -49,6 +49,7 @@ struct i915_page_sizes {
>   * @__subtree_last: Interval tree private member.
>   * @vm: non-refcounted pointer to the vm. This is for internal use only and
>   * this member is cleared after vm_resource unbind.
> + * @wakeref: wake reference for the resource.
>   * @mr: The memory region of the object pointed to by the vma.
>   * @ops: Pointer to the backend i915_vma_ops.
>   * @private: Bind backend private info.

-- 
Jani Nikula, Intel Open Source Graphics Center
