Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ADC4A5342
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D8D10E470;
	Mon, 31 Jan 2022 23:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F79910E456;
 Mon, 31 Jan 2022 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643671918; x=1675207918;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=OhcwlAWEsmx+gZ64O+O1IZRoONODzfL3ULfLVGCVjW8=;
 b=ZrVMGCmXBRfv4E2pHGffJQUKhTWkM93BbJudNq4Byw2YX7hs+6LkWLpc
 F2a+fAR4YNXHxQoi/trfL+NdnCyEqHLIdslk6uS/ttyOkLo1ImOK0bv0V
 LN1q8iP7b6UEQ219PFPp+E0yb+m94XZ4Ai4KQoHZA94+hmYlltdNg0Vii
 DzXhvNtNmVVBt6Tf1m0WOEkkSz7W596SK+PSoyAa3qRRVr0S4DLaTekFN
 YnreYzml0/RU0Dv5LftvHCLugp+r8bUwBm2uiHUOxFCEWQ7FSe/PKIc8D
 SRr4Ex/QdoypCmyJa8I1Jg5Qx1x5767oouq3bGKoN55+wsY68Te8vHgyI Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308307256"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="308307256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 15:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="497127117"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 31 Jan 2022 15:31:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEg9K-000SSW-8E; Mon, 31 Jan 2022 23:31:54 +0000
Date: Tue, 1 Feb 2022 07:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Subject: [drm-intel:for-linux-next-fixes 6/7]
 drivers/gpu/drm/i915/i915_vma.c:451:4: error: 'ret' undeclared; did you mean
 'net'?
