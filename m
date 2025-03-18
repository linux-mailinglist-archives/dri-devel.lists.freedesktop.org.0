Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B63A67DA5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 21:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3400710E4C5;
	Tue, 18 Mar 2025 20:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eC3WK8Gu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9B010E4C5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742328263; x=1773864263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=37soqdNIwo61ih+i0FCX+4BP4DmoFdz2n1WQ2XOTnNQ=;
 b=eC3WK8Gu07T2CokYXq2s4C257arXaQ/PlaeyThn+AVCMNGSXh4hQfMH3
 fEH/479CYCfHyryZtPM/FOF/Byp+Nz8Qhvd9gpw85ITyrlcXmvTAnIVbE
 4maBa5gi20PCA2x4NpOgnhjFfKw+LM7ZW+byhO7BF2TRi9O70hMPbdUm5
 dvJVRHrKKABrioV2gdNJAuM+8Bm+iFfj5mHqxU0eJu+wSQMjtWmd0Ljah
 1kRbyc2wJxOKPIZFHwEteX5U8ai4Kbz+uX2xixUG8W8nWnGLWoMIilabC
 kGbnGlJGo/6cwcV4tjt1yJoTH6A+dlpHMGKDyY0vWJ7FW+u8yyHSRPNBJ A==;
X-CSE-ConnectionGUID: 8onkQ6TjS1WID3bYob81qA==
X-CSE-MsgGUID: nnJ9lyrIRN22jbPavhl38w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43225949"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="43225949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 13:04:23 -0700
X-CSE-ConnectionGUID: /+u1TsTWTwGVjxaZv23Nug==
X-CSE-MsgGUID: wwOAZmyRSvGZrU3rWs3f+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="159517822"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2025 13:04:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tudAf-000E90-0Q;
 Tue, 18 Mar 2025 20:04:17 +0000
Date: Wed, 19 Mar 2025 04:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v6 1/5] drm/v3d: Associate a V3D tech revision to all
 supported devices
Message-ID: <202503190317.nnVNkMGI-lkp@intel.com>
References: <20250317-v3d-gpu-reset-fixes-v6-1-f3ee7717ed17@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-1-f3ee7717ed17@igalia.com>
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

Hi Maíra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a0237859bc5a9e0a716e1db8e7fd3cafd63259]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-v3d-Associate-a-V3D-tech-revision-to-all-supported-devices/20250318-090556
base:   83a0237859bc5a9e0a716e1db8e7fd3cafd63259
patch link:    https://lore.kernel.org/r/20250317-v3d-gpu-reset-fixes-v6-1-f3ee7717ed17%40igalia.com
patch subject: [PATCH v6 1/5] drm/v3d: Associate a V3D tech revision to all supported devices
config: x86_64-buildonly-randconfig-002-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190317.nnVNkMGI-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190317.nnVNkMGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190317.nnVNkMGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/v3d/v3d_drv.c:292:8: warning: cast to smaller integer type 'enum v3d_gen' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     292 |         gen = (enum v3d_gen)of_device_get_match_data(dev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +292 drivers/gpu/drm/v3d/v3d_drv.c

   272	
   273	static int v3d_platform_drm_probe(struct platform_device *pdev)
   274	{
   275		struct device *dev = &pdev->dev;
   276		struct drm_device *drm;
   277		struct v3d_dev *v3d;
   278		enum v3d_gen gen;
   279		int ret;
   280		u32 mmu_debug;
   281		u32 ident1, ident3;
   282		u64 mask;
   283	
   284		v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev, drm);
   285		if (IS_ERR(v3d))
   286			return PTR_ERR(v3d);
   287	
   288		drm = &v3d->drm;
   289	
   290		platform_set_drvdata(pdev, drm);
   291	
 > 292		gen = (enum v3d_gen)of_device_get_match_data(dev);
   293		v3d->ver = gen;
   294	
   295		ret = map_regs(v3d, &v3d->hub_regs, "hub");
   296		if (ret)
   297			return ret;
   298	
   299		ret = map_regs(v3d, &v3d->core_regs[0], "core0");
   300		if (ret)
   301			return ret;
   302	
   303		v3d->clk = devm_clk_get_optional(dev, NULL);
   304		if (IS_ERR(v3d->clk))
   305			return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
   306	
   307		ret = clk_prepare_enable(v3d->clk);
   308		if (ret) {
   309			dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
   310			return ret;
   311		}
   312	
   313		mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
   314		mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
   315		ret = dma_set_mask_and_coherent(dev, mask);
   316		if (ret)
   317			goto clk_disable;
   318	
   319		v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
   320	
   321		ident1 = V3D_READ(V3D_HUB_IDENT1);
   322		v3d->ver = (V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_TVER) * 10 +
   323			    V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_REV));
   324		/* Make sure that the V3D tech version retrieved from the HW is equal
   325		 * to the one advertised by the device tree.
   326		 */
   327		WARN_ON(v3d->ver != gen);
   328	
   329		v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
   330		WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
   331	
   332		ident3 = V3D_READ(V3D_HUB_IDENT3);
   333		v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
   334	
   335		v3d_perfmon_init(v3d);
   336	
   337		v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
   338		if (IS_ERR(v3d->reset)) {
   339			ret = PTR_ERR(v3d->reset);
   340	
   341			if (ret == -EPROBE_DEFER)
   342				goto clk_disable;
   343	
   344			v3d->reset = NULL;
   345			ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
   346			if (ret) {
   347				dev_err(dev,
   348					"Failed to get reset control or bridge regs\n");
   349				goto clk_disable;
   350			}
   351		}
   352	
   353		if (v3d->ver < V3D_GEN_41) {
   354			ret = map_regs(v3d, &v3d->gca_regs, "gca");
   355			if (ret)
   356				goto clk_disable;
   357		}
   358	
   359		v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
   360						GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
   361		if (!v3d->mmu_scratch) {
   362			dev_err(dev, "Failed to allocate MMU scratch page\n");
   363			ret = -ENOMEM;
   364			goto clk_disable;
   365		}
   366	
   367		ret = v3d_gem_init(drm);
   368		if (ret)
   369			goto dma_free;
   370	
   371		ret = v3d_irq_init(v3d);
   372		if (ret)
   373			goto gem_destroy;
   374	
   375		ret = drm_dev_register(drm, 0);
   376		if (ret)
   377			goto irq_disable;
   378	
   379		ret = v3d_sysfs_init(dev);
   380		if (ret)
   381			goto drm_unregister;
   382	
   383		return 0;
   384	
   385	drm_unregister:
   386		drm_dev_unregister(drm);
   387	irq_disable:
   388		v3d_irq_disable(v3d);
   389	gem_destroy:
   390		v3d_gem_destroy(drm);
   391	dma_free:
   392		dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
   393	clk_disable:
   394		clk_disable_unprepare(v3d->clk);
   395		return ret;
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
