Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B28465B77
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 01:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665926E93D;
	Thu,  2 Dec 2021 00:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E86E8E3;
 Thu,  2 Dec 2021 00:56:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="235327493"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; d="scan'208";a="235327493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 16:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; d="scan'208";a="512249292"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2021 16:56:55 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1msaP9-000Faz-8m; Thu, 02 Dec 2021 00:56:55 +0000
Date: Thu, 2 Dec 2021 08:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] drm: move the buddy allocator from i915 into
 common drm
Message-ID: <202112020812.Si0y9psY-lkp@intel.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: kbuild-all@lists.01.org, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 llvm@lists.linux.dev, matthew.auld@intel.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arunpravin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on v5.16-rc3]
[cannot apply to drm/drm-next drm-tip/drm-tip next-20211201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Arunpravin/drm-move-the-buddy-allocator-from-i915-into-common-drm/20211202-004327
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a012-20211130 (https://download.01.org/0day-ci/archive/20211202/202112020812.Si0y9psY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/afbc900c0399e8c6220abd729932e877e81f37c8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin/drm-move-the-buddy-allocator-from-i915-into-common-drm/20211202-004327
        git checkout afbc900c0399e8c6220abd729932e877e81f37c8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/intel_memory_region.c:242:
>> drivers/gpu/drm/i915/selftests/intel_memory_region.c:23:10: fatal error: 'i915_buddy.h' file not found
   #include "i915_buddy.h"
            ^~~~~~~~~~~~~~
   1 error generated.


vim +23 drivers/gpu/drm/i915/selftests/intel_memory_region.c

232a6ebae419193 Matthew Auld     2019-10-08  14  
340be48f2c5a3c0 Matthew Auld     2019-10-25  15  #include "gem/i915_gem_context.h"
b908be543e44414 Matthew Auld     2019-10-25  16  #include "gem/i915_gem_lmem.h"
232a6ebae419193 Matthew Auld     2019-10-08  17  #include "gem/i915_gem_region.h"
340be48f2c5a3c0 Matthew Auld     2019-10-25  18  #include "gem/selftests/igt_gem_utils.h"
232a6ebae419193 Matthew Auld     2019-10-08  19  #include "gem/selftests/mock_context.h"
99919be74aa3753 Thomas Hellström 2021-06-17  20  #include "gt/intel_engine_pm.h"
6804da20bb549e3 Chris Wilson     2019-10-27  21  #include "gt/intel_engine_user.h"
b908be543e44414 Matthew Auld     2019-10-25  22  #include "gt/intel_gt.h"
d53ec322dc7de32 Matthew Auld     2021-06-16 @23  #include "i915_buddy.h"
99919be74aa3753 Thomas Hellström 2021-06-17  24  #include "gt/intel_migrate.h"
ba12993c5228015 Matthew Auld     2020-01-29  25  #include "i915_memcpy.h"
d53ec322dc7de32 Matthew Auld     2021-06-16  26  #include "i915_ttm_buddy_manager.h"
01377a0d7e6648b Abdiel Janulgue  2019-10-25  27  #include "selftests/igt_flush_test.h"
2f0b97ca0211863 Matthew Auld     2019-10-08  28  #include "selftests/i915_random.h"
232a6ebae419193 Matthew Auld     2019-10-08  29  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
