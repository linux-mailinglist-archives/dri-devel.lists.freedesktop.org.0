Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBFF770CDC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 03:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80E10E173;
	Sat,  5 Aug 2023 01:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A910E14A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691197566; x=1722733566;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=zWZ8b6ntgyCvGQySWqklP0ypuwGETJGEd/7mNhfNq/s=;
 b=arH69Y31aI+LUxWfkHMRxPJQDLW2DwyBgtjG64va0LoF7ZiDzmHCs0g2
 Gs3NmmN7i+LQW1FU3Oy9zo/oigMqC2bGdWORGJN7xVYvJC9Bi5tz1B8mh
 +FtmWsd4SWS1hDHcAJ0h+9JO5NPtj4FJIzKSYV9/IEp4AXeno7dFpe+t0
 XQpmhiZGHZ1KkPlGYxiLvqsGGyKG8/GPR93pBG7usyg9+cplZ4i96cTHS
 pT4Fp7ez5HLTj42qb+oiuMf4zPRDvOEH/529W//b526Enppyy7lQltznR
 GCI92cOvSlMvi84hDy8R1EgyJJRQS2IPlRLlJzM0smB2Snj5tnW+vk8bs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456657216"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="456657216"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 18:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="854003291"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="854003291"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 04 Aug 2023 18:06:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qS5k1-0003ED-0S;
 Sat, 05 Aug 2023 01:06:01 +0000
Date: Sat, 5 Aug 2023 09:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 10/12]
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to
 pointer from integer of different size
Message-ID: <202308050843.67KjqpqZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   82d750e9d2f5d0594c8f7057ce59127e701af781
commit: 6b252cf42281045a9f803d2198023500cfa6ebd2 [10/12] drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050843.67KjqpqZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050843.67KjqpqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050843.67KjqpqZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h:5,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:22:
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c: In function 'nvkm_uvmm_mthd_raw_map':
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:422:31: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     422 |                               (void *)args->argv, args->argc);
         |                               ^
   drivers/gpu/drm/nouveau/include/nvkm/core/memory.h:66:43: note: in definition of macro 'nvkm_memory_map'
      66 |         (p)->func->map((p),(o),(vm),(va),(av),(ac))
         |                                           ^~


vim +422 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c

   388	
   389	static int
   390	nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
   391	{
   392		struct nvkm_client *client = uvmm->object.client;
   393		struct nvkm_vmm *vmm = uvmm->vmm;
   394		struct nvkm_vma vma = {
   395			.addr = args->addr,
   396			.size = args->size,
   397			.used = true,
   398			.mapref = false,
   399			.no_comp = true,
   400		};
   401		struct nvkm_memory *memory;
   402		u64 handle = args->memory;
   403		u8 refd;
   404		int ret;
   405	
   406		if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
   407			return -EINVAL;
   408	
   409		ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
   410		if (ret)
   411			return ret;
   412	
   413		vma.page = vma.refd = refd;
   414	
   415		memory = nvkm_umem_search(client, args->memory);
   416		if (IS_ERR(memory)) {
   417			VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
   418			return PTR_ERR(memory);
   419		}
   420	
   421		ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
 > 422				      (void *)args->argv, args->argc);
   423	
   424		nvkm_memory_unref(&vma.memory);
   425		nvkm_memory_unref(&memory);
   426		return ret;
   427	}
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
