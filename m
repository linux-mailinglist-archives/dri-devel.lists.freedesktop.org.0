Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B352823E6DE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 06:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032726E957;
	Fri,  7 Aug 2020 04:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AA76E957
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 04:47:16 +0000 (UTC)
IronPort-SDR: XXqHLvhmmxU4SO7lxZl0otj+onB/O95U8FU/A9AI9vFTH++gw8CL/ltAfRzmF8PztNFIVo1IMZ
 X0mU2PWWAgwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="237847269"
X-IronPort-AV: E=Sophos;i="5.75,444,1589266800"; 
 d="gz'50?scan'50,208,50";a="237847269"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 21:47:14 -0700
IronPort-SDR: DpfvHOGPjoGxSR8xqzhd+1iITgTNERljh1yKLVAXx6sLkDX9om67pZ/RdVVrcCpe2PHvprdXHs
 YAQKTgYnsZ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,444,1589266800"; 
 d="gz'50?scan'50,208,50";a="468102775"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 06 Aug 2020 21:47:12 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3uHf-00021s-UK; Fri, 07 Aug 2020 04:47:11 +0000
Date: Fri, 7 Aug 2020 12:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/ttm: drop size from resource manager base class.
Message-ID: <202008071249.kydKES5H%lkp@intel.com>
References: <20200806233459.4057784-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200806233459.4057784-4-airlied@gmail.com>
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
Cc: kbuild-all@lists.01.org, bskeggs@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Dave,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master drm/drm-next drm-exynos/exynos-drm-next v5.8 next-20200806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Airlie/drm-amdgpu-ttm-move-vram-gtt-mgr-allocations-to-mman/20200807-083526
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: arc-randconfig-r005-20200805 (attached as .config)
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:38:
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function 'amdgpu_bo_validate_size':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:473:12: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
     473 |  DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:490:25: note: in definition of macro 'DRM_DEBUG'
     490 |  __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
         |                         ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:473:54: note: format string is defined here
     473 |  DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
         |                                                   ~~~^
         |                                                      |
         |                                                      long long unsigned int
         |                                                   %lu
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:38:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:192:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     192 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:191:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     191 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:38:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~

vim +473 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c

aa1d562e645d254 Junwei Zhang      2016-09-08  440  
79c631239a83aeb Andrey Grodzovsky 2017-11-10  441  /* Validate bo size is bit bigger then the request domain */
79c631239a83aeb Andrey Grodzovsky 2017-11-10  442  static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
79c631239a83aeb Andrey Grodzovsky 2017-11-10  443  					  unsigned long size, u32 domain)
79c631239a83aeb Andrey Grodzovsky 2017-11-10  444  {
89e1ba9e4973560 Dave Airlie       2020-08-07  445  	unsigned long mgr_size = 0;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  446  	/*
79c631239a83aeb Andrey Grodzovsky 2017-11-10  447  	 * If GTT is part of requested domains the check must succeed to
79c631239a83aeb Andrey Grodzovsky 2017-11-10  448  	 * allow fall back to GTT
79c631239a83aeb Andrey Grodzovsky 2017-11-10  449  	 */
79c631239a83aeb Andrey Grodzovsky 2017-11-10  450  	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
89e1ba9e4973560 Dave Airlie       2020-08-07  451  		mgr_size = to_gtt_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  452  
89e1ba9e4973560 Dave Airlie       2020-08-07  453  		if (size < (mgr_size << PAGE_SHIFT))
79c631239a83aeb Andrey Grodzovsky 2017-11-10  454  			return true;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  455  		else
79c631239a83aeb Andrey Grodzovsky 2017-11-10  456  			goto fail;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  457  	}
79c631239a83aeb Andrey Grodzovsky 2017-11-10  458  
79c631239a83aeb Andrey Grodzovsky 2017-11-10  459  	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
89e1ba9e4973560 Dave Airlie       2020-08-07  460  		mgr_size = to_vram_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  461  
89e1ba9e4973560 Dave Airlie       2020-08-07  462  		if (size < (mgr_size << PAGE_SHIFT))
79c631239a83aeb Andrey Grodzovsky 2017-11-10  463  			return true;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  464  		else
79c631239a83aeb Andrey Grodzovsky 2017-11-10  465  			goto fail;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  466  	}
79c631239a83aeb Andrey Grodzovsky 2017-11-10  467  
79c631239a83aeb Andrey Grodzovsky 2017-11-10  468  
79c631239a83aeb Andrey Grodzovsky 2017-11-10  469  	/* TODO add more domains checks, such as AMDGPU_GEM_DOMAIN_CPU */
79c631239a83aeb Andrey Grodzovsky 2017-11-10  470  	return true;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  471  
79c631239a83aeb Andrey Grodzovsky 2017-11-10  472  fail:
299c776cebb01c1 Michel Dänzer     2017-11-15 @473  	DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
89e1ba9e4973560 Dave Airlie       2020-08-07  474  		  mgr_size << PAGE_SHIFT);
79c631239a83aeb Andrey Grodzovsky 2017-11-10  475  	return false;
79c631239a83aeb Andrey Grodzovsky 2017-11-10  476  }
79c631239a83aeb Andrey Grodzovsky 2017-11-10  477  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tThc/1wpZn/ma/RB
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--tThc/1wpZn/ma/RB--
