Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957088C3900
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 00:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B9A10E010;
	Sun, 12 May 2024 22:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXNYfd9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6B10E010;
 Sun, 12 May 2024 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715552690; x=1747088690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3C4Tsvi8zQ8/WgqGGbU/HP9bh5KBCx36pvVCbqCn/0w=;
 b=iXNYfd9szR6wC9iYsMiXt9fJjmM0e6OJ83iQ3+wF+UayFCuYxFqfLOoJ
 iY0BEPC1rqcru37GJWeKahbd9NqFNoydvhFcylCZWbr/Ru+NKCTxl6BoW
 d6vz7s4AXSRciHY/8VLxzyihM+ZKOKk9ITF2w7hEt2Bj6a6TFtLeVmhoe
 j0r6slEZXe1v5W6G7rrQzLJKqVqqev6mrt6NqmcfblfEttFvfNcDMFne6
 FGnXWg/UxdA8q4XUZVs1wJ/Lwhom9ehqSQFqhTOgC+mMlMPZ4B1tHiVrp
 NoDUjGOI/wMSYg6svVXCQSiDDAKFEFmJH7kA5OumxxaqNFZTTm5qwARwf Q==;
X-CSE-ConnectionGUID: c2pV4GCUR+OyRzcmM4uTvw==
X-CSE-MsgGUID: LRuKZmrWT5Wo/JXuyYjWcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11328009"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11328009"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 15:24:49 -0700
X-CSE-ConnectionGUID: IKZ0fXjETquK9VRyvxP70g==
X-CSE-MsgGUID: v+CBfvrHRqO8IEHv9CUAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30717284"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 12 May 2024 15:24:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s6HcZ-0009Fn-29;
 Sun, 12 May 2024 22:24:43 +0000
Date: Mon, 13 May 2024 06:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Message-ID: <202405130618.N7QKeg94-lkp@intel.com>
References: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-msm-adreno-memory-region-v3-2-0a728ad45010@gmail.com>
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

Hi Kiarash,

kernel test robot noticed the following build errors:

