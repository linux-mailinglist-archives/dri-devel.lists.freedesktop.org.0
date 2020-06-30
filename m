Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B698320FCDF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 21:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947556E18E;
	Tue, 30 Jun 2020 19:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9926D6E18E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:41:35 +0000 (UTC)
IronPort-SDR: WEc68gmhJoxQGdgNluS6j4EjtQzUZkw0l+vBZch2uvyWpaZVSa7lcxaFsSr72LTDURMdKIcO78
 CwXzD9Ply9ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="145437499"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
 d="gz'50?scan'50,208,50";a="145437499"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 12:41:34 -0700
IronPort-SDR: 4SX2cDuQVwQkTnZ475ru3qTi2Qr2owXqhw/XefAcksCRCzraiiezeg82+0DF3jeA7FALcabqO1
 6IzZ7PxWMEMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
 d="gz'50?scan'50,208,50";a="313510156"
Received: from lkp-server01.sh.intel.com (HELO 28879958b202) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2020 12:41:32 -0700
Received: from kbuild by 28879958b202 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jqM8K-0001tM-0I; Tue, 30 Jun 2020 19:41:32 +0000
Date: Wed, 1 Jul 2020 03:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm:not-butter 7/12]
 drivers/gpu/drm/i915/display/intel_fbdev.c:350:30: error: format '%x'
 expects argument of type 'unsigned int', but argument 6 has type 'u64' {aka
 'long long unsigned int'}