Message-ID: <202202010616.uhgpmfp0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
head:   ea33c6d63f87e34b14dba6f2804990a5fc5a60d7
commit: 2e872d87cbf2cd02dca570ee187cf35567576a70 [6/7] drm/i915: delete shadow "ret" variable
config: x86_64-randconfig-a003-20220131 (https://download.01.org/0day-ci/archive/20220201/202202010616.uhgpmfp0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel for-linux-next-fixes
        git checkout 2e872d87cbf2cd02dca570ee187cf35567576a70
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_vma.c: In function 'i915_vma_bind':
>> drivers/gpu/drm/i915/i915_vma.c:451:4: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     451 |    ret = i915_gem_object_wait_moving_fence(vma->obj, true);
         |    ^~~
         |    net
   drivers/gpu/drm/i915/i915_vma.c:451:4: note: each undeclared identifier is reported only once for each function it appears in


vim +451 drivers/gpu/drm/i915/i915_vma.c

f6c466b84cfa78 Maarten Lankhorst      2021-11-22  376  
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  377  /**
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  378   * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding address space.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  379   * @vma: VMA to map
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  380   * @cache_level: mapping cache level
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  381   * @flags: flags like global or local mapping
2850748ef8763a Chris Wilson           2019-10-04  382   * @work: preallocated worker for allocating and binding the PTE
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  383   *
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  384   * DMA addresses are taken from the scatter-gather table of this object (or of
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  385   * this VMA in case of non-default GGTT views) and PTE entries set up.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  386   * Note that DMA addresses are also the only part of the SG table we care about.
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  387   */
2850748ef8763a Chris Wilson           2019-10-04  388  int i915_vma_bind(struct i915_vma *vma,
2850748ef8763a Chris Wilson           2019-10-04  389  		  enum i915_cache_level cache_level,
2850748ef8763a Chris Wilson           2019-10-04  390  		  u32 flags,
2850748ef8763a Chris Wilson           2019-10-04  391  		  struct i915_vma_work *work)
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  392  {
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  393  	u32 bind_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  394  	u32 vma_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  395  
c2ea703dcafccf Thomas Hellström       2021-12-21  396  	lockdep_assert_held(&vma->vm->mutex);
aa149431279166 Chris Wilson           2017-02-25  397  	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
aa149431279166 Chris Wilson           2017-02-25  398  	GEM_BUG_ON(vma->size > vma->node.size);
aa149431279166 Chris Wilson           2017-02-25  399  
bbb8a9d7e000c9 Tvrtko Ursulin         2018-10-12  400  	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
aa149431279166 Chris Wilson           2017-02-25  401  					      vma->node.size,
aa149431279166 Chris Wilson           2017-02-25  402  					      vma->vm->total)))
aa149431279166 Chris Wilson           2017-02-25  403  		return -ENODEV;
aa149431279166 Chris Wilson           2017-02-25  404  
bbb8a9d7e000c9 Tvrtko Ursulin         2018-10-12  405  	if (GEM_DEBUG_WARN_ON(!flags))
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  406  		return -EINVAL;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  407  
2850748ef8763a Chris Wilson           2019-10-04  408  	bind_flags = flags;
2850748ef8763a Chris Wilson           2019-10-04  409  	bind_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  410  
4dd2fbbfb532d0 Chris Wilson           2019-09-11  411  	vma_flags = atomic_read(&vma->flags);
4dd2fbbfb532d0 Chris Wilson           2019-09-11  412  	vma_flags &= I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
aedbe0a1af585e Chris Wilson           2020-05-21  413  
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  414  	bind_flags &= ~vma_flags;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  415  	if (bind_flags == 0)
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  416  		return 0;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  417  
0b4d1f0e936e5c Maarten Lankhorst      2021-12-16  418  	GEM_BUG_ON(!atomic_read(&vma->pages_count));
fa3f46afd38cec Matthew Auld           2017-10-06  419  
6146e6da5c9617 Daniele Ceraolo Spurio 2017-01-20  420  	trace_i915_vma_bind(vma, bind_flags);
aedbe0a1af585e Chris Wilson           2020-05-21  421  	if (work && bind_flags & vma->vm->bind_async_flags) {
e3793468b4660a Chris Wilson           2020-01-30  422  		struct dma_fence *prev;
e3793468b4660a Chris Wilson           2020-01-30  423  
2850748ef8763a Chris Wilson           2019-10-04  424  		work->vma = vma;
2850748ef8763a Chris Wilson           2019-10-04  425  		work->cache_level = cache_level;
12b07256c22399 Chris Wilson           2020-07-03  426  		work->flags = bind_flags;
2850748ef8763a Chris Wilson           2019-10-04  427  
2850748ef8763a Chris Wilson           2019-10-04  428  		/*
2850748ef8763a Chris Wilson           2019-10-04  429  		 * Note we only want to chain up to the migration fence on
2850748ef8763a Chris Wilson           2019-10-04  430  		 * the pages (not the object itself). As we don't track that,
2850748ef8763a Chris Wilson           2019-10-04  431  		 * yet, we have to use the exclusive fence instead.
2850748ef8763a Chris Wilson           2019-10-04  432  		 *
2850748ef8763a Chris Wilson           2019-10-04  433  		 * Also note that we do not want to track the async vma as
2850748ef8763a Chris Wilson           2019-10-04  434  		 * part of the obj->resv->excl_fence as it only affects
2850748ef8763a Chris Wilson           2019-10-04  435  		 * execution and not content or object's backing store lifetime.
2850748ef8763a Chris Wilson           2019-10-04  436  		 */
e3793468b4660a Chris Wilson           2020-01-30  437  		prev = i915_active_set_exclusive(&vma->active, &work->base.dma);
30ca04e16cbeea Chris Wilson           2020-02-03  438  		if (prev) {
e3793468b4660a Chris Wilson           2020-01-30  439  			__i915_sw_fence_await_dma_fence(&work->base.chain,
e3793468b4660a Chris Wilson           2020-01-30  440  							prev,
e3793468b4660a Chris Wilson           2020-01-30  441  							&work->cb);
30ca04e16cbeea Chris Wilson           2020-02-03  442  			dma_fence_put(prev);
30ca04e16cbeea Chris Wilson           2020-02-03  443  		}
e3793468b4660a Chris Wilson           2020-01-30  444  
2850748ef8763a Chris Wilson           2019-10-04  445  		work->base.dma.error = 0; /* enable the queue_work() */
2850748ef8763a Chris Wilson           2019-10-04  446  
2850748ef8763a Chris Wilson           2019-10-04  447  		__i915_gem_object_pin_pages(vma->obj);
537457a979a02a Chris Wilson           2020-11-02  448  		work->pinned = i915_gem_object_get(vma->obj);
2850748ef8763a Chris Wilson           2019-10-04  449  	} else {
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  450  		if (vma->obj) {
f6c466b84cfa78 Maarten Lankhorst      2021-11-22 @451  			ret = i915_gem_object_wait_moving_fence(vma->obj, true);
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  452  			if (ret)
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  453  				return ret;
f6c466b84cfa78 Maarten Lankhorst      2021-11-22  454  		}
cd0452aa2a0d14 Chris Wilson           2020-07-29  455  		vma->ops->bind_vma(vma->vm, NULL, vma, cache_level, bind_flags);
2850748ef8763a Chris Wilson           2019-10-04  456  	}
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  457  
7938d61591d333 Tvrtko Ursulin         2021-10-19  458  	if (vma->obj)
7938d61591d333 Tvrtko Ursulin         2021-10-19  459  		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
7938d61591d333 Tvrtko Ursulin         2021-10-19  460  
4dd2fbbfb532d0 Chris Wilson           2019-09-11  461  	atomic_or(bind_flags, &vma->flags);
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  462  	return 0;
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  463  }
b42fe9ca0a1e2b Joonas Lahtinen        2016-11-11  464  

:::::: The code at line 451 was first introduced by commit
:::::: f6c466b84cfa78807b7f71b8adeaf209b4deb72f drm/i915: Add support for moving fence waiting

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
