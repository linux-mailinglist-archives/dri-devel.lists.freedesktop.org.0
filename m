Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168022DA86D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 08:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72489289;
	Tue, 15 Dec 2020 07:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997789289
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 07:19:52 +0000 (UTC)
IronPort-SDR: GMs4qglS1LMU/HwPcjTrkmdNr0Lvx7tW2Ve3Glgne+y8pq9eHeiUQUEEEyzHq5C646xaytw+/d
 qCkLeBCWFB7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="154069700"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="154069700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 23:19:51 -0800
IronPort-SDR: qiVkYY6P3ARj5LO1IkZDNRJJy51DShSzLEM3c7MOv1v7YFDJaUy4ggHfA6sbDNAwbE+I1i8lkp
 pvZqKYIO9gxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="351745329"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 14 Dec 2020 23:19:49 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kp4ce-0000eH-G9; Tue, 15 Dec 2020 07:19:48 +0000
Date: Tue, 15 Dec 2020 15:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-20.45 1379/2427]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:103:35:
 error: no member named 'bw_params' in 'struct clk_mgr'
Message-ID: <202012151559.TkULBezk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Yang Xiong <Yang.Xiong@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
commit: 470f4be73099cc46478d2c708411fecde8197ca3 [1379/2427] drm/amdkcl: update DRM_AMD_DC_DCN3_0 to depends on legacy display config
config: x86_64-randconfig-a001-20201214 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project a29ecca7819a6ed4250d3689b12b1f664bb790d7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-20.45
        git checkout 470f4be73099cc46478d2c708411fecde8197ca3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:103:35: error: no member named 'bw_params' in 'struct clk_mgr'
                   entry_i += sizeof(clk_mgr->base.bw_params->clk_table.entries[0]);
                                     ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:113:40: error: no member named 'bw_params' in 'struct clk_mgr'
           uint16_t min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
                                   ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:116:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
           ~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:116:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:117:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:117:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:118:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:118:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:119:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:119:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:120:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:120:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:121:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:121:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:122:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:122:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:123:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
           ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:123:47: error: use of undeclared identifier 'WM_A'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
                                                        ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:124:16: error: no member named 'bw_params' in 'struct clk_mgr'
           clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
           ~~~~~~~~~~~~~ ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:26:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:229:2: error: type name requires a specifier or qualifier
           DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:164:2: note: expanded from macro 'DCN30_HUBP_REG_COMMON_VARIABLE_LIST'
           DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:239:2: error: type name requires a specifier or qualifier
           DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: note: expanded from macro 'DCN30_HUBP_REG_FIELD_VARIABLE_LIST'
           DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:250:2: error: type name requires a specifier or qualifier
           DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: note: expanded from macro 'DCN30_HUBP_REG_FIELD_VARIABLE_LIST'
           DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
           ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:61:15: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB' in 'struct dcn_hubp2_registers'
           REG_UPDATE_2(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:235:16: note: expanded from macro 'REG_UPDATE_2'
                   REG_UPDATE_N(reg, 2,\
                   ~~~~~~~~~~~~~^~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:227:9: note: expanded from macro 'REG_UPDATE_N'
                                   REG(reg_name), \
                                   ~~~~^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:36:20: note: expanded from macro 'REG'
           hubp2->hubp_regs->reg
           ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:62:3: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_SYSTEM' in 'struct dcn_hubp2_shift'
                   DCN_VM_SYSTEM_APERTURE_DEFAULT_SYSTEM, 1, /* 1 = system physical memory */
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:236:13: note: expanded from macro 'REG_UPDATE_2'
                                   FN(reg, f1), v1,\
                                   ~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:228:8: note: expanded from macro 'REG_UPDATE_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:62:3: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_SYSTEM' in 'struct dcn_hubp2_mask'
                   DCN_VM_SYSTEM_APERTURE_DEFAULT_SYSTEM, 1, /* 1 = system physical memory */
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:236:13: note: expanded from macro 'REG_UPDATE_2'
                                   FN(reg, f1), v1,\
                                   ~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:51: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
                                          ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:228:8: note: expanded from macro 'REG_UPDATE_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:63:3: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB' in 'struct dcn_hubp2_shift'
                   DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB, mc_vm_apt_default.high_part);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:237:13: note: expanded from macro 'REG_UPDATE_2'
                                   FN(reg, f2), v2)
                                   ~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:228:8: note: expanded from macro 'REG_UPDATE_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:63:3: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB' in 'struct dcn_hubp2_mask'
                   DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB, mc_vm_apt_default.high_part);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:237:13: note: expanded from macro 'REG_UPDATE_2'
                                   FN(reg, f2), v2)
                                   ~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:51: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
                                          ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:228:8: note: expanded from macro 'REG_UPDATE_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:65:10: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB' in 'struct dcn_hubp2_registers'
           REG_SET(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB, 0,
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:64:13: note: expanded from macro 'REG_SET'
                   REG_SET_N(reg_name, 1, initial_val, \
                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:56:9: note: expanded from macro 'REG_SET_N'
                                   REG(reg_name), \
                                   ~~~~^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:36:20: note: expanded from macro 'REG'
           hubp2->hubp_regs->reg
           ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:66:4: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB' in 'struct dcn_hubp2_shift'
                           DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB, mc_vm_apt_default.low_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:66:4: error: no member named 'DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB' in 'struct dcn_hubp2_mask'
                           DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB, mc_vm_apt_default.low_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:51: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
                                          ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:68:10: error: no member named 'DCN_VM_SYSTEM_APERTURE_LOW_ADDR' in 'struct dcn_hubp2_registers'
           REG_SET(DCN_VM_SYSTEM_APERTURE_LOW_ADDR, 0,
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:64:13: note: expanded from macro 'REG_SET'
                   REG_SET_N(reg_name, 1, initial_val, \
                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:56:9: note: expanded from macro 'REG_SET_N'
                                   REG(reg_name), \
                                   ~~~~^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:36:20: note: expanded from macro 'REG'
           hubp2->hubp_regs->reg
           ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:69:4: error: no member named 'MC_VM_SYSTEM_APERTURE_LOW_ADDR' in 'struct dcn_hubp2_shift'
                           MC_VM_SYSTEM_APERTURE_LOW_ADDR, mc_vm_apt_low.quad_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:69:4: error: no member named 'MC_VM_SYSTEM_APERTURE_LOW_ADDR' in 'struct dcn_hubp2_mask'
                           MC_VM_SYSTEM_APERTURE_LOW_ADDR, mc_vm_apt_low.quad_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:51: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
                                          ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:71:10: error: no member named 'DCN_VM_SYSTEM_APERTURE_HIGH_ADDR' in 'struct dcn_hubp2_registers'
           REG_SET(DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, 0,
           ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:64:13: note: expanded from macro 'REG_SET'
                   REG_SET_N(reg_name, 1, initial_val, \
                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:56:9: note: expanded from macro 'REG_SET_N'
                                   REG(reg_name), \
                                   ~~~~^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:36:20: note: expanded from macro 'REG'
           hubp2->hubp_regs->reg
           ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:72:4: error: no member named 'MC_VM_SYSTEM_APERTURE_HIGH_ADDR' in 'struct dcn_hubp2_shift'
                           MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mc_vm_apt_high.quad_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:72:4: error: no member named 'MC_VM_SYSTEM_APERTURE_HIGH_ADDR' in 'struct dcn_hubp2_mask'
                           MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mc_vm_apt_high.quad_part);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:65:18: note: expanded from macro 'REG_SET'
                                   FN(reg_name, field), val)
                                   ~~~~~~~~~~~~~^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:51: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
                                          ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:74:12: error: no member named 'DCN_VM_MX_L1_TLB_CNTL' in 'struct dcn_hubp2_registers'
           REG_SET_2(DCN_VM_MX_L1_TLB_CNTL, 0,
           ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:68:13: note: expanded from macro 'REG_SET_2'
                   REG_SET_N(reg, 2, init_value, \
                   ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:56:9: note: expanded from macro 'REG_SET_N'
                                   REG(reg_name), \
                                   ~~~~^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:36:20: note: expanded from macro 'REG'
           hubp2->hubp_regs->reg
           ~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:75:4: error: no member named 'ENABLE_L1_TLB' in 'struct dcn_hubp2_shift'
                           ENABLE_L1_TLB, 1,
                           ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:69:13: note: expanded from macro 'REG_SET_2'
                                   FN(reg, f1), v1,\
                                   ~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.c:43:21: note: expanded from macro 'FN'
           hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
           ~~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.c:384:4: error: no member named 'DCHUBBUB_ARB_VM_ROW_URGENCY_WATERMARK_A' in 'struct dcn_hubbub_shift'; did you mean 'DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A'?
                           DCHUBBUB_ARB_VM_ROW_URGENCY_WATERMARK_A, prog_wm_value);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                           DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:70:13: note: expanded from macro 'REG_SET_2'
                                   FN(reg, f2), v2)
                                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.c:41:19: note: expanded from macro 'FN'
           hubbub1->shifts->field_name, hubbub1->masks->field_name
                            ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h:284:2: note: 'DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A' declared here
           DCN_HUBBUB_REG_FIELD_LIST(uint8_t);
           ^
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h:214:8: note: expanded from macro 'DCN_HUBBUB_REG_FIELD_LIST'
                   type DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A;\
                        ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.c:384:4: error: no member named 'DCHUBBUB_ARB_VM_ROW_URGENCY_WATERMARK_A' in 'struct dcn_hubbub_mask'; did you mean 'DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A'?
                           DCHUBBUB_ARB_VM_ROW_URGENCY_WATERMARK_A, prog_wm_value);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                           DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:70:13: note: expanded from macro 'REG_SET_2'
                                   FN(reg, f2), v2)
                                           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hubbub.c:41:47: note: expanded from macro 'FN'
           hubbub1->shifts->field_name, hubbub1->masks->field_name
                                                        ^
   drivers/gpu/drm/amd/display/dc/inc/reg_helper.h:58:8: note: expanded from macro 'REG_SET_N'
                                   n, __VA_ARGS__)
                                      ^
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h:292:2: note: 'DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A' declared here
           DCN_HUBBUB_REG_FIELD_LIST(uint32_t);
           ^
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h:214:8: note: expanded from macro 'DCN_HUBBUB_REG_FIELD_LIST'
                   type DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A;\
                        ^
   2 errors generated.
..

vim +103 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c

652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   83  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   84  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   85  /* Query SMU for all clock states for a particular clock */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   86  static void dcn3_init_single_clock(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, unsigned int *entry_0, unsigned int *num_levels)
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   87  {
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   88  	unsigned int i;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   89  	char *entry_i = (char *)entry_0;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   90  	uint32_t ret = dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, 0xFF);
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   91  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   92  	if (ret & (1 << 31))
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   93  		/* fine-grained, only min and max */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   94  		*num_levels = 2;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   95  	else
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   96  		/* discrete, a number of fixed states */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   97  		/* will set num_levels to 0 on failure */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   98  		*num_levels = ret & 0xFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21   99  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  100  	/* if the initial message failed, num_levels will be 0 */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  101  	for (i = 0; i < *num_levels; i++) {
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  102  		*((unsigned int *)entry_i) = (dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, i) & 0xFFFF);
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21 @103  		entry_i += sizeof(clk_mgr->base.bw_params->clk_table.entries[0]);
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  104  	}
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  105  }
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  106  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  107  static void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  108  {
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  109  	/* defaults */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  110  	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  111  	double sr_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  112  	double sr_enter_plus_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  113  	uint16_t min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  114  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  115  	/* Set A - Normal - default values*/
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21 @116  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  117  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  118  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  119  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  120  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  121  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  122  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  123  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  124  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  125  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  126  	/* Set B - Performance - higher minimum clocks */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  127  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].valid = true;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  128  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  129  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  130  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  131  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  132  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  133  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  134  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  135  //	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  136  
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  137  	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  138  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  139  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dummy_pstate_latency_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  140  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  141  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  142  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  143  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  144  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  145  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  146  	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
652edbbbddcc8b1 Bhawanpreet Lakha 2020-05-21  147  

:::::: The code at line 103 was first introduced by commit
:::::: 652edbbbddcc8b1470d8fe91e7dca0ceeab4aced drm/amd/display: Add DCN3 CLK_MGR

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Yang Xiong <Yang.Xiong@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--u3/rZRmxL6MmkK24
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--u3/rZRmxL6MmkK24--
