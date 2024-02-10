Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E18505B8
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 18:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30BA10E2AE;
	Sat, 10 Feb 2024 17:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6tbiNGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22A310E2AE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707585875; x=1739121875;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=tS8V8HIITBqd3bIuhBeZBzTIhWWkYVfBOCDMku2k+Jw=;
 b=N6tbiNGxHtJyT06W9U5ukbsndAP8LTVhaeLiqa7eHt8UxoNnLjIkkL4A
 VV3Sx/VACa/v7floulNAqtt/mDUhW/Y3hWKaIRix91rjbQqf+5Xk8h7cq
 AAUcV5hIL72ktptbQfvv/sIfjkYFsklaaycqhU+E4sMaF0VJbkkaqON1d
 E9GK4gaW+IyrpMeYKCvn+zRpO+/KwyRDoiDNry67Tak2PTAQH5xPZJz/Y
 lsbnt5NgDGXifHPo+oE4PqYXyNqGu5Hce+cev3P8bDY+NfbIpO1r1YcDY
 BU5n68NWr3ThqODEfK9kgb/Rugd+VJ4XZxPbuOlrLClyWr8T7O54LDeRh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12946318"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; d="scan'208";a="12946318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2024 09:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2181085"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2024 09:24:32 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rYr5a-0005uw-0T;
 Sat, 10 Feb 2024 17:24:30 +0000
Date: Sun, 11 Feb 2024 01:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
Subject: [drm-misc:for-linux-next 40/49]
 drivers/gpu/drm/xe/xe_guc_submit.c:814:48: error: passing argument 1 of
 'drm_err_printer' from incompatible pointer type
Message-ID: <202402110100.VAaZBzr1-lkp@intel.com>
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   7edd06233958d9086a9e3eb723a8768d3c5a9ce1
commit: 5e0c04c8c40b69ab165d52964433859d8b666376 [40/49] drm/print: make drm_err_printer() device specific by using drm_err()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240211/202402110100.VAaZBzr1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110100.VAaZBzr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110100.VAaZBzr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_guc_submit.c: In function 'simple_error_capture':
>> drivers/gpu/drm/xe/xe_guc_submit.c:814:48: error: passing argument 1 of 'drm_err_printer' from incompatible pointer type [-Werror=incompatible-pointer-types]
     814 |         struct drm_printer p = drm_err_printer("");
         |                                                ^~
         |                                                |
         |                                                char *
   In file included from drivers/gpu/drm/xe/xe_assert.h:11,
                    from drivers/gpu/drm/xe/xe_guc_submit.c:19:
   include/drm/drm_print.h:247:69: note: expected 'struct drm_device *' but argument is of type 'char *'
     247 | static inline struct drm_printer drm_err_printer(struct drm_device *drm,
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/xe/xe_guc_submit.c:814:32: error: too few arguments to function 'drm_err_printer'
     814 |         struct drm_printer p = drm_err_printer("");
         |                                ^~~~~~~~~~~~~~~
   include/drm/drm_print.h:247:34: note: declared here
     247 | static inline struct drm_printer drm_err_printer(struct drm_device *drm,
         |                                  ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_err_printer +814 drivers/gpu/drm/xe/xe_guc_submit.c

dd08ebf6c3525a Matthew Brost   2023-03-30  809  
dd08ebf6c3525a Matthew Brost   2023-03-30  810  #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
9b9529ce379a08 Francois Dugast 2023-07-31  811  static void simple_error_capture(struct xe_exec_queue *q)
dd08ebf6c3525a Matthew Brost   2023-03-30  812  {
9b9529ce379a08 Francois Dugast 2023-07-31  813  	struct xe_guc *guc = exec_queue_to_guc(q);
dd08ebf6c3525a Matthew Brost   2023-03-30 @814  	struct drm_printer p = drm_err_printer("");
dd08ebf6c3525a Matthew Brost   2023-03-30  815  	struct xe_hw_engine *hwe;
dd08ebf6c3525a Matthew Brost   2023-03-30  816  	enum xe_hw_engine_id id;
9b9529ce379a08 Francois Dugast 2023-07-31  817  	u32 adj_logical_mask = q->logical_mask;
9b9529ce379a08 Francois Dugast 2023-07-31  818  	u32 width_mask = (0x1 << q->width) - 1;
dd08ebf6c3525a Matthew Brost   2023-03-30  819  	int i;
dd08ebf6c3525a Matthew Brost   2023-03-30  820  	bool cookie;
dd08ebf6c3525a Matthew Brost   2023-03-30  821  
9b9529ce379a08 Francois Dugast 2023-07-31  822  	if (q->vm && !q->vm->error_capture.capture_once) {
9b9529ce379a08 Francois Dugast 2023-07-31  823  		q->vm->error_capture.capture_once = true;
dd08ebf6c3525a Matthew Brost   2023-03-30  824  		cookie = dma_fence_begin_signalling();
9b9529ce379a08 Francois Dugast 2023-07-31  825  		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
dd08ebf6c3525a Matthew Brost   2023-03-30  826  			if (adj_logical_mask & BIT(i)) {
dd08ebf6c3525a Matthew Brost   2023-03-30  827  				adj_logical_mask |= width_mask << i;
9b9529ce379a08 Francois Dugast 2023-07-31  828  				i += q->width;
dd08ebf6c3525a Matthew Brost   2023-03-30  829  			} else {
dd08ebf6c3525a Matthew Brost   2023-03-30  830  				++i;
dd08ebf6c3525a Matthew Brost   2023-03-30  831  			}
dd08ebf6c3525a Matthew Brost   2023-03-30  832  		}
dd08ebf6c3525a Matthew Brost   2023-03-30  833  
dd08ebf6c3525a Matthew Brost   2023-03-30  834  		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
513260dfd150a4 Rodrigo Vivi    2023-05-16  835  		xe_guc_ct_print(&guc->ct, &p, true);
9b9529ce379a08 Francois Dugast 2023-07-31  836  		guc_exec_queue_print(q, &p);
dd08ebf6c3525a Matthew Brost   2023-03-30  837  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
9b9529ce379a08 Francois Dugast 2023-07-31  838  			if (hwe->class != q->hwe->class ||
dd08ebf6c3525a Matthew Brost   2023-03-30  839  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
dd08ebf6c3525a Matthew Brost   2023-03-30  840  				continue;
a4db5555878519 Rodrigo Vivi    2023-05-16  841  			xe_hw_engine_print(hwe, &p);
dd08ebf6c3525a Matthew Brost   2023-03-30  842  		}
9b9529ce379a08 Francois Dugast 2023-07-31  843  		xe_analyze_vm(&p, q->vm, q->gt->info.id);
dd08ebf6c3525a Matthew Brost   2023-03-30  844  		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
dd08ebf6c3525a Matthew Brost   2023-03-30  845  		dma_fence_end_signalling(cookie);
dd08ebf6c3525a Matthew Brost   2023-03-30  846  	}
dd08ebf6c3525a Matthew Brost   2023-03-30  847  }
dd08ebf6c3525a Matthew Brost   2023-03-30  848  #else
9b9529ce379a08 Francois Dugast 2023-07-31  849  static void simple_error_capture(struct xe_exec_queue *q)
dd08ebf6c3525a Matthew Brost   2023-03-30  850  {
dd08ebf6c3525a Matthew Brost   2023-03-30  851  }
dd08ebf6c3525a Matthew Brost   2023-03-30  852  #endif
dd08ebf6c3525a Matthew Brost   2023-03-30  853  

:::::: The code at line 814 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
