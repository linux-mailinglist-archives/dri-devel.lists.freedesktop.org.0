Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C138C3929
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 01:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511710E163;
	Sun, 12 May 2024 23:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3Lb7/eV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334D10E163;
 Sun, 12 May 2024 23:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715555218; x=1747091218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iIroH5Y9NmxigOjMGmDqMn7BK8xc09nKaScH6g5IsMc=;
 b=A3Lb7/eVR9RO3fEWdnwbPq0x9bgx/i43RAykBNknhszbl3q+XROToNDo
 3uc0CLKssXqtqmJrF83cf+JnyCqeEcFFYyA/HRM9TR5RRPnGWjbyalVJt
 XhPnzZQy3dt0ahogoBy/U+SFr29nzHiSCTHuv4Yi6ZHyS4JYkwynIs0nc
 rmBQ/j9Eu/BbcHmyDmVHbvbBmXE85yAKG8iaoa0q6nC5ZN+Tb1x8o65Fn
 En7kpgE5H/dF20r2eky83REa3S6l5AeiBtnZUvDA52zbHTsutEJLp1aL7
 mgxZdLO81lmo1Ung1+XiPiJcW6sf8mkr9IFzrYW3J3LyrW+jIPy08ZtYw A==;
X-CSE-ConnectionGUID: FNb0bRyYQH63ydmTUqKp3A==
X-CSE-MsgGUID: dhqJmf50RD6pZwp39BSwuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15286297"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="15286297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 16:06:56 -0700
X-CSE-ConnectionGUID: Hi4M41MxT7CnFoyyZkt3fQ==
X-CSE-MsgGUID: ikHENWtfSTW23qyf6SLTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="53390460"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 12 May 2024 16:06:53 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s6IHL-0009H1-13;
 Sun, 12 May 2024 23:06:51 +0000
Date: Mon, 13 May 2024 07:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/a6xx: request memory region
Message-ID: <202405130628.7LSM1hPA-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240513 (https://download.01.org/0day-ci/archive/20240513/202405130628.7LSM1hPA-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130628.7LSM1hPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130628.7LSM1hPA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: In function 'a6xx_gmu_wrapper_init':
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:17: error: label 'err_mmio' used but not defined
    1611 |                 goto err_mmio;
         |                 ^~~~


vim +/err_mmio +1611 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

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
5a903a44a98471 Konrad Dybcio  2023-06-16  1605  		goto err_mmio;
5a903a44a98471 Konrad Dybcio  2023-06-16  1606  	}
5a903a44a98471 Konrad Dybcio  2023-06-16  1607  
5a903a44a98471 Konrad Dybcio  2023-06-16  1608  	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
5a903a44a98471 Konrad Dybcio  2023-06-16  1609  	if (IS_ERR(gmu->cxpd)) {
5a903a44a98471 Konrad Dybcio  2023-06-16  1610  		ret = PTR_ERR(gmu->cxpd);
5a903a44a98471 Konrad Dybcio  2023-06-16 @1611  		goto err_mmio;
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
