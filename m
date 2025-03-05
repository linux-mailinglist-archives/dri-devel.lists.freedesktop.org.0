Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A30A50C97
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 21:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57310E021;
	Wed,  5 Mar 2025 20:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QanaEsTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D010E021;
 Wed,  5 Mar 2025 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741206844; x=1772742844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7xc6affgJOgkljfTCmOcPekVUZTVTFuBJmIOVkcm8ng=;
 b=QanaEsTdulDsTBtOjvUyqUcPc8+jbxP926arUwZmwas78WmM+1I3LkBz
 XEkhbcD3vTCVKM2wdMiuuimQU8LrrFdet3S32FoXue1HfNsukEckD5rgv
 ++gjRyzxK4AAaA7ILmLk2pd59JgzzsaZF1tfZdKSzuQvKBQTP0MIcUqiL
 w6SQn9URKlTLhFQDGJFG0YKzaaIofd/xXARP5h61G7S/QXjR4b/ohb0ee
 TnsOnk6065vWJ4PBsml3Qs311TZqRtjJL2eLjtTEuFA8OULw1RbuDBB2l
 PnZbi1Vtxsap4qFy0Gb54JBdFCJ8iTAJzF3Nh2uX1/c3mG2XomsvVJo62 w==;
X-CSE-ConnectionGUID: Xi93Cv23S8+MEPx/VGrVvQ==
X-CSE-MsgGUID: ZPaI3tjnRKGIAGnVmXuB6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42390877"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="42390877"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 12:34:03 -0800
X-CSE-ConnectionGUID: Cat/6xHiTK6/5A4vcry94w==
X-CSE-MsgGUID: 6VMxDH1cTg+37EWzDzCpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118723576"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 12:33:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tpvRE-000MB6-2X;
 Wed, 05 Mar 2025 20:33:56 +0000
Date: Thu, 6 Mar 2025 04:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, pekka.paalanen@haloniitty.fi,
 sebastian.wick@redhat.com, jadahl@redhat.com, mwen@igalia.com,
 contact@emersion.fr, naveen1.kumar@intel.com, dmitry.baryshkov@linaro.org
Subject: Re: [v3 01/23] drm: color pipeline base work
Message-ID: <202503060423.nDtYFy3Y-lkp@intel.com>
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
config: riscv-randconfig-002-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060423.nDtYFy3Y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060423.nDtYFy3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060423.nDtYFy3Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_colorop.c:162:6: warning: no previous prototype for 'drm_colorop_cleanup' [-Wmissing-prototypes]
     162 | void drm_colorop_cleanup(struct drm_colorop *colorop)
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/module.h:22,
                    from include/kunit/test.h:24,
                    from drivers/gpu/drm/vkms/tests/vkms_color_test.c:3:
>> drivers/gpu/drm/vkms/tests/vkms_color_test.c:13:18: error: expected ',' or ';' before 'EXPORTED_FOR_KUNIT_TESTING'
      13 | MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
      26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
         |                                                             ^~~~
   include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
     299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
         |                                 ^~~~~~~~~~~
   drivers/gpu/drm/vkms/tests/vkms_color_test.c:13:1: note: in expansion of macro 'MODULE_IMPORT_NS'
      13 | MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
         | ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


vim +13 drivers/gpu/drm/vkms/tests/vkms_color_test.c

    12	
  > 13	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
