Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA47F0B1C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 04:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8730010E23B;
	Mon, 20 Nov 2023 03:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16D910E1CD;
 Mon, 20 Nov 2023 03:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700451657; x=1731987657;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IlPqiDrz3tKuyD7L4wQ6R/Nl5fvYg+pnDt+lTYjtfrU=;
 b=dvOtLtXouQiV6Nf4FqjF1aCF/GH/r/F9dFrLZr2zy8VLJKskfivrUA2u
 AJx0lTj5ay0GerK34jBmQ3r1UC9I/Ak3O9L4yehkUWbTlqHQD5O0+bjU7
 cfiYIR89TCiVjrAGsKW1aZmwcqQn0vbCWF/h/6CP8ILobH/ZJ1lOqeyLE
 Vpfolu8kH9Y1AH0vBioB1DgSiyu3yU5kq88i8c+SiYR0f42JbN5KrZpve
 Ew+2DZ4993T8+gdG/DxRj78Y9rOT55iXO3zV7lgABCvt2v3PC928NYVTK
 83pIQlYhdTu5UtK2JgLrae6HAn0VoWZTu4Au8EDQ+7snmRaAtDtilLv7D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="370887642"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="370887642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 19:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7427393"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 19 Nov 2023 19:40:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r4v9Y-0005uZ-2Z;
 Mon, 20 Nov 2023 03:40:52 +0000
Date: Mon, 20 Nov 2023 11:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [drm-intel:for-linux-next-gt 1/6]
 drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: non-void function does
 not return a value
Message-ID: <202311201118.Jmt74ras-lkp@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   3c7a5eb700661e8905ab4e50c2d09c6568125280
commit: e4ae85e364fc652ea15d85b0f3a6da304c9b5ce7 [1/6] drm/i915: Add ability for tracking buffer objects per client
config: i386-buildonly-randconfig-006-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201118.Jmt74ras-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201118.Jmt74ras-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201118.Jmt74ras-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
   In file included from drivers/gpu/drm/i915/i915_debugfs_params.c:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:54:
>> drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: non-void function does not return a value [-Wreturn-type]
   }
   ^
   7 warnings generated.


vim +81 drivers/gpu/drm/i915/i915_drm_client.h

    78	
    79	static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
    80	{
  > 81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
