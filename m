Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A07DDB1B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 03:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63F410E139;
	Wed,  1 Nov 2023 02:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40910E0D0;
 Wed,  1 Nov 2023 02:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698806640; x=1730342640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0qK83WQuB6+tWkmTs5R7oM338PFBsvB/8n6IBXJ8CX4=;
 b=k/g/v5ANwG7MBQfYMbqh+BpJzKvfJPJtqrfnIHk483B2j3iuzoFu6plQ
 ZdGCKcXNTpDCX8mkzI5BZgC9a8ry5ETPZpSIjmFhFQm/IfdEwClYHHJM3
 5zrBoi4klKUpem0nLAl7Aa0QEE+dewBYA9gWznmwGFjLj3ZSlDqhhz7bP
 JfeG9ChWuxLgWbS5mP5ygdxvxYbH2poASwnROfAQmCOxSNuDTA5hYmGQn
 7dDxJZLmWprwi/lViprnu5Ucu9dfywo/to34YdakrzkZ6CclVjrAkK6oA
 AaQMbL5x+Of+DG/PCN9uEt+cNke0wW3Ugii9cwFIF33XWsIfomhB4XnJE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474659826"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="474659826"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 19:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="737262184"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="737262184"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 31 Oct 2023 19:43:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qy1D0-0000Xk-1F;
 Wed, 01 Nov 2023 02:43:54 +0000
Date: Wed, 1 Nov 2023 10:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/amdgpu: Add flag to disable implicit sync for
 GEM operations.
Message-ID: <202311011037.Bt6NSYwA-lkp@intel.com>
References: <20231031134059.171277-6-ishitatsuyuki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231031134059.171277-6-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tatsuyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes linus/master v6.6]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20231031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tatsuyuki-Ishi/drm-amdgpu-Don-t-implicit-sync-PRT-maps/20231031-224530
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231031134059.171277-6-ishitatsuyuki%40gmail.com
patch subject: [PATCH 5/6] drm/amdgpu: Add flag to disable implicit sync for GEM operations.
config: arc-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011037.Bt6NSYwA-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011037.Bt6NSYwA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011037.Bt6NSYwA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:178: warning: Function parameter or member 'evicted' not described in 'amdgpu_vm_bo_set_evicted'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:178: warning: expecting prototype for amdgpu_vm_bo_evicted(). Prototype was for amdgpu_vm_bo_set_evicted() instead
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1667: warning: Function parameter or member 'sync_unmap' not described in 'amdgpu_vm_bo_unmap'


vim +1667 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

d38ceaf99ed015 Alex Deucher      2015-04-20  1650  
d38ceaf99ed015 Alex Deucher      2015-04-20  1651  /**
d38ceaf99ed015 Alex Deucher      2015-04-20  1652   * amdgpu_vm_bo_unmap - remove bo mapping from vm
d38ceaf99ed015 Alex Deucher      2015-04-20  1653   *
d38ceaf99ed015 Alex Deucher      2015-04-20  1654   * @adev: amdgpu_device pointer
d38ceaf99ed015 Alex Deucher      2015-04-20  1655   * @bo_va: bo_va to remove the address from
d38ceaf99ed015 Alex Deucher      2015-04-20  1656   * @saddr: where to the BO is mapped
d38ceaf99ed015 Alex Deucher      2015-04-20  1657   *
d38ceaf99ed015 Alex Deucher      2015-04-20  1658   * Remove a mapping of the BO at the specefied addr from the VM.
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1659   *
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1660   * Returns:
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1661   * 0 for success, error for failure.
d38ceaf99ed015 Alex Deucher      2015-04-20  1662   *
49b02b180a541d Chunming Zhou     2015-11-13  1663   * Object has to be reserved and unreserved outside!
d38ceaf99ed015 Alex Deucher      2015-04-20  1664   */
1550024e9de031 Tatsuyuki Ishi    2023-10-31  1665  int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
1550024e9de031 Tatsuyuki Ishi    2023-10-31  1666  		       uint64_t saddr, bool sync_unmap)
d38ceaf99ed015 Alex Deucher      2015-04-20 @1667  {
d38ceaf99ed015 Alex Deucher      2015-04-20  1668  	struct amdgpu_bo_va_mapping *mapping;
ec681545afe5a4 Christian König   2017-08-01  1669  	struct amdgpu_vm *vm = bo_va->base.vm;
7fc11959018f8b Christian König   2015-07-30  1670  	bool valid = true;
d38ceaf99ed015 Alex Deucher      2015-04-20  1671  
6c7fc503a47f9b Christian König   2015-06-05  1672  	saddr /= AMDGPU_GPU_PAGE_SIZE;
32b41ac21fde8f Christian König   2016-03-08  1673  
7fc11959018f8b Christian König   2015-07-30  1674  	list_for_each_entry(mapping, &bo_va->valids, list) {
a9f87f64525435 Christian König   2017-03-30  1675  		if (mapping->start == saddr)
7fc11959018f8b Christian König   2015-07-30  1676  			break;
7fc11959018f8b Christian König   2015-07-30  1677  	}
7fc11959018f8b Christian König   2015-07-30  1678  
7fc11959018f8b Christian König   2015-07-30  1679  	if (&mapping->list == &bo_va->valids) {
7fc11959018f8b Christian König   2015-07-30  1680  		valid = false;
7fc11959018f8b Christian König   2015-07-30  1681  
7fc11959018f8b Christian König   2015-07-30  1682  		list_for_each_entry(mapping, &bo_va->invalids, list) {
a9f87f64525435 Christian König   2017-03-30  1683  			if (mapping->start == saddr)
d38ceaf99ed015 Alex Deucher      2015-04-20  1684  				break;
d38ceaf99ed015 Alex Deucher      2015-04-20  1685  		}
d38ceaf99ed015 Alex Deucher      2015-04-20  1686  
32b41ac21fde8f Christian König   2016-03-08  1687  		if (&mapping->list == &bo_va->invalids)
d38ceaf99ed015 Alex Deucher      2015-04-20  1688  			return -ENOENT;
d38ceaf99ed015 Alex Deucher      2015-04-20  1689  	}
32b41ac21fde8f Christian König   2016-03-08  1690  
d38ceaf99ed015 Alex Deucher      2015-04-20  1691  	list_del(&mapping->list);
a9f87f64525435 Christian König   2017-03-30  1692  	amdgpu_vm_it_remove(mapping, &vm->va);
aebc5e6f50f770 Christian König   2017-09-06  1693  	mapping->bo_va = NULL;
1550024e9de031 Tatsuyuki Ishi    2023-10-31  1694  	mapping->sync_unmap = sync_unmap;
93e3e4385b69d8 Christian König   2015-06-09  1695  	trace_amdgpu_vm_bo_unmap(bo_va, mapping);
d38ceaf99ed015 Alex Deucher      2015-04-20  1696  
e17841b97587ad Christian König   2016-03-08  1697  	if (valid)
d38ceaf99ed015 Alex Deucher      2015-04-20  1698  		list_add(&mapping->list, &vm->freed);
e17841b97587ad Christian König   2016-03-08  1699  	else
284710fa6c3a5f Christian König   2017-01-30  1700  		amdgpu_vm_free_mapping(adev, vm, mapping,
284710fa6c3a5f Christian König   2017-01-30  1701  				       bo_va->last_pt_update);
d38ceaf99ed015 Alex Deucher      2015-04-20  1702  
d38ceaf99ed015 Alex Deucher      2015-04-20  1703  	return 0;
d38ceaf99ed015 Alex Deucher      2015-04-20  1704  }
d38ceaf99ed015 Alex Deucher      2015-04-20  1705  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
