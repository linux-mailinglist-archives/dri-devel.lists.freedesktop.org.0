Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FC4C9B7F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EE810E758;
	Wed,  2 Mar 2022 02:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7875010E73A;
 Wed,  2 Mar 2022 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646189497; x=1677725497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M2BQYMznyU7aOg4MP1mFWA9eXToGXbQIU8tLE/O6ObA=;
 b=HY2zczjxubI1QoTXbfAPFnBm2uCjVA4CNIVq6LSUkuuaiTWwfGPYs/4p
 NPbT1cfLoSZvTWBeauUcVGB/xQN2mStIDCjy06pU6OAMryIBL/WNPDTeC
 IPs0Ff+RfGCf1YQrlWKIOk0k2oR0q9Spmm9zC31GTX/Pdus/pYOPi7SNW
 zaW9Yz485aHbHEymDUXofSCL4dhPpvXG59vuHQ9wDNZ6efKIMibaoJKZz
 NrcXdSjluu+WgBI6zZAJfsoWt0MzLeb2whWvHBQEicv8CWo0sc93ZPbgx
 hsJNXlB0VsRyrBCLx4vd4pu3HByj5LeeAAMXQGI6V1AbCPBEgz/5TUYp6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253026649"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253026649"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 18:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="778716271"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 01 Mar 2022 18:51:34 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nPF5R-0000wQ-JS; Wed, 02 Mar 2022 02:51:33 +0000
Date: Wed, 2 Mar 2022 10:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v9] drm/amdgpu: add drm buddy support to amdgpu
Message-ID: <202203020700.yfCUTgQZ-lkp@intel.com>
References: <20220301203838.4463-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301203838.4463-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: kbuild-all@lists.01.org, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arunpravin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arunpravin/drm-amdgpu-add-drm-buddy-support-to-amdgpu/20220302-043936
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: ia64-randconfig-r011-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020700.yfCUTgQZ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/22a06757ae067e29c09a9d95eaf2b9053833740f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin/drm-amdgpu-add-drm-buddy-support-to-amdgpu/20220302-043936
        git checkout 22a06757ae067e29c09a9d95eaf2b9053833740f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function 'amdgpu_vram_mgr_new':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:360:28: warning: variable 'mem_bytes' set but not used [-Wunused-but-set-variable]
     360 |         u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
         |                            ^~~~~~~~~


vim +/mem_bytes +360 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

   343	
   344	/**
   345	 * amdgpu_vram_mgr_new - allocate new ranges
   346	 *
   347	 * @man: TTM memory type manager
   348	 * @tbo: TTM BO we need this range for
   349	 * @place: placement flags and restrictions
   350	 * @res: the resulting mem object
   351	 *
   352	 * Allocate VRAM for the given BO.
   353	 */
   354	static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
   355				       struct ttm_buffer_object *tbo,
   356				       const struct ttm_place *place,
   357				       struct ttm_resource **res)
   358	{
   359		unsigned long lpfn, pages_per_node, pages_left, pages;
 > 360		u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
   361		struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
   362		struct amdgpu_device *adev = to_amdgpu_device(mgr);
   363		struct amdgpu_vram_mgr_node *node;
   364		struct drm_buddy *mm = &mgr->mm;
   365		struct drm_buddy_block *block;
   366		unsigned i;
   367		int r;
   368	
   369		lpfn = place->lpfn;
   370		if (!lpfn)
   371			lpfn = man->size >> PAGE_SHIFT;
   372	
   373		max_bytes = adev->gmc.mc_vram_size;
   374		if (tbo->type != ttm_bo_type_kernel)
   375			max_bytes -= AMDGPU_VM_RESERVED_VRAM;
   376	
   377		mem_bytes = tbo->base.size;
   378		if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
   379			pages_per_node = ~0ul;
   380		} else {
   381	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
   382			pages_per_node = HPAGE_PMD_NR;
   383	#else
   384			/* default to 2MB */
   385			pages_per_node = 2UL << (20UL - PAGE_SHIFT);
   386	#endif
   387			pages_per_node = max_t(uint32_t, pages_per_node,
   388					       tbo->page_alignment);
   389		}
   390	
   391		node = kzalloc(sizeof(*node), GFP_KERNEL);
   392		if (!node)
   393			return -ENOMEM;
   394	
   395		ttm_resource_init(tbo, place, &node->base);
   396	
   397		/* bail out quickly if there's likely not enough VRAM for this BO */
   398		if (ttm_resource_manager_usage(man) > max_bytes) {
   399			r = -ENOSPC;
   400			goto error_fini;
   401		}
   402	
   403		INIT_LIST_HEAD(&node->blocks);
   404	
   405		if (place->flags & TTM_PL_FLAG_TOPDOWN)
   406			node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
   407	
   408		if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
   409			/* Allocate blocks in desired range */
   410			node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
   411	
   412		BUG_ON(!node->base.num_pages);
   413		pages_left = node->base.num_pages;
   414	
   415		i = 0;
   416		while (pages_left) {
   417			if (tbo->page_alignment)
   418				min_page_size = tbo->page_alignment << PAGE_SHIFT;
   419			else
   420				min_page_size = mgr->default_page_size;
   421	
   422			/* Limit maximum size to 2GB due to SG table limitations */
   423			pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
   424	
   425			if (pages >= pages_per_node)
   426				min_page_size = pages_per_node << PAGE_SHIFT;
   427	
   428			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
   429				pages = roundup_pow_of_two(pages);
   430				min_page_size = pages << PAGE_SHIFT;
   431	
   432				if (pages > lpfn)
   433					lpfn = pages;
   434			}
   435	
   436			BUG_ON(min_page_size < mm->chunk_size);
   437	
   438			mutex_lock(&mgr->lock);
   439			r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
   440						   (u64)lpfn << PAGE_SHIFT,
   441						   (u64)pages << PAGE_SHIFT,
   442						   min_page_size,
   443						   &node->blocks,
   444						   node->flags);
   445			mutex_unlock(&mgr->lock);
   446			if (unlikely(r))
   447				goto error_free_blocks;
   448	
   449			++i;
   450	
   451			if (pages > pages_left)
   452				pages_left = 0;
   453			else
   454				pages_left -= pages;
   455		}
   456	
   457		/* Free unused pages for contiguous allocation */
   458		if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
   459			u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
   460	
   461			mutex_lock(&mgr->lock);
   462			drm_buddy_block_trim(mm,
   463					     actual_size,
   464					     &node->blocks);
   465			mutex_unlock(&mgr->lock);
   466		}
   467	
   468		list_for_each_entry(block, &node->blocks, link)
   469			vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
   470	
   471		block = amdgpu_get_node(&node->blocks);
   472		if (!block) {
   473			r = -EINVAL;
   474			goto error_fini;
   475		}
   476	
   477		node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
   478	
   479		if (i == 1 && place->flags & TTM_PL_FLAG_CONTIGUOUS)
   480			node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
   481	
   482		if (adev->gmc.xgmi.connected_to_cpu)
   483			node->base.bus.caching = ttm_cached;
   484		else
   485			node->base.bus.caching = ttm_write_combined;
   486	
   487		atomic64_add(vis_usage, &mgr->vis_usage);
   488		*res = &node->base;
   489		return 0;
   490	
   491	error_free_blocks:
   492		mutex_lock(&mgr->lock);
   493		drm_buddy_free_list(mm, &node->blocks);
   494		mutex_unlock(&mgr->lock);
   495	error_fini:
   496		ttm_resource_fini(man, &node->base);
   497		kfree(node);
   498	
   499		return r;
   500	}
   501	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
