Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316BACFAB6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 03:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E9D10E2FB;
	Fri,  6 Jun 2025 01:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEzUVX7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7B710E319
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 01:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749173332; x=1780709332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mmO6t2nxNp7O6T3etaZF1E1QaseaqFlqJHGPybmOXdA=;
 b=iEzUVX7IaUTew/6QmktRC5vcRnQG3MHrPkb4zOrDCijBP4I4r1nwU7mQ
 TCwAinVqIQUPXavhnRZNTpfeQqW3NqvpJS4Hb4sBHzXlWX2BGCK1rWUli
 IaIzzbp2QupgLcMNhUOto0pVKjpFFagRWzqdwPlFHlF3xWVRPmZ8GWBQG
 GEcbAYXiiQsVPgj6xpBPdNFJYNeVDcmzDrWzCfa35GIpW4Cp1+MjJnfoT
 76T0CwyvcGwYZR1JyLTiecRWfXub37Ww2UgvW6Inoaq04ulEFSw0Ie0kR
 r4eGJstCDrqFwMAOHSNCO+V69XfPumz6xl+2ijCAzNnem8qdEWC7XzfuG w==;
X-CSE-ConnectionGUID: 0Nu30ySOSqaQMm3XUdNblA==
X-CSE-MsgGUID: IcfimK/2Q3uuAL3WLpe/tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51197054"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51197054"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 18:28:51 -0700
X-CSE-ConnectionGUID: 4yeMr70GQ/yKyOMGEsDEbg==
X-CSE-MsgGUID: LpHLK8swSy+l0X9Vw0hXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="176536453"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2025 18:28:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uNLt1-0004cP-04;
 Fri, 06 Jun 2025 01:28:47 +0000
Date: Fri, 6 Jun 2025 09:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arthurgrillo@riseup.net,
 jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/format-helper: Move drm_fb_build_fourcc_list()
 to sysfb helpers
Message-ID: <202506060951.1Ad66SUT-lkp@intel.com>
References: <20250604154844.28995-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604154844.28995-4-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20250605]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-tests-Do-not-use-drm_fb_blit-in-format-helper-tests/20250604-235451
base:   linus/master
patch link:    https://lore.kernel.org/r/20250604154844.28995-4-tzimmermann%40suse.de
patch subject: [PATCH 3/3] drm/format-helper: Move drm_fb_build_fourcc_list() to sysfb helpers
config: arm-randconfig-003-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060951.1Ad66SUT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060951.1Ad66SUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060951.1Ad66SUT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_sysfb_build_fourcc_list" [drivers/gpu/drm/tests/drm_sysfb_helper_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
