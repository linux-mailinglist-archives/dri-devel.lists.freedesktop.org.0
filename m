Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0C8474A7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A114110E7C8;
	Fri,  2 Feb 2024 16:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQL11Zp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AEE10E7C8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706891209; x=1738427209;
 h=date:from:cc:subject:message-id:mime-version;
 bh=cDQNl6dio3miO8x43Gzue7oMsq01lzBNrqh05PEzriE=;
 b=jQL11Zp4W5i0dXSHmjAyMlxfrgtITXJve26G4gjAiIa8VUO3spZK94yg
 o0nbKcLB0taMTXNxs9vSFckH4dyR1SXoALdGqrR2rgBMvx00YdUk1pPPQ
 6Z/rlp5QPglEjua6lWw535HIAt4Z/TgqBnsJnk3yZ8rIrvW/skyNwGwwR
 VKOW76RHp2b+CcM+vmDvYFmVl+UipKWke85wKlfOLf+pA7sY6TbCHz6lY
 n6MwjwpPjTxQSKcxes/28H4UyWi8psD/bImTE1PzkvYqi3szGXdawzhqG
 hZ6sGOivixEk2Rq8WtAMb95pmyG+iL9Z7/r9qYdbNSSqzlITGfaLgPPKd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17714703"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="17714703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="118582"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 02 Feb 2024 08:26:46 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rVwNI-00042q-0D;
 Fri, 02 Feb 2024 16:26:44 +0000
Date: Sat, 3 Feb 2024 00:26:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:drm-misc-next 1/1] drivers/gpu/drm/xe/xe_bo.c:41:24:
 error: initializer overrides prior initialization of this subobject
Message-ID: <202402030003.rFCIAJNF-lkp@intel.com>
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
head:   2bb98fc1d4a7715da3cb429d77731b0d1d2d3903
commit: 4db102dcb0396a4ccf89b1eac0f4eb3fd167a080 [1/1] Merge drm/drm-next into drm-misc-next
config: x86_64-randconfig-076-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030003.rFCIAJNF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030003.rFCIAJNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030003.rFCIAJNF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c:41:3: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
      41 |         .num_busy_placement = 1,
         |          ^~~~~~~~~~~~~~~~~~
         |          num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
>> drivers/gpu/drm/xe/xe_bo.c:41:24: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      41 |         .num_busy_placement = 1,
         |                               ^
   drivers/gpu/drm/xe/xe_bo.c:39:19: note: previous initialization is here
      39 |         .num_placement = 1,
         |                          ^
   drivers/gpu/drm/xe/xe_bo.c:42:3: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
      42 |         .busy_placement = &sys_placement_flags,
         |          ^~~~~~~~~~~~~~
         |          num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:42:20: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'const struct ttm_place *' [-Wint-conversion]
      42 |         .busy_placement = &sys_placement_flags,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:42:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      42 |         .busy_placement = &sys_placement_flags,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:41:24: note: previous initialization is here
      41 |         .num_busy_placement = 1,
         |                               ^
   drivers/gpu/drm/xe/xe_bo.c:55:3: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
      55 |         .num_busy_placement = 1,
         |          ^~~~~~~~~~~~~~~~~~
         |          num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:55:24: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      55 |         .num_busy_placement = 1,
         |                               ^
   drivers/gpu/drm/xe/xe_bo.c:53:19: note: previous initialization is here
      53 |         .num_placement = 1,
         |                          ^
   drivers/gpu/drm/xe/xe_bo.c:56:3: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
      56 |         .busy_placement = &sys_placement_flags,
         |          ^~~~~~~~~~~~~~
         |          num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:56:20: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'const struct ttm_place *' [-Wint-conversion]
      56 |         .busy_placement = &sys_placement_flags,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:56:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
      56 |         .busy_placement = &sys_placement_flags,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:55:24: note: previous initialization is here
      55 |         .num_busy_placement = 1,
         |                               ^
   drivers/gpu/drm/xe/xe_bo.c:233:4: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
     233 |                 .num_busy_placement = c,
         |                  ^~~~~~~~~~~~~~~~~~
         |                  num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:233:25: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
     233 |                 .num_busy_placement = c,
         |                                       ^
   drivers/gpu/drm/xe/xe_bo.c:231:20: note: previous initialization is here
     231 |                 .num_placement = c,
         |                                  ^
   drivers/gpu/drm/xe/xe_bo.c:234:4: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
     234 |                 .busy_placement = bo->placements,
         |                  ^~~~~~~~~~~~~~
         |                  num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:234:21: error: incompatible pointer to integer conversion initializing 'unsigned int' with an expression of type 'struct ttm_place[3]' [-Wint-conversion]
     234 |                 .busy_placement = bo->placements,
         |                                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:234:21: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
     234 |                 .busy_placement = bo->placements,
         |                                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c:233:25: note: previous initialization is here
     233 |                 .num_busy_placement = c,
         |                                       ^
   drivers/gpu/drm/xe/xe_bo.c:254:15: error: no member named 'num_busy_placement' in 'struct ttm_placement'; did you mean 'num_placement'?
     254 |                         placement->num_busy_placement = 0;
         |                                    ^~~~~~~~~~~~~~~~~~
         |                                    num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:1356:4: error: field designator 'num_busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?
    1356 |                 .num_busy_placement = 1,
         |                  ^~~~~~~~~~~~~~~~~~
         |                  num_placement
   include/drm/ttm/ttm_placement.h:99:12: note: 'num_placement' declared here
      99 |         unsigned                num_placement;
         |                                 ^
   drivers/gpu/drm/xe/xe_bo.c:1356:25: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
    1356 |                 .num_busy_placement = 1,
         |                                       ^
   drivers/gpu/drm/xe/xe_bo.c:1354:20: note: previous initialization is here
    1354 |                 .num_placement = 1,
         |                                  ^
   drivers/gpu/drm/xe/xe_bo.c:1357:4: error: field designator 'busy_placement' does not refer to any field in type 'struct ttm_placement'; did you mean 'num_placement'?

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +41 drivers/gpu/drm/xe/xe_bo.c

dd08ebf6c3525a Matthew Brost 2023-03-30  37  
dd08ebf6c3525a Matthew Brost 2023-03-30  38  static struct ttm_placement sys_placement = {
dd08ebf6c3525a Matthew Brost 2023-03-30  39  	.num_placement = 1,
dd08ebf6c3525a Matthew Brost 2023-03-30  40  	.placement = &sys_placement_flags,
dd08ebf6c3525a Matthew Brost 2023-03-30 @41  	.num_busy_placement = 1,
dd08ebf6c3525a Matthew Brost 2023-03-30  42  	.busy_placement = &sys_placement_flags,
dd08ebf6c3525a Matthew Brost 2023-03-30  43  };
dd08ebf6c3525a Matthew Brost 2023-03-30  44  

:::::: The code at line 41 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
