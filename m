Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05603C5CE8D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7528D10EA3D;
	Fri, 14 Nov 2025 11:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7cx6Wr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D95210E23D;
 Fri, 14 Nov 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763120673; x=1794656673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C6iS0bMosv9bMtQrB6VTtO2CE57nGf0I7IUZKqbCHsg=;
 b=R7cx6Wr+YNgy547ONGFQLSYmAyWZkUZqNO55RaRDdl2rX0tDTKjvGD2Q
 g/sNf1xdpu3QOFbQslA+aX84PySVJ2EPVj6kug6QBoLsdg/EdMVAl99JM
 26vBkWIwtQBqwjWov26WLInlh+no6qwytxG0SRDoX+GeQ0ggWcq/g1f70
 Ak5qq8u+o1v9Vxg5seRDrtlIk6WTDMWpP9x6KF+WtjwB1DTsTEaacNMjX
 C8HlCe7ShDkLTb8TjE4WPFGwzlQeZaTTMzAHTT8mOu9I20uVIkV4nCX43
 6RBJr37aFTa9Q1k5c69bB3SF2nsskE30JbuYKMU9bBpjpkYBwELDhkwJ3 g==;
X-CSE-ConnectionGUID: m5ZYAG4CRkG8+jOh3LWD/Q==
X-CSE-MsgGUID: KZlRsRBRQRSWI4NFs64+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76315367"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="76315367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 03:44:33 -0800
X-CSE-ConnectionGUID: k05ZyNWSRdSWUWWN+wzi4Q==
X-CSE-MsgGUID: k5dDaxgPQPehRRpgUwtnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="227107753"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 03:44:30 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vJsE7-0006XX-35;
 Fri, 14 Nov 2025 11:44:27 +0000
Date: Fri, 14 Nov 2025 19:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
Message-ID: <202511141921.NxnbQ4Zt-lkp@intel.com>
References: <20251113145332.16805-14-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113145332.16805-14-christian.koenig@amd.com>
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

[auto build test ERROR on next-20251113]
[cannot apply to drm-xe/drm-xe-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3 v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v3/20251113-235209
base:   next-20251113
patch link:    https://lore.kernel.org/r/20251113145332.16805-14-christian.koenig%40amd.com
patch subject: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
config: riscv-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141921.NxnbQ4Zt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141921.NxnbQ4Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141921.NxnbQ4Zt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c: In function 'amdkfd_fence_signal':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:162:9: error: implicit declaration of function 'dma_fence_lock_irqsafe'; did you mean 'dma_fence_lock_irqsave'? [-Werror=implicit-function-declaration]
     162 |         dma_fence_lock_irqsafe(f, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         dma_fence_lock_irqsave
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:162:41: error: expected ';' before 'if'
     162 |         dma_fence_lock_irqsafe(f, flags)
         |                                         ^
         |                                         ;
     163 |         if (fence->mm) {
         |         ~~                               
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:169:1: error: expected ';' before '}' token
     169 | }
         | ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:159:37: warning: unused variable 'fence' [-Wunused-variable]
     159 |         struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
         |                                     ^~~~~
   cc1: some warnings being treated as errors


vim +162 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c

   156	
   157	void amdkfd_fence_signal(struct dma_fence *f)
   158	{
 > 159		struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
   160		long flags;
   161	
 > 162		dma_fence_lock_irqsafe(f, flags)
   163		if (fence->mm) {
   164			mmdrop(fence->mm);
   165			fence->mm = NULL;
   166		}
   167		dma_fence_signal_locked(f);
   168		dma_fence_unlock_irqrestore(f, flags)
 > 169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
