Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1CA3F0E8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599B710E22C;
	Fri, 21 Feb 2025 09:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QceuWUWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4110410E22C;
 Fri, 21 Feb 2025 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740131416; x=1771667416;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=14wihrgxDAMUcm++Tqe/xZOkIahAfsAi/hjuQ1z8YnA=;
 b=QceuWUWzQLwrKunv/LbSRjHVVlsXk7kPyiEjVYbcSkqNOJ/ZcPgexaMA
 tgXqnxZDrsNr0yGRf0llo6m8729Sy+JR2TZvzpofogkOsKUf2FK7F+VnA
 XTJPb7eErtpnhjk6qyzkQaxcsGUH/e73bRfAKOCFN07wcyytZWG4J90nV
 bXHNx8ULu2ZDUfniRXaPmQSNhv4ht21w285YKMJoX+b/lbHAoGjxDssyc
 ka4WG27Rv6HDXY61pAFcSOBPG3rsKPF7hCYpo6WfiYrhgpfM3P+p1Vsd8
 LVO9W1ab7rrP7N41XQM6zW2tdtMxdBlqt7OzcmcHNyCM0ASj8Lrlcq//t Q==;
X-CSE-ConnectionGUID: 1GxB3Np+SFWTDUn1ElclJQ==
X-CSE-MsgGUID: P2WTb3UeQK+GBVWTkR3YOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44731166"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="44731166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 01:50:15 -0800
X-CSE-ConnectionGUID: nvscHLlGQeKJjK5VYLNqCg==
X-CSE-MsgGUID: b029fyUDTOWE658I96WXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146216348"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 21 Feb 2025 01:50:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tlPfb-0005MV-1X;
 Fri, 21 Feb 2025 09:50:08 +0000
Date: Fri, 21 Feb 2025 17:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/radeon: Add error handlings for r420 cp errata
 initiation
Message-ID: <202502211718.EFZaW3pW-lkp@intel.com>
References: <20250220064050.686-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250220064050.686-1-vulab@iscas.ac.cn>
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

Hi Wentao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.14-rc3 next-20250220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-radeon-Add-error-handlings-for-r420-cp-errata-initiation/20250220-144327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250220064050.686-1-vulab%40iscas.ac.cn
patch subject: [PATCH] drm/radeon: Add error handlings for r420 cp errata initiation
config: i386-buildonly-randconfig-005-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211718.EFZaW3pW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211718.EFZaW3pW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211718.EFZaW3pW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/r420.c:229:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     229 | }
         | ^
   1 warning generated.


vim +229 drivers/gpu/drm/radeon/r420.c

9f022ddfb23793 Jerome Glisse   2009-09-11  206  
fe881d3e554a1f Wentao Liang    2025-02-20  207  static int r420_cp_errata_init(struct radeon_device *rdev)
62cdc0c20663ef Corbin Simpson  2010-01-06  208  {
c346fb74fb6463 Pan Bian        2017-04-24  209  	int r;
e32eb50dbe4386 Christian König 2011-10-23  210  	struct radeon_ring *ring = &rdev->ring[RADEON_RING_TYPE_GFX_INDEX];
7b1f2485db253a Christian König 2011-09-23  211  
62cdc0c20663ef Corbin Simpson  2010-01-06  212  	/* RV410 and R420 can lock up if CP DMA to host memory happens
62cdc0c20663ef Corbin Simpson  2010-01-06  213  	 * while the 2D engine is busy.
62cdc0c20663ef Corbin Simpson  2010-01-06  214  	 *
62cdc0c20663ef Corbin Simpson  2010-01-06  215  	 * The proper workaround is to queue a RESYNC at the beginning
62cdc0c20663ef Corbin Simpson  2010-01-06  216  	 * of the CP init, apparently.
62cdc0c20663ef Corbin Simpson  2010-01-06  217  	 */
fe881d3e554a1f Wentao Liang    2025-02-20  218  	r = radeon_scratch_get(rdev, &rdev->config.r300.resync_scratch);
fe881d3e554a1f Wentao Liang    2025-02-20  219  	if (r) {
fe881d3e554a1f Wentao Liang    2025-02-20  220  		DRM_ERROR("failed to get scratch reg (%d).\n", r);
fe881d3e554a1f Wentao Liang    2025-02-20  221  		return r;
fe881d3e554a1f Wentao Liang    2025-02-20  222  	}
c346fb74fb6463 Pan Bian        2017-04-24  223  	r = radeon_ring_lock(rdev, ring, 8);
c346fb74fb6463 Pan Bian        2017-04-24  224  	WARN_ON(r);
e32eb50dbe4386 Christian König 2011-10-23  225  	radeon_ring_write(ring, PACKET0(R300_CP_RESYNC_ADDR, 1));
e32eb50dbe4386 Christian König 2011-10-23  226  	radeon_ring_write(ring, rdev->config.r300.resync_scratch);
e32eb50dbe4386 Christian König 2011-10-23  227  	radeon_ring_write(ring, 0xDEADBEEF);
1538a9e0e04f6a Michel Dänzer   2014-08-18  228  	radeon_ring_unlock_commit(rdev, ring, false);
62cdc0c20663ef Corbin Simpson  2010-01-06 @229  }
62cdc0c20663ef Corbin Simpson  2010-01-06  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
