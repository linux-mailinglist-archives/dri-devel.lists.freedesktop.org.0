Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E35BB9BD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 19:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9610E45E;
	Sat, 17 Sep 2022 17:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76A10E0E5;
 Sat, 17 Sep 2022 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663434967; x=1694970967;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vUHmSYIK8AHQ/8Qvz8AoBGXA4lfNH4lublr8e3Rb5kg=;
 b=awL2tRHg8r/4exA7sqqyoUHyACiwUo60morNs3yLP/wWKhr59QDzxUq7
 AWWTT2u4bq7BTIJo9cgJwaDRdU4fWBCB4n+m7cMbUKFvOChZk68useX0X
 LkyW2ZtQJzdlC/bMUVywQMuOj3g4aFhYp5TrGvWEnUTCIVqRP0+DA5G/Z
 O1cAzYfCI1tJAV+yIPhQYYXlDT+MJ8lbJHi0YYdQmoZp87wuf9uP9gQzM
 eqhFqYe/7XEtjgp8n625WucPoYlEhvls5OGMJbgHljLiLC8BKmQlBvRIX
 e7z4k9WVHjG8TR8PWY3Uo9zWnha3lkhbOwMIYHYRLZQOPc05wv3YAEkNn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="360907455"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; d="scan'208";a="360907455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2022 10:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; d="scan'208";a="618025371"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2022 10:16:03 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oZbQA-0000U7-1R;
 Sat, 17 Sep 2022 17:16:02 +0000
