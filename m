Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72689ADC092
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7EC10EA77;
	Tue, 17 Jun 2025 04:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCecL61i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EE510EA97;
 Tue, 17 Jun 2025 04:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750134527; x=1781670527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r+JlwcSVkr+3dCSAPh82FbMT/WtwIWWYDyDV7nZ6rqc=;
 b=gCecL61ikPeLcvbXHKWe0V49TZK8816mUWcWPeJjt2neTEcSP+O/hFSp
 MoUxuntYIDo4Jn44Prd4ZYUzhzzyFw2ae6udUuvSiJtGx+kmZwGE0GDVi
 N/ez1HcqxI0mUbyoB9QZIRiRolXZd/ost+hh9IijyPec6ZA7WT7gDYFRx
 Wlzv+I2oyne59rFFoSch3o63x2Gfvwcn37qe0g4H4LHe3/NNQbbEQxK0b
 zKrFY8mlntCWS8die2vmtWOvraNrS88ahmqUopSF/BHM/8js8hXXpVsaI
 L12DWoZIVXg8ZWWqzTvDD4YBZqKImFRjW6RpIh6jrLliZ7qg4C4QHkrHD g==;
X-CSE-ConnectionGUID: NOkDKzC6QD+6+y6G3hH9mw==
X-CSE-MsgGUID: RDnoloqpS+ChgZAX05f5hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52386681"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52386681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 21:28:46 -0700
X-CSE-ConnectionGUID: l7Cy+F8MRUS3XxF327Kqsg==
X-CSE-MsgGUID: LtY74Y6DQcuJ1/NV4lX+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="185915972"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2025 21:28:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uRNw8-000FaG-2C;
 Tue, 17 Jun 2025 04:28:40 +0000
Date: Tue, 17 Jun 2025 12:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/6] drm/ttm: replace TTMs refcount with the DRM refcount
Message-ID: <202506171254.EsodeP9U-lkp@intel.com>
References: <20250616130726.22863-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616130726.22863-6-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20250616]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-xe-stop-asserting-on-the-TTM-refcount/20250616-210818
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250616130726.22863-6-christian.koenig%40amd.com
patch subject: [PATCH 6/6] drm/ttm: replace TTMs refcount with the DRM refcount
config: x86_64-buildonly-randconfig-006-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171254.EsodeP9U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171254.EsodeP9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171254.EsodeP9U-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_adjust_lru':
>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:935:27: error: 'struct ttm_buffer_object' has no member named 'kref'
     935 |         if (!kref_read(&bo->kref))
         |                           ^~


vim +935 drivers/gpu/drm/i915/gem/i915_gem_ttm.c

