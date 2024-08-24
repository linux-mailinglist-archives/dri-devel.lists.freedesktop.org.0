Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839495DFDB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 21:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7110E13C;
	Sat, 24 Aug 2024 19:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+ryaxOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B910E0D2;
 Sat, 24 Aug 2024 19:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724529018; x=1756065018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lkz4q2nAUp0hzF2vbhFCLTAI60VEsTQcBBYmlITOKs4=;
 b=P+ryaxOHu3ev7nA1yLeOTRE67Ng4YoY+nQn0TZ24nAvHon14kLP78loT
 rKzT12ie8EoRt0IsSEK9cik5bulI5ht/gm7v5NwpqD6td5UTBKAmhWrSt
 DQ0ZSiYoKwBAgwlozYRA3r1534El5aA4sp2T1E7bgw4j/NkqvXH32oS7F
 MUyxTzMVe3DY5nX77bh7JHoWkisZtiI3TVWCXaH866pWm5I69NihZnTh5
 RizUWPb6qkZz0I8icVO73ayTIlXFxy3He+4yOViA6BSzCKqav0uOrDJc7
 kkx/EiaseIp8t+MzO+whj/qc6iwaHdD9TKY+UZMMApxydH2c+zhfUEKaG w==;
X-CSE-ConnectionGUID: /UFA6HqwQDmkkGidWdQOzw==
X-CSE-MsgGUID: Xm8dJRQTRNmG8kkXbrrO2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="40452569"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; d="scan'208";a="40452569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 12:50:17 -0700
X-CSE-ConnectionGUID: g5WW6mdZQlWtQcyMf8X/1w==
X-CSE-MsgGUID: RxnkIbn8Ssu47lyXV6KBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; d="scan'208";a="61802901"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2024 12:50:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1shwm3-000EiV-22;
 Sat, 24 Aug 2024 19:50:11 +0000
Date: Sun, 25 Aug 2024 03:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, chaitanya.dhere@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, aurabindo.pillai@amd.com,
 colin.i.king@gmail.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH -next 5/5] drm/amd/display: Make dcn35_fpga_funcs static
Message-ID: <202408250235.XZ6zToZY-lkp@intel.com>
References: <20240821064040.2292969-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821064040.2292969-6-ruanjinjie@huawei.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/drm-amd-display-Make-core_dcn4_g6_temp_read_blackout_table-static/20240821-143421
base:   next-20240821
patch link:    https://lore.kernel.org/r/20240821064040.2292969-6-ruanjinjie%40huawei.com
patch subject: [PATCH -next 5/5] drm/amd/display: Make dcn35_fpga_funcs static
config: i386-randconfig-003-20240824 (https://download.01.org/0day-ci/archive/20240825/202408250235.XZ6zToZY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408250235.XZ6zToZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408250235.XZ6zToZY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1071:29: warning: 'dcn35_fpga_funcs' defined but not used [-Wunused-variable]
    1071 | static struct clk_mgr_funcs dcn35_fpga_funcs = {
         |                             ^~~~~~~~~~~~~~~~


vim +/dcn35_fpga_funcs +1071 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c

  1070	
> 1071	static struct clk_mgr_funcs dcn35_fpga_funcs = {
  1072		.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
  1073		.update_clocks = dcn35_update_clocks_fpga,
  1074		.init_clocks = dcn35_init_clocks_fpga,
  1075		.get_dtb_ref_clk_frequency = dcn31_get_dtb_ref_freq_khz,
  1076	};
  1077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
