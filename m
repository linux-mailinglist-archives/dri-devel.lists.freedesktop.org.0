Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDB95DD2D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 11:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6310E1A4;
	Sat, 24 Aug 2024 09:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf9fS7ki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8910E17D;
 Sat, 24 Aug 2024 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724491685; x=1756027685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=81/t5idYrQZJgPisckKvJ1/FCeEOtftpD4K7FG5JXfo=;
 b=hf9fS7kiw7qlsDtvqGeMpNJeH2lRqnnv6XsUd8/+RAyW/M8DC95aLOdd
 e/L708BhN0iMVl+jiFztOmVZr5pqxM0LDpwxsOjO/sK+2qYdsr2i2pSG0
 7SPopsFIN2A7CMCzHAndsuVKKulQwHlOiYmFkYCbZWGJJ4ZgtvMBJBNrA
 ELBpg7V/kWHx6t2Wuy3LxTP0wt8WppVetSeMM9VD1DsLuoNjNA1Fvjvt9
 lr3ctuoMXfeEpuhyA8/aw+gHXQSbkV86iFTOQNBYzPtx/k9VNiTTQf6r8
 cSCfO6QrFJXeClG8LiE5NKNbCWlUSf0iPqHF8nyRdqbxXLJOEddr4Hs9Q g==;
X-CSE-ConnectionGUID: g0SL5s7jS32Lfsun0wiBvw==
X-CSE-MsgGUID: JyZLI31BRgCeYzstxl8GTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34133955"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; d="scan'208";a="34133955"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 02:28:04 -0700
X-CSE-ConnectionGUID: wTuGyv2bQUakDP6NuFOOUg==
X-CSE-MsgGUID: +exo54fyS9qR/X/0MjvR1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; d="scan'208";a="85236532"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2024 02:27:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1shn3t-000EO1-0L;
 Sat, 24 Aug 2024 09:27:57 +0000
Date: Sat, 24 Aug 2024 17:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, chaitanya.dhere@amd.com,
 jun.lei@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alex.hung@amd.com, aurabindo.pillai@amd.com,
 colin.i.king@gmail.com, dillon.varone@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ruanjinjie@huawei.com
Subject: Re: [PATCH -next 5/5] drm/amd/display: Make dcn35_fpga_funcs static
Message-ID: <202408241600.uHrTIx7j-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240824/202408241600.uHrTIx7j-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408241600.uHrTIx7j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408241600.uHrTIx7j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:1071:29: warning: unused variable 'dcn35_fpga_funcs' [-Wunused-variable]
    1071 | static struct clk_mgr_funcs dcn35_fpga_funcs = {
         |                             ^~~~~~~~~~~~~~~~
   1 warning generated.


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
