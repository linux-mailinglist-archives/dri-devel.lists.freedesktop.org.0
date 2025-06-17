Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F3ADBEEA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 04:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311010E408;
	Tue, 17 Jun 2025 02:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8iNKa4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAED10E2AB;
 Tue, 17 Jun 2025 02:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750126114; x=1781662114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hkmxoAth24IUQdWeWg/PW1kvEopOf7zFgXKj55VjQDM=;
 b=l8iNKa4CTW7jGfkyH4hRqtpBYgvA7STYlnKIsxF77ZEThjCp5kwQVFfc
 1Zo4aCU/B+HQMUpP5Kd7IhsO9ULXdpW8cQ5LcjgyUtH8R7YaCQMzNbnZy
 +lkypGpaQePuQvk0pFnl6fViEpF6nNxkkZryHH1UdWs08v5T3tl/fzr/r
 fJUH26oEzc39TykclkRUzEd4Pn2d0tb1fvCiyfTOEwj2dzWSE2l4i4+Od
 95E5sIPzWiHkJ/XO4lOPNe7T2XkxnciCO5FdvhvXyyWXRXZ1iIFKOXPC7
 lkjwodZovDg3fCxJ3XAohMo22YB1MfObMdBHXvpiIdlcher+yF1kFOXmy w==;
X-CSE-ConnectionGUID: J+9T6E2TQce941cgTqKwkg==
X-CSE-MsgGUID: 1mG/XBUBRSyzxbIAWV/eeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52152772"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52152772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 19:08:31 -0700
X-CSE-ConnectionGUID: 7FqgPxr3S8OW7DheVNUUYQ==
X-CSE-MsgGUID: h7mtKchlQ8Op5htLGZgezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149093529"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2025 19:08:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uRLkQ-000FVc-34;
 Tue, 17 Jun 2025 02:08:26 +0000
Date: Tue, 17 Jun 2025 10:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 matthew.auld@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/6] drm/ttm: rename ttm_bo_put to _fini
Message-ID: <202506170945.w3e0EBJ6-lkp@intel.com>
References: <20250616130726.22863-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616130726.22863-4-christian.koenig@amd.com>
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
patch link:    https://lore.kernel.org/r/20250616130726.22863-4-christian.koenig%40amd.com
patch subject: [PATCH 4/6] drm/ttm: rename ttm_bo_put to _fini
config: riscv-randconfig-002-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170945.w3e0EBJ6-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170945.w3e0EBJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170945.w3e0EBJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_dma.h:30,
                    from drivers/gpu/drm/nouveau/nouveau_chan.c:31:
   drivers/gpu/drm/nouveau/nouveau_bo.h: In function 'nouveau_bo_fini':
>> drivers/gpu/drm/nouveau/nouveau_bo.h:60:2: error: implicit declaration of function 'ttm_bo_put'; did you mean 'ttm_bo_pin'? [-Werror=implicit-function-declaration]
      60 |  ttm_bo_put(&bo->bo);
         |  ^~~~~~~~~~
         |  ttm_bo_pin
   cc1: some warnings being treated as errors


vim +60 drivers/gpu/drm/nouveau/nouveau_bo.h

8be21a6402baa5 Ben Skeggs       2012-07-18  56  
bf32a3a1268638 Danilo Krummrich 2024-07-18  57  static inline void
bf32a3a1268638 Danilo Krummrich 2024-07-18  58  nouveau_bo_fini(struct nouveau_bo *bo)
8be21a6402baa5 Ben Skeggs       2012-07-18  59  {
bf32a3a1268638 Danilo Krummrich 2024-07-18 @60  	ttm_bo_put(&bo->bo);
8be21a6402baa5 Ben Skeggs       2012-07-18  61  }
8be21a6402baa5 Ben Skeggs       2012-07-18  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
