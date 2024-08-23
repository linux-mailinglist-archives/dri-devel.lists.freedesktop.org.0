Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CEF95C3B3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 05:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E85410EC0B;
	Fri, 23 Aug 2024 03:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcNS9GGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD1A10EC0A;
 Fri, 23 Aug 2024 03:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724383458; x=1755919458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j6uHu+M7g1d8XzV/n+KBG0+Qm4VAfRpiuJBXPibLr08=;
 b=AcNS9GGuMLJ3b/7Y3Jw2Ys61iubYvs7cVJYGsh0eqLRQ+WJRuHHcQtts
 FYjzGbuTRP/w8mrpoujb8RwRo/uCo0z1kI2oUALwSfTtBgfdCBFcpjWPC
 lPeEkp9fJ074lIZkGodm6cGQ26DSd8lM/jrTl9uJchhjW3QzomhYW1ALF
 +vPv1Lhbp0MujBmPPKNVvtSxt4CcNLXsjHQ94gtqwYzctiNYzc8eaRaNc
 mmsmHqZDd9MohVUAbUKwCuTvHQoX6Eo+hGr5YSafin2pGHkNzJNm0jp7S
 H6u8qn8dPAZwZcqH3Cqn/pb2PaBG7sgye1t7wmkHkr76g5uIqAwXopbrV g==;
X-CSE-ConnectionGUID: QSA9NsvwSZmv68YRE5y3ow==
X-CSE-MsgGUID: rZxWWe8VSSKmHf9hZvfIeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33994161"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="33994161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 20:24:18 -0700
X-CSE-ConnectionGUID: Hyxz0BvgS36pYNflQ/Ip/Q==
X-CSE-MsgGUID: XI81TOtaRlCA17XBqCKNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66575905"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 22 Aug 2024 20:24:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1shKuI-000DQy-33;
 Fri, 23 Aug 2024 03:24:10 +0000
Date: Fri, 23 Aug 2024 11:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 nicholas.kazlauskas@amd.com, Charlene.Liu@amd.com,
 chiahsuan.chung@amd.com, hamza.mahfooz@amd.com,
 sungjoon.kim@amd.com, syed.hassan@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH -next v2 RESEND] drm/amd/display: Remove unused
 dcn35_fpga_funcs
