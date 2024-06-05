Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B58FC2E2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 07:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8BD10E687;
	Wed,  5 Jun 2024 05:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUidmhsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138110E4E1;
 Wed,  5 Jun 2024 05:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717563877; x=1749099877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x2ZW8cijAAACiOfJr+MbErW0fJMSAWOe6vL0+p9HPsc=;
 b=eUidmhswdYaldfYrY4XLZCycCpFB2qQcb9lGOyEryDiCp0EZidmGvElv
 iDIbmmVzIkK22lKXCPZVMNvPehvzRQ8n+hFCddX12XjrNd0ffAUmmn0eu
 wzSU5iKXa4httFgEvV2QrjUA58euoQQivHd6TjaLQ9cHBgYK7Aq/7s4tS
 f4theceAcPG8qjW6Jr0tHsHpEEcnOFScjaVRaSrpi0POiDotfK3l9CZyw
 ibreHOtZIjo0Gz+dZyLRQcdkoyd6aSv/KNQi/1NdYWy9aRqqNC1efEHHB
 EmucQaTYhpQjuHmNijmpgVk6FBi2v9eoYZ9DpGYM4g1nck329DzJwZTdY g==;
X-CSE-ConnectionGUID: Tf3fLVD5SeCGgd5fHUbYQA==
X-CSE-MsgGUID: gs3MVpg7TfKqJ4kjSOD4/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25257244"
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="25257244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 22:04:36 -0700
X-CSE-ConnectionGUID: GJ7hVspwS1eWwapyAKcxKQ==
X-CSE-MsgGUID: 1Q08XN4PTlG6z6cEZDUvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,215,1712646000"; d="scan'208";a="68598678"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 22:04:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sEip4-0000vn-0q;
 Wed, 05 Jun 2024 05:04:30 +0000
Date: Wed, 5 Jun 2024 13:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler
 warnings for gen7_* includes
Message-ID: <202406051244.xdNC6LyO-lkp@intel.com>
References: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
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

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip linus/master v6.10-rc2 next-20240604]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-a6xx-use-__always_unused-to-fix-compiler-warnings-for-gen7_-includes/20240605-055341
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20240604215105.4057278-1-quic_abhinavk%40quicinc.com
patch subject: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler warnings for gen7_* includes
config: i386-buildonly-randconfig-001-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051244.xdNC6LyO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051244.xdNC6LyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051244.xdNC6LyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:13:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:114:18: warning: 'gen7_9_0_cx_debugbus_blocks' defined but not used [-Wunused-const-variable=]
     114 | static const u32 gen7_9_0_cx_debugbus_blocks[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gen7_9_0_cx_debugbus_blocks +114 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h

6408a1b5a7d7a9 Connor Abbott 2024-05-03  113  
6408a1b5a7d7a9 Connor Abbott 2024-05-03 @114  static const u32 gen7_9_0_cx_debugbus_blocks[] = {
106414f8b60346 Connor Abbott 2024-05-03  115  	A7XX_DBGBUS_CX,
106414f8b60346 Connor Abbott 2024-05-03  116  	A7XX_DBGBUS_GMU_CX,
106414f8b60346 Connor Abbott 2024-05-03  117  	A7XX_DBGBUS_GBIF_CX,
6408a1b5a7d7a9 Connor Abbott 2024-05-03  118  };
6408a1b5a7d7a9 Connor Abbott 2024-05-03  119  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
