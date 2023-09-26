Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6B7AE445
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 05:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD4E10E34A;
	Tue, 26 Sep 2023 03:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6010E34A;
 Tue, 26 Sep 2023 03:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695700069; x=1727236069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3uYymf0VfDy0xuYgBqvrUXML/8OACWjJCk2SYlYvO3s=;
 b=LLWuqm3abvrXR6p2TlWQVEnk0qusUg6JtZmAaGNE6G8dUbR2lSmi7qde
 QD+eR8Z1P7tXpL4Wk4WVjTGhjHwfnyyXxeEG7QeJhWJPmoL96nMRjIvVS
 ZVz46nLFPSjFbxqWsINAqyYrilaFn/jj681T6ZUqxBmq6VUteJuqUnad3
 lE1bMGrhX5MMr0FivY8RXi3YiEpxbq0nuhfm1MR6A041M2PpD0kTRZvWH
 RokaOFR8OoNtj6dScbBblaAPC28xqAacPishfn7pvTTIkmH5G0/cqc946
 hZyFTe0mHYHkqFn0WzqVoGOfhh7pnsrUmrx6NWgCNBZs3YTmdlERurYGW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412391907"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="412391907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 20:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748658717"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="748658717"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 25 Sep 2023 20:47:45 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkz30-0002NJ-2B;
 Tue, 26 Sep 2023 03:47:42 +0000
