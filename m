Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112807E7DE7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A90A10E120;
	Fri, 10 Nov 2023 16:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B956010E125;
 Fri, 10 Nov 2023 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699635205; x=1731171205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=R9/TiweBvX/91g5bNaHjTqb1OT2ta6eiBlXafdqpk7k=;
 b=As66f9zKLSqMTbd+uhLwoRkFn6gYj3km2C49jHRCDmhrC8tQap7jLvJv
 1g5eGHkN19i3/04wQJl+lk3ZAzuAp+iHWqqnVPcg1WrWvGadXHhG1JljS
 QobCYb2IG2U1Q9+2E2OAzF03SJTXSCyT5XY0X/vXTee9swyQW0UW21EFG
 Eg0yqEAB8fI7fVMu6ZpQMK0TkNt6eBI5aOrs9CAdM/4Q/2/OjOgE4nLKV
 NUYzf4COBwvS+m2PeE0HsS7hKxDoD0Sq1kQFcFZDi88MKSmDph9bqou7A
 xAIhCfRZ2VCb/Rlv/yMsF4qmf8c7Gkp2rMHAVuyyb7bTC5bmJdsaFiYTJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393079657"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="393079657"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 08:53:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937207578"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937207578"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 08:53:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1Uku-0009ko-03;
 Fri, 10 Nov 2023 16:53:16 +0000
Date: Sat, 11 Nov 2023 00:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>, jani.nikula@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH] Remove custom dumb_map_offset
 implementations in i915 driver
