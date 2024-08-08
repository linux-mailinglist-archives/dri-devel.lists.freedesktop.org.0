Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B741794BE2D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCA710E71E;
	Thu,  8 Aug 2024 13:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmWdeWOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F332010E71E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723122481; x=1754658481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lzYQGR1Hu3LSf5dJINnbLZ3RZxG01ilpRAY9+tniPyw=;
 b=NmWdeWOas83g6s00KmoBC8G3Oc1f9Ks9d3x9vrmv3Fc+qLp3hJ1D1hTH
 laALNhI0HawBCv23J1dUozYrD8RKq0/bUuDRxpeT8OFgEHDWhs2VRH/ZR
 iOvVRvvwAMGNw/6YzZZzmWVdDGeGXJKsSpIMH01V5NQQTE7cA/5CLk+RW
 /X/B7RY8H1GNfnBg6EaHJ37xJ4efK11Y/2vU89rHpno/e+MKVBcYhG/Ue
 nJSZW1g0pALX+AjOJ/4sP11NLfW8PtThdOcr46Aq7saMyRPLxMggNZhxp
 6QZ9VNUZScYSHdG+KA5vPhkk0QpFRxSoVblBg83ma5Mr89TWdsGUSc1+7 g==;
X-CSE-ConnectionGUID: E5L83s8US6uZtGYis37Wrg==
X-CSE-MsgGUID: 6XdzpEz3SquMq3sznlKyJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43765137"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43765137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:08:00 -0700
X-CSE-ConnectionGUID: TBcWyZj/Rxya97pGCEdlsg==
X-CSE-MsgGUID: aD5CtOBCSJCKDWZvfLaQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="61596104"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2024 06:07:56 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sc2rm-0006C2-2p;
 Thu, 08 Aug 2024 13:07:45 +0000
Date: Thu, 8 Aug 2024 21:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Message-ID: <202408082014.XKxle32n-lkp@intel.com>
References: <20240807160900.149154-2-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807160900.149154-2-mary.guillemard@collabora.com>
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

Hi Mary,

kernel test robot noticed the following build errors:

[auto build test ERROR on f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Guillemard/drm-panfrost-Add-SYSTEM_TIMESTAMP-and-SYSTEM_TIMESTAMP_FREQUENCY-parameters/20240808-032938
base:   f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452
patch link:    https://lore.kernel.org/r/20240807160900.149154-2-mary.guillemard%40collabora.com
patch subject: [PATCH 1/3] drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY parameters
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240808/202408082014.XKxle32n-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082014.XKxle32n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408082014.XKxle32n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panfrost/panfrost_drv.c:75:18: error: implicit declaration of function '__arch_counter_get_cntvct' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   param->value = __arch_counter_get_cntvct();
                                  ^
>> drivers/gpu/drm/panfrost/panfrost_drv.c:83:18: error: implicit declaration of function 'arch_timer_get_cntfrq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   param->value = arch_timer_get_cntfrq();
                                  ^
   2 errors generated.


vim +/__arch_counter_get_cntvct +75 drivers/gpu/drm/panfrost/panfrost_drv.c

    26	
    27	static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct drm_file *file)
    28	{
    29		struct drm_panfrost_get_param *param = data;
    30		struct panfrost_device *pfdev = ddev->dev_private;
    31	
    32		if (param->pad != 0)
    33			return -EINVAL;
    34	
    35	#define PANFROST_FEATURE(name, member)			\
    36		case DRM_PANFROST_PARAM_ ## name:		\
    37			param->value = pfdev->features.member;	\
    38			break
    39	#define PANFROST_FEATURE_ARRAY(name, member, max)			\
    40		case DRM_PANFROST_PARAM_ ## name ## 0 ...			\
    41			DRM_PANFROST_PARAM_ ## name ## max:			\
    42			param->value = pfdev->features.member[param->param -	\
    43				DRM_PANFROST_PARAM_ ## name ## 0];		\
    44			break
    45	
    46		switch (param->param) {
    47			PANFROST_FEATURE(GPU_PROD_ID, id);
    48			PANFROST_FEATURE(GPU_REVISION, revision);
    49			PANFROST_FEATURE(SHADER_PRESENT, shader_present);
    50			PANFROST_FEATURE(TILER_PRESENT, tiler_present);
    51			PANFROST_FEATURE(L2_PRESENT, l2_present);
    52			PANFROST_FEATURE(STACK_PRESENT, stack_present);
    53			PANFROST_FEATURE(AS_PRESENT, as_present);
    54			PANFROST_FEATURE(JS_PRESENT, js_present);
    55			PANFROST_FEATURE(L2_FEATURES, l2_features);
    56			PANFROST_FEATURE(CORE_FEATURES, core_features);
    57			PANFROST_FEATURE(TILER_FEATURES, tiler_features);
    58			PANFROST_FEATURE(MEM_FEATURES, mem_features);
    59			PANFROST_FEATURE(MMU_FEATURES, mmu_features);
    60			PANFROST_FEATURE(THREAD_FEATURES, thread_features);
    61			PANFROST_FEATURE(MAX_THREADS, max_threads);
    62			PANFROST_FEATURE(THREAD_MAX_WORKGROUP_SZ,
    63					thread_max_workgroup_sz);
    64			PANFROST_FEATURE(THREAD_MAX_BARRIER_SZ,
    65					thread_max_barrier_sz);
    66			PANFROST_FEATURE(COHERENCY_FEATURES, coherency_features);
    67			PANFROST_FEATURE(AFBC_FEATURES, afbc_features);
    68			PANFROST_FEATURE_ARRAY(TEXTURE_FEATURES, texture_features, 3);
    69			PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
    70			PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
    71			PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
    72	
    73		case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
    74	#ifdef CONFIG_ARM_ARCH_TIMER
  > 75			param->value = __arch_counter_get_cntvct();
    76	#else
    77			param->value = 0;
    78	#endif
    79			break;
    80	
    81		case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY:
    82	#ifdef CONFIG_ARM_ARCH_TIMER
  > 83			param->value = arch_timer_get_cntfrq();
    84	#else
    85			param->value = 0;
    86	#endif
    87			break;
    88	
    89		default:
    90			return -EINVAL;
    91		}
    92	
    93		return 0;
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
