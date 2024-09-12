Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C1977415
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268610EC5A;
	Thu, 12 Sep 2024 22:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqbOGY5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104B10EC5A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726178668; x=1757714668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fFGyqoL+rPxCekW4/SvaEA14xSlOVqoYnpwB66u9eqg=;
 b=hqbOGY5HdFjOsx8mIK1ip5u5KOOzl5rA/10jB41aroCxvLLONdTIJjmp
 5PlFQ2DYguklGKqfmmJOveKoUugPXbLYcBXeczThUpQL5PpkjeQDVZIFl
 8/8yDMORPvILbjepvtWaOerHz/CC4Qe5gcOgnWmF5/hLk06ymuyhp/U+Y
 4TdWKxMheG7xuUD+gjkaqQcbxiZ97QUaRwHBRT6O9g4805U3PmuzW5Z/b
 Bj24FByJk35aQ6ny/C2U8cW55V00OLoe2pc/lNRZk0nruh0jXttad0Fw5
 pFcZNxgUyfTK4vBKHfYzhKG2SoJF9I9XERMURuWmdLmrXwxeacrELxFlO w==;
X-CSE-ConnectionGUID: cmxt5lEKQGqvOp1Yo6I3ag==
X-CSE-MsgGUID: 8AZUY4MBQUKHVXpGsG8ykQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24935468"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="24935468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:04:25 -0700
X-CSE-ConnectionGUID: /P5/i26oSXu9cdc3VNbDaA==
X-CSE-MsgGUID: 3KPHfaHyTOi0/E9faBSrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67691430"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 12 Sep 2024 15:04:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sorvI-0005ks-0d;
 Thu, 12 Sep 2024 22:04:20 +0000
Date: Fri, 13 Sep 2024 06:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: use drm_file name
Message-ID: <202409130526.fve4aEMs-lkp@intel.com>
References: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
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

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc7 next-20240912]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-use-drm_file-name-in-fdinfo/20240911-230058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240911145836.734080-3-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH 3/3] drm/amdgpu: use drm_file name
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240913/202409130526.fve4aEMs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130526.fve4aEMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130526.fve4aEMs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2374: warning: Function parameter or struct member 'file' not described in 'amdgpu_vm_set_task_info'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2801: warning: Function parameter or struct member 'ts' not described in 'amdgpu_vm_handle_fault'


vim +2374 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2367  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2368  /**
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2369   * amdgpu_vm_set_task_info - Sets VMs task info.
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2370   *
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2371   * @vm: vm for which to set the info
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2372   */
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2373  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18 @2374  {
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2375  	if (!vm->task_info)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2376  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2377  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2378  	if (vm->task_info->pid == current->pid)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2379  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2380  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2381  	vm->task_info->pid = current->pid;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2382  	get_task_comm(vm->task_info->task_name, current);
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2383  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2384  	if (current->group_leader->mm != current->mm)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2385  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2386  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2387  	vm->task_info->tgid = current->group_leader->pid;
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2388  	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2389  			current->group_leader);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2390  	/* Append drm_client_name if set. */
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2391  	if (file && file->name) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2392  		int n;
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2393  
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2394  		mutex_lock(&file->name_lock);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2395  		n = strlen(vm->task_info->process_name);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2396  		if (n < NAME_MAX) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2397  			if (file->name) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2398  				vm->task_info->process_name[n] = '/';
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2399  				strscpy_pad(&vm->task_info->process_name[n + 1],
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2400  					    file->name, NAME_MAX - (n + 1));
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2401  			}
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2402  		}
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2403  		mutex_unlock(&file->name_lock);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2404  	}
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2405  }
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