Date: Tue, 26 Sep 2023 11:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
Message-ID: <202309261109.t06eiy08-lkp@intel.com>
References: <20230925171048.19245-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925171048.19245-1-nirmoy.das@intel.com>
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
Cc: andi.shyti@linux.intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 oe-kbuild-all@lists.linux.dev, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nirmoy-Das/drm-i915-gem-Make-i915_gem_shrinker-multi-gt-aware/20230926-020533
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230925171048.19245-1-nirmoy.das%40intel.com
patch subject: [PATCH v3] drm/i915/gem: Make i915_gem_shrinker multi-gt aware
config: i386-randconfig-016-20230926 (https://download.01.org/0day-ci/archive/20230926/202309261109.t06eiy08-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261109.t06eiy08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261109.t06eiy08-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c: In function 'i915_gem_shrink':
>> drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:152:12: error: suggest explicit braces to avoid ambiguous 'else' [-Werror=dangling-else]
     152 |         if (shrink & I915_SHRINK_ACTIVE)
         |            ^
   cc1: all warnings being treated as errors


vim +/else +152 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c

2d6692e642e7ca drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2019-04-20   75  
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   76  /**
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   77   * i915_gem_shrink - Shrink buffer object caches
772f7bb75dffd4 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-04-21   78   * @ww: i915 gem ww acquire ctx, or NULL
56fa4bf2b2f084 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-11-23   79   * @i915: i915 device
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   80   * @target: amount of memory to make available, in pages
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06   81   * @nr_scanned: optional output for number of pages scanned (incremental)
70972f51819a22 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-12   82   * @shrink: control flags for selecting cache types
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   83   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   84   * This function is the main interface to the shrinker. It will try to release
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   85   * up to @target pages of main memory backing storage from buffer objects.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   86   * Selection of the specific caches can be done with @flags. This is e.g. useful
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   87   * when purgeable objects should be removed from caches preferentially.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   88   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   89   * Note that it's not guaranteed that released amount is actually available as
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   90   * free system memory - the pages might still be in-used to due to other reasons
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   91   * (like cpu mmaps) or the mm core has reused them before we could grab them.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   92   * Therefore code that needs to explicitly shrink buffer objects caches (e.g. to
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   93   * avoid deadlocks in memory reclaim) must fall back to i915_gem_shrink_all().
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   94   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   95   * Also note that any kind of pinning (both per-vma address space pins and
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   96   * backing storage pins at the buffer object level) result in the shrinker code
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   97   * having to skip the object.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   98   *
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18   99   * Returns:
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  100   * The number of pages of backing storage actually released.
eb0b44adc08c0b drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  101   */
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  102  unsigned long
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  103  i915_gem_shrink(struct i915_gem_ww_ctx *ww,
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  104  		struct drm_i915_private *i915,
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06  105  		unsigned long target,
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06  106  		unsigned long *nr_scanned,
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  107  		unsigned int shrink)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  108  {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  109  	const struct {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  110  		struct list_head *list;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  111  		unsigned int bit;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  112  	} phases[] = {
3b4fa9640ccded drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-05-30  113  		{ &i915->mm.purge_list, ~0u },
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-12  114  		{
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-12  115  			&i915->mm.shrink_list,
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-12  116  			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND
ecab9be174d98f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-12  117  		},
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  118  		{ NULL, 0 },
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  119  	}, *phase;
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2019-01-14  120  	intel_wakeref_t wakeref = 0;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  121  	unsigned long count = 0;
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06  122  	unsigned long scanned = 0;
3f9a0aec85874f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Jonathan Cavitt        2023-09-25  123  	int err = 0, i = 0;
3f9a0aec85874f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Jonathan Cavitt        2023-09-25  124  	struct intel_gt *gt;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  125  
bc6f80cce9ae7c drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-04-26  126  	/* CHV + VTD workaround use stop_machine(); need to trylock vm->mutex */
bc6f80cce9ae7c drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-04-26  127  	bool trylock_vm = !ww && intel_vm_no_concurrent_access_wa(i915);
bc6f80cce9ae7c drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-04-26  128  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  129  	trace_i915_gem_shrink(i915, target, shrink);
3abafa539d2c17 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-10-01  130  
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  131  	/*
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  132  	 * Unbinding of objects will require HW access; Let us not wake the
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  133  	 * device just to recover a little memory. If absolutely necessary,
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  134  	 * we will force the wake during oom-notifier.
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  135  	 */
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  136  	if (shrink & I915_SHRINK_BOUND) {
d858d5695f3897 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Daniele Ceraolo Spurio 2019-06-13  137  		wakeref = intel_runtime_pm_get_if_in_use(&i915->runtime_pm);
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2019-01-14  138  		if (!wakeref)
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  139  			shrink &= ~I915_SHRINK_BOUND;
538ef96b9dae7f drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2019-01-14  140  	}
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  141  
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  142  	/*
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  143  	 * When shrinking the active list, we should also consider active
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  144  	 * contexts. Active contexts are pinned until they are retired, and
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  145  	 * so can not be simply unbound to retire and unpin their pages. To
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  146  	 * shrink the contexts, we must wait until the gpu is idle and
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  147  	 * completed its switch to the kernel context. In short, we do
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  148  	 * not have a good mechanism for idling a specific context, but
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  149  	 * what we can do is give them a kick so that we do not keep idle
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  150  	 * contexts around longer than is necessary.
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  151  	 */
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08 @152  	if (shrink & I915_SHRINK_ACTIVE)
3f9a0aec85874f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Jonathan Cavitt        2023-09-25  153  		for_each_gt(gt, i915, i)
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  154  			/* Retire requests to unpin all idle contexts */
3f9a0aec85874f drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Jonathan Cavitt        2023-09-25  155  			intel_gt_retire_requests(gt);
09137e94543761 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2020-07-08  156  
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  157  	/*
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  158  	 * As we may completely rewrite the (un)bound list whilst unbinding
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  159  	 * (due to retiring requests) we have to strictly process only
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  160  	 * one element of the list at the time, and recheck the list
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  161  	 * on every iteration.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  162  	 *
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  163  	 * In particular, we must hold a reference whilst removing the
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  164  	 * object as we may end up waiting for and/or retiring the objects.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  165  	 * This might release the final reference (held by the active list)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  166  	 * and result in the object being freed from under us. This is
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  167  	 * similar to the precautions the eviction code must take whilst
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  168  	 * removing objects.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  169  	 *
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  170  	 * Also note that although these lists do not hold a reference to
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  171  	 * the object we can safely grab one here: The final object
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  172  	 * unreferencing and the bound_list are both protected by the
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  173  	 * dev->struct_mutex and so we won't ever be able to observe an
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  174  	 * object on the bound_list with a reference count equals 0.
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  175  	 */
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  176  	for (phase = phases; phase->list; phase++) {
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  177  		struct list_head still_in_list;
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-07-26  178  		struct drm_i915_gem_object *obj;
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  179  		unsigned long flags;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  180  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  181  		if ((shrink & phase->bit) == 0)
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  182  			continue;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  183  
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  184  		INIT_LIST_HEAD(&still_in_list);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  185  
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  186  		/*
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  187  		 * We serialize our access to unreferenced objects through
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  188  		 * the use of the struct_mutex. While the objects are not
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  189  		 * yet freed (due to RCU then a workqueue) we still want
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  190  		 * to be able to shrink their pages, so they remain on
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  191  		 * the unbound/bound list until actually freed.
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  192  		 */
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  193  		spin_lock_irqsave(&i915->mm.obj_lock, flags);
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-07-26  194  		while (count < target &&
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-07-26  195  		       (obj = list_first_entry_or_null(phase->list,
2a1d775201081c drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-07-26  196  						       typeof(*obj),
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  197  						       mm.link))) {
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  198  			list_move_tail(&obj->mm.link, &still_in_list);
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  199  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  200  			if (shrink & I915_SHRINK_VMAPS &&
a4f5ea64f0a818 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-10-28  201  			    !is_vmalloc_addr(obj->mm.mapping))
eae2c43b1233f8 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-04-08  202  				continue;
eae2c43b1233f8 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-04-08  203  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  204  			if (!(shrink & I915_SHRINK_ACTIVE) &&
c03467ba40f783 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-07-03  205  			    i915_gem_object_is_framebuffer(obj))
5763ff04dc4ebd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-10-01  206  				continue;
5763ff04dc4ebd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-10-01  207  
c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-12-04  208  			if (!can_release_pages(obj))
c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-12-04  209  				continue;
c1a415e261aad0 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2015-12-04  210  
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-18  211  			if (!kref_get_unless_zero(&obj->base.refcount))
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-18  212  				continue;
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-18  213  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  214  			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  215  
7b7a119e8546e2 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-10-31  216  			/* May arrive from get_pages on another bo */
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  217  			if (!ww) {
d8be1357edc891 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-12-16  218  				if (!i915_gem_object_trylock(obj, NULL))
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  219  					goto skip;
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  220  			} else {
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  221  				err = i915_gem_object_lock(obj, ww);
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  222  				if (err)
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  223  					goto skip;
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  224  			}
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  225  
e4e80625300390 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-12-16  226  			if (drop_pages(obj, shrink, trylock_vm) &&
e4e80625300390 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-12-16  227  			    !__i915_gem_object_put_pages(obj) &&
e4e80625300390 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-12-16  228  			    !try_to_writeback(obj, shrink))
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  229  				count += obj->base.size >> PAGE_SHIFT;
e4e80625300390 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-12-16  230  
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  231  			if (!ww)
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  232  				i915_gem_object_unlock(obj);
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-18  233  
4e773c3a8a693e drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-13  234  			scanned += obj->base.size >> PAGE_SHIFT;
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  235  skip:
0bd6cb6b58f733 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-18  236  			i915_gem_object_put(obj);
f2123818ffad03 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-10-16  237  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  238  			spin_lock_irqsave(&i915->mm.obj_lock, flags);
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  239  			if (err)
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  240  				break;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  241  		}
535972771d8c99 drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2016-11-01  242  		list_splice_tail(&still_in_list, phase->list);
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  243  		spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
cf41a8f1dc1e47 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-03-23  244  		if (err)
239f3c2ee18376 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-07-28  245  			break;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  246  	}
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  247  
a8cff4c8283af3 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Chris Wilson           2019-06-10  248  	if (shrink & I915_SHRINK_BOUND)
d858d5695f3897 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Daniele Ceraolo Spurio 2019-06-13  249  		intel_runtime_pm_put(&i915->runtime_pm, wakeref);
178a30c90ac74e drivers/gpu/drm/i915/i915_gem_shrinker.c     Praveen Paneri         2016-05-02  250  
239f3c2ee18376 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-07-28  251  	if (err)
239f3c2ee18376 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-07-28  252  		return err;
239f3c2ee18376 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c Maarten Lankhorst      2021-07-28  253  
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06  254  	if (nr_scanned)
912d572d63b8cd drivers/gpu/drm/i915/i915_gem_shrinker.c     Chris Wilson           2017-09-06  255  		*nr_scanned += scanned;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  256  	return count;
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  257  }
be6a0376950475 drivers/gpu/drm/i915/i915_gem_shrinker.c     Daniel Vetter          2015-03-18  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