Date: Sun, 18 Sep 2022 01:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: [drm-tip:drm-tip 3/6] drivers/gpu/drm/i915/i915_gem.c:886:1: error:
 conflicting types for 'i915_gem_object_ggtt_pin_ww'; have 'struct i915_vma
 *(struct drm_i915_gem_object *, struct i915_gem_ww_ctx *, const struct
 i915_gtt_view *, u64,  u64,  u64)' {aka 'struct i915_vma *(stru...
Message-ID: <202209180151.6ZWCG7hx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Hans de Goede <hdegoede@redhat.com>, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   989401d639a84cb706eafc23c37e030014bcf253
commit: 86ac35ffd55d4c2b8308276ab521b2b0afb486c0 [3/6] Merge remote-tracking branch 'drm-intel/drm-intel-next' into drm-tip
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20220918/202209180151.6ZWCG7hx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 86ac35ffd55d4c2b8308276ab521b2b0afb486c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the drm-tip/drm-tip HEAD 989401d639a84cb706eafc23c37e030014bcf253 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_domain.c: In function 'i915_gem_object_pin_to_display_plane':
>> drivers/gpu/drm/i915/gem/i915_gem_domain.c:438:60: error: passing argument 3 of 'i915_gem_object_ggtt_pin_ww' from incompatible pointer type [-Werror=incompatible-pointer-types]
     438 |                 vma = i915_gem_object_ggtt_pin_ww(obj, ww, view, 0, alignment,
         |                                                            ^~~~
         |                                                            |
         |                                                            const struct i915_gtt_view *
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:31,
                    from drivers/gpu/drm/i915/gem/i915_gem_domain.c:7:
   drivers/gpu/drm/i915/i915_gem.h:51:58: note: expected 'const struct i915_ggtt_view *' but argument is of type 'const struct i915_gtt_view *'
      51 |                             const struct i915_ggtt_view *view,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/i915/gem/i915_gem_domain.c:442:60: error: passing argument 3 of 'i915_gem_object_ggtt_pin_ww' from incompatible pointer type [-Werror=incompatible-pointer-types]
     442 |                 vma = i915_gem_object_ggtt_pin_ww(obj, ww, view, 0,
         |                                                            ^~~~
         |                                                            |
         |                                                            const struct i915_gtt_view *
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:31,
                    from drivers/gpu/drm/i915/gem/i915_gem_domain.c:7:
   drivers/gpu/drm/i915/i915_gem.h:51:58: note: expected 'const struct i915_ggtt_view *' but argument is of type 'const struct i915_gtt_view *'
      51 |                             const struct i915_ggtt_view *view,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: all warnings being treated as errors
--
   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'vm_fault_gtt':
>> drivers/gpu/drm/i915/gem/i915_gem_mman.c:357:61: error: passing argument 3 of 'i915_gem_object_ggtt_pin_ww' from incompatible pointer type [-Werror=incompatible-pointer-types]
     357 |                 vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
         |                                                             ^~~~~
         |                                                             |
         |                                                             struct i915_gtt_view *
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:9,
                    from drivers/gpu/drm/i915/gem/i915_gem_mman.c:14:
   drivers/gpu/drm/i915/i915_gem.h:51:58: note: expected 'const struct i915_ggtt_view *' but argument is of type 'struct i915_gtt_view *'
      51 |                             const struct i915_ggtt_view *view,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/i915/gem/i915_gem_mman.c:361:69: error: passing argument 3 of 'i915_gem_object_ggtt_pin_ww' from incompatible pointer type [-Werror=incompatible-pointer-types]
     361 |                         vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     struct i915_gtt_view *
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:9,
                    from drivers/gpu/drm/i915/gem/i915_gem_mman.c:14:
   drivers/gpu/drm/i915/i915_gem.h:51:58: note: expected 'const struct i915_ggtt_view *' but argument is of type 'struct i915_gtt_view *'
      51 |                             const struct i915_ggtt_view *view,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/i915/gem/i915_gem_mman.c:377:69: error: passing argument 3 of 'i915_gem_object_ggtt_pin_ww' from incompatible pointer type [-Werror=incompatible-pointer-types]
     377 |                         vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
         |                                                                     ^~~~~
         |                                                                     |
         |                                                                     struct i915_gtt_view *
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_gt.h:9,
                    from drivers/gpu/drm/i915/gem/i915_gem_mman.c:14:
   drivers/gpu/drm/i915/i915_gem.h:51:58: note: expected 'const struct i915_ggtt_view *' but argument is of type 'struct i915_gtt_view *'
      51 |                             const struct i915_ggtt_view *view,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: all warnings being treated as errors
--
>> drivers/gpu/drm/i915/i915_gem.c:886:1: error: conflicting types for 'i915_gem_object_ggtt_pin_ww'; have 'struct i915_vma *(struct drm_i915_gem_object *, struct i915_gem_ww_ctx *, const struct i915_gtt_view *, u64,  u64,  u64)' {aka 'struct i915_vma *(struct drm_i915_gem_object *, struct i915_gem_ww_ctx *, const struct i915_gtt_view *, long long unsigned int,  long long unsigned int,  long long unsigned int)'}
     886 | i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:31,
                    from drivers/gpu/drm/i915/i915_gem.c:43:
   drivers/gpu/drm/i915/i915_gem.h:49:1: note: previous declaration of 'i915_gem_object_ggtt_pin_ww' with type 'struct i915_vma *(struct drm_i915_gem_object *, struct i915_gem_ww_ctx *, const struct i915_ggtt_view *, u64,  u64,  u64)' {aka 'struct i915_vma *(struct drm_i915_gem_object *, struct i915_gem_ww_ctx *, const struct i915_ggtt_view *, long long unsigned int,  long long unsigned int,  long long unsigned int)'}
      49 | i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_gem.c:989:1: error: conflicting types for 'i915_gem_object_ggtt_pin'; have 'struct i915_vma *(struct drm_i915_gem_object *, const struct i915_gtt_view *, u64,  u64,  u64)' {aka 'struct i915_vma *(struct drm_i915_gem_object *, const struct i915_gtt_view *, long long unsigned int,  long long unsigned int,  long long unsigned int)'}
     989 | i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:20,
                    from drivers/gpu/drm/i915/gt/intel_context_types.h:18,
                    from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:20,
                    from drivers/gpu/drm/i915/i915_request.h:34,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:31,
                    from drivers/gpu/drm/i915/i915_gem.c:43:
   drivers/gpu/drm/i915/i915_gem.h:55:1: note: previous declaration of 'i915_gem_object_ggtt_pin' with type 'struct i915_vma *(struct drm_i915_gem_object *, const struct i915_ggtt_view *, u64,  u64,  u64)' {aka 'struct i915_vma *(struct drm_i915_gem_object *, const struct i915_ggtt_view *, long long unsigned int,  long long unsigned int,  long long unsigned int)'}
      55 | i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +886 drivers/gpu/drm/i915/i915_gem.c

9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   884  
058d88c4330f96 Chris Wilson              2016-08-15   885  struct i915_vma *
47b086934f4295 Maarten Lankhorst         2020-08-19  @886  i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
47b086934f4295 Maarten Lankhorst         2020-08-19   887  			    struct i915_gem_ww_ctx *ww,
3bb6a44251b4d0 Niranjana Vishwanathapura 2022-09-01   888  			    const struct i915_gtt_view *view,
47b086934f4295 Maarten Lankhorst         2020-08-19   889  			    u64 size, u64 alignment, u64 flags)
ec7adb6ee79c8c Joonas Lahtinen           2015-03-16   890  {
b291ce0a168b34 Chris Wilson              2019-11-15   891  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
204129a211fc48 Michał Winiarski          2022-01-05   892  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
59bfa1248e22d6 Chris Wilson              2016-08-04   893  	struct i915_vma *vma;
59bfa1248e22d6 Chris Wilson              2016-08-04   894  	int ret;
72e96d6450c067 Joonas Lahtinen           2016-03-30   895  
576c4ef510d7ad Maarten Lankhorst         2021-12-16   896  	GEM_WARN_ON(!ww);
576c4ef510d7ad Maarten Lankhorst         2021-12-16   897  
ac87a6fd3631e4 Chris Wilson              2018-02-20   898  	if (flags & PIN_MAPPABLE &&
3bb6a44251b4d0 Niranjana Vishwanathapura 2022-09-01   899  	    (!view || view->type == I915_GTT_VIEW_NORMAL)) {
b291ce0a168b34 Chris Wilson              2019-11-15   900  		/*
b291ce0a168b34 Chris Wilson              2019-11-15   901  		 * If the required space is larger than the available
ad16d2ed8fa80e Chris Wilson              2016-10-13   902  		 * aperture, we will not able to find a slot for the
ad16d2ed8fa80e Chris Wilson              2016-10-13   903  		 * object and unbinding the object now will be in
ad16d2ed8fa80e Chris Wilson              2016-10-13   904  		 * vain. Worse, doing so may cause us to ping-pong
ad16d2ed8fa80e Chris Wilson              2016-10-13   905  		 * the object in and out of the Global GTT and
ad16d2ed8fa80e Chris Wilson              2016-10-13   906  		 * waste a lot of cycles under the mutex.
ad16d2ed8fa80e Chris Wilson              2016-10-13   907  		 */
b291ce0a168b34 Chris Wilson              2019-11-15   908  		if (obj->base.size > ggtt->mappable_end)
ad16d2ed8fa80e Chris Wilson              2016-10-13   909  			return ERR_PTR(-E2BIG);
ad16d2ed8fa80e Chris Wilson              2016-10-13   910  
b291ce0a168b34 Chris Wilson              2019-11-15   911  		/*
b291ce0a168b34 Chris Wilson              2019-11-15   912  		 * If NONBLOCK is set the caller is optimistically
ad16d2ed8fa80e Chris Wilson              2016-10-13   913  		 * trying to cache the full object within the mappable
ad16d2ed8fa80e Chris Wilson              2016-10-13   914  		 * aperture, and *must* have a fallback in place for
ad16d2ed8fa80e Chris Wilson              2016-10-13   915  		 * situations where we cannot bind the object. We
ad16d2ed8fa80e Chris Wilson              2016-10-13   916  		 * can be a little more lax here and use the fallback
ad16d2ed8fa80e Chris Wilson              2016-10-13   917  		 * more often to avoid costly migrations of ourselves
ad16d2ed8fa80e Chris Wilson              2016-10-13   918  		 * and other objects within the aperture.
ad16d2ed8fa80e Chris Wilson              2016-10-13   919  		 *
ad16d2ed8fa80e Chris Wilson              2016-10-13   920  		 * Half-the-aperture is used as a simple heuristic.
ad16d2ed8fa80e Chris Wilson              2016-10-13   921  		 * More interesting would to do search for a free
ad16d2ed8fa80e Chris Wilson              2016-10-13   922  		 * block prior to making the commitment to unbind.
ad16d2ed8fa80e Chris Wilson              2016-10-13   923  		 * That caters for the self-harm case, and with a
ad16d2ed8fa80e Chris Wilson              2016-10-13   924  		 * little more heuristics (e.g. NOFAULT, NOEVICT)
ad16d2ed8fa80e Chris Wilson              2016-10-13   925  		 * we could try to minimise harm to others.
ad16d2ed8fa80e Chris Wilson              2016-10-13   926  		 */
ad16d2ed8fa80e Chris Wilson              2016-10-13   927  		if (flags & PIN_NONBLOCK &&
b291ce0a168b34 Chris Wilson              2019-11-15   928  		    obj->base.size > ggtt->mappable_end / 2)
43ae70d97c5195 Chris Wilson              2017-10-09   929  			return ERR_PTR(-ENOSPC);
43ae70d97c5195 Chris Wilson              2017-10-09   930  	}
43ae70d97c5195 Chris Wilson              2017-10-09   931  
9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   932  new_vma:
b291ce0a168b34 Chris Wilson              2019-11-15   933  	vma = i915_vma_instance(obj, &ggtt->vm, view);
772b5408e3aac9 Chengguang Xu             2019-02-21   934  	if (IS_ERR(vma))
43ae70d97c5195 Chris Wilson              2017-10-09   935  		return vma;
43ae70d97c5195 Chris Wilson              2017-10-09   936  
43ae70d97c5195 Chris Wilson              2017-10-09   937  	if (i915_vma_misplaced(vma, size, alignment, flags)) {
43ae70d97c5195 Chris Wilson              2017-10-09   938  		if (flags & PIN_NONBLOCK) {
43ae70d97c5195 Chris Wilson              2017-10-09   939  			if (i915_vma_is_pinned(vma) || i915_vma_is_active(vma))
43ae70d97c5195 Chris Wilson              2017-10-09   940  				return ERR_PTR(-ENOSPC);
43ae70d97c5195 Chris Wilson              2017-10-09   941  
230523ba24bda5 Vivek Kasireddy           2022-03-20   942  			/*
230523ba24bda5 Vivek Kasireddy           2022-03-20   943  			 * If this misplaced vma is too big (i.e, at-least
230523ba24bda5 Vivek Kasireddy           2022-03-20   944  			 * half the size of aperture) or hasn't been pinned
230523ba24bda5 Vivek Kasireddy           2022-03-20   945  			 * mappable before, we ignore the misplacement when
230523ba24bda5 Vivek Kasireddy           2022-03-20   946  			 * PIN_NONBLOCK is set in order to avoid the ping-pong
230523ba24bda5 Vivek Kasireddy           2022-03-20   947  			 * issue described above. In other words, we try to
230523ba24bda5 Vivek Kasireddy           2022-03-20   948  			 * avoid the costly operation of unbinding this vma
230523ba24bda5 Vivek Kasireddy           2022-03-20   949  			 * from the GGTT and rebinding it back because there
230523ba24bda5 Vivek Kasireddy           2022-03-20   950  			 * may not be enough space for this vma in the aperture.
230523ba24bda5 Vivek Kasireddy           2022-03-20   951  			 */
43ae70d97c5195 Chris Wilson              2017-10-09   952  			if (flags & PIN_MAPPABLE &&
230523ba24bda5 Vivek Kasireddy           2022-03-20   953  			    (vma->fence_size > ggtt->mappable_end / 2 ||
230523ba24bda5 Vivek Kasireddy           2022-03-20   954  			    !i915_vma_is_map_and_fenceable(vma)))
ad16d2ed8fa80e Chris Wilson              2016-10-13   955  				return ERR_PTR(-ENOSPC);
ad16d2ed8fa80e Chris Wilson              2016-10-13   956  		}
ad16d2ed8fa80e Chris Wilson              2016-10-13   957  
9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   958  		if (i915_vma_is_pinned(vma) || i915_vma_is_active(vma)) {
51dc276dd2af20 Chris Wilson              2020-06-11   959  			discard_ggtt_vma(vma);
9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   960  			goto new_vma;
9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   961  		}
9bdcaa5e3a2fb0 Chris Wilson              2020-06-05   962  
59bfa1248e22d6 Chris Wilson              2016-08-04   963  		ret = i915_vma_unbind(vma);
59bfa1248e22d6 Chris Wilson              2016-08-04   964  		if (ret)
058d88c4330f96 Chris Wilson              2016-08-15   965  			return ERR_PTR(ret);
59bfa1248e22d6 Chris Wilson              2016-08-04   966  	}
59bfa1248e22d6 Chris Wilson              2016-08-04   967  
47b086934f4295 Maarten Lankhorst         2020-08-19   968  	ret = i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
7d1c2618eac590 Maarten Lankhorst         2021-03-23   969  
0d86ee35097ae0 Chris Wilson              2020-04-01   970  	if (ret)
0d86ee35097ae0 Chris Wilson              2020-04-01   971  		return ERR_PTR(ret);
0d86ee35097ae0 Chris Wilson              2020-04-01   972  
636e83f2f20855 Chris Wilson              2019-08-23   973  	if (vma->fence && !i915_gem_object_is_tiled(obj)) {
b291ce0a168b34 Chris Wilson              2019-11-15   974  		mutex_lock(&ggtt->vm.mutex);
0d86ee35097ae0 Chris Wilson              2020-04-01   975  		i915_vma_revoke_fence(vma);
b291ce0a168b34 Chris Wilson              2019-11-15   976  		mutex_unlock(&ggtt->vm.mutex);
636e83f2f20855 Chris Wilson              2019-08-23   977  	}
636e83f2f20855 Chris Wilson              2019-08-23   978  
e3793468b4660a Chris Wilson              2020-01-30   979  	ret = i915_vma_wait_for_bind(vma);
e3793468b4660a Chris Wilson              2020-01-30   980  	if (ret) {
e3793468b4660a Chris Wilson              2020-01-30   981  		i915_vma_unpin(vma);
e3793468b4660a Chris Wilson              2020-01-30   982  		return ERR_PTR(ret);
e3793468b4660a Chris Wilson              2020-01-30   983  	}
e3793468b4660a Chris Wilson              2020-01-30   984  
058d88c4330f96 Chris Wilson              2016-08-15   985  	return vma;
673a394b1e3b69 Eric Anholt               2008-07-30   986  }
673a394b1e3b69 Eric Anholt               2008-07-30   987  
576c4ef510d7ad Maarten Lankhorst         2021-12-16   988  struct i915_vma * __must_check
576c4ef510d7ad Maarten Lankhorst         2021-12-16  @989  i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
3bb6a44251b4d0 Niranjana Vishwanathapura 2022-09-01   990  			 const struct i915_gtt_view *view,
576c4ef510d7ad Maarten Lankhorst         2021-12-16   991  			 u64 size, u64 alignment, u64 flags)
576c4ef510d7ad Maarten Lankhorst         2021-12-16   992  {
576c4ef510d7ad Maarten Lankhorst         2021-12-16   993  	struct i915_gem_ww_ctx ww;
576c4ef510d7ad Maarten Lankhorst         2021-12-16   994  	struct i915_vma *ret;
576c4ef510d7ad Maarten Lankhorst         2021-12-16   995  	int err;
576c4ef510d7ad Maarten Lankhorst         2021-12-16   996  
576c4ef510d7ad Maarten Lankhorst         2021-12-16   997  	for_i915_gem_ww(&ww, err, true) {
576c4ef510d7ad Maarten Lankhorst         2021-12-16   998  		err = i915_gem_object_lock(obj, &ww);
576c4ef510d7ad Maarten Lankhorst         2021-12-16   999  		if (err)
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1000  			continue;
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1001  
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1002  		ret = i915_gem_object_ggtt_pin_ww(obj, &ww, view, size,
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1003  						  alignment, flags);
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1004  		if (IS_ERR(ret))
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1005  			err = PTR_ERR(ret);
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1006  	}
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1007  
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1008  	return err ? ERR_PTR(err) : ret;
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1009  }
576c4ef510d7ad Maarten Lankhorst         2021-12-16  1010  

:::::: The code at line 886 was first introduced by commit
:::::: 47b086934f429561b3828a6b248e3406b5121939 drm/i915: Make sure execbuffer always passes ww state to i915_vma_pin.

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
