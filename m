Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F572B14AC2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 11:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3885310E5FA;
	Tue, 29 Jul 2025 09:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqgJfGAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C810E5FA;
 Tue, 29 Jul 2025 09:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753780082; x=1785316082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6xqd3ZGPvMT14nG70kPsq5tJ9sNdsKyLjJnQfae58F8=;
 b=BqgJfGADuyx+ffN2JAMAFHWgSYKQPLZ/GomxoNBHK3W/eTQ+jKd4uud/
 k6fYVTZKUmo7RDIwjUSYmzKB5t7g4fMtVFfZtXYrrHXTlUvsxqepHc2t6
 ZA8G9oIEIY/VV2zuowapqow2XdHY8zUZdnNsacvxD1BETEUdQJdkkDQEU
 /1lwnvh9ABMonkair/IOP+CcGXaeEtRxMfXgZ6ffzPb5nY9aNOZzKRph9
 L5KF+TLz5LwZSgwWL33rrqYS0cR2PdNgmW/bf7ZKRRGPKlHKJQmVoIFS8
 MewJn8hfsAzMv+9qYrZQFE0jfNVT5CjUHep0c22Mg1lMX7Mv2izYcWhky g==;
X-CSE-ConnectionGUID: QpluGZy8RyypA+M51Ad5uw==
X-CSE-MsgGUID: 2eJYmdoDQ3+c2VbGLX7N6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55980653"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55980653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 02:08:02 -0700
X-CSE-ConnectionGUID: TyZw7sn9S422x4l1rFBgQA==
X-CSE-MsgGUID: s8Ah/v+2SsKq8DjNu4eM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162360901"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 02:07:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uggJP-00018t-1o;
 Tue, 29 Jul 2025 09:07:55 +0000
Date: Tue, 29 Jul 2025 17:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
Message-ID: <202507291635.fl7cCAyl-lkp@intel.com>
References: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
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

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20250729]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Add-missing-location-s-to-devcoredump/20250729-043615
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250728203412.22573-6-robin.clark%40oss.qualcomm.com
patch subject: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
config: powerpc-randconfig-002-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291635.fl7cCAyl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291635.fl7cCAyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291635.fl7cCAyl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: In function 'debugbus_read':
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:180:9: error: implicit declaration of function 'FIELD_PREP'; did you mean 'FIELD'? [-Werror=implicit-function-declaration]
      reg = FIELD_PREP(GENMASK(7, 0), offset) |
            ^~~~~~~~~~
            FIELD
   cc1: some warnings being treated as errors


vim +180 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

   172	
   173	/* read a value from the GX debug bus */
   174	static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
   175			u32 *data)
   176	{
   177		u32 reg;
   178	
   179		if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
 > 180			reg = FIELD_PREP(GENMASK(7, 0), offset) |
   181				FIELD_PREP(GENMASK(24, 16), block);
   182		} else {
   183			reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
   184				A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
   185		}
   186	
   187		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
   188		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
   189		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
   190		gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
   191	
   192		/* Wait 1 us to make sure the data is flowing */
   193		udelay(1);
   194	
   195		data[0] = gpu_read(gpu, REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF2);
   196		data[1] = gpu_read(gpu, REG_A6XX_DBGC_CFG_DBGBUS_TRACE_BUF1);
   197	
   198		return 2;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