Message-ID: <202408231105.BpoYpNK6-lkp@intel.com>
References: <20240822015819.3356282-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822015819.3356282-1-ruanjinjie@huawei.com>
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

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240821]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/drm-amd-display-Remove-unused-dcn35_fpga_funcs/20240822-095139
base:   next-20240821
patch link:    https://lore.kernel.org/r/20240822015819.3356282-1-ruanjinjie%40huawei.com
patch subject: [PATCH -next v2 RESEND] drm/amd/display: Remove unused dcn35_fpga_funcs
config: x86_64-buildonly-randconfig-005-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231105.BpoYpNK6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231105.BpoYpNK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231105.BpoYpNK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:989:13: warning: 'dcn35_update_clocks_fpga' defined but not used [-Wunused-function]
     989 | static void dcn35_update_clocks_fpga(struct clk_mgr *clk_mgr,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:982:13: warning: 'dcn35_init_clocks_fpga' defined but not used [-Wunused-function]
     982 | static void dcn35_init_clocks_fpga(struct clk_mgr *clk_mgr)
         |             ^~~~~~~~~~~~~~~~~~~~~~


vim +/dcn35_update_clocks_fpga +989 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c

93a66cef607cfe Sung Joon Kim 2023-08-18   981  
8774029f76b980 Qingqing Zhuo 2023-08-02  @982  static void dcn35_init_clocks_fpga(struct clk_mgr *clk_mgr)
8774029f76b980 Qingqing Zhuo 2023-08-02   983  {
f2a905b01c6dcc Eric Yang     2024-01-16   984  	init_clk_states(clk_mgr);
8774029f76b980 Qingqing Zhuo 2023-08-02   985  
8774029f76b980 Qingqing Zhuo 2023-08-02   986  /* TODO: Implement the functions and remove the ifndef guard */
8774029f76b980 Qingqing Zhuo 2023-08-02   987  }
8774029f76b980 Qingqing Zhuo 2023-08-02   988  
8774029f76b980 Qingqing Zhuo 2023-08-02  @989  static void dcn35_update_clocks_fpga(struct clk_mgr *clk_mgr,
8774029f76b980 Qingqing Zhuo 2023-08-02   990  		struct dc_state *context,
8774029f76b980 Qingqing Zhuo 2023-08-02   991  		bool safe_to_lower)
8774029f76b980 Qingqing Zhuo 2023-08-02   992  {
8774029f76b980 Qingqing Zhuo 2023-08-02   993  	struct clk_mgr_internal *clk_mgr_int = TO_CLK_MGR_INTERNAL(clk_mgr);
8774029f76b980 Qingqing Zhuo 2023-08-02   994  	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
8774029f76b980 Qingqing Zhuo 2023-08-02   995  	int fclk_adj = new_clocks->fclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02   996  
8774029f76b980 Qingqing Zhuo 2023-08-02   997  	/* TODO: remove this after correctly set by DML */
8774029f76b980 Qingqing Zhuo 2023-08-02   998  	new_clocks->dcfclk_khz = 400000;
8774029f76b980 Qingqing Zhuo 2023-08-02   999  	new_clocks->socclk_khz = 400000;
8774029f76b980 Qingqing Zhuo 2023-08-02  1000  
8774029f76b980 Qingqing Zhuo 2023-08-02  1001  	/* Min fclk = 1.2GHz since all the extra scemi logic seems to run off of it */
8774029f76b980 Qingqing Zhuo 2023-08-02  1002  	//int fclk_adj = new_clocks->fclk_khz > 1200000 ? new_clocks->fclk_khz : 1200000;
8774029f76b980 Qingqing Zhuo 2023-08-02  1003  	new_clocks->fclk_khz = 4320000;
8774029f76b980 Qingqing Zhuo 2023-08-02  1004  
8774029f76b980 Qingqing Zhuo 2023-08-02  1005  	if (should_set_clock(safe_to_lower, new_clocks->phyclk_khz, clk_mgr->clks.phyclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1006  		clk_mgr->clks.phyclk_khz = new_clocks->phyclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1007  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1008  
8774029f76b980 Qingqing Zhuo 2023-08-02  1009  	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr->clks.dcfclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1010  		clk_mgr->clks.dcfclk_khz = new_clocks->dcfclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1011  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1012  
8774029f76b980 Qingqing Zhuo 2023-08-02  1013  	if (should_set_clock(safe_to_lower,
8774029f76b980 Qingqing Zhuo 2023-08-02  1014  			new_clocks->dcfclk_deep_sleep_khz, clk_mgr->clks.dcfclk_deep_sleep_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1015  		clk_mgr->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1016  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1017  
8774029f76b980 Qingqing Zhuo 2023-08-02  1018  	if (should_set_clock(safe_to_lower, new_clocks->socclk_khz, clk_mgr->clks.socclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1019  		clk_mgr->clks.socclk_khz = new_clocks->socclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1020  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1021  
8774029f76b980 Qingqing Zhuo 2023-08-02  1022  	if (should_set_clock(safe_to_lower, new_clocks->dramclk_khz, clk_mgr->clks.dramclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1023  		clk_mgr->clks.dramclk_khz = new_clocks->dramclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1024  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1025  
8774029f76b980 Qingqing Zhuo 2023-08-02  1026  	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->clks.dppclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1027  		clk_mgr->clks.dppclk_khz = new_clocks->dppclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1028  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1029  
8774029f76b980 Qingqing Zhuo 2023-08-02  1030  	if (should_set_clock(safe_to_lower, fclk_adj, clk_mgr->clks.fclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1031  		clk_mgr->clks.fclk_khz = fclk_adj;
8774029f76b980 Qingqing Zhuo 2023-08-02  1032  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1033  
8774029f76b980 Qingqing Zhuo 2023-08-02  1034  	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr->clks.dispclk_khz)) {
8774029f76b980 Qingqing Zhuo 2023-08-02  1035  		clk_mgr->clks.dispclk_khz = new_clocks->dispclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1036  	}
8774029f76b980 Qingqing Zhuo 2023-08-02  1037  
8774029f76b980 Qingqing Zhuo 2023-08-02  1038  	/* Both fclk and ref_dppclk run on the same scemi clock.
8774029f76b980 Qingqing Zhuo 2023-08-02  1039  	 * So take the higher value since the DPP DTO is typically programmed
8774029f76b980 Qingqing Zhuo 2023-08-02  1040  	 * such that max dppclk is 1:1 with ref_dppclk.
8774029f76b980 Qingqing Zhuo 2023-08-02  1041  	 */
8774029f76b980 Qingqing Zhuo 2023-08-02  1042  	if (clk_mgr->clks.fclk_khz > clk_mgr->clks.dppclk_khz)
8774029f76b980 Qingqing Zhuo 2023-08-02  1043  		clk_mgr->clks.dppclk_khz = clk_mgr->clks.fclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1044  	if (clk_mgr->clks.dppclk_khz > clk_mgr->clks.fclk_khz)
8774029f76b980 Qingqing Zhuo 2023-08-02  1045  		clk_mgr->clks.fclk_khz = clk_mgr->clks.dppclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1046  
8774029f76b980 Qingqing Zhuo 2023-08-02  1047  	// Both fclk and ref_dppclk run on the same scemi clock.
8774029f76b980 Qingqing Zhuo 2023-08-02  1048  	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
8774029f76b980 Qingqing Zhuo 2023-08-02  1049  
8774029f76b980 Qingqing Zhuo 2023-08-02  1050  	/* TODO: set dtbclk in correct place */
8774029f76b980 Qingqing Zhuo 2023-08-02  1051  	clk_mgr->clks.dtbclk_en = true;
8774029f76b980 Qingqing Zhuo 2023-08-02  1052  	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
8774029f76b980 Qingqing Zhuo 2023-08-02  1053  	dcn35_update_clocks_update_dpp_dto(clk_mgr_int, context, safe_to_lower);
8774029f76b980 Qingqing Zhuo 2023-08-02  1054  
8774029f76b980 Qingqing Zhuo 2023-08-02  1055  	dcn35_update_clocks_update_dtb_dto(clk_mgr_int, context, clk_mgr->clks.ref_dtbclk_khz);
8774029f76b980 Qingqing Zhuo 2023-08-02  1056  }
8774029f76b980 Qingqing Zhuo 2023-08-02  1057  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
