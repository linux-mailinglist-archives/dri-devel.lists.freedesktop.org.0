Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD7B0E231
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 18:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2212F10E30F;
	Tue, 22 Jul 2025 16:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvXXYSIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88A510E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753203195; x=1784739195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CkaSBlwzzYaGcAnLPWY/P+SSy1fbLBWJPLy6c9IYQlI=;
 b=bvXXYSIpiPwOgEP6/GvctIMANulcvHkF725K28dYyAxeR3bx30oP90zR
 rHOVuQVlt9A4VZ7CRxNfRe/9XSTkTMwA0MfpEh5kK2kUfHxZgohOh/4Js
 RzqTwOr7lQEoDnlD2eaWjH7N0DHWUbkm51hxU9oyDUxYTuRWeV14eBgR+
 xmPH43NKWHPzskeNfI4Ob36ybkicykUNjw2oYsXvgaYUhojoQDlVY1Uo/
 fX8f1MAgXAmpH+eKy7lePHt7fbnQfAvUOJI/zieQifUuqQ6nap/qjI7SY
 SiktKOV0oaH5d0KBunQB+7H5rGY6W41y2Pj+SX6lVNNjiqFZHtJKNqYuG A==;
X-CSE-ConnectionGUID: RwsGNQ9nS5mJL+jnUFBlaQ==
X-CSE-MsgGUID: l9Rs6kEhSnugDYHnRpKz6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55316299"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55316299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 09:53:15 -0700
X-CSE-ConnectionGUID: HEoKRkggRsaAZDKRCtkP8w==
X-CSE-MsgGUID: sm7HFahMQHucoTbGEEvprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158495843"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 22 Jul 2025 09:53:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ueGEo-000IYZ-14;
 Tue, 22 Jul 2025 16:53:10 +0000
Date: Wed, 23 Jul 2025 00:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
 Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 15/15] ttm: add support for a module option to disable
 memcg integration
Message-ID: <202507230039.EESybnUE-lkp@intel.com>
References: <20250722014942.1878844-16-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722014942.1878844-16-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc7 next-20250722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20250722-104402
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250722014942.1878844-16-airlied%40gmail.com
patch subject: [PATCH 15/15] ttm: add support for a module option to disable memcg integration
config: x86_64-buildonly-randconfig-001-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230039.EESybnUE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230039.EESybnUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230039.EESybnUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.c:132:27: error: 'CONFIG_DRM_TTM_MEMCG' undeclared here (not in a function); did you mean 'CONFIG_DRM_TTM_HELPER'?
     132 | #define DEFAULT_TTM_MEMCG CONFIG_DRM_TTM_MEMCG
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:133:25: note: in expansion of macro 'DEFAULT_TTM_MEMCG'
     133 | static bool ttm_memcg = DEFAULT_TTM_MEMCG;
         |                         ^~~~~~~~~~~~~~~~~


vim +132 drivers/gpu/drm/ttm/ttm_pool.c

   120	
   121	/*
   122	 * Don't use the memcg aware lru for pooled pages.
   123	 *
   124	 * There are use-cases where for example one application in a cgroup will preallocate 1GB
   125	 * of uncached pages, and immediately release them into the pool, for other consumers
   126	 * to use. This use-case could be handled with a proper cgroup hierarchy, but to allow
   127	 * that use case to continue to operate as-is, add a module option.
   128	 *
   129	 * This still stores the pages in the list_lru, it just doesn't use the memcg when
   130	 * adding/removing them.
   131	 */
 > 132	#define DEFAULT_TTM_MEMCG CONFIG_DRM_TTM_MEMCG
   133	static bool ttm_memcg = DEFAULT_TTM_MEMCG;
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
