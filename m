Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C59B326EC
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 07:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339110E06C;
	Sat, 23 Aug 2025 05:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLMa6rvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9110E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755927419; x=1787463419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1tUpIASBQrRnxUJgYcJxXdTtAc/gOVsJeaZLSIXbdgA=;
 b=VLMa6rvwZUFAkAs7gJIyxxFi27AhnYI0Hg+2Jn+VVcQGXJw6clUatgS+
 qHS6J83Rit3lkoHKhLrfsEhtKdiCCnWq//FaGXhHy8h2NDCGKkFToQhQg
 CiWirBuNo3i4RkxXWwKebOdsY17+pmJxIE1ye74JbyT4XZZbw9qcGt6kw
 CJvwJdk7KSQNDUGqE+OmenYvqHODqH1ZyDUFknG3eBhhPhjjcdn7vfWW/
 bNUgkhHgLdsjSVXbnbsabHA9kVV+RPOCnXxCMslkSCCcDAom02X7Ty6zU
 gzSQs7Q3ivlFjAQvBSuqFrdCz0KJhf9RTZqVdwn8uktMYdX/KdNV4RiOc w==;
X-CSE-ConnectionGUID: ducY081vTtuYnjjSNyZmVQ==
X-CSE-MsgGUID: ktr7QiTiSLuOCV2a+XObZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58178131"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58178131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 22:36:58 -0700
X-CSE-ConnectionGUID: koOk2SmgRrGtXkcIZHYKQA==
X-CSE-MsgGUID: W9tA1HNtRXy871+AluoCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168763733"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 22 Aug 2025 22:36:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1upgvu-000M6p-0l;
 Sat, 23 Aug 2025 05:36:54 +0000
Date: Sat, 23 Aug 2025 13:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Message-ID: <202508231334.pWN5ScdS-lkp@intel.com>
References: <20250822142954.902402-2-faith.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142954.902402-2-faith.ekstrand@collabora.com>
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

Hi Faith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faith-Ekstrand/drm-shmem-Add-a-drm_gem_shmem_sync_mmap-helper/20250822-223306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822142954.902402-2-faith.ekstrand%40collabora.com
patch subject: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
config: x86_64-buildonly-randconfig-003-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231334.pWN5ScdS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231334.pWN5ScdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231334.pWN5ScdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:673 function parameter 'dir' not described in 'drm_gem_shmem_sync_mmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