Message-ID: <202311110053.K5lNjN1W-lkp@intel.com>
References: <20231110105811.380646-1-dipamt1729@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110105811.380646-1-dipamt1729@gmail.com>
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dipam,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Dipam-Turkar/Remove-custom-dumb_map_offset-implementations-in-i915-driver/20231110-185942
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231110105811.380646-1-dipamt1729%40gmail.com
patch subject: [Intel-gfx] [PATCH] Remove custom dumb_map_offset implementations in i915 driver
config: x86_64-randconfig-012-20231110 (https://download.01.org/0day-ci/archive/20231111/202311110053.K5lNjN1W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110053.K5lNjN1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110053.K5lNjN1W-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'i915_gem_mmap_offset_ioctl':
>> drivers/gpu/drm/i915/gem/i915_gem_mman.c:673:16: error: implicit declaration of function '__assign_mmap_offset_handle' [-Werror=implicit-function-declaration]
     673 |         return __assign_mmap_offset_handle(file, args->handle, type, &args->offset);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'i915_gem_fb_mmap':
>> drivers/gpu/drm/i915/gem/i915_gem_mman.c:896:23: error: implicit declaration of function 'mmap_offset_attach' [-Werror=implicit-function-declaration]
     896 |                 mmo = mmap_offset_attach(obj, mmap_type, NULL);
         |                       ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_mman.c:896:21: warning: assignment to 'struct i915_mmap_offset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     896 |                 mmo = mmap_offset_attach(obj, mmap_type, NULL);
         |                     ^
   cc1: some warnings being treated as errors
--
>> drivers/gpu/drm/i915/i915_driver.c:1826:28: error: 'drm_gem_dumb_mmap_offset' undeclared here (not in a function); did you mean 'drm_gem_dumb_map_offset'?
    1826 |         .dumb_map_offset = drm_gem_dumb_mmap_offset,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~
         |                            drm_gem_dumb_map_offset


vim +/__assign_mmap_offset_handle +673 drivers/gpu/drm/i915/gem/i915_gem_mman.c

cc662126b4134e Abdiel Janulgue   2019-12-04  603  
b414fcd5be0b00 Chris Wilson      2019-05-28  604  /**
cc662126b4134e Abdiel Janulgue   2019-12-04  605   * i915_gem_mmap_offset_ioctl - prepare an object for GTT mmap'ing
b414fcd5be0b00 Chris Wilson      2019-05-28  606   * @dev: DRM device
b414fcd5be0b00 Chris Wilson      2019-05-28  607   * @data: GTT mapping ioctl data
b414fcd5be0b00 Chris Wilson      2019-05-28  608   * @file: GEM object info
b414fcd5be0b00 Chris Wilson      2019-05-28  609   *
b414fcd5be0b00 Chris Wilson      2019-05-28  610   * Simply returns the fake offset to userspace so it can mmap it.
b414fcd5be0b00 Chris Wilson      2019-05-28  611   * The mmap call will end up in drm_gem_mmap(), which will set things
b414fcd5be0b00 Chris Wilson      2019-05-28  612   * up so we can get faults in the handler above.
b414fcd5be0b00 Chris Wilson      2019-05-28  613   *
b414fcd5be0b00 Chris Wilson      2019-05-28  614   * The fault handler will take care of binding the object into the GTT
b414fcd5be0b00 Chris Wilson      2019-05-28  615   * (since it may have been evicted to make room for something), allocating
b414fcd5be0b00 Chris Wilson      2019-05-28  616   * a fence register, and mapping the appropriate aperture address into
b414fcd5be0b00 Chris Wilson      2019-05-28  617   * userspace.
b414fcd5be0b00 Chris Wilson      2019-05-28  618   */
b414fcd5be0b00 Chris Wilson      2019-05-28  619  int
cc662126b4134e Abdiel Janulgue   2019-12-04  620  i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
b414fcd5be0b00 Chris Wilson      2019-05-28  621  			   struct drm_file *file)
b414fcd5be0b00 Chris Wilson      2019-05-28  622  {
cc662126b4134e Abdiel Janulgue   2019-12-04  623  	struct drm_i915_private *i915 = to_i915(dev);
cc662126b4134e Abdiel Janulgue   2019-12-04  624  	struct drm_i915_gem_mmap_offset *args = data;
cc662126b4134e Abdiel Janulgue   2019-12-04  625  	enum i915_mmap_type type;
126d5de38542d4 Chris Wilson      2019-12-04  626  	int err;
cc662126b4134e Abdiel Janulgue   2019-12-04  627  
8d65859a4cbae9 Chris Wilson      2019-12-07  628  	/*
8d65859a4cbae9 Chris Wilson      2019-12-07  629  	 * Historically we failed to check args.pad and args.offset
8d65859a4cbae9 Chris Wilson      2019-12-07  630  	 * and so we cannot use those fields for user input and we cannot
8d65859a4cbae9 Chris Wilson      2019-12-07  631  	 * add -EINVAL for them as the ABI is fixed, i.e. old userspace
8d65859a4cbae9 Chris Wilson      2019-12-07  632  	 * may be feeding in garbage in those fields.
8d65859a4cbae9 Chris Wilson      2019-12-07  633  	 *
8d65859a4cbae9 Chris Wilson      2019-12-07  634  	 * if (args->pad) return -EINVAL; is verbotten!
8d65859a4cbae9 Chris Wilson      2019-12-07  635  	 */
8d65859a4cbae9 Chris Wilson      2019-12-07  636  
126d5de38542d4 Chris Wilson      2019-12-04  637  	err = i915_user_extensions(u64_to_user_ptr(args->extensions),
126d5de38542d4 Chris Wilson      2019-12-04  638  				   NULL, 0, NULL);
126d5de38542d4 Chris Wilson      2019-12-04  639  	if (err)
126d5de38542d4 Chris Wilson      2019-12-04  640  		return err;
cc662126b4134e Abdiel Janulgue   2019-12-04  641  
cc662126b4134e Abdiel Janulgue   2019-12-04  642  	switch (args->flags) {
cc662126b4134e Abdiel Janulgue   2019-12-04  643  	case I915_MMAP_OFFSET_GTT:
5c24c9d227e9bb Michał Winiarski  2021-12-19  644  		if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
cc662126b4134e Abdiel Janulgue   2019-12-04  645  			return -ENODEV;
cc662126b4134e Abdiel Janulgue   2019-12-04  646  		type = I915_MMAP_TYPE_GTT;
cc662126b4134e Abdiel Janulgue   2019-12-04  647  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  648  
cc662126b4134e Abdiel Janulgue   2019-12-04  649  	case I915_MMAP_OFFSET_WC:
bdd8b6c98239ca Lucas De Marchi   2021-12-01  650  		if (!pat_enabled())
cc662126b4134e Abdiel Janulgue   2019-12-04  651  			return -ENODEV;
cc662126b4134e Abdiel Janulgue   2019-12-04  652  		type = I915_MMAP_TYPE_WC;
cc662126b4134e Abdiel Janulgue   2019-12-04  653  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  654  
cc662126b4134e Abdiel Janulgue   2019-12-04  655  	case I915_MMAP_OFFSET_WB:
cc662126b4134e Abdiel Janulgue   2019-12-04  656  		type = I915_MMAP_TYPE_WB;
cc662126b4134e Abdiel Janulgue   2019-12-04  657  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  658  
cc662126b4134e Abdiel Janulgue   2019-12-04  659  	case I915_MMAP_OFFSET_UC:
bdd8b6c98239ca Lucas De Marchi   2021-12-01  660  		if (!pat_enabled())
cc662126b4134e Abdiel Janulgue   2019-12-04  661  			return -ENODEV;
cc662126b4134e Abdiel Janulgue   2019-12-04  662  		type = I915_MMAP_TYPE_UC;
cc662126b4134e Abdiel Janulgue   2019-12-04  663  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  664  
7961c5b60f23df Maarten Lankhorst 2021-07-14  665  	case I915_MMAP_OFFSET_FIXED:
7961c5b60f23df Maarten Lankhorst 2021-07-14  666  		type = I915_MMAP_TYPE_FIXED;
7961c5b60f23df Maarten Lankhorst 2021-07-14  667  		break;
7961c5b60f23df Maarten Lankhorst 2021-07-14  668  
cc662126b4134e Abdiel Janulgue   2019-12-04  669  	default:
cc662126b4134e Abdiel Janulgue   2019-12-04  670  		return -EINVAL;
cc662126b4134e Abdiel Janulgue   2019-12-04  671  	}
cc662126b4134e Abdiel Janulgue   2019-12-04  672  
cf3e3e86d77970 Maarten Lankhorst 2021-06-10 @673  	return __assign_mmap_offset_handle(file, args->handle, type, &args->offset);
cc662126b4134e Abdiel Janulgue   2019-12-04  674  }
cc662126b4134e Abdiel Janulgue   2019-12-04  675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
