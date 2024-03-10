Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426908778C6
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 23:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423A310E09D;
	Sun, 10 Mar 2024 22:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8ENAQKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB310E09D
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710109212; x=1741645212;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FLbz7HIi7QLSAoZujvzf700uURich5QOhe14vam5h/U=;
 b=h8ENAQKKZheDCjEKH07TqxI/GS4lfAXWGM1g3f5VkaFcUkNUep+mYEjh
 Td/jSVKSiRGdnXbMd6flEJ1/ztNCn29+v7LF7/mR0BO6xNZU/4gr7Om11
 JJKDyn2izjkjtwO9y+QfXANkYhFXW8DIO+7I3Zv3XMS9fKnAtwKa/z8UO
 gBDrGiQEJKWp7Nookyc9qImaafZb7U/nTayDHUmCDXJz3bu327fTWuNm6
 G2FMHMxVtvY+MOq4ina6IS6pYYsTZ2/SbLNlyCEeWUGdCkEImzdAj6caE
 N/8XjmjcvnXDZDf5wsS7kZsnhYgybG9Nm1Mu74zNkQWm6aYgIf8U3HKuu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16167504"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="16167504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 15:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="11422102"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2024 15:20:10 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rjRWZ-0008eZ-1L;
 Sun, 10 Mar 2024 22:20:07 +0000
Date: Mon, 11 Mar 2024 06:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 1/1]
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable 'out' set
 but not used
Message-ID: <202403110614.LaW3UiNG-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   b219865715e419435ad49dc2300fe3f85c79d3f6
commit: d6eb77731c45caf6ee7b18d907e9bc44be760e8c [1/1] Merge drm/drm-next into drm-misc-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240311/202403110614.LaW3UiNG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110614.LaW3UiNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110614.LaW3UiNG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: error: variable 'out' set but not used [-Werror,-Wunused-but-set-variable]
     843 |         u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
         |             ^
   1 error generated.


vim +/out +843 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

64d6255650d4e0 Connor Abbott 2024-01-25  834  
1707add815519d Jordan Crouse 2018-11-02  835  /* Read a shader / debug block from the HLSQ aperture with the crashdumper */
1707add815519d Jordan Crouse 2018-11-02  836  static void a6xx_get_shader_block(struct msm_gpu *gpu,
d6852b4b2d0140 Jordan Crouse 2018-11-02  837  		struct a6xx_gpu_state *a6xx_state,
1707add815519d Jordan Crouse 2018-11-02  838  		const struct a6xx_shader_block *block,
1707add815519d Jordan Crouse 2018-11-02  839  		struct a6xx_gpu_state_obj *obj,
1707add815519d Jordan Crouse 2018-11-02  840  		struct a6xx_crashdumper *dumper)
1707add815519d Jordan Crouse 2018-11-02  841  {
1707add815519d Jordan Crouse 2018-11-02  842  	u64 *in = dumper->ptr;
64d6255650d4e0 Connor Abbott 2024-01-25 @843  	u64 out = dumper->iova + A6XX_CD_DATA_OFFSET;
1707add815519d Jordan Crouse 2018-11-02  844  	size_t datasize = block->size * A6XX_NUM_SHADER_BANKS * sizeof(u32);
1707add815519d Jordan Crouse 2018-11-02  845  	int i;
1707add815519d Jordan Crouse 2018-11-02  846  
1707add815519d Jordan Crouse 2018-11-02  847  	if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
1707add815519d Jordan Crouse 2018-11-02  848  		return;
1707add815519d Jordan Crouse 2018-11-02  849  
1707add815519d Jordan Crouse 2018-11-02  850  	for (i = 0; i < A6XX_NUM_SHADER_BANKS; i++) {
1707add815519d Jordan Crouse 2018-11-02  851  		in += CRASHDUMP_WRITE(in, REG_A6XX_HLSQ_DBG_READ_SEL,
1707add815519d Jordan Crouse 2018-11-02  852  			(block->type << 8) | i);
1707add815519d Jordan Crouse 2018-11-02  853  
1707add815519d Jordan Crouse 2018-11-02  854  		in += CRASHDUMP_READ(in, REG_A6XX_HLSQ_DBG_AHB_READ_APERTURE,
1707add815519d Jordan Crouse 2018-11-02  855  			block->size, dumper->iova + A6XX_CD_DATA_OFFSET);
64d6255650d4e0 Connor Abbott 2024-01-25  856  
64d6255650d4e0 Connor Abbott 2024-01-25  857  		out += block->size * sizeof(u32);
1707add815519d Jordan Crouse 2018-11-02  858  	}
1707add815519d Jordan Crouse 2018-11-02  859  
1707add815519d Jordan Crouse 2018-11-02  860  	CRASHDUMP_FINI(in);
1707add815519d Jordan Crouse 2018-11-02  861  
1707add815519d Jordan Crouse 2018-11-02  862  	if (a6xx_crashdumper_run(gpu, dumper))
1707add815519d Jordan Crouse 2018-11-02  863  		return;
1707add815519d Jordan Crouse 2018-11-02  864  
1707add815519d Jordan Crouse 2018-11-02  865  	obj->handle = block;
d6852b4b2d0140 Jordan Crouse 2018-11-02  866  	obj->data = state_kmemdup(a6xx_state, dumper->ptr + A6XX_CD_DATA_OFFSET,
d6852b4b2d0140 Jordan Crouse 2018-11-02  867  		datasize);
1707add815519d Jordan Crouse 2018-11-02  868  }
1707add815519d Jordan Crouse 2018-11-02  869  

:::::: The code at line 843 was first introduced by commit
:::::: 64d6255650d4e0ff816cd303a43685f65c5a0dbb drm/msm: More fully implement devcoredump for a7xx

:::::: TO: Connor Abbott <cwabbott0@gmail.com>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
