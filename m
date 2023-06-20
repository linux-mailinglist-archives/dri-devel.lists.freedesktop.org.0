Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951B736457
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FD410E274;
	Tue, 20 Jun 2023 07:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805310E273;
 Tue, 20 Jun 2023 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687245606; x=1718781606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AQehVaXeVezyZ1EIIBMhF2TW21RUDUgTxTT8HfMhib8=;
 b=WlaMEncQAWShn2pzjFL4Y+rpP2sw6WcNLdqPVIFc3Hu9Oq2E0f90MCeT
 4arIJUsHZogZuajSgOzfrh/OJmdPCFX9utVEHl4MWNeXaVSw2z6/46qta
 fox6zBTi7194XjrrM6VaD32BT8TDFl6V49C+JqTFAyHcvdaYpTD8aJ5hi
 ZZZetGvFqL2LZoyzjmjNhAAJeZDmQOZ0sTFKWqjLMrv2AOlBjg9QUxTj0
 AbXGBx2xXvMcvSpEJlYaMiADK7N9u+x0gxzWk6VdpuMpeKVopn2EIPU7F
 VgYS+RGvAeWRtjS+7PeHcv4+qJiEhiUKzrSBJa8IUL7q0ndITsN+En4bd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358657020"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="358657020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 00:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="803839635"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="803839635"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 00:20:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qBVei-0005dS-2W;
 Tue, 20 Jun 2023 07:20:00 +0000
Date: Tue, 20 Jun 2023 15:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/6] drm/msm/a6xx: Use descriptive bitfield names for
 CP_PROTECT_CNTL
Message-ID: <202306201502.pisn6tpR-lkp@intel.com>
References: <20230517-topic-a7xx_prep-v3-2-a3ce3725385b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517-topic-a7xx_prep-v3-2-a3ce3725385b@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, oe-kbuild-all@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 47045630bc409ce6606d97b790895210dd1d517d]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/drm-msm-a6xx-Add-some-missing-header-definitions/20230620-004639
base:   47045630bc409ce6606d97b790895210dd1d517d
patch link:    https://lore.kernel.org/r/20230517-topic-a7xx_prep-v3-2-a3ce3725385b%40linaro.org
patch subject: [PATCH v3 2/6] drm/msm/a6xx: Use descriptive bitfield names for CP_PROTECT_CNTL
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230620/202306201502.pisn6tpR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201502.pisn6tpR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201502.pisn6tpR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: In function 'a6xx_set_cp_protect':
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:934:19: error: 'A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN' undeclared (first use in this function)
     934 |                   A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:934:19: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:935:19: error: 'A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN' undeclared (first use in this function)
     935 |                   A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:936:19: error: 'A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE' undeclared (first use in this function)
     936 |                   A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SM_GCC_8350
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_VIDEOCC_8350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8450
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8450 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   WARNING: unmet direct dependencies detected for SM_GCC_8550
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
   Selected by [m]:
   - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
   - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]


vim +/A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN +934 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

   899	
   900	static void a6xx_set_cp_protect(struct msm_gpu *gpu)
   901	{
   902		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   903		const u32 *regs = a6xx_protect;
   904		unsigned i, count, count_max;
   905	
   906		if (adreno_is_a650(adreno_gpu)) {
   907			regs = a650_protect;
   908			count = ARRAY_SIZE(a650_protect);
   909			count_max = 48;
   910			BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
   911		} else if (adreno_is_a690(adreno_gpu)) {
   912			regs = a690_protect;
   913			count = ARRAY_SIZE(a690_protect);
   914			count_max = 48;
   915			BUILD_BUG_ON(ARRAY_SIZE(a690_protect) > 48);
   916		} else if (adreno_is_a660_family(adreno_gpu)) {
   917			regs = a660_protect;
   918			count = ARRAY_SIZE(a660_protect);
   919			count_max = 48;
   920			BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
   921		} else {
   922			regs = a6xx_protect;
   923			count = ARRAY_SIZE(a6xx_protect);
   924			count_max = 32;
   925			BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
   926		}
   927	
   928		/*
   929		 * Enable access protection to privileged registers, fault on an access
   930		 * protect violation and select the last span to protect from the start
   931		 * address all the way to the end of the register address space
   932		 */
   933		gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL,
 > 934			  A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN |
 > 935			  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 > 936			  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
   937	
   938		for (i = 0; i < count - 1; i++)
   939			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
   940		/* last CP_PROTECT to have "infinite" length on the last entry */
   941		gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
   942	}
   943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
