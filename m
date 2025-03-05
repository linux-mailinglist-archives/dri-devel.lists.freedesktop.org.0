Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D8A50B83
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B510E2B6;
	Wed,  5 Mar 2025 19:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3sL7kRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10F10E2B1;
 Wed,  5 Mar 2025 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741203023; x=1772739023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cMmFBFf9szNiu9T5z9GzitqEPhArY0VccDYTOzDZWhs=;
 b=B3sL7kRyzzHqUHTp3hfBNCwiUCnY6km4dHjmU8ty7ZrMYQbZ/LQLWdjG
 J2OeQ7p3hs6E9P86etR8KDN44UeqCYjzfaBWwLn8iS8xh84z/ESEbpFCp
 sIAoI0E/wUExn53hzdLchN7Z7kka01xP7WnydQ4fa2CcNNBdcK8gPHlVY
 zjSzXqzfPvJYgTw61KhF08q3YtTiSQwcsppUMPHO8E4sD4IkVAGA31MVi
 2slMdx+uJKpn+oAPy/wwCdJbIvXOAgA7gCstO5aRuuv9jJs7tQq15Ud6k
 noTmmydQPc3KUjPn4DoukSd4Rwsy0our0e9Yze+djykA/6PlQHWcaQDAg A==;
X-CSE-ConnectionGUID: a91g8WTNSHO34JpUHACzLA==
X-CSE-MsgGUID: F7SFjNDfS/e8IFLqXRWZpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44993791"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="44993791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:30:22 -0800
X-CSE-ConnectionGUID: BeliJiNDT4C9h8C2hibEbw==
X-CSE-MsgGUID: H8ZQLCb4TaS3EMcRJ9pqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149718640"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2025 11:30:19 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tpuRd-000M5y-0U;
 Wed, 05 Mar 2025 19:30:17 +0000
Date: Thu, 6 Mar 2025 03:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com,
 jadahl@redhat.com, mwen@igalia.com, contact@emersion.fr,
 naveen1.kumar@intel.com, dmitry.baryshkov@linaro.org
Subject: Re: [v3 01/23] drm: color pipeline base work
Message-ID: <202503060317.IL9ThPki-lkp@intel.com>
References: <20250305132608.2379253-2-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305132608.2379253-2-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250305]
[also build test ERROR on v6.14-rc5]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.14-rc5 v6.14-rc4 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20250306-011827
base:   next-20250305
patch link:    https://lore.kernel.org/r/20250305132608.2379253-2-uma.shankar%40intel.com
patch subject: [v3 01/23] drm: color pipeline base work
config: x86_64-buildonly-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060317.IL9ThPki-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060317.IL9ThPki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060317.IL9ThPki-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vkms/tests/vkms_color_test.c:7:
   In file included from drivers/gpu/drm/vkms/tests/../vkms_drv.h:10:
   In file included from include/drm/drm_gem.h:42:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:2306:
   include/linux/vmstat.h:493:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     493 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     494 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:513:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     513 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     514 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vkms/tests/vkms_color_test.c:13:18: error: expected ';' after top level declarator
      13 | MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
         |                  ^
   4 warnings and 1 error generated.


vim +13 drivers/gpu/drm/vkms/tests/vkms_color_test.c

    12	
  > 13	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
