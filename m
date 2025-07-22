Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1BB0E557
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 23:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA25810E715;
	Tue, 22 Jul 2025 21:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn9MNTMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9810E715
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 21:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753219187; x=1784755187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VAFhRCJQknowV+AypDyaME1Ab2ilgI4tc2/Wbqr0Ux0=;
 b=Qn9MNTMFYf9Q4hcA7gdhoSzqNaoAmKKoHMJJ5BFgNWJoAQNvYjATr5Mt
 NQPka9RUVpQBqVR4DEwW3II2MmDdbgCuRRlY6SFnBk/d+3ZERFXGxCOPp
 +sBNFbgeKTkiAk/m5OS0g9saP+VrcBCAVlMecrPbJsnAXSRFTS9UtzsBQ
 WOM7XqeY74qKfI26KIoYOaE6py8vHl52UOGaG0H/2Ye+48Z+uXbH6tN4q
 wVr8fVlg0AfTfNhgfsIPCSVE89aVPaqP3rhrk4+at3p84z1/Nm7OFNCLS
 bXCeW3fxm3hVuHUEXiswa35th4ryjrcqSeXvleUsenDfmbGz1bU52QHkE g==;
X-CSE-ConnectionGUID: ahKU3RTnQY+x2GUCpLmtYw==
X-CSE-MsgGUID: rHtXpq0ZQIC3I5wxkzcwOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59286778"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="59286778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 14:19:46 -0700
X-CSE-ConnectionGUID: QPx254goTECh3UVjxe55jg==
X-CSE-MsgGUID: BMGHljmHRY+SotKzCX9Gdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="190217200"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 22 Jul 2025 14:19:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ueKOj-000IiB-05;
 Tue, 22 Jul 2025 21:19:41 +0000
Date: Wed, 23 Jul 2025 05:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dave Chinner <david@fromorbit.com>,
 Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
Message-ID: <202507230300.pUkL5SQT-lkp@intel.com>
References: <20250722014942.1878844-12-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722014942.1878844-12-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20250722-104402
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250722014942.1878844-12-airlied%40gmail.com
patch subject: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
config: i386-buildonly-randconfig-006-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230300.pUkL5SQT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230300.pUkL5SQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230300.pUkL5SQT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.c:665:7: error: no member named 'memcg_data' in 'struct page'
     665 |                         p->memcg_data = 0;
         |                         ~  ^
   drivers/gpu/drm/ttm/ttm_pool.c:1132:11: error: no member named 'memcg_data' in 'struct page'
    1132 |                                 page->memcg_data = 0;
         |                                 ~~~~  ^
   2 errors generated.


vim +665 drivers/gpu/drm/ttm/ttm_pool.c

   617	
   618	/*
   619	 * When restoring, restore backed-up content to the newly allocated page and
   620	 * if successful, populate the page-table and dma-address arrays.
   621	 */
   622	static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
   623					   struct file *backup,
   624					   const struct ttm_operation_ctx *ctx,
   625					   struct ttm_pool_alloc_state *alloc)
   626	
   627	{
   628		pgoff_t i, nr = 1UL << restore->order;
   629		struct page **first_page = alloc->pages;
   630		struct page *p;
   631		int ret = 0;
   632	
   633		for (i = restore->restored_pages; i < nr; ++i) {
   634			p = first_page[i];
   635			if (ttm_backup_page_ptr_is_handle(p)) {
   636				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   637	
   638				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
   639				    should_fail(&backup_fault_inject, 1)) {
   640					ret = -EINTR;
   641					break;
   642				}
   643	
   644				if (handle == 0) {
   645					restore->restored_pages++;
   646					continue;
   647				}
   648	
   649				ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
   650							   handle, ctx->interruptible);
   651				if (ret)
   652					break;
   653	
   654				ttm_backup_drop(backup, handle);
   655			} else if (p) {
   656				/*
   657				 * We could probably avoid splitting the old page
   658				 * using clever logic, but ATM we don't care, as
   659				 * we prioritize releasing memory ASAP. Note that
   660				 * here, the old retained page is always write-back
   661				 * cached.
   662				 */
   663				ttm_pool_split_for_swap(restore->pool, p);
   664				copy_highpage(restore->alloced_page + i, p);
 > 665				p->memcg_data = 0;
   666				__free_pages(p, 0);
   667			}
   668	
   669			restore->restored_pages++;
   670			first_page[i] = ttm_backup_handle_to_page_ptr(0);
   671		}
   672	
   673		if (ret) {
   674			if (!restore->restored_pages) {
   675				dma_addr_t *dma_addr = alloc->dma_addr ? &restore->first_dma : NULL;
   676	
   677				ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
   678							dma_addr, restore->page_caching);
   679				restore->restored_pages = nr;
   680			}
   681			return ret;
   682		}
   683	
   684		ttm_pool_allocated_page_commit(restore->alloced_page, restore->first_dma,
   685					       alloc, nr);
   686		if (restore->page_caching == alloc->tt_caching || PageHighMem(restore->alloced_page))
   687			alloc->caching_divide = alloc->pages;
   688		restore->snapshot_alloc = *alloc;
   689		restore->alloced_pages += nr;
   690	
   691		return 0;
   692	}
   693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
