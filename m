Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615617E7C94
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 14:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B0A10E047;
	Fri, 10 Nov 2023 13:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EFD10E047
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699623216; x=1731159216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5IcUF/otYdlJ+LWh5Vmq5mSFolDipvdSkMRiFuEUJRE=;
 b=d70V3eY1RwpCrST77Hewyc7ASFQUMX1bVJi51ydiCB7bfNXFk7OMPiD8
 QZDV3jOnsCj+7Gqc1+yrQ1SOV7riOLTwHyJOha0JHsGrUiMw3GJfUPeMD
 m9/pEyVEvz3ZiHzhK3bL3D2F+thzzQxh61vDMoxZKRIlvCqtsTSx4ME74
 w7GQNHE1FCDqzf90qrLyLfdFgik43jpgbGkpmT3hj4GpuQOVJtnvVojqV
 5OXezwP/2Kh9KuM5MDydlEIzzZ1TOyhwAnGFTyLJ/bQ6n7lABhhUDfA68
 saNIf1IK9iKJDBLDb0IlWkJB/7m/cYmHbB4AmPeR1iix5+9IPmfX/zAqL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370386918"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="370386918"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 05:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740164665"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="740164665"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 05:33:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r1Rdb-0009cM-0x;
 Fri, 10 Nov 2023 13:33:31 +0000
Date: Fri, 10 Nov 2023 21:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 2/8] drm/ttm/tests: Add tests for ttm_tt
Message-ID: <202311102150.uqD1nk5m-lkp@intel.com>
References: <cdc3571116060fed572b6e82623a9c9455c9b716.1699445194.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc3571116060fed572b6e82623a9c9455c9b716.1699445194.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, oe-kbuild-all@lists.linux.dev,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20231108-225515
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/cdc3571116060fed572b6e82623a9c9455c9b716.1699445194.git.karolina.stolarek%40intel.com
patch subject: [PATCH v6 2/8] drm/ttm/tests: Add tests for ttm_tt
config: x86_64-randconfig-122-20231110 (https://download.01.org/0day-ci/archive/20231110/202311102150.uqD1nk5m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102150.uqD1nk5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102150.uqD1nk5m-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/tests/ttm_tt_test.c:232:25: sparse: sparse: symbol 'ttm_dev_empty_funcs' was not declared. Should it be static?

vim +/ttm_dev_empty_funcs +232 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

   231	
 > 232	struct ttm_device_funcs ttm_dev_empty_funcs = {
   233		.ttm_tt_create = ttm_tt_null_create,
   234	};
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
