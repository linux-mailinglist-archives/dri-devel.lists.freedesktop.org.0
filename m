Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C932173C295
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3303910E6B6;
	Fri, 23 Jun 2023 21:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DCD10E6C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687555281; x=1719091281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1NZCb4gWGdd0WhW1Zj8/OelwVm3eKJu8RwJk2HlertU=;
 b=KEQnC89E9ipYslz6qdhvLSJk5f0AOKZMt2aTfssre6is6k6xgDs77t5M
 OhA9jvjU560T0l25ehhEn5h95YlUVOF5Xsh8baSUsYWVBtVelUhPjtMw8
 nXxFlwQwH1e5xG3v36UdCIwv5Vr278pzn3qhIKIftzf+Jj7NLsVrp9YOW
 NtNuLYvrIVtqwD8m7/P9nsd6W+hoDMtmkCiVCoi8oXedRHVWDwFuty1nJ
 Hz7FOeTetq2Xbf42+J3Y3Q+bXtp0UIYwrl1GLMjCvKTSoCIWIzUQDDCnb
 mhwfKfNyvrRxP8GIGcoc/YoPVvFtTHMKQBJHWLQUzb7ii9dHzfg1cvFqx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359729602"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="359729602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 14:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="785478007"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; d="scan'208";a="785478007"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2023 14:21:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qCoDW-0008XH-2a;
 Fri, 23 Jun 2023 21:21:18 +0000
Date: Sat, 24 Jun 2023 05:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
Message-ID: <202306240538.Mz3kjtT7-lkp@intel.com>
References: <20230623200113.62051-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623200113.62051-1-Yunxiang.Li@amd.com>
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunxiang,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230624-040209/Yunxiang-Li/drm-amdgpu-fix-missing-fence-reserve-in-amdgpu_vm_sdma_commit/20230622-002915
base:   the 2th patch of https://lore.kernel.org/r/20230621162652.10875-3-Yunxiang.Li%40amd.com
patch link:    https://lore.kernel.org/r/20230623200113.62051-1-Yunxiang.Li%40amd.com
patch subject: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
config: m68k-randconfig-r002-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240538.Mz3kjtT7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240538.Mz3kjtT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240538.Mz3kjtT7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-resv.c: In function 'dma_resv_add_fence':
>> drivers/dma-buf/dma-resv.c:326: error: unterminated #else
     326 | #ifdef CONFIG_DEBUG_MUTEXES
         | 
   drivers/dma-buf/dma-resv.c:327:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     327 |         else
         |         ^~~~
   drivers/dma-buf/dma-resv.c:327:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> drivers/dma-buf/dma-resv.c:328:17: error: expected declaration or statement at end of input
     328 |                 WARN_ON(1); // missing fence slot allocation
         |                 ^~~~~~~


vim +326 drivers/dma-buf/dma-resv.c

   274	
   275	/**
   276	 * dma_resv_add_fence - Add a fence to the dma_resv obj
   277	 * @obj: the reservation object
   278	 * @fence: the fence to add
   279	 * @usage: how the fence is used, see enum dma_resv_usage
   280	 *
   281	 * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
   282	 * dma_resv_reserve_fences() has been called.
   283	 *
   284	 * See also &dma_resv.fence for a discussion of the semantics.
   285	 */
   286	void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
   287				enum dma_resv_usage usage)
   288	{
   289		struct dma_resv_list *fobj;
   290		struct dma_fence *old;
   291		unsigned int i, count;
   292	
   293		dma_fence_get(fence);
   294	
   295		dma_resv_assert_held(obj);
   296	
   297		/* Drivers should not add containers here, instead add each fence
   298		 * individually.
   299		 */
   300		WARN_ON(dma_fence_is_container(fence));
   301	
   302	retry:
   303		fobj = dma_resv_fences_list(obj);
   304		count = fobj->num_fences;
   305	
   306		for (i = 0; i < count; ++i) {
   307			enum dma_resv_usage old_usage;
   308	
   309			dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
   310			if ((old->context == fence->context && old_usage >= usage &&
   311			     dma_fence_is_later(fence, old)) ||
   312			    dma_fence_is_signaled(old)) {
   313				dma_resv_list_set(fobj, i, fence, usage);
   314				dma_fence_put(old);
   315				return;
   316			}
   317		}
   318	
   319		if (WARN_ON(fobj->num_fences == fobj->max_fences)) {
   320			// try our best to avoid memory corruption
   321			dma_resv_reserve_fences(obj, 1);
   322			goto retry;
   323		}
   324		if (fobj->reserved_fences)
   325			fobj->reserved_fences -= 1;
 > 326	#ifdef CONFIG_DEBUG_MUTEXES
   327		else
 > 328			WARN_ON(1); // missing fence slot allocation
   329	#else
   330		count++;
   331	
   332		dma_resv_list_set(fobj, i, fence, usage);
   333		/* pointer update must be visible before we extend the num_fences */
   334		smp_store_mb(fobj->num_fences, count);
   335	}
   336	EXPORT_SYMBOL(dma_resv_add_fence);
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