Message-ID: <202007010358.qaR5P136%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~airlied/linux.git not-butter
head:   f9de02ab2d4b7fc8d05e5fff0d5b4d8e474bbba5
commit: d6c6b836c1d7cca965338f63eda9db568eb9c78e [7/12] i915/ttm: fbcon works
config: i386-randconfig-m021-20200630 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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
   In file included from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:8:26: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
       8 | int i915_ttm_init(struct drm_i915_private *i915);
         |                          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:9:27: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
       9 | void i915_ttm_fini(struct drm_i915_private *i915);
         |                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h: In function 'i915_ttm_bo_reserve':
   drivers/gpu/drm/i915/ttm/i915_ttm.h:30:34: error: implicit declaration of function 'to_i915_ttm_dev' [-Werror=implicit-function-declaration]
      30 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bo->tbo.bdev);
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:30:34: error: initialization of 'struct drm_i915_private *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:32,
                    from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/ttm/ttm_bo_api.h:34,
                    from drivers/gpu/drm/i915/ttm/i915_ttm_object_types.h:4,
                    from drivers/gpu/drm/i915/ttm/i915_ttm.h:4,
                    from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:36:16: error: dereferencing pointer to incomplete type 'struct drm_i915_private'
      36 |    dev_err(i915->drm.dev, "%p reserve failed\n", bo);
         |                ^~
   include/linux/dev_printk.h:104:11: note: in definition of macro 'dev_err'
     104 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |           ^~~
   In file included from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h: In function 'i915_ttm_mem_type_to_region':
   drivers/gpu/drm/i915/ttm/i915_ttm.h:57:10: error: 'REGION_LMEM' undeclared (first use in this function); did you mean 'REGION_MIXED'?
      57 |   return REGION_LMEM;
         |          ^~~~~~~~~~~
         |          REGION_MIXED
   drivers/gpu/drm/i915/ttm/i915_ttm.h:57:10: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/i915/ttm/i915_ttm.h:59:10: error: 'REGION_SMEM' undeclared (first use in this function); did you mean 'REGION_MIXED'?
      59 |   return REGION_SMEM;
         |          ^~~~~~~~~~~
         |          REGION_MIXED
   drivers/gpu/drm/i915/ttm/i915_ttm.h: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:68:40: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      68 | int i915_ttm_bo_create_reserved(struct drm_i915_private *i915,
         |                                        ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:73:54: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      73 | uint32_t i915_ttm_bo_get_preferred_pin_region(struct drm_i915_private *i915,
         |                                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:76:38: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      76 | int i915_ttm_bo_create_kernel(struct drm_i915_private *i915,
         |                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:80:39: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      80 | int i915_ttm_gem_object_create(struct drm_i915_private *i915, unsigned long size,
         |                                       ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [drivers/gpu/drm/i915/Makefile:307: drivers/gpu/drm/i915/ttm/i915_ttm.hdrtest] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_init':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:20:6: error: unused variable 'ret' [-Werror=unused-variable]
      20 |  int ret;
         |      ^~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:17:27: error: unused variable 'i915' [-Werror=unused-variable]
      17 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_fini':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:35:27: error: unused variable 'i915' [-Werror=unused-variable]
      35 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:52:6: error: no previous prototype for 'i915_ttm_gtt_mgr_has_gart_addr' [-Werror=missing-prototypes]
      52 | bool i915_ttm_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_alloc':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:64:27: error: unused variable 'i915' [-Werror=unused-variable]
      64 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_new':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:105:17: error: unused variable 'mm' [-Werror=unused-variable]
     105 |  struct drm_mm *mm = &mgr->mm;
         |                 ^~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:103:27: error: unused variable 'i915' [-Werror=unused-variable]
     103 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_del':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:148:27: error: unused variable 'i915' [-Werror=unused-variable]
     148 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/i915/i915_drv.h:53,
                    from drivers/gpu/drm/i915/display/intel_fbdev.c:44:
   drivers/gpu/drm/i915/display/intel_fbdev.c: In function 'intelfb_create':
>> drivers/gpu/drm/i915/display/intel_fbdev.c:350:30: error: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'u64' {aka 'long long unsigned int'} [-Werror=format=]
     350 |  drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     351 |       ifbdev->fb->base.width, ifbdev->fb->base.height,
     352 |       vma ? i915_ggtt_offset(vma) : i915_ttm_bo_gpu_offset(bo));
         |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   u64 {aka long long unsigned int}
   include/drm/drm_print.h:436:38: note: in definition of macro 'drm_dbg_kms'
     436 |  drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                      ^~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:350:56: note: format string is defined here
     350 |  drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
         |                                                     ~~~^
         |                                                        |
         |                                                        unsigned int
         |                                                     %08llx
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.o] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_init':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:38:6: error: unused variable 'ret' [-Werror=unused-variable]
      38 |  int ret;
         |      ^~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:35:27: error: unused variable 'i915' [-Werror=unused-variable]
      35 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_fini':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:53:27: error: unused variable 'i915' [-Werror=unused-variable]
      53 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_new':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:75:22: error: unused variable 'max_bytes' [-Werror=unused-variable]
      75 |  uint64_t mem_bytes, max_bytes;
         |                      ^~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:69:27: error: unused variable 'i915' [-Werror=unused-variable]
      69 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_del':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:164:27: error: unused variable 'i915' [-Werror=unused-variable]
     164 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:281: drivers/gpu/drm/i915/display/intel_fbdev.o] Error 1
   cc1: all warnings being treated as errors
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_init_mem_type':
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.o] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm.c:28:27: error: unused variable 'i915' [-Werror=unused-variable]
      28 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_evict_flags':
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:67:32: error: unused variable 'placements' [-Werror=unused-variable]
      67 |  static const struct ttm_place placements = {
         |                                ^~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c:65:27: error: unused variable 'i915' [-Werror=unused-variable]
      65 |  struct drm_i915_private *i915 = to_i915_ttm_dev(tbo->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_bo_destroy':
   drivers/gpu/drm/i915/ttm/i915_ttm.c:440:27: error: unused variable 'i915' [-Werror=unused-variable]
     440 |  struct drm_i915_private *i915 = to_i915_ttm_dev(tbo->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.c:503:5: error: no previous prototype for 'i915_ttm_bo_create' [-Werror=missing-prototypes]
     503 | int i915_ttm_bo_create(struct drm_i915_private *i915,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_bo_placement_from_region':
   drivers/gpu/drm/i915/ttm/i915_ttm.c:521:27: error: unused variable 'i915' [-Werror=unused-variable]
     521 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bo->tbo.bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.c:816:5: error: no previous prototype for 'i915_ttm_bo_pin_restricted' [-Werror=missing-prototypes]
     816 | int i915_ttm_bo_pin_restricted(struct i915_ttm_bo *bo, u32 region,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c:995:6: error: no previous prototype for 'i915_ttm_gem_object_free' [-Werror=missing-prototypes]
     995 | void i915_ttm_gem_object_free(struct drm_gem_object *gobj)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:67:32: error: 'placements' defined but not used [-Werror=unused-const-variable=]
      67 |  static const struct ttm_place placements = {
         |                                ^~~~~~~~~~
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:109:17: error: 'i915_ttm_mm_node_addr' defined but not used [-Werror=unused-function]
     109 | static uint64_t i915_ttm_mm_node_addr(struct ttm_buffer_object *bo,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm.o] Error 1
   make[4]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1756: drivers/gpu] Error 2
   make[1]: Target '__all' not remade because of errors.
   make[2]: *** [scripts/Makefile.build:497: drivers/gpu/drm] Error 2
   make[2]: Target '__build' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:497: drivers/gpu/drm/i915] Error 2
   make[3]: Target '__build' not remade because of errors.
--
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
   In file included from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:8:26: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
       8 | int i915_ttm_init(struct drm_i915_private *i915);
         |                          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:9:27: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
       9 | void i915_ttm_fini(struct drm_i915_private *i915);
         |                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h: In function 'i915_ttm_bo_reserve':
   drivers/gpu/drm/i915/ttm/i915_ttm.h:30:34: error: implicit declaration of function 'to_i915_ttm_dev' [-Werror=implicit-function-declaration]
      30 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bo->tbo.bdev);
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:30:34: error: initialization of 'struct drm_i915_private *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:32,
                    from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from include/drm/ttm/ttm_bo_api.h:34,
                    from drivers/gpu/drm/i915/ttm/i915_ttm_object_types.h:4,
                    from drivers/gpu/drm/i915/ttm/i915_ttm.h:4,
                    from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:36:16: error: dereferencing pointer to incomplete type 'struct drm_i915_private'
      36 |    dev_err(i915->drm.dev, "%p reserve failed\n", bo);
         |                ^~
   include/linux/dev_printk.h:104:11: note: in definition of macro 'dev_err'
     104 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |           ^~~
   In file included from <command-line>:
   drivers/gpu/drm/i915/ttm/i915_ttm.h: In function 'i915_ttm_mem_type_to_region':
   drivers/gpu/drm/i915/ttm/i915_ttm.h:57:10: error: 'REGION_LMEM' undeclared (first use in this function); did you mean 'REGION_MIXED'?
      57 |   return REGION_LMEM;
         |          ^~~~~~~~~~~
         |          REGION_MIXED
   drivers/gpu/drm/i915/ttm/i915_ttm.h:57:10: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/i915/ttm/i915_ttm.h:59:10: error: 'REGION_SMEM' undeclared (first use in this function); did you mean 'REGION_MIXED'?
      59 |   return REGION_SMEM;
         |          ^~~~~~~~~~~
         |          REGION_MIXED
   drivers/gpu/drm/i915/ttm/i915_ttm.h: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.h:68:40: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      68 | int i915_ttm_bo_create_reserved(struct drm_i915_private *i915,
         |                                        ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:73:54: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      73 | uint32_t i915_ttm_bo_get_preferred_pin_region(struct drm_i915_private *i915,
         |                                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:76:38: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      76 | int i915_ttm_bo_create_kernel(struct drm_i915_private *i915,
         |                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.h:80:39: error: 'struct drm_i915_private' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      80 | int i915_ttm_gem_object_create(struct drm_i915_private *i915, unsigned long size,
         |                                       ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [drivers/gpu/drm/i915/Makefile:307: drivers/gpu/drm/i915/ttm/i915_ttm.hdrtest] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_init':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:20:6: error: unused variable 'ret' [-Werror=unused-variable]
      20 |  int ret;
         |      ^~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:17:27: error: unused variable 'i915' [-Werror=unused-variable]
      17 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_fini':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:35:27: error: unused variable 'i915' [-Werror=unused-variable]
      35 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:52:6: error: no previous prototype for 'i915_ttm_gtt_mgr_has_gart_addr' [-Werror=missing-prototypes]
      52 | bool i915_ttm_gtt_mgr_has_gart_addr(struct ttm_mem_reg *mem)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_alloc':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:64:27: error: unused variable 'i915' [-Werror=unused-variable]
      64 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_new':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:105:17: error: unused variable 'mm' [-Werror=unused-variable]
     105 |  struct drm_mm *mm = &mgr->mm;
         |                 ^~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:103:27: error: unused variable 'i915' [-Werror=unused-variable]
     103 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c: In function 'i915_ttm_gtt_mgr_del':
   drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.c:148:27: error: unused variable 'i915' [-Werror=unused-variable]
     148 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/i915/i915_drv.h:53,
                    from drivers/gpu/drm/i915/display/intel_fbdev.c:44:
   drivers/gpu/drm/i915/display/intel_fbdev.c: In function 'intelfb_create':
>> drivers/gpu/drm/i915/display/intel_fbdev.c:350:30: error: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'u64' {aka 'long long unsigned int'} [-Werror=format=]
     350 |  drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     351 |       ifbdev->fb->base.width, ifbdev->fb->base.height,
     352 |       vma ? i915_ggtt_offset(vma) : i915_ttm_bo_gpu_offset(bo));
         |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   u64 {aka long long unsigned int}
   include/drm/drm_print.h:436:38: note: in definition of macro 'drm_dbg_kms'
     436 |  drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
         |                                      ^~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:350:56: note: format string is defined here
     350 |  drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
         |                                                     ~~~^
         |                                                        |
         |                                                        unsigned int
         |                                                     %08llx
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm_gtt_mgr.o] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_init':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:38:6: error: unused variable 'ret' [-Werror=unused-variable]
      38 |  int ret;
         |      ^~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:35:27: error: unused variable 'i915' [-Werror=unused-variable]
      35 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_fini':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:53:27: error: unused variable 'i915' [-Werror=unused-variable]
      53 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_new':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:75:22: error: unused variable 'max_bytes' [-Werror=unused-variable]
      75 |  uint64_t mem_bytes, max_bytes;
         |                      ^~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:69:27: error: unused variable 'i915' [-Werror=unused-variable]
      69 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c: In function 'i915_ttm_vram_mgr_del':
   drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.c:164:27: error: unused variable 'i915' [-Werror=unused-variable]
     164 |  struct drm_i915_private *i915 = to_i915_ttm_dev(man->bdev);
         |                           ^~~~
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:281: drivers/gpu/drm/i915/display/intel_fbdev.o] Error 1
   cc1: all warnings being treated as errors
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_init_mem_type':
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm_vram_mgr.o] Error 1
   drivers/gpu/drm/i915/ttm/i915_ttm.c:28:27: error: unused variable 'i915' [-Werror=unused-variable]
      28 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_evict_flags':
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:67:32: error: unused variable 'placements' [-Werror=unused-variable]
      67 |  static const struct ttm_place placements = {
         |                                ^~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c:65:27: error: unused variable 'i915' [-Werror=unused-variable]
      65 |  struct drm_i915_private *i915 = to_i915_ttm_dev(tbo->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_bo_destroy':
   drivers/gpu/drm/i915/ttm/i915_ttm.c:440:27: error: unused variable 'i915' [-Werror=unused-variable]
     440 |  struct drm_i915_private *i915 = to_i915_ttm_dev(tbo->bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.c:503:5: error: no previous prototype for 'i915_ttm_bo_create' [-Werror=missing-prototypes]
     503 | int i915_ttm_bo_create(struct drm_i915_private *i915,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: In function 'i915_ttm_bo_placement_from_region':
   drivers/gpu/drm/i915/ttm/i915_ttm.c:521:27: error: unused variable 'i915' [-Werror=unused-variable]
     521 |  struct drm_i915_private *i915 = to_i915_ttm_dev(bo->tbo.bdev);
         |                           ^~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c: At top level:
   drivers/gpu/drm/i915/ttm/i915_ttm.c:816:5: error: no previous prototype for 'i915_ttm_bo_pin_restricted' [-Werror=missing-prototypes]
     816 | int i915_ttm_bo_pin_restricted(struct i915_ttm_bo *bo, u32 region,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/ttm/i915_ttm.c:995:6: error: no previous prototype for 'i915_ttm_gem_object_free' [-Werror=missing-prototypes]
     995 | void i915_ttm_gem_object_free(struct drm_gem_object *gobj)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:67:32: error: 'placements' defined but not used [-Werror=unused-const-variable=]
      67 |  static const struct ttm_place placements = {
         |                                ^~~~~~~~~~
>> drivers/gpu/drm/i915/ttm/i915_ttm.c:109:17: error: 'i915_ttm_mm_node_addr' defined but not used [-Werror=unused-function]
     109 | static uint64_t i915_ttm_mm_node_addr(struct ttm_buffer_object *bo,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [scripts/Makefile.build:280: drivers/gpu/drm/i915/ttm/i915_ttm.o] Error 1
   make[4]: Target '__build' not remade because of errors.
   make[2]: *** [scripts/Makefile.build:497: drivers/gpu/drm] Error 2
   make[2]: Target '__build' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:497: drivers/gpu/drm/i915] Error 2
   make[3]: Target '__build' not remade because of errors.
..

vim +350 drivers/gpu/drm/i915/display/intel_fbdev.c

79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  232  
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  233  static int intelfb_create(struct drm_fb_helper *helper,
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  234  			  struct drm_fb_helper_surface_size *sizes)
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  235  {
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  236  	struct intel_fbdev *ifbdev =
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  237  		container_of(helper, struct intel_fbdev, helper);
8bcd45534ddf68a drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2014-02-07  238  	struct intel_framebuffer *intel_fb = ifbdev->fb;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  239  	struct drm_device *dev = helper->dev;
72e96d6450c067f drivers/gpu/drm/i915/intel_fbdev.c         Joonas Lahtinen        2016-03-30  240  	struct drm_i915_private *dev_priv = to_i915(dev);
52a05c302bcfe57 drivers/gpu/drm/i915/intel_fbdev.c         David Weinehall        2016-08-22  241  	struct pci_dev *pdev = dev_priv->drm.pdev;
72e96d6450c067f drivers/gpu/drm/i915/intel_fbdev.c         Joonas Lahtinen        2016-03-30  242  	struct i915_ggtt *ggtt = &dev_priv->ggtt;
f5929c5309a6a43 drivers/gpu/drm/i915/intel_fbdev.c         Ville Syrjälä          2018-09-07  243  	const struct i915_ggtt_view view = {
f5929c5309a6a43 drivers/gpu/drm/i915/intel_fbdev.c         Ville Syrjälä          2018-09-07  244  		.type = I915_GGTT_VIEW_NORMAL,
f5929c5309a6a43 drivers/gpu/drm/i915/intel_fbdev.c         Ville Syrjälä          2018-09-07  245  	};
1d264d91befc313 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2019-01-14  246  	intel_wakeref_t wakeref;
1d264d91befc313 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2019-01-14  247  	struct fb_info *info;
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  248  	struct i915_vma *vma = NULL;
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  249  	struct i915_ttm_bo *bo = NULL;	
5935485f8eee356 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2018-02-20  250  	unsigned long flags = 0;
d978ef14456a380 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2014-03-07  251  	bool prealloc = false;
406ea8d22f9aeee drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-07-20  252  	void __iomem *vaddr;
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  253  	int ret;
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  254  
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  255  	if (intel_fb &&
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  256  	    (sizes->fb_width > intel_fb->base.width ||
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  257  	     sizes->fb_height > intel_fb->base.height)) {
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  258  		drm_dbg_kms(&dev_priv->drm,
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  259  			    "BIOS fb too small (%dx%d), we require (%dx%d),"
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  260  			    " releasing it\n",
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  261  			    intel_fb->base.width, intel_fb->base.height,
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  262  			    sizes->fb_width, sizes->fb_height);
c3ed110386db97e drivers/gpu/drm/i915/intel_fbdev.c         Harsha Sharma          2017-10-09  263  		drm_framebuffer_put(&intel_fb->base);
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  264  		intel_fb = ifbdev->fb = NULL;
edd586fe705e819 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2014-04-23  265  	}
5836019a87bfb31 drivers/gpu/drm/i915/display/intel_fbdev.c Pankaj Bharadiya       2020-01-28  266  	if (!intel_fb || drm_WARN_ON(dev, !intel_fb_obj(&intel_fb->base))) {
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  267  		drm_dbg_kms(&dev_priv->drm,
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  268  			    "no BIOS fb, allocating a new one\n");
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  269  		ret = intelfb_alloc(helper, sizes);
cce13ff75969859 drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2010-08-08  270  		if (ret)
51f1385b90c1ad3 drivers/gpu/drm/i915/intel_fbdev.c         Tvrtko Ursulin         2015-06-30  271  			return ret;
8bcd45534ddf68a drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2014-02-07  272  		intel_fb = ifbdev->fb;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  273  	} else {
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  274  		drm_dbg_kms(&dev_priv->drm, "re-using BIOS fb\n");
d978ef14456a380 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2014-03-07  275  		prealloc = true;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  276  		sizes->fb_width = intel_fb->base.width;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  277  		sizes->fb_height = intel_fb->base.height;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  278  	}
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  279  
d858d5695f3897d drivers/gpu/drm/i915/intel_fbdev.c         Daniele Ceraolo Spurio 2019-06-13  280  	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
51f1385b90c1ad3 drivers/gpu/drm/i915/intel_fbdev.c         Tvrtko Ursulin         2015-06-30  281  
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  282  	if (!dev_priv->use_ttm) {
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  283  		/* Pin the GGTT vma for our access via info->screen_base.
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  284  		 * This also validates that any existing fb inherited from the
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  285  		 * BIOS is suitable for own access.
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  286  		 */
5935485f8eee356 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2018-02-20  287  		vma = intel_pin_and_fence_fb_obj(&ifbdev->fb->base,
f5929c5309a6a43 drivers/gpu/drm/i915/intel_fbdev.c         Ville Syrjälä          2018-09-07  288  						 &view, false, &flags);
058d88c4330f963 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-08-15  289  		if (IS_ERR(vma)) {
058d88c4330f963 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-08-15  290  			ret = PTR_ERR(vma);
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  291  			goto out_unlock;
058d88c4330f963 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-08-15  292  		}
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  293  	}
8e7cb1799b4f8bd drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-08-16  294  	intel_frontbuffer_flush(to_frontbuffer(ifbdev), ORIGIN_DIRTYFB);
07bcd99b80477cc drivers/gpu/drm/i915/intel_fbdev.c         Dhinakaran Pandiyan    2018-03-06  295  
21cff14847421ff drivers/gpu/drm/i915/intel_fbdev.c         Archit Taneja          2015-07-31  296  	info = drm_fb_helper_alloc_fbi(helper);
21cff14847421ff drivers/gpu/drm/i915/intel_fbdev.c         Archit Taneja          2015-07-31  297  	if (IS_ERR(info)) {
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  298  		drm_err(&dev_priv->drm, "Failed to allocate fb_info\n");
21cff14847421ff drivers/gpu/drm/i915/intel_fbdev.c         Archit Taneja          2015-07-31  299  		ret = PTR_ERR(info);
cce13ff75969859 drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2010-08-08  300  		goto out_unpin;
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  301  	}
8b4f49e03901e82 drivers/gpu/drm/i915/intel_fbdev.c         Jesse Barnes           2013-11-25  302  
8e7cb1799b4f8bd drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-08-16  303  	ifbdev->helper.fb = &ifbdev->fb->base;
785b93ef8c30973 drivers/gpu/drm/i915/intel_fb.c            Dave Airlie            2009-08-28  304  
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  305  	info->fbops = &intelfb_ops;
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  306  
4410f3910947dce drivers/gpu/drm/i915/intel_fb.c            Dave Airlie            2009-06-16  307  	/* setup aperture base/size for vesafb takeover */
5f889b9a61dd706 drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-08-13  308  	info->apertures->ranges[0].base = ggtt->gmadr.start;
72e96d6450c067f drivers/gpu/drm/i915/intel_fbdev.c         Joonas Lahtinen        2016-03-30  309  	info->apertures->ranges[0].size = ggtt->mappable_end;
4410f3910947dce drivers/gpu/drm/i915/intel_fb.c            Dave Airlie            2009-06-16  310  
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  311  
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  312  	if (vma) {
9faf5fa4d3dad3b drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-11-13  313  		/* Our framebuffer is the entirety of fbdev's system memory */
9faf5fa4d3dad3b drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-11-13  314  		info->fix.smem_start =
9faf5fa4d3dad3b drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-11-13  315  			(unsigned long)(ggtt->gmadr.start + vma->node.start);
9faf5fa4d3dad3b drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-11-13  316  		info->fix.smem_len = vma->node.size;
9faf5fa4d3dad3b drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-11-13  317  
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  318  		vaddr = i915_vma_pin_iomap(vma);
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  319  		if (IS_ERR(vaddr)) {
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  320  			drm_err(&dev_priv->drm,
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10  321  				"Failed to remap framebuffer into virtual memory\n");
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  322  			ret = PTR_ERR(vaddr);
da7bdda2afdf1ae drivers/gpu/drm/i915/intel_fbdev.c         Daniel Vetter          2017-02-07  323  			goto out_unpin;
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  324  		}
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  325  		info->screen_base = vaddr;
8ef8561f2c8a5e3 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2016-04-28  326  		info->screen_size = vma->node.size;
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  327  		ifbdev->vma = vma;
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  328  		ifbdev->vma_flags = flags;
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  329  	} else {
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  330  		bo = intel_fb_bo(&ifbdev->fb->base);
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  331  
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  332  		drm_dbg_kms(&dev_priv->drm, "yo yo 2");
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  333  		info->fix.smem_start = ggtt->gmadr.start + i915_ttm_bo_gpu_offset(bo);
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  334  		info->fix.smem_len = i915_ttm_bo_size(bo);
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  335  		info->screen_base = i915_ttm_bo_kptr(bo);
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  336  		info->screen_size = i915_ttm_bo_size(bo);
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  337  	}
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  338  
7a0f9ef9703d4ac drivers/gpu/drm/i915/intel_fbdev.c         Daniel Vetter          2019-03-26  339  	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  340  
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  341  	/* If the object is shmemfs backed, it will have given us zeroed pages.
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  342  	 * If the object is stolen however, it will be full of whatever
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  343  	 * garbage was left in there.
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  344  	 */
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  345  	if (vma && vma->obj->stolen && !prealloc)
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  346  		memset_io(info->screen_base, 0, info->screen_size);
88afe715dd5469b drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2012-12-16  347  
fb2a99e15ff0d34 drivers/gpu/drm/i915/intel_fb.c            Sascha Hauer           2012-02-06  348  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  349  
ac467612f40377c drivers/gpu/drm/i915/display/intel_fbdev.c Wambui Karuga          2020-03-10 @350  	drm_dbg_kms(&dev_priv->drm, "allocated %dx%d fb: 0x%08x\n",
8e7cb1799b4f8bd drivers/gpu/drm/i915/display/intel_fbdev.c Chris Wilson           2019-08-16  351  		    ifbdev->fb->base.width, ifbdev->fb->base.height,
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  352  		    vma ? i915_ggtt_offset(vma) : i915_ttm_bo_gpu_offset(bo));
70998197c4f1270 drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-25  353  
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  354  
d858d5695f3897d drivers/gpu/drm/i915/intel_fbdev.c         Daniele Ceraolo Spurio 2019-06-13  355  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
52a05c302bcfe57 drivers/gpu/drm/i915/intel_fbdev.c         David Weinehall        2016-08-22  356  	vga_switcheroo_client_fb_set(pdev, info);
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  357  	return 0;
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  358  
b4476f52e43fadc drivers/gpu/drm/i915/intel_fb.c            Chris Wilson           2009-02-11  359  out_unpin:
d6c6b836c1d7cca drivers/gpu/drm/i915/display/intel_fbdev.c Dave Airlie            2020-06-26  360  	if (vma)
5935485f8eee356 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2018-02-20  361  		intel_unpin_fb_vma(vma, flags);
0c82312f3f15538 drivers/gpu/drm/i915/intel_fbdev.c         Chris Wilson           2015-12-04  362  out_unlock:
d858d5695f3897d drivers/gpu/drm/i915/intel_fbdev.c         Daniele Ceraolo Spurio 2019-06-13  363  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  364  	return ret;
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  365  }
79e539453b34e35 drivers/gpu/drm/i915/intel_fb.c            Jesse Barnes           2008-11-07  366  

:::::: The code at line 350 was first introduced by commit
:::::: ac467612f40377c48311664303d56039c54ab8ec drm/i915/fbdev: convert to drm_device based logging.

:::::: TO: Wambui Karuga <wambui.karugax@gmail.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Ap/oXxZnheMBAA==

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--sdtB3X0nJg68CQEu--
