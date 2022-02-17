Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87444B9C42
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DA510EB8B;
	Thu, 17 Feb 2022 09:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EC910EB1D;
 Thu, 17 Feb 2022 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645090906; x=1676626906;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0n2mnzriut++++zqdobTTYF+VpbN2fheJCxQx2jXG0Y=;
 b=kE42y7WSNcox/iTbSbDnIeHJ0ODsawmMrNj+mwH9zC50TE48i4zCkamr
 aDQu2c5piH3N/seIvfoHMJquNLet9YQJC4ULyo9jjpwhK2ekmOWP7goI3
 sbbsIPSppgbrDnjDHuN28ZrBS4NAHcu2wbEkYwHhbBiM+2+ubphvNfKzB
 FeFixE1//hW3M9904ZjuK09zzgjd5H8j7SDY29rZRmv83alvpPUPsuM/i
 UOTqTUVrPPJa/Z76BkC1Tbt9wsHpcthNBXrEOvYCqtJHjmht+QEhjgHi5
 4T/yeKL23ncdpvOGZ9zstwuJnMZHMBCCKoh8IxYteDGbXqv2mA5SGpZKm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="238240361"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="238240361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 01:41:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="604840808"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2022 01:41:44 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKdIF-00001x-Gb; Thu, 17 Feb 2022 09:41:43 +0000
Date: Thu, 17 Feb 2022 17:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: [drm-intel:topic/core-for-CI 1/1]
 drivers/gpu/drm/i915/intel_device_info.c:236:14: error:
 'INTEL_SUBPLATFORM_G12' undeclared; did you mean 'INTEL_SUBPLATFORM_G10'?
Message-ID: <202202171718.0GTDm2wX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 Caz Yokoyama <caz.yokoyama@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/core-for-CI
head:   b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b
commit: b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b [1/1] drm/i915: Add DG2 PCI IDs
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20220217/202202171718.0GTDm2wX-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel topic/core-for-CI
        git checkout b56d8d7bad86a9badc1d1b9ea2d1730fa1d3978b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:10,
                    from include/drm/drm_print.h:30,
                    from drivers/gpu/drm/i915/intel_device_info.c:25:
   drivers/gpu/drm/i915/intel_device_info.c: In function 'intel_device_info_subplatform_init':
>> drivers/gpu/drm/i915/intel_device_info.c:236:14: error: 'INTEL_SUBPLATFORM_G12' undeclared (first use in this function); did you mean 'INTEL_SUBPLATFORM_G10'?
     236 |   mask = BIT(INTEL_SUBPLATFORM_G12);
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:30: note: in definition of macro 'BIT'
       7 | #define BIT(nr)   (UL(1) << (nr))
         |                              ^~
   drivers/gpu/drm/i915/intel_device_info.c:236:14: note: each undeclared identifier is reported only once for each function it appears in
     236 |   mask = BIT(INTEL_SUBPLATFORM_G12);
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:30: note: in definition of macro 'BIT'
       7 | #define BIT(nr)   (UL(1) << (nr))
         |                              ^~


vim +236 drivers/gpu/drm/i915/intel_device_info.c

   201	
   202	void intel_device_info_subplatform_init(struct drm_i915_private *i915)
   203	{
   204		const struct intel_device_info *info = INTEL_INFO(i915);
   205		const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
   206		const unsigned int pi = __platform_mask_index(rinfo, info->platform);
   207		const unsigned int pb = __platform_mask_bit(rinfo, info->platform);
   208		u16 devid = INTEL_DEVID(i915);
   209		u32 mask = 0;
   210	
   211		/* Make sure IS_<platform> checks are working. */
   212		RUNTIME_INFO(i915)->platform_mask[pi] = BIT(pb);
   213	
   214		/* Find and mark subplatform bits based on the PCI device id. */
   215		if (find_devid(devid, subplatform_ult_ids,
   216			       ARRAY_SIZE(subplatform_ult_ids))) {
   217			mask = BIT(INTEL_SUBPLATFORM_ULT);
   218		} else if (find_devid(devid, subplatform_ulx_ids,
   219				      ARRAY_SIZE(subplatform_ulx_ids))) {
   220			mask = BIT(INTEL_SUBPLATFORM_ULX);
   221			if (IS_HASWELL(i915) || IS_BROADWELL(i915)) {
   222				/* ULX machines are also considered ULT. */
   223				mask |= BIT(INTEL_SUBPLATFORM_ULT);
   224			}
   225		} else if (find_devid(devid, subplatform_portf_ids,
   226				      ARRAY_SIZE(subplatform_portf_ids))) {
   227			mask = BIT(INTEL_SUBPLATFORM_PORTF);
   228		} else if (find_devid(devid, subplatform_g10_ids,
   229				      ARRAY_SIZE(subplatform_g10_ids))) {
   230			mask = BIT(INTEL_SUBPLATFORM_G10);
   231		} else if (find_devid(devid, subplatform_g11_ids,
   232				      ARRAY_SIZE(subplatform_g11_ids))) {
   233			mask = BIT(INTEL_SUBPLATFORM_G11);
   234		} else if (find_devid(devid, subplatform_g12_ids,
   235				      ARRAY_SIZE(subplatform_g12_ids))) {
 > 236			mask = BIT(INTEL_SUBPLATFORM_G12);
   237		}
   238	
   239		if (IS_TIGERLAKE(i915)) {
   240			struct pci_dev *root, *pdev = to_pci_dev(i915->drm.dev);
   241	
   242			root = list_first_entry(&pdev->bus->devices, typeof(*root), bus_list);
   243	
   244			drm_WARN_ON(&i915->drm, mask);
   245			drm_WARN_ON(&i915->drm, (root->device & TGL_ROOT_DEVICE_MASK) !=
   246				    TGL_ROOT_DEVICE_ID);
   247	
   248			switch (root->device & TGL_ROOT_DEVICE_SKU_MASK) {
   249			case TGL_ROOT_DEVICE_SKU_ULX:
   250				mask = BIT(INTEL_SUBPLATFORM_ULX);
   251				break;
   252			case TGL_ROOT_DEVICE_SKU_ULT:
   253				mask = BIT(INTEL_SUBPLATFORM_ULT);
   254				break;
   255			}
   256		}
   257	
   258		GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
   259	
   260		RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
   261	}
   262	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
