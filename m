Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A74D6407
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 15:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAC210E45D;
	Fri, 11 Mar 2022 14:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBD10E45D;
 Fri, 11 Mar 2022 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647009920; x=1678545920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7imDiHgNuiMxr2hOIVDWdZH6orveZbeCw0iXTGMX94I=;
 b=aW3fzR9JsINyOdNoh7I2NcAff3zhHnG0mEXUzr66LaoyiYpUY3o0jouN
 pGb4kmW6m3+y1TQi8GYLAgqB76icdZOfeGDXI+LNMyGZlEIpkeUhzEz07
 g3MlQL9OKDIl/ocMKbI4Vzu7jG1bnjlWJ1utc4RisycvR4Pt69zAwAEqY
 +egUwuuDSz0dvTyU9d2+9pdwGi+V3zw1GgjAyETzFaaTZjG+HLgNR54VZ
 VHwJkZwW7TINaMVo4dtvrRnhDXFUXpzjd0+oExqgDuwPQK54nJc9vGPz5
 +NGxynjVfzdxjQECmqB9NIUPBD7QjuE2XYAuMNf01hiWLqCXhwFBmMFaY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280327416"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="280327416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 06:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="539014648"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 11 Mar 2022 06:45:11 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSgVy-0006ZT-JJ; Fri, 11 Mar 2022 14:45:10 +0000
Date: Fri, 11 Mar 2022 22:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/xehp: Update topology dumps for
 Xe_HP
Message-ID: <202203112234.rtvKSbsq-lkp@intel.com>
References: <20220311061543.153611-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311061543.153611-2-matthew.d.roper@intel.com>
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20220310]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matt-Roper/drm-i915-sseu-Don-t-overallocate-subslice-storage/20220311-141705
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220311/202203112234.rtvKSbsq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/38985b2e6acdbe67dedb5de8a8aeef917b746453
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matt-Roper/drm-i915-sseu-Don-t-overallocate-subslice-storage/20220311-141705
        git checkout 38985b2e6acdbe67dedb5de8a8aeef917b746453
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/ net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_sseu.c:59:5: warning: no previous prototype for function 'intel_sseu_get_geometry_subslices' [-Wmissing-prototypes]
   u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
       ^
   drivers/gpu/drm/i915/gt/intel_sseu.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
   ^
   static 
   1 warning generated.


vim +/intel_sseu_get_geometry_subslices +59 drivers/gpu/drm/i915/gt/intel_sseu.c

    58	
  > 59	u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)
    60	{
    61		return _intel_sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
    62	}
    63	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
