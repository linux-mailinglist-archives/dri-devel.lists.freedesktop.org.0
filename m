Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42689A0884B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 07:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8CB10E4E4;
	Fri, 10 Jan 2025 06:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT3h9Qc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EEF10E4E4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 06:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736490307; x=1768026307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JNRPGPlyUeOYSMCCIReZWx4/A6kB9kI6sWqUW61ccvw=;
 b=HT3h9Qc0SZGf6OJ7FUnICZU0URomWietu5z54JCgpZGtp4tSIc1XSDxl
 u7NoLvB3WlrfE/PwUzlm8SvGoSDZm/YdTmJS+vIwfz4yPBTQ9TmrIucYX
 re1WuoFz6SIv3nUCH35FqeVUTQO53JVPIGiKYYgm0roDsGBfE0q5NXTQg
 HJIfUlqhBHhhxtPLgNG72BsR7DWusG2+fJ33xO38w4v1w6aJxZUsN5OX0
 5XLII8HUXg63JdJOjzeV8ksQjnQYllF7DR+8SCmio4ixnQ9M+gaqP6JjY
 ijBPIQ1GVW0AmfNCJXxNfgf0JiZxKM0W3thx4omYIXYrR7nhP2kk7Tb1F Q==;
X-CSE-ConnectionGUID: 2a0SS28FTYqHNh0Q087wCA==
X-CSE-MsgGUID: gVh3ZfFBS3m9JnLZ0x3rDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36935798"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36935798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:25:07 -0800
X-CSE-ConnectionGUID: wHSmfOucTXOWrcz09KdPMQ==
X-CSE-MsgGUID: hPBfvydBS6uD27k00ZqUVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104162427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 09 Jan 2025 22:25:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tW8S3-000IdZ-36;
 Fri, 10 Jan 2025 06:24:59 +0000
Date: Fri, 10 Jan 2025 14:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v5 07/20] drm/rockchip: analogix_dp: Expand device data
 to support multiple edp display
Message-ID: <202501101445.xlso2z73-lkp@intel.com>
References: <20250109032725.1102465-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-8-damon.ding@rock-chips.com>
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

Hi Damon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next drm/drm-next drm-exynos/exynos-drm-next linus/master v6.13-rc6 next-20250109]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/phy-phy-rockchip-samsung-hdptx-Swap-the-definitions-of-LCPLL_REF-and-ROPLL_REF/20250109-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250109032725.1102465-8-damon.ding%40rock-chips.com
patch subject: [PATCH v5 07/20] drm/rockchip: analogix_dp: Expand device data to support multiple edp display
config: hexagon-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101445.xlso2z73-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101445.xlso2z73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101445.xlso2z73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:60: warning: Function parameter or struct member 'reg' not described in 'rockchip_dp_chip_data'


vim +60 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

8f0ac5c4835291 Yakir Yang 2016-07-24  50  
d9c900b0270a18 Yakir Yang 2016-06-29  51  /**
d9c900b0270a18 Yakir Yang 2016-06-29  52   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
bbb8c3102ebf3b Damon Ding 2025-01-09  53   * @lcdc_sel: grf register field of lcdc_sel
d9c900b0270a18 Yakir Yang 2016-06-29  54   * @chip_type: specific chip type
d9c900b0270a18 Yakir Yang 2016-06-29  55   */
d9c900b0270a18 Yakir Yang 2016-06-29  56  struct rockchip_dp_chip_data {
bbb8c3102ebf3b Damon Ding 2025-01-09  57  	const struct rockchip_grf_reg_field lcdc_sel;
d9c900b0270a18 Yakir Yang 2016-06-29  58  	u32	chip_type;
26f1f37804f0d4 Damon Ding 2025-01-09  59  	u32	reg;
d9c900b0270a18 Yakir Yang 2016-06-29 @60  };
9e32e16e9e989f Yakir Yang 2016-03-29  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
