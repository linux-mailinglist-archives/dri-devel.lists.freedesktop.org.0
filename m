Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB47E80F2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 19:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3B10E130;
	Fri, 10 Nov 2023 18:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D1D10E130;
 Fri, 10 Nov 2023 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699640458; x=1731176458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dZi44k3TgPgnnNlNBP+yBAC74XU+dQcO86pQx+Yfm7U=;
 b=nWXy27U0EuvU4pGOs+ONkUH5SOEMtyXvGf0uhHcKvLBO72Pjcn8xp5bk
 UaKhiNtOeSqhFo3S0MbPzzyqcd8nGGWcnWfXBxwulGn5LUix5XYUJxvAs
 Iix+yc+lL9H/wZKG6HMbj4RDadxJv92nucJdR5ShqWbPBYI8RddivEdOh
 fN/TfHY75sBUdwMiTe7Em6MD+szzwrcrWN1hnnHCK4iaITL23xLjvTfWx
 5H7OhWRKkhsANT0zoESWqRl4RcqxrhXKVz8b8D9wTgJUJpk5DbE++iUry
 mMFwccmW+vMOCvP+mvw8RTlhZw6QCljq39odr8B/w+DCMOXzhJYPSoMkh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="393091180"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="393091180"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 10:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011009099"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="1011009099"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 10:20:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1W7g-0009oA-2D;
 Fri, 10 Nov 2023 18:20:52 +0000
Date: Sat, 11 Nov 2023 02:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>, jani.nikula@linux.intel.com
Subject: Re: [Intel-gfx] [PATCH] Remove custom dumb_map_offset
 implementations in i915 driver
Message-ID: <202311110234.QjYxC2bv-lkp@intel.com>
References: <20231110105811.380646-1-dipamt1729@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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
config: x86_64-randconfig-014-20231110 (https://download.01.org/0day-ci/archive/20231111/202311110234.QjYxC2bv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110234.QjYxC2bv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110234.QjYxC2bv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'i915_gem_mmap_offset_ioctl':
   drivers/gpu/drm/i915/gem/i915_gem_mman.c:673:16: error: implicit declaration of function '__assign_mmap_offset_handle' [-Werror=implicit-function-declaration]
     673 |         return __assign_mmap_offset_handle(file, args->handle, type, &args->offset);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'i915_gem_fb_mmap':
   drivers/gpu/drm/i915/gem/i915_gem_mman.c:896:23: error: implicit declaration of function 'mmap_offset_attach' [-Werror=implicit-function-declaration]
     896 |                 mmo = mmap_offset_attach(obj, mmap_type, NULL);
         |                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_mman.c:896:21: warning: assignment to 'struct i915_mmap_offset *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     896 |                 mmo = mmap_offset_attach(obj, mmap_type, NULL);
         |                     ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_mman.c:912:
   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c: In function 'assert_mmap_offset':
>> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:624:15: error: implicit declaration of function '__assign_mmap_offset'; did you mean 'assert_mmap_offset'? [-Werror=implicit-function-declaration]
     624 |         ret = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               assert_mmap_offset
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +624 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c

450cede7f3804c Thomas Hellström  2021-08-31  611  
b414fcd5be0b00 Chris Wilson      2019-05-28  612  static bool assert_mmap_offset(struct drm_i915_private *i915,
b414fcd5be0b00 Chris Wilson      2019-05-28  613  			       unsigned long size,
b414fcd5be0b00 Chris Wilson      2019-05-28  614  			       int expected)
b414fcd5be0b00 Chris Wilson      2019-05-28  615  {
b414fcd5be0b00 Chris Wilson      2019-05-28  616  	struct drm_i915_gem_object *obj;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  617  	u64 offset;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  618  	int ret;
b414fcd5be0b00 Chris Wilson      2019-05-28  619  
450cede7f3804c Thomas Hellström  2021-08-31  620  	obj = create_sys_or_internal(i915, size);
b414fcd5be0b00 Chris Wilson      2019-05-28  621  	if (IS_ERR(obj))
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  622  		return expected && expected == PTR_ERR(obj);
b414fcd5be0b00 Chris Wilson      2019-05-28  623  
7961c5b60f23df Maarten Lankhorst 2021-07-14 @624  	ret = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
b414fcd5be0b00 Chris Wilson      2019-05-28  625  	i915_gem_object_put(obj);
b414fcd5be0b00 Chris Wilson      2019-05-28  626  
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  627  	return ret == expected;
b414fcd5be0b00 Chris Wilson      2019-05-28  628  }
b414fcd5be0b00 Chris Wilson      2019-05-28  629  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
