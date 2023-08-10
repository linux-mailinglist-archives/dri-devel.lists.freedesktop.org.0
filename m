Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA5777EDE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 19:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FE210E199;
	Thu, 10 Aug 2023 17:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CCF10E199
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691687544; x=1723223544;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ztHccN4uK1QNpdAB8tzxeS2pHdz7ydchs5vr3hkbkLE=;
 b=b/PN4F1Bwhkbep2jIY2/kCjZaXhiEE1Fv8XwrqMr0zVDgc47wyTWnXdj
 RKn5eF1HuyNb/KYBvxP/gbiVJyv2VMFxkZqGfhgtLbQTrHpDMtlqwhEgz
 h3gXCR2CYm2zzZ90Mmfq5JGzK9WqMizLh70ZEPM1slFcP9t9+KxbHfizo
 M63LeBcUTeVjhDV57e+OPrV8roNxFzpIYDPerc/UEgtsd/2zAHcQA1Vyd
 LxJoKBURWa0oRg5/GrqFxReP7nSgk/dOTFXRzun1jV3llujwGkFLguYRR
 5yF3k0IqODmJXMTtfx4zUfwluPkD+u2JHHeo/ZbMawkYaEJXQk1XFgxqq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361605835"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="361605835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 10:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="1062994071"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="1062994071"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 10 Aug 2023 10:12:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qU9Co-00078C-1M;
 Thu, 10 Aug 2023 17:12:14 +0000
Date: Fri, 11 Aug 2023 01:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [drm-misc:for-linux-next 1/3] ld.lld: error: undefined symbol:
 vmf_insert_pfn_prot
Message-ID: <202308110133.f0lhFwMV-lkp@intel.com>
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
Cc: llvm@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2799804ac651da1375ecb9b9a644eba97218df07
commit: e3912d09bf8ddd8e274118d4c9cc550d9665115d [1/3] drm/ttm: Introduce KUnit test
config: riscv-randconfig-r022-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110133.f0lhFwMV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110133.f0lhFwMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110133.f0lhFwMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vmf_insert_pfn_prot
   >>> referenced by ttm_bo_vm.c
   >>>               drivers/gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_fault_reserved) in archive vmlinux.a
   >>> referenced by ttm_bo_vm.c
   >>>               drivers/gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_dummy_page) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - DRM_TTM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
