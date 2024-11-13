Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562979C6970
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 07:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E27A10E68B;
	Wed, 13 Nov 2024 06:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pzykdwsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C98E10E68B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731480215; x=1763016215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1HntU/U9oIkJa4i1c5lKFEApaWnibKDf6f+RMdat61o=;
 b=PzykdwslLWTmGU1iQnM/ehuaRCgWSXraY52O/Co5W98nK90F3qCK8KyD
 gVOQnbpshY/CsGv69ZG2URpxQ0Mhfu7F1PU7ZUZtu2QFGCqPJmMdQwSF0
 iBvE7ymWgVUimEyAvWAm2XdV8WCnMrsjia3GaS+QiEERoVcl3rD+FjxgE
 MYaVd3dE7+5kZCXWFuTgwDFEu4d7NBssIxUzAXSNw2zulfB/bsKBvclUy
 CjQXbbPT80Kwf8l+Rt1hO9MPK1to7V9fUcfv3+RZlV3NFqWHWK2K/4eHb
 MsUqsgk05wHla7zpdp2DfNQcSXYVwBLnXC7x4pVgeLECWwsRQ/QpVf2OR g==;
X-CSE-ConnectionGUID: WgF1tA6fTqKzs599TqE8kg==
X-CSE-MsgGUID: 4El+M1CGSsirOiDfIfJHWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18966254"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="18966254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 22:43:35 -0800
X-CSE-ConnectionGUID: gTHlVwJyR/+4vfkYN7Gf1w==
X-CSE-MsgGUID: kzUO2/+xRpS8K/Koi01z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92232704"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2024 22:43:30 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tB768-00003h-1Q;
 Wed, 13 Nov 2024 06:43:28 +0000
Date: Wed, 13 Nov 2024 14:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 liangjian010@huawei.com, chenjianmin@huawei.com,
 lidongming5@huawei.com, shiyongbang@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 1/5] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <202411131438.RZWYrWTE-lkp@intel.com>
References: <20241112132348.2631150-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112132348.2631150-2-shiyongbang@huawei.com>
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

Hi Yongbang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-misc/drm-misc-next v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241113-013224
base:   linus/master
patch link:    https://lore.kernel.org/r/20241112132348.2631150-2-shiyongbang%40huawei.com
patch subject: [PATCH v4 drm-dp 1/5] drm/hisilicon/hibmc: add dp aux in hibmc
config: x86_64-buildonly-randconfig-003-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131438.RZWYrWTE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131438.RZWYrWTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:9:
   In file included from drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:14:
   In file included from include/drm/display/drm_dp_helper.h:27:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:9:
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:31:11: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsigned long)0, long: (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (unsigned long long)0, default: (mask)))' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
      31 |         value |= FIELD_PREP(mask, val);
         |                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:53: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      74 |                                  _pfx "type of reg too small for mask"); \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   2 warnings generated.


vim +31 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h

    22	
    23	static inline void hibmc_dp_reg_write_field(struct hibmc_dp_dev *dp, u32 offset, u32 mask, u32 val)
    24	{
    25		u32 value;
    26	
    27		mutex_lock(&dp->lock);
    28	
    29		value = readl(dp->base + offset);
    30		value &= ~mask;
  > 31		value |= FIELD_PREP(mask, val);
    32		writel(value, dp->base + offset);
    33	
    34		mutex_unlock(&dp->lock);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