[auto build test ERROR on cf87f46fd34d6c19283d9625a7822f20d90b64a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiarash-Hajian/drm-msm-a6xx-request-memory-region/20240512-135215
base:   cf87f46fd34d6c19283d9625a7822f20d90b64a4
patch link:    https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-2-0a728ad45010%40gmail.com
patch subject: [PATCH v3 2/2] drm/msm/a6xx: request memory region
config: i386-buildonly-randconfig-001-20240513 (https://download.01.org/0day-ci/archive/20240513/202405130618.N7QKeg94-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130618.N7QKeg94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130618.N7QKeg94-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1605:8: error: use of undeclared label 'err_mmio'
    1605 |                 goto err_mmio;
         |                      ^
   1 error generated.


vim +/err_mmio +1605 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

c11fa1204fe940 Akhil P Oommen 2023-01-02  1582  
5a903a44a98471 Konrad Dybcio  2023-06-16  1583  int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
5a903a44a98471 Konrad Dybcio  2023-06-16  1584  {
5a903a44a98471 Konrad Dybcio  2023-06-16  1585  	struct platform_device *pdev = of_find_device_by_node(node);
5a903a44a98471 Konrad Dybcio  2023-06-16  1586  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
5a903a44a98471 Konrad Dybcio  2023-06-16  1587  	int ret;
5a903a44a98471 Konrad Dybcio  2023-06-16  1588  
5a903a44a98471 Konrad Dybcio  2023-06-16  1589  	if (!pdev)
5a903a44a98471 Konrad Dybcio  2023-06-16  1590  		return -ENODEV;
5a903a44a98471 Konrad Dybcio  2023-06-16  1591  
5a903a44a98471 Konrad Dybcio  2023-06-16  1592  	gmu->dev = &pdev->dev;
5a903a44a98471 Konrad Dybcio  2023-06-16  1593  
5a903a44a98471 Konrad Dybcio  2023-06-16  1594  	of_dma_configure(gmu->dev, node, true);
5a903a44a98471 Konrad Dybcio  2023-06-16  1595  
5a903a44a98471 Konrad Dybcio  2023-06-16  1596  	pm_runtime_enable(gmu->dev);
5a903a44a98471 Konrad Dybcio  2023-06-16  1597  
5a903a44a98471 Konrad Dybcio  2023-06-16  1598  	/* Mark legacy for manual SPTPRAC control */
5a903a44a98471 Konrad Dybcio  2023-06-16  1599  	gmu->legacy = true;
5a903a44a98471 Konrad Dybcio  2023-06-16  1600  
5a903a44a98471 Konrad Dybcio  2023-06-16  1601  	/* Map the GMU registers */
5a903a44a98471 Konrad Dybcio  2023-06-16  1602  	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
5a903a44a98471 Konrad Dybcio  2023-06-16  1603  	if (IS_ERR(gmu->mmio)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1604  		ret = PTR_ERR(gmu->mmio);
5a903a44a98471 Konrad Dybcio  2023-06-16 @1605  		goto err_mmio;
5a903a44a98471 Konrad Dybcio  2023-06-16  1606  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1607  
5a903a44a98471 Konrad Dybcio  2023-06-16  1608  	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
5a903a44a98471 Konrad Dybcio  2023-06-16  1609  	if (IS_ERR(gmu->cxpd)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1610  		ret = PTR_ERR(gmu->cxpd);
5a903a44a98471 Konrad Dybcio  2023-06-16  1611  		goto err_mmio;
5a903a44a98471 Konrad Dybcio  2023-06-16  1612  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1613  
5a903a44a98471 Konrad Dybcio  2023-06-16  1614  	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1615  		ret = -ENODEV;
5a903a44a98471 Konrad Dybcio  2023-06-16  1616  		goto detach_cxpd;
5a903a44a98471 Konrad Dybcio  2023-06-16  1617  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1618  
5a903a44a98471 Konrad Dybcio  2023-06-16  1619  	init_completion(&gmu->pd_gate);
5a903a44a98471 Konrad Dybcio  2023-06-16  1620  	complete_all(&gmu->pd_gate);
5a903a44a98471 Konrad Dybcio  2023-06-16  1621  	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
5a903a44a98471 Konrad Dybcio  2023-06-16  1622  
5a903a44a98471 Konrad Dybcio  2023-06-16  1623  	/* Get a link to the GX power domain to reset the GPU */
5a903a44a98471 Konrad Dybcio  2023-06-16  1624  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
5a903a44a98471 Konrad Dybcio  2023-06-16  1625  	if (IS_ERR(gmu->gxpd)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1626  		ret = PTR_ERR(gmu->gxpd);
5a903a44a98471 Konrad Dybcio  2023-06-16  1627  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1628  
5a903a44a98471 Konrad Dybcio  2023-06-16  1629  	gmu->initialized = true;
5a903a44a98471 Konrad Dybcio  2023-06-16  1630  
5a903a44a98471 Konrad Dybcio  2023-06-16  1631  	return 0;
5a903a44a98471 Konrad Dybcio  2023-06-16  1632  
5a903a44a98471 Konrad Dybcio  2023-06-16  1633  detach_cxpd:
5a903a44a98471 Konrad Dybcio  2023-06-16  1634  	dev_pm_domain_detach(gmu->cxpd, false);
5a903a44a98471 Konrad Dybcio  2023-06-16  1635  
5a903a44a98471 Konrad Dybcio  2023-06-16  1636  	/* Drop reference taken in of_find_device_by_node */
5a903a44a98471 Konrad Dybcio  2023-06-16  1637  	put_device(gmu->dev);
5a903a44a98471 Konrad Dybcio  2023-06-16  1638  
5a903a44a98471 Konrad Dybcio  2023-06-16  1639  	return ret;
5a903a44a98471 Konrad Dybcio  2023-06-16  1640  }
5a903a44a98471 Konrad Dybcio  2023-06-16  1641  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