213d5092776345 Thomas Hellström 2021-06-10   918  
3589fdbd3b2085 Thomas Hellström 2021-11-04   919  /**
3589fdbd3b2085 Thomas Hellström 2021-11-04   920   * i915_ttm_adjust_lru - Adjust an object's position on relevant LRU lists.
3589fdbd3b2085 Thomas Hellström 2021-11-04   921   * @obj: The object
3589fdbd3b2085 Thomas Hellström 2021-11-04   922   */
3589fdbd3b2085 Thomas Hellström 2021-11-04   923  void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
213d5092776345 Thomas Hellström 2021-06-10   924  {
213d5092776345 Thomas Hellström 2021-06-10   925  	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
7ae034590ceaef Matthew Auld     2021-10-18   926  	struct i915_ttm_tt *i915_tt =
7ae034590ceaef Matthew Auld     2021-10-18   927  		container_of(bo->ttm, typeof(*i915_tt), ttm);
ebd4a8ec7799b1 Matthew Auld     2021-10-18   928  	bool shrinkable =
ebd4a8ec7799b1 Matthew Auld     2021-10-18   929  		bo->ttm && i915_tt->filp && ttm_tt_is_populated(bo->ttm);
213d5092776345 Thomas Hellström 2021-06-10   930  
213d5092776345 Thomas Hellström 2021-06-10   931  	/*
213d5092776345 Thomas Hellström 2021-06-10   932  	 * Don't manipulate the TTM LRUs while in TTM bo destruction.
213d5092776345 Thomas Hellström 2021-06-10   933  	 * We're called through i915_ttm_delete_mem_notify().
213d5092776345 Thomas Hellström 2021-06-10   934  	 */
213d5092776345 Thomas Hellström 2021-06-10  @935  	if (!kref_read(&bo->kref))
213d5092776345 Thomas Hellström 2021-06-10   936  		return;
213d5092776345 Thomas Hellström 2021-06-10   937  
ebd4a8ec7799b1 Matthew Auld     2021-10-18   938  	/*
ebd4a8ec7799b1 Matthew Auld     2021-10-18   939  	 * We skip managing the shrinker LRU in set_pages() and just manage
ebd4a8ec7799b1 Matthew Auld     2021-10-18   940  	 * everything here. This does at least solve the issue with having
ebd4a8ec7799b1 Matthew Auld     2021-10-18   941  	 * temporary shmem mappings(like with evicted lmem) not being visible to
ebd4a8ec7799b1 Matthew Auld     2021-10-18   942  	 * the shrinker. Only our shmem objects are shrinkable, everything else
ebd4a8ec7799b1 Matthew Auld     2021-10-18   943  	 * we keep as unshrinkable.
ebd4a8ec7799b1 Matthew Auld     2021-10-18   944  	 *
ebd4a8ec7799b1 Matthew Auld     2021-10-18   945  	 * To make sure everything plays nice we keep an extra shrink pin in TTM
ebd4a8ec7799b1 Matthew Auld     2021-10-18   946  	 * if the underlying pages are not currently shrinkable. Once we release
ebd4a8ec7799b1 Matthew Auld     2021-10-18   947  	 * our pin, like when the pages are moved to shmem, the pages will then
ebd4a8ec7799b1 Matthew Auld     2021-10-18   948  	 * be added to the shrinker LRU, assuming the caller isn't also holding
ebd4a8ec7799b1 Matthew Auld     2021-10-18   949  	 * a pin.
ebd4a8ec7799b1 Matthew Auld     2021-10-18   950  	 *
ebd4a8ec7799b1 Matthew Auld     2021-10-18   951  	 * TODO: consider maybe also bumping the shrinker list here when we have
ebd4a8ec7799b1 Matthew Auld     2021-10-18   952  	 * already unpinned it, which should give us something more like an LRU.
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   953  	 *
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   954  	 * TODO: There is a small window of opportunity for this function to
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   955  	 * get called from eviction after we've dropped the last GEM refcount,
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   956  	 * but before the TTM deleted flag is set on the object. Avoid
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   957  	 * adjusting the shrinker list in such cases, since the object is
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   958  	 * not available to the shrinker anyway due to its zero refcount.
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   959  	 * To fix this properly we should move to a TTM shrinker LRU list for
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   960  	 * these objects.
ebd4a8ec7799b1 Matthew Auld     2021-10-18   961  	 */
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   962  	if (kref_get_unless_zero(&obj->base.refcount)) {
ebd4a8ec7799b1 Matthew Auld     2021-10-18   963  		if (shrinkable != obj->mm.ttm_shrinkable) {
ebd4a8ec7799b1 Matthew Auld     2021-10-18   964  			if (shrinkable) {
ebd4a8ec7799b1 Matthew Auld     2021-10-18   965  				if (obj->mm.madv == I915_MADV_WILLNEED)
ebd4a8ec7799b1 Matthew Auld     2021-10-18   966  					__i915_gem_object_make_shrinkable(obj);
ebd4a8ec7799b1 Matthew Auld     2021-10-18   967  				else
ebd4a8ec7799b1 Matthew Auld     2021-10-18   968  					__i915_gem_object_make_purgeable(obj);
ebd4a8ec7799b1 Matthew Auld     2021-10-18   969  			} else {
ebd4a8ec7799b1 Matthew Auld     2021-10-18   970  				i915_gem_object_make_unshrinkable(obj);
ebd4a8ec7799b1 Matthew Auld     2021-10-18   971  			}
ebd4a8ec7799b1 Matthew Auld     2021-10-18   972  
ebd4a8ec7799b1 Matthew Auld     2021-10-18   973  			obj->mm.ttm_shrinkable = shrinkable;
ebd4a8ec7799b1 Matthew Auld     2021-10-18   974  		}
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   975  		i915_gem_object_put(obj);
d3cb30f8dcbcb7 Thomas Hellström 2021-11-10   976  	}
ebd4a8ec7799b1 Matthew Auld     2021-10-18   977  
213d5092776345 Thomas Hellström 2021-06-10   978  	/*
213d5092776345 Thomas Hellström 2021-06-10   979  	 * Put on the correct LRU list depending on the MADV status
213d5092776345 Thomas Hellström 2021-06-10   980  	 */
213d5092776345 Thomas Hellström 2021-06-10   981  	spin_lock(&bo->bdev->lru_lock);
ebd4a8ec7799b1 Matthew Auld     2021-10-18   982  	if (shrinkable) {
7ae034590ceaef Matthew Auld     2021-10-18   983  		/* Try to keep shmem_tt from being considered for shrinking. */
7ae034590ceaef Matthew Auld     2021-10-18   984  		bo->priority = TTM_MAX_BO_PRIORITY - 1;
7ae034590ceaef Matthew Auld     2021-10-18   985  	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
213d5092776345 Thomas Hellström 2021-06-10   986  		bo->priority = I915_TTM_PRIO_PURGE;
213d5092776345 Thomas Hellström 2021-06-10   987  	} else if (!i915_gem_object_has_pages(obj)) {
213d5092776345 Thomas Hellström 2021-06-10   988  		bo->priority = I915_TTM_PRIO_NO_PAGES;
ba2c5d15022a56 Matthew Auld     2022-02-09   989  	} else {
9373505967ffc1 Matthew Auld     2022-02-28   990  		struct ttm_resource_manager *man =
9373505967ffc1 Matthew Auld     2022-02-28   991  			ttm_manager_type(bo->bdev, bo->resource->mem_type);
9373505967ffc1 Matthew Auld     2022-02-28   992  
9373505967ffc1 Matthew Auld     2022-02-28   993  		/*
9373505967ffc1 Matthew Auld     2022-02-28   994  		 * If we need to place an LMEM resource which doesn't need CPU
9373505967ffc1 Matthew Auld     2022-02-28   995  		 * access then we should try not to victimize mappable objects
9373505967ffc1 Matthew Auld     2022-02-28   996  		 * first, since we likely end up stealing more of the mappable
54296aa4cfe718 Nitin Gote       2025-01-20   997  		 * portion. And likewise when we try to find space for a mappable
9373505967ffc1 Matthew Auld     2022-02-28   998  		 * object, we know not to ever victimize objects that don't
9373505967ffc1 Matthew Auld     2022-02-28   999  		 * occupy any mappable pages.
9373505967ffc1 Matthew Auld     2022-02-28  1000  		 */
9373505967ffc1 Matthew Auld     2022-02-28  1001  		if (i915_ttm_cpu_maps_iomem(bo->resource) &&
9373505967ffc1 Matthew Auld     2022-02-28  1002  		    i915_ttm_buddy_man_visible_size(man) < man->size &&
9373505967ffc1 Matthew Auld     2022-02-28  1003  		    !(obj->flags & I915_BO_ALLOC_GPU_ONLY))
9373505967ffc1 Matthew Auld     2022-02-28  1004  			bo->priority = I915_TTM_PRIO_NEEDS_CPU_ACCESS;
9373505967ffc1 Matthew Auld     2022-02-28  1005  		else
ba2c5d15022a56 Matthew Auld     2022-02-09  1006  			bo->priority = I915_TTM_PRIO_HAS_PAGES;
213d5092776345 Thomas Hellström 2021-06-10  1007  	}
213d5092776345 Thomas Hellström 2021-06-10  1008  
fee2ede155423b Christian König  2022-01-24  1009  	ttm_bo_move_to_lru_tail(bo);
213d5092776345 Thomas Hellström 2021-06-10  1010  	spin_unlock(&bo->bdev->lru_lock);
213d5092776345 Thomas Hellström 2021-06-10  1011  }
213d5092776345 Thomas Hellström 2021-06-10  1012  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
