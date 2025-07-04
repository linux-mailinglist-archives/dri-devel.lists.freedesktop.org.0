Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0DAAF8B4A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023F10E975;
	Fri,  4 Jul 2025 08:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kibFYCCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4BB10E975
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751617470; x=1783153470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hNS3AJuvFAF9BI74gAcGsp48sqw2j6KHtYQY1YWXNa8=;
 b=kibFYCCGXtgwT8qXctBCXjjwCPbWm5Mth36L97jaCxQp5OE81vy0NHhj
 QU4Zw8yjf0woNAY8g4bmUX9yNnR/RxuRCvUvEfgWG9xQIzYdGU5DNH8BU
 42l9E1Mmmib7ps6q1FmOgrM0lBQnAKSSkQqIjH8V4IXUMiwF+hsVVZ3yv
 7PFCjq4mTmn6a1xRf9zOtvCEZ4oht9YE39sTfWYOe5ST/48OR8SC4Fnms
 BPiIzof1dr+rgs+cDT+n1AlknyjLRyHYAzBIELK/qNIu981+y7lP+oz20
 embU/Y5EYfqdnUyLHB0BB1IgC2sAbqWX8CSqgdVZOXHuYgfai3ey6ukqs Q==;
X-CSE-ConnectionGUID: NCdShYqWTLSKczAqunqIRw==
X-CSE-MsgGUID: 2yZL5eteShi7RF6ircO12A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79388725"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="79388725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:24:29 -0700
X-CSE-ConnectionGUID: tpdZkD9uQC249uQq+oRqwQ==
X-CSE-MsgGUID: zQjV/mBQRVWnR2077FGrHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154716553"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 01:24:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uXbiZ-0003UF-1G;
 Fri, 04 Jul 2025 08:24:23 +0000
Date: Fri, 4 Jul 2025 16:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Caterina Shablia <caterina.shablia@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 Caterina Shablia <caterina.shablia@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/panthor: Add support for atomic page table
 updates
Message-ID: <202507041635.WyDu3TQ1-lkp@intel.com>
References: <20250703152908.16702-3-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703152908.16702-3-caterina.shablia@collabora.com>
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

Hi Caterina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caterina-Shablia/drm-gpuvm-Kill-drm_gpuva_init/20250704-002914
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250703152908.16702-3-caterina.shablia%40collabora.com
patch subject: [PATCH v2 1/7] drm/panthor: Add support for atomic page table updates
config: x86_64-buildonly-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041635.WyDu3TQ1-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041635.WyDu3TQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041635.WyDu3TQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_mmu.c:1685:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1685 |         if (vm->as.id >= 0) {
         |             ^~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1691:9: note: uninitialized use occurs here
    1691 |         return ret;
         |                ^~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1685:2: note: remove the 'if' if its condition is always true
    1685 |         if (vm->as.id >= 0) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_mmu.c:1679:9: note: initialize the variable 'ret' to silence this warning
    1679 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +1685 drivers/gpu/drm/panthor/panthor_mmu.c

  1675	
  1676	static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, u64 size)
  1677	{
  1678		struct panthor_device *ptdev = vm->ptdev;
  1679		int ret;
  1680	
  1681		mutex_lock(&ptdev->mmu->as.slots_lock);
  1682		drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.size);
  1683		vm->locked_region.start = start;
  1684		vm->locked_region.size = size;
> 1685		if (vm->as.id >= 0) {
  1686			lock_region(ptdev, vm->as.id, start, size);
  1687			ret = wait_ready(ptdev, vm->as.id);
  1688		}
  1689		mutex_unlock(&ptdev->mmu->as.slots_lock);
  1690	
  1691		return ret;
  1692	}
  1693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
