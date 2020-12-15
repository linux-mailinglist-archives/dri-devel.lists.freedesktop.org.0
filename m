Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56462DA8ED
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3689B3B;
	Tue, 15 Dec 2020 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9A36E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:26:09 +0000 (UTC)
IronPort-SDR: uxw7jodk3oNZZbFPBVQpYLWVf6R4S9eOsNhSCj7UNl0gskwwqNIfCy0uwXhST0mZhxS0UL4+Xv
 AACZekJvJrcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="172252740"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="172252740"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 19:26:07 -0800
IronPort-SDR: ySqZyEhfZZI1ubrbaVcxnsfsZmtkbcwraTWCqYM/n/VqX8M1aH+NnvSFSLuKDEzc6vMlxmYwp8
 FP5+lf55TqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="336453433"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2020 19:26:04 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kp0yR-0000ZG-G5; Tue, 15 Dec 2020 03:26:03 +0000
Date: Tue, 15 Dec 2020 11:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Rossi <issor.oruam@gmail.com>
Subject: [radeon-alex:amd-20.45 1953/2427]
 drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:568:43: warning:
 initialized field overwritten
Message-ID: <202012151146.7vRJDUh1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yang Xiong <Yang.Xiong@amd.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
commit: e809646e73921328d66a2fbfddf067b9cdb30998 [1953/2427] drm/amd/display: enable SI support in the Kconfig (v2)
config: mips-allyesconfig (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-20.45
        git checkout e809646e73921328d66a2fbfddf067b9cdb30998
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:28:
>> drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:568:43: warning: initialized field overwritten [-Woverride-init]
     568 | #define mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1B7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:185:3: note: in expansion of macro 'transform_regs'
     185 |   transform_regs(0),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:568:43: note: (near initialization for 'xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNTL')
     568 | #define mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1B7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:185:3: note: in expansion of macro 'transform_regs'
     185 |   transform_regs(0),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:645:43: warning: initialized field overwritten [-Woverride-init]
     645 | #define mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1E7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:186:3: note: in expansion of macro 'transform_regs'
     186 |   transform_regs(1),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:645:43: note: (near initialization for 'xfm_regs[1].DCFE_MEM_LIGHT_SLEEP_CNTL')
     645 | #define mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1E7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:186:3: note: in expansion of macro 'transform_regs'
     186 |   transform_regs(1),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:722:43: warning: initialized field overwritten [-Woverride-init]
     722 | #define mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL 0x417F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro 'transform_regs'
     187 |   transform_regs(2),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:722:43: note: (near initialization for 'xfm_regs[2].DCFE_MEM_LIGHT_SLEEP_CNTL')
     722 | #define mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL 0x417F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro 'transform_regs'
     187 |   transform_regs(2),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:799:43: warning: initialized field overwritten [-Woverride-init]
     799 | #define mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL 0x447F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:188:3: note: in expansion of macro 'transform_regs'
     188 |   transform_regs(3),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:799:43: note: (near initialization for 'xfm_regs[3].DCFE_MEM_LIGHT_SLEEP_CNTL')
     799 | #define mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL 0x447F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:188:3: note: in expansion of macro 'transform_regs'
     188 |   transform_regs(3),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:877:43: warning: initialized field overwritten [-Woverride-init]
     877 | #define mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL 0x477F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:189:3: note: in expansion of macro 'transform_regs'
     189 |   transform_regs(4),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:877:43: note: (near initialization for 'xfm_regs[4].DCFE_MEM_LIGHT_SLEEP_CNTL')
     877 | #define mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL 0x477F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:189:3: note: in expansion of macro 'transform_regs'
     189 |   transform_regs(4),
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:954:43: warning: initialized field overwritten [-Woverride-init]
     954 | #define mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL 0x4A7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:190:3: note: in expansion of macro 'transform_regs'
     190 |   transform_regs(5)
         |   ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h:954:43: note: (near initialization for 'xfm_regs[5].DCFE_MEM_LIGHT_SLEEP_CNTL')
     954 | #define mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL 0x4A7F
         |                                           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:155:14: note: in expansion of macro 'mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL'
     155 |  .reg_name = mm ## block ## id ## _ ## reg_name
         |              ^~
   drivers/gpu/drm/amd/display/dc/dce/dce_transform.h:170:2: note: in expansion of macro 'SRI'
     170 |  SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:181:3: note: in expansion of macro 'XFM_COMMON_REG_LIST_DCE60'
     181 |   XFM_COMMON_REG_LIST_DCE60(id)\
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:190:3: note: in expansion of macro 'transform_regs'
     190 |   transform_regs(5)
         |   ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:29:
>> drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:6942:62: warning: initialized field overwritten [-Woverride-init]
    6942 | #define FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN__SHIFT 0x00000010
         |                                                              ^~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:96:16: note: in expansion of macro 'FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN__SHIFT'
      96 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:222:2: note: in expansion of macro 'OPP_SF'
     222 |  OPP_SF(FMT_BIT_DEPTH_CONTROL, FMT_TEMPORAL_DITHER_EN, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:293:2: note: in expansion of macro 'OPP_COMMON_MASK_SH_LIST_DCE_60'
     293 |  OPP_COMMON_MASK_SH_LIST_DCE_60(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:6942:62: note: (near initialization for 'opp_shift.FMT_TEMPORAL_DITHER_EN')
    6942 | #define FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN__SHIFT 0x00000010
         |                                                              ^~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:96:16: note: in expansion of macro 'FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN__SHIFT'
      96 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:222:2: note: in expansion of macro 'OPP_SF'
     222 |  OPP_SF(FMT_BIT_DEPTH_CONTROL, FMT_TEMPORAL_DITHER_EN, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:293:2: note: in expansion of macro 'OPP_COMMON_MASK_SH_LIST_DCE_60'
     293 |  OPP_COMMON_MASK_SH_LIST_DCE_60(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:6941:60: warning: initialized field overwritten [-Woverride-init]
    6941 | #define FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN_MASK 0x00010000L
         |                                                            ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:96:16: note: in expansion of macro 'FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN_MASK'
      96 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:222:2: note: in expansion of macro 'OPP_SF'
     222 |  OPP_SF(FMT_BIT_DEPTH_CONTROL, FMT_TEMPORAL_DITHER_EN, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:297:2: note: in expansion of macro 'OPP_COMMON_MASK_SH_LIST_DCE_60'
     297 |  OPP_COMMON_MASK_SH_LIST_DCE_60(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:6941:60: note: (near initialization for 'opp_mask.FMT_TEMPORAL_DITHER_EN')
    6941 | #define FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN_MASK 0x00010000L
         |                                                            ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:96:16: note: in expansion of macro 'FMT_BIT_DEPTH_CONTROL__FMT_TEMPORAL_DITHER_EN_MASK'
      96 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_opp.h:222:2: note: in expansion of macro 'OPP_SF'
     222 |  OPP_SF(FMT_BIT_DEPTH_CONTROL, FMT_TEMPORAL_DITHER_EN, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:297:2: note: in expansion of macro 'OPP_COMMON_MASK_SH_LIST_DCE_60'
     297 |  OPP_COMMON_MASK_SH_LIST_DCE_60(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:29:
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:745:58: warning: initialized field overwritten [-Woverride-init]
     745 | #define AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT 0x0000001f
         |                                                          ^~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:216:16: note: in expansion of macro 'AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT'
     216 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:104:2: note: in expansion of macro 'AUX_SF'
     104 |  AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:301:2: note: in expansion of macro 'DCE10_AUX_MASK_SH_LIST'
     301 |  DCE10_AUX_MASK_SH_LIST(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:745:58: note: (near initialization for 'aux_shift.AUX_SW_AUTOINCREMENT_DISABLE')
     745 | #define AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT 0x0000001f
         |                                                          ^~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:216:16: note: in expansion of macro 'AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT'
     216 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:104:2: note: in expansion of macro 'AUX_SF'
     104 |  AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:301:2: note: in expansion of macro 'DCE10_AUX_MASK_SH_LIST'
     301 |  DCE10_AUX_MASK_SH_LIST(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:744:56: warning: initialized field overwritten [-Woverride-init]
     744 | #define AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK 0x80000000L
         |                                                        ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:216:16: note: in expansion of macro 'AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK'
     216 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:104:2: note: in expansion of macro 'AUX_SF'
     104 |  AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:305:2: note: in expansion of macro 'DCE10_AUX_MASK_SH_LIST'
     305 |  DCE10_AUX_MASK_SH_LIST(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h:744:56: note: (near initialization for 'aux_mask.AUX_SW_AUTOINCREMENT_DISABLE')
     744 | #define AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK 0x80000000L
         |                                                        ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:216:16: note: in expansion of macro 'AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK'
     216 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/display/dc/dce/dce_aux.h:104:2: note: in expansion of macro 'AUX_SF'
     104 |  AUX_SF(AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:305:2: note: in expansion of macro 'DCE10_AUX_MASK_SH_LIST'
     305 |  DCE10_AUX_MASK_SH_LIST(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:529:17: warning: no previous prototype for 'dce60_aux_engine_create' [-Wmissing-prototypes]
     529 | struct dce_aux *dce60_aux_engine_create(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:567:20: warning: no previous prototype for 'dce60_i2c_hw_create' [-Wmissing-prototypes]

vim +568 drivers/gpu/drm/amd/include/asic_reg/dce/dce_6_0_d.h

de2bdb3dcf92280 Tom St Denis 2016-10-26    25  
de2bdb3dcf92280 Tom St Denis 2016-10-26    26  #define ixATTR00 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26    27  #define ixATTR01 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26    28  #define ixATTR02 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26    29  #define ixATTR03 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26    30  #define ixATTR04 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26    31  #define ixATTR05 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26    32  #define ixATTR06 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26    33  #define ixATTR07 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26    34  #define ixATTR08 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26    35  #define ixATTR09 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26    36  #define ixATTR0A 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26    37  #define ixATTR0B 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26    38  #define ixATTR0C 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26    39  #define ixATTR0D 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26    40  #define ixATTR0E 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26    41  #define ixATTR0F 0x000F
de2bdb3dcf92280 Tom St Denis 2016-10-26    42  #define ixATTR10 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26    43  #define ixATTR11 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26    44  #define ixATTR12 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26    45  #define ixATTR13 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26    46  #define ixATTR14 0x0014
de2bdb3dcf92280 Tom St Denis 2016-10-26    47  #define ixAUDIO_DESCRIPTOR0 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26    48  #define ixAUDIO_DESCRIPTOR10 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26    49  #define ixAUDIO_DESCRIPTOR1 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26    50  #define ixAUDIO_DESCRIPTOR11 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26    51  #define ixAUDIO_DESCRIPTOR12 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26    52  #define ixAUDIO_DESCRIPTOR13 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26    53  #define ixAUDIO_DESCRIPTOR2 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26    54  #define ixAUDIO_DESCRIPTOR3 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26    55  #define ixAUDIO_DESCRIPTOR4 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26    56  #define ixAUDIO_DESCRIPTOR5 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26    57  #define ixAUDIO_DESCRIPTOR6 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26    58  #define ixAUDIO_DESCRIPTOR7 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26    59  #define ixAUDIO_DESCRIPTOR8 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26    60  #define ixAUDIO_DESCRIPTOR9 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26    61  #define ixAZALIA_CUMULATIVE_LATENCY_COUNT 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26    62  #define ixAZALIA_CUMULATIVE_REQUEST_COUNT 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26    63  #define ixAZALIA_F0_CODEC_CONVERTER_CONTROL_CHANNEL_STREAM_ID 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26    64  #define ixAZALIA_F0_CODEC_CONVERTER_CONTROL_CONVERTER_FORMAT 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26    65  #define ixAZALIA_F0_CODEC_CONVERTER_CONTROL_DIGITAL_CONVERTER 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26    66  #define ixAZALIA_F0_CODEC_CONVERTER_CONTROL_GTC_EMBEDDING 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26    67  #define ixAZALIA_F0_CODEC_CONVERTER_CONTROL_RAMP_RATE 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26    68  #define ixAZALIA_F0_CODEC_CONVERTER_PARAMETER_AUDIO_WIDGET_CAPABILITIES 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26    69  #define ixAZALIA_F0_CODEC_CONVERTER_PARAMETER_STREAM_FORMATS 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26    70  #define ixAZALIA_F0_CODEC_CONVERTER_PARAMETER_SUPPORTED_SIZE_RATES 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26    71  #define ixAZALIA_F0_CODEC_CONVERTER_PIN_DEBUG 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26    72  #define ixAZALIA_F0_CODEC_CONVERTER_STRIPE_CONTROL 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26    73  #define ixAZALIA_F0_CODEC_PIN_ASSOCIATION_INFO 0x0062
de2bdb3dcf92280 Tom St Denis 2016-10-26    74  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR0 0x0028
de2bdb3dcf92280 Tom St Denis 2016-10-26    75  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR10 0x0032
de2bdb3dcf92280 Tom St Denis 2016-10-26    76  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR1 0x0029
de2bdb3dcf92280 Tom St Denis 2016-10-26    77  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR11 0x0033
de2bdb3dcf92280 Tom St Denis 2016-10-26    78  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR12 0x0034
de2bdb3dcf92280 Tom St Denis 2016-10-26    79  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR13 0x0035
de2bdb3dcf92280 Tom St Denis 2016-10-26    80  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR2 0x002A
de2bdb3dcf92280 Tom St Denis 2016-10-26    81  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR3 0x002B
de2bdb3dcf92280 Tom St Denis 2016-10-26    82  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR4 0x002C
de2bdb3dcf92280 Tom St Denis 2016-10-26    83  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR5 0x002D
de2bdb3dcf92280 Tom St Denis 2016-10-26    84  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR6 0x002E
de2bdb3dcf92280 Tom St Denis 2016-10-26    85  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR7 0x002F
de2bdb3dcf92280 Tom St Denis 2016-10-26    86  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR8 0x0030
de2bdb3dcf92280 Tom St Denis 2016-10-26    87  #define ixAZALIA_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR9 0x0031
de2bdb3dcf92280 Tom St Denis 2016-10-26    88  #define ixAZALIA_F0_CODEC_PIN_CONTROL_CHANNEL_SPEAKER 0x0025
de2bdb3dcf92280 Tom St Denis 2016-10-26    89  #define ixAZALIA_F0_CODEC_PIN_CONTROL_HOT_PLUG_CONTROL 0x0054
de2bdb3dcf92280 Tom St Denis 2016-10-26    90  #define ixAZALIA_F0_CODEC_PIN_CONTROL_MULTICHANNEL_ENABLE 0x0036
de2bdb3dcf92280 Tom St Denis 2016-10-26    91  #define ixAZALIA_F0_CODEC_PIN_CONTROL_MULTICHANNEL_ENABLE2 0x0057
de2bdb3dcf92280 Tom St Denis 2016-10-26    92  #define ixAZALIA_F0_CODEC_PIN_CONTROL_MULTICHANNEL_MODE 0x0058
de2bdb3dcf92280 Tom St Denis 2016-10-26    93  #define ixAZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_CONFIGURATION_DEFAULT 0x0056
de2bdb3dcf92280 Tom St Denis 2016-10-26    94  #define ixAZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_HBR 0x0038
de2bdb3dcf92280 Tom St Denis 2016-10-26    95  #define ixAZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_LIPSYNC 0x0037
de2bdb3dcf92280 Tom St Denis 2016-10-26    96  #define ixAZALIA_F0_CODEC_PIN_CONTROL_RESPONSE_PIN_SENSE 0x0023
de2bdb3dcf92280 Tom St Denis 2016-10-26    97  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO0 0x003A
de2bdb3dcf92280 Tom St Denis 2016-10-26    98  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO1 0x003B
de2bdb3dcf92280 Tom St Denis 2016-10-26    99  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO2 0x003C
de2bdb3dcf92280 Tom St Denis 2016-10-26   100  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO3 0x003D
de2bdb3dcf92280 Tom St Denis 2016-10-26   101  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO4 0x003E
de2bdb3dcf92280 Tom St Denis 2016-10-26   102  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO5 0x003F
de2bdb3dcf92280 Tom St Denis 2016-10-26   103  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO6 0x0040
de2bdb3dcf92280 Tom St Denis 2016-10-26   104  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO7 0x0041
de2bdb3dcf92280 Tom St Denis 2016-10-26   105  #define ixAZALIA_F0_CODEC_PIN_CONTROL_SINK_INFO8 0x0042
de2bdb3dcf92280 Tom St Denis 2016-10-26   106  #define ixAZALIA_F0_CODEC_PIN_CONTROL_UNSOLICITED_RESPONSE 0x0022
de2bdb3dcf92280 Tom St Denis 2016-10-26   107  #define ixAZALIA_F0_CODEC_PIN_CONTROL_UNSOLICITED_RESPONSE_FORCE 0x0055
de2bdb3dcf92280 Tom St Denis 2016-10-26   108  #define ixAZALIA_F0_CODEC_PIN_CONTROL_WIDGET_CONTROL 0x0024
de2bdb3dcf92280 Tom St Denis 2016-10-26   109  #define ixAZALIA_F0_CODEC_PIN_PARAMETER_AUDIO_WIDGET_CAPABILITIES 0x0020
de2bdb3dcf92280 Tom St Denis 2016-10-26   110  #define ixAZALIA_F0_CODEC_PIN_PARAMETER_CAPABILITIES 0x0021
de2bdb3dcf92280 Tom St Denis 2016-10-26   111  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_0 0x0059
de2bdb3dcf92280 Tom St Denis 2016-10-26   112  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_1 0x005A
de2bdb3dcf92280 Tom St Denis 2016-10-26   113  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_2 0x005B
de2bdb3dcf92280 Tom St Denis 2016-10-26   114  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_3 0x005C
de2bdb3dcf92280 Tom St Denis 2016-10-26   115  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_4 0x005D
de2bdb3dcf92280 Tom St Denis 2016-10-26   116  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_5 0x005E
de2bdb3dcf92280 Tom St Denis 2016-10-26   117  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_6 0x005F
de2bdb3dcf92280 Tom St Denis 2016-10-26   118  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_7 0x0060
de2bdb3dcf92280 Tom St Denis 2016-10-26   119  #define ixAZALIA_F0_PIN_CONTROL_CODEC_CS_OVERRIDE_8 0x0061
de2bdb3dcf92280 Tom St Denis 2016-10-26   120  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_CHANNEL_STREAM_ID 0x2706
de2bdb3dcf92280 Tom St Denis 2016-10-26   121  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_CONVERTER_FORMAT 0x2200
de2bdb3dcf92280 Tom St Denis 2016-10-26   122  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_DIGITAL_CONVERTER 0x270D
de2bdb3dcf92280 Tom St Denis 2016-10-26   123  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_DIGITAL_CONVERTER_2 0x270E
de2bdb3dcf92280 Tom St Denis 2016-10-26   124  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_DIGITAL_CONVERTER_3 0x273E
de2bdb3dcf92280 Tom St Denis 2016-10-26   125  #define ixAZALIA_F2_CODEC_CONVERTER_CONTROL_RAMP_RATE 0x2770
de2bdb3dcf92280 Tom St Denis 2016-10-26   126  #define ixAZALIA_F2_CODEC_CONVERTER_PARAMETER_AUDIO_WIDGET_CAPABILITIES 0x2F09
de2bdb3dcf92280 Tom St Denis 2016-10-26   127  #define ixAZALIA_F2_CODEC_CONVERTER_PARAMETER_STREAM_FORMATS 0x2F0B
de2bdb3dcf92280 Tom St Denis 2016-10-26   128  #define ixAZALIA_F2_CODEC_CONVERTER_PARAMETER_SUPPORTED_SIZE_RATES 0x2F0A
de2bdb3dcf92280 Tom St Denis 2016-10-26   129  #define ixAZALIA_F2_CODEC_CONVERTER_STRIPE_CONTROL 0x2724
de2bdb3dcf92280 Tom St Denis 2016-10-26   130  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_CONVERTER_SYNCHRONIZATION 0x1770
de2bdb3dcf92280 Tom St Denis 2016-10-26   131  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_POWER_STATE 0x1705
de2bdb3dcf92280 Tom St Denis 2016-10-26   132  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_RESET 0x17FF
de2bdb3dcf92280 Tom St Denis 2016-10-26   133  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_RESPONSE_SUBSYSTEM_ID 0x1720
de2bdb3dcf92280 Tom St Denis 2016-10-26   134  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_RESPONSE_SUBSYSTEM_ID_2 0x1721
de2bdb3dcf92280 Tom St Denis 2016-10-26   135  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_RESPONSE_SUBSYSTEM_ID_3 0x1722
de2bdb3dcf92280 Tom St Denis 2016-10-26   136  #define ixAZALIA_F2_CODEC_FUNCTION_CONTROL_RESPONSE_SUBSYSTEM_ID_4 0x1723
de2bdb3dcf92280 Tom St Denis 2016-10-26   137  #define ixAZALIA_F2_CODEC_FUNCTION_PARAMETER_GROUP_TYPE 0x1F05
de2bdb3dcf92280 Tom St Denis 2016-10-26   138  #define ixAZALIA_F2_CODEC_FUNCTION_PARAMETER_POWER_STATES 0x1F0F
de2bdb3dcf92280 Tom St Denis 2016-10-26   139  #define ixAZALIA_F2_CODEC_FUNCTION_PARAMETER_STREAM_FORMATS 0x1F0B
de2bdb3dcf92280 Tom St Denis 2016-10-26   140  #define ixAZALIA_F2_CODEC_FUNCTION_PARAMETER_SUBORDINATE_NODE_COUNT 0x1F04
de2bdb3dcf92280 Tom St Denis 2016-10-26   141  #define ixAZALIA_F2_CODEC_FUNCTION_PARAMETER_SUPPORTED_SIZE_RATES 0x1F0A
de2bdb3dcf92280 Tom St Denis 2016-10-26   142  #define ixAZALIA_F2_CODEC_PIN_ASSOCIATION_INFO 0x3793
de2bdb3dcf92280 Tom St Denis 2016-10-26   143  #define ixAZALIA_F2_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR 0x3776
de2bdb3dcf92280 Tom St Denis 2016-10-26   144  #define ixAZALIA_F2_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR_DATA 0x3776
de2bdb3dcf92280 Tom St Denis 2016-10-26   145  #define ixAZALIA_F2_CODEC_PIN_CONTROL_AUDIO_SINK_INFO_DATA 0x3781
de2bdb3dcf92280 Tom St Denis 2016-10-26   146  #define ixAZALIA_F2_CODEC_PIN_CONTROL_AUDIO_SINK_INFO_INDEX 0x3780
de2bdb3dcf92280 Tom St Denis 2016-10-26   147  #define ixAZALIA_F2_CODEC_PIN_CONTROL_CHANNEL_ALLOCATION 0x3771
de2bdb3dcf92280 Tom St Denis 2016-10-26   148  #define ixAZALIA_F2_CODEC_PIN_CONTROL_DOWN_MIX_INFO 0x3772
de2bdb3dcf92280 Tom St Denis 2016-10-26   149  #define ixAZALIA_F2_CODEC_PIN_CONTROL_HBR 0x377C
de2bdb3dcf92280 Tom St Denis 2016-10-26   150  #define ixAZALIA_F2_CODEC_PIN_CONTROL_LIPSYNC 0x377B
de2bdb3dcf92280 Tom St Denis 2016-10-26   151  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MANUFACTURER_ID 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   152  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL01_ENABLE 0x3777
de2bdb3dcf92280 Tom St Denis 2016-10-26   153  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL1_ENABLE 0x3785
de2bdb3dcf92280 Tom St Denis 2016-10-26   154  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL23_ENABLE 0x3778
de2bdb3dcf92280 Tom St Denis 2016-10-26   155  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL3_ENABLE 0x3786
de2bdb3dcf92280 Tom St Denis 2016-10-26   156  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL45_ENABLE 0x3779
de2bdb3dcf92280 Tom St Denis 2016-10-26   157  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL5_ENABLE 0x3787
de2bdb3dcf92280 Tom St Denis 2016-10-26   158  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL67_ENABLE 0x377A
de2bdb3dcf92280 Tom St Denis 2016-10-26   159  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL7_ENABLE 0x3788
de2bdb3dcf92280 Tom St Denis 2016-10-26   160  #define ixAZALIA_F2_CODEC_PIN_CONTROL_MULTICHANNEL_MODE 0x3789
de2bdb3dcf92280 Tom St Denis 2016-10-26   161  #define ixAZALIA_F2_CODEC_PIN_CONTROL_PORTID0 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   162  #define ixAZALIA_F2_CODEC_PIN_CONTROL_PORTID1 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26   163  #define ixAZALIA_F2_CODEC_PIN_CONTROL_PRODUCT_ID 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   164  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_CONFIGURATION_DEFAULT 0x371C
de2bdb3dcf92280 Tom St Denis 2016-10-26   165  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_CONFIGURATION_DEFAULT_2 0x371D
de2bdb3dcf92280 Tom St Denis 2016-10-26   166  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_CONFIGURATION_DEFAULT_3 0x371E
de2bdb3dcf92280 Tom St Denis 2016-10-26   167  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_CONFIGURATION_DEFAULT_4 0x371F
de2bdb3dcf92280 Tom St Denis 2016-10-26   168  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_CONNECTION_LIST_ENTRY 0x3702
de2bdb3dcf92280 Tom St Denis 2016-10-26   169  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_PIN_SENSE 0x3709
de2bdb3dcf92280 Tom St Denis 2016-10-26   170  #define ixAZALIA_F2_CODEC_PIN_CONTROL_RESPONSE_SPEAKER_ALLOCATION 0x3770
de2bdb3dcf92280 Tom St Denis 2016-10-26   171  #define ixAZALIA_F2_CODEC_PIN_CONTROL_SINK_DESCRIPTION_LEN 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   172  #define ixAZALIA_F2_CODEC_PIN_CONTROL_UNSOLICITED_RESPONSE 0x3708
de2bdb3dcf92280 Tom St Denis 2016-10-26   173  #define ixAZALIA_F2_CODEC_PIN_CONTROL_WIDGET_CONTROL 0x3707
de2bdb3dcf92280 Tom St Denis 2016-10-26   174  #define ixAZALIA_F2_CODEC_PIN_PARAMETER_AUDIO_WIDGET_CAPABILITIES 0x3F09
de2bdb3dcf92280 Tom St Denis 2016-10-26   175  #define ixAZALIA_F2_CODEC_PIN_PARAMETER_CAPABILITIES 0x3F0C
de2bdb3dcf92280 Tom St Denis 2016-10-26   176  #define ixAZALIA_F2_CODEC_PIN_PARAMETER_CONNECTION_LIST_LENGTH 0x3F0E
de2bdb3dcf92280 Tom St Denis 2016-10-26   177  #define ixAZALIA_F2_CODEC_ROOT_PARAMETER_REVISION_ID 0x0F02
de2bdb3dcf92280 Tom St Denis 2016-10-26   178  #define ixAZALIA_F2_CODEC_ROOT_PARAMETER_SUBORDINATE_NODE_COUNT 0x0F04
de2bdb3dcf92280 Tom St Denis 2016-10-26   179  #define ixAZALIA_F2_CODEC_ROOT_PARAMETER_VENDOR_AND_DEVICE_ID 0x0F00
de2bdb3dcf92280 Tom St Denis 2016-10-26   180  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_0 0x378A
de2bdb3dcf92280 Tom St Denis 2016-10-26   181  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_1 0x378B
de2bdb3dcf92280 Tom St Denis 2016-10-26   182  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_2 0x378C
de2bdb3dcf92280 Tom St Denis 2016-10-26   183  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_3 0x378D
de2bdb3dcf92280 Tom St Denis 2016-10-26   184  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_4 0x378E
de2bdb3dcf92280 Tom St Denis 2016-10-26   185  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_5 0x378F
de2bdb3dcf92280 Tom St Denis 2016-10-26   186  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_6 0x3790
de2bdb3dcf92280 Tom St Denis 2016-10-26   187  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_7 0x3791
de2bdb3dcf92280 Tom St Denis 2016-10-26   188  #define ixAZALIA_F2_PIN_CONTROL_CODEC_CS_OVERRIDE_8 0x3792
de2bdb3dcf92280 Tom St Denis 2016-10-26   189  #define ixAZALIA_FIFO_SIZE_CONTROL 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   190  #define ixAZALIA_LATENCY_COUNTER_CONTROL 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   191  #define ixAZALIA_STREAM_DEBUG 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26   192  #define ixAZALIA_WORSTCASE_LATENCY_COUNT 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   193  #define ixCRT00 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   194  #define ixCRT01 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   195  #define ixCRT02 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   196  #define ixCRT03 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   197  #define ixCRT04 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26   198  #define ixCRT05 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26   199  #define ixCRT06 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26   200  #define ixCRT07 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26   201  #define ixCRT08 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26   202  #define ixCRT09 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26   203  #define ixCRT0A 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26   204  #define ixCRT0B 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26   205  #define ixCRT0C 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26   206  #define ixCRT0D 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26   207  #define ixCRT0E 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26   208  #define ixCRT0F 0x000F
de2bdb3dcf92280 Tom St Denis 2016-10-26   209  #define ixCRT10 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26   210  #define ixCRT11 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26   211  #define ixCRT12 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26   212  #define ixCRT13 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26   213  #define ixCRT14 0x0014
de2bdb3dcf92280 Tom St Denis 2016-10-26   214  #define ixCRT15 0x0015
de2bdb3dcf92280 Tom St Denis 2016-10-26   215  #define ixCRT16 0x0016
de2bdb3dcf92280 Tom St Denis 2016-10-26   216  #define ixCRT17 0x0017
de2bdb3dcf92280 Tom St Denis 2016-10-26   217  #define ixCRT18 0x0018
de2bdb3dcf92280 Tom St Denis 2016-10-26   218  #define ixCRT1E 0x001E
de2bdb3dcf92280 Tom St Denis 2016-10-26   219  #define ixCRT1F 0x001F
de2bdb3dcf92280 Tom St Denis 2016-10-26   220  #define ixCRT22 0x0022
de2bdb3dcf92280 Tom St Denis 2016-10-26   221  #define ixDCIO_DEBUG10 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26   222  #define ixDCIO_DEBUG1 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   223  #define ixDCIO_DEBUG11 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26   224  #define ixDCIO_DEBUG12 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26   225  #define ixDCIO_DEBUG13 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26   226  #define ixDCIO_DEBUG2 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   227  #define ixDCIO_DEBUG3 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   228  #define ixDCIO_DEBUG4 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26   229  #define ixDCIO_DEBUG5 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26   230  #define ixDCIO_DEBUG6 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26   231  #define ixDCIO_DEBUG7 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26   232  #define ixDCIO_DEBUG8 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26   233  #define ixDCIO_DEBUG9 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26   234  #define ixDCIO_DEBUGA 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26   235  #define ixDCIO_DEBUGB 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26   236  #define ixDCIO_DEBUGC 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26   237  #define ixDCIO_DEBUGD 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26   238  #define ixDCIO_DEBUGE 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26   239  #define ixDCIO_DEBUGF 0x000F
de2bdb3dcf92280 Tom St Denis 2016-10-26   240  #define ixDCIO_DEBUG_ID 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   241  #define ixDMIF_DEBUG02_CORE0 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   242  #define ixDMIF_DEBUG02_CORE1 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26   243  #define ixDP_AUX1_DEBUG_A 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26   244  #define ixDP_AUX1_DEBUG_B 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26   245  #define ixDP_AUX1_DEBUG_C 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26   246  #define ixDP_AUX1_DEBUG_D 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26   247  #define ixDP_AUX1_DEBUG_E 0x0014
de2bdb3dcf92280 Tom St Denis 2016-10-26   248  #define ixDP_AUX1_DEBUG_F 0x0015
de2bdb3dcf92280 Tom St Denis 2016-10-26   249  #define ixDP_AUX1_DEBUG_G 0x0016
de2bdb3dcf92280 Tom St Denis 2016-10-26   250  #define ixDP_AUX1_DEBUG_H 0x0017
de2bdb3dcf92280 Tom St Denis 2016-10-26   251  #define ixDP_AUX1_DEBUG_I 0x0018
de2bdb3dcf92280 Tom St Denis 2016-10-26   252  #define ixDP_AUX2_DEBUG_A 0x0020
de2bdb3dcf92280 Tom St Denis 2016-10-26   253  #define ixDP_AUX2_DEBUG_B 0x0021
de2bdb3dcf92280 Tom St Denis 2016-10-26   254  #define ixDP_AUX2_DEBUG_C 0x0022
de2bdb3dcf92280 Tom St Denis 2016-10-26   255  #define ixDP_AUX2_DEBUG_D 0x0023
de2bdb3dcf92280 Tom St Denis 2016-10-26   256  #define ixDP_AUX2_DEBUG_E 0x0024
de2bdb3dcf92280 Tom St Denis 2016-10-26   257  #define ixDP_AUX2_DEBUG_F 0x0025
de2bdb3dcf92280 Tom St Denis 2016-10-26   258  #define ixDP_AUX2_DEBUG_G 0x0026
de2bdb3dcf92280 Tom St Denis 2016-10-26   259  #define ixDP_AUX2_DEBUG_H 0x0027
de2bdb3dcf92280 Tom St Denis 2016-10-26   260  #define ixDP_AUX2_DEBUG_I 0x0028
de2bdb3dcf92280 Tom St Denis 2016-10-26   261  #define ixDP_AUX3_DEBUG_A 0x0030
de2bdb3dcf92280 Tom St Denis 2016-10-26   262  #define ixDP_AUX3_DEBUG_B 0x0031
de2bdb3dcf92280 Tom St Denis 2016-10-26   263  #define ixDP_AUX3_DEBUG_C 0x0032
de2bdb3dcf92280 Tom St Denis 2016-10-26   264  #define ixDP_AUX3_DEBUG_D 0x0033
de2bdb3dcf92280 Tom St Denis 2016-10-26   265  #define ixDP_AUX3_DEBUG_E 0x0034
de2bdb3dcf92280 Tom St Denis 2016-10-26   266  #define ixDP_AUX3_DEBUG_F 0x0035
de2bdb3dcf92280 Tom St Denis 2016-10-26   267  #define ixDP_AUX3_DEBUG_G 0x0036
de2bdb3dcf92280 Tom St Denis 2016-10-26   268  #define ixDP_AUX3_DEBUG_H 0x0037
de2bdb3dcf92280 Tom St Denis 2016-10-26   269  #define ixDP_AUX3_DEBUG_I 0x0038
de2bdb3dcf92280 Tom St Denis 2016-10-26   270  #define ixDP_AUX4_DEBUG_A 0x0040
de2bdb3dcf92280 Tom St Denis 2016-10-26   271  #define ixDP_AUX4_DEBUG_B 0x0041
de2bdb3dcf92280 Tom St Denis 2016-10-26   272  #define ixDP_AUX4_DEBUG_C 0x0042
de2bdb3dcf92280 Tom St Denis 2016-10-26   273  #define ixDP_AUX4_DEBUG_D 0x0043
de2bdb3dcf92280 Tom St Denis 2016-10-26   274  #define ixDP_AUX4_DEBUG_E 0x0044
de2bdb3dcf92280 Tom St Denis 2016-10-26   275  #define ixDP_AUX4_DEBUG_F 0x0045
de2bdb3dcf92280 Tom St Denis 2016-10-26   276  #define ixDP_AUX4_DEBUG_G 0x0046
de2bdb3dcf92280 Tom St Denis 2016-10-26   277  #define ixDP_AUX4_DEBUG_H 0x0047
de2bdb3dcf92280 Tom St Denis 2016-10-26   278  #define ixDP_AUX4_DEBUG_I 0x0048
de2bdb3dcf92280 Tom St Denis 2016-10-26   279  #define ixDP_AUX5_DEBUG_A 0x0070
de2bdb3dcf92280 Tom St Denis 2016-10-26   280  #define ixDP_AUX5_DEBUG_B 0x0071
de2bdb3dcf92280 Tom St Denis 2016-10-26   281  #define ixDP_AUX5_DEBUG_C 0x0072
de2bdb3dcf92280 Tom St Denis 2016-10-26   282  #define ixDP_AUX5_DEBUG_D 0x0073
de2bdb3dcf92280 Tom St Denis 2016-10-26   283  #define ixDP_AUX5_DEBUG_E 0x0074
de2bdb3dcf92280 Tom St Denis 2016-10-26   284  #define ixDP_AUX5_DEBUG_F 0x0075
de2bdb3dcf92280 Tom St Denis 2016-10-26   285  #define ixDP_AUX5_DEBUG_G 0x0076
de2bdb3dcf92280 Tom St Denis 2016-10-26   286  #define ixDP_AUX5_DEBUG_H 0x0077
de2bdb3dcf92280 Tom St Denis 2016-10-26   287  #define ixDP_AUX5_DEBUG_I 0x0078
de2bdb3dcf92280 Tom St Denis 2016-10-26   288  #define ixDP_AUX6_DEBUG_A 0x0080
de2bdb3dcf92280 Tom St Denis 2016-10-26   289  #define ixDP_AUX6_DEBUG_B 0x0081
de2bdb3dcf92280 Tom St Denis 2016-10-26   290  #define ixDP_AUX6_DEBUG_C 0x0082
de2bdb3dcf92280 Tom St Denis 2016-10-26   291  #define ixDP_AUX6_DEBUG_D 0x0083
de2bdb3dcf92280 Tom St Denis 2016-10-26   292  #define ixDP_AUX6_DEBUG_E 0x0084
de2bdb3dcf92280 Tom St Denis 2016-10-26   293  #define ixDP_AUX6_DEBUG_F 0x0085
de2bdb3dcf92280 Tom St Denis 2016-10-26   294  #define ixDP_AUX6_DEBUG_G 0x0086
de2bdb3dcf92280 Tom St Denis 2016-10-26   295  #define ixDP_AUX6_DEBUG_H 0x0087
de2bdb3dcf92280 Tom St Denis 2016-10-26   296  #define ixDP_AUX6_DEBUG_I 0x0088
de2bdb3dcf92280 Tom St Denis 2016-10-26   297  #define ixFMT_DEBUG0 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   298  #define ixFMT_DEBUG1 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   299  #define ixFMT_DEBUG2 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   300  #define ixFMT_DEBUG_ID 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   301  #define ixGRA00 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   302  #define ixGRA01 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   303  #define ixGRA02 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   304  #define ixGRA03 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   305  #define ixGRA04 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26   306  #define ixGRA05 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26   307  #define ixGRA06 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26   308  #define ixGRA07 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26   309  #define ixGRA08 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26   310  #define ixIDDCCIF02_DBG_DCCIF_C 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26   311  #define ixIDDCCIF04_DBG_DCCIF_E 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26   312  #define ixIDDCCIF05_DBG_DCCIF_F 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26   313  #define ixMVP_DEBUG_12 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26   314  #define ixMVP_DEBUG_13 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26   315  #define ixMVP_DEBUG_14 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26   316  #define ixMVP_DEBUG_15 0x000F
de2bdb3dcf92280 Tom St Denis 2016-10-26   317  #define ixMVP_DEBUG_16 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26   318  #define ixMVP_DEBUG_17 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26   319  #define ixSEQ00 0x0000
de2bdb3dcf92280 Tom St Denis 2016-10-26   320  #define ixSEQ01 0x0001
de2bdb3dcf92280 Tom St Denis 2016-10-26   321  #define ixSEQ02 0x0002
de2bdb3dcf92280 Tom St Denis 2016-10-26   322  #define ixSEQ03 0x0003
de2bdb3dcf92280 Tom St Denis 2016-10-26   323  #define ixSEQ04 0x0004
de2bdb3dcf92280 Tom St Denis 2016-10-26   324  #define ixSINK_DESCRIPTION0 0x0005
de2bdb3dcf92280 Tom St Denis 2016-10-26   325  #define ixSINK_DESCRIPTION10 0x000F
de2bdb3dcf92280 Tom St Denis 2016-10-26   326  #define ixSINK_DESCRIPTION1 0x0006
de2bdb3dcf92280 Tom St Denis 2016-10-26   327  #define ixSINK_DESCRIPTION11 0x0010
de2bdb3dcf92280 Tom St Denis 2016-10-26   328  #define ixSINK_DESCRIPTION12 0x0011
de2bdb3dcf92280 Tom St Denis 2016-10-26   329  #define ixSINK_DESCRIPTION13 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26   330  #define ixSINK_DESCRIPTION14 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26   331  #define ixSINK_DESCRIPTION15 0x0014
de2bdb3dcf92280 Tom St Denis 2016-10-26   332  #define ixSINK_DESCRIPTION16 0x0015
de2bdb3dcf92280 Tom St Denis 2016-10-26   333  #define ixSINK_DESCRIPTION17 0x0016
de2bdb3dcf92280 Tom St Denis 2016-10-26   334  #define ixSINK_DESCRIPTION2 0x0007
de2bdb3dcf92280 Tom St Denis 2016-10-26   335  #define ixSINK_DESCRIPTION3 0x0008
de2bdb3dcf92280 Tom St Denis 2016-10-26   336  #define ixSINK_DESCRIPTION4 0x0009
de2bdb3dcf92280 Tom St Denis 2016-10-26   337  #define ixSINK_DESCRIPTION5 0x000A
de2bdb3dcf92280 Tom St Denis 2016-10-26   338  #define ixSINK_DESCRIPTION6 0x000B
de2bdb3dcf92280 Tom St Denis 2016-10-26   339  #define ixSINK_DESCRIPTION7 0x000C
de2bdb3dcf92280 Tom St Denis 2016-10-26   340  #define ixSINK_DESCRIPTION8 0x000D
de2bdb3dcf92280 Tom St Denis 2016-10-26   341  #define ixSINK_DESCRIPTION9 0x000E
de2bdb3dcf92280 Tom St Denis 2016-10-26   342  #define ixVGADCC_DBG_DCCIF_C 0x007E
de2bdb3dcf92280 Tom St Denis 2016-10-26   343  #define mmABM_TEST_DEBUG_DATA 0x169F
de2bdb3dcf92280 Tom St Denis 2016-10-26   344  #define mmABM_TEST_DEBUG_INDEX 0x169E
de2bdb3dcf92280 Tom St Denis 2016-10-26   345  #define mmAFMT_60958_0 0x1C41
de2bdb3dcf92280 Tom St Denis 2016-10-26   346  #define mmAFMT_60958_1 0x1C42
de2bdb3dcf92280 Tom St Denis 2016-10-26   347  #define mmAFMT_60958_2 0x1C48
de2bdb3dcf92280 Tom St Denis 2016-10-26   348  #define mmAFMT_AUDIO_CRC_CONTROL 0x1C43
de2bdb3dcf92280 Tom St Denis 2016-10-26   349  #define mmAFMT_AUDIO_CRC_RESULT 0x1C49
de2bdb3dcf92280 Tom St Denis 2016-10-26   350  #define mmAFMT_AUDIO_DBG_DTO_CNTL 0x1C52
de2bdb3dcf92280 Tom St Denis 2016-10-26   351  #define mmAFMT_AUDIO_INFO0 0x1C3F
de2bdb3dcf92280 Tom St Denis 2016-10-26   352  #define mmAFMT_AUDIO_INFO1 0x1C40
de2bdb3dcf92280 Tom St Denis 2016-10-26   353  #define mmAFMT_AUDIO_PACKET_CONTROL 0x1C4B
de2bdb3dcf92280 Tom St Denis 2016-10-26   354  #define mmAFMT_AUDIO_PACKET_CONTROL2 0x1C17
de2bdb3dcf92280 Tom St Denis 2016-10-26   355  #define mmAFMT_AUDIO_SRC_CONTROL 0x1C4F
de2bdb3dcf92280 Tom St Denis 2016-10-26   356  #define mmAFMT_AVI_INFO0 0x1C21
de2bdb3dcf92280 Tom St Denis 2016-10-26   357  #define mmAFMT_AVI_INFO1 0x1C22
de2bdb3dcf92280 Tom St Denis 2016-10-26   358  #define mmAFMT_AVI_INFO2 0x1C23
de2bdb3dcf92280 Tom St Denis 2016-10-26   359  #define mmAFMT_AVI_INFO3 0x1C24
de2bdb3dcf92280 Tom St Denis 2016-10-26   360  #define mmAFMT_GENERIC_0 0x1C28
de2bdb3dcf92280 Tom St Denis 2016-10-26   361  #define mmAFMT_GENERIC_1 0x1C29
de2bdb3dcf92280 Tom St Denis 2016-10-26   362  #define mmAFMT_GENERIC_2 0x1C2A
de2bdb3dcf92280 Tom St Denis 2016-10-26   363  #define mmAFMT_GENERIC_3 0x1C2B
de2bdb3dcf92280 Tom St Denis 2016-10-26   364  #define mmAFMT_GENERIC_4 0x1C2C
de2bdb3dcf92280 Tom St Denis 2016-10-26   365  #define mmAFMT_GENERIC_5 0x1C2D
de2bdb3dcf92280 Tom St Denis 2016-10-26   366  #define mmAFMT_GENERIC_6 0x1C2E
de2bdb3dcf92280 Tom St Denis 2016-10-26   367  #define mmAFMT_GENERIC_7 0x1C2F
de2bdb3dcf92280 Tom St Denis 2016-10-26   368  #define mmAFMT_GENERIC_HDR 0x1C27
de2bdb3dcf92280 Tom St Denis 2016-10-26   369  #define mmAFMT_INFOFRAME_CONTROL0 0x1C4D
de2bdb3dcf92280 Tom St Denis 2016-10-26   370  #define mmAFMT_INTERRUPT_STATUS 0x1C14
de2bdb3dcf92280 Tom St Denis 2016-10-26   371  #define mmAFMT_ISRC1_0 0x1C18
de2bdb3dcf92280 Tom St Denis 2016-10-26   372  #define mmAFMT_ISRC1_1 0x1C19
de2bdb3dcf92280 Tom St Denis 2016-10-26   373  #define mmAFMT_ISRC1_2 0x1C1A
de2bdb3dcf92280 Tom St Denis 2016-10-26   374  #define mmAFMT_ISRC1_3 0x1C1B
de2bdb3dcf92280 Tom St Denis 2016-10-26   375  #define mmAFMT_ISRC1_4 0x1C1C
de2bdb3dcf92280 Tom St Denis 2016-10-26   376  #define mmAFMT_ISRC2_0 0x1C1D
de2bdb3dcf92280 Tom St Denis 2016-10-26   377  #define mmAFMT_ISRC2_1 0x1C1E
de2bdb3dcf92280 Tom St Denis 2016-10-26   378  #define mmAFMT_ISRC2_2 0x1C1F
de2bdb3dcf92280 Tom St Denis 2016-10-26   379  #define mmAFMT_ISRC2_3 0x1C20
de2bdb3dcf92280 Tom St Denis 2016-10-26   380  #define mmAFMT_MPEG_INFO0 0x1C25
de2bdb3dcf92280 Tom St Denis 2016-10-26   381  #define mmAFMT_MPEG_INFO1 0x1C26
de2bdb3dcf92280 Tom St Denis 2016-10-26   382  #define mmAFMT_RAMP_CONTROL0 0x1C44
de2bdb3dcf92280 Tom St Denis 2016-10-26   383  #define mmAFMT_RAMP_CONTROL1 0x1C45
de2bdb3dcf92280 Tom St Denis 2016-10-26   384  #define mmAFMT_RAMP_CONTROL2 0x1C46
de2bdb3dcf92280 Tom St Denis 2016-10-26   385  #define mmAFMT_RAMP_CONTROL3 0x1C47
de2bdb3dcf92280 Tom St Denis 2016-10-26   386  #define mmAFMT_STATUS 0x1C4A
de2bdb3dcf92280 Tom St Denis 2016-10-26   387  #define mmAFMT_VBI_PACKET_CONTROL 0x1C4C
de2bdb3dcf92280 Tom St Denis 2016-10-26   388  #define mmATTRDR 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26   389  #define mmATTRDW 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26   390  #define mmATTRX 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26   391  #define mmAUX_ARB_CONTROL 0x1882
de2bdb3dcf92280 Tom St Denis 2016-10-26   392  #define mmAUX_CONTROL 0x1880
de2bdb3dcf92280 Tom St Denis 2016-10-26   393  #define mmAUX_DPHY_RX_CONTROL0 0x188A
de2bdb3dcf92280 Tom St Denis 2016-10-26   394  #define mmAUX_DPHY_RX_CONTROL1 0x188B
de2bdb3dcf92280 Tom St Denis 2016-10-26   395  #define mmAUX_DPHY_RX_STATUS 0x188D
de2bdb3dcf92280 Tom St Denis 2016-10-26   396  #define mmAUX_DPHY_TX_CONTROL 0x1889
de2bdb3dcf92280 Tom St Denis 2016-10-26   397  #define mmAUX_DPHY_TX_REF_CONTROL 0x1888
de2bdb3dcf92280 Tom St Denis 2016-10-26   398  #define mmAUX_DPHY_TX_STATUS 0x188C
de2bdb3dcf92280 Tom St Denis 2016-10-26   399  #define mmAUX_GTC_SYNC_CONTROL 0x188E
de2bdb3dcf92280 Tom St Denis 2016-10-26   400  #define mmAUX_GTC_SYNC_DATA 0x1890
de2bdb3dcf92280 Tom St Denis 2016-10-26   401  #define mmAUX_INTERRUPT_CONTROL 0x1883
de2bdb3dcf92280 Tom St Denis 2016-10-26   402  #define mmAUX_LS_DATA 0x1887
de2bdb3dcf92280 Tom St Denis 2016-10-26   403  #define mmAUX_LS_STATUS 0x1885
de2bdb3dcf92280 Tom St Denis 2016-10-26   404  #define mmAUXN_IMPCAL 0x190C
de2bdb3dcf92280 Tom St Denis 2016-10-26   405  #define mmAUXP_IMPCAL 0x190B
de2bdb3dcf92280 Tom St Denis 2016-10-26   406  #define mmAUX_SW_CONTROL 0x1881
de2bdb3dcf92280 Tom St Denis 2016-10-26   407  #define mmAUX_SW_DATA 0x1886
de2bdb3dcf92280 Tom St Denis 2016-10-26   408  #define mmAUX_SW_STATUS 0x1884
de2bdb3dcf92280 Tom St Denis 2016-10-26   409  #define mmAZALIA_APPLICATION_POSITION_IN_CYCLIC_BUFFER 0x17C9
de2bdb3dcf92280 Tom St Denis 2016-10-26   410  #define mmAZALIA_AUDIO_DTO 0x17BA
de2bdb3dcf92280 Tom St Denis 2016-10-26   411  #define mmAZALIA_AUDIO_DTO_CONTROL 0x17BB
de2bdb3dcf92280 Tom St Denis 2016-10-26   412  #define mmAZALIA_BDL_DMA_CONTROL 0x17BF
de2bdb3dcf92280 Tom St Denis 2016-10-26   413  #define mmAZALIA_CONTROLLER_DEBUG 0x17CF
de2bdb3dcf92280 Tom St Denis 2016-10-26   414  #define mmAZALIA_CORB_DMA_CONTROL 0x17C1
de2bdb3dcf92280 Tom St Denis 2016-10-26   415  #define mmAZALIA_CYCLIC_BUFFER_SYNC 0x17CA
de2bdb3dcf92280 Tom St Denis 2016-10-26   416  #define mmAZALIA_DATA_DMA_CONTROL 0x17BE
de2bdb3dcf92280 Tom St Denis 2016-10-26   417  #define mmAZALIA_F0_CODEC_CHANNEL_COUNT_CONTROL 0x17D5
de2bdb3dcf92280 Tom St Denis 2016-10-26   418  #define mmAZALIA_F0_CODEC_DEBUG 0x17DF
de2bdb3dcf92280 Tom St Denis 2016-10-26   419  #define mmAZALIA_F0_CODEC_ENDPOINT_DATA 0x1781
de2bdb3dcf92280 Tom St Denis 2016-10-26   420  #define mmAZALIA_F0_CODEC_ENDPOINT_INDEX 0x1780
de2bdb3dcf92280 Tom St Denis 2016-10-26   421  #define mmAZALIA_F0_CODEC_FUNCTION_CONTROL_CONVERTER_SYNCHRONIZATION 0x17DE
de2bdb3dcf92280 Tom St Denis 2016-10-26   422  #define mmAZALIA_F0_CODEC_FUNCTION_CONTROL_POWER_STATE 0x17DB
de2bdb3dcf92280 Tom St Denis 2016-10-26   423  #define mmAZALIA_F0_CODEC_FUNCTION_CONTROL_RESET 0x17DC
de2bdb3dcf92280 Tom St Denis 2016-10-26   424  #define mmAZALIA_F0_CODEC_FUNCTION_CONTROL_RESPONSE_SUBSYSTEM_ID 0x17DD
de2bdb3dcf92280 Tom St Denis 2016-10-26   425  #define mmAZALIA_F0_CODEC_FUNCTION_PARAMETER_GROUP_TYPE 0x17D7
de2bdb3dcf92280 Tom St Denis 2016-10-26   426  #define mmAZALIA_F0_CODEC_FUNCTION_PARAMETER_POWER_STATES 0x17DA
de2bdb3dcf92280 Tom St Denis 2016-10-26   427  #define mmAZALIA_F0_CODEC_FUNCTION_PARAMETER_STREAM_FORMATS 0x17D9
de2bdb3dcf92280 Tom St Denis 2016-10-26   428  #define mmAZALIA_F0_CODEC_FUNCTION_PARAMETER_SUPPORTED_SIZE_RATES 0x17D8
de2bdb3dcf92280 Tom St Denis 2016-10-26   429  #define mmAZALIA_F0_CODEC_RESYNC_FIFO_CONTROL 0x17D6
de2bdb3dcf92280 Tom St Denis 2016-10-26   430  #define mmAZALIA_F0_CODEC_ROOT_PARAMETER_REVISION_ID 0x17D3
de2bdb3dcf92280 Tom St Denis 2016-10-26   431  #define mmAZALIA_F0_CODEC_ROOT_PARAMETER_VENDOR_AND_DEVICE_ID 0x17D2
de2bdb3dcf92280 Tom St Denis 2016-10-26   432  #define mmAZALIA_GLOBAL_CAPABILITIES 0x17CB
de2bdb3dcf92280 Tom St Denis 2016-10-26   433  #define mmAZALIA_OUTPUT_PAYLOAD_CAPABILITY 0x17CC
de2bdb3dcf92280 Tom St Denis 2016-10-26   434  #define mmAZALIA_OUTPUT_STREAM_ARBITER_CONTROL 0x17CD
de2bdb3dcf92280 Tom St Denis 2016-10-26   435  #define mmAZALIA_RIRB_AND_DP_CONTROL 0x17C0
de2bdb3dcf92280 Tom St Denis 2016-10-26   436  #define mmAZALIA_SCLK_CONTROL 0x17BC
de2bdb3dcf92280 Tom St Denis 2016-10-26   437  #define mmAZALIA_STREAM_DATA 0x17E9
de2bdb3dcf92280 Tom St Denis 2016-10-26   438  #define mmAZALIA_STREAM_INDEX 0x17E8
de2bdb3dcf92280 Tom St Denis 2016-10-26   439  #define mmAZALIA_UNDERFLOW_FILLER_SAMPLE 0x17BD
de2bdb3dcf92280 Tom St Denis 2016-10-26   440  #define mmAZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA 0x1781
de2bdb3dcf92280 Tom St Denis 2016-10-26   441  #define mmAZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x1780
de2bdb3dcf92280 Tom St Denis 2016-10-26   442  #define mmAZF0ENDPOINT1_AZALIA_F0_CODEC_ENDPOINT_DATA 0x1787
de2bdb3dcf92280 Tom St Denis 2016-10-26   443  #define mmAZF0ENDPOINT1_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x1786
de2bdb3dcf92280 Tom St Denis 2016-10-26   444  #define mmAZF0ENDPOINT2_AZALIA_F0_CODEC_ENDPOINT_DATA 0x178D
de2bdb3dcf92280 Tom St Denis 2016-10-26   445  #define mmAZF0ENDPOINT2_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x178C
de2bdb3dcf92280 Tom St Denis 2016-10-26   446  #define mmAZF0ENDPOINT3_AZALIA_F0_CODEC_ENDPOINT_DATA 0x1793
de2bdb3dcf92280 Tom St Denis 2016-10-26   447  #define mmAZF0ENDPOINT3_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x1792
de2bdb3dcf92280 Tom St Denis 2016-10-26   448  #define mmAZF0ENDPOINT4_AZALIA_F0_CODEC_ENDPOINT_DATA 0x1799
de2bdb3dcf92280 Tom St Denis 2016-10-26   449  #define mmAZF0ENDPOINT4_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x1798
de2bdb3dcf92280 Tom St Denis 2016-10-26   450  #define mmAZF0ENDPOINT5_AZALIA_F0_CODEC_ENDPOINT_DATA 0x179F
de2bdb3dcf92280 Tom St Denis 2016-10-26   451  #define mmAZF0ENDPOINT5_AZALIA_F0_CODEC_ENDPOINT_INDEX 0x179E
de2bdb3dcf92280 Tom St Denis 2016-10-26   452  #define mmAZF0STREAM0_AZALIA_STREAM_DATA 0x17E9
de2bdb3dcf92280 Tom St Denis 2016-10-26   453  #define mmAZF0STREAM0_AZALIA_STREAM_INDEX 0x17E8
de2bdb3dcf92280 Tom St Denis 2016-10-26   454  #define mmAZF0STREAM1_AZALIA_STREAM_DATA 0x17ED
de2bdb3dcf92280 Tom St Denis 2016-10-26   455  #define mmAZF0STREAM1_AZALIA_STREAM_INDEX 0x17EC
de2bdb3dcf92280 Tom St Denis 2016-10-26   456  #define mmAZF0STREAM2_AZALIA_STREAM_DATA 0x17F1
de2bdb3dcf92280 Tom St Denis 2016-10-26   457  #define mmAZF0STREAM2_AZALIA_STREAM_INDEX 0x17F0
de2bdb3dcf92280 Tom St Denis 2016-10-26   458  #define mmAZF0STREAM3_AZALIA_STREAM_DATA 0x17F5
de2bdb3dcf92280 Tom St Denis 2016-10-26   459  #define mmAZF0STREAM3_AZALIA_STREAM_INDEX 0x17F4
de2bdb3dcf92280 Tom St Denis 2016-10-26   460  #define mmAZF0STREAM4_AZALIA_STREAM_DATA 0x17F9
de2bdb3dcf92280 Tom St Denis 2016-10-26   461  #define mmAZF0STREAM4_AZALIA_STREAM_INDEX 0x17F8
de2bdb3dcf92280 Tom St Denis 2016-10-26   462  #define mmAZF0STREAM5_AZALIA_STREAM_DATA 0x17FD
de2bdb3dcf92280 Tom St Denis 2016-10-26   463  #define mmAZF0STREAM5_AZALIA_STREAM_INDEX 0x17FC
de2bdb3dcf92280 Tom St Denis 2016-10-26   464  #define mmAZ_TEST_DEBUG_DATA 0x17D1
de2bdb3dcf92280 Tom St Denis 2016-10-26   465  #define mmAZ_TEST_DEBUG_INDEX 0x17D0
de2bdb3dcf92280 Tom St Denis 2016-10-26   466  #define mmBL1_PWM_ABM_CNTL 0x162E
de2bdb3dcf92280 Tom St Denis 2016-10-26   467  #define mmBL1_PWM_AMBIENT_LIGHT_LEVEL 0x1628
de2bdb3dcf92280 Tom St Denis 2016-10-26   468  #define mmBL1_PWM_BL_UPDATE_SAMPLE_RATE 0x162F
de2bdb3dcf92280 Tom St Denis 2016-10-26   469  #define mmBL1_PWM_CURRENT_ABM_LEVEL 0x162B
de2bdb3dcf92280 Tom St Denis 2016-10-26   470  #define mmBL1_PWM_FINAL_DUTY_CYCLE 0x162C
de2bdb3dcf92280 Tom St Denis 2016-10-26   471  #define mmBL1_PWM_GRP2_REG_LOCK 0x1630
de2bdb3dcf92280 Tom St Denis 2016-10-26   472  #define mmBL1_PWM_MINIMUM_DUTY_CYCLE 0x162D
de2bdb3dcf92280 Tom St Denis 2016-10-26   473  #define mmBL1_PWM_TARGET_ABM_LEVEL 0x162A
de2bdb3dcf92280 Tom St Denis 2016-10-26   474  #define mmBL1_PWM_USER_LEVEL 0x1629
de2bdb3dcf92280 Tom St Denis 2016-10-26   475  #define mmBL_PWM_CNTL 0x191E
de2bdb3dcf92280 Tom St Denis 2016-10-26   476  #define mmBL_PWM_CNTL2 0x191F
de2bdb3dcf92280 Tom St Denis 2016-10-26   477  #define mmBL_PWM_GRP1_REG_LOCK 0x1921
de2bdb3dcf92280 Tom St Denis 2016-10-26   478  #define mmBL_PWM_PERIOD_CNTL 0x1920
de2bdb3dcf92280 Tom St Denis 2016-10-26   479  #define mmBPHYC_DAC_AUTO_CALIB_CONTROL 0x19FE
de2bdb3dcf92280 Tom St Denis 2016-10-26   480  #define mmBPHYC_DAC_MACRO_CNTL 0x19FD
de2bdb3dcf92280 Tom St Denis 2016-10-26   481  #define mmCC_DC_PIPE_DIS 0x177F
de2bdb3dcf92280 Tom St Denis 2016-10-26   482  #define mmCC_RCU_DC_AUDIO_PORT_CONNECTIVITY 0x17D4
de2bdb3dcf92280 Tom St Denis 2016-10-26   483  #define mmCOMM_MATRIXA_TRANS_C11_C12 0x1A43
de2bdb3dcf92280 Tom St Denis 2016-10-26   484  #define mmCOMM_MATRIXA_TRANS_C13_C14 0x1A44
de2bdb3dcf92280 Tom St Denis 2016-10-26   485  #define mmCOMM_MATRIXA_TRANS_C21_C22 0x1A45
de2bdb3dcf92280 Tom St Denis 2016-10-26   486  #define mmCOMM_MATRIXA_TRANS_C23_C24 0x1A46
de2bdb3dcf92280 Tom St Denis 2016-10-26   487  #define mmCOMM_MATRIXA_TRANS_C31_C32 0x1A47
de2bdb3dcf92280 Tom St Denis 2016-10-26   488  #define mmCOMM_MATRIXA_TRANS_C33_C34 0x1A48
de2bdb3dcf92280 Tom St Denis 2016-10-26   489  #define mmCOMM_MATRIXB_TRANS_C11_C12 0x1A49
de2bdb3dcf92280 Tom St Denis 2016-10-26   490  #define mmCOMM_MATRIXB_TRANS_C13_C14 0x1A4A
de2bdb3dcf92280 Tom St Denis 2016-10-26   491  #define mmCOMM_MATRIXB_TRANS_C21_C22 0x1A4B
de2bdb3dcf92280 Tom St Denis 2016-10-26   492  #define mmCOMM_MATRIXB_TRANS_C23_C24 0x1A4C
de2bdb3dcf92280 Tom St Denis 2016-10-26   493  #define mmCOMM_MATRIXB_TRANS_C31_C32 0x1A4D
de2bdb3dcf92280 Tom St Denis 2016-10-26   494  #define mmCOMM_MATRIXB_TRANS_C33_C34 0x1A4E
de2bdb3dcf92280 Tom St Denis 2016-10-26   495  #define mmCRTC0_CRTC_3D_STRUCTURE_CONTROL 0x1B78
de2bdb3dcf92280 Tom St Denis 2016-10-26   496  #define mmCRTC0_CRTC_ALLOW_STOP_OFF_V_CNT 0x1BC3
de2bdb3dcf92280 Tom St Denis 2016-10-26   497  #define mmCRTC0_CRTC_BLACK_COLOR 0x1BA2
de2bdb3dcf92280 Tom St Denis 2016-10-26   498  #define mmCRTC0_CRTC_BLANK_CONTROL 0x1B9D
de2bdb3dcf92280 Tom St Denis 2016-10-26   499  #define mmCRTC0_CRTC_BLANK_DATA_COLOR 0x1BA1
de2bdb3dcf92280 Tom St Denis 2016-10-26   500  #define mmCRTC0_CRTC_CONTROL 0x1B9C
de2bdb3dcf92280 Tom St Denis 2016-10-26   501  #define mmCRTC0_CRTC_COUNT_CONTROL 0x1BA9
de2bdb3dcf92280 Tom St Denis 2016-10-26   502  #define mmCRTC0_CRTC_COUNT_RESET 0x1BAA
de2bdb3dcf92280 Tom St Denis 2016-10-26   503  #define mmCRTC0_CRTC_DCFE_CLOCK_CONTROL 0x1B7C
de2bdb3dcf92280 Tom St Denis 2016-10-26   504  #define mmCRTC0_CRTC_DOUBLE_BUFFER_CONTROL 0x1BB6
de2bdb3dcf92280 Tom St Denis 2016-10-26   505  #define mmCRTC0_CRTC_DTMTEST_CNTL 0x1B92
de2bdb3dcf92280 Tom St Denis 2016-10-26   506  #define mmCRTC0_CRTC_DTMTEST_STATUS_POSITION 0x1B93
de2bdb3dcf92280 Tom St Denis 2016-10-26   507  #define mmCRTC0_CRTC_FLOW_CONTROL 0x1B99
de2bdb3dcf92280 Tom St Denis 2016-10-26   508  #define mmCRTC0_CRTC_FORCE_COUNT_NOW_CNTL 0x1B98
de2bdb3dcf92280 Tom St Denis 2016-10-26   509  #define mmCRTC0_CRTC_GSL_CONTROL 0x1B7B
de2bdb3dcf92280 Tom St Denis 2016-10-26   510  #define mmCRTC0_CRTC_GSL_VSYNC_GAP 0x1B79
de2bdb3dcf92280 Tom St Denis 2016-10-26   511  #define mmCRTC0_CRTC_GSL_WINDOW 0x1B7A
de2bdb3dcf92280 Tom St Denis 2016-10-26   512  #define mmCRTC0_CRTC_H_BLANK_EARLY_NUM 0x1B7D
de2bdb3dcf92280 Tom St Denis 2016-10-26   513  #define mmCRTC0_CRTC_H_BLANK_START_END 0x1B81
de2bdb3dcf92280 Tom St Denis 2016-10-26   514  #define mmCRTC0_CRTC_H_SYNC_A 0x1B82
de2bdb3dcf92280 Tom St Denis 2016-10-26   515  #define mmCRTC0_CRTC_H_SYNC_A_CNTL 0x1B83
de2bdb3dcf92280 Tom St Denis 2016-10-26   516  #define mmCRTC0_CRTC_H_SYNC_B 0x1B84
de2bdb3dcf92280 Tom St Denis 2016-10-26   517  #define mmCRTC0_CRTC_H_SYNC_B_CNTL 0x1B85
de2bdb3dcf92280 Tom St Denis 2016-10-26   518  #define mmCRTC0_CRTC_H_TOTAL 0x1B80
de2bdb3dcf92280 Tom St Denis 2016-10-26   519  #define mmCRTC0_CRTC_INTERLACE_CONTROL 0x1B9E
de2bdb3dcf92280 Tom St Denis 2016-10-26   520  #define mmCRTC0_CRTC_INTERLACE_STATUS 0x1B9F
de2bdb3dcf92280 Tom St Denis 2016-10-26   521  #define mmCRTC0_CRTC_INTERRUPT_CONTROL 0x1BB4
de2bdb3dcf92280 Tom St Denis 2016-10-26   522  #define mmCRTC0_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x1BAB
de2bdb3dcf92280 Tom St Denis 2016-10-26   523  #define mmCRTC0_CRTC_MASTER_EN 0x1BC2
de2bdb3dcf92280 Tom St Denis 2016-10-26   524  #define mmCRTC0_CRTC_MVP_INBAND_CNTL_INSERT 0x1BBF
de2bdb3dcf92280 Tom St Denis 2016-10-26   525  #define mmCRTC0_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x1BC0
de2bdb3dcf92280 Tom St Denis 2016-10-26   526  #define mmCRTC0_CRTC_MVP_STATUS 0x1BC1
de2bdb3dcf92280 Tom St Denis 2016-10-26   527  #define mmCRTC0_CRTC_NOM_VERT_POSITION 0x1BA5
de2bdb3dcf92280 Tom St Denis 2016-10-26   528  #define mmCRTC0_CRTC_OVERSCAN_COLOR 0x1BA0
de2bdb3dcf92280 Tom St Denis 2016-10-26   529  #define mmCRTC0_CRTC_SNAPSHOT_CONTROL 0x1BB0
de2bdb3dcf92280 Tom St Denis 2016-10-26   530  #define mmCRTC0_CRTC_SNAPSHOT_FRAME 0x1BB2
de2bdb3dcf92280 Tom St Denis 2016-10-26   531  #define mmCRTC0_CRTC_SNAPSHOT_POSITION 0x1BB1
de2bdb3dcf92280 Tom St Denis 2016-10-26   532  #define mmCRTC0_CRTC_SNAPSHOT_STATUS 0x1BAF
de2bdb3dcf92280 Tom St Denis 2016-10-26   533  #define mmCRTC0_CRTC_START_LINE_CONTROL 0x1BB3
de2bdb3dcf92280 Tom St Denis 2016-10-26   534  #define mmCRTC0_CRTC_STATUS 0x1BA3
de2bdb3dcf92280 Tom St Denis 2016-10-26   535  #define mmCRTC0_CRTC_STATUS_FRAME_COUNT 0x1BA6
de2bdb3dcf92280 Tom St Denis 2016-10-26   536  #define mmCRTC0_CRTC_STATUS_HV_COUNT 0x1BA8
de2bdb3dcf92280 Tom St Denis 2016-10-26   537  #define mmCRTC0_CRTC_STATUS_POSITION 0x1BA4
de2bdb3dcf92280 Tom St Denis 2016-10-26   538  #define mmCRTC0_CRTC_STATUS_VF_COUNT 0x1BA7
de2bdb3dcf92280 Tom St Denis 2016-10-26   539  #define mmCRTC0_CRTC_STEREO_CONTROL 0x1BAE
de2bdb3dcf92280 Tom St Denis 2016-10-26   540  #define mmCRTC0_CRTC_STEREO_FORCE_NEXT_EYE 0x1B9B
de2bdb3dcf92280 Tom St Denis 2016-10-26   541  #define mmCRTC0_CRTC_STEREO_STATUS 0x1BAD
de2bdb3dcf92280 Tom St Denis 2016-10-26   542  #define mmCRTC0_CRTC_TEST_DEBUG_DATA 0x1BC7
de2bdb3dcf92280 Tom St Denis 2016-10-26   543  #define mmCRTC0_CRTC_TEST_DEBUG_INDEX 0x1BC6
de2bdb3dcf92280 Tom St Denis 2016-10-26   544  #define mmCRTC0_CRTC_TEST_PATTERN_COLOR 0x1BBC
de2bdb3dcf92280 Tom St Denis 2016-10-26   545  #define mmCRTC0_CRTC_TEST_PATTERN_CONTROL 0x1BBA
de2bdb3dcf92280 Tom St Denis 2016-10-26   546  #define mmCRTC0_CRTC_TEST_PATTERN_PARAMETERS 0x1BBB
de2bdb3dcf92280 Tom St Denis 2016-10-26   547  #define mmCRTC0_CRTC_TRIGA_CNTL 0x1B94
de2bdb3dcf92280 Tom St Denis 2016-10-26   548  #define mmCRTC0_CRTC_TRIGA_MANUAL_TRIG 0x1B95
de2bdb3dcf92280 Tom St Denis 2016-10-26   549  #define mmCRTC0_CRTC_TRIGB_CNTL 0x1B96
de2bdb3dcf92280 Tom St Denis 2016-10-26   550  #define mmCRTC0_CRTC_TRIGB_MANUAL_TRIG 0x1B97
de2bdb3dcf92280 Tom St Denis 2016-10-26   551  #define mmCRTC0_CRTC_UPDATE_LOCK 0x1BB5
de2bdb3dcf92280 Tom St Denis 2016-10-26   552  #define mmCRTC0_CRTC_VBI_END 0x1B86
de2bdb3dcf92280 Tom St Denis 2016-10-26   553  #define mmCRTC0_CRTC_V_BLANK_START_END 0x1B8D
de2bdb3dcf92280 Tom St Denis 2016-10-26   554  #define mmCRTC0_CRTC_VERT_SYNC_CONTROL 0x1BAC
de2bdb3dcf92280 Tom St Denis 2016-10-26   555  #define mmCRTC0_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x1BB7
de2bdb3dcf92280 Tom St Denis 2016-10-26   556  #define mmCRTC0_CRTC_V_SYNC_A 0x1B8E
de2bdb3dcf92280 Tom St Denis 2016-10-26   557  #define mmCRTC0_CRTC_V_SYNC_A_CNTL 0x1B8F
de2bdb3dcf92280 Tom St Denis 2016-10-26   558  #define mmCRTC0_CRTC_V_SYNC_B 0x1B90
de2bdb3dcf92280 Tom St Denis 2016-10-26   559  #define mmCRTC0_CRTC_V_SYNC_B_CNTL 0x1B91
de2bdb3dcf92280 Tom St Denis 2016-10-26   560  #define mmCRTC0_CRTC_VSYNC_NOM_INT_STATUS 0x1B8C
de2bdb3dcf92280 Tom St Denis 2016-10-26   561  #define mmCRTC0_CRTC_V_TOTAL 0x1B87
de2bdb3dcf92280 Tom St Denis 2016-10-26   562  #define mmCRTC0_CRTC_V_TOTAL_CONTROL 0x1B8A
de2bdb3dcf92280 Tom St Denis 2016-10-26   563  #define mmCRTC0_CRTC_V_TOTAL_INT_STATUS 0x1B8B
de2bdb3dcf92280 Tom St Denis 2016-10-26   564  #define mmCRTC0_CRTC_V_TOTAL_MAX 0x1B89
de2bdb3dcf92280 Tom St Denis 2016-10-26   565  #define mmCRTC0_CRTC_V_TOTAL_MIN 0x1B88
de2bdb3dcf92280 Tom St Denis 2016-10-26   566  #define mmCRTC0_CRTC_V_UPDATE_INT_STATUS 0x1BC4
de2bdb3dcf92280 Tom St Denis 2016-10-26   567  #define mmCRTC0_DCFE_DBG_SEL 0x1B7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  @568  #define mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1B7F
de2bdb3dcf92280 Tom St Denis 2016-10-26   569  #define mmCRTC0_MASTER_UPDATE_LOCK 0x1BBD
de2bdb3dcf92280 Tom St Denis 2016-10-26   570  #define mmCRTC0_MASTER_UPDATE_MODE 0x1BBE
de2bdb3dcf92280 Tom St Denis 2016-10-26   571  #define mmCRTC0_PIXEL_RATE_CNTL 0x0140
de2bdb3dcf92280 Tom St Denis 2016-10-26   572  #define mmCRTC1_CRTC_3D_STRUCTURE_CONTROL 0x1E78
de2bdb3dcf92280 Tom St Denis 2016-10-26   573  #define mmCRTC1_CRTC_ALLOW_STOP_OFF_V_CNT 0x1EC3
de2bdb3dcf92280 Tom St Denis 2016-10-26   574  #define mmCRTC1_CRTC_BLACK_COLOR 0x1EA2
de2bdb3dcf92280 Tom St Denis 2016-10-26   575  #define mmCRTC1_CRTC_BLANK_CONTROL 0x1E9D
de2bdb3dcf92280 Tom St Denis 2016-10-26   576  #define mmCRTC1_CRTC_BLANK_DATA_COLOR 0x1EA1
de2bdb3dcf92280 Tom St Denis 2016-10-26   577  #define mmCRTC1_CRTC_CONTROL 0x1E9C
de2bdb3dcf92280 Tom St Denis 2016-10-26   578  #define mmCRTC1_CRTC_COUNT_CONTROL 0x1EA9
de2bdb3dcf92280 Tom St Denis 2016-10-26   579  #define mmCRTC1_CRTC_COUNT_RESET 0x1EAA
de2bdb3dcf92280 Tom St Denis 2016-10-26   580  #define mmCRTC1_CRTC_DCFE_CLOCK_CONTROL 0x1E7C
de2bdb3dcf92280 Tom St Denis 2016-10-26   581  #define mmCRTC1_CRTC_DOUBLE_BUFFER_CONTROL 0x1EB6
de2bdb3dcf92280 Tom St Denis 2016-10-26   582  #define mmCRTC1_CRTC_DTMTEST_CNTL 0x1E92
de2bdb3dcf92280 Tom St Denis 2016-10-26   583  #define mmCRTC1_CRTC_DTMTEST_STATUS_POSITION 0x1E93
de2bdb3dcf92280 Tom St Denis 2016-10-26   584  #define mmCRTC1_CRTC_FLOW_CONTROL 0x1E99
de2bdb3dcf92280 Tom St Denis 2016-10-26   585  #define mmCRTC1_CRTC_FORCE_COUNT_NOW_CNTL 0x1E98
de2bdb3dcf92280 Tom St Denis 2016-10-26   586  #define mmCRTC1_CRTC_GSL_CONTROL 0x1E7B
de2bdb3dcf92280 Tom St Denis 2016-10-26   587  #define mmCRTC1_CRTC_GSL_VSYNC_GAP 0x1E79
de2bdb3dcf92280 Tom St Denis 2016-10-26   588  #define mmCRTC1_CRTC_GSL_WINDOW 0x1E7A
de2bdb3dcf92280 Tom St Denis 2016-10-26   589  #define mmCRTC1_CRTC_H_BLANK_EARLY_NUM 0x1E7D
de2bdb3dcf92280 Tom St Denis 2016-10-26   590  #define mmCRTC1_CRTC_H_BLANK_START_END 0x1E81
de2bdb3dcf92280 Tom St Denis 2016-10-26   591  #define mmCRTC1_CRTC_H_SYNC_A 0x1E82
de2bdb3dcf92280 Tom St Denis 2016-10-26   592  #define mmCRTC1_CRTC_H_SYNC_A_CNTL 0x1E83
de2bdb3dcf92280 Tom St Denis 2016-10-26   593  #define mmCRTC1_CRTC_H_SYNC_B 0x1E84
de2bdb3dcf92280 Tom St Denis 2016-10-26   594  #define mmCRTC1_CRTC_H_SYNC_B_CNTL 0x1E85
de2bdb3dcf92280 Tom St Denis 2016-10-26   595  #define mmCRTC1_CRTC_H_TOTAL 0x1E80
de2bdb3dcf92280 Tom St Denis 2016-10-26   596  #define mmCRTC1_CRTC_INTERLACE_CONTROL 0x1E9E
de2bdb3dcf92280 Tom St Denis 2016-10-26   597  #define mmCRTC1_CRTC_INTERLACE_STATUS 0x1E9F
de2bdb3dcf92280 Tom St Denis 2016-10-26   598  #define mmCRTC1_CRTC_INTERRUPT_CONTROL 0x1EB4
de2bdb3dcf92280 Tom St Denis 2016-10-26   599  #define mmCRTC1_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x1EAB
de2bdb3dcf92280 Tom St Denis 2016-10-26   600  #define mmCRTC1_CRTC_MASTER_EN 0x1EC2
de2bdb3dcf92280 Tom St Denis 2016-10-26   601  #define mmCRTC1_CRTC_MVP_INBAND_CNTL_INSERT 0x1EBF
de2bdb3dcf92280 Tom St Denis 2016-10-26   602  #define mmCRTC1_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x1EC0
de2bdb3dcf92280 Tom St Denis 2016-10-26   603  #define mmCRTC1_CRTC_MVP_STATUS 0x1EC1
de2bdb3dcf92280 Tom St Denis 2016-10-26   604  #define mmCRTC1_CRTC_NOM_VERT_POSITION 0x1EA5
de2bdb3dcf92280 Tom St Denis 2016-10-26   605  #define mmCRTC1_CRTC_OVERSCAN_COLOR 0x1EA0
de2bdb3dcf92280 Tom St Denis 2016-10-26   606  #define mmCRTC1_CRTC_SNAPSHOT_CONTROL 0x1EB0
de2bdb3dcf92280 Tom St Denis 2016-10-26   607  #define mmCRTC1_CRTC_SNAPSHOT_FRAME 0x1EB2
de2bdb3dcf92280 Tom St Denis 2016-10-26   608  #define mmCRTC1_CRTC_SNAPSHOT_POSITION 0x1EB1
de2bdb3dcf92280 Tom St Denis 2016-10-26   609  #define mmCRTC1_CRTC_SNAPSHOT_STATUS 0x1EAF
de2bdb3dcf92280 Tom St Denis 2016-10-26   610  #define mmCRTC1_CRTC_START_LINE_CONTROL 0x1EB3
de2bdb3dcf92280 Tom St Denis 2016-10-26   611  #define mmCRTC1_CRTC_STATUS 0x1EA3
de2bdb3dcf92280 Tom St Denis 2016-10-26   612  #define mmCRTC1_CRTC_STATUS_FRAME_COUNT 0x1EA6
de2bdb3dcf92280 Tom St Denis 2016-10-26   613  #define mmCRTC1_CRTC_STATUS_HV_COUNT 0x1EA8
de2bdb3dcf92280 Tom St Denis 2016-10-26   614  #define mmCRTC1_CRTC_STATUS_POSITION 0x1EA4
de2bdb3dcf92280 Tom St Denis 2016-10-26   615  #define mmCRTC1_CRTC_STATUS_VF_COUNT 0x1EA7
de2bdb3dcf92280 Tom St Denis 2016-10-26   616  #define mmCRTC1_CRTC_STEREO_CONTROL 0x1EAE
de2bdb3dcf92280 Tom St Denis 2016-10-26   617  #define mmCRTC1_CRTC_STEREO_FORCE_NEXT_EYE 0x1E9B
de2bdb3dcf92280 Tom St Denis 2016-10-26   618  #define mmCRTC1_CRTC_STEREO_STATUS 0x1EAD
de2bdb3dcf92280 Tom St Denis 2016-10-26   619  #define mmCRTC1_CRTC_TEST_DEBUG_DATA 0x1EC7
de2bdb3dcf92280 Tom St Denis 2016-10-26   620  #define mmCRTC1_CRTC_TEST_DEBUG_INDEX 0x1EC6
de2bdb3dcf92280 Tom St Denis 2016-10-26   621  #define mmCRTC1_CRTC_TEST_PATTERN_COLOR 0x1EBC
de2bdb3dcf92280 Tom St Denis 2016-10-26   622  #define mmCRTC1_CRTC_TEST_PATTERN_CONTROL 0x1EBA
de2bdb3dcf92280 Tom St Denis 2016-10-26   623  #define mmCRTC1_CRTC_TEST_PATTERN_PARAMETERS 0x1EBB
de2bdb3dcf92280 Tom St Denis 2016-10-26   624  #define mmCRTC1_CRTC_TRIGA_CNTL 0x1E94
de2bdb3dcf92280 Tom St Denis 2016-10-26   625  #define mmCRTC1_CRTC_TRIGA_MANUAL_TRIG 0x1E95
de2bdb3dcf92280 Tom St Denis 2016-10-26   626  #define mmCRTC1_CRTC_TRIGB_CNTL 0x1E96
de2bdb3dcf92280 Tom St Denis 2016-10-26   627  #define mmCRTC1_CRTC_TRIGB_MANUAL_TRIG 0x1E97
de2bdb3dcf92280 Tom St Denis 2016-10-26   628  #define mmCRTC1_CRTC_UPDATE_LOCK 0x1EB5
de2bdb3dcf92280 Tom St Denis 2016-10-26   629  #define mmCRTC1_CRTC_VBI_END 0x1E86
de2bdb3dcf92280 Tom St Denis 2016-10-26   630  #define mmCRTC1_CRTC_V_BLANK_START_END 0x1E8D
de2bdb3dcf92280 Tom St Denis 2016-10-26   631  #define mmCRTC1_CRTC_VERT_SYNC_CONTROL 0x1EAC
de2bdb3dcf92280 Tom St Denis 2016-10-26   632  #define mmCRTC1_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x1EB7
de2bdb3dcf92280 Tom St Denis 2016-10-26   633  #define mmCRTC1_CRTC_V_SYNC_A 0x1E8E
de2bdb3dcf92280 Tom St Denis 2016-10-26   634  #define mmCRTC1_CRTC_V_SYNC_A_CNTL 0x1E8F
de2bdb3dcf92280 Tom St Denis 2016-10-26   635  #define mmCRTC1_CRTC_V_SYNC_B 0x1E90
de2bdb3dcf92280 Tom St Denis 2016-10-26   636  #define mmCRTC1_CRTC_V_SYNC_B_CNTL 0x1E91
de2bdb3dcf92280 Tom St Denis 2016-10-26   637  #define mmCRTC1_CRTC_VSYNC_NOM_INT_STATUS 0x1E8C
de2bdb3dcf92280 Tom St Denis 2016-10-26   638  #define mmCRTC1_CRTC_V_TOTAL 0x1E87
de2bdb3dcf92280 Tom St Denis 2016-10-26   639  #define mmCRTC1_CRTC_V_TOTAL_CONTROL 0x1E8A
de2bdb3dcf92280 Tom St Denis 2016-10-26   640  #define mmCRTC1_CRTC_V_TOTAL_INT_STATUS 0x1E8B
de2bdb3dcf92280 Tom St Denis 2016-10-26   641  #define mmCRTC1_CRTC_V_TOTAL_MAX 0x1E89
de2bdb3dcf92280 Tom St Denis 2016-10-26   642  #define mmCRTC1_CRTC_V_TOTAL_MIN 0x1E88
de2bdb3dcf92280 Tom St Denis 2016-10-26   643  #define mmCRTC1_CRTC_V_UPDATE_INT_STATUS 0x1EC4
de2bdb3dcf92280 Tom St Denis 2016-10-26   644  #define mmCRTC1_DCFE_DBG_SEL 0x1E7E
de2bdb3dcf92280 Tom St Denis 2016-10-26   645  #define mmCRTC1_DCFE_MEM_LIGHT_SLEEP_CNTL 0x1E7F
de2bdb3dcf92280 Tom St Denis 2016-10-26   646  #define mmCRTC1_MASTER_UPDATE_LOCK 0x1EBD
de2bdb3dcf92280 Tom St Denis 2016-10-26   647  #define mmCRTC1_MASTER_UPDATE_MODE 0x1EBE
de2bdb3dcf92280 Tom St Denis 2016-10-26   648  #define mmCRTC1_PIXEL_RATE_CNTL 0x0144
de2bdb3dcf92280 Tom St Denis 2016-10-26   649  #define mmCRTC2_CRTC_3D_STRUCTURE_CONTROL 0x4178
de2bdb3dcf92280 Tom St Denis 2016-10-26   650  #define mmCRTC2_CRTC_ALLOW_STOP_OFF_V_CNT 0x41C3
de2bdb3dcf92280 Tom St Denis 2016-10-26   651  #define mmCRTC2_CRTC_BLACK_COLOR 0x41A2
de2bdb3dcf92280 Tom St Denis 2016-10-26   652  #define mmCRTC2_CRTC_BLANK_CONTROL 0x419D
de2bdb3dcf92280 Tom St Denis 2016-10-26   653  #define mmCRTC2_CRTC_BLANK_DATA_COLOR 0x41A1
de2bdb3dcf92280 Tom St Denis 2016-10-26   654  #define mmCRTC2_CRTC_CONTROL 0x419C
de2bdb3dcf92280 Tom St Denis 2016-10-26   655  #define mmCRTC2_CRTC_COUNT_CONTROL 0x41A9
de2bdb3dcf92280 Tom St Denis 2016-10-26   656  #define mmCRTC2_CRTC_COUNT_RESET 0x41AA
de2bdb3dcf92280 Tom St Denis 2016-10-26   657  #define mmCRTC2_CRTC_DCFE_CLOCK_CONTROL 0x417C
de2bdb3dcf92280 Tom St Denis 2016-10-26   658  #define mmCRTC2_CRTC_DOUBLE_BUFFER_CONTROL 0x41B6
de2bdb3dcf92280 Tom St Denis 2016-10-26   659  #define mmCRTC2_CRTC_DTMTEST_CNTL 0x4192
de2bdb3dcf92280 Tom St Denis 2016-10-26   660  #define mmCRTC2_CRTC_DTMTEST_STATUS_POSITION 0x4193
de2bdb3dcf92280 Tom St Denis 2016-10-26   661  #define mmCRTC2_CRTC_FLOW_CONTROL 0x4199
de2bdb3dcf92280 Tom St Denis 2016-10-26   662  #define mmCRTC2_CRTC_FORCE_COUNT_NOW_CNTL 0x4198
de2bdb3dcf92280 Tom St Denis 2016-10-26   663  #define mmCRTC2_CRTC_GSL_CONTROL 0x417B
de2bdb3dcf92280 Tom St Denis 2016-10-26   664  #define mmCRTC2_CRTC_GSL_VSYNC_GAP 0x4179
de2bdb3dcf92280 Tom St Denis 2016-10-26   665  #define mmCRTC2_CRTC_GSL_WINDOW 0x417A
de2bdb3dcf92280 Tom St Denis 2016-10-26   666  #define mmCRTC2_CRTC_H_BLANK_EARLY_NUM 0x417D
de2bdb3dcf92280 Tom St Denis 2016-10-26   667  #define mmCRTC2_CRTC_H_BLANK_START_END 0x4181
de2bdb3dcf92280 Tom St Denis 2016-10-26   668  #define mmCRTC2_CRTC_H_SYNC_A 0x4182
de2bdb3dcf92280 Tom St Denis 2016-10-26   669  #define mmCRTC2_CRTC_H_SYNC_A_CNTL 0x4183
de2bdb3dcf92280 Tom St Denis 2016-10-26   670  #define mmCRTC2_CRTC_H_SYNC_B 0x4184
de2bdb3dcf92280 Tom St Denis 2016-10-26   671  #define mmCRTC2_CRTC_H_SYNC_B_CNTL 0x4185
de2bdb3dcf92280 Tom St Denis 2016-10-26   672  #define mmCRTC2_CRTC_H_TOTAL 0x4180
de2bdb3dcf92280 Tom St Denis 2016-10-26   673  #define mmCRTC2_CRTC_INTERLACE_CONTROL 0x419E
de2bdb3dcf92280 Tom St Denis 2016-10-26   674  #define mmCRTC2_CRTC_INTERLACE_STATUS 0x419F
de2bdb3dcf92280 Tom St Denis 2016-10-26   675  #define mmCRTC2_CRTC_INTERRUPT_CONTROL 0x41B4
de2bdb3dcf92280 Tom St Denis 2016-10-26   676  #define mmCRTC2_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x41AB
de2bdb3dcf92280 Tom St Denis 2016-10-26   677  #define mmCRTC2_CRTC_MASTER_EN 0x41C2
de2bdb3dcf92280 Tom St Denis 2016-10-26   678  #define mmCRTC2_CRTC_MVP_INBAND_CNTL_INSERT 0x41BF
de2bdb3dcf92280 Tom St Denis 2016-10-26   679  #define mmCRTC2_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x41C0
de2bdb3dcf92280 Tom St Denis 2016-10-26   680  #define mmCRTC2_CRTC_MVP_STATUS 0x41C1
de2bdb3dcf92280 Tom St Denis 2016-10-26   681  #define mmCRTC2_CRTC_NOM_VERT_POSITION 0x41A5
de2bdb3dcf92280 Tom St Denis 2016-10-26   682  #define mmCRTC2_CRTC_OVERSCAN_COLOR 0x41A0
de2bdb3dcf92280 Tom St Denis 2016-10-26   683  #define mmCRTC2_CRTC_SNAPSHOT_CONTROL 0x41B0
de2bdb3dcf92280 Tom St Denis 2016-10-26   684  #define mmCRTC2_CRTC_SNAPSHOT_FRAME 0x41B2
de2bdb3dcf92280 Tom St Denis 2016-10-26   685  #define mmCRTC2_CRTC_SNAPSHOT_POSITION 0x41B1
de2bdb3dcf92280 Tom St Denis 2016-10-26   686  #define mmCRTC2_CRTC_SNAPSHOT_STATUS 0x41AF
de2bdb3dcf92280 Tom St Denis 2016-10-26   687  #define mmCRTC2_CRTC_START_LINE_CONTROL 0x41B3
de2bdb3dcf92280 Tom St Denis 2016-10-26   688  #define mmCRTC2_CRTC_STATUS 0x41A3
de2bdb3dcf92280 Tom St Denis 2016-10-26   689  #define mmCRTC2_CRTC_STATUS_FRAME_COUNT 0x41A6
de2bdb3dcf92280 Tom St Denis 2016-10-26   690  #define mmCRTC2_CRTC_STATUS_HV_COUNT 0x41A8
de2bdb3dcf92280 Tom St Denis 2016-10-26   691  #define mmCRTC2_CRTC_STATUS_POSITION 0x41A4
de2bdb3dcf92280 Tom St Denis 2016-10-26   692  #define mmCRTC2_CRTC_STATUS_VF_COUNT 0x41A7
de2bdb3dcf92280 Tom St Denis 2016-10-26   693  #define mmCRTC2_CRTC_STEREO_CONTROL 0x41AE
de2bdb3dcf92280 Tom St Denis 2016-10-26   694  #define mmCRTC2_CRTC_STEREO_FORCE_NEXT_EYE 0x419B
de2bdb3dcf92280 Tom St Denis 2016-10-26   695  #define mmCRTC2_CRTC_STEREO_STATUS 0x41AD
de2bdb3dcf92280 Tom St Denis 2016-10-26   696  #define mmCRTC2_CRTC_TEST_DEBUG_DATA 0x41C7
de2bdb3dcf92280 Tom St Denis 2016-10-26   697  #define mmCRTC2_CRTC_TEST_DEBUG_INDEX 0x41C6
de2bdb3dcf92280 Tom St Denis 2016-10-26   698  #define mmCRTC2_CRTC_TEST_PATTERN_COLOR 0x41BC
de2bdb3dcf92280 Tom St Denis 2016-10-26   699  #define mmCRTC2_CRTC_TEST_PATTERN_CONTROL 0x41BA
de2bdb3dcf92280 Tom St Denis 2016-10-26   700  #define mmCRTC2_CRTC_TEST_PATTERN_PARAMETERS 0x41BB
de2bdb3dcf92280 Tom St Denis 2016-10-26   701  #define mmCRTC2_CRTC_TRIGA_CNTL 0x4194
de2bdb3dcf92280 Tom St Denis 2016-10-26   702  #define mmCRTC2_CRTC_TRIGA_MANUAL_TRIG 0x4195
de2bdb3dcf92280 Tom St Denis 2016-10-26   703  #define mmCRTC2_CRTC_TRIGB_CNTL 0x4196
de2bdb3dcf92280 Tom St Denis 2016-10-26   704  #define mmCRTC2_CRTC_TRIGB_MANUAL_TRIG 0x4197
de2bdb3dcf92280 Tom St Denis 2016-10-26   705  #define mmCRTC2_CRTC_UPDATE_LOCK 0x41B5
de2bdb3dcf92280 Tom St Denis 2016-10-26   706  #define mmCRTC2_CRTC_VBI_END 0x4186
de2bdb3dcf92280 Tom St Denis 2016-10-26   707  #define mmCRTC2_CRTC_V_BLANK_START_END 0x418D
de2bdb3dcf92280 Tom St Denis 2016-10-26   708  #define mmCRTC2_CRTC_VERT_SYNC_CONTROL 0x41AC
de2bdb3dcf92280 Tom St Denis 2016-10-26   709  #define mmCRTC2_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x41B7
de2bdb3dcf92280 Tom St Denis 2016-10-26   710  #define mmCRTC2_CRTC_V_SYNC_A 0x418E
de2bdb3dcf92280 Tom St Denis 2016-10-26   711  #define mmCRTC2_CRTC_V_SYNC_A_CNTL 0x418F
de2bdb3dcf92280 Tom St Denis 2016-10-26   712  #define mmCRTC2_CRTC_V_SYNC_B 0x4190
de2bdb3dcf92280 Tom St Denis 2016-10-26   713  #define mmCRTC2_CRTC_V_SYNC_B_CNTL 0x4191
de2bdb3dcf92280 Tom St Denis 2016-10-26   714  #define mmCRTC2_CRTC_VSYNC_NOM_INT_STATUS 0x418C
de2bdb3dcf92280 Tom St Denis 2016-10-26   715  #define mmCRTC2_CRTC_V_TOTAL 0x4187
de2bdb3dcf92280 Tom St Denis 2016-10-26   716  #define mmCRTC2_CRTC_V_TOTAL_CONTROL 0x418A
de2bdb3dcf92280 Tom St Denis 2016-10-26   717  #define mmCRTC2_CRTC_V_TOTAL_INT_STATUS 0x418B
de2bdb3dcf92280 Tom St Denis 2016-10-26   718  #define mmCRTC2_CRTC_V_TOTAL_MAX 0x4189
de2bdb3dcf92280 Tom St Denis 2016-10-26   719  #define mmCRTC2_CRTC_V_TOTAL_MIN 0x4188
de2bdb3dcf92280 Tom St Denis 2016-10-26   720  #define mmCRTC2_CRTC_V_UPDATE_INT_STATUS 0x41C4
de2bdb3dcf92280 Tom St Denis 2016-10-26   721  #define mmCRTC2_DCFE_DBG_SEL 0x417E
de2bdb3dcf92280 Tom St Denis 2016-10-26   722  #define mmCRTC2_DCFE_MEM_LIGHT_SLEEP_CNTL 0x417F
de2bdb3dcf92280 Tom St Denis 2016-10-26   723  #define mmCRTC2_MASTER_UPDATE_LOCK 0x41BD
de2bdb3dcf92280 Tom St Denis 2016-10-26   724  #define mmCRTC2_MASTER_UPDATE_MODE 0x41BE
de2bdb3dcf92280 Tom St Denis 2016-10-26   725  #define mmCRTC2_PIXEL_RATE_CNTL 0x0148
de2bdb3dcf92280 Tom St Denis 2016-10-26   726  #define mmCRTC3_CRTC_3D_STRUCTURE_CONTROL 0x4478
de2bdb3dcf92280 Tom St Denis 2016-10-26   727  #define mmCRTC3_CRTC_ALLOW_STOP_OFF_V_CNT 0x44C3
de2bdb3dcf92280 Tom St Denis 2016-10-26   728  #define mmCRTC3_CRTC_BLACK_COLOR 0x44A2
de2bdb3dcf92280 Tom St Denis 2016-10-26   729  #define mmCRTC3_CRTC_BLANK_CONTROL 0x449D
de2bdb3dcf92280 Tom St Denis 2016-10-26   730  #define mmCRTC3_CRTC_BLANK_DATA_COLOR 0x44A1
de2bdb3dcf92280 Tom St Denis 2016-10-26   731  #define mmCRTC3_CRTC_CONTROL 0x449C
de2bdb3dcf92280 Tom St Denis 2016-10-26   732  #define mmCRTC3_CRTC_COUNT_CONTROL 0x44A9
de2bdb3dcf92280 Tom St Denis 2016-10-26   733  #define mmCRTC3_CRTC_COUNT_RESET 0x44AA
de2bdb3dcf92280 Tom St Denis 2016-10-26   734  #define mmCRTC3_CRTC_DCFE_CLOCK_CONTROL 0x447C
de2bdb3dcf92280 Tom St Denis 2016-10-26   735  #define mmCRTC3_CRTC_DOUBLE_BUFFER_CONTROL 0x44B6
de2bdb3dcf92280 Tom St Denis 2016-10-26   736  #define mmCRTC3_CRTC_DTMTEST_CNTL 0x4492
de2bdb3dcf92280 Tom St Denis 2016-10-26   737  #define mmCRTC3_CRTC_DTMTEST_STATUS_POSITION 0x4493
de2bdb3dcf92280 Tom St Denis 2016-10-26   738  #define mmCRTC3_CRTC_FLOW_CONTROL 0x4499
de2bdb3dcf92280 Tom St Denis 2016-10-26   739  #define mmCRTC3_CRTC_FORCE_COUNT_NOW_CNTL 0x4498
de2bdb3dcf92280 Tom St Denis 2016-10-26   740  #define mmCRTC3_CRTC_GSL_CONTROL 0x447B
de2bdb3dcf92280 Tom St Denis 2016-10-26   741  #define mmCRTC3_CRTC_GSL_VSYNC_GAP 0x4479
de2bdb3dcf92280 Tom St Denis 2016-10-26   742  #define mmCRTC3_CRTC_GSL_WINDOW 0x447A
de2bdb3dcf92280 Tom St Denis 2016-10-26   743  #define mmCRTC3_CRTC_H_BLANK_EARLY_NUM 0x447D
de2bdb3dcf92280 Tom St Denis 2016-10-26   744  #define mmCRTC3_CRTC_H_BLANK_START_END 0x4481
de2bdb3dcf92280 Tom St Denis 2016-10-26   745  #define mmCRTC3_CRTC_H_SYNC_A 0x4482
de2bdb3dcf92280 Tom St Denis 2016-10-26   746  #define mmCRTC3_CRTC_H_SYNC_A_CNTL 0x4483
de2bdb3dcf92280 Tom St Denis 2016-10-26   747  #define mmCRTC3_CRTC_H_SYNC_B 0x4484
de2bdb3dcf92280 Tom St Denis 2016-10-26   748  #define mmCRTC3_CRTC_H_SYNC_B_CNTL 0x4485
de2bdb3dcf92280 Tom St Denis 2016-10-26   749  #define mmCRTC3_CRTC_H_TOTAL 0x4480
de2bdb3dcf92280 Tom St Denis 2016-10-26   750  #define mmCRTC3_CRTC_INTERLACE_CONTROL 0x449E
de2bdb3dcf92280 Tom St Denis 2016-10-26   751  #define mmCRTC3_CRTC_INTERLACE_STATUS 0x449F
de2bdb3dcf92280 Tom St Denis 2016-10-26   752  #define mmCRTC3_CRTC_INTERRUPT_CONTROL 0x44B4
de2bdb3dcf92280 Tom St Denis 2016-10-26   753  #define mmCRTC3_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x44AB
de2bdb3dcf92280 Tom St Denis 2016-10-26   754  #define mmCRTC3_CRTC_MASTER_EN 0x44C2
de2bdb3dcf92280 Tom St Denis 2016-10-26   755  #define mmCRTC3_CRTC_MVP_INBAND_CNTL_INSERT 0x44BF
de2bdb3dcf92280 Tom St Denis 2016-10-26   756  #define mmCRTC3_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x44C0
de2bdb3dcf92280 Tom St Denis 2016-10-26   757  #define mmCRTC3_CRTC_MVP_STATUS 0x44C1
de2bdb3dcf92280 Tom St Denis 2016-10-26   758  #define mmCRTC3_CRTC_NOM_VERT_POSITION 0x44A5
de2bdb3dcf92280 Tom St Denis 2016-10-26   759  #define mmCRTC3_CRTC_OVERSCAN_COLOR 0x44A0
de2bdb3dcf92280 Tom St Denis 2016-10-26   760  #define mmCRTC3_CRTC_SNAPSHOT_CONTROL 0x44B0
de2bdb3dcf92280 Tom St Denis 2016-10-26   761  #define mmCRTC3_CRTC_SNAPSHOT_FRAME 0x44B2
de2bdb3dcf92280 Tom St Denis 2016-10-26   762  #define mmCRTC3_CRTC_SNAPSHOT_POSITION 0x44B1
de2bdb3dcf92280 Tom St Denis 2016-10-26   763  #define mmCRTC3_CRTC_SNAPSHOT_STATUS 0x44AF
de2bdb3dcf92280 Tom St Denis 2016-10-26   764  #define mmCRTC3_CRTC_START_LINE_CONTROL 0x44B3
de2bdb3dcf92280 Tom St Denis 2016-10-26   765  #define mmCRTC3_CRTC_STATUS 0x44A3
de2bdb3dcf92280 Tom St Denis 2016-10-26   766  #define mmCRTC3_CRTC_STATUS_FRAME_COUNT 0x44A6
de2bdb3dcf92280 Tom St Denis 2016-10-26   767  #define mmCRTC3_CRTC_STATUS_HV_COUNT 0x44A8
de2bdb3dcf92280 Tom St Denis 2016-10-26   768  #define mmCRTC3_CRTC_STATUS_POSITION 0x44A4
de2bdb3dcf92280 Tom St Denis 2016-10-26   769  #define mmCRTC3_CRTC_STATUS_VF_COUNT 0x44A7
de2bdb3dcf92280 Tom St Denis 2016-10-26   770  #define mmCRTC3_CRTC_STEREO_CONTROL 0x44AE
de2bdb3dcf92280 Tom St Denis 2016-10-26   771  #define mmCRTC3_CRTC_STEREO_FORCE_NEXT_EYE 0x449B
de2bdb3dcf92280 Tom St Denis 2016-10-26   772  #define mmCRTC3_CRTC_STEREO_STATUS 0x44AD
de2bdb3dcf92280 Tom St Denis 2016-10-26   773  #define mmCRTC3_CRTC_TEST_DEBUG_DATA 0x44C7
de2bdb3dcf92280 Tom St Denis 2016-10-26   774  #define mmCRTC3_CRTC_TEST_DEBUG_INDEX 0x44C6
de2bdb3dcf92280 Tom St Denis 2016-10-26   775  #define mmCRTC3_CRTC_TEST_PATTERN_COLOR 0x44BC
de2bdb3dcf92280 Tom St Denis 2016-10-26   776  #define mmCRTC3_CRTC_TEST_PATTERN_CONTROL 0x44BA
de2bdb3dcf92280 Tom St Denis 2016-10-26   777  #define mmCRTC3_CRTC_TEST_PATTERN_PARAMETERS 0x44BB
de2bdb3dcf92280 Tom St Denis 2016-10-26   778  #define mmCRTC3_CRTC_TRIGA_CNTL 0x4494
de2bdb3dcf92280 Tom St Denis 2016-10-26   779  #define mmCRTC3_CRTC_TRIGA_MANUAL_TRIG 0x4495
de2bdb3dcf92280 Tom St Denis 2016-10-26   780  #define mmCRTC3_CRTC_TRIGB_CNTL 0x4496
de2bdb3dcf92280 Tom St Denis 2016-10-26   781  #define mmCRTC3_CRTC_TRIGB_MANUAL_TRIG 0x4497
de2bdb3dcf92280 Tom St Denis 2016-10-26   782  #define mmCRTC3_CRTC_UPDATE_LOCK 0x44B5
de2bdb3dcf92280 Tom St Denis 2016-10-26   783  #define mmCRTC3_CRTC_VBI_END 0x4486
de2bdb3dcf92280 Tom St Denis 2016-10-26   784  #define mmCRTC3_CRTC_V_BLANK_START_END 0x448D
de2bdb3dcf92280 Tom St Denis 2016-10-26   785  #define mmCRTC3_CRTC_VERT_SYNC_CONTROL 0x44AC
de2bdb3dcf92280 Tom St Denis 2016-10-26   786  #define mmCRTC3_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x44B7
de2bdb3dcf92280 Tom St Denis 2016-10-26   787  #define mmCRTC3_CRTC_V_SYNC_A 0x448E
de2bdb3dcf92280 Tom St Denis 2016-10-26   788  #define mmCRTC3_CRTC_V_SYNC_A_CNTL 0x448F
de2bdb3dcf92280 Tom St Denis 2016-10-26   789  #define mmCRTC3_CRTC_V_SYNC_B 0x4490
de2bdb3dcf92280 Tom St Denis 2016-10-26   790  #define mmCRTC3_CRTC_V_SYNC_B_CNTL 0x4491
de2bdb3dcf92280 Tom St Denis 2016-10-26   791  #define mmCRTC3_CRTC_VSYNC_NOM_INT_STATUS 0x448C
de2bdb3dcf92280 Tom St Denis 2016-10-26   792  #define mmCRTC3_CRTC_V_TOTAL 0x4487
de2bdb3dcf92280 Tom St Denis 2016-10-26   793  #define mmCRTC3_CRTC_V_TOTAL_CONTROL 0x448A
de2bdb3dcf92280 Tom St Denis 2016-10-26   794  #define mmCRTC3_CRTC_V_TOTAL_INT_STATUS 0x448B
de2bdb3dcf92280 Tom St Denis 2016-10-26   795  #define mmCRTC3_CRTC_V_TOTAL_MAX 0x4489
de2bdb3dcf92280 Tom St Denis 2016-10-26   796  #define mmCRTC3_CRTC_V_TOTAL_MIN 0x4488
de2bdb3dcf92280 Tom St Denis 2016-10-26   797  #define mmCRTC3_CRTC_V_UPDATE_INT_STATUS 0x44C4
de2bdb3dcf92280 Tom St Denis 2016-10-26   798  #define mmCRTC3_DCFE_DBG_SEL 0x447E
de2bdb3dcf92280 Tom St Denis 2016-10-26   799  #define mmCRTC3_DCFE_MEM_LIGHT_SLEEP_CNTL 0x447F
de2bdb3dcf92280 Tom St Denis 2016-10-26   800  #define mmCRTC_3D_STRUCTURE_CONTROL 0x1B78
de2bdb3dcf92280 Tom St Denis 2016-10-26   801  #define mmCRTC3_MASTER_UPDATE_LOCK 0x44BD
de2bdb3dcf92280 Tom St Denis 2016-10-26   802  #define mmCRTC3_MASTER_UPDATE_MODE 0x44BE
de2bdb3dcf92280 Tom St Denis 2016-10-26   803  #define mmCRTC3_PIXEL_RATE_CNTL 0x014C
de2bdb3dcf92280 Tom St Denis 2016-10-26   804  #define mmCRTC4_CRTC_3D_STRUCTURE_CONTROL 0x4778
de2bdb3dcf92280 Tom St Denis 2016-10-26   805  #define mmCRTC4_CRTC_ALLOW_STOP_OFF_V_CNT 0x47C3
de2bdb3dcf92280 Tom St Denis 2016-10-26   806  #define mmCRTC4_CRTC_BLACK_COLOR 0x47A2
de2bdb3dcf92280 Tom St Denis 2016-10-26   807  #define mmCRTC4_CRTC_BLANK_CONTROL 0x479D
de2bdb3dcf92280 Tom St Denis 2016-10-26   808  #define mmCRTC4_CRTC_BLANK_DATA_COLOR 0x47A1
de2bdb3dcf92280 Tom St Denis 2016-10-26   809  #define mmCRTC4_CRTC_CONTROL 0x479C
de2bdb3dcf92280 Tom St Denis 2016-10-26   810  #define mmCRTC4_CRTC_COUNT_CONTROL 0x47A9
de2bdb3dcf92280 Tom St Denis 2016-10-26   811  #define mmCRTC4_CRTC_COUNT_RESET 0x47AA
de2bdb3dcf92280 Tom St Denis 2016-10-26   812  #define mmCRTC4_CRTC_DCFE_CLOCK_CONTROL 0x477C
de2bdb3dcf92280 Tom St Denis 2016-10-26   813  #define mmCRTC4_CRTC_DOUBLE_BUFFER_CONTROL 0x47B6
de2bdb3dcf92280 Tom St Denis 2016-10-26   814  #define mmCRTC4_CRTC_DTMTEST_CNTL 0x4792
de2bdb3dcf92280 Tom St Denis 2016-10-26   815  #define mmCRTC4_CRTC_DTMTEST_STATUS_POSITION 0x4793
de2bdb3dcf92280 Tom St Denis 2016-10-26   816  #define mmCRTC4_CRTC_FLOW_CONTROL 0x4799
de2bdb3dcf92280 Tom St Denis 2016-10-26   817  #define mmCRTC4_CRTC_FORCE_COUNT_NOW_CNTL 0x4798
de2bdb3dcf92280 Tom St Denis 2016-10-26   818  #define mmCRTC4_CRTC_GSL_CONTROL 0x477B
de2bdb3dcf92280 Tom St Denis 2016-10-26   819  #define mmCRTC4_CRTC_GSL_VSYNC_GAP 0x4779
de2bdb3dcf92280 Tom St Denis 2016-10-26   820  #define mmCRTC4_CRTC_GSL_WINDOW 0x477A
de2bdb3dcf92280 Tom St Denis 2016-10-26   821  #define mmCRTC4_CRTC_H_BLANK_EARLY_NUM 0x477D
de2bdb3dcf92280 Tom St Denis 2016-10-26   822  #define mmCRTC4_CRTC_H_BLANK_START_END 0x4781
de2bdb3dcf92280 Tom St Denis 2016-10-26   823  #define mmCRTC4_CRTC_H_SYNC_A 0x4782
de2bdb3dcf92280 Tom St Denis 2016-10-26   824  #define mmCRTC4_CRTC_H_SYNC_A_CNTL 0x4783
de2bdb3dcf92280 Tom St Denis 2016-10-26   825  #define mmCRTC4_CRTC_H_SYNC_B 0x4784
de2bdb3dcf92280 Tom St Denis 2016-10-26   826  #define mmCRTC4_CRTC_H_SYNC_B_CNTL 0x4785
de2bdb3dcf92280 Tom St Denis 2016-10-26   827  #define mmCRTC4_CRTC_H_TOTAL 0x4780
de2bdb3dcf92280 Tom St Denis 2016-10-26   828  #define mmCRTC4_CRTC_INTERLACE_CONTROL 0x479E
de2bdb3dcf92280 Tom St Denis 2016-10-26   829  #define mmCRTC4_CRTC_INTERLACE_STATUS 0x479F
de2bdb3dcf92280 Tom St Denis 2016-10-26   830  #define mmCRTC4_CRTC_INTERRUPT_CONTROL 0x47B4
de2bdb3dcf92280 Tom St Denis 2016-10-26   831  #define mmCRTC4_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x47AB
de2bdb3dcf92280 Tom St Denis 2016-10-26   832  #define mmCRTC4_CRTC_MASTER_EN 0x47C2
de2bdb3dcf92280 Tom St Denis 2016-10-26   833  #define mmCRTC4_CRTC_MVP_INBAND_CNTL_INSERT 0x47BF
de2bdb3dcf92280 Tom St Denis 2016-10-26   834  #define mmCRTC4_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x47C0
de2bdb3dcf92280 Tom St Denis 2016-10-26   835  #define mmCRTC4_CRTC_MVP_STATUS 0x47C1
de2bdb3dcf92280 Tom St Denis 2016-10-26   836  #define mmCRTC4_CRTC_NOM_VERT_POSITION 0x47A5
de2bdb3dcf92280 Tom St Denis 2016-10-26   837  #define mmCRTC4_CRTC_OVERSCAN_COLOR 0x47A0
de2bdb3dcf92280 Tom St Denis 2016-10-26   838  #define mmCRTC4_CRTC_SNAPSHOT_CONTROL 0x47B0
de2bdb3dcf92280 Tom St Denis 2016-10-26   839  #define mmCRTC4_CRTC_SNAPSHOT_FRAME 0x47B2
de2bdb3dcf92280 Tom St Denis 2016-10-26   840  #define mmCRTC4_CRTC_SNAPSHOT_POSITION 0x47B1
de2bdb3dcf92280 Tom St Denis 2016-10-26   841  #define mmCRTC4_CRTC_SNAPSHOT_STATUS 0x47AF
de2bdb3dcf92280 Tom St Denis 2016-10-26   842  #define mmCRTC4_CRTC_START_LINE_CONTROL 0x47B3
de2bdb3dcf92280 Tom St Denis 2016-10-26   843  #define mmCRTC4_CRTC_STATUS 0x47A3
de2bdb3dcf92280 Tom St Denis 2016-10-26   844  #define mmCRTC4_CRTC_STATUS_FRAME_COUNT 0x47A6
de2bdb3dcf92280 Tom St Denis 2016-10-26   845  #define mmCRTC4_CRTC_STATUS_HV_COUNT 0x47A8
de2bdb3dcf92280 Tom St Denis 2016-10-26   846  #define mmCRTC4_CRTC_STATUS_POSITION 0x47A4
de2bdb3dcf92280 Tom St Denis 2016-10-26   847  #define mmCRTC4_CRTC_STATUS_VF_COUNT 0x47A7
de2bdb3dcf92280 Tom St Denis 2016-10-26   848  #define mmCRTC4_CRTC_STEREO_CONTROL 0x47AE
de2bdb3dcf92280 Tom St Denis 2016-10-26   849  #define mmCRTC4_CRTC_STEREO_FORCE_NEXT_EYE 0x479B
de2bdb3dcf92280 Tom St Denis 2016-10-26   850  #define mmCRTC4_CRTC_STEREO_STATUS 0x47AD
de2bdb3dcf92280 Tom St Denis 2016-10-26   851  #define mmCRTC4_CRTC_TEST_DEBUG_DATA 0x47C7
de2bdb3dcf92280 Tom St Denis 2016-10-26   852  #define mmCRTC4_CRTC_TEST_DEBUG_INDEX 0x47C6
de2bdb3dcf92280 Tom St Denis 2016-10-26   853  #define mmCRTC4_CRTC_TEST_PATTERN_COLOR 0x47BC
de2bdb3dcf92280 Tom St Denis 2016-10-26   854  #define mmCRTC4_CRTC_TEST_PATTERN_CONTROL 0x47BA
de2bdb3dcf92280 Tom St Denis 2016-10-26   855  #define mmCRTC4_CRTC_TEST_PATTERN_PARAMETERS 0x47BB
de2bdb3dcf92280 Tom St Denis 2016-10-26   856  #define mmCRTC4_CRTC_TRIGA_CNTL 0x4794
de2bdb3dcf92280 Tom St Denis 2016-10-26   857  #define mmCRTC4_CRTC_TRIGA_MANUAL_TRIG 0x4795
de2bdb3dcf92280 Tom St Denis 2016-10-26   858  #define mmCRTC4_CRTC_TRIGB_CNTL 0x4796
de2bdb3dcf92280 Tom St Denis 2016-10-26   859  #define mmCRTC4_CRTC_TRIGB_MANUAL_TRIG 0x4797
de2bdb3dcf92280 Tom St Denis 2016-10-26   860  #define mmCRTC4_CRTC_UPDATE_LOCK 0x47B5
de2bdb3dcf92280 Tom St Denis 2016-10-26   861  #define mmCRTC4_CRTC_VBI_END 0x4786
de2bdb3dcf92280 Tom St Denis 2016-10-26   862  #define mmCRTC4_CRTC_V_BLANK_START_END 0x478D
de2bdb3dcf92280 Tom St Denis 2016-10-26   863  #define mmCRTC4_CRTC_VERT_SYNC_CONTROL 0x47AC
de2bdb3dcf92280 Tom St Denis 2016-10-26   864  #define mmCRTC4_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x47B7
de2bdb3dcf92280 Tom St Denis 2016-10-26   865  #define mmCRTC4_CRTC_V_SYNC_A 0x478E
de2bdb3dcf92280 Tom St Denis 2016-10-26   866  #define mmCRTC4_CRTC_V_SYNC_A_CNTL 0x478F
de2bdb3dcf92280 Tom St Denis 2016-10-26   867  #define mmCRTC4_CRTC_V_SYNC_B 0x4790
de2bdb3dcf92280 Tom St Denis 2016-10-26   868  #define mmCRTC4_CRTC_V_SYNC_B_CNTL 0x4791
de2bdb3dcf92280 Tom St Denis 2016-10-26   869  #define mmCRTC4_CRTC_VSYNC_NOM_INT_STATUS 0x478C
de2bdb3dcf92280 Tom St Denis 2016-10-26   870  #define mmCRTC4_CRTC_V_TOTAL 0x4787
de2bdb3dcf92280 Tom St Denis 2016-10-26   871  #define mmCRTC4_CRTC_V_TOTAL_CONTROL 0x478A
de2bdb3dcf92280 Tom St Denis 2016-10-26   872  #define mmCRTC4_CRTC_V_TOTAL_INT_STATUS 0x478B
de2bdb3dcf92280 Tom St Denis 2016-10-26   873  #define mmCRTC4_CRTC_V_TOTAL_MAX 0x4789
de2bdb3dcf92280 Tom St Denis 2016-10-26   874  #define mmCRTC4_CRTC_V_TOTAL_MIN 0x4788
de2bdb3dcf92280 Tom St Denis 2016-10-26   875  #define mmCRTC4_CRTC_V_UPDATE_INT_STATUS 0x47C4
de2bdb3dcf92280 Tom St Denis 2016-10-26   876  #define mmCRTC4_DCFE_DBG_SEL 0x477E
de2bdb3dcf92280 Tom St Denis 2016-10-26   877  #define mmCRTC4_DCFE_MEM_LIGHT_SLEEP_CNTL 0x477F
de2bdb3dcf92280 Tom St Denis 2016-10-26   878  #define mmCRTC4_MASTER_UPDATE_LOCK 0x47BD
de2bdb3dcf92280 Tom St Denis 2016-10-26   879  #define mmCRTC4_MASTER_UPDATE_MODE 0x47BE
de2bdb3dcf92280 Tom St Denis 2016-10-26   880  #define mmCRTC4_PIXEL_RATE_CNTL 0x0150
de2bdb3dcf92280 Tom St Denis 2016-10-26   881  #define mmCRTC5_CRTC_3D_STRUCTURE_CONTROL 0x4A78
de2bdb3dcf92280 Tom St Denis 2016-10-26   882  #define mmCRTC5_CRTC_ALLOW_STOP_OFF_V_CNT 0x4AC3
de2bdb3dcf92280 Tom St Denis 2016-10-26   883  #define mmCRTC5_CRTC_BLACK_COLOR 0x4AA2
de2bdb3dcf92280 Tom St Denis 2016-10-26   884  #define mmCRTC5_CRTC_BLANK_CONTROL 0x4A9D
de2bdb3dcf92280 Tom St Denis 2016-10-26   885  #define mmCRTC5_CRTC_BLANK_DATA_COLOR 0x4AA1
de2bdb3dcf92280 Tom St Denis 2016-10-26   886  #define mmCRTC5_CRTC_CONTROL 0x4A9C
de2bdb3dcf92280 Tom St Denis 2016-10-26   887  #define mmCRTC5_CRTC_COUNT_CONTROL 0x4AA9
de2bdb3dcf92280 Tom St Denis 2016-10-26   888  #define mmCRTC5_CRTC_COUNT_RESET 0x4AAA
de2bdb3dcf92280 Tom St Denis 2016-10-26   889  #define mmCRTC5_CRTC_DCFE_CLOCK_CONTROL 0x4A7C
de2bdb3dcf92280 Tom St Denis 2016-10-26   890  #define mmCRTC5_CRTC_DOUBLE_BUFFER_CONTROL 0x4AB6
de2bdb3dcf92280 Tom St Denis 2016-10-26   891  #define mmCRTC5_CRTC_DTMTEST_CNTL 0x4A92
de2bdb3dcf92280 Tom St Denis 2016-10-26   892  #define mmCRTC5_CRTC_DTMTEST_STATUS_POSITION 0x4A93
de2bdb3dcf92280 Tom St Denis 2016-10-26   893  #define mmCRTC5_CRTC_FLOW_CONTROL 0x4A99
de2bdb3dcf92280 Tom St Denis 2016-10-26   894  #define mmCRTC5_CRTC_FORCE_COUNT_NOW_CNTL 0x4A98
de2bdb3dcf92280 Tom St Denis 2016-10-26   895  #define mmCRTC5_CRTC_GSL_CONTROL 0x4A7B
de2bdb3dcf92280 Tom St Denis 2016-10-26   896  #define mmCRTC5_CRTC_GSL_VSYNC_GAP 0x4A79
de2bdb3dcf92280 Tom St Denis 2016-10-26   897  #define mmCRTC5_CRTC_GSL_WINDOW 0x4A7A
de2bdb3dcf92280 Tom St Denis 2016-10-26   898  #define mmCRTC5_CRTC_H_BLANK_EARLY_NUM 0x4A7D
de2bdb3dcf92280 Tom St Denis 2016-10-26   899  #define mmCRTC5_CRTC_H_BLANK_START_END 0x4A81
de2bdb3dcf92280 Tom St Denis 2016-10-26   900  #define mmCRTC5_CRTC_H_SYNC_A 0x4A82
de2bdb3dcf92280 Tom St Denis 2016-10-26   901  #define mmCRTC5_CRTC_H_SYNC_A_CNTL 0x4A83
de2bdb3dcf92280 Tom St Denis 2016-10-26   902  #define mmCRTC5_CRTC_H_SYNC_B 0x4A84
de2bdb3dcf92280 Tom St Denis 2016-10-26   903  #define mmCRTC5_CRTC_H_SYNC_B_CNTL 0x4A85
de2bdb3dcf92280 Tom St Denis 2016-10-26   904  #define mmCRTC5_CRTC_H_TOTAL 0x4A80
de2bdb3dcf92280 Tom St Denis 2016-10-26   905  #define mmCRTC5_CRTC_INTERLACE_CONTROL 0x4A9E
de2bdb3dcf92280 Tom St Denis 2016-10-26   906  #define mmCRTC5_CRTC_INTERLACE_STATUS 0x4A9F
de2bdb3dcf92280 Tom St Denis 2016-10-26   907  #define mmCRTC5_CRTC_INTERRUPT_CONTROL 0x4AB4
de2bdb3dcf92280 Tom St Denis 2016-10-26   908  #define mmCRTC5_CRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x4AAB
de2bdb3dcf92280 Tom St Denis 2016-10-26   909  #define mmCRTC5_CRTC_MASTER_EN 0x4AC2
de2bdb3dcf92280 Tom St Denis 2016-10-26   910  #define mmCRTC5_CRTC_MVP_INBAND_CNTL_INSERT 0x4ABF
de2bdb3dcf92280 Tom St Denis 2016-10-26   911  #define mmCRTC5_CRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x4AC0
de2bdb3dcf92280 Tom St Denis 2016-10-26   912  #define mmCRTC5_CRTC_MVP_STATUS 0x4AC1
de2bdb3dcf92280 Tom St Denis 2016-10-26   913  #define mmCRTC5_CRTC_NOM_VERT_POSITION 0x4AA5
de2bdb3dcf92280 Tom St Denis 2016-10-26   914  #define mmCRTC5_CRTC_OVERSCAN_COLOR 0x4AA0
de2bdb3dcf92280 Tom St Denis 2016-10-26   915  #define mmCRTC5_CRTC_SNAPSHOT_CONTROL 0x4AB0
de2bdb3dcf92280 Tom St Denis 2016-10-26   916  #define mmCRTC5_CRTC_SNAPSHOT_FRAME 0x4AB2
de2bdb3dcf92280 Tom St Denis 2016-10-26   917  #define mmCRTC5_CRTC_SNAPSHOT_POSITION 0x4AB1
de2bdb3dcf92280 Tom St Denis 2016-10-26   918  #define mmCRTC5_CRTC_SNAPSHOT_STATUS 0x4AAF
de2bdb3dcf92280 Tom St Denis 2016-10-26   919  #define mmCRTC5_CRTC_START_LINE_CONTROL 0x4AB3
de2bdb3dcf92280 Tom St Denis 2016-10-26   920  #define mmCRTC5_CRTC_STATUS 0x4AA3
de2bdb3dcf92280 Tom St Denis 2016-10-26   921  #define mmCRTC5_CRTC_STATUS_FRAME_COUNT 0x4AA6
de2bdb3dcf92280 Tom St Denis 2016-10-26   922  #define mmCRTC5_CRTC_STATUS_HV_COUNT 0x4AA8
de2bdb3dcf92280 Tom St Denis 2016-10-26   923  #define mmCRTC5_CRTC_STATUS_POSITION 0x4AA4
de2bdb3dcf92280 Tom St Denis 2016-10-26   924  #define mmCRTC5_CRTC_STATUS_VF_COUNT 0x4AA7
de2bdb3dcf92280 Tom St Denis 2016-10-26   925  #define mmCRTC5_CRTC_STEREO_CONTROL 0x4AAE
de2bdb3dcf92280 Tom St Denis 2016-10-26   926  #define mmCRTC5_CRTC_STEREO_FORCE_NEXT_EYE 0x4A9B
de2bdb3dcf92280 Tom St Denis 2016-10-26   927  #define mmCRTC5_CRTC_STEREO_STATUS 0x4AAD
de2bdb3dcf92280 Tom St Denis 2016-10-26   928  #define mmCRTC5_CRTC_TEST_DEBUG_DATA 0x4AC7
de2bdb3dcf92280 Tom St Denis 2016-10-26   929  #define mmCRTC5_CRTC_TEST_DEBUG_INDEX 0x4AC6
de2bdb3dcf92280 Tom St Denis 2016-10-26   930  #define mmCRTC5_CRTC_TEST_PATTERN_COLOR 0x4ABC
de2bdb3dcf92280 Tom St Denis 2016-10-26   931  #define mmCRTC5_CRTC_TEST_PATTERN_CONTROL 0x4ABA
de2bdb3dcf92280 Tom St Denis 2016-10-26   932  #define mmCRTC5_CRTC_TEST_PATTERN_PARAMETERS 0x4ABB
de2bdb3dcf92280 Tom St Denis 2016-10-26   933  #define mmCRTC5_CRTC_TRIGA_CNTL 0x4A94
de2bdb3dcf92280 Tom St Denis 2016-10-26   934  #define mmCRTC5_CRTC_TRIGA_MANUAL_TRIG 0x4A95
de2bdb3dcf92280 Tom St Denis 2016-10-26   935  #define mmCRTC5_CRTC_TRIGB_CNTL 0x4A96
de2bdb3dcf92280 Tom St Denis 2016-10-26   936  #define mmCRTC5_CRTC_TRIGB_MANUAL_TRIG 0x4A97
de2bdb3dcf92280 Tom St Denis 2016-10-26   937  #define mmCRTC5_CRTC_UPDATE_LOCK 0x4AB5
de2bdb3dcf92280 Tom St Denis 2016-10-26   938  #define mmCRTC5_CRTC_VBI_END 0x4A86
de2bdb3dcf92280 Tom St Denis 2016-10-26   939  #define mmCRTC5_CRTC_V_BLANK_START_END 0x4A8D
de2bdb3dcf92280 Tom St Denis 2016-10-26   940  #define mmCRTC5_CRTC_VERT_SYNC_CONTROL 0x4AAC
de2bdb3dcf92280 Tom St Denis 2016-10-26   941  #define mmCRTC5_CRTC_VGA_PARAMETER_CAPTURE_MODE 0x4AB7
de2bdb3dcf92280 Tom St Denis 2016-10-26   942  #define mmCRTC5_CRTC_V_SYNC_A 0x4A8E
de2bdb3dcf92280 Tom St Denis 2016-10-26   943  #define mmCRTC5_CRTC_V_SYNC_A_CNTL 0x4A8F
de2bdb3dcf92280 Tom St Denis 2016-10-26   944  #define mmCRTC5_CRTC_V_SYNC_B 0x4A90
de2bdb3dcf92280 Tom St Denis 2016-10-26   945  #define mmCRTC5_CRTC_V_SYNC_B_CNTL 0x4A91
de2bdb3dcf92280 Tom St Denis 2016-10-26   946  #define mmCRTC5_CRTC_VSYNC_NOM_INT_STATUS 0x4A8C
de2bdb3dcf92280 Tom St Denis 2016-10-26   947  #define mmCRTC5_CRTC_V_TOTAL 0x4A87
de2bdb3dcf92280 Tom St Denis 2016-10-26   948  #define mmCRTC5_CRTC_V_TOTAL_CONTROL 0x4A8A
de2bdb3dcf92280 Tom St Denis 2016-10-26   949  #define mmCRTC5_CRTC_V_TOTAL_INT_STATUS 0x4A8B
de2bdb3dcf92280 Tom St Denis 2016-10-26   950  #define mmCRTC5_CRTC_V_TOTAL_MAX 0x4A89
de2bdb3dcf92280 Tom St Denis 2016-10-26   951  #define mmCRTC5_CRTC_V_TOTAL_MIN 0x4A88
de2bdb3dcf92280 Tom St Denis 2016-10-26   952  #define mmCRTC5_CRTC_V_UPDATE_INT_STATUS 0x4AC4
de2bdb3dcf92280 Tom St Denis 2016-10-26   953  #define mmCRTC5_DCFE_DBG_SEL 0x4A7E
de2bdb3dcf92280 Tom St Denis 2016-10-26   954  #define mmCRTC5_DCFE_MEM_LIGHT_SLEEP_CNTL 0x4A7F
de2bdb3dcf92280 Tom St Denis 2016-10-26   955  #define mmCRTC5_MASTER_UPDATE_LOCK 0x4ABD
de2bdb3dcf92280 Tom St Denis 2016-10-26   956  #define mmCRTC5_MASTER_UPDATE_MODE 0x4ABE
de2bdb3dcf92280 Tom St Denis 2016-10-26   957  #define mmCRTC5_PIXEL_RATE_CNTL 0x0154
de2bdb3dcf92280 Tom St Denis 2016-10-26   958  #define mmCRTC8_DATA 0x00ED
de2bdb3dcf92280 Tom St Denis 2016-10-26   959  #define mmCRTC8_IDX 0x00ED
de2bdb3dcf92280 Tom St Denis 2016-10-26   960  #define mmCRTC_ALLOW_STOP_OFF_V_CNT 0x1BC3
de2bdb3dcf92280 Tom St Denis 2016-10-26   961  #define mmCRTC_BLACK_COLOR 0x1BA2
de2bdb3dcf92280 Tom St Denis 2016-10-26   962  #define mmCRTC_BLANK_CONTROL 0x1B9D
de2bdb3dcf92280 Tom St Denis 2016-10-26   963  #define mmCRTC_BLANK_DATA_COLOR 0x1BA1
de2bdb3dcf92280 Tom St Denis 2016-10-26   964  #define mmCRTC_CONTROL 0x1B9C
de2bdb3dcf92280 Tom St Denis 2016-10-26   965  #define mmCRTC_COUNT_CONTROL 0x1BA9
de2bdb3dcf92280 Tom St Denis 2016-10-26   966  #define mmCRTC_COUNT_RESET 0x1BAA
de2bdb3dcf92280 Tom St Denis 2016-10-26   967  #define mmCRTC_DCFE_CLOCK_CONTROL 0x1B7C
de2bdb3dcf92280 Tom St Denis 2016-10-26   968  #define mmCRTC_DOUBLE_BUFFER_CONTROL 0x1BB6
de2bdb3dcf92280 Tom St Denis 2016-10-26   969  #define mmCRTC_DTMTEST_CNTL 0x1B92
de2bdb3dcf92280 Tom St Denis 2016-10-26   970  #define mmCRTC_DTMTEST_STATUS_POSITION 0x1B93
de2bdb3dcf92280 Tom St Denis 2016-10-26   971  #define mmCRTC_FLOW_CONTROL 0x1B99
de2bdb3dcf92280 Tom St Denis 2016-10-26   972  #define mmCRTC_FORCE_COUNT_NOW_CNTL 0x1B98
de2bdb3dcf92280 Tom St Denis 2016-10-26   973  #define mmCRTC_GSL_CONTROL 0x1B7B
de2bdb3dcf92280 Tom St Denis 2016-10-26   974  #define mmCRTC_GSL_VSYNC_GAP 0x1B79
de2bdb3dcf92280 Tom St Denis 2016-10-26   975  #define mmCRTC_GSL_WINDOW 0x1B7A
de2bdb3dcf92280 Tom St Denis 2016-10-26   976  #define mmCRTC_H_BLANK_EARLY_NUM 0x1B7D
de2bdb3dcf92280 Tom St Denis 2016-10-26   977  #define mmCRTC_H_BLANK_START_END 0x1B81
de2bdb3dcf92280 Tom St Denis 2016-10-26   978  #define mmCRTC_H_SYNC_A 0x1B82
de2bdb3dcf92280 Tom St Denis 2016-10-26   979  #define mmCRTC_H_SYNC_A_CNTL 0x1B83
de2bdb3dcf92280 Tom St Denis 2016-10-26   980  #define mmCRTC_H_SYNC_B 0x1B84
de2bdb3dcf92280 Tom St Denis 2016-10-26   981  #define mmCRTC_H_SYNC_B_CNTL 0x1B85
de2bdb3dcf92280 Tom St Denis 2016-10-26   982  #define mmCRTC_H_TOTAL 0x1B80
de2bdb3dcf92280 Tom St Denis 2016-10-26   983  #define mmCRTC_INTERLACE_CONTROL 0x1B9E
de2bdb3dcf92280 Tom St Denis 2016-10-26   984  #define mmCRTC_INTERLACE_STATUS 0x1B9F
de2bdb3dcf92280 Tom St Denis 2016-10-26   985  #define mmCRTC_INTERRUPT_CONTROL 0x1BB4
de2bdb3dcf92280 Tom St Denis 2016-10-26   986  #define mmCRTC_MANUAL_FORCE_VSYNC_NEXT_LINE 0x1BAB
de2bdb3dcf92280 Tom St Denis 2016-10-26   987  #define mmCRTC_MASTER_EN 0x1BC2
de2bdb3dcf92280 Tom St Denis 2016-10-26   988  #define mmCRTC_MVP_INBAND_CNTL_INSERT 0x1BBF
de2bdb3dcf92280 Tom St Denis 2016-10-26   989  #define mmCRTC_MVP_INBAND_CNTL_INSERT_TIMER 0x1BC0
de2bdb3dcf92280 Tom St Denis 2016-10-26   990  #define mmCRTC_MVP_STATUS 0x1BC1
de2bdb3dcf92280 Tom St Denis 2016-10-26   991  #define mmCRTC_NOM_VERT_POSITION 0x1BA5
de2bdb3dcf92280 Tom St Denis 2016-10-26   992  #define mmCRTC_OVERSCAN_COLOR 0x1BA0
de2bdb3dcf92280 Tom St Denis 2016-10-26   993  #define mmCRTC_SNAPSHOT_CONTROL 0x1BB0
de2bdb3dcf92280 Tom St Denis 2016-10-26   994  #define mmCRTC_SNAPSHOT_FRAME 0x1BB2
de2bdb3dcf92280 Tom St Denis 2016-10-26   995  #define mmCRTC_SNAPSHOT_POSITION 0x1BB1
de2bdb3dcf92280 Tom St Denis 2016-10-26   996  #define mmCRTC_SNAPSHOT_STATUS 0x1BAF
de2bdb3dcf92280 Tom St Denis 2016-10-26   997  #define mmCRTC_START_LINE_CONTROL 0x1BB3
de2bdb3dcf92280 Tom St Denis 2016-10-26   998  #define mmCRTC_STATUS 0x1BA3
de2bdb3dcf92280 Tom St Denis 2016-10-26   999  #define mmCRTC_STATUS_FRAME_COUNT 0x1BA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1000  #define mmCRTC_STATUS_HV_COUNT 0x1BA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1001  #define mmCRTC_STATUS_POSITION 0x1BA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1002  #define mmCRTC_STATUS_VF_COUNT 0x1BA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1003  #define mmCRTC_STEREO_CONTROL 0x1BAE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1004  #define mmCRTC_STEREO_FORCE_NEXT_EYE 0x1B9B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1005  #define mmCRTC_STEREO_STATUS 0x1BAD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1006  #define mmCRTC_TEST_DEBUG_DATA 0x1BC7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1007  #define mmCRTC_TEST_DEBUG_INDEX 0x1BC6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1008  #define mmCRTC_TEST_PATTERN_COLOR 0x1BBC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1009  #define mmCRTC_TEST_PATTERN_CONTROL 0x1BBA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1010  #define mmCRTC_TEST_PATTERN_PARAMETERS 0x1BBB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1011  #define mmCRTC_TRIGA_CNTL 0x1B94
de2bdb3dcf92280 Tom St Denis 2016-10-26  1012  #define mmCRTC_TRIGA_MANUAL_TRIG 0x1B95
de2bdb3dcf92280 Tom St Denis 2016-10-26  1013  #define mmCRTC_TRIGB_CNTL 0x1B96
de2bdb3dcf92280 Tom St Denis 2016-10-26  1014  #define mmCRTC_TRIGB_MANUAL_TRIG 0x1B97
de2bdb3dcf92280 Tom St Denis 2016-10-26  1015  #define mmCRTC_UPDATE_LOCK 0x1BB5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1016  #define mmCRTC_VBI_END 0x1B86
de2bdb3dcf92280 Tom St Denis 2016-10-26  1017  #define mmCRTC_V_BLANK_START_END 0x1B8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1018  #define mmCRTC_VERT_SYNC_CONTROL 0x1BAC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1019  #define mmCRTC_VGA_PARAMETER_CAPTURE_MODE 0x1BB7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1020  #define mmCRTC_V_SYNC_A 0x1B8E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1021  #define mmCRTC_V_SYNC_A_CNTL 0x1B8F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1022  #define mmCRTC_V_SYNC_B 0x1B90
de2bdb3dcf92280 Tom St Denis 2016-10-26  1023  #define mmCRTC_V_SYNC_B_CNTL 0x1B91
de2bdb3dcf92280 Tom St Denis 2016-10-26  1024  #define mmCRTC_VSYNC_NOM_INT_STATUS 0x1B8C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1025  #define mmCRTC_V_TOTAL 0x1B87
de2bdb3dcf92280 Tom St Denis 2016-10-26  1026  #define mmCRTC_V_TOTAL_CONTROL 0x1B8A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1027  #define mmCRTC_V_TOTAL_INT_STATUS 0x1B8B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1028  #define mmCRTC_V_TOTAL_MAX 0x1B89
de2bdb3dcf92280 Tom St Denis 2016-10-26  1029  #define mmCRTC_V_TOTAL_MIN 0x1B88
de2bdb3dcf92280 Tom St Denis 2016-10-26  1030  #define mmCRTC_V_UPDATE_INT_STATUS 0x1BC4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1031  #define mmCUR_COLOR1 0x1A6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1032  #define mmCUR_COLOR2 0x1A6D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1033  #define mmCUR_CONTROL 0x1A66
de2bdb3dcf92280 Tom St Denis 2016-10-26  1034  #define mmCUR_HOT_SPOT 0x1A6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1035  #define mmCUR_POSITION 0x1A6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1036  #define mmCUR_REQUEST_FILTER_CNTL 0x1A99
de2bdb3dcf92280 Tom St Denis 2016-10-26  1037  #define mmCUR_SIZE 0x1A68
de2bdb3dcf92280 Tom St Denis 2016-10-26  1038  #define mmCUR_SURFACE_ADDRESS 0x1A67
de2bdb3dcf92280 Tom St Denis 2016-10-26  1039  #define mmCUR_SURFACE_ADDRESS_HIGH 0x1A69
de2bdb3dcf92280 Tom St Denis 2016-10-26  1040  #define mmCUR_UPDATE 0x1A6E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1041  #define mmD1VGA_CONTROL 0x00CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1042  #define mmD2VGA_CONTROL 0x00CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1043  #define mmD3VGA_CONTROL 0x00F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1044  #define mmD4VGA_CONTROL 0x00F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1045  #define mmD5VGA_CONTROL 0x00FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1046  #define mmD6VGA_CONTROL 0x00FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1047  #define mmDAC_AUTODETECT_CONTROL 0x19EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1048  #define mmDAC_AUTODETECT_CONTROL2 0x19EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  1049  #define mmDAC_AUTODETECT_CONTROL3 0x19F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1050  #define mmDAC_AUTODETECT_INT_CONTROL 0x19F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1051  #define mmDAC_AUTODETECT_STATUS 0x19F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1052  #define mmDAC_CLK_ENABLE 0x0128
de2bdb3dcf92280 Tom St Denis 2016-10-26  1053  #define mmDAC_COMPARATOR_ENABLE 0x19F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1054  #define mmDAC_COMPARATOR_OUTPUT 0x19F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1055  #define mmDAC_CONTROL 0x19F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1056  #define mmDAC_CRC_CONTROL 0x19E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1057  #define mmDAC_CRC_EN 0x19E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1058  #define mmDAC_CRC_SIG_CONTROL 0x19EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1059  #define mmDAC_CRC_SIG_CONTROL_MASK 0x19E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1060  #define mmDAC_CRC_SIG_RGB 0x19EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1061  #define mmDAC_CRC_SIG_RGB_MASK 0x19E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1062  #define mmDAC_DATA 0x00F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1063  #define mmDAC_DFT_CONFIG 0x19FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1064  #define mmDAC_ENABLE 0x19E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1065  #define mmDAC_FIFO_STATUS 0x19FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1066  #define mmDAC_FORCE_DATA 0x19F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1067  #define mmDAC_FORCE_OUTPUT_CNTL 0x19F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1068  #define mmDAC_MACRO_CNTL_RESERVED0 0x19FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1069  #define mmDAC_MACRO_CNTL_RESERVED1 0x19FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1070  #define mmDAC_MACRO_CNTL_RESERVED2 0x19FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1071  #define mmDAC_MACRO_CNTL_RESERVED3 0x19FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  1072  #define mmDAC_MASK 0x00F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1073  #define mmDAC_POWERDOWN 0x19F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1074  #define mmDAC_PWR_CNTL 0x19F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1075  #define mmDAC_R_INDEX 0x00F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1076  #define mmDAC_SOURCE_SELECT 0x19E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1077  #define mmDAC_STEREOSYNC_SELECT 0x19ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  1078  #define mmDAC_SYNC_TRISTATE_CONTROL 0x19EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1079  #define mmDAC_W_INDEX 0x00F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1080  #define mmDC_ABM1_ACE_CNTL_MISC 0x1641
de2bdb3dcf92280 Tom St Denis 2016-10-26  1081  #define mmDC_ABM1_ACE_OFFSET_SLOPE_0 0x163A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1082  #define mmDC_ABM1_ACE_OFFSET_SLOPE_1 0x163B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1083  #define mmDC_ABM1_ACE_OFFSET_SLOPE_2 0x163C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1084  #define mmDC_ABM1_ACE_OFFSET_SLOPE_3 0x163D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1085  #define mmDC_ABM1_ACE_OFFSET_SLOPE_4 0x163E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1086  #define mmDC_ABM1_ACE_THRES_12 0x163F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1087  #define mmDC_ABM1_ACE_THRES_34 0x1640
de2bdb3dcf92280 Tom St Denis 2016-10-26  1088  #define mmDC_ABM1_BL_MASTER_LOCK 0x169C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1089  #define mmDC_ABM1_CNTL 0x1638
de2bdb3dcf92280 Tom St Denis 2016-10-26  1090  #define mmDC_ABM1_DEBUG_MISC 0x1649
de2bdb3dcf92280 Tom St Denis 2016-10-26  1091  #define mmDC_ABM1_HG_BIN_1_32_SHIFT_FLAG 0x1656
de2bdb3dcf92280 Tom St Denis 2016-10-26  1092  #define mmDC_ABM1_HG_BIN_17_24_SHIFT_INDEX 0x1659
de2bdb3dcf92280 Tom St Denis 2016-10-26  1093  #define mmDC_ABM1_HG_BIN_1_8_SHIFT_INDEX 0x1657
de2bdb3dcf92280 Tom St Denis 2016-10-26  1094  #define mmDC_ABM1_HG_BIN_25_32_SHIFT_INDEX 0x165A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1095  #define mmDC_ABM1_HG_BIN_9_16_SHIFT_INDEX 0x1658
de2bdb3dcf92280 Tom St Denis 2016-10-26  1096  #define mmDC_ABM1_HGLS_REG_READ_PROGRESS 0x164A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1097  #define mmDC_ABM1_HG_MISC_CTRL 0x164B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1098  #define mmDC_ABM1_HG_RESULT_10 0x1664
de2bdb3dcf92280 Tom St Denis 2016-10-26  1099  #define mmDC_ABM1_HG_RESULT_1 0x165B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1100  #define mmDC_ABM1_HG_RESULT_11 0x1665
de2bdb3dcf92280 Tom St Denis 2016-10-26  1101  #define mmDC_ABM1_HG_RESULT_12 0x1666
de2bdb3dcf92280 Tom St Denis 2016-10-26  1102  #define mmDC_ABM1_HG_RESULT_13 0x1667
de2bdb3dcf92280 Tom St Denis 2016-10-26  1103  #define mmDC_ABM1_HG_RESULT_14 0x1668
de2bdb3dcf92280 Tom St Denis 2016-10-26  1104  #define mmDC_ABM1_HG_RESULT_15 0x1669
de2bdb3dcf92280 Tom St Denis 2016-10-26  1105  #define mmDC_ABM1_HG_RESULT_16 0x166A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1106  #define mmDC_ABM1_HG_RESULT_17 0x166B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1107  #define mmDC_ABM1_HG_RESULT_18 0x166C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1108  #define mmDC_ABM1_HG_RESULT_19 0x166D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1109  #define mmDC_ABM1_HG_RESULT_20 0x166E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1110  #define mmDC_ABM1_HG_RESULT_2 0x165C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1111  #define mmDC_ABM1_HG_RESULT_21 0x166F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1112  #define mmDC_ABM1_HG_RESULT_22 0x1670
de2bdb3dcf92280 Tom St Denis 2016-10-26  1113  #define mmDC_ABM1_HG_RESULT_23 0x1671
de2bdb3dcf92280 Tom St Denis 2016-10-26  1114  #define mmDC_ABM1_HG_RESULT_24 0x1672
de2bdb3dcf92280 Tom St Denis 2016-10-26  1115  #define mmDC_ABM1_HG_RESULT_3 0x165D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1116  #define mmDC_ABM1_HG_RESULT_4 0x165E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1117  #define mmDC_ABM1_HG_RESULT_5 0x165F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1118  #define mmDC_ABM1_HG_RESULT_6 0x1660
de2bdb3dcf92280 Tom St Denis 2016-10-26  1119  #define mmDC_ABM1_HG_RESULT_7 0x1661
de2bdb3dcf92280 Tom St Denis 2016-10-26  1120  #define mmDC_ABM1_HG_RESULT_8 0x1662
de2bdb3dcf92280 Tom St Denis 2016-10-26  1121  #define mmDC_ABM1_HG_RESULT_9 0x1663
de2bdb3dcf92280 Tom St Denis 2016-10-26  1122  #define mmDC_ABM1_HG_SAMPLE_RATE 0x1654
de2bdb3dcf92280 Tom St Denis 2016-10-26  1123  #define mmDC_ABM1_IPCSC_COEFF_SEL 0x1639
de2bdb3dcf92280 Tom St Denis 2016-10-26  1124  #define mmDC_ABM1_LS_FILTERED_MIN_MAX_LUMA 0x164E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1125  #define mmDC_ABM1_LS_MAX_PIXEL_VALUE_COUNT 0x1653
de2bdb3dcf92280 Tom St Denis 2016-10-26  1126  #define mmDC_ABM1_LS_MIN_MAX_LUMA 0x164D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1127  #define mmDC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES 0x1651
de2bdb3dcf92280 Tom St Denis 2016-10-26  1128  #define mmDC_ABM1_LS_MIN_PIXEL_VALUE_COUNT 0x1652
de2bdb3dcf92280 Tom St Denis 2016-10-26  1129  #define mmDC_ABM1_LS_OVR_SCAN_BIN 0x1650
de2bdb3dcf92280 Tom St Denis 2016-10-26  1130  #define mmDC_ABM1_LS_PIXEL_COUNT 0x164F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1131  #define mmDC_ABM1_LS_SAMPLE_RATE 0x1655
de2bdb3dcf92280 Tom St Denis 2016-10-26  1132  #define mmDC_ABM1_LS_SUM_OF_LUMA 0x164C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1133  #define mmDC_ABM1_OVERSCAN_PIXEL_VALUE 0x169B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1134  #define mmDCCG_AUDIO_DTO0_MODULE 0x016D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1135  #define mmDCCG_AUDIO_DTO0_PHASE 0x016C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1136  #define mmDCCG_AUDIO_DTO1_MODULE 0x0171
de2bdb3dcf92280 Tom St Denis 2016-10-26  1137  #define mmDCCG_AUDIO_DTO1_PHASE 0x0170
de2bdb3dcf92280 Tom St Denis 2016-10-26  1138  #define mmDCCG_AUDIO_DTO_SOURCE 0x016B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1139  #define mmDCCG_CAC_STATUS 0x0137
de2bdb3dcf92280 Tom St Denis 2016-10-26  1140  #define mmDCCG_GATE_DISABLE_CNTL 0x0134
de2bdb3dcf92280 Tom St Denis 2016-10-26  1141  #define mmDCCG_GTC_CNTL 0x0120
de2bdb3dcf92280 Tom St Denis 2016-10-26  1142  #define mmDCCG_GTC_CURRENT 0x0123
de2bdb3dcf92280 Tom St Denis 2016-10-26  1143  #define mmDCCG_GTC_DTO_MODULO 0x0122
de2bdb3dcf92280 Tom St Denis 2016-10-26  1144  #define mmDCCG_PERFMON_CNTL 0x0133
de2bdb3dcf92280 Tom St Denis 2016-10-26  1145  #define mmDCCG_PLL0_PLL_ANALOG 0x1708
de2bdb3dcf92280 Tom St Denis 2016-10-26  1146  #define mmDCCG_PLL0_PLL_CNTL 0x1707
de2bdb3dcf92280 Tom St Denis 2016-10-26  1147  #define mmDCCG_PLL0_PLL_DEBUG_CNTL 0x170B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1148  #define mmDCCG_PLL0_PLL_DISPCLK_CURRENT_DTO_PHASE 0x170F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1149  #define mmDCCG_PLL0_PLL_DISPCLK_DTO_CNTL 0x170E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1150  #define mmDCCG_PLL0_PLL_DS_CNTL 0x1705
de2bdb3dcf92280 Tom St Denis 2016-10-26  1151  #define mmDCCG_PLL0_PLL_FB_DIV 0x1701
de2bdb3dcf92280 Tom St Denis 2016-10-26  1152  #define mmDCCG_PLL0_PLL_IDCLK_CNTL 0x1706
de2bdb3dcf92280 Tom St Denis 2016-10-26  1153  #define mmDCCG_PLL0_PLL_POST_DIV 0x1702
de2bdb3dcf92280 Tom St Denis 2016-10-26  1154  #define mmDCCG_PLL0_PLL_REF_DIV 0x1700
de2bdb3dcf92280 Tom St Denis 2016-10-26  1155  #define mmDCCG_PLL0_PLL_SS_AMOUNT_DSFRAC 0x1703
de2bdb3dcf92280 Tom St Denis 2016-10-26  1156  #define mmDCCG_PLL0_PLL_SS_CNTL 0x1704
de2bdb3dcf92280 Tom St Denis 2016-10-26  1157  #define mmDCCG_PLL0_PLL_UNLOCK_DETECT_CNTL 0x170A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1158  #define mmDCCG_PLL0_PLL_UPDATE_CNTL 0x170D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1159  #define mmDCCG_PLL0_PLL_UPDATE_LOCK 0x170C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1160  #define mmDCCG_PLL0_PLL_VREG_CNTL 0x1709
de2bdb3dcf92280 Tom St Denis 2016-10-26  1161  #define mmDCCG_PLL1_PLL_ANALOG 0x1718
de2bdb3dcf92280 Tom St Denis 2016-10-26  1162  #define mmDCCG_PLL1_PLL_CNTL 0x1717
de2bdb3dcf92280 Tom St Denis 2016-10-26  1163  #define mmDCCG_PLL1_PLL_DEBUG_CNTL 0x171B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1164  #define mmDCCG_PLL1_PLL_DISPCLK_CURRENT_DTO_PHASE 0x171F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1165  #define mmDCCG_PLL1_PLL_DISPCLK_DTO_CNTL 0x171E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1166  #define mmDCCG_PLL1_PLL_DS_CNTL 0x1715
de2bdb3dcf92280 Tom St Denis 2016-10-26  1167  #define mmDCCG_PLL1_PLL_FB_DIV 0x1711
de2bdb3dcf92280 Tom St Denis 2016-10-26  1168  #define mmDCCG_PLL1_PLL_IDCLK_CNTL 0x1716
de2bdb3dcf92280 Tom St Denis 2016-10-26  1169  #define mmDCCG_PLL1_PLL_POST_DIV 0x1712
de2bdb3dcf92280 Tom St Denis 2016-10-26  1170  #define mmDCCG_PLL1_PLL_REF_DIV 0x1710
de2bdb3dcf92280 Tom St Denis 2016-10-26  1171  #define mmDCCG_PLL1_PLL_SS_AMOUNT_DSFRAC 0x1713
de2bdb3dcf92280 Tom St Denis 2016-10-26  1172  #define mmDCCG_PLL1_PLL_SS_CNTL 0x1714
de2bdb3dcf92280 Tom St Denis 2016-10-26  1173  #define mmDCCG_PLL1_PLL_UNLOCK_DETECT_CNTL 0x171A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1174  #define mmDCCG_PLL1_PLL_UPDATE_CNTL 0x171D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1175  #define mmDCCG_PLL1_PLL_UPDATE_LOCK 0x171C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1176  #define mmDCCG_PLL1_PLL_VREG_CNTL 0x1719
de2bdb3dcf92280 Tom St Denis 2016-10-26  1177  #define mmDCCG_PLL2_PLL_ANALOG 0x1728
de2bdb3dcf92280 Tom St Denis 2016-10-26  1178  #define mmDCCG_PLL2_PLL_CNTL 0x1727
de2bdb3dcf92280 Tom St Denis 2016-10-26  1179  #define mmDCCG_PLL2_PLL_DEBUG_CNTL 0x172B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1180  #define mmDCCG_PLL2_PLL_DISPCLK_CURRENT_DTO_PHASE 0x172F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1181  #define mmDCCG_PLL2_PLL_DISPCLK_DTO_CNTL 0x172E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1182  #define mmDCCG_PLL2_PLL_DS_CNTL 0x1725
de2bdb3dcf92280 Tom St Denis 2016-10-26  1183  #define mmDCCG_PLL2_PLL_FB_DIV 0x1721
de2bdb3dcf92280 Tom St Denis 2016-10-26  1184  #define mmDCCG_PLL2_PLL_IDCLK_CNTL 0x1726
de2bdb3dcf92280 Tom St Denis 2016-10-26  1185  #define mmDCCG_PLL2_PLL_POST_DIV 0x1722
de2bdb3dcf92280 Tom St Denis 2016-10-26  1186  #define mmDCCG_PLL2_PLL_REF_DIV 0x1720
de2bdb3dcf92280 Tom St Denis 2016-10-26  1187  #define mmDCCG_PLL2_PLL_SS_AMOUNT_DSFRAC 0x1723
de2bdb3dcf92280 Tom St Denis 2016-10-26  1188  #define mmDCCG_PLL2_PLL_SS_CNTL 0x1724
de2bdb3dcf92280 Tom St Denis 2016-10-26  1189  #define mmDCCG_PLL2_PLL_UNLOCK_DETECT_CNTL 0x172A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1190  #define mmDCCG_PLL2_PLL_UPDATE_CNTL 0x172D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1191  #define mmDCCG_PLL2_PLL_UPDATE_LOCK 0x172C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1192  #define mmDCCG_PLL2_PLL_VREG_CNTL 0x1729
de2bdb3dcf92280 Tom St Denis 2016-10-26  1193  #define mmDCCG_SOFT_RESET 0x015F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1194  #define mmDCCG_TEST_CLK_SEL 0x017E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1195  #define mmDCCG_TEST_DEBUG_DATA 0x017D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1196  #define mmDCCG_TEST_DEBUG_INDEX 0x017C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1197  #define mmDCCG_VPCLK_CNTL 0x031F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1198  #define mmDCDEBUG_BUS_CLK1_SEL 0x1860
de2bdb3dcf92280 Tom St Denis 2016-10-26  1199  #define mmDCDEBUG_BUS_CLK2_SEL 0x1861
de2bdb3dcf92280 Tom St Denis 2016-10-26  1200  #define mmDCDEBUG_BUS_CLK3_SEL 0x1862
de2bdb3dcf92280 Tom St Denis 2016-10-26  1201  #define mmDCDEBUG_BUS_CLK4_SEL 0x1863
de2bdb3dcf92280 Tom St Denis 2016-10-26  1202  #define mmDCDEBUG_OUT_CNTL 0x186B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1203  #define mmDCDEBUG_OUT_DATA 0x186E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1204  #define mmDCDEBUG_OUT_PIN_OVERRIDE 0x186A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1205  #define mmDC_DMCU_SCRATCH 0x1618
de2bdb3dcf92280 Tom St Denis 2016-10-26  1206  #define mmDC_DVODATA_CONFIG 0x1905
de2bdb3dcf92280 Tom St Denis 2016-10-26  1207  #define mmDCFE0_SOFT_RESET 0x0158
de2bdb3dcf92280 Tom St Denis 2016-10-26  1208  #define mmDCFE1_SOFT_RESET 0x0159
de2bdb3dcf92280 Tom St Denis 2016-10-26  1209  #define mmDCFE2_SOFT_RESET 0x015A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1210  #define mmDCFE3_SOFT_RESET 0x015B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1211  #define mmDCFE4_SOFT_RESET 0x015C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1212  #define mmDCFE5_SOFT_RESET 0x015D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1213  #define mmDCFE_DBG_SEL 0x1B7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1214  #define mmDCFE_MEM_LIGHT_SLEEP_CNTL 0x1B7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1215  #define mmDC_GENERICA 0x1900
de2bdb3dcf92280 Tom St Denis 2016-10-26  1216  #define mmDC_GENERICB 0x1901
de2bdb3dcf92280 Tom St Denis 2016-10-26  1217  #define mmDC_GPIO_DDC1_A 0x194D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1218  #define mmDC_GPIO_DDC1_EN 0x194E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1219  #define mmDC_GPIO_DDC1_MASK 0x194C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1220  #define mmDC_GPIO_DDC1_Y 0x194F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1221  #define mmDC_GPIO_DDC2_A 0x1951
de2bdb3dcf92280 Tom St Denis 2016-10-26  1222  #define mmDC_GPIO_DDC2_EN 0x1952
de2bdb3dcf92280 Tom St Denis 2016-10-26  1223  #define mmDC_GPIO_DDC2_MASK 0x1950
de2bdb3dcf92280 Tom St Denis 2016-10-26  1224  #define mmDC_GPIO_DDC2_Y 0x1953
de2bdb3dcf92280 Tom St Denis 2016-10-26  1225  #define mmDC_GPIO_DDC3_A 0x1955
de2bdb3dcf92280 Tom St Denis 2016-10-26  1226  #define mmDC_GPIO_DDC3_EN 0x1956
de2bdb3dcf92280 Tom St Denis 2016-10-26  1227  #define mmDC_GPIO_DDC3_MASK 0x1954
de2bdb3dcf92280 Tom St Denis 2016-10-26  1228  #define mmDC_GPIO_DDC3_Y 0x1957
de2bdb3dcf92280 Tom St Denis 2016-10-26  1229  #define mmDC_GPIO_DDC4_A 0x1959
de2bdb3dcf92280 Tom St Denis 2016-10-26  1230  #define mmDC_GPIO_DDC4_EN 0x195A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1231  #define mmDC_GPIO_DDC4_MASK 0x1958
de2bdb3dcf92280 Tom St Denis 2016-10-26  1232  #define mmDC_GPIO_DDC4_Y 0x195B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1233  #define mmDC_GPIO_DDC5_A 0x195D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1234  #define mmDC_GPIO_DDC5_EN 0x195E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1235  #define mmDC_GPIO_DDC5_MASK 0x195C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1236  #define mmDC_GPIO_DDC5_Y 0x195F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1237  #define mmDC_GPIO_DDC6_A 0x1961
de2bdb3dcf92280 Tom St Denis 2016-10-26  1238  #define mmDC_GPIO_DDC6_EN 0x1962
de2bdb3dcf92280 Tom St Denis 2016-10-26  1239  #define mmDC_GPIO_DDC6_MASK 0x1960
de2bdb3dcf92280 Tom St Denis 2016-10-26  1240  #define mmDC_GPIO_DDC6_Y 0x1963
de2bdb3dcf92280 Tom St Denis 2016-10-26  1241  #define mmDC_GPIO_DDCVGA_A 0x1971
de2bdb3dcf92280 Tom St Denis 2016-10-26  1242  #define mmDC_GPIO_DDCVGA_EN 0x1972
de2bdb3dcf92280 Tom St Denis 2016-10-26  1243  #define mmDC_GPIO_DDCVGA_MASK 0x1970
de2bdb3dcf92280 Tom St Denis 2016-10-26  1244  #define mmDC_GPIO_DDCVGA_Y 0x1973
de2bdb3dcf92280 Tom St Denis 2016-10-26  1245  #define mmDC_GPIO_DEBUG 0x1904
de2bdb3dcf92280 Tom St Denis 2016-10-26  1246  #define mmDC_GPIO_DVODATA_A 0x1949
de2bdb3dcf92280 Tom St Denis 2016-10-26  1247  #define mmDC_GPIO_DVODATA_EN 0x194A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1248  #define mmDC_GPIO_DVODATA_MASK 0x1948
de2bdb3dcf92280 Tom St Denis 2016-10-26  1249  #define mmDC_GPIO_DVODATA_Y 0x194B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1250  #define mmDC_GPIO_GENERIC_A 0x1945
de2bdb3dcf92280 Tom St Denis 2016-10-26  1251  #define mmDC_GPIO_GENERIC_EN 0x1946
de2bdb3dcf92280 Tom St Denis 2016-10-26  1252  #define mmDC_GPIO_GENERIC_MASK 0x1944
de2bdb3dcf92280 Tom St Denis 2016-10-26  1253  #define mmDC_GPIO_GENERIC_Y 0x1947
de2bdb3dcf92280 Tom St Denis 2016-10-26  1254  #define mmDC_GPIO_GENLK_A 0x1969
de2bdb3dcf92280 Tom St Denis 2016-10-26  1255  #define mmDC_GPIO_GENLK_EN 0x196A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1256  #define mmDC_GPIO_GENLK_MASK 0x1968
de2bdb3dcf92280 Tom St Denis 2016-10-26  1257  #define mmDC_GPIO_GENLK_Y 0x196B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1258  #define mmDC_GPIO_HPD_A 0x196D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1259  #define mmDC_GPIO_HPD_EN 0x196E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1260  #define mmDC_GPIO_HPD_MASK 0x196C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1261  #define mmDC_GPIO_HPD_Y 0x196F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1262  #define mmDC_GPIO_I2CPAD_A 0x1975
de2bdb3dcf92280 Tom St Denis 2016-10-26  1263  #define mmDC_GPIO_I2CPAD_EN 0x1976
de2bdb3dcf92280 Tom St Denis 2016-10-26  1264  #define mmDC_GPIO_I2CPAD_MASK 0x1974
de2bdb3dcf92280 Tom St Denis 2016-10-26  1265  #define mmDC_GPIO_I2CPAD_STRENGTH 0x197A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1266  #define mmDC_GPIO_I2CPAD_Y 0x1977
de2bdb3dcf92280 Tom St Denis 2016-10-26  1267  #define mmDC_GPIO_PAD_STRENGTH_1 0x1978
de2bdb3dcf92280 Tom St Denis 2016-10-26  1268  #define mmDC_GPIO_PAD_STRENGTH_2 0x1979
de2bdb3dcf92280 Tom St Denis 2016-10-26  1269  #define mmDC_GPIO_PWRSEQ_A 0x1941
de2bdb3dcf92280 Tom St Denis 2016-10-26  1270  #define mmDC_GPIO_PWRSEQ_EN 0x1942
de2bdb3dcf92280 Tom St Denis 2016-10-26  1271  #define mmDC_GPIO_PWRSEQ_MASK 0x1940
de2bdb3dcf92280 Tom St Denis 2016-10-26  1272  #define mmDC_GPIO_PWRSEQ_Y 0x1943
de2bdb3dcf92280 Tom St Denis 2016-10-26  1273  #define mmDC_GPIO_SYNCA_A 0x1965
de2bdb3dcf92280 Tom St Denis 2016-10-26  1274  #define mmDC_GPIO_SYNCA_EN 0x1966
de2bdb3dcf92280 Tom St Denis 2016-10-26  1275  #define mmDC_GPIO_SYNCA_MASK 0x1964
de2bdb3dcf92280 Tom St Denis 2016-10-26  1276  #define mmDC_GPIO_SYNCA_Y 0x1967
de2bdb3dcf92280 Tom St Denis 2016-10-26  1277  #define mmDC_GPU_TIMER_READ 0x1929
de2bdb3dcf92280 Tom St Denis 2016-10-26  1278  #define mmDC_GPU_TIMER_READ_CNTL 0x192A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1279  #define mmDC_GPU_TIMER_START_POSITION_P_FLIP 0x1928
de2bdb3dcf92280 Tom St Denis 2016-10-26  1280  #define mmDC_GPU_TIMER_START_POSITION_V_UPDATE 0x1927
de2bdb3dcf92280 Tom St Denis 2016-10-26  1281  #define mmDC_HPD1_CONTROL 0x1809
de2bdb3dcf92280 Tom St Denis 2016-10-26  1282  #define mmDC_HPD1_FAST_TRAIN_CNTL 0x1864
de2bdb3dcf92280 Tom St Denis 2016-10-26  1283  #define mmDC_HPD1_INT_CONTROL 0x1808
de2bdb3dcf92280 Tom St Denis 2016-10-26  1284  #define mmDC_HPD1_INT_STATUS 0x1807
de2bdb3dcf92280 Tom St Denis 2016-10-26  1285  #define mmDC_HPD1_TOGGLE_FILT_CNTL 0x18BC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1286  #define mmDC_HPD2_CONTROL 0x180C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1287  #define mmDC_HPD2_FAST_TRAIN_CNTL 0x1865
de2bdb3dcf92280 Tom St Denis 2016-10-26  1288  #define mmDC_HPD2_INT_CONTROL 0x180B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1289  #define mmDC_HPD2_INT_STATUS 0x180A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1290  #define mmDC_HPD2_TOGGLE_FILT_CNTL 0x18BD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1291  #define mmDC_HPD3_CONTROL 0x180F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1292  #define mmDC_HPD3_FAST_TRAIN_CNTL 0x1866
de2bdb3dcf92280 Tom St Denis 2016-10-26  1293  #define mmDC_HPD3_INT_CONTROL 0x180E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1294  #define mmDC_HPD3_INT_STATUS 0x180D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1295  #define mmDC_HPD3_TOGGLE_FILT_CNTL 0x18BE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1296  #define mmDC_HPD4_CONTROL 0x1812
de2bdb3dcf92280 Tom St Denis 2016-10-26  1297  #define mmDC_HPD4_FAST_TRAIN_CNTL 0x1867
de2bdb3dcf92280 Tom St Denis 2016-10-26  1298  #define mmDC_HPD4_INT_CONTROL 0x1811
de2bdb3dcf92280 Tom St Denis 2016-10-26  1299  #define mmDC_HPD4_INT_STATUS 0x1810
de2bdb3dcf92280 Tom St Denis 2016-10-26  1300  #define mmDC_HPD4_TOGGLE_FILT_CNTL 0x18FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1301  #define mmDC_HPD5_CONTROL 0x1815
de2bdb3dcf92280 Tom St Denis 2016-10-26  1302  #define mmDC_HPD5_FAST_TRAIN_CNTL 0x1868
de2bdb3dcf92280 Tom St Denis 2016-10-26  1303  #define mmDC_HPD5_INT_CONTROL 0x1814
de2bdb3dcf92280 Tom St Denis 2016-10-26  1304  #define mmDC_HPD5_INT_STATUS 0x1813
de2bdb3dcf92280 Tom St Denis 2016-10-26  1305  #define mmDC_HPD5_TOGGLE_FILT_CNTL 0x18FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1306  #define mmDC_HPD6_CONTROL 0x1818
de2bdb3dcf92280 Tom St Denis 2016-10-26  1307  #define mmDC_HPD6_FAST_TRAIN_CNTL 0x1869
de2bdb3dcf92280 Tom St Denis 2016-10-26  1308  #define mmDC_HPD6_INT_CONTROL 0x1817
de2bdb3dcf92280 Tom St Denis 2016-10-26  1309  #define mmDC_HPD6_INT_STATUS 0x1816
de2bdb3dcf92280 Tom St Denis 2016-10-26  1310  #define mmDC_HPD6_TOGGLE_FILT_CNTL 0x18FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1311  #define mmDC_I2C_ARBITRATION 0x181A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1312  #define mmDC_I2C_CONTROL 0x1819
de2bdb3dcf92280 Tom St Denis 2016-10-26  1313  #define mmDC_I2C_DATA 0x1833
de2bdb3dcf92280 Tom St Denis 2016-10-26  1314  #define mmDC_I2C_DDC1_HW_STATUS 0x181D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1315  #define mmDC_I2C_DDC1_SETUP 0x1824
de2bdb3dcf92280 Tom St Denis 2016-10-26  1316  #define mmDC_I2C_DDC1_SPEED 0x1823
de2bdb3dcf92280 Tom St Denis 2016-10-26  1317  #define mmDC_I2C_DDC2_HW_STATUS 0x181E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1318  #define mmDC_I2C_DDC2_SETUP 0x1826
de2bdb3dcf92280 Tom St Denis 2016-10-26  1319  #define mmDC_I2C_DDC2_SPEED 0x1825
de2bdb3dcf92280 Tom St Denis 2016-10-26  1320  #define mmDC_I2C_DDC3_HW_STATUS 0x181F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1321  #define mmDC_I2C_DDC3_SETUP 0x1828
de2bdb3dcf92280 Tom St Denis 2016-10-26  1322  #define mmDC_I2C_DDC3_SPEED 0x1827
de2bdb3dcf92280 Tom St Denis 2016-10-26  1323  #define mmDC_I2C_DDC4_HW_STATUS 0x1820
de2bdb3dcf92280 Tom St Denis 2016-10-26  1324  #define mmDC_I2C_DDC4_SETUP 0x182A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1325  #define mmDC_I2C_DDC4_SPEED 0x1829
de2bdb3dcf92280 Tom St Denis 2016-10-26  1326  #define mmDC_I2C_DDC5_HW_STATUS 0x1821
de2bdb3dcf92280 Tom St Denis 2016-10-26  1327  #define mmDC_I2C_DDC5_SETUP 0x182C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1328  #define mmDC_I2C_DDC5_SPEED 0x182B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1329  #define mmDC_I2C_DDC6_HW_STATUS 0x1822
de2bdb3dcf92280 Tom St Denis 2016-10-26  1330  #define mmDC_I2C_DDC6_SETUP 0x182E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1331  #define mmDC_I2C_DDC6_SPEED 0x182D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1332  #define mmDC_I2C_DDCVGA_HW_STATUS 0x1855
de2bdb3dcf92280 Tom St Denis 2016-10-26  1333  #define mmDC_I2C_DDCVGA_SETUP 0x1857
de2bdb3dcf92280 Tom St Denis 2016-10-26  1334  #define mmDC_I2C_DDCVGA_SPEED 0x1856
de2bdb3dcf92280 Tom St Denis 2016-10-26  1335  #define mmDC_I2C_EDID_DETECT_CTRL 0x186F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1336  #define mmDC_I2C_INTERRUPT_CONTROL 0x181B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1337  #define mmDC_I2C_SW_STATUS 0x181C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1338  #define mmDC_I2C_TRANSACTION0 0x182F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1339  #define mmDC_I2C_TRANSACTION1 0x1830
de2bdb3dcf92280 Tom St Denis 2016-10-26  1340  #define mmDC_I2C_TRANSACTION2 0x1831
de2bdb3dcf92280 Tom St Denis 2016-10-26  1341  #define mmDC_I2C_TRANSACTION3 0x1832
de2bdb3dcf92280 Tom St Denis 2016-10-26  1342  #define mmDCI_CLK_CNTL 0x031E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1343  #define mmDCI_CLK_RAMP_CNTL 0x0324
de2bdb3dcf92280 Tom St Denis 2016-10-26  1344  #define mmDCI_DEBUG_CONFIG 0x0323
de2bdb3dcf92280 Tom St Denis 2016-10-26  1345  #define mmDCI_MEM_PWR_CNTL 0x0326
de2bdb3dcf92280 Tom St Denis 2016-10-26  1346  #define mmDCI_MEM_PWR_STATE 0x031B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1347  #define mmDCI_MEM_PWR_STATE2 0x0322
de2bdb3dcf92280 Tom St Denis 2016-10-26  1348  #define mmDCIO_DEBUG 0x192E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1349  #define mmDCIO_GSL0_CNTL 0x1924
de2bdb3dcf92280 Tom St Denis 2016-10-26  1350  #define mmDCIO_GSL1_CNTL 0x1925
de2bdb3dcf92280 Tom St Denis 2016-10-26  1351  #define mmDCIO_GSL2_CNTL 0x1926
de2bdb3dcf92280 Tom St Denis 2016-10-26  1352  #define mmDCIO_GSL_GENLK_PAD_CNTL 0x1922
de2bdb3dcf92280 Tom St Denis 2016-10-26  1353  #define mmDCIO_GSL_SWAPLOCK_PAD_CNTL 0x1923
de2bdb3dcf92280 Tom St Denis 2016-10-26  1354  #define mmDCIO_IMPCAL_CNTL_AB 0x190D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1355  #define mmDCIO_IMPCAL_CNTL_CD 0x1911
de2bdb3dcf92280 Tom St Denis 2016-10-26  1356  #define mmDCIO_IMPCAL_CNTL_EF 0x1915
de2bdb3dcf92280 Tom St Denis 2016-10-26  1357  #define mmDCIO_TEST_DEBUG_DATA 0x1930
de2bdb3dcf92280 Tom St Denis 2016-10-26  1358  #define mmDCIO_TEST_DEBUG_INDEX 0x192F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1359  #define mmDCIO_UNIPHY0_UNIPHY_ANG_BIST_CNTL 0x198C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1360  #define mmDCIO_UNIPHY0_UNIPHY_CHANNEL_XBAR_CNTL 0x198E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1361  #define mmDCIO_UNIPHY0_UNIPHY_DATA_SYNCHRONIZATION 0x198A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1362  #define mmDCIO_UNIPHY0_UNIPHY_LINK_CNTL 0x198D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1363  #define mmDCIO_UNIPHY0_UNIPHY_PLL_CONTROL1 0x1986
de2bdb3dcf92280 Tom St Denis 2016-10-26  1364  #define mmDCIO_UNIPHY0_UNIPHY_PLL_CONTROL2 0x1987
de2bdb3dcf92280 Tom St Denis 2016-10-26  1365  #define mmDCIO_UNIPHY0_UNIPHY_PLL_FBDIV 0x1985
de2bdb3dcf92280 Tom St Denis 2016-10-26  1366  #define mmDCIO_UNIPHY0_UNIPHY_PLL_SS_CNTL 0x1989
de2bdb3dcf92280 Tom St Denis 2016-10-26  1367  #define mmDCIO_UNIPHY0_UNIPHY_PLL_SS_STEP_SIZE 0x1988
de2bdb3dcf92280 Tom St Denis 2016-10-26  1368  #define mmDCIO_UNIPHY0_UNIPHY_POWER_CONTROL 0x1984
de2bdb3dcf92280 Tom St Denis 2016-10-26  1369  #define mmDCIO_UNIPHY0_UNIPHY_REG_TEST_OUTPUT 0x198B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1370  #define mmDCIO_UNIPHY0_UNIPHY_TX_CONTROL1 0x1980
de2bdb3dcf92280 Tom St Denis 2016-10-26  1371  #define mmDCIO_UNIPHY0_UNIPHY_TX_CONTROL2 0x1981
de2bdb3dcf92280 Tom St Denis 2016-10-26  1372  #define mmDCIO_UNIPHY0_UNIPHY_TX_CONTROL3 0x1982
de2bdb3dcf92280 Tom St Denis 2016-10-26  1373  #define mmDCIO_UNIPHY0_UNIPHY_TX_CONTROL4 0x1983
de2bdb3dcf92280 Tom St Denis 2016-10-26  1374  #define mmDCIO_UNIPHY1_UNIPHY_ANG_BIST_CNTL 0x199C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1375  #define mmDCIO_UNIPHY1_UNIPHY_CHANNEL_XBAR_CNTL 0x199E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1376  #define mmDCIO_UNIPHY1_UNIPHY_DATA_SYNCHRONIZATION 0x199A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1377  #define mmDCIO_UNIPHY1_UNIPHY_LINK_CNTL 0x199D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1378  #define mmDCIO_UNIPHY1_UNIPHY_PLL_CONTROL1 0x1996
de2bdb3dcf92280 Tom St Denis 2016-10-26  1379  #define mmDCIO_UNIPHY1_UNIPHY_PLL_CONTROL2 0x1997
de2bdb3dcf92280 Tom St Denis 2016-10-26  1380  #define mmDCIO_UNIPHY1_UNIPHY_PLL_FBDIV 0x1995
de2bdb3dcf92280 Tom St Denis 2016-10-26  1381  #define mmDCIO_UNIPHY1_UNIPHY_PLL_SS_CNTL 0x1999
de2bdb3dcf92280 Tom St Denis 2016-10-26  1382  #define mmDCIO_UNIPHY1_UNIPHY_PLL_SS_STEP_SIZE 0x1998
de2bdb3dcf92280 Tom St Denis 2016-10-26  1383  #define mmDCIO_UNIPHY1_UNIPHY_POWER_CONTROL 0x1994
de2bdb3dcf92280 Tom St Denis 2016-10-26  1384  #define mmDCIO_UNIPHY1_UNIPHY_REG_TEST_OUTPUT 0x199B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1385  #define mmDCIO_UNIPHY1_UNIPHY_TX_CONTROL1 0x1990
de2bdb3dcf92280 Tom St Denis 2016-10-26  1386  #define mmDCIO_UNIPHY1_UNIPHY_TX_CONTROL2 0x1991
de2bdb3dcf92280 Tom St Denis 2016-10-26  1387  #define mmDCIO_UNIPHY1_UNIPHY_TX_CONTROL3 0x1992
de2bdb3dcf92280 Tom St Denis 2016-10-26  1388  #define mmDCIO_UNIPHY1_UNIPHY_TX_CONTROL4 0x1993
de2bdb3dcf92280 Tom St Denis 2016-10-26  1389  #define mmDCIO_UNIPHY2_UNIPHY_ANG_BIST_CNTL 0x19AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1390  #define mmDCIO_UNIPHY2_UNIPHY_CHANNEL_XBAR_CNTL 0x19AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1391  #define mmDCIO_UNIPHY2_UNIPHY_DATA_SYNCHRONIZATION 0x19AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1392  #define mmDCIO_UNIPHY2_UNIPHY_LINK_CNTL 0x19AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1393  #define mmDCIO_UNIPHY2_UNIPHY_PLL_CONTROL1 0x19A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1394  #define mmDCIO_UNIPHY2_UNIPHY_PLL_CONTROL2 0x19A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1395  #define mmDCIO_UNIPHY2_UNIPHY_PLL_FBDIV 0x19A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1396  #define mmDCIO_UNIPHY2_UNIPHY_PLL_SS_CNTL 0x19A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1397  #define mmDCIO_UNIPHY2_UNIPHY_PLL_SS_STEP_SIZE 0x19A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1398  #define mmDCIO_UNIPHY2_UNIPHY_POWER_CONTROL 0x19A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1399  #define mmDCIO_UNIPHY2_UNIPHY_REG_TEST_OUTPUT 0x19AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1400  #define mmDCIO_UNIPHY2_UNIPHY_TX_CONTROL1 0x19A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1401  #define mmDCIO_UNIPHY2_UNIPHY_TX_CONTROL2 0x19A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1402  #define mmDCIO_UNIPHY2_UNIPHY_TX_CONTROL3 0x19A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1403  #define mmDCIO_UNIPHY2_UNIPHY_TX_CONTROL4 0x19A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1404  #define mmDCIO_UNIPHY3_UNIPHY_ANG_BIST_CNTL 0x19BC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1405  #define mmDCIO_UNIPHY3_UNIPHY_CHANNEL_XBAR_CNTL 0x19BE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1406  #define mmDCIO_UNIPHY3_UNIPHY_DATA_SYNCHRONIZATION 0x19BA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1407  #define mmDCIO_UNIPHY3_UNIPHY_LINK_CNTL 0x19BD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1408  #define mmDCIO_UNIPHY3_UNIPHY_PLL_CONTROL1 0x19B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1409  #define mmDCIO_UNIPHY3_UNIPHY_PLL_CONTROL2 0x19B7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1410  #define mmDCIO_UNIPHY3_UNIPHY_PLL_FBDIV 0x19B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1411  #define mmDCIO_UNIPHY3_UNIPHY_PLL_SS_CNTL 0x19B9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1412  #define mmDCIO_UNIPHY3_UNIPHY_PLL_SS_STEP_SIZE 0x19B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1413  #define mmDCIO_UNIPHY3_UNIPHY_POWER_CONTROL 0x19B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1414  #define mmDCIO_UNIPHY3_UNIPHY_REG_TEST_OUTPUT 0x19BB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1415  #define mmDCIO_UNIPHY3_UNIPHY_TX_CONTROL1 0x19B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1416  #define mmDCIO_UNIPHY3_UNIPHY_TX_CONTROL2 0x19B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1417  #define mmDCIO_UNIPHY3_UNIPHY_TX_CONTROL3 0x19B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1418  #define mmDCIO_UNIPHY3_UNIPHY_TX_CONTROL4 0x19B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1419  #define mmDCIO_UNIPHY4_UNIPHY_ANG_BIST_CNTL 0x19CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1420  #define mmDCIO_UNIPHY4_UNIPHY_CHANNEL_XBAR_CNTL 0x19CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1421  #define mmDCIO_UNIPHY4_UNIPHY_DATA_SYNCHRONIZATION 0x19CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1422  #define mmDCIO_UNIPHY4_UNIPHY_LINK_CNTL 0x19CD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1423  #define mmDCIO_UNIPHY4_UNIPHY_PLL_CONTROL1 0x19C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1424  #define mmDCIO_UNIPHY4_UNIPHY_PLL_CONTROL2 0x19C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1425  #define mmDCIO_UNIPHY4_UNIPHY_PLL_FBDIV 0x19C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1426  #define mmDCIO_UNIPHY4_UNIPHY_PLL_SS_CNTL 0x19C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1427  #define mmDCIO_UNIPHY4_UNIPHY_PLL_SS_STEP_SIZE 0x19C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1428  #define mmDCIO_UNIPHY4_UNIPHY_POWER_CONTROL 0x19C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1429  #define mmDCIO_UNIPHY4_UNIPHY_REG_TEST_OUTPUT 0x19CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1430  #define mmDCIO_UNIPHY4_UNIPHY_TX_CONTROL1 0x19C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1431  #define mmDCIO_UNIPHY4_UNIPHY_TX_CONTROL2 0x19C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1432  #define mmDCIO_UNIPHY4_UNIPHY_TX_CONTROL3 0x19C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1433  #define mmDCIO_UNIPHY4_UNIPHY_TX_CONTROL4 0x19C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1434  #define mmDCIO_UNIPHY5_UNIPHY_ANG_BIST_CNTL 0x19DC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1435  #define mmDCIO_UNIPHY5_UNIPHY_CHANNEL_XBAR_CNTL 0x19DE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1436  #define mmDCIO_UNIPHY5_UNIPHY_DATA_SYNCHRONIZATION 0x19DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1437  #define mmDCIO_UNIPHY5_UNIPHY_LINK_CNTL 0x19DD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1438  #define mmDCIO_UNIPHY5_UNIPHY_PLL_CONTROL1 0x19D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1439  #define mmDCIO_UNIPHY5_UNIPHY_PLL_CONTROL2 0x19D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1440  #define mmDCIO_UNIPHY5_UNIPHY_PLL_FBDIV 0x19D5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1441  #define mmDCIO_UNIPHY5_UNIPHY_PLL_SS_CNTL 0x19D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1442  #define mmDCIO_UNIPHY5_UNIPHY_PLL_SS_STEP_SIZE 0x19D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1443  #define mmDCIO_UNIPHY5_UNIPHY_POWER_CONTROL 0x19D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1444  #define mmDCIO_UNIPHY5_UNIPHY_REG_TEST_OUTPUT 0x19DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1445  #define mmDCIO_UNIPHY5_UNIPHY_TX_CONTROL1 0x19D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1446  #define mmDCIO_UNIPHY5_UNIPHY_TX_CONTROL2 0x19D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1447  #define mmDCIO_UNIPHY5_UNIPHY_TX_CONTROL3 0x19D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1448  #define mmDCIO_UNIPHY5_UNIPHY_TX_CONTROL4 0x19D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1449  #define mmDCI_SOFT_RESET 0x015E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1450  #define mmDCI_TEST_DEBUG_DATA 0x0321
de2bdb3dcf92280 Tom St Denis 2016-10-26  1451  #define mmDCI_TEST_DEBUG_INDEX 0x0320
de2bdb3dcf92280 Tom St Denis 2016-10-26  1452  #define mmDC_LUT_30_COLOR 0x1A7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1453  #define mmDC_LUT_AUTOFILL 0x1A7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1454  #define mmDC_LUT_BLACK_OFFSET_BLUE 0x1A81
de2bdb3dcf92280 Tom St Denis 2016-10-26  1455  #define mmDC_LUT_BLACK_OFFSET_GREEN 0x1A82
de2bdb3dcf92280 Tom St Denis 2016-10-26  1456  #define mmDC_LUT_BLACK_OFFSET_RED 0x1A83
de2bdb3dcf92280 Tom St Denis 2016-10-26  1457  #define mmDC_LUT_CONTROL 0x1A80
de2bdb3dcf92280 Tom St Denis 2016-10-26  1458  #define mmDC_LUT_PWL_DATA 0x1A7B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1459  #define mmDC_LUT_RW_INDEX 0x1A79
de2bdb3dcf92280 Tom St Denis 2016-10-26  1460  #define mmDC_LUT_RW_MODE 0x1A78
de2bdb3dcf92280 Tom St Denis 2016-10-26  1461  #define mmDC_LUT_SEQ_COLOR 0x1A7A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1462  #define mmDC_LUT_VGA_ACCESS_ENABLE 0x1A7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1463  #define mmDC_LUT_WHITE_OFFSET_BLUE 0x1A84
de2bdb3dcf92280 Tom St Denis 2016-10-26  1464  #define mmDC_LUT_WHITE_OFFSET_GREEN 0x1A85
de2bdb3dcf92280 Tom St Denis 2016-10-26  1465  #define mmDC_LUT_WHITE_OFFSET_RED 0x1A86
de2bdb3dcf92280 Tom St Denis 2016-10-26  1466  #define mmDC_LUT_WRITE_EN_MASK 0x1A7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1467  #define mmDC_MVP_LB_CONTROL 0x1ADB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1468  #define mmDCO_CLK_CNTL 0x192B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1469  #define mmDCO_CLK_RAMP_CNTL 0x192C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1470  #define mmDCO_LIGHT_SLEEP_DIS 0x1907
de2bdb3dcf92280 Tom St Denis 2016-10-26  1471  #define mmDCO_MEM_POWER_STATE 0x1906
de2bdb3dcf92280 Tom St Denis 2016-10-26  1472  #define mmDCO_SOFT_RESET 0x0167
de2bdb3dcf92280 Tom St Denis 2016-10-26  1473  #define mmDCP0_COMM_MATRIXA_TRANS_C11_C12 0x1A43
de2bdb3dcf92280 Tom St Denis 2016-10-26  1474  #define mmDCP0_COMM_MATRIXA_TRANS_C13_C14 0x1A44
de2bdb3dcf92280 Tom St Denis 2016-10-26  1475  #define mmDCP0_COMM_MATRIXA_TRANS_C21_C22 0x1A45
de2bdb3dcf92280 Tom St Denis 2016-10-26  1476  #define mmDCP0_COMM_MATRIXA_TRANS_C23_C24 0x1A46
de2bdb3dcf92280 Tom St Denis 2016-10-26  1477  #define mmDCP0_COMM_MATRIXA_TRANS_C31_C32 0x1A47
de2bdb3dcf92280 Tom St Denis 2016-10-26  1478  #define mmDCP0_COMM_MATRIXA_TRANS_C33_C34 0x1A48
de2bdb3dcf92280 Tom St Denis 2016-10-26  1479  #define mmDCP0_COMM_MATRIXB_TRANS_C11_C12 0x1A49
de2bdb3dcf92280 Tom St Denis 2016-10-26  1480  #define mmDCP0_COMM_MATRIXB_TRANS_C13_C14 0x1A4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1481  #define mmDCP0_COMM_MATRIXB_TRANS_C21_C22 0x1A4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1482  #define mmDCP0_COMM_MATRIXB_TRANS_C23_C24 0x1A4C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1483  #define mmDCP0_COMM_MATRIXB_TRANS_C31_C32 0x1A4D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1484  #define mmDCP0_COMM_MATRIXB_TRANS_C33_C34 0x1A4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1485  #define mmDCP0_CUR_COLOR1 0x1A6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1486  #define mmDCP0_CUR_COLOR2 0x1A6D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1487  #define mmDCP0_CUR_CONTROL 0x1A66
de2bdb3dcf92280 Tom St Denis 2016-10-26  1488  #define mmDCP0_CUR_HOT_SPOT 0x1A6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1489  #define mmDCP0_CUR_POSITION 0x1A6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1490  #define mmDCP0_CUR_REQUEST_FILTER_CNTL 0x1A99
de2bdb3dcf92280 Tom St Denis 2016-10-26  1491  #define mmDCP0_CUR_SIZE 0x1A68
de2bdb3dcf92280 Tom St Denis 2016-10-26  1492  #define mmDCP0_CUR_SURFACE_ADDRESS 0x1A67
de2bdb3dcf92280 Tom St Denis 2016-10-26  1493  #define mmDCP0_CUR_SURFACE_ADDRESS_HIGH 0x1A69
de2bdb3dcf92280 Tom St Denis 2016-10-26  1494  #define mmDCP0_CUR_UPDATE 0x1A6E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1495  #define mmDCP0_DC_LUT_30_COLOR 0x1A7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1496  #define mmDCP0_DC_LUT_AUTOFILL 0x1A7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1497  #define mmDCP0_DC_LUT_BLACK_OFFSET_BLUE 0x1A81
de2bdb3dcf92280 Tom St Denis 2016-10-26  1498  #define mmDCP0_DC_LUT_BLACK_OFFSET_GREEN 0x1A82
de2bdb3dcf92280 Tom St Denis 2016-10-26  1499  #define mmDCP0_DC_LUT_BLACK_OFFSET_RED 0x1A83
de2bdb3dcf92280 Tom St Denis 2016-10-26  1500  #define mmDCP0_DC_LUT_CONTROL 0x1A80
de2bdb3dcf92280 Tom St Denis 2016-10-26  1501  #define mmDCP0_DC_LUT_PWL_DATA 0x1A7B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1502  #define mmDCP0_DC_LUT_RW_INDEX 0x1A79
de2bdb3dcf92280 Tom St Denis 2016-10-26  1503  #define mmDCP0_DC_LUT_RW_MODE 0x1A78
de2bdb3dcf92280 Tom St Denis 2016-10-26  1504  #define mmDCP0_DC_LUT_SEQ_COLOR 0x1A7A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1505  #define mmDCP0_DC_LUT_VGA_ACCESS_ENABLE 0x1A7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1506  #define mmDCP0_DC_LUT_WHITE_OFFSET_BLUE 0x1A84
de2bdb3dcf92280 Tom St Denis 2016-10-26  1507  #define mmDCP0_DC_LUT_WHITE_OFFSET_GREEN 0x1A85
de2bdb3dcf92280 Tom St Denis 2016-10-26  1508  #define mmDCP0_DC_LUT_WHITE_OFFSET_RED 0x1A86
de2bdb3dcf92280 Tom St Denis 2016-10-26  1509  #define mmDCP0_DC_LUT_WRITE_EN_MASK 0x1A7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1510  #define mmDCP0_DCP_CRC_CONTROL 0x1A87
de2bdb3dcf92280 Tom St Denis 2016-10-26  1511  #define mmDCP0_DCP_CRC_CURRENT 0x1A89
de2bdb3dcf92280 Tom St Denis 2016-10-26  1512  #define mmDCP0_DCP_CRC_LAST 0x1A8B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1513  #define mmDCP0_DCP_CRC_MASK 0x1A88
de2bdb3dcf92280 Tom St Denis 2016-10-26  1514  #define mmDCP0_DCP_DEBUG 0x1A8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1515  #define mmDCP0_DCP_DEBUG2 0x1A98
de2bdb3dcf92280 Tom St Denis 2016-10-26  1516  #define mmDCP0_DCP_FP_CONVERTED_FIELD 0x1A65
de2bdb3dcf92280 Tom St Denis 2016-10-26  1517  #define mmDCP0_DCP_GSL_CONTROL 0x1A90
de2bdb3dcf92280 Tom St Denis 2016-10-26  1518  #define mmDCP0_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x1A91
de2bdb3dcf92280 Tom St Denis 2016-10-26  1519  #define mmDCP0_DCP_RANDOM_SEEDS 0x1A61
de2bdb3dcf92280 Tom St Denis 2016-10-26  1520  #define mmDCP0_DCP_SPATIAL_DITHER_CNTL 0x1A60
de2bdb3dcf92280 Tom St Denis 2016-10-26  1521  #define mmDCP0_DCP_TEST_DEBUG_DATA 0x1A96
de2bdb3dcf92280 Tom St Denis 2016-10-26  1522  #define mmDCP0_DCP_TEST_DEBUG_INDEX 0x1A95
de2bdb3dcf92280 Tom St Denis 2016-10-26  1523  #define mmDCP0_DEGAMMA_CONTROL 0x1A58
de2bdb3dcf92280 Tom St Denis 2016-10-26  1524  #define mmDCP0_DENORM_CONTROL 0x1A50
de2bdb3dcf92280 Tom St Denis 2016-10-26  1525  #define mmDCP0_GAMUT_REMAP_C11_C12 0x1A5A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1526  #define mmDCP0_GAMUT_REMAP_C13_C14 0x1A5B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1527  #define mmDCP0_GAMUT_REMAP_C21_C22 0x1A5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1528  #define mmDCP0_GAMUT_REMAP_C23_C24 0x1A5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1529  #define mmDCP0_GAMUT_REMAP_C31_C32 0x1A5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1530  #define mmDCP0_GAMUT_REMAP_C33_C34 0x1A5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1531  #define mmDCP0_GAMUT_REMAP_CONTROL 0x1A59
de2bdb3dcf92280 Tom St Denis 2016-10-26  1532  #define mmDCP0_GRPH_COMPRESS_PITCH 0x1A1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1533  #define mmDCP0_GRPH_COMPRESS_SURFACE_ADDRESS 0x1A19
de2bdb3dcf92280 Tom St Denis 2016-10-26  1534  #define mmDCP0_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x1A1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1535  #define mmDCP0_GRPH_CONTROL 0x1A01
de2bdb3dcf92280 Tom St Denis 2016-10-26  1536  #define mmDCP0_GRPH_DFQ_CONTROL 0x1A14
de2bdb3dcf92280 Tom St Denis 2016-10-26  1537  #define mmDCP0_GRPH_DFQ_STATUS 0x1A15
de2bdb3dcf92280 Tom St Denis 2016-10-26  1538  #define mmDCP0_GRPH_ENABLE 0x1A00
de2bdb3dcf92280 Tom St Denis 2016-10-26  1539  #define mmDCP0_GRPH_FLIP_CONTROL 0x1A12
de2bdb3dcf92280 Tom St Denis 2016-10-26  1540  #define mmDCP0_GRPH_INTERRUPT_CONTROL 0x1A17
de2bdb3dcf92280 Tom St Denis 2016-10-26  1541  #define mmDCP0_GRPH_INTERRUPT_STATUS 0x1A16
de2bdb3dcf92280 Tom St Denis 2016-10-26  1542  #define mmDCP0_GRPH_LUT_10BIT_BYPASS 0x1A02
de2bdb3dcf92280 Tom St Denis 2016-10-26  1543  #define mmDCP0_GRPH_PITCH 0x1A06
de2bdb3dcf92280 Tom St Denis 2016-10-26  1544  #define mmDCP0_GRPH_PRIMARY_SURFACE_ADDRESS 0x1A04
de2bdb3dcf92280 Tom St Denis 2016-10-26  1545  #define mmDCP0_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x1A07
de2bdb3dcf92280 Tom St Denis 2016-10-26  1546  #define mmDCP0_GRPH_SECONDARY_SURFACE_ADDRESS 0x1A05
de2bdb3dcf92280 Tom St Denis 2016-10-26  1547  #define mmDCP0_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x1A08
de2bdb3dcf92280 Tom St Denis 2016-10-26  1548  #define mmDCP0_GRPH_STEREOSYNC_FLIP 0x1A97
de2bdb3dcf92280 Tom St Denis 2016-10-26  1549  #define mmDCP0_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x1A18
de2bdb3dcf92280 Tom St Denis 2016-10-26  1550  #define mmDCP0_GRPH_SURFACE_ADDRESS_INUSE 0x1A13
de2bdb3dcf92280 Tom St Denis 2016-10-26  1551  #define mmDCP0_GRPH_SURFACE_OFFSET_X 0x1A09
de2bdb3dcf92280 Tom St Denis 2016-10-26  1552  #define mmDCP0_GRPH_SURFACE_OFFSET_Y 0x1A0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1553  #define mmDCP0_GRPH_SWAP_CNTL 0x1A03
de2bdb3dcf92280 Tom St Denis 2016-10-26  1554  #define mmDCP0_GRPH_UPDATE 0x1A11
de2bdb3dcf92280 Tom St Denis 2016-10-26  1555  #define mmDCP0_GRPH_X_END 0x1A0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1556  #define mmDCP0_GRPH_X_START 0x1A0B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1557  #define mmDCP0_GRPH_Y_END 0x1A0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1558  #define mmDCP0_GRPH_Y_START 0x1A0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1559  #define mmDCP0_INPUT_CSC_C11_C12 0x1A36
de2bdb3dcf92280 Tom St Denis 2016-10-26  1560  #define mmDCP0_INPUT_CSC_C13_C14 0x1A37
de2bdb3dcf92280 Tom St Denis 2016-10-26  1561  #define mmDCP0_INPUT_CSC_C21_C22 0x1A38
de2bdb3dcf92280 Tom St Denis 2016-10-26  1562  #define mmDCP0_INPUT_CSC_C23_C24 0x1A39
de2bdb3dcf92280 Tom St Denis 2016-10-26  1563  #define mmDCP0_INPUT_CSC_C31_C32 0x1A3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1564  #define mmDCP0_INPUT_CSC_C33_C34 0x1A3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1565  #define mmDCP0_INPUT_CSC_CONTROL 0x1A35
de2bdb3dcf92280 Tom St Denis 2016-10-26  1566  #define mmDCP0_INPUT_GAMMA_CONTROL 0x1A10
de2bdb3dcf92280 Tom St Denis 2016-10-26  1567  #define mmDCP0_KEY_CONTROL 0x1A53
de2bdb3dcf92280 Tom St Denis 2016-10-26  1568  #define mmDCP0_KEY_RANGE_ALPHA 0x1A54
de2bdb3dcf92280 Tom St Denis 2016-10-26  1569  #define mmDCP0_KEY_RANGE_BLUE 0x1A57
de2bdb3dcf92280 Tom St Denis 2016-10-26  1570  #define mmDCP0_KEY_RANGE_GREEN 0x1A56
de2bdb3dcf92280 Tom St Denis 2016-10-26  1571  #define mmDCP0_KEY_RANGE_RED 0x1A55
de2bdb3dcf92280 Tom St Denis 2016-10-26  1572  #define mmDCP0_OUTPUT_CSC_C11_C12 0x1A3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1573  #define mmDCP0_OUTPUT_CSC_C13_C14 0x1A3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1574  #define mmDCP0_OUTPUT_CSC_C21_C22 0x1A3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1575  #define mmDCP0_OUTPUT_CSC_C23_C24 0x1A40
de2bdb3dcf92280 Tom St Denis 2016-10-26  1576  #define mmDCP0_OUTPUT_CSC_C31_C32 0x1A41
de2bdb3dcf92280 Tom St Denis 2016-10-26  1577  #define mmDCP0_OUTPUT_CSC_C33_C34 0x1A42
de2bdb3dcf92280 Tom St Denis 2016-10-26  1578  #define mmDCP0_OUTPUT_CSC_CONTROL 0x1A3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1579  #define mmDCP0_OUT_ROUND_CONTROL 0x1A51
de2bdb3dcf92280 Tom St Denis 2016-10-26  1580  #define mmDCP0_OVL_CONTROL1 0x1A1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1581  #define mmDCP0_OVL_CONTROL2 0x1A1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1582  #define mmDCP0_OVL_DFQ_CONTROL 0x1A29
de2bdb3dcf92280 Tom St Denis 2016-10-26  1583  #define mmDCP0_OVL_DFQ_STATUS 0x1A2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1584  #define mmDCP0_OVL_ENABLE 0x1A1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1585  #define mmDCP0_OVL_END 0x1A26
de2bdb3dcf92280 Tom St Denis 2016-10-26  1586  #define mmDCP0_OVL_PITCH 0x1A21
de2bdb3dcf92280 Tom St Denis 2016-10-26  1587  #define mmDCP0_OVLSCL_EDGE_PIXEL_CNTL 0x1A2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1588  #define mmDCP0_OVL_SECONDARY_SURFACE_ADDRESS 0x1A92
de2bdb3dcf92280 Tom St Denis 2016-10-26  1589  #define mmDCP0_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x1A94
de2bdb3dcf92280 Tom St Denis 2016-10-26  1590  #define mmDCP0_OVL_START 0x1A25
de2bdb3dcf92280 Tom St Denis 2016-10-26  1591  #define mmDCP0_OVL_STEREOSYNC_FLIP 0x1A93
de2bdb3dcf92280 Tom St Denis 2016-10-26  1592  #define mmDCP0_OVL_SURFACE_ADDRESS 0x1A20
de2bdb3dcf92280 Tom St Denis 2016-10-26  1593  #define mmDCP0_OVL_SURFACE_ADDRESS_HIGH 0x1A22
de2bdb3dcf92280 Tom St Denis 2016-10-26  1594  #define mmDCP0_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x1A2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1595  #define mmDCP0_OVL_SURFACE_ADDRESS_INUSE 0x1A28
de2bdb3dcf92280 Tom St Denis 2016-10-26  1596  #define mmDCP0_OVL_SURFACE_OFFSET_X 0x1A23
de2bdb3dcf92280 Tom St Denis 2016-10-26  1597  #define mmDCP0_OVL_SURFACE_OFFSET_Y 0x1A24
de2bdb3dcf92280 Tom St Denis 2016-10-26  1598  #define mmDCP0_OVL_SWAP_CNTL 0x1A1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1599  #define mmDCP0_OVL_UPDATE 0x1A27
de2bdb3dcf92280 Tom St Denis 2016-10-26  1600  #define mmDCP0_PRESCALE_GRPH_CONTROL 0x1A2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1601  #define mmDCP0_PRESCALE_OVL_CONTROL 0x1A31
de2bdb3dcf92280 Tom St Denis 2016-10-26  1602  #define mmDCP0_PRESCALE_VALUES_GRPH_B 0x1A30
de2bdb3dcf92280 Tom St Denis 2016-10-26  1603  #define mmDCP0_PRESCALE_VALUES_GRPH_G 0x1A2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1604  #define mmDCP0_PRESCALE_VALUES_GRPH_R 0x1A2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1605  #define mmDCP0_PRESCALE_VALUES_OVL_CB 0x1A32
de2bdb3dcf92280 Tom St Denis 2016-10-26  1606  #define mmDCP0_PRESCALE_VALUES_OVL_CR 0x1A34
de2bdb3dcf92280 Tom St Denis 2016-10-26  1607  #define mmDCP0_PRESCALE_VALUES_OVL_Y 0x1A33
de2bdb3dcf92280 Tom St Denis 2016-10-26  1608  #define mmDCP0_REGAMMA_CNTLA_END_CNTL1 0x1AA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1609  #define mmDCP0_REGAMMA_CNTLA_END_CNTL2 0x1AA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1610  #define mmDCP0_REGAMMA_CNTLA_REGION_0_1 0x1AA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1611  #define mmDCP0_REGAMMA_CNTLA_REGION_10_11 0x1AAD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1612  #define mmDCP0_REGAMMA_CNTLA_REGION_12_13 0x1AAE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1613  #define mmDCP0_REGAMMA_CNTLA_REGION_14_15 0x1AAF
de2bdb3dcf92280 Tom St Denis 2016-10-26  1614  #define mmDCP0_REGAMMA_CNTLA_REGION_2_3 0x1AA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1615  #define mmDCP0_REGAMMA_CNTLA_REGION_4_5 0x1AAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1616  #define mmDCP0_REGAMMA_CNTLA_REGION_6_7 0x1AAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1617  #define mmDCP0_REGAMMA_CNTLA_REGION_8_9 0x1AAC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1618  #define mmDCP0_REGAMMA_CNTLA_SLOPE_CNTL 0x1AA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1619  #define mmDCP0_REGAMMA_CNTLA_START_CNTL 0x1AA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1620  #define mmDCP0_REGAMMA_CNTLB_END_CNTL1 0x1AB2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1621  #define mmDCP0_REGAMMA_CNTLB_END_CNTL2 0x1AB3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1622  #define mmDCP0_REGAMMA_CNTLB_REGION_0_1 0x1AB4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1623  #define mmDCP0_REGAMMA_CNTLB_REGION_10_11 0x1AB9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1624  #define mmDCP0_REGAMMA_CNTLB_REGION_12_13 0x1ABA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1625  #define mmDCP0_REGAMMA_CNTLB_REGION_14_15 0x1ABB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1626  #define mmDCP0_REGAMMA_CNTLB_REGION_2_3 0x1AB5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1627  #define mmDCP0_REGAMMA_CNTLB_REGION_4_5 0x1AB6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1628  #define mmDCP0_REGAMMA_CNTLB_REGION_6_7 0x1AB7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1629  #define mmDCP0_REGAMMA_CNTLB_REGION_8_9 0x1AB8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1630  #define mmDCP0_REGAMMA_CNTLB_SLOPE_CNTL 0x1AB1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1631  #define mmDCP0_REGAMMA_CNTLB_START_CNTL 0x1AB0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1632  #define mmDCP0_REGAMMA_CONTROL 0x1AA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1633  #define mmDCP0_REGAMMA_LUT_DATA 0x1AA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1634  #define mmDCP0_REGAMMA_LUT_INDEX 0x1AA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1635  #define mmDCP0_REGAMMA_LUT_WRITE_EN_MASK 0x1AA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1636  #define mmDCP1_COMM_MATRIXA_TRANS_C11_C12 0x1D43
de2bdb3dcf92280 Tom St Denis 2016-10-26  1637  #define mmDCP1_COMM_MATRIXA_TRANS_C13_C14 0x1D44
de2bdb3dcf92280 Tom St Denis 2016-10-26  1638  #define mmDCP1_COMM_MATRIXA_TRANS_C21_C22 0x1D45
de2bdb3dcf92280 Tom St Denis 2016-10-26  1639  #define mmDCP1_COMM_MATRIXA_TRANS_C23_C24 0x1D46
de2bdb3dcf92280 Tom St Denis 2016-10-26  1640  #define mmDCP1_COMM_MATRIXA_TRANS_C31_C32 0x1D47
de2bdb3dcf92280 Tom St Denis 2016-10-26  1641  #define mmDCP1_COMM_MATRIXA_TRANS_C33_C34 0x1D48
de2bdb3dcf92280 Tom St Denis 2016-10-26  1642  #define mmDCP1_COMM_MATRIXB_TRANS_C11_C12 0x1D49
de2bdb3dcf92280 Tom St Denis 2016-10-26  1643  #define mmDCP1_COMM_MATRIXB_TRANS_C13_C14 0x1D4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1644  #define mmDCP1_COMM_MATRIXB_TRANS_C21_C22 0x1D4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1645  #define mmDCP1_COMM_MATRIXB_TRANS_C23_C24 0x1D4C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1646  #define mmDCP1_COMM_MATRIXB_TRANS_C31_C32 0x1D4D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1647  #define mmDCP1_COMM_MATRIXB_TRANS_C33_C34 0x1D4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1648  #define mmDCP1_CUR_COLOR1 0x1D6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1649  #define mmDCP1_CUR_COLOR2 0x1D6D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1650  #define mmDCP1_CUR_CONTROL 0x1D66
de2bdb3dcf92280 Tom St Denis 2016-10-26  1651  #define mmDCP1_CUR_HOT_SPOT 0x1D6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1652  #define mmDCP1_CUR_POSITION 0x1D6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1653  #define mmDCP1_CUR_REQUEST_FILTER_CNTL 0x1D99
de2bdb3dcf92280 Tom St Denis 2016-10-26  1654  #define mmDCP1_CUR_SIZE 0x1D68
de2bdb3dcf92280 Tom St Denis 2016-10-26  1655  #define mmDCP1_CUR_SURFACE_ADDRESS 0x1D67
de2bdb3dcf92280 Tom St Denis 2016-10-26  1656  #define mmDCP1_CUR_SURFACE_ADDRESS_HIGH 0x1D69
de2bdb3dcf92280 Tom St Denis 2016-10-26  1657  #define mmDCP1_CUR_UPDATE 0x1D6E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1658  #define mmDCP1_DC_LUT_30_COLOR 0x1D7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1659  #define mmDCP1_DC_LUT_AUTOFILL 0x1D7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1660  #define mmDCP1_DC_LUT_BLACK_OFFSET_BLUE 0x1D81
de2bdb3dcf92280 Tom St Denis 2016-10-26  1661  #define mmDCP1_DC_LUT_BLACK_OFFSET_GREEN 0x1D82
de2bdb3dcf92280 Tom St Denis 2016-10-26  1662  #define mmDCP1_DC_LUT_BLACK_OFFSET_RED 0x1D83
de2bdb3dcf92280 Tom St Denis 2016-10-26  1663  #define mmDCP1_DC_LUT_CONTROL 0x1D80
de2bdb3dcf92280 Tom St Denis 2016-10-26  1664  #define mmDCP1_DC_LUT_PWL_DATA 0x1D7B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1665  #define mmDCP1_DC_LUT_RW_INDEX 0x1D79
de2bdb3dcf92280 Tom St Denis 2016-10-26  1666  #define mmDCP1_DC_LUT_RW_MODE 0x1D78
de2bdb3dcf92280 Tom St Denis 2016-10-26  1667  #define mmDCP1_DC_LUT_SEQ_COLOR 0x1D7A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1668  #define mmDCP1_DC_LUT_VGA_ACCESS_ENABLE 0x1D7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1669  #define mmDCP1_DC_LUT_WHITE_OFFSET_BLUE 0x1D84
de2bdb3dcf92280 Tom St Denis 2016-10-26  1670  #define mmDCP1_DC_LUT_WHITE_OFFSET_GREEN 0x1D85
de2bdb3dcf92280 Tom St Denis 2016-10-26  1671  #define mmDCP1_DC_LUT_WHITE_OFFSET_RED 0x1D86
de2bdb3dcf92280 Tom St Denis 2016-10-26  1672  #define mmDCP1_DC_LUT_WRITE_EN_MASK 0x1D7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1673  #define mmDCP1_DCP_CRC_CONTROL 0x1D87
de2bdb3dcf92280 Tom St Denis 2016-10-26  1674  #define mmDCP1_DCP_CRC_CURRENT 0x1D89
de2bdb3dcf92280 Tom St Denis 2016-10-26  1675  #define mmDCP1_DCP_CRC_LAST 0x1D8B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1676  #define mmDCP1_DCP_CRC_MASK 0x1D88
de2bdb3dcf92280 Tom St Denis 2016-10-26  1677  #define mmDCP1_DCP_DEBUG 0x1D8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1678  #define mmDCP1_DCP_DEBUG2 0x1D98
de2bdb3dcf92280 Tom St Denis 2016-10-26  1679  #define mmDCP1_DCP_FP_CONVERTED_FIELD 0x1D65
de2bdb3dcf92280 Tom St Denis 2016-10-26  1680  #define mmDCP1_DCP_GSL_CONTROL 0x1D90
de2bdb3dcf92280 Tom St Denis 2016-10-26  1681  #define mmDCP1_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x1D91
de2bdb3dcf92280 Tom St Denis 2016-10-26  1682  #define mmDCP1_DCP_RANDOM_SEEDS 0x1D61
de2bdb3dcf92280 Tom St Denis 2016-10-26  1683  #define mmDCP1_DCP_SPATIAL_DITHER_CNTL 0x1D60
de2bdb3dcf92280 Tom St Denis 2016-10-26  1684  #define mmDCP1_DCP_TEST_DEBUG_DATA 0x1D96
de2bdb3dcf92280 Tom St Denis 2016-10-26  1685  #define mmDCP1_DCP_TEST_DEBUG_INDEX 0x1D95
de2bdb3dcf92280 Tom St Denis 2016-10-26  1686  #define mmDCP1_DEGAMMA_CONTROL 0x1D58
de2bdb3dcf92280 Tom St Denis 2016-10-26  1687  #define mmDCP1_DENORM_CONTROL 0x1D50
de2bdb3dcf92280 Tom St Denis 2016-10-26  1688  #define mmDCP1_GAMUT_REMAP_C11_C12 0x1D5A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1689  #define mmDCP1_GAMUT_REMAP_C13_C14 0x1D5B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1690  #define mmDCP1_GAMUT_REMAP_C21_C22 0x1D5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1691  #define mmDCP1_GAMUT_REMAP_C23_C24 0x1D5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1692  #define mmDCP1_GAMUT_REMAP_C31_C32 0x1D5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1693  #define mmDCP1_GAMUT_REMAP_C33_C34 0x1D5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1694  #define mmDCP1_GAMUT_REMAP_CONTROL 0x1D59
de2bdb3dcf92280 Tom St Denis 2016-10-26  1695  #define mmDCP1_GRPH_COMPRESS_PITCH 0x1D1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1696  #define mmDCP1_GRPH_COMPRESS_SURFACE_ADDRESS 0x1D19
de2bdb3dcf92280 Tom St Denis 2016-10-26  1697  #define mmDCP1_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x1D1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1698  #define mmDCP1_GRPH_CONTROL 0x1D01
de2bdb3dcf92280 Tom St Denis 2016-10-26  1699  #define mmDCP1_GRPH_DFQ_CONTROL 0x1D14
de2bdb3dcf92280 Tom St Denis 2016-10-26  1700  #define mmDCP1_GRPH_DFQ_STATUS 0x1D15
de2bdb3dcf92280 Tom St Denis 2016-10-26  1701  #define mmDCP1_GRPH_ENABLE 0x1D00
de2bdb3dcf92280 Tom St Denis 2016-10-26  1702  #define mmDCP1_GRPH_FLIP_CONTROL 0x1D12
de2bdb3dcf92280 Tom St Denis 2016-10-26  1703  #define mmDCP1_GRPH_INTERRUPT_CONTROL 0x1D17
de2bdb3dcf92280 Tom St Denis 2016-10-26  1704  #define mmDCP1_GRPH_INTERRUPT_STATUS 0x1D16
de2bdb3dcf92280 Tom St Denis 2016-10-26  1705  #define mmDCP1_GRPH_LUT_10BIT_BYPASS 0x1D02
de2bdb3dcf92280 Tom St Denis 2016-10-26  1706  #define mmDCP1_GRPH_PITCH 0x1D06
de2bdb3dcf92280 Tom St Denis 2016-10-26  1707  #define mmDCP1_GRPH_PRIMARY_SURFACE_ADDRESS 0x1D04
de2bdb3dcf92280 Tom St Denis 2016-10-26  1708  #define mmDCP1_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x1D07
de2bdb3dcf92280 Tom St Denis 2016-10-26  1709  #define mmDCP1_GRPH_SECONDARY_SURFACE_ADDRESS 0x1D05
de2bdb3dcf92280 Tom St Denis 2016-10-26  1710  #define mmDCP1_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x1D08
de2bdb3dcf92280 Tom St Denis 2016-10-26  1711  #define mmDCP1_GRPH_STEREOSYNC_FLIP 0x1D97
de2bdb3dcf92280 Tom St Denis 2016-10-26  1712  #define mmDCP1_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x1D18
de2bdb3dcf92280 Tom St Denis 2016-10-26  1713  #define mmDCP1_GRPH_SURFACE_ADDRESS_INUSE 0x1D13
de2bdb3dcf92280 Tom St Denis 2016-10-26  1714  #define mmDCP1_GRPH_SURFACE_OFFSET_X 0x1D09
de2bdb3dcf92280 Tom St Denis 2016-10-26  1715  #define mmDCP1_GRPH_SURFACE_OFFSET_Y 0x1D0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1716  #define mmDCP1_GRPH_SWAP_CNTL 0x1D03
de2bdb3dcf92280 Tom St Denis 2016-10-26  1717  #define mmDCP1_GRPH_UPDATE 0x1D11
de2bdb3dcf92280 Tom St Denis 2016-10-26  1718  #define mmDCP1_GRPH_X_END 0x1D0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1719  #define mmDCP1_GRPH_X_START 0x1D0B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1720  #define mmDCP1_GRPH_Y_END 0x1D0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1721  #define mmDCP1_GRPH_Y_START 0x1D0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1722  #define mmDCP1_INPUT_CSC_C11_C12 0x1D36
de2bdb3dcf92280 Tom St Denis 2016-10-26  1723  #define mmDCP1_INPUT_CSC_C13_C14 0x1D37
de2bdb3dcf92280 Tom St Denis 2016-10-26  1724  #define mmDCP1_INPUT_CSC_C21_C22 0x1D38
de2bdb3dcf92280 Tom St Denis 2016-10-26  1725  #define mmDCP1_INPUT_CSC_C23_C24 0x1D39
de2bdb3dcf92280 Tom St Denis 2016-10-26  1726  #define mmDCP1_INPUT_CSC_C31_C32 0x1D3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1727  #define mmDCP1_INPUT_CSC_C33_C34 0x1D3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1728  #define mmDCP1_INPUT_CSC_CONTROL 0x1D35
de2bdb3dcf92280 Tom St Denis 2016-10-26  1729  #define mmDCP1_INPUT_GAMMA_CONTROL 0x1D10
de2bdb3dcf92280 Tom St Denis 2016-10-26  1730  #define mmDCP1_KEY_CONTROL 0x1D53
de2bdb3dcf92280 Tom St Denis 2016-10-26  1731  #define mmDCP1_KEY_RANGE_ALPHA 0x1D54
de2bdb3dcf92280 Tom St Denis 2016-10-26  1732  #define mmDCP1_KEY_RANGE_BLUE 0x1D57
de2bdb3dcf92280 Tom St Denis 2016-10-26  1733  #define mmDCP1_KEY_RANGE_GREEN 0x1D56
de2bdb3dcf92280 Tom St Denis 2016-10-26  1734  #define mmDCP1_KEY_RANGE_RED 0x1D55
de2bdb3dcf92280 Tom St Denis 2016-10-26  1735  #define mmDCP1_OUTPUT_CSC_C11_C12 0x1D3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1736  #define mmDCP1_OUTPUT_CSC_C13_C14 0x1D3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1737  #define mmDCP1_OUTPUT_CSC_C21_C22 0x1D3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1738  #define mmDCP1_OUTPUT_CSC_C23_C24 0x1D40
de2bdb3dcf92280 Tom St Denis 2016-10-26  1739  #define mmDCP1_OUTPUT_CSC_C31_C32 0x1D41
de2bdb3dcf92280 Tom St Denis 2016-10-26  1740  #define mmDCP1_OUTPUT_CSC_C33_C34 0x1D42
de2bdb3dcf92280 Tom St Denis 2016-10-26  1741  #define mmDCP1_OUTPUT_CSC_CONTROL 0x1D3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1742  #define mmDCP1_OUT_ROUND_CONTROL 0x1D51
de2bdb3dcf92280 Tom St Denis 2016-10-26  1743  #define mmDCP1_OVL_CONTROL1 0x1D1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1744  #define mmDCP1_OVL_CONTROL2 0x1D1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1745  #define mmDCP1_OVL_DFQ_CONTROL 0x1D29
de2bdb3dcf92280 Tom St Denis 2016-10-26  1746  #define mmDCP1_OVL_DFQ_STATUS 0x1D2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1747  #define mmDCP1_OVL_ENABLE 0x1D1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1748  #define mmDCP1_OVL_END 0x1D26
de2bdb3dcf92280 Tom St Denis 2016-10-26  1749  #define mmDCP1_OVL_PITCH 0x1D21
de2bdb3dcf92280 Tom St Denis 2016-10-26  1750  #define mmDCP1_OVLSCL_EDGE_PIXEL_CNTL 0x1D2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1751  #define mmDCP1_OVL_SECONDARY_SURFACE_ADDRESS 0x1D92
de2bdb3dcf92280 Tom St Denis 2016-10-26  1752  #define mmDCP1_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x1D94
de2bdb3dcf92280 Tom St Denis 2016-10-26  1753  #define mmDCP1_OVL_START 0x1D25
de2bdb3dcf92280 Tom St Denis 2016-10-26  1754  #define mmDCP1_OVL_STEREOSYNC_FLIP 0x1D93
de2bdb3dcf92280 Tom St Denis 2016-10-26  1755  #define mmDCP1_OVL_SURFACE_ADDRESS 0x1D20
de2bdb3dcf92280 Tom St Denis 2016-10-26  1756  #define mmDCP1_OVL_SURFACE_ADDRESS_HIGH 0x1D22
de2bdb3dcf92280 Tom St Denis 2016-10-26  1757  #define mmDCP1_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x1D2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1758  #define mmDCP1_OVL_SURFACE_ADDRESS_INUSE 0x1D28
de2bdb3dcf92280 Tom St Denis 2016-10-26  1759  #define mmDCP1_OVL_SURFACE_OFFSET_X 0x1D23
de2bdb3dcf92280 Tom St Denis 2016-10-26  1760  #define mmDCP1_OVL_SURFACE_OFFSET_Y 0x1D24
de2bdb3dcf92280 Tom St Denis 2016-10-26  1761  #define mmDCP1_OVL_SWAP_CNTL 0x1D1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1762  #define mmDCP1_OVL_UPDATE 0x1D27
de2bdb3dcf92280 Tom St Denis 2016-10-26  1763  #define mmDCP1_PRESCALE_GRPH_CONTROL 0x1D2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1764  #define mmDCP1_PRESCALE_OVL_CONTROL 0x1D31
de2bdb3dcf92280 Tom St Denis 2016-10-26  1765  #define mmDCP1_PRESCALE_VALUES_GRPH_B 0x1D30
de2bdb3dcf92280 Tom St Denis 2016-10-26  1766  #define mmDCP1_PRESCALE_VALUES_GRPH_G 0x1D2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1767  #define mmDCP1_PRESCALE_VALUES_GRPH_R 0x1D2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1768  #define mmDCP1_PRESCALE_VALUES_OVL_CB 0x1D32
de2bdb3dcf92280 Tom St Denis 2016-10-26  1769  #define mmDCP1_PRESCALE_VALUES_OVL_CR 0x1D34
de2bdb3dcf92280 Tom St Denis 2016-10-26  1770  #define mmDCP1_PRESCALE_VALUES_OVL_Y 0x1D33
de2bdb3dcf92280 Tom St Denis 2016-10-26  1771  #define mmDCP1_REGAMMA_CNTLA_END_CNTL1 0x1DA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1772  #define mmDCP1_REGAMMA_CNTLA_END_CNTL2 0x1DA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1773  #define mmDCP1_REGAMMA_CNTLA_REGION_0_1 0x1DA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1774  #define mmDCP1_REGAMMA_CNTLA_REGION_10_11 0x1DAD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1775  #define mmDCP1_REGAMMA_CNTLA_REGION_12_13 0x1DAE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1776  #define mmDCP1_REGAMMA_CNTLA_REGION_14_15 0x1DAF
de2bdb3dcf92280 Tom St Denis 2016-10-26  1777  #define mmDCP1_REGAMMA_CNTLA_REGION_2_3 0x1DA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1778  #define mmDCP1_REGAMMA_CNTLA_REGION_4_5 0x1DAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1779  #define mmDCP1_REGAMMA_CNTLA_REGION_6_7 0x1DAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1780  #define mmDCP1_REGAMMA_CNTLA_REGION_8_9 0x1DAC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1781  #define mmDCP1_REGAMMA_CNTLA_SLOPE_CNTL 0x1DA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1782  #define mmDCP1_REGAMMA_CNTLA_START_CNTL 0x1DA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1783  #define mmDCP1_REGAMMA_CNTLB_END_CNTL1 0x1DB2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1784  #define mmDCP1_REGAMMA_CNTLB_END_CNTL2 0x1DB3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1785  #define mmDCP1_REGAMMA_CNTLB_REGION_0_1 0x1DB4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1786  #define mmDCP1_REGAMMA_CNTLB_REGION_10_11 0x1DB9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1787  #define mmDCP1_REGAMMA_CNTLB_REGION_12_13 0x1DBA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1788  #define mmDCP1_REGAMMA_CNTLB_REGION_14_15 0x1DBB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1789  #define mmDCP1_REGAMMA_CNTLB_REGION_2_3 0x1DB5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1790  #define mmDCP1_REGAMMA_CNTLB_REGION_4_5 0x1DB6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1791  #define mmDCP1_REGAMMA_CNTLB_REGION_6_7 0x1DB7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1792  #define mmDCP1_REGAMMA_CNTLB_REGION_8_9 0x1DB8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1793  #define mmDCP1_REGAMMA_CNTLB_SLOPE_CNTL 0x1DB1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1794  #define mmDCP1_REGAMMA_CNTLB_START_CNTL 0x1DB0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1795  #define mmDCP1_REGAMMA_CONTROL 0x1DA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1796  #define mmDCP1_REGAMMA_LUT_DATA 0x1DA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1797  #define mmDCP1_REGAMMA_LUT_INDEX 0x1DA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1798  #define mmDCP1_REGAMMA_LUT_WRITE_EN_MASK 0x1DA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1799  #define mmDCP2_COMM_MATRIXA_TRANS_C11_C12 0x4043
de2bdb3dcf92280 Tom St Denis 2016-10-26  1800  #define mmDCP2_COMM_MATRIXA_TRANS_C13_C14 0x4044
de2bdb3dcf92280 Tom St Denis 2016-10-26  1801  #define mmDCP2_COMM_MATRIXA_TRANS_C21_C22 0x4045
de2bdb3dcf92280 Tom St Denis 2016-10-26  1802  #define mmDCP2_COMM_MATRIXA_TRANS_C23_C24 0x4046
de2bdb3dcf92280 Tom St Denis 2016-10-26  1803  #define mmDCP2_COMM_MATRIXA_TRANS_C31_C32 0x4047
de2bdb3dcf92280 Tom St Denis 2016-10-26  1804  #define mmDCP2_COMM_MATRIXA_TRANS_C33_C34 0x4048
de2bdb3dcf92280 Tom St Denis 2016-10-26  1805  #define mmDCP2_COMM_MATRIXB_TRANS_C11_C12 0x4049
de2bdb3dcf92280 Tom St Denis 2016-10-26  1806  #define mmDCP2_COMM_MATRIXB_TRANS_C13_C14 0x404A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1807  #define mmDCP2_COMM_MATRIXB_TRANS_C21_C22 0x404B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1808  #define mmDCP2_COMM_MATRIXB_TRANS_C23_C24 0x404C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1809  #define mmDCP2_COMM_MATRIXB_TRANS_C31_C32 0x404D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1810  #define mmDCP2_COMM_MATRIXB_TRANS_C33_C34 0x404E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1811  #define mmDCP2_CUR_COLOR1 0x406C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1812  #define mmDCP2_CUR_COLOR2 0x406D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1813  #define mmDCP2_CUR_CONTROL 0x4066
de2bdb3dcf92280 Tom St Denis 2016-10-26  1814  #define mmDCP2_CUR_HOT_SPOT 0x406B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1815  #define mmDCP2_CUR_POSITION 0x406A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1816  #define mmDCP2_CUR_REQUEST_FILTER_CNTL 0x4099
de2bdb3dcf92280 Tom St Denis 2016-10-26  1817  #define mmDCP2_CUR_SIZE 0x4068
de2bdb3dcf92280 Tom St Denis 2016-10-26  1818  #define mmDCP2_CUR_SURFACE_ADDRESS 0x4067
de2bdb3dcf92280 Tom St Denis 2016-10-26  1819  #define mmDCP2_CUR_SURFACE_ADDRESS_HIGH 0x4069
de2bdb3dcf92280 Tom St Denis 2016-10-26  1820  #define mmDCP2_CUR_UPDATE 0x406E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1821  #define mmDCP2_DC_LUT_30_COLOR 0x407C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1822  #define mmDCP2_DC_LUT_AUTOFILL 0x407F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1823  #define mmDCP2_DC_LUT_BLACK_OFFSET_BLUE 0x4081
de2bdb3dcf92280 Tom St Denis 2016-10-26  1824  #define mmDCP2_DC_LUT_BLACK_OFFSET_GREEN 0x4082
de2bdb3dcf92280 Tom St Denis 2016-10-26  1825  #define mmDCP2_DC_LUT_BLACK_OFFSET_RED 0x4083
de2bdb3dcf92280 Tom St Denis 2016-10-26  1826  #define mmDCP2_DC_LUT_CONTROL 0x4080
de2bdb3dcf92280 Tom St Denis 2016-10-26  1827  #define mmDCP2_DC_LUT_PWL_DATA 0x407B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1828  #define mmDCP2_DC_LUT_RW_INDEX 0x4079
de2bdb3dcf92280 Tom St Denis 2016-10-26  1829  #define mmDCP2_DC_LUT_RW_MODE 0x4078
de2bdb3dcf92280 Tom St Denis 2016-10-26  1830  #define mmDCP2_DC_LUT_SEQ_COLOR 0x407A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1831  #define mmDCP2_DC_LUT_VGA_ACCESS_ENABLE 0x407D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1832  #define mmDCP2_DC_LUT_WHITE_OFFSET_BLUE 0x4084
de2bdb3dcf92280 Tom St Denis 2016-10-26  1833  #define mmDCP2_DC_LUT_WHITE_OFFSET_GREEN 0x4085
de2bdb3dcf92280 Tom St Denis 2016-10-26  1834  #define mmDCP2_DC_LUT_WHITE_OFFSET_RED 0x4086
de2bdb3dcf92280 Tom St Denis 2016-10-26  1835  #define mmDCP2_DC_LUT_WRITE_EN_MASK 0x407E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1836  #define mmDCP2_DCP_CRC_CONTROL 0x4087
de2bdb3dcf92280 Tom St Denis 2016-10-26  1837  #define mmDCP2_DCP_CRC_CURRENT 0x4089
de2bdb3dcf92280 Tom St Denis 2016-10-26  1838  #define mmDCP2_DCP_CRC_LAST 0x408B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1839  #define mmDCP2_DCP_CRC_MASK 0x4088
de2bdb3dcf92280 Tom St Denis 2016-10-26  1840  #define mmDCP2_DCP_DEBUG 0x408D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1841  #define mmDCP2_DCP_DEBUG2 0x4098
de2bdb3dcf92280 Tom St Denis 2016-10-26  1842  #define mmDCP2_DCP_FP_CONVERTED_FIELD 0x4065
de2bdb3dcf92280 Tom St Denis 2016-10-26  1843  #define mmDCP2_DCP_GSL_CONTROL 0x4090
de2bdb3dcf92280 Tom St Denis 2016-10-26  1844  #define mmDCP2_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x4091
de2bdb3dcf92280 Tom St Denis 2016-10-26  1845  #define mmDCP2_DCP_RANDOM_SEEDS 0x4061
de2bdb3dcf92280 Tom St Denis 2016-10-26  1846  #define mmDCP2_DCP_SPATIAL_DITHER_CNTL 0x4060
de2bdb3dcf92280 Tom St Denis 2016-10-26  1847  #define mmDCP2_DCP_TEST_DEBUG_DATA 0x4096
de2bdb3dcf92280 Tom St Denis 2016-10-26  1848  #define mmDCP2_DCP_TEST_DEBUG_INDEX 0x4095
de2bdb3dcf92280 Tom St Denis 2016-10-26  1849  #define mmDCP2_DEGAMMA_CONTROL 0x4058
de2bdb3dcf92280 Tom St Denis 2016-10-26  1850  #define mmDCP2_DENORM_CONTROL 0x4050
de2bdb3dcf92280 Tom St Denis 2016-10-26  1851  #define mmDCP2_GAMUT_REMAP_C11_C12 0x405A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1852  #define mmDCP2_GAMUT_REMAP_C13_C14 0x405B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1853  #define mmDCP2_GAMUT_REMAP_C21_C22 0x405C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1854  #define mmDCP2_GAMUT_REMAP_C23_C24 0x405D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1855  #define mmDCP2_GAMUT_REMAP_C31_C32 0x405E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1856  #define mmDCP2_GAMUT_REMAP_C33_C34 0x405F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1857  #define mmDCP2_GAMUT_REMAP_CONTROL 0x4059
de2bdb3dcf92280 Tom St Denis 2016-10-26  1858  #define mmDCP2_GRPH_COMPRESS_PITCH 0x401A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1859  #define mmDCP2_GRPH_COMPRESS_SURFACE_ADDRESS 0x4019
de2bdb3dcf92280 Tom St Denis 2016-10-26  1860  #define mmDCP2_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x401B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1861  #define mmDCP2_GRPH_CONTROL 0x4001
de2bdb3dcf92280 Tom St Denis 2016-10-26  1862  #define mmDCP2_GRPH_DFQ_CONTROL 0x4014
de2bdb3dcf92280 Tom St Denis 2016-10-26  1863  #define mmDCP2_GRPH_DFQ_STATUS 0x4015
de2bdb3dcf92280 Tom St Denis 2016-10-26  1864  #define mmDCP2_GRPH_ENABLE 0x4000
de2bdb3dcf92280 Tom St Denis 2016-10-26  1865  #define mmDCP2_GRPH_FLIP_CONTROL 0x4012
de2bdb3dcf92280 Tom St Denis 2016-10-26  1866  #define mmDCP2_GRPH_INTERRUPT_CONTROL 0x4017
de2bdb3dcf92280 Tom St Denis 2016-10-26  1867  #define mmDCP2_GRPH_INTERRUPT_STATUS 0x4016
de2bdb3dcf92280 Tom St Denis 2016-10-26  1868  #define mmDCP2_GRPH_LUT_10BIT_BYPASS 0x4002
de2bdb3dcf92280 Tom St Denis 2016-10-26  1869  #define mmDCP2_GRPH_PITCH 0x4006
de2bdb3dcf92280 Tom St Denis 2016-10-26  1870  #define mmDCP2_GRPH_PRIMARY_SURFACE_ADDRESS 0x4004
de2bdb3dcf92280 Tom St Denis 2016-10-26  1871  #define mmDCP2_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x4007
de2bdb3dcf92280 Tom St Denis 2016-10-26  1872  #define mmDCP2_GRPH_SECONDARY_SURFACE_ADDRESS 0x4005
de2bdb3dcf92280 Tom St Denis 2016-10-26  1873  #define mmDCP2_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x4008
de2bdb3dcf92280 Tom St Denis 2016-10-26  1874  #define mmDCP2_GRPH_STEREOSYNC_FLIP 0x4097
de2bdb3dcf92280 Tom St Denis 2016-10-26  1875  #define mmDCP2_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x4018
de2bdb3dcf92280 Tom St Denis 2016-10-26  1876  #define mmDCP2_GRPH_SURFACE_ADDRESS_INUSE 0x4013
de2bdb3dcf92280 Tom St Denis 2016-10-26  1877  #define mmDCP2_GRPH_SURFACE_OFFSET_X 0x4009
de2bdb3dcf92280 Tom St Denis 2016-10-26  1878  #define mmDCP2_GRPH_SURFACE_OFFSET_Y 0x400A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1879  #define mmDCP2_GRPH_SWAP_CNTL 0x4003
de2bdb3dcf92280 Tom St Denis 2016-10-26  1880  #define mmDCP2_GRPH_UPDATE 0x4011
de2bdb3dcf92280 Tom St Denis 2016-10-26  1881  #define mmDCP2_GRPH_X_END 0x400D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1882  #define mmDCP2_GRPH_X_START 0x400B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1883  #define mmDCP2_GRPH_Y_END 0x400E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1884  #define mmDCP2_GRPH_Y_START 0x400C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1885  #define mmDCP2_INPUT_CSC_C11_C12 0x4036
de2bdb3dcf92280 Tom St Denis 2016-10-26  1886  #define mmDCP2_INPUT_CSC_C13_C14 0x4037
de2bdb3dcf92280 Tom St Denis 2016-10-26  1887  #define mmDCP2_INPUT_CSC_C21_C22 0x4038
de2bdb3dcf92280 Tom St Denis 2016-10-26  1888  #define mmDCP2_INPUT_CSC_C23_C24 0x4039
de2bdb3dcf92280 Tom St Denis 2016-10-26  1889  #define mmDCP2_INPUT_CSC_C31_C32 0x403A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1890  #define mmDCP2_INPUT_CSC_C33_C34 0x403B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1891  #define mmDCP2_INPUT_CSC_CONTROL 0x4035
de2bdb3dcf92280 Tom St Denis 2016-10-26  1892  #define mmDCP2_INPUT_GAMMA_CONTROL 0x4010
de2bdb3dcf92280 Tom St Denis 2016-10-26  1893  #define mmDCP2_KEY_CONTROL 0x4053
de2bdb3dcf92280 Tom St Denis 2016-10-26  1894  #define mmDCP2_KEY_RANGE_ALPHA 0x4054
de2bdb3dcf92280 Tom St Denis 2016-10-26  1895  #define mmDCP2_KEY_RANGE_BLUE 0x4057
de2bdb3dcf92280 Tom St Denis 2016-10-26  1896  #define mmDCP2_KEY_RANGE_GREEN 0x4056
de2bdb3dcf92280 Tom St Denis 2016-10-26  1897  #define mmDCP2_KEY_RANGE_RED 0x4055
de2bdb3dcf92280 Tom St Denis 2016-10-26  1898  #define mmDCP2_OUTPUT_CSC_C11_C12 0x403D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1899  #define mmDCP2_OUTPUT_CSC_C13_C14 0x403E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1900  #define mmDCP2_OUTPUT_CSC_C21_C22 0x403F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1901  #define mmDCP2_OUTPUT_CSC_C23_C24 0x4040
de2bdb3dcf92280 Tom St Denis 2016-10-26  1902  #define mmDCP2_OUTPUT_CSC_C31_C32 0x4041
de2bdb3dcf92280 Tom St Denis 2016-10-26  1903  #define mmDCP2_OUTPUT_CSC_C33_C34 0x4042
de2bdb3dcf92280 Tom St Denis 2016-10-26  1904  #define mmDCP2_OUTPUT_CSC_CONTROL 0x403C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1905  #define mmDCP2_OUT_ROUND_CONTROL 0x4051
de2bdb3dcf92280 Tom St Denis 2016-10-26  1906  #define mmDCP2_OVL_CONTROL1 0x401D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1907  #define mmDCP2_OVL_CONTROL2 0x401E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1908  #define mmDCP2_OVL_DFQ_CONTROL 0x4029
de2bdb3dcf92280 Tom St Denis 2016-10-26  1909  #define mmDCP2_OVL_DFQ_STATUS 0x402A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1910  #define mmDCP2_OVL_ENABLE 0x401C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1911  #define mmDCP2_OVL_END 0x4026
de2bdb3dcf92280 Tom St Denis 2016-10-26  1912  #define mmDCP2_OVL_PITCH 0x4021
de2bdb3dcf92280 Tom St Denis 2016-10-26  1913  #define mmDCP2_OVLSCL_EDGE_PIXEL_CNTL 0x402C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1914  #define mmDCP2_OVL_SECONDARY_SURFACE_ADDRESS 0x4092
de2bdb3dcf92280 Tom St Denis 2016-10-26  1915  #define mmDCP2_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x4094
de2bdb3dcf92280 Tom St Denis 2016-10-26  1916  #define mmDCP2_OVL_START 0x4025
de2bdb3dcf92280 Tom St Denis 2016-10-26  1917  #define mmDCP2_OVL_STEREOSYNC_FLIP 0x4093
de2bdb3dcf92280 Tom St Denis 2016-10-26  1918  #define mmDCP2_OVL_SURFACE_ADDRESS 0x4020
de2bdb3dcf92280 Tom St Denis 2016-10-26  1919  #define mmDCP2_OVL_SURFACE_ADDRESS_HIGH 0x4022
de2bdb3dcf92280 Tom St Denis 2016-10-26  1920  #define mmDCP2_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x402B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1921  #define mmDCP2_OVL_SURFACE_ADDRESS_INUSE 0x4028
de2bdb3dcf92280 Tom St Denis 2016-10-26  1922  #define mmDCP2_OVL_SURFACE_OFFSET_X 0x4023
de2bdb3dcf92280 Tom St Denis 2016-10-26  1923  #define mmDCP2_OVL_SURFACE_OFFSET_Y 0x4024
de2bdb3dcf92280 Tom St Denis 2016-10-26  1924  #define mmDCP2_OVL_SWAP_CNTL 0x401F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1925  #define mmDCP2_OVL_UPDATE 0x4027
de2bdb3dcf92280 Tom St Denis 2016-10-26  1926  #define mmDCP2_PRESCALE_GRPH_CONTROL 0x402D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1927  #define mmDCP2_PRESCALE_OVL_CONTROL 0x4031
de2bdb3dcf92280 Tom St Denis 2016-10-26  1928  #define mmDCP2_PRESCALE_VALUES_GRPH_B 0x4030
de2bdb3dcf92280 Tom St Denis 2016-10-26  1929  #define mmDCP2_PRESCALE_VALUES_GRPH_G 0x402F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1930  #define mmDCP2_PRESCALE_VALUES_GRPH_R 0x402E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1931  #define mmDCP2_PRESCALE_VALUES_OVL_CB 0x4032
de2bdb3dcf92280 Tom St Denis 2016-10-26  1932  #define mmDCP2_PRESCALE_VALUES_OVL_CR 0x4034
de2bdb3dcf92280 Tom St Denis 2016-10-26  1933  #define mmDCP2_PRESCALE_VALUES_OVL_Y 0x4033
de2bdb3dcf92280 Tom St Denis 2016-10-26  1934  #define mmDCP2_REGAMMA_CNTLA_END_CNTL1 0x40A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1935  #define mmDCP2_REGAMMA_CNTLA_END_CNTL2 0x40A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1936  #define mmDCP2_REGAMMA_CNTLA_REGION_0_1 0x40A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1937  #define mmDCP2_REGAMMA_CNTLA_REGION_10_11 0x40AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  1938  #define mmDCP2_REGAMMA_CNTLA_REGION_12_13 0x40AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  1939  #define mmDCP2_REGAMMA_CNTLA_REGION_14_15 0x40AF
de2bdb3dcf92280 Tom St Denis 2016-10-26  1940  #define mmDCP2_REGAMMA_CNTLA_REGION_2_3 0x40A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1941  #define mmDCP2_REGAMMA_CNTLA_REGION_4_5 0x40AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1942  #define mmDCP2_REGAMMA_CNTLA_REGION_6_7 0x40AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1943  #define mmDCP2_REGAMMA_CNTLA_REGION_8_9 0x40AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  1944  #define mmDCP2_REGAMMA_CNTLA_SLOPE_CNTL 0x40A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1945  #define mmDCP2_REGAMMA_CNTLA_START_CNTL 0x40A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1946  #define mmDCP2_REGAMMA_CNTLB_END_CNTL1 0x40B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1947  #define mmDCP2_REGAMMA_CNTLB_END_CNTL2 0x40B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1948  #define mmDCP2_REGAMMA_CNTLB_REGION_0_1 0x40B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  1949  #define mmDCP2_REGAMMA_CNTLB_REGION_10_11 0x40B9
de2bdb3dcf92280 Tom St Denis 2016-10-26  1950  #define mmDCP2_REGAMMA_CNTLB_REGION_12_13 0x40BA
de2bdb3dcf92280 Tom St Denis 2016-10-26  1951  #define mmDCP2_REGAMMA_CNTLB_REGION_14_15 0x40BB
de2bdb3dcf92280 Tom St Denis 2016-10-26  1952  #define mmDCP2_REGAMMA_CNTLB_REGION_2_3 0x40B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  1953  #define mmDCP2_REGAMMA_CNTLB_REGION_4_5 0x40B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  1954  #define mmDCP2_REGAMMA_CNTLB_REGION_6_7 0x40B7
de2bdb3dcf92280 Tom St Denis 2016-10-26  1955  #define mmDCP2_REGAMMA_CNTLB_REGION_8_9 0x40B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  1956  #define mmDCP2_REGAMMA_CNTLB_SLOPE_CNTL 0x40B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1957  #define mmDCP2_REGAMMA_CNTLB_START_CNTL 0x40B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1958  #define mmDCP2_REGAMMA_CONTROL 0x40A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  1959  #define mmDCP2_REGAMMA_LUT_DATA 0x40A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  1960  #define mmDCP2_REGAMMA_LUT_INDEX 0x40A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  1961  #define mmDCP2_REGAMMA_LUT_WRITE_EN_MASK 0x40A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  1962  #define mmDCP3_COMM_MATRIXA_TRANS_C11_C12 0x4343
de2bdb3dcf92280 Tom St Denis 2016-10-26  1963  #define mmDCP3_COMM_MATRIXA_TRANS_C13_C14 0x4344
de2bdb3dcf92280 Tom St Denis 2016-10-26  1964  #define mmDCP3_COMM_MATRIXA_TRANS_C21_C22 0x4345
de2bdb3dcf92280 Tom St Denis 2016-10-26  1965  #define mmDCP3_COMM_MATRIXA_TRANS_C23_C24 0x4346
de2bdb3dcf92280 Tom St Denis 2016-10-26  1966  #define mmDCP3_COMM_MATRIXA_TRANS_C31_C32 0x4347
de2bdb3dcf92280 Tom St Denis 2016-10-26  1967  #define mmDCP3_COMM_MATRIXA_TRANS_C33_C34 0x4348
de2bdb3dcf92280 Tom St Denis 2016-10-26  1968  #define mmDCP3_COMM_MATRIXB_TRANS_C11_C12 0x4349
de2bdb3dcf92280 Tom St Denis 2016-10-26  1969  #define mmDCP3_COMM_MATRIXB_TRANS_C13_C14 0x434A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1970  #define mmDCP3_COMM_MATRIXB_TRANS_C21_C22 0x434B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1971  #define mmDCP3_COMM_MATRIXB_TRANS_C23_C24 0x434C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1972  #define mmDCP3_COMM_MATRIXB_TRANS_C31_C32 0x434D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1973  #define mmDCP3_COMM_MATRIXB_TRANS_C33_C34 0x434E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1974  #define mmDCP3_CUR_COLOR1 0x436C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1975  #define mmDCP3_CUR_COLOR2 0x436D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1976  #define mmDCP3_CUR_CONTROL 0x4366
de2bdb3dcf92280 Tom St Denis 2016-10-26  1977  #define mmDCP3_CUR_HOT_SPOT 0x436B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1978  #define mmDCP3_CUR_POSITION 0x436A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1979  #define mmDCP3_CUR_REQUEST_FILTER_CNTL 0x4399
de2bdb3dcf92280 Tom St Denis 2016-10-26  1980  #define mmDCP3_CUR_SIZE 0x4368
de2bdb3dcf92280 Tom St Denis 2016-10-26  1981  #define mmDCP3_CUR_SURFACE_ADDRESS 0x4367
de2bdb3dcf92280 Tom St Denis 2016-10-26  1982  #define mmDCP3_CUR_SURFACE_ADDRESS_HIGH 0x4369
de2bdb3dcf92280 Tom St Denis 2016-10-26  1983  #define mmDCP3_CUR_UPDATE 0x436E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1984  #define mmDCP3_DC_LUT_30_COLOR 0x437C
de2bdb3dcf92280 Tom St Denis 2016-10-26  1985  #define mmDCP3_DC_LUT_AUTOFILL 0x437F
de2bdb3dcf92280 Tom St Denis 2016-10-26  1986  #define mmDCP3_DC_LUT_BLACK_OFFSET_BLUE 0x4381
de2bdb3dcf92280 Tom St Denis 2016-10-26  1987  #define mmDCP3_DC_LUT_BLACK_OFFSET_GREEN 0x4382
de2bdb3dcf92280 Tom St Denis 2016-10-26  1988  #define mmDCP3_DC_LUT_BLACK_OFFSET_RED 0x4383
de2bdb3dcf92280 Tom St Denis 2016-10-26  1989  #define mmDCP3_DC_LUT_CONTROL 0x4380
de2bdb3dcf92280 Tom St Denis 2016-10-26  1990  #define mmDCP3_DC_LUT_PWL_DATA 0x437B
de2bdb3dcf92280 Tom St Denis 2016-10-26  1991  #define mmDCP3_DC_LUT_RW_INDEX 0x4379
de2bdb3dcf92280 Tom St Denis 2016-10-26  1992  #define mmDCP3_DC_LUT_RW_MODE 0x4378
de2bdb3dcf92280 Tom St Denis 2016-10-26  1993  #define mmDCP3_DC_LUT_SEQ_COLOR 0x437A
de2bdb3dcf92280 Tom St Denis 2016-10-26  1994  #define mmDCP3_DC_LUT_VGA_ACCESS_ENABLE 0x437D
de2bdb3dcf92280 Tom St Denis 2016-10-26  1995  #define mmDCP3_DC_LUT_WHITE_OFFSET_BLUE 0x4384
de2bdb3dcf92280 Tom St Denis 2016-10-26  1996  #define mmDCP3_DC_LUT_WHITE_OFFSET_GREEN 0x4385
de2bdb3dcf92280 Tom St Denis 2016-10-26  1997  #define mmDCP3_DC_LUT_WHITE_OFFSET_RED 0x4386
de2bdb3dcf92280 Tom St Denis 2016-10-26  1998  #define mmDCP3_DC_LUT_WRITE_EN_MASK 0x437E
de2bdb3dcf92280 Tom St Denis 2016-10-26  1999  #define mmDCP3_DCP_CRC_CONTROL 0x4387
de2bdb3dcf92280 Tom St Denis 2016-10-26  2000  #define mmDCP3_DCP_CRC_CURRENT 0x4389
de2bdb3dcf92280 Tom St Denis 2016-10-26  2001  #define mmDCP3_DCP_CRC_LAST 0x438B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2002  #define mmDCP3_DCP_CRC_MASK 0x4388
de2bdb3dcf92280 Tom St Denis 2016-10-26  2003  #define mmDCP3_DCP_DEBUG 0x438D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2004  #define mmDCP3_DCP_DEBUG2 0x4398
de2bdb3dcf92280 Tom St Denis 2016-10-26  2005  #define mmDCP3_DCP_FP_CONVERTED_FIELD 0x4365
de2bdb3dcf92280 Tom St Denis 2016-10-26  2006  #define mmDCP3_DCP_GSL_CONTROL 0x4390
de2bdb3dcf92280 Tom St Denis 2016-10-26  2007  #define mmDCP3_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x4391
de2bdb3dcf92280 Tom St Denis 2016-10-26  2008  #define mmDCP3_DCP_RANDOM_SEEDS 0x4361
de2bdb3dcf92280 Tom St Denis 2016-10-26  2009  #define mmDCP3_DCP_SPATIAL_DITHER_CNTL 0x4360
de2bdb3dcf92280 Tom St Denis 2016-10-26  2010  #define mmDCP3_DCP_TEST_DEBUG_DATA 0x4396
de2bdb3dcf92280 Tom St Denis 2016-10-26  2011  #define mmDCP3_DCP_TEST_DEBUG_INDEX 0x4395
de2bdb3dcf92280 Tom St Denis 2016-10-26  2012  #define mmDCP3_DEGAMMA_CONTROL 0x4358
de2bdb3dcf92280 Tom St Denis 2016-10-26  2013  #define mmDCP3_DENORM_CONTROL 0x4350
de2bdb3dcf92280 Tom St Denis 2016-10-26  2014  #define mmDCP3_GAMUT_REMAP_C11_C12 0x435A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2015  #define mmDCP3_GAMUT_REMAP_C13_C14 0x435B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2016  #define mmDCP3_GAMUT_REMAP_C21_C22 0x435C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2017  #define mmDCP3_GAMUT_REMAP_C23_C24 0x435D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2018  #define mmDCP3_GAMUT_REMAP_C31_C32 0x435E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2019  #define mmDCP3_GAMUT_REMAP_C33_C34 0x435F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2020  #define mmDCP3_GAMUT_REMAP_CONTROL 0x4359
de2bdb3dcf92280 Tom St Denis 2016-10-26  2021  #define mmDCP3_GRPH_COMPRESS_PITCH 0x431A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2022  #define mmDCP3_GRPH_COMPRESS_SURFACE_ADDRESS 0x4319
de2bdb3dcf92280 Tom St Denis 2016-10-26  2023  #define mmDCP3_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x431B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2024  #define mmDCP3_GRPH_CONTROL 0x4301
de2bdb3dcf92280 Tom St Denis 2016-10-26  2025  #define mmDCP3_GRPH_DFQ_CONTROL 0x4314
de2bdb3dcf92280 Tom St Denis 2016-10-26  2026  #define mmDCP3_GRPH_DFQ_STATUS 0x4315
de2bdb3dcf92280 Tom St Denis 2016-10-26  2027  #define mmDCP3_GRPH_ENABLE 0x4300
de2bdb3dcf92280 Tom St Denis 2016-10-26  2028  #define mmDCP3_GRPH_FLIP_CONTROL 0x4312
de2bdb3dcf92280 Tom St Denis 2016-10-26  2029  #define mmDCP3_GRPH_INTERRUPT_CONTROL 0x4317
de2bdb3dcf92280 Tom St Denis 2016-10-26  2030  #define mmDCP3_GRPH_INTERRUPT_STATUS 0x4316
de2bdb3dcf92280 Tom St Denis 2016-10-26  2031  #define mmDCP3_GRPH_LUT_10BIT_BYPASS 0x4302
de2bdb3dcf92280 Tom St Denis 2016-10-26  2032  #define mmDCP3_GRPH_PITCH 0x4306
de2bdb3dcf92280 Tom St Denis 2016-10-26  2033  #define mmDCP3_GRPH_PRIMARY_SURFACE_ADDRESS 0x4304
de2bdb3dcf92280 Tom St Denis 2016-10-26  2034  #define mmDCP3_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x4307
de2bdb3dcf92280 Tom St Denis 2016-10-26  2035  #define mmDCP3_GRPH_SECONDARY_SURFACE_ADDRESS 0x4305
de2bdb3dcf92280 Tom St Denis 2016-10-26  2036  #define mmDCP3_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x4308
de2bdb3dcf92280 Tom St Denis 2016-10-26  2037  #define mmDCP3_GRPH_STEREOSYNC_FLIP 0x4397
de2bdb3dcf92280 Tom St Denis 2016-10-26  2038  #define mmDCP3_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x4318
de2bdb3dcf92280 Tom St Denis 2016-10-26  2039  #define mmDCP3_GRPH_SURFACE_ADDRESS_INUSE 0x4313
de2bdb3dcf92280 Tom St Denis 2016-10-26  2040  #define mmDCP3_GRPH_SURFACE_OFFSET_X 0x4309
de2bdb3dcf92280 Tom St Denis 2016-10-26  2041  #define mmDCP3_GRPH_SURFACE_OFFSET_Y 0x430A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2042  #define mmDCP3_GRPH_SWAP_CNTL 0x4303
de2bdb3dcf92280 Tom St Denis 2016-10-26  2043  #define mmDCP3_GRPH_UPDATE 0x4311
de2bdb3dcf92280 Tom St Denis 2016-10-26  2044  #define mmDCP3_GRPH_X_END 0x430D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2045  #define mmDCP3_GRPH_X_START 0x430B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2046  #define mmDCP3_GRPH_Y_END 0x430E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2047  #define mmDCP3_GRPH_Y_START 0x430C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2048  #define mmDCP3_INPUT_CSC_C11_C12 0x4336
de2bdb3dcf92280 Tom St Denis 2016-10-26  2049  #define mmDCP3_INPUT_CSC_C13_C14 0x4337
de2bdb3dcf92280 Tom St Denis 2016-10-26  2050  #define mmDCP3_INPUT_CSC_C21_C22 0x4338
de2bdb3dcf92280 Tom St Denis 2016-10-26  2051  #define mmDCP3_INPUT_CSC_C23_C24 0x4339
de2bdb3dcf92280 Tom St Denis 2016-10-26  2052  #define mmDCP3_INPUT_CSC_C31_C32 0x433A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2053  #define mmDCP3_INPUT_CSC_C33_C34 0x433B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2054  #define mmDCP3_INPUT_CSC_CONTROL 0x4335
de2bdb3dcf92280 Tom St Denis 2016-10-26  2055  #define mmDCP3_INPUT_GAMMA_CONTROL 0x4310
de2bdb3dcf92280 Tom St Denis 2016-10-26  2056  #define mmDCP3_KEY_CONTROL 0x4353
de2bdb3dcf92280 Tom St Denis 2016-10-26  2057  #define mmDCP3_KEY_RANGE_ALPHA 0x4354
de2bdb3dcf92280 Tom St Denis 2016-10-26  2058  #define mmDCP3_KEY_RANGE_BLUE 0x4357
de2bdb3dcf92280 Tom St Denis 2016-10-26  2059  #define mmDCP3_KEY_RANGE_GREEN 0x4356
de2bdb3dcf92280 Tom St Denis 2016-10-26  2060  #define mmDCP3_KEY_RANGE_RED 0x4355
de2bdb3dcf92280 Tom St Denis 2016-10-26  2061  #define mmDCP3_OUTPUT_CSC_C11_C12 0x433D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2062  #define mmDCP3_OUTPUT_CSC_C13_C14 0x433E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2063  #define mmDCP3_OUTPUT_CSC_C21_C22 0x433F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2064  #define mmDCP3_OUTPUT_CSC_C23_C24 0x4340
de2bdb3dcf92280 Tom St Denis 2016-10-26  2065  #define mmDCP3_OUTPUT_CSC_C31_C32 0x4341
de2bdb3dcf92280 Tom St Denis 2016-10-26  2066  #define mmDCP3_OUTPUT_CSC_C33_C34 0x4342
de2bdb3dcf92280 Tom St Denis 2016-10-26  2067  #define mmDCP3_OUTPUT_CSC_CONTROL 0x433C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2068  #define mmDCP3_OUT_ROUND_CONTROL 0x4351
de2bdb3dcf92280 Tom St Denis 2016-10-26  2069  #define mmDCP3_OVL_CONTROL1 0x431D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2070  #define mmDCP3_OVL_CONTROL2 0x431E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2071  #define mmDCP3_OVL_DFQ_CONTROL 0x4329
de2bdb3dcf92280 Tom St Denis 2016-10-26  2072  #define mmDCP3_OVL_DFQ_STATUS 0x432A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2073  #define mmDCP3_OVL_ENABLE 0x431C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2074  #define mmDCP3_OVL_END 0x4326
de2bdb3dcf92280 Tom St Denis 2016-10-26  2075  #define mmDCP3_OVL_PITCH 0x4321
de2bdb3dcf92280 Tom St Denis 2016-10-26  2076  #define mmDCP3_OVLSCL_EDGE_PIXEL_CNTL 0x432C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2077  #define mmDCP3_OVL_SECONDARY_SURFACE_ADDRESS 0x4392
de2bdb3dcf92280 Tom St Denis 2016-10-26  2078  #define mmDCP3_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x4394
de2bdb3dcf92280 Tom St Denis 2016-10-26  2079  #define mmDCP3_OVL_START 0x4325
de2bdb3dcf92280 Tom St Denis 2016-10-26  2080  #define mmDCP3_OVL_STEREOSYNC_FLIP 0x4393
de2bdb3dcf92280 Tom St Denis 2016-10-26  2081  #define mmDCP3_OVL_SURFACE_ADDRESS 0x4320
de2bdb3dcf92280 Tom St Denis 2016-10-26  2082  #define mmDCP3_OVL_SURFACE_ADDRESS_HIGH 0x4322
de2bdb3dcf92280 Tom St Denis 2016-10-26  2083  #define mmDCP3_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x432B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2084  #define mmDCP3_OVL_SURFACE_ADDRESS_INUSE 0x4328
de2bdb3dcf92280 Tom St Denis 2016-10-26  2085  #define mmDCP3_OVL_SURFACE_OFFSET_X 0x4323
de2bdb3dcf92280 Tom St Denis 2016-10-26  2086  #define mmDCP3_OVL_SURFACE_OFFSET_Y 0x4324
de2bdb3dcf92280 Tom St Denis 2016-10-26  2087  #define mmDCP3_OVL_SWAP_CNTL 0x431F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2088  #define mmDCP3_OVL_UPDATE 0x4327
de2bdb3dcf92280 Tom St Denis 2016-10-26  2089  #define mmDCP3_PRESCALE_GRPH_CONTROL 0x432D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2090  #define mmDCP3_PRESCALE_OVL_CONTROL 0x4331
de2bdb3dcf92280 Tom St Denis 2016-10-26  2091  #define mmDCP3_PRESCALE_VALUES_GRPH_B 0x4330
de2bdb3dcf92280 Tom St Denis 2016-10-26  2092  #define mmDCP3_PRESCALE_VALUES_GRPH_G 0x432F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2093  #define mmDCP3_PRESCALE_VALUES_GRPH_R 0x432E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2094  #define mmDCP3_PRESCALE_VALUES_OVL_CB 0x4332
de2bdb3dcf92280 Tom St Denis 2016-10-26  2095  #define mmDCP3_PRESCALE_VALUES_OVL_CR 0x4334
de2bdb3dcf92280 Tom St Denis 2016-10-26  2096  #define mmDCP3_PRESCALE_VALUES_OVL_Y 0x4333
de2bdb3dcf92280 Tom St Denis 2016-10-26  2097  #define mmDCP3_REGAMMA_CNTLA_END_CNTL1 0x43A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2098  #define mmDCP3_REGAMMA_CNTLA_END_CNTL2 0x43A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2099  #define mmDCP3_REGAMMA_CNTLA_REGION_0_1 0x43A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2100  #define mmDCP3_REGAMMA_CNTLA_REGION_10_11 0x43AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  2101  #define mmDCP3_REGAMMA_CNTLA_REGION_12_13 0x43AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  2102  #define mmDCP3_REGAMMA_CNTLA_REGION_14_15 0x43AF
de2bdb3dcf92280 Tom St Denis 2016-10-26  2103  #define mmDCP3_REGAMMA_CNTLA_REGION_2_3 0x43A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2104  #define mmDCP3_REGAMMA_CNTLA_REGION_4_5 0x43AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2105  #define mmDCP3_REGAMMA_CNTLA_REGION_6_7 0x43AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2106  #define mmDCP3_REGAMMA_CNTLA_REGION_8_9 0x43AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  2107  #define mmDCP3_REGAMMA_CNTLA_SLOPE_CNTL 0x43A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2108  #define mmDCP3_REGAMMA_CNTLA_START_CNTL 0x43A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2109  #define mmDCP3_REGAMMA_CNTLB_END_CNTL1 0x43B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2110  #define mmDCP3_REGAMMA_CNTLB_END_CNTL2 0x43B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2111  #define mmDCP3_REGAMMA_CNTLB_REGION_0_1 0x43B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2112  #define mmDCP3_REGAMMA_CNTLB_REGION_10_11 0x43B9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2113  #define mmDCP3_REGAMMA_CNTLB_REGION_12_13 0x43BA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2114  #define mmDCP3_REGAMMA_CNTLB_REGION_14_15 0x43BB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2115  #define mmDCP3_REGAMMA_CNTLB_REGION_2_3 0x43B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2116  #define mmDCP3_REGAMMA_CNTLB_REGION_4_5 0x43B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2117  #define mmDCP3_REGAMMA_CNTLB_REGION_6_7 0x43B7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2118  #define mmDCP3_REGAMMA_CNTLB_REGION_8_9 0x43B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2119  #define mmDCP3_REGAMMA_CNTLB_SLOPE_CNTL 0x43B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2120  #define mmDCP3_REGAMMA_CNTLB_START_CNTL 0x43B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2121  #define mmDCP3_REGAMMA_CONTROL 0x43A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2122  #define mmDCP3_REGAMMA_LUT_DATA 0x43A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2123  #define mmDCP3_REGAMMA_LUT_INDEX 0x43A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2124  #define mmDCP3_REGAMMA_LUT_WRITE_EN_MASK 0x43A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2125  #define mmDCP4_COMM_MATRIXA_TRANS_C11_C12 0x4643
de2bdb3dcf92280 Tom St Denis 2016-10-26  2126  #define mmDCP4_COMM_MATRIXA_TRANS_C13_C14 0x4644
de2bdb3dcf92280 Tom St Denis 2016-10-26  2127  #define mmDCP4_COMM_MATRIXA_TRANS_C21_C22 0x4645
de2bdb3dcf92280 Tom St Denis 2016-10-26  2128  #define mmDCP4_COMM_MATRIXA_TRANS_C23_C24 0x4646
de2bdb3dcf92280 Tom St Denis 2016-10-26  2129  #define mmDCP4_COMM_MATRIXA_TRANS_C31_C32 0x4647
de2bdb3dcf92280 Tom St Denis 2016-10-26  2130  #define mmDCP4_COMM_MATRIXA_TRANS_C33_C34 0x4648
de2bdb3dcf92280 Tom St Denis 2016-10-26  2131  #define mmDCP4_COMM_MATRIXB_TRANS_C11_C12 0x4649
de2bdb3dcf92280 Tom St Denis 2016-10-26  2132  #define mmDCP4_COMM_MATRIXB_TRANS_C13_C14 0x464A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2133  #define mmDCP4_COMM_MATRIXB_TRANS_C21_C22 0x464B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2134  #define mmDCP4_COMM_MATRIXB_TRANS_C23_C24 0x464C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2135  #define mmDCP4_COMM_MATRIXB_TRANS_C31_C32 0x464D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2136  #define mmDCP4_COMM_MATRIXB_TRANS_C33_C34 0x464E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2137  #define mmDCP4_CUR_COLOR1 0x466C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2138  #define mmDCP4_CUR_COLOR2 0x466D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2139  #define mmDCP4_CUR_CONTROL 0x4666
de2bdb3dcf92280 Tom St Denis 2016-10-26  2140  #define mmDCP4_CUR_HOT_SPOT 0x466B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2141  #define mmDCP4_CUR_POSITION 0x466A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2142  #define mmDCP4_CUR_REQUEST_FILTER_CNTL 0x4699
de2bdb3dcf92280 Tom St Denis 2016-10-26  2143  #define mmDCP4_CUR_SIZE 0x4668
de2bdb3dcf92280 Tom St Denis 2016-10-26  2144  #define mmDCP4_CUR_SURFACE_ADDRESS 0x4667
de2bdb3dcf92280 Tom St Denis 2016-10-26  2145  #define mmDCP4_CUR_SURFACE_ADDRESS_HIGH 0x4669
de2bdb3dcf92280 Tom St Denis 2016-10-26  2146  #define mmDCP4_CUR_UPDATE 0x466E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2147  #define mmDCP4_DC_LUT_30_COLOR 0x467C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2148  #define mmDCP4_DC_LUT_AUTOFILL 0x467F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2149  #define mmDCP4_DC_LUT_BLACK_OFFSET_BLUE 0x4681
de2bdb3dcf92280 Tom St Denis 2016-10-26  2150  #define mmDCP4_DC_LUT_BLACK_OFFSET_GREEN 0x4682
de2bdb3dcf92280 Tom St Denis 2016-10-26  2151  #define mmDCP4_DC_LUT_BLACK_OFFSET_RED 0x4683
de2bdb3dcf92280 Tom St Denis 2016-10-26  2152  #define mmDCP4_DC_LUT_CONTROL 0x4680
de2bdb3dcf92280 Tom St Denis 2016-10-26  2153  #define mmDCP4_DC_LUT_PWL_DATA 0x467B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2154  #define mmDCP4_DC_LUT_RW_INDEX 0x4679
de2bdb3dcf92280 Tom St Denis 2016-10-26  2155  #define mmDCP4_DC_LUT_RW_MODE 0x4678
de2bdb3dcf92280 Tom St Denis 2016-10-26  2156  #define mmDCP4_DC_LUT_SEQ_COLOR 0x467A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2157  #define mmDCP4_DC_LUT_VGA_ACCESS_ENABLE 0x467D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2158  #define mmDCP4_DC_LUT_WHITE_OFFSET_BLUE 0x4684
de2bdb3dcf92280 Tom St Denis 2016-10-26  2159  #define mmDCP4_DC_LUT_WHITE_OFFSET_GREEN 0x4685
de2bdb3dcf92280 Tom St Denis 2016-10-26  2160  #define mmDCP4_DC_LUT_WHITE_OFFSET_RED 0x4686
de2bdb3dcf92280 Tom St Denis 2016-10-26  2161  #define mmDCP4_DC_LUT_WRITE_EN_MASK 0x467E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2162  #define mmDCP4_DCP_CRC_CONTROL 0x4687
de2bdb3dcf92280 Tom St Denis 2016-10-26  2163  #define mmDCP4_DCP_CRC_CURRENT 0x4689
de2bdb3dcf92280 Tom St Denis 2016-10-26  2164  #define mmDCP4_DCP_CRC_LAST 0x468B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2165  #define mmDCP4_DCP_CRC_MASK 0x4688
de2bdb3dcf92280 Tom St Denis 2016-10-26  2166  #define mmDCP4_DCP_DEBUG 0x468D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2167  #define mmDCP4_DCP_DEBUG2 0x4698
de2bdb3dcf92280 Tom St Denis 2016-10-26  2168  #define mmDCP4_DCP_FP_CONVERTED_FIELD 0x4665
de2bdb3dcf92280 Tom St Denis 2016-10-26  2169  #define mmDCP4_DCP_GSL_CONTROL 0x4690
de2bdb3dcf92280 Tom St Denis 2016-10-26  2170  #define mmDCP4_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x4691
de2bdb3dcf92280 Tom St Denis 2016-10-26  2171  #define mmDCP4_DCP_RANDOM_SEEDS 0x4661
de2bdb3dcf92280 Tom St Denis 2016-10-26  2172  #define mmDCP4_DCP_SPATIAL_DITHER_CNTL 0x4660
de2bdb3dcf92280 Tom St Denis 2016-10-26  2173  #define mmDCP4_DCP_TEST_DEBUG_DATA 0x4696
de2bdb3dcf92280 Tom St Denis 2016-10-26  2174  #define mmDCP4_DCP_TEST_DEBUG_INDEX 0x4695
de2bdb3dcf92280 Tom St Denis 2016-10-26  2175  #define mmDCP4_DEGAMMA_CONTROL 0x4658
de2bdb3dcf92280 Tom St Denis 2016-10-26  2176  #define mmDCP4_DENORM_CONTROL 0x4650
de2bdb3dcf92280 Tom St Denis 2016-10-26  2177  #define mmDCP4_GAMUT_REMAP_C11_C12 0x465A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2178  #define mmDCP4_GAMUT_REMAP_C13_C14 0x465B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2179  #define mmDCP4_GAMUT_REMAP_C21_C22 0x465C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2180  #define mmDCP4_GAMUT_REMAP_C23_C24 0x465D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2181  #define mmDCP4_GAMUT_REMAP_C31_C32 0x465E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2182  #define mmDCP4_GAMUT_REMAP_C33_C34 0x465F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2183  #define mmDCP4_GAMUT_REMAP_CONTROL 0x4659
de2bdb3dcf92280 Tom St Denis 2016-10-26  2184  #define mmDCP4_GRPH_COMPRESS_PITCH 0x461A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2185  #define mmDCP4_GRPH_COMPRESS_SURFACE_ADDRESS 0x4619
de2bdb3dcf92280 Tom St Denis 2016-10-26  2186  #define mmDCP4_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x461B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2187  #define mmDCP4_GRPH_CONTROL 0x4601
de2bdb3dcf92280 Tom St Denis 2016-10-26  2188  #define mmDCP4_GRPH_DFQ_CONTROL 0x4614
de2bdb3dcf92280 Tom St Denis 2016-10-26  2189  #define mmDCP4_GRPH_DFQ_STATUS 0x4615
de2bdb3dcf92280 Tom St Denis 2016-10-26  2190  #define mmDCP4_GRPH_ENABLE 0x4600
de2bdb3dcf92280 Tom St Denis 2016-10-26  2191  #define mmDCP4_GRPH_FLIP_CONTROL 0x4612
de2bdb3dcf92280 Tom St Denis 2016-10-26  2192  #define mmDCP4_GRPH_INTERRUPT_CONTROL 0x4617
de2bdb3dcf92280 Tom St Denis 2016-10-26  2193  #define mmDCP4_GRPH_INTERRUPT_STATUS 0x4616
de2bdb3dcf92280 Tom St Denis 2016-10-26  2194  #define mmDCP4_GRPH_LUT_10BIT_BYPASS 0x4602
de2bdb3dcf92280 Tom St Denis 2016-10-26  2195  #define mmDCP4_GRPH_PITCH 0x4606
de2bdb3dcf92280 Tom St Denis 2016-10-26  2196  #define mmDCP4_GRPH_PRIMARY_SURFACE_ADDRESS 0x4604
de2bdb3dcf92280 Tom St Denis 2016-10-26  2197  #define mmDCP4_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x4607
de2bdb3dcf92280 Tom St Denis 2016-10-26  2198  #define mmDCP4_GRPH_SECONDARY_SURFACE_ADDRESS 0x4605
de2bdb3dcf92280 Tom St Denis 2016-10-26  2199  #define mmDCP4_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x4608
de2bdb3dcf92280 Tom St Denis 2016-10-26  2200  #define mmDCP4_GRPH_STEREOSYNC_FLIP 0x4697
de2bdb3dcf92280 Tom St Denis 2016-10-26  2201  #define mmDCP4_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x4618
de2bdb3dcf92280 Tom St Denis 2016-10-26  2202  #define mmDCP4_GRPH_SURFACE_ADDRESS_INUSE 0x4613
de2bdb3dcf92280 Tom St Denis 2016-10-26  2203  #define mmDCP4_GRPH_SURFACE_OFFSET_X 0x4609
de2bdb3dcf92280 Tom St Denis 2016-10-26  2204  #define mmDCP4_GRPH_SURFACE_OFFSET_Y 0x460A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2205  #define mmDCP4_GRPH_SWAP_CNTL 0x4603
de2bdb3dcf92280 Tom St Denis 2016-10-26  2206  #define mmDCP4_GRPH_UPDATE 0x4611
de2bdb3dcf92280 Tom St Denis 2016-10-26  2207  #define mmDCP4_GRPH_X_END 0x460D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2208  #define mmDCP4_GRPH_X_START 0x460B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2209  #define mmDCP4_GRPH_Y_END 0x460E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2210  #define mmDCP4_GRPH_Y_START 0x460C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2211  #define mmDCP4_INPUT_CSC_C11_C12 0x4636
de2bdb3dcf92280 Tom St Denis 2016-10-26  2212  #define mmDCP4_INPUT_CSC_C13_C14 0x4637
de2bdb3dcf92280 Tom St Denis 2016-10-26  2213  #define mmDCP4_INPUT_CSC_C21_C22 0x4638
de2bdb3dcf92280 Tom St Denis 2016-10-26  2214  #define mmDCP4_INPUT_CSC_C23_C24 0x4639
de2bdb3dcf92280 Tom St Denis 2016-10-26  2215  #define mmDCP4_INPUT_CSC_C31_C32 0x463A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2216  #define mmDCP4_INPUT_CSC_C33_C34 0x463B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2217  #define mmDCP4_INPUT_CSC_CONTROL 0x4635
de2bdb3dcf92280 Tom St Denis 2016-10-26  2218  #define mmDCP4_INPUT_GAMMA_CONTROL 0x4610
de2bdb3dcf92280 Tom St Denis 2016-10-26  2219  #define mmDCP4_KEY_CONTROL 0x4653
de2bdb3dcf92280 Tom St Denis 2016-10-26  2220  #define mmDCP4_KEY_RANGE_ALPHA 0x4654
de2bdb3dcf92280 Tom St Denis 2016-10-26  2221  #define mmDCP4_KEY_RANGE_BLUE 0x4657
de2bdb3dcf92280 Tom St Denis 2016-10-26  2222  #define mmDCP4_KEY_RANGE_GREEN 0x4656
de2bdb3dcf92280 Tom St Denis 2016-10-26  2223  #define mmDCP4_KEY_RANGE_RED 0x4655
de2bdb3dcf92280 Tom St Denis 2016-10-26  2224  #define mmDCP4_OUTPUT_CSC_C11_C12 0x463D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2225  #define mmDCP4_OUTPUT_CSC_C13_C14 0x463E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2226  #define mmDCP4_OUTPUT_CSC_C21_C22 0x463F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2227  #define mmDCP4_OUTPUT_CSC_C23_C24 0x4640
de2bdb3dcf92280 Tom St Denis 2016-10-26  2228  #define mmDCP4_OUTPUT_CSC_C31_C32 0x4641
de2bdb3dcf92280 Tom St Denis 2016-10-26  2229  #define mmDCP4_OUTPUT_CSC_C33_C34 0x4642
de2bdb3dcf92280 Tom St Denis 2016-10-26  2230  #define mmDCP4_OUTPUT_CSC_CONTROL 0x463C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2231  #define mmDCP4_OUT_ROUND_CONTROL 0x4651
de2bdb3dcf92280 Tom St Denis 2016-10-26  2232  #define mmDCP4_OVL_CONTROL1 0x461D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2233  #define mmDCP4_OVL_CONTROL2 0x461E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2234  #define mmDCP4_OVL_DFQ_CONTROL 0x4629
de2bdb3dcf92280 Tom St Denis 2016-10-26  2235  #define mmDCP4_OVL_DFQ_STATUS 0x462A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2236  #define mmDCP4_OVL_ENABLE 0x461C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2237  #define mmDCP4_OVL_END 0x4626
de2bdb3dcf92280 Tom St Denis 2016-10-26  2238  #define mmDCP4_OVL_PITCH 0x4621
de2bdb3dcf92280 Tom St Denis 2016-10-26  2239  #define mmDCP4_OVLSCL_EDGE_PIXEL_CNTL 0x462C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2240  #define mmDCP4_OVL_SECONDARY_SURFACE_ADDRESS 0x4692
de2bdb3dcf92280 Tom St Denis 2016-10-26  2241  #define mmDCP4_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x4694
de2bdb3dcf92280 Tom St Denis 2016-10-26  2242  #define mmDCP4_OVL_START 0x4625
de2bdb3dcf92280 Tom St Denis 2016-10-26  2243  #define mmDCP4_OVL_STEREOSYNC_FLIP 0x4693
de2bdb3dcf92280 Tom St Denis 2016-10-26  2244  #define mmDCP4_OVL_SURFACE_ADDRESS 0x4620
de2bdb3dcf92280 Tom St Denis 2016-10-26  2245  #define mmDCP4_OVL_SURFACE_ADDRESS_HIGH 0x4622
de2bdb3dcf92280 Tom St Denis 2016-10-26  2246  #define mmDCP4_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x462B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2247  #define mmDCP4_OVL_SURFACE_ADDRESS_INUSE 0x4628
de2bdb3dcf92280 Tom St Denis 2016-10-26  2248  #define mmDCP4_OVL_SURFACE_OFFSET_X 0x4623
de2bdb3dcf92280 Tom St Denis 2016-10-26  2249  #define mmDCP4_OVL_SURFACE_OFFSET_Y 0x4624
de2bdb3dcf92280 Tom St Denis 2016-10-26  2250  #define mmDCP4_OVL_SWAP_CNTL 0x461F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2251  #define mmDCP4_OVL_UPDATE 0x4627
de2bdb3dcf92280 Tom St Denis 2016-10-26  2252  #define mmDCP4_PRESCALE_GRPH_CONTROL 0x462D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2253  #define mmDCP4_PRESCALE_OVL_CONTROL 0x4631
de2bdb3dcf92280 Tom St Denis 2016-10-26  2254  #define mmDCP4_PRESCALE_VALUES_GRPH_B 0x4630
de2bdb3dcf92280 Tom St Denis 2016-10-26  2255  #define mmDCP4_PRESCALE_VALUES_GRPH_G 0x462F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2256  #define mmDCP4_PRESCALE_VALUES_GRPH_R 0x462E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2257  #define mmDCP4_PRESCALE_VALUES_OVL_CB 0x4632
de2bdb3dcf92280 Tom St Denis 2016-10-26  2258  #define mmDCP4_PRESCALE_VALUES_OVL_CR 0x4634
de2bdb3dcf92280 Tom St Denis 2016-10-26  2259  #define mmDCP4_PRESCALE_VALUES_OVL_Y 0x4633
de2bdb3dcf92280 Tom St Denis 2016-10-26  2260  #define mmDCP4_REGAMMA_CNTLA_END_CNTL1 0x46A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2261  #define mmDCP4_REGAMMA_CNTLA_END_CNTL2 0x46A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2262  #define mmDCP4_REGAMMA_CNTLA_REGION_0_1 0x46A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2263  #define mmDCP4_REGAMMA_CNTLA_REGION_10_11 0x46AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  2264  #define mmDCP4_REGAMMA_CNTLA_REGION_12_13 0x46AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  2265  #define mmDCP4_REGAMMA_CNTLA_REGION_14_15 0x46AF
de2bdb3dcf92280 Tom St Denis 2016-10-26  2266  #define mmDCP4_REGAMMA_CNTLA_REGION_2_3 0x46A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2267  #define mmDCP4_REGAMMA_CNTLA_REGION_4_5 0x46AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2268  #define mmDCP4_REGAMMA_CNTLA_REGION_6_7 0x46AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2269  #define mmDCP4_REGAMMA_CNTLA_REGION_8_9 0x46AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  2270  #define mmDCP4_REGAMMA_CNTLA_SLOPE_CNTL 0x46A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2271  #define mmDCP4_REGAMMA_CNTLA_START_CNTL 0x46A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2272  #define mmDCP4_REGAMMA_CNTLB_END_CNTL1 0x46B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2273  #define mmDCP4_REGAMMA_CNTLB_END_CNTL2 0x46B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2274  #define mmDCP4_REGAMMA_CNTLB_REGION_0_1 0x46B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2275  #define mmDCP4_REGAMMA_CNTLB_REGION_10_11 0x46B9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2276  #define mmDCP4_REGAMMA_CNTLB_REGION_12_13 0x46BA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2277  #define mmDCP4_REGAMMA_CNTLB_REGION_14_15 0x46BB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2278  #define mmDCP4_REGAMMA_CNTLB_REGION_2_3 0x46B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2279  #define mmDCP4_REGAMMA_CNTLB_REGION_4_5 0x46B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2280  #define mmDCP4_REGAMMA_CNTLB_REGION_6_7 0x46B7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2281  #define mmDCP4_REGAMMA_CNTLB_REGION_8_9 0x46B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2282  #define mmDCP4_REGAMMA_CNTLB_SLOPE_CNTL 0x46B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2283  #define mmDCP4_REGAMMA_CNTLB_START_CNTL 0x46B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2284  #define mmDCP4_REGAMMA_CONTROL 0x46A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2285  #define mmDCP4_REGAMMA_LUT_DATA 0x46A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2286  #define mmDCP4_REGAMMA_LUT_INDEX 0x46A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2287  #define mmDCP4_REGAMMA_LUT_WRITE_EN_MASK 0x46A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2288  #define mmDCP5_COMM_MATRIXA_TRANS_C11_C12 0x4943
de2bdb3dcf92280 Tom St Denis 2016-10-26  2289  #define mmDCP5_COMM_MATRIXA_TRANS_C13_C14 0x4944
de2bdb3dcf92280 Tom St Denis 2016-10-26  2290  #define mmDCP5_COMM_MATRIXA_TRANS_C21_C22 0x4945
de2bdb3dcf92280 Tom St Denis 2016-10-26  2291  #define mmDCP5_COMM_MATRIXA_TRANS_C23_C24 0x4946
de2bdb3dcf92280 Tom St Denis 2016-10-26  2292  #define mmDCP5_COMM_MATRIXA_TRANS_C31_C32 0x4947
de2bdb3dcf92280 Tom St Denis 2016-10-26  2293  #define mmDCP5_COMM_MATRIXA_TRANS_C33_C34 0x4948
de2bdb3dcf92280 Tom St Denis 2016-10-26  2294  #define mmDCP5_COMM_MATRIXB_TRANS_C11_C12 0x4949
de2bdb3dcf92280 Tom St Denis 2016-10-26  2295  #define mmDCP5_COMM_MATRIXB_TRANS_C13_C14 0x494A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2296  #define mmDCP5_COMM_MATRIXB_TRANS_C21_C22 0x494B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2297  #define mmDCP5_COMM_MATRIXB_TRANS_C23_C24 0x494C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2298  #define mmDCP5_COMM_MATRIXB_TRANS_C31_C32 0x494D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2299  #define mmDCP5_COMM_MATRIXB_TRANS_C33_C34 0x494E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2300  #define mmDCP5_CUR_COLOR1 0x496C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2301  #define mmDCP5_CUR_COLOR2 0x496D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2302  #define mmDCP5_CUR_CONTROL 0x4966
de2bdb3dcf92280 Tom St Denis 2016-10-26  2303  #define mmDCP5_CUR_HOT_SPOT 0x496B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2304  #define mmDCP5_CUR_POSITION 0x496A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2305  #define mmDCP5_CUR_REQUEST_FILTER_CNTL 0x4999
de2bdb3dcf92280 Tom St Denis 2016-10-26  2306  #define mmDCP5_CUR_SIZE 0x4968
de2bdb3dcf92280 Tom St Denis 2016-10-26  2307  #define mmDCP5_CUR_SURFACE_ADDRESS 0x4967
de2bdb3dcf92280 Tom St Denis 2016-10-26  2308  #define mmDCP5_CUR_SURFACE_ADDRESS_HIGH 0x4969
de2bdb3dcf92280 Tom St Denis 2016-10-26  2309  #define mmDCP5_CUR_UPDATE 0x496E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2310  #define mmDCP5_DC_LUT_30_COLOR 0x497C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2311  #define mmDCP5_DC_LUT_AUTOFILL 0x497F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2312  #define mmDCP5_DC_LUT_BLACK_OFFSET_BLUE 0x4981
de2bdb3dcf92280 Tom St Denis 2016-10-26  2313  #define mmDCP5_DC_LUT_BLACK_OFFSET_GREEN 0x4982
de2bdb3dcf92280 Tom St Denis 2016-10-26  2314  #define mmDCP5_DC_LUT_BLACK_OFFSET_RED 0x4983
de2bdb3dcf92280 Tom St Denis 2016-10-26  2315  #define mmDCP5_DC_LUT_CONTROL 0x4980
de2bdb3dcf92280 Tom St Denis 2016-10-26  2316  #define mmDCP5_DC_LUT_PWL_DATA 0x497B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2317  #define mmDCP5_DC_LUT_RW_INDEX 0x4979
de2bdb3dcf92280 Tom St Denis 2016-10-26  2318  #define mmDCP5_DC_LUT_RW_MODE 0x4978
de2bdb3dcf92280 Tom St Denis 2016-10-26  2319  #define mmDCP5_DC_LUT_SEQ_COLOR 0x497A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2320  #define mmDCP5_DC_LUT_VGA_ACCESS_ENABLE 0x497D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2321  #define mmDCP5_DC_LUT_WHITE_OFFSET_BLUE 0x4984
de2bdb3dcf92280 Tom St Denis 2016-10-26  2322  #define mmDCP5_DC_LUT_WHITE_OFFSET_GREEN 0x4985
de2bdb3dcf92280 Tom St Denis 2016-10-26  2323  #define mmDCP5_DC_LUT_WHITE_OFFSET_RED 0x4986
de2bdb3dcf92280 Tom St Denis 2016-10-26  2324  #define mmDCP5_DC_LUT_WRITE_EN_MASK 0x497E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2325  #define mmDCP5_DCP_CRC_CONTROL 0x4987
de2bdb3dcf92280 Tom St Denis 2016-10-26  2326  #define mmDCP5_DCP_CRC_CURRENT 0x4989
de2bdb3dcf92280 Tom St Denis 2016-10-26  2327  #define mmDCP5_DCP_CRC_LAST 0x498B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2328  #define mmDCP5_DCP_CRC_MASK 0x4988
de2bdb3dcf92280 Tom St Denis 2016-10-26  2329  #define mmDCP5_DCP_DEBUG 0x498D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2330  #define mmDCP5_DCP_DEBUG2 0x4998
de2bdb3dcf92280 Tom St Denis 2016-10-26  2331  #define mmDCP5_DCP_FP_CONVERTED_FIELD 0x4965
de2bdb3dcf92280 Tom St Denis 2016-10-26  2332  #define mmDCP5_DCP_GSL_CONTROL 0x4990
de2bdb3dcf92280 Tom St Denis 2016-10-26  2333  #define mmDCP5_DCP_LB_DATA_GAP_BETWEEN_CHUNK 0x4991
de2bdb3dcf92280 Tom St Denis 2016-10-26  2334  #define mmDCP5_DCP_RANDOM_SEEDS 0x4961
de2bdb3dcf92280 Tom St Denis 2016-10-26  2335  #define mmDCP5_DCP_SPATIAL_DITHER_CNTL 0x4960
de2bdb3dcf92280 Tom St Denis 2016-10-26  2336  #define mmDCP5_DCP_TEST_DEBUG_DATA 0x4996
de2bdb3dcf92280 Tom St Denis 2016-10-26  2337  #define mmDCP5_DCP_TEST_DEBUG_INDEX 0x4995
de2bdb3dcf92280 Tom St Denis 2016-10-26  2338  #define mmDCP5_DEGAMMA_CONTROL 0x4958
de2bdb3dcf92280 Tom St Denis 2016-10-26  2339  #define mmDCP5_DENORM_CONTROL 0x4950
de2bdb3dcf92280 Tom St Denis 2016-10-26  2340  #define mmDCP5_GAMUT_REMAP_C11_C12 0x495A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2341  #define mmDCP5_GAMUT_REMAP_C13_C14 0x495B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2342  #define mmDCP5_GAMUT_REMAP_C21_C22 0x495C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2343  #define mmDCP5_GAMUT_REMAP_C23_C24 0x495D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2344  #define mmDCP5_GAMUT_REMAP_C31_C32 0x495E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2345  #define mmDCP5_GAMUT_REMAP_C33_C34 0x495F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2346  #define mmDCP5_GAMUT_REMAP_CONTROL 0x4959
de2bdb3dcf92280 Tom St Denis 2016-10-26  2347  #define mmDCP5_GRPH_COMPRESS_PITCH 0x491A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2348  #define mmDCP5_GRPH_COMPRESS_SURFACE_ADDRESS 0x4919
de2bdb3dcf92280 Tom St Denis 2016-10-26  2349  #define mmDCP5_GRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x491B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2350  #define mmDCP5_GRPH_CONTROL 0x4901
de2bdb3dcf92280 Tom St Denis 2016-10-26  2351  #define mmDCP5_GRPH_DFQ_CONTROL 0x4914
de2bdb3dcf92280 Tom St Denis 2016-10-26  2352  #define mmDCP5_GRPH_DFQ_STATUS 0x4915
de2bdb3dcf92280 Tom St Denis 2016-10-26  2353  #define mmDCP5_GRPH_ENABLE 0x4900
de2bdb3dcf92280 Tom St Denis 2016-10-26  2354  #define mmDCP5_GRPH_FLIP_CONTROL 0x4912
de2bdb3dcf92280 Tom St Denis 2016-10-26  2355  #define mmDCP5_GRPH_INTERRUPT_CONTROL 0x4917
de2bdb3dcf92280 Tom St Denis 2016-10-26  2356  #define mmDCP5_GRPH_INTERRUPT_STATUS 0x4916
de2bdb3dcf92280 Tom St Denis 2016-10-26  2357  #define mmDCP5_GRPH_LUT_10BIT_BYPASS 0x4902
de2bdb3dcf92280 Tom St Denis 2016-10-26  2358  #define mmDCP5_GRPH_PITCH 0x4906
de2bdb3dcf92280 Tom St Denis 2016-10-26  2359  #define mmDCP5_GRPH_PRIMARY_SURFACE_ADDRESS 0x4904
de2bdb3dcf92280 Tom St Denis 2016-10-26  2360  #define mmDCP5_GRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x4907
de2bdb3dcf92280 Tom St Denis 2016-10-26  2361  #define mmDCP5_GRPH_SECONDARY_SURFACE_ADDRESS 0x4905
de2bdb3dcf92280 Tom St Denis 2016-10-26  2362  #define mmDCP5_GRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x4908
de2bdb3dcf92280 Tom St Denis 2016-10-26  2363  #define mmDCP5_GRPH_STEREOSYNC_FLIP 0x4997
de2bdb3dcf92280 Tom St Denis 2016-10-26  2364  #define mmDCP5_GRPH_SURFACE_ADDRESS_HIGH_INUSE 0x4918
de2bdb3dcf92280 Tom St Denis 2016-10-26  2365  #define mmDCP5_GRPH_SURFACE_ADDRESS_INUSE 0x4913
de2bdb3dcf92280 Tom St Denis 2016-10-26  2366  #define mmDCP5_GRPH_SURFACE_OFFSET_X 0x4909
de2bdb3dcf92280 Tom St Denis 2016-10-26  2367  #define mmDCP5_GRPH_SURFACE_OFFSET_Y 0x490A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2368  #define mmDCP5_GRPH_SWAP_CNTL 0x4903
de2bdb3dcf92280 Tom St Denis 2016-10-26  2369  #define mmDCP5_GRPH_UPDATE 0x4911
de2bdb3dcf92280 Tom St Denis 2016-10-26  2370  #define mmDCP5_GRPH_X_END 0x490D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2371  #define mmDCP5_GRPH_X_START 0x490B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2372  #define mmDCP5_GRPH_Y_END 0x490E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2373  #define mmDCP5_GRPH_Y_START 0x490C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2374  #define mmDCP5_INPUT_CSC_C11_C12 0x4936
de2bdb3dcf92280 Tom St Denis 2016-10-26  2375  #define mmDCP5_INPUT_CSC_C13_C14 0x4937
de2bdb3dcf92280 Tom St Denis 2016-10-26  2376  #define mmDCP5_INPUT_CSC_C21_C22 0x4938
de2bdb3dcf92280 Tom St Denis 2016-10-26  2377  #define mmDCP5_INPUT_CSC_C23_C24 0x4939
de2bdb3dcf92280 Tom St Denis 2016-10-26  2378  #define mmDCP5_INPUT_CSC_C31_C32 0x493A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2379  #define mmDCP5_INPUT_CSC_C33_C34 0x493B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2380  #define mmDCP5_INPUT_CSC_CONTROL 0x4935
de2bdb3dcf92280 Tom St Denis 2016-10-26  2381  #define mmDCP5_INPUT_GAMMA_CONTROL 0x4910
de2bdb3dcf92280 Tom St Denis 2016-10-26  2382  #define mmDCP5_KEY_CONTROL 0x4953
de2bdb3dcf92280 Tom St Denis 2016-10-26  2383  #define mmDCP5_KEY_RANGE_ALPHA 0x4954
de2bdb3dcf92280 Tom St Denis 2016-10-26  2384  #define mmDCP5_KEY_RANGE_BLUE 0x4957
de2bdb3dcf92280 Tom St Denis 2016-10-26  2385  #define mmDCP5_KEY_RANGE_GREEN 0x4956
de2bdb3dcf92280 Tom St Denis 2016-10-26  2386  #define mmDCP5_KEY_RANGE_RED 0x4955
de2bdb3dcf92280 Tom St Denis 2016-10-26  2387  #define mmDCP5_OUTPUT_CSC_C11_C12 0x493D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2388  #define mmDCP5_OUTPUT_CSC_C13_C14 0x493E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2389  #define mmDCP5_OUTPUT_CSC_C21_C22 0x493F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2390  #define mmDCP5_OUTPUT_CSC_C23_C24 0x4940
de2bdb3dcf92280 Tom St Denis 2016-10-26  2391  #define mmDCP5_OUTPUT_CSC_C31_C32 0x4941
de2bdb3dcf92280 Tom St Denis 2016-10-26  2392  #define mmDCP5_OUTPUT_CSC_C33_C34 0x4942
de2bdb3dcf92280 Tom St Denis 2016-10-26  2393  #define mmDCP5_OUTPUT_CSC_CONTROL 0x493C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2394  #define mmDCP5_OUT_ROUND_CONTROL 0x4951
de2bdb3dcf92280 Tom St Denis 2016-10-26  2395  #define mmDCP5_OVL_CONTROL1 0x491D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2396  #define mmDCP5_OVL_CONTROL2 0x491E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2397  #define mmDCP5_OVL_DFQ_CONTROL 0x4929
de2bdb3dcf92280 Tom St Denis 2016-10-26  2398  #define mmDCP5_OVL_DFQ_STATUS 0x492A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2399  #define mmDCP5_OVL_ENABLE 0x491C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2400  #define mmDCP5_OVL_END 0x4926
de2bdb3dcf92280 Tom St Denis 2016-10-26  2401  #define mmDCP5_OVL_PITCH 0x4921
de2bdb3dcf92280 Tom St Denis 2016-10-26  2402  #define mmDCP5_OVLSCL_EDGE_PIXEL_CNTL 0x492C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2403  #define mmDCP5_OVL_SECONDARY_SURFACE_ADDRESS 0x4992
de2bdb3dcf92280 Tom St Denis 2016-10-26  2404  #define mmDCP5_OVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x4994
de2bdb3dcf92280 Tom St Denis 2016-10-26  2405  #define mmDCP5_OVL_START 0x4925
de2bdb3dcf92280 Tom St Denis 2016-10-26  2406  #define mmDCP5_OVL_STEREOSYNC_FLIP 0x4993
de2bdb3dcf92280 Tom St Denis 2016-10-26  2407  #define mmDCP5_OVL_SURFACE_ADDRESS 0x4920
de2bdb3dcf92280 Tom St Denis 2016-10-26  2408  #define mmDCP5_OVL_SURFACE_ADDRESS_HIGH 0x4922
de2bdb3dcf92280 Tom St Denis 2016-10-26  2409  #define mmDCP5_OVL_SURFACE_ADDRESS_HIGH_INUSE 0x492B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2410  #define mmDCP5_OVL_SURFACE_ADDRESS_INUSE 0x4928
de2bdb3dcf92280 Tom St Denis 2016-10-26  2411  #define mmDCP5_OVL_SURFACE_OFFSET_X 0x4923
de2bdb3dcf92280 Tom St Denis 2016-10-26  2412  #define mmDCP5_OVL_SURFACE_OFFSET_Y 0x4924
de2bdb3dcf92280 Tom St Denis 2016-10-26  2413  #define mmDCP5_OVL_SWAP_CNTL 0x491F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2414  #define mmDCP5_OVL_UPDATE 0x4927
de2bdb3dcf92280 Tom St Denis 2016-10-26  2415  #define mmDCP5_PRESCALE_GRPH_CONTROL 0x492D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2416  #define mmDCP5_PRESCALE_OVL_CONTROL 0x4931
de2bdb3dcf92280 Tom St Denis 2016-10-26  2417  #define mmDCP5_PRESCALE_VALUES_GRPH_B 0x4930
de2bdb3dcf92280 Tom St Denis 2016-10-26  2418  #define mmDCP5_PRESCALE_VALUES_GRPH_G 0x492F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2419  #define mmDCP5_PRESCALE_VALUES_GRPH_R 0x492E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2420  #define mmDCP5_PRESCALE_VALUES_OVL_CB 0x4932
de2bdb3dcf92280 Tom St Denis 2016-10-26  2421  #define mmDCP5_PRESCALE_VALUES_OVL_CR 0x4934
de2bdb3dcf92280 Tom St Denis 2016-10-26  2422  #define mmDCP5_PRESCALE_VALUES_OVL_Y 0x4933
de2bdb3dcf92280 Tom St Denis 2016-10-26  2423  #define mmDCP5_REGAMMA_CNTLA_END_CNTL1 0x49A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2424  #define mmDCP5_REGAMMA_CNTLA_END_CNTL2 0x49A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2425  #define mmDCP5_REGAMMA_CNTLA_REGION_0_1 0x49A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2426  #define mmDCP5_REGAMMA_CNTLA_REGION_10_11 0x49AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  2427  #define mmDCP5_REGAMMA_CNTLA_REGION_12_13 0x49AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  2428  #define mmDCP5_REGAMMA_CNTLA_REGION_14_15 0x49AF
de2bdb3dcf92280 Tom St Denis 2016-10-26  2429  #define mmDCP5_REGAMMA_CNTLA_REGION_2_3 0x49A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2430  #define mmDCP5_REGAMMA_CNTLA_REGION_4_5 0x49AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2431  #define mmDCP5_REGAMMA_CNTLA_REGION_6_7 0x49AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2432  #define mmDCP5_REGAMMA_CNTLA_REGION_8_9 0x49AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  2433  #define mmDCP5_REGAMMA_CNTLA_SLOPE_CNTL 0x49A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2434  #define mmDCP5_REGAMMA_CNTLA_START_CNTL 0x49A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2435  #define mmDCP5_REGAMMA_CNTLB_END_CNTL1 0x49B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2436  #define mmDCP5_REGAMMA_CNTLB_END_CNTL2 0x49B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2437  #define mmDCP5_REGAMMA_CNTLB_REGION_0_1 0x49B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  2438  #define mmDCP5_REGAMMA_CNTLB_REGION_10_11 0x49B9
de2bdb3dcf92280 Tom St Denis 2016-10-26  2439  #define mmDCP5_REGAMMA_CNTLB_REGION_12_13 0x49BA
de2bdb3dcf92280 Tom St Denis 2016-10-26  2440  #define mmDCP5_REGAMMA_CNTLB_REGION_14_15 0x49BB
de2bdb3dcf92280 Tom St Denis 2016-10-26  2441  #define mmDCP5_REGAMMA_CNTLB_REGION_2_3 0x49B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  2442  #define mmDCP5_REGAMMA_CNTLB_REGION_4_5 0x49B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  2443  #define mmDCP5_REGAMMA_CNTLB_REGION_6_7 0x49B7
de2bdb3dcf92280 Tom St Denis 2016-10-26  2444  #define mmDCP5_REGAMMA_CNTLB_REGION_8_9 0x49B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  2445  #define mmDCP5_REGAMMA_CNTLB_SLOPE_CNTL 0x49B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2446  #define mmDCP5_REGAMMA_CNTLB_START_CNTL 0x49B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2447  #define mmDCP5_REGAMMA_CONTROL 0x49A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  2448  #define mmDCP5_REGAMMA_LUT_DATA 0x49A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  2449  #define mmDCP5_REGAMMA_LUT_INDEX 0x49A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  2450  #define mmDCP5_REGAMMA_LUT_WRITE_EN_MASK 0x49A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  2451  #define mmDC_PAD_EXTERN_SIG 0x1902
de2bdb3dcf92280 Tom St Denis 2016-10-26  2452  #define mmDCP_CRC_CONTROL 0x1A87
de2bdb3dcf92280 Tom St Denis 2016-10-26  2453  #define mmDCP_CRC_CURRENT 0x1A89
de2bdb3dcf92280 Tom St Denis 2016-10-26  2454  #define mmDCP_CRC_LAST 0x1A8B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2455  #define mmDCP_CRC_MASK 0x1A88
de2bdb3dcf92280 Tom St Denis 2016-10-26  2456  #define mmDCP_DEBUG 0x1A8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2457  #define mmDCP_DEBUG2 0x1A98
de2bdb3dcf92280 Tom St Denis 2016-10-26  2458  #define mmDCP_FP_CONVERTED_FIELD 0x1A65
de2bdb3dcf92280 Tom St Denis 2016-10-26  2459  #define mmDC_PGCNTL_STATUS_REG 0x177E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2460  #define mmDC_PGFSM_CONFIG_REG 0x177C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2461  #define mmDC_PGFSM_WRITE_REG 0x177D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2462  #define mmDCP_GSL_CONTROL 0x1A90
de2bdb3dcf92280 Tom St Denis 2016-10-26  2463  #define mmDCPG_TEST_DEBUG_DATA 0x177B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2464  #define mmDCPG_TEST_DEBUG_INDEX 0x1779
de2bdb3dcf92280 Tom St Denis 2016-10-26  2465  #define mmDC_PINSTRAPS 0x1917
de2bdb3dcf92280 Tom St Denis 2016-10-26  2466  #define mmDCP_LB_DATA_GAP_BETWEEN_CHUNK 0x1A91
de2bdb3dcf92280 Tom St Denis 2016-10-26  2467  #define mmDCP_RANDOM_SEEDS 0x1A61
de2bdb3dcf92280 Tom St Denis 2016-10-26  2468  #define mmDCP_SPATIAL_DITHER_CNTL 0x1A60
de2bdb3dcf92280 Tom St Denis 2016-10-26  2469  #define mmDCP_TEST_DEBUG_DATA 0x1A96
de2bdb3dcf92280 Tom St Denis 2016-10-26  2470  #define mmDCP_TEST_DEBUG_INDEX 0x1A95
de2bdb3dcf92280 Tom St Denis 2016-10-26  2471  #define mmDC_RBBMIF_RDWR_CNTL1 0x031A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2472  #define mmDC_RBBMIF_RDWR_CNTL2 0x031D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2473  #define mmDC_REF_CLK_CNTL 0x1903
de2bdb3dcf92280 Tom St Denis 2016-10-26  2474  #define mmDC_XDMA_INTERFACE_CNTL 0x0327
de2bdb3dcf92280 Tom St Denis 2016-10-26  2475  #define mmDEGAMMA_CONTROL 0x1A58
de2bdb3dcf92280 Tom St Denis 2016-10-26  2476  #define mmDENORM_CONTROL 0x1A50
de2bdb3dcf92280 Tom St Denis 2016-10-26  2477  #define mmDENTIST_DISPCLK_CNTL 0x0124
de2bdb3dcf92280 Tom St Denis 2016-10-26  2478  #define mmDIG0_AFMT_60958_0 0x1C41
de2bdb3dcf92280 Tom St Denis 2016-10-26  2479  #define mmDIG0_AFMT_60958_1 0x1C42
de2bdb3dcf92280 Tom St Denis 2016-10-26  2480  #define mmDIG0_AFMT_60958_2 0x1C48
de2bdb3dcf92280 Tom St Denis 2016-10-26  2481  #define mmDIG0_AFMT_AUDIO_CRC_CONTROL 0x1C43
de2bdb3dcf92280 Tom St Denis 2016-10-26  2482  #define mmDIG0_AFMT_AUDIO_CRC_RESULT 0x1C49
de2bdb3dcf92280 Tom St Denis 2016-10-26  2483  #define mmDIG0_AFMT_AUDIO_DBG_DTO_CNTL 0x1C52
de2bdb3dcf92280 Tom St Denis 2016-10-26  2484  #define mmDIG0_AFMT_AUDIO_INFO0 0x1C3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2485  #define mmDIG0_AFMT_AUDIO_INFO1 0x1C40
de2bdb3dcf92280 Tom St Denis 2016-10-26  2486  #define mmDIG0_AFMT_AUDIO_PACKET_CONTROL 0x1C4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2487  #define mmDIG0_AFMT_AUDIO_PACKET_CONTROL2 0x1C17
de2bdb3dcf92280 Tom St Denis 2016-10-26  2488  #define mmDIG0_AFMT_AUDIO_SRC_CONTROL 0x1C4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2489  #define mmDIG0_AFMT_AVI_INFO0 0x1C21
de2bdb3dcf92280 Tom St Denis 2016-10-26  2490  #define mmDIG0_AFMT_AVI_INFO1 0x1C22
de2bdb3dcf92280 Tom St Denis 2016-10-26  2491  #define mmDIG0_AFMT_AVI_INFO2 0x1C23
de2bdb3dcf92280 Tom St Denis 2016-10-26  2492  #define mmDIG0_AFMT_AVI_INFO3 0x1C24
de2bdb3dcf92280 Tom St Denis 2016-10-26  2493  #define mmDIG0_AFMT_GENERIC_0 0x1C28
de2bdb3dcf92280 Tom St Denis 2016-10-26  2494  #define mmDIG0_AFMT_GENERIC_1 0x1C29
de2bdb3dcf92280 Tom St Denis 2016-10-26  2495  #define mmDIG0_AFMT_GENERIC_2 0x1C2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2496  #define mmDIG0_AFMT_GENERIC_3 0x1C2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2497  #define mmDIG0_AFMT_GENERIC_4 0x1C2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2498  #define mmDIG0_AFMT_GENERIC_5 0x1C2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2499  #define mmDIG0_AFMT_GENERIC_6 0x1C2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2500  #define mmDIG0_AFMT_GENERIC_7 0x1C2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2501  #define mmDIG0_AFMT_GENERIC_HDR 0x1C27
de2bdb3dcf92280 Tom St Denis 2016-10-26  2502  #define mmDIG0_AFMT_INFOFRAME_CONTROL0 0x1C4D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2503  #define mmDIG0_AFMT_INTERRUPT_STATUS 0x1C14
de2bdb3dcf92280 Tom St Denis 2016-10-26  2504  #define mmDIG0_AFMT_ISRC1_0 0x1C18
de2bdb3dcf92280 Tom St Denis 2016-10-26  2505  #define mmDIG0_AFMT_ISRC1_1 0x1C19
de2bdb3dcf92280 Tom St Denis 2016-10-26  2506  #define mmDIG0_AFMT_ISRC1_2 0x1C1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2507  #define mmDIG0_AFMT_ISRC1_3 0x1C1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2508  #define mmDIG0_AFMT_ISRC1_4 0x1C1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2509  #define mmDIG0_AFMT_ISRC2_0 0x1C1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2510  #define mmDIG0_AFMT_ISRC2_1 0x1C1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2511  #define mmDIG0_AFMT_ISRC2_2 0x1C1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2512  #define mmDIG0_AFMT_ISRC2_3 0x1C20
de2bdb3dcf92280 Tom St Denis 2016-10-26  2513  #define mmDIG0_AFMT_MPEG_INFO0 0x1C25
de2bdb3dcf92280 Tom St Denis 2016-10-26  2514  #define mmDIG0_AFMT_MPEG_INFO1 0x1C26
de2bdb3dcf92280 Tom St Denis 2016-10-26  2515  #define mmDIG0_AFMT_RAMP_CONTROL0 0x1C44
de2bdb3dcf92280 Tom St Denis 2016-10-26  2516  #define mmDIG0_AFMT_RAMP_CONTROL1 0x1C45
de2bdb3dcf92280 Tom St Denis 2016-10-26  2517  #define mmDIG0_AFMT_RAMP_CONTROL2 0x1C46
de2bdb3dcf92280 Tom St Denis 2016-10-26  2518  #define mmDIG0_AFMT_RAMP_CONTROL3 0x1C47
de2bdb3dcf92280 Tom St Denis 2016-10-26  2519  #define mmDIG0_AFMT_STATUS 0x1C4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2520  #define mmDIG0_AFMT_VBI_PACKET_CONTROL 0x1C4C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2521  #define mmDIG0_DIG_BE_CNTL 0x1C50
de2bdb3dcf92280 Tom St Denis 2016-10-26  2522  #define mmDIG0_DIG_BE_EN_CNTL 0x1C51
de2bdb3dcf92280 Tom St Denis 2016-10-26  2523  #define mmDIG0_DIG_CLOCK_PATTERN 0x1C03
de2bdb3dcf92280 Tom St Denis 2016-10-26  2524  #define mmDIG0_DIG_DISPCLK_SWITCH_CNTL 0x1C08
de2bdb3dcf92280 Tom St Denis 2016-10-26  2525  #define mmDIG0_DIG_DISPCLK_SWITCH_STATUS 0x1C09
de2bdb3dcf92280 Tom St Denis 2016-10-26  2526  #define mmDIG0_DIG_FE_CNTL 0x1C00
de2bdb3dcf92280 Tom St Denis 2016-10-26  2527  #define mmDIG0_DIG_FIFO_STATUS 0x1C0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2528  #define mmDIG0_DIG_LANE_ENABLE 0x1C8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2529  #define mmDIG0_DIG_OUTPUT_CRC_CNTL 0x1C01
de2bdb3dcf92280 Tom St Denis 2016-10-26  2530  #define mmDIG0_DIG_OUTPUT_CRC_RESULT 0x1C02
de2bdb3dcf92280 Tom St Denis 2016-10-26  2531  #define mmDIG0_DIG_RANDOM_PATTERN_SEED 0x1C05
de2bdb3dcf92280 Tom St Denis 2016-10-26  2532  #define mmDIG0_DIG_TEST_PATTERN 0x1C04
de2bdb3dcf92280 Tom St Denis 2016-10-26  2533  #define mmDIG0_HDMI_ACR_32_0 0x1C37
de2bdb3dcf92280 Tom St Denis 2016-10-26  2534  #define mmDIG0_HDMI_ACR_32_1 0x1C38
de2bdb3dcf92280 Tom St Denis 2016-10-26  2535  #define mmDIG0_HDMI_ACR_44_0 0x1C39
de2bdb3dcf92280 Tom St Denis 2016-10-26  2536  #define mmDIG0_HDMI_ACR_44_1 0x1C3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2537  #define mmDIG0_HDMI_ACR_48_0 0x1C3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2538  #define mmDIG0_HDMI_ACR_48_1 0x1C3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2539  #define mmDIG0_HDMI_ACR_PACKET_CONTROL 0x1C0F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2540  #define mmDIG0_HDMI_ACR_STATUS_0 0x1C3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2541  #define mmDIG0_HDMI_ACR_STATUS_1 0x1C3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2542  #define mmDIG0_HDMI_AUDIO_PACKET_CONTROL 0x1C0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2543  #define mmDIG0_HDMI_CONTROL 0x1C0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2544  #define mmDIG0_HDMI_GC 0x1C16
de2bdb3dcf92280 Tom St Denis 2016-10-26  2545  #define mmDIG0_HDMI_GENERIC_PACKET_CONTROL0 0x1C13
de2bdb3dcf92280 Tom St Denis 2016-10-26  2546  #define mmDIG0_HDMI_GENERIC_PACKET_CONTROL1 0x1C30
de2bdb3dcf92280 Tom St Denis 2016-10-26  2547  #define mmDIG0_HDMI_INFOFRAME_CONTROL0 0x1C11
de2bdb3dcf92280 Tom St Denis 2016-10-26  2548  #define mmDIG0_HDMI_INFOFRAME_CONTROL1 0x1C12
de2bdb3dcf92280 Tom St Denis 2016-10-26  2549  #define mmDIG0_HDMI_STATUS 0x1C0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2550  #define mmDIG0_HDMI_VBI_PACKET_CONTROL 0x1C10
de2bdb3dcf92280 Tom St Denis 2016-10-26  2551  #define mmDIG0_LVDS_DATA_CNTL 0x1C8C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2552  #define mmDIG0_TMDS_CNTL 0x1C7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2553  #define mmDIG0_TMDS_CONTROL0_FEEDBACK 0x1C7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2554  #define mmDIG0_TMDS_CONTROL_CHAR 0x1C7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2555  #define mmDIG0_TMDS_CTL0_1_GEN_CNTL 0x1C86
de2bdb3dcf92280 Tom St Denis 2016-10-26  2556  #define mmDIG0_TMDS_CTL2_3_GEN_CNTL 0x1C87
de2bdb3dcf92280 Tom St Denis 2016-10-26  2557  #define mmDIG0_TMDS_CTL_BITS 0x1C83
de2bdb3dcf92280 Tom St Denis 2016-10-26  2558  #define mmDIG0_TMDS_DCBALANCER_CONTROL 0x1C84
de2bdb3dcf92280 Tom St Denis 2016-10-26  2559  #define mmDIG0_TMDS_DEBUG 0x1C82
de2bdb3dcf92280 Tom St Denis 2016-10-26  2560  #define mmDIG0_TMDS_STEREOSYNC_CTL_SEL 0x1C7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2561  #define mmDIG0_TMDS_SYNC_CHAR_PATTERN_0_1 0x1C80
de2bdb3dcf92280 Tom St Denis 2016-10-26  2562  #define mmDIG0_TMDS_SYNC_CHAR_PATTERN_2_3 0x1C81
de2bdb3dcf92280 Tom St Denis 2016-10-26  2563  #define mmDIG1_AFMT_60958_0 0x1F41
de2bdb3dcf92280 Tom St Denis 2016-10-26  2564  #define mmDIG1_AFMT_60958_1 0x1F42
de2bdb3dcf92280 Tom St Denis 2016-10-26  2565  #define mmDIG1_AFMT_60958_2 0x1F48
de2bdb3dcf92280 Tom St Denis 2016-10-26  2566  #define mmDIG1_AFMT_AUDIO_CRC_CONTROL 0x1F43
de2bdb3dcf92280 Tom St Denis 2016-10-26  2567  #define mmDIG1_AFMT_AUDIO_CRC_RESULT 0x1F49
de2bdb3dcf92280 Tom St Denis 2016-10-26  2568  #define mmDIG1_AFMT_AUDIO_DBG_DTO_CNTL 0x1F52
de2bdb3dcf92280 Tom St Denis 2016-10-26  2569  #define mmDIG1_AFMT_AUDIO_INFO0 0x1F3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2570  #define mmDIG1_AFMT_AUDIO_INFO1 0x1F40
de2bdb3dcf92280 Tom St Denis 2016-10-26  2571  #define mmDIG1_AFMT_AUDIO_PACKET_CONTROL 0x1F4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2572  #define mmDIG1_AFMT_AUDIO_PACKET_CONTROL2 0x1F17
de2bdb3dcf92280 Tom St Denis 2016-10-26  2573  #define mmDIG1_AFMT_AUDIO_SRC_CONTROL 0x1F4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2574  #define mmDIG1_AFMT_AVI_INFO0 0x1F21
de2bdb3dcf92280 Tom St Denis 2016-10-26  2575  #define mmDIG1_AFMT_AVI_INFO1 0x1F22
de2bdb3dcf92280 Tom St Denis 2016-10-26  2576  #define mmDIG1_AFMT_AVI_INFO2 0x1F23
de2bdb3dcf92280 Tom St Denis 2016-10-26  2577  #define mmDIG1_AFMT_AVI_INFO3 0x1F24
de2bdb3dcf92280 Tom St Denis 2016-10-26  2578  #define mmDIG1_AFMT_GENERIC_0 0x1F28
de2bdb3dcf92280 Tom St Denis 2016-10-26  2579  #define mmDIG1_AFMT_GENERIC_1 0x1F29
de2bdb3dcf92280 Tom St Denis 2016-10-26  2580  #define mmDIG1_AFMT_GENERIC_2 0x1F2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2581  #define mmDIG1_AFMT_GENERIC_3 0x1F2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2582  #define mmDIG1_AFMT_GENERIC_4 0x1F2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2583  #define mmDIG1_AFMT_GENERIC_5 0x1F2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2584  #define mmDIG1_AFMT_GENERIC_6 0x1F2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2585  #define mmDIG1_AFMT_GENERIC_7 0x1F2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2586  #define mmDIG1_AFMT_GENERIC_HDR 0x1F27
de2bdb3dcf92280 Tom St Denis 2016-10-26  2587  #define mmDIG1_AFMT_INFOFRAME_CONTROL0 0x1F4D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2588  #define mmDIG1_AFMT_INTERRUPT_STATUS 0x1F14
de2bdb3dcf92280 Tom St Denis 2016-10-26  2589  #define mmDIG1_AFMT_ISRC1_0 0x1F18
de2bdb3dcf92280 Tom St Denis 2016-10-26  2590  #define mmDIG1_AFMT_ISRC1_1 0x1F19
de2bdb3dcf92280 Tom St Denis 2016-10-26  2591  #define mmDIG1_AFMT_ISRC1_2 0x1F1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2592  #define mmDIG1_AFMT_ISRC1_3 0x1F1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2593  #define mmDIG1_AFMT_ISRC1_4 0x1F1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2594  #define mmDIG1_AFMT_ISRC2_0 0x1F1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2595  #define mmDIG1_AFMT_ISRC2_1 0x1F1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2596  #define mmDIG1_AFMT_ISRC2_2 0x1F1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2597  #define mmDIG1_AFMT_ISRC2_3 0x1F20
de2bdb3dcf92280 Tom St Denis 2016-10-26  2598  #define mmDIG1_AFMT_MPEG_INFO0 0x1F25
de2bdb3dcf92280 Tom St Denis 2016-10-26  2599  #define mmDIG1_AFMT_MPEG_INFO1 0x1F26
de2bdb3dcf92280 Tom St Denis 2016-10-26  2600  #define mmDIG1_AFMT_RAMP_CONTROL0 0x1F44
de2bdb3dcf92280 Tom St Denis 2016-10-26  2601  #define mmDIG1_AFMT_RAMP_CONTROL1 0x1F45
de2bdb3dcf92280 Tom St Denis 2016-10-26  2602  #define mmDIG1_AFMT_RAMP_CONTROL2 0x1F46
de2bdb3dcf92280 Tom St Denis 2016-10-26  2603  #define mmDIG1_AFMT_RAMP_CONTROL3 0x1F47
de2bdb3dcf92280 Tom St Denis 2016-10-26  2604  #define mmDIG1_AFMT_STATUS 0x1F4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2605  #define mmDIG1_AFMT_VBI_PACKET_CONTROL 0x1F4C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2606  #define mmDIG1_DIG_BE_CNTL 0x1F50
de2bdb3dcf92280 Tom St Denis 2016-10-26  2607  #define mmDIG1_DIG_BE_EN_CNTL 0x1F51
de2bdb3dcf92280 Tom St Denis 2016-10-26  2608  #define mmDIG1_DIG_CLOCK_PATTERN 0x1F03
de2bdb3dcf92280 Tom St Denis 2016-10-26  2609  #define mmDIG1_DIG_DISPCLK_SWITCH_CNTL 0x1F08
de2bdb3dcf92280 Tom St Denis 2016-10-26  2610  #define mmDIG1_DIG_DISPCLK_SWITCH_STATUS 0x1F09
de2bdb3dcf92280 Tom St Denis 2016-10-26  2611  #define mmDIG1_DIG_FE_CNTL 0x1F00
de2bdb3dcf92280 Tom St Denis 2016-10-26  2612  #define mmDIG1_DIG_FIFO_STATUS 0x1F0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2613  #define mmDIG1_DIG_LANE_ENABLE 0x1F8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2614  #define mmDIG1_DIG_OUTPUT_CRC_CNTL 0x1F01
de2bdb3dcf92280 Tom St Denis 2016-10-26  2615  #define mmDIG1_DIG_OUTPUT_CRC_RESULT 0x1F02
de2bdb3dcf92280 Tom St Denis 2016-10-26  2616  #define mmDIG1_DIG_RANDOM_PATTERN_SEED 0x1F05
de2bdb3dcf92280 Tom St Denis 2016-10-26  2617  #define mmDIG1_DIG_TEST_PATTERN 0x1F04
de2bdb3dcf92280 Tom St Denis 2016-10-26  2618  #define mmDIG1_HDMI_ACR_32_0 0x1F37
de2bdb3dcf92280 Tom St Denis 2016-10-26  2619  #define mmDIG1_HDMI_ACR_32_1 0x1F38
de2bdb3dcf92280 Tom St Denis 2016-10-26  2620  #define mmDIG1_HDMI_ACR_44_0 0x1F39
de2bdb3dcf92280 Tom St Denis 2016-10-26  2621  #define mmDIG1_HDMI_ACR_44_1 0x1F3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2622  #define mmDIG1_HDMI_ACR_48_0 0x1F3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2623  #define mmDIG1_HDMI_ACR_48_1 0x1F3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2624  #define mmDIG1_HDMI_ACR_PACKET_CONTROL 0x1F0F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2625  #define mmDIG1_HDMI_ACR_STATUS_0 0x1F3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2626  #define mmDIG1_HDMI_ACR_STATUS_1 0x1F3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2627  #define mmDIG1_HDMI_AUDIO_PACKET_CONTROL 0x1F0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2628  #define mmDIG1_HDMI_CONTROL 0x1F0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2629  #define mmDIG1_HDMI_GC 0x1F16
de2bdb3dcf92280 Tom St Denis 2016-10-26  2630  #define mmDIG1_HDMI_GENERIC_PACKET_CONTROL0 0x1F13
de2bdb3dcf92280 Tom St Denis 2016-10-26  2631  #define mmDIG1_HDMI_GENERIC_PACKET_CONTROL1 0x1F30
de2bdb3dcf92280 Tom St Denis 2016-10-26  2632  #define mmDIG1_HDMI_INFOFRAME_CONTROL0 0x1F11
de2bdb3dcf92280 Tom St Denis 2016-10-26  2633  #define mmDIG1_HDMI_INFOFRAME_CONTROL1 0x1F12
de2bdb3dcf92280 Tom St Denis 2016-10-26  2634  #define mmDIG1_HDMI_STATUS 0x1F0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2635  #define mmDIG1_HDMI_VBI_PACKET_CONTROL 0x1F10
de2bdb3dcf92280 Tom St Denis 2016-10-26  2636  #define mmDIG1_LVDS_DATA_CNTL 0x1F8C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2637  #define mmDIG1_TMDS_CNTL 0x1F7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2638  #define mmDIG1_TMDS_CONTROL0_FEEDBACK 0x1F7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2639  #define mmDIG1_TMDS_CONTROL_CHAR 0x1F7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2640  #define mmDIG1_TMDS_CTL0_1_GEN_CNTL 0x1F86
de2bdb3dcf92280 Tom St Denis 2016-10-26  2641  #define mmDIG1_TMDS_CTL2_3_GEN_CNTL 0x1F87
de2bdb3dcf92280 Tom St Denis 2016-10-26  2642  #define mmDIG1_TMDS_CTL_BITS 0x1F83
de2bdb3dcf92280 Tom St Denis 2016-10-26  2643  #define mmDIG1_TMDS_DCBALANCER_CONTROL 0x1F84
de2bdb3dcf92280 Tom St Denis 2016-10-26  2644  #define mmDIG1_TMDS_DEBUG 0x1F82
de2bdb3dcf92280 Tom St Denis 2016-10-26  2645  #define mmDIG1_TMDS_STEREOSYNC_CTL_SEL 0x1F7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2646  #define mmDIG1_TMDS_SYNC_CHAR_PATTERN_0_1 0x1F80
de2bdb3dcf92280 Tom St Denis 2016-10-26  2647  #define mmDIG1_TMDS_SYNC_CHAR_PATTERN_2_3 0x1F81
de2bdb3dcf92280 Tom St Denis 2016-10-26  2648  #define mmDIG2_AFMT_60958_0 0x4241
de2bdb3dcf92280 Tom St Denis 2016-10-26  2649  #define mmDIG2_AFMT_60958_1 0x4242
de2bdb3dcf92280 Tom St Denis 2016-10-26  2650  #define mmDIG2_AFMT_60958_2 0x4248
de2bdb3dcf92280 Tom St Denis 2016-10-26  2651  #define mmDIG2_AFMT_AUDIO_CRC_CONTROL 0x4243
de2bdb3dcf92280 Tom St Denis 2016-10-26  2652  #define mmDIG2_AFMT_AUDIO_CRC_RESULT 0x4249
de2bdb3dcf92280 Tom St Denis 2016-10-26  2653  #define mmDIG2_AFMT_AUDIO_DBG_DTO_CNTL 0x4252
de2bdb3dcf92280 Tom St Denis 2016-10-26  2654  #define mmDIG2_AFMT_AUDIO_INFO0 0x423F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2655  #define mmDIG2_AFMT_AUDIO_INFO1 0x4240
de2bdb3dcf92280 Tom St Denis 2016-10-26  2656  #define mmDIG2_AFMT_AUDIO_PACKET_CONTROL 0x424B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2657  #define mmDIG2_AFMT_AUDIO_PACKET_CONTROL2 0x4217
de2bdb3dcf92280 Tom St Denis 2016-10-26  2658  #define mmDIG2_AFMT_AUDIO_SRC_CONTROL 0x424F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2659  #define mmDIG2_AFMT_AVI_INFO0 0x4221
de2bdb3dcf92280 Tom St Denis 2016-10-26  2660  #define mmDIG2_AFMT_AVI_INFO1 0x4222
de2bdb3dcf92280 Tom St Denis 2016-10-26  2661  #define mmDIG2_AFMT_AVI_INFO2 0x4223
de2bdb3dcf92280 Tom St Denis 2016-10-26  2662  #define mmDIG2_AFMT_AVI_INFO3 0x4224
de2bdb3dcf92280 Tom St Denis 2016-10-26  2663  #define mmDIG2_AFMT_GENERIC_0 0x4228
de2bdb3dcf92280 Tom St Denis 2016-10-26  2664  #define mmDIG2_AFMT_GENERIC_1 0x4229
de2bdb3dcf92280 Tom St Denis 2016-10-26  2665  #define mmDIG2_AFMT_GENERIC_2 0x422A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2666  #define mmDIG2_AFMT_GENERIC_3 0x422B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2667  #define mmDIG2_AFMT_GENERIC_4 0x422C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2668  #define mmDIG2_AFMT_GENERIC_5 0x422D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2669  #define mmDIG2_AFMT_GENERIC_6 0x422E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2670  #define mmDIG2_AFMT_GENERIC_7 0x422F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2671  #define mmDIG2_AFMT_GENERIC_HDR 0x4227
de2bdb3dcf92280 Tom St Denis 2016-10-26  2672  #define mmDIG2_AFMT_INFOFRAME_CONTROL0 0x424D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2673  #define mmDIG2_AFMT_INTERRUPT_STATUS 0x4214
de2bdb3dcf92280 Tom St Denis 2016-10-26  2674  #define mmDIG2_AFMT_ISRC1_0 0x4218
de2bdb3dcf92280 Tom St Denis 2016-10-26  2675  #define mmDIG2_AFMT_ISRC1_1 0x4219
de2bdb3dcf92280 Tom St Denis 2016-10-26  2676  #define mmDIG2_AFMT_ISRC1_2 0x421A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2677  #define mmDIG2_AFMT_ISRC1_3 0x421B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2678  #define mmDIG2_AFMT_ISRC1_4 0x421C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2679  #define mmDIG2_AFMT_ISRC2_0 0x421D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2680  #define mmDIG2_AFMT_ISRC2_1 0x421E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2681  #define mmDIG2_AFMT_ISRC2_2 0x421F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2682  #define mmDIG2_AFMT_ISRC2_3 0x4220
de2bdb3dcf92280 Tom St Denis 2016-10-26  2683  #define mmDIG2_AFMT_MPEG_INFO0 0x4225
de2bdb3dcf92280 Tom St Denis 2016-10-26  2684  #define mmDIG2_AFMT_MPEG_INFO1 0x4226
de2bdb3dcf92280 Tom St Denis 2016-10-26  2685  #define mmDIG2_AFMT_RAMP_CONTROL0 0x4244
de2bdb3dcf92280 Tom St Denis 2016-10-26  2686  #define mmDIG2_AFMT_RAMP_CONTROL1 0x4245
de2bdb3dcf92280 Tom St Denis 2016-10-26  2687  #define mmDIG2_AFMT_RAMP_CONTROL2 0x4246
de2bdb3dcf92280 Tom St Denis 2016-10-26  2688  #define mmDIG2_AFMT_RAMP_CONTROL3 0x4247
de2bdb3dcf92280 Tom St Denis 2016-10-26  2689  #define mmDIG2_AFMT_STATUS 0x424A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2690  #define mmDIG2_AFMT_VBI_PACKET_CONTROL 0x424C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2691  #define mmDIG2_DIG_BE_CNTL 0x4250
de2bdb3dcf92280 Tom St Denis 2016-10-26  2692  #define mmDIG2_DIG_BE_EN_CNTL 0x4251
de2bdb3dcf92280 Tom St Denis 2016-10-26  2693  #define mmDIG2_DIG_CLOCK_PATTERN 0x4203
de2bdb3dcf92280 Tom St Denis 2016-10-26  2694  #define mmDIG2_DIG_DISPCLK_SWITCH_CNTL 0x4208
de2bdb3dcf92280 Tom St Denis 2016-10-26  2695  #define mmDIG2_DIG_DISPCLK_SWITCH_STATUS 0x4209
de2bdb3dcf92280 Tom St Denis 2016-10-26  2696  #define mmDIG2_DIG_FE_CNTL 0x4200
de2bdb3dcf92280 Tom St Denis 2016-10-26  2697  #define mmDIG2_DIG_FIFO_STATUS 0x420A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2698  #define mmDIG2_DIG_LANE_ENABLE 0x428D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2699  #define mmDIG2_DIG_OUTPUT_CRC_CNTL 0x4201
de2bdb3dcf92280 Tom St Denis 2016-10-26  2700  #define mmDIG2_DIG_OUTPUT_CRC_RESULT 0x4202
de2bdb3dcf92280 Tom St Denis 2016-10-26  2701  #define mmDIG2_DIG_RANDOM_PATTERN_SEED 0x4205
de2bdb3dcf92280 Tom St Denis 2016-10-26  2702  #define mmDIG2_DIG_TEST_PATTERN 0x4204
de2bdb3dcf92280 Tom St Denis 2016-10-26  2703  #define mmDIG2_HDMI_ACR_32_0 0x4237
de2bdb3dcf92280 Tom St Denis 2016-10-26  2704  #define mmDIG2_HDMI_ACR_32_1 0x4238
de2bdb3dcf92280 Tom St Denis 2016-10-26  2705  #define mmDIG2_HDMI_ACR_44_0 0x4239
de2bdb3dcf92280 Tom St Denis 2016-10-26  2706  #define mmDIG2_HDMI_ACR_44_1 0x423A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2707  #define mmDIG2_HDMI_ACR_48_0 0x423B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2708  #define mmDIG2_HDMI_ACR_48_1 0x423C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2709  #define mmDIG2_HDMI_ACR_PACKET_CONTROL 0x420F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2710  #define mmDIG2_HDMI_ACR_STATUS_0 0x423D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2711  #define mmDIG2_HDMI_ACR_STATUS_1 0x423E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2712  #define mmDIG2_HDMI_AUDIO_PACKET_CONTROL 0x420E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2713  #define mmDIG2_HDMI_CONTROL 0x420C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2714  #define mmDIG2_HDMI_GC 0x4216
de2bdb3dcf92280 Tom St Denis 2016-10-26  2715  #define mmDIG2_HDMI_GENERIC_PACKET_CONTROL0 0x4213
de2bdb3dcf92280 Tom St Denis 2016-10-26  2716  #define mmDIG2_HDMI_GENERIC_PACKET_CONTROL1 0x4230
de2bdb3dcf92280 Tom St Denis 2016-10-26  2717  #define mmDIG2_HDMI_INFOFRAME_CONTROL0 0x4211
de2bdb3dcf92280 Tom St Denis 2016-10-26  2718  #define mmDIG2_HDMI_INFOFRAME_CONTROL1 0x4212
de2bdb3dcf92280 Tom St Denis 2016-10-26  2719  #define mmDIG2_HDMI_STATUS 0x420D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2720  #define mmDIG2_HDMI_VBI_PACKET_CONTROL 0x4210
de2bdb3dcf92280 Tom St Denis 2016-10-26  2721  #define mmDIG2_LVDS_DATA_CNTL 0x428C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2722  #define mmDIG2_TMDS_CNTL 0x427C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2723  #define mmDIG2_TMDS_CONTROL0_FEEDBACK 0x427E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2724  #define mmDIG2_TMDS_CONTROL_CHAR 0x427D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2725  #define mmDIG2_TMDS_CTL0_1_GEN_CNTL 0x4286
de2bdb3dcf92280 Tom St Denis 2016-10-26  2726  #define mmDIG2_TMDS_CTL2_3_GEN_CNTL 0x4287
de2bdb3dcf92280 Tom St Denis 2016-10-26  2727  #define mmDIG2_TMDS_CTL_BITS 0x4283
de2bdb3dcf92280 Tom St Denis 2016-10-26  2728  #define mmDIG2_TMDS_DCBALANCER_CONTROL 0x4284
de2bdb3dcf92280 Tom St Denis 2016-10-26  2729  #define mmDIG2_TMDS_DEBUG 0x4282
de2bdb3dcf92280 Tom St Denis 2016-10-26  2730  #define mmDIG2_TMDS_STEREOSYNC_CTL_SEL 0x427F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2731  #define mmDIG2_TMDS_SYNC_CHAR_PATTERN_0_1 0x4280
de2bdb3dcf92280 Tom St Denis 2016-10-26  2732  #define mmDIG2_TMDS_SYNC_CHAR_PATTERN_2_3 0x4281
de2bdb3dcf92280 Tom St Denis 2016-10-26  2733  #define mmDIG3_AFMT_60958_0 0x4541
de2bdb3dcf92280 Tom St Denis 2016-10-26  2734  #define mmDIG3_AFMT_60958_1 0x4542
de2bdb3dcf92280 Tom St Denis 2016-10-26  2735  #define mmDIG3_AFMT_60958_2 0x4548
de2bdb3dcf92280 Tom St Denis 2016-10-26  2736  #define mmDIG3_AFMT_AUDIO_CRC_CONTROL 0x4543
de2bdb3dcf92280 Tom St Denis 2016-10-26  2737  #define mmDIG3_AFMT_AUDIO_CRC_RESULT 0x4549
de2bdb3dcf92280 Tom St Denis 2016-10-26  2738  #define mmDIG3_AFMT_AUDIO_DBG_DTO_CNTL 0x4552
de2bdb3dcf92280 Tom St Denis 2016-10-26  2739  #define mmDIG3_AFMT_AUDIO_INFO0 0x453F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2740  #define mmDIG3_AFMT_AUDIO_INFO1 0x4540
de2bdb3dcf92280 Tom St Denis 2016-10-26  2741  #define mmDIG3_AFMT_AUDIO_PACKET_CONTROL 0x454B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2742  #define mmDIG3_AFMT_AUDIO_PACKET_CONTROL2 0x4517
de2bdb3dcf92280 Tom St Denis 2016-10-26  2743  #define mmDIG3_AFMT_AUDIO_SRC_CONTROL 0x454F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2744  #define mmDIG3_AFMT_AVI_INFO0 0x4521
de2bdb3dcf92280 Tom St Denis 2016-10-26  2745  #define mmDIG3_AFMT_AVI_INFO1 0x4522
de2bdb3dcf92280 Tom St Denis 2016-10-26  2746  #define mmDIG3_AFMT_AVI_INFO2 0x4523
de2bdb3dcf92280 Tom St Denis 2016-10-26  2747  #define mmDIG3_AFMT_AVI_INFO3 0x4524
de2bdb3dcf92280 Tom St Denis 2016-10-26  2748  #define mmDIG3_AFMT_GENERIC_0 0x4528
de2bdb3dcf92280 Tom St Denis 2016-10-26  2749  #define mmDIG3_AFMT_GENERIC_1 0x4529
de2bdb3dcf92280 Tom St Denis 2016-10-26  2750  #define mmDIG3_AFMT_GENERIC_2 0x452A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2751  #define mmDIG3_AFMT_GENERIC_3 0x452B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2752  #define mmDIG3_AFMT_GENERIC_4 0x452C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2753  #define mmDIG3_AFMT_GENERIC_5 0x452D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2754  #define mmDIG3_AFMT_GENERIC_6 0x452E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2755  #define mmDIG3_AFMT_GENERIC_7 0x452F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2756  #define mmDIG3_AFMT_GENERIC_HDR 0x4527
de2bdb3dcf92280 Tom St Denis 2016-10-26  2757  #define mmDIG3_AFMT_INFOFRAME_CONTROL0 0x454D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2758  #define mmDIG3_AFMT_INTERRUPT_STATUS 0x4514
de2bdb3dcf92280 Tom St Denis 2016-10-26  2759  #define mmDIG3_AFMT_ISRC1_0 0x4518
de2bdb3dcf92280 Tom St Denis 2016-10-26  2760  #define mmDIG3_AFMT_ISRC1_1 0x4519
de2bdb3dcf92280 Tom St Denis 2016-10-26  2761  #define mmDIG3_AFMT_ISRC1_2 0x451A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2762  #define mmDIG3_AFMT_ISRC1_3 0x451B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2763  #define mmDIG3_AFMT_ISRC1_4 0x451C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2764  #define mmDIG3_AFMT_ISRC2_0 0x451D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2765  #define mmDIG3_AFMT_ISRC2_1 0x451E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2766  #define mmDIG3_AFMT_ISRC2_2 0x451F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2767  #define mmDIG3_AFMT_ISRC2_3 0x4520
de2bdb3dcf92280 Tom St Denis 2016-10-26  2768  #define mmDIG3_AFMT_MPEG_INFO0 0x4525
de2bdb3dcf92280 Tom St Denis 2016-10-26  2769  #define mmDIG3_AFMT_MPEG_INFO1 0x4526
de2bdb3dcf92280 Tom St Denis 2016-10-26  2770  #define mmDIG3_AFMT_RAMP_CONTROL0 0x4544
de2bdb3dcf92280 Tom St Denis 2016-10-26  2771  #define mmDIG3_AFMT_RAMP_CONTROL1 0x4545
de2bdb3dcf92280 Tom St Denis 2016-10-26  2772  #define mmDIG3_AFMT_RAMP_CONTROL2 0x4546
de2bdb3dcf92280 Tom St Denis 2016-10-26  2773  #define mmDIG3_AFMT_RAMP_CONTROL3 0x4547
de2bdb3dcf92280 Tom St Denis 2016-10-26  2774  #define mmDIG3_AFMT_STATUS 0x454A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2775  #define mmDIG3_AFMT_VBI_PACKET_CONTROL 0x454C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2776  #define mmDIG3_DIG_BE_CNTL 0x4550
de2bdb3dcf92280 Tom St Denis 2016-10-26  2777  #define mmDIG3_DIG_BE_EN_CNTL 0x4551
de2bdb3dcf92280 Tom St Denis 2016-10-26  2778  #define mmDIG3_DIG_CLOCK_PATTERN 0x4503
de2bdb3dcf92280 Tom St Denis 2016-10-26  2779  #define mmDIG3_DIG_DISPCLK_SWITCH_CNTL 0x4508
de2bdb3dcf92280 Tom St Denis 2016-10-26  2780  #define mmDIG3_DIG_DISPCLK_SWITCH_STATUS 0x4509
de2bdb3dcf92280 Tom St Denis 2016-10-26  2781  #define mmDIG3_DIG_FE_CNTL 0x4500
de2bdb3dcf92280 Tom St Denis 2016-10-26  2782  #define mmDIG3_DIG_FIFO_STATUS 0x450A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2783  #define mmDIG3_DIG_LANE_ENABLE 0x458D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2784  #define mmDIG3_DIG_OUTPUT_CRC_CNTL 0x4501
de2bdb3dcf92280 Tom St Denis 2016-10-26  2785  #define mmDIG3_DIG_OUTPUT_CRC_RESULT 0x4502
de2bdb3dcf92280 Tom St Denis 2016-10-26  2786  #define mmDIG3_DIG_RANDOM_PATTERN_SEED 0x4505
de2bdb3dcf92280 Tom St Denis 2016-10-26  2787  #define mmDIG3_DIG_TEST_PATTERN 0x4504
de2bdb3dcf92280 Tom St Denis 2016-10-26  2788  #define mmDIG3_HDMI_ACR_32_0 0x4537
de2bdb3dcf92280 Tom St Denis 2016-10-26  2789  #define mmDIG3_HDMI_ACR_32_1 0x4538
de2bdb3dcf92280 Tom St Denis 2016-10-26  2790  #define mmDIG3_HDMI_ACR_44_0 0x4539
de2bdb3dcf92280 Tom St Denis 2016-10-26  2791  #define mmDIG3_HDMI_ACR_44_1 0x453A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2792  #define mmDIG3_HDMI_ACR_48_0 0x453B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2793  #define mmDIG3_HDMI_ACR_48_1 0x453C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2794  #define mmDIG3_HDMI_ACR_PACKET_CONTROL 0x450F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2795  #define mmDIG3_HDMI_ACR_STATUS_0 0x453D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2796  #define mmDIG3_HDMI_ACR_STATUS_1 0x453E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2797  #define mmDIG3_HDMI_AUDIO_PACKET_CONTROL 0x450E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2798  #define mmDIG3_HDMI_CONTROL 0x450C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2799  #define mmDIG3_HDMI_GC 0x4516
de2bdb3dcf92280 Tom St Denis 2016-10-26  2800  #define mmDIG3_HDMI_GENERIC_PACKET_CONTROL0 0x4513
de2bdb3dcf92280 Tom St Denis 2016-10-26  2801  #define mmDIG3_HDMI_GENERIC_PACKET_CONTROL1 0x4530
de2bdb3dcf92280 Tom St Denis 2016-10-26  2802  #define mmDIG3_HDMI_INFOFRAME_CONTROL0 0x4511
de2bdb3dcf92280 Tom St Denis 2016-10-26  2803  #define mmDIG3_HDMI_INFOFRAME_CONTROL1 0x4512
de2bdb3dcf92280 Tom St Denis 2016-10-26  2804  #define mmDIG3_HDMI_STATUS 0x450D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2805  #define mmDIG3_HDMI_VBI_PACKET_CONTROL 0x4510
de2bdb3dcf92280 Tom St Denis 2016-10-26  2806  #define mmDIG3_LVDS_DATA_CNTL 0x458C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2807  #define mmDIG3_TMDS_CNTL 0x457C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2808  #define mmDIG3_TMDS_CONTROL0_FEEDBACK 0x457E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2809  #define mmDIG3_TMDS_CONTROL_CHAR 0x457D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2810  #define mmDIG3_TMDS_CTL0_1_GEN_CNTL 0x4586
de2bdb3dcf92280 Tom St Denis 2016-10-26  2811  #define mmDIG3_TMDS_CTL2_3_GEN_CNTL 0x4587
de2bdb3dcf92280 Tom St Denis 2016-10-26  2812  #define mmDIG3_TMDS_CTL_BITS 0x4583
de2bdb3dcf92280 Tom St Denis 2016-10-26  2813  #define mmDIG3_TMDS_DCBALANCER_CONTROL 0x4584
de2bdb3dcf92280 Tom St Denis 2016-10-26  2814  #define mmDIG3_TMDS_DEBUG 0x4582
de2bdb3dcf92280 Tom St Denis 2016-10-26  2815  #define mmDIG3_TMDS_STEREOSYNC_CTL_SEL 0x457F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2816  #define mmDIG3_TMDS_SYNC_CHAR_PATTERN_0_1 0x4580
de2bdb3dcf92280 Tom St Denis 2016-10-26  2817  #define mmDIG3_TMDS_SYNC_CHAR_PATTERN_2_3 0x4581
de2bdb3dcf92280 Tom St Denis 2016-10-26  2818  #define mmDIG4_AFMT_60958_0 0x4841
de2bdb3dcf92280 Tom St Denis 2016-10-26  2819  #define mmDIG4_AFMT_60958_1 0x4842
de2bdb3dcf92280 Tom St Denis 2016-10-26  2820  #define mmDIG4_AFMT_60958_2 0x4848
de2bdb3dcf92280 Tom St Denis 2016-10-26  2821  #define mmDIG4_AFMT_AUDIO_CRC_CONTROL 0x4843
de2bdb3dcf92280 Tom St Denis 2016-10-26  2822  #define mmDIG4_AFMT_AUDIO_CRC_RESULT 0x4849
de2bdb3dcf92280 Tom St Denis 2016-10-26  2823  #define mmDIG4_AFMT_AUDIO_DBG_DTO_CNTL 0x4852
de2bdb3dcf92280 Tom St Denis 2016-10-26  2824  #define mmDIG4_AFMT_AUDIO_INFO0 0x483F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2825  #define mmDIG4_AFMT_AUDIO_INFO1 0x4840
de2bdb3dcf92280 Tom St Denis 2016-10-26  2826  #define mmDIG4_AFMT_AUDIO_PACKET_CONTROL 0x484B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2827  #define mmDIG4_AFMT_AUDIO_PACKET_CONTROL2 0x4817
de2bdb3dcf92280 Tom St Denis 2016-10-26  2828  #define mmDIG4_AFMT_AUDIO_SRC_CONTROL 0x484F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2829  #define mmDIG4_AFMT_AVI_INFO0 0x4821
de2bdb3dcf92280 Tom St Denis 2016-10-26  2830  #define mmDIG4_AFMT_AVI_INFO1 0x4822
de2bdb3dcf92280 Tom St Denis 2016-10-26  2831  #define mmDIG4_AFMT_AVI_INFO2 0x4823
de2bdb3dcf92280 Tom St Denis 2016-10-26  2832  #define mmDIG4_AFMT_AVI_INFO3 0x4824
de2bdb3dcf92280 Tom St Denis 2016-10-26  2833  #define mmDIG4_AFMT_GENERIC_0 0x4828
de2bdb3dcf92280 Tom St Denis 2016-10-26  2834  #define mmDIG4_AFMT_GENERIC_1 0x4829
de2bdb3dcf92280 Tom St Denis 2016-10-26  2835  #define mmDIG4_AFMT_GENERIC_2 0x482A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2836  #define mmDIG4_AFMT_GENERIC_3 0x482B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2837  #define mmDIG4_AFMT_GENERIC_4 0x482C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2838  #define mmDIG4_AFMT_GENERIC_5 0x482D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2839  #define mmDIG4_AFMT_GENERIC_6 0x482E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2840  #define mmDIG4_AFMT_GENERIC_7 0x482F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2841  #define mmDIG4_AFMT_GENERIC_HDR 0x4827
de2bdb3dcf92280 Tom St Denis 2016-10-26  2842  #define mmDIG4_AFMT_INFOFRAME_CONTROL0 0x484D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2843  #define mmDIG4_AFMT_INTERRUPT_STATUS 0x4814
de2bdb3dcf92280 Tom St Denis 2016-10-26  2844  #define mmDIG4_AFMT_ISRC1_0 0x4818
de2bdb3dcf92280 Tom St Denis 2016-10-26  2845  #define mmDIG4_AFMT_ISRC1_1 0x4819
de2bdb3dcf92280 Tom St Denis 2016-10-26  2846  #define mmDIG4_AFMT_ISRC1_2 0x481A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2847  #define mmDIG4_AFMT_ISRC1_3 0x481B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2848  #define mmDIG4_AFMT_ISRC1_4 0x481C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2849  #define mmDIG4_AFMT_ISRC2_0 0x481D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2850  #define mmDIG4_AFMT_ISRC2_1 0x481E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2851  #define mmDIG4_AFMT_ISRC2_2 0x481F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2852  #define mmDIG4_AFMT_ISRC2_3 0x4820
de2bdb3dcf92280 Tom St Denis 2016-10-26  2853  #define mmDIG4_AFMT_MPEG_INFO0 0x4825
de2bdb3dcf92280 Tom St Denis 2016-10-26  2854  #define mmDIG4_AFMT_MPEG_INFO1 0x4826
de2bdb3dcf92280 Tom St Denis 2016-10-26  2855  #define mmDIG4_AFMT_RAMP_CONTROL0 0x4844
de2bdb3dcf92280 Tom St Denis 2016-10-26  2856  #define mmDIG4_AFMT_RAMP_CONTROL1 0x4845
de2bdb3dcf92280 Tom St Denis 2016-10-26  2857  #define mmDIG4_AFMT_RAMP_CONTROL2 0x4846
de2bdb3dcf92280 Tom St Denis 2016-10-26  2858  #define mmDIG4_AFMT_RAMP_CONTROL3 0x4847
de2bdb3dcf92280 Tom St Denis 2016-10-26  2859  #define mmDIG4_AFMT_STATUS 0x484A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2860  #define mmDIG4_AFMT_VBI_PACKET_CONTROL 0x484C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2861  #define mmDIG4_DIG_BE_CNTL 0x4850
de2bdb3dcf92280 Tom St Denis 2016-10-26  2862  #define mmDIG4_DIG_BE_EN_CNTL 0x4851
de2bdb3dcf92280 Tom St Denis 2016-10-26  2863  #define mmDIG4_DIG_CLOCK_PATTERN 0x4803
de2bdb3dcf92280 Tom St Denis 2016-10-26  2864  #define mmDIG4_DIG_DISPCLK_SWITCH_CNTL 0x4808
de2bdb3dcf92280 Tom St Denis 2016-10-26  2865  #define mmDIG4_DIG_DISPCLK_SWITCH_STATUS 0x4809
de2bdb3dcf92280 Tom St Denis 2016-10-26  2866  #define mmDIG4_DIG_FE_CNTL 0x4800
de2bdb3dcf92280 Tom St Denis 2016-10-26  2867  #define mmDIG4_DIG_FIFO_STATUS 0x480A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2868  #define mmDIG4_DIG_LANE_ENABLE 0x488D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2869  #define mmDIG4_DIG_OUTPUT_CRC_CNTL 0x4801
de2bdb3dcf92280 Tom St Denis 2016-10-26  2870  #define mmDIG4_DIG_OUTPUT_CRC_RESULT 0x4802
de2bdb3dcf92280 Tom St Denis 2016-10-26  2871  #define mmDIG4_DIG_RANDOM_PATTERN_SEED 0x4805
de2bdb3dcf92280 Tom St Denis 2016-10-26  2872  #define mmDIG4_DIG_TEST_PATTERN 0x4804
de2bdb3dcf92280 Tom St Denis 2016-10-26  2873  #define mmDIG4_HDMI_ACR_32_0 0x4837
de2bdb3dcf92280 Tom St Denis 2016-10-26  2874  #define mmDIG4_HDMI_ACR_32_1 0x4838
de2bdb3dcf92280 Tom St Denis 2016-10-26  2875  #define mmDIG4_HDMI_ACR_44_0 0x4839
de2bdb3dcf92280 Tom St Denis 2016-10-26  2876  #define mmDIG4_HDMI_ACR_44_1 0x483A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2877  #define mmDIG4_HDMI_ACR_48_0 0x483B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2878  #define mmDIG4_HDMI_ACR_48_1 0x483C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2879  #define mmDIG4_HDMI_ACR_PACKET_CONTROL 0x480F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2880  #define mmDIG4_HDMI_ACR_STATUS_0 0x483D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2881  #define mmDIG4_HDMI_ACR_STATUS_1 0x483E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2882  #define mmDIG4_HDMI_AUDIO_PACKET_CONTROL 0x480E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2883  #define mmDIG4_HDMI_CONTROL 0x480C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2884  #define mmDIG4_HDMI_GC 0x4816
de2bdb3dcf92280 Tom St Denis 2016-10-26  2885  #define mmDIG4_HDMI_GENERIC_PACKET_CONTROL0 0x4813
de2bdb3dcf92280 Tom St Denis 2016-10-26  2886  #define mmDIG4_HDMI_GENERIC_PACKET_CONTROL1 0x4830
de2bdb3dcf92280 Tom St Denis 2016-10-26  2887  #define mmDIG4_HDMI_INFOFRAME_CONTROL0 0x4811
de2bdb3dcf92280 Tom St Denis 2016-10-26  2888  #define mmDIG4_HDMI_INFOFRAME_CONTROL1 0x4812
de2bdb3dcf92280 Tom St Denis 2016-10-26  2889  #define mmDIG4_HDMI_STATUS 0x480D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2890  #define mmDIG4_HDMI_VBI_PACKET_CONTROL 0x4810
de2bdb3dcf92280 Tom St Denis 2016-10-26  2891  #define mmDIG4_LVDS_DATA_CNTL 0x488C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2892  #define mmDIG4_TMDS_CNTL 0x487C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2893  #define mmDIG4_TMDS_CONTROL0_FEEDBACK 0x487E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2894  #define mmDIG4_TMDS_CONTROL_CHAR 0x487D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2895  #define mmDIG4_TMDS_CTL0_1_GEN_CNTL 0x4886
de2bdb3dcf92280 Tom St Denis 2016-10-26  2896  #define mmDIG4_TMDS_CTL2_3_GEN_CNTL 0x4887
de2bdb3dcf92280 Tom St Denis 2016-10-26  2897  #define mmDIG4_TMDS_CTL_BITS 0x4883
de2bdb3dcf92280 Tom St Denis 2016-10-26  2898  #define mmDIG4_TMDS_DCBALANCER_CONTROL 0x4884
de2bdb3dcf92280 Tom St Denis 2016-10-26  2899  #define mmDIG4_TMDS_DEBUG 0x4882
de2bdb3dcf92280 Tom St Denis 2016-10-26  2900  #define mmDIG4_TMDS_STEREOSYNC_CTL_SEL 0x487F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2901  #define mmDIG4_TMDS_SYNC_CHAR_PATTERN_0_1 0x4880
de2bdb3dcf92280 Tom St Denis 2016-10-26  2902  #define mmDIG4_TMDS_SYNC_CHAR_PATTERN_2_3 0x4881
de2bdb3dcf92280 Tom St Denis 2016-10-26  2903  #define mmDIG5_AFMT_60958_0 0x4B41
de2bdb3dcf92280 Tom St Denis 2016-10-26  2904  #define mmDIG5_AFMT_60958_1 0x4B42
de2bdb3dcf92280 Tom St Denis 2016-10-26  2905  #define mmDIG5_AFMT_60958_2 0x4B48
de2bdb3dcf92280 Tom St Denis 2016-10-26  2906  #define mmDIG5_AFMT_AUDIO_CRC_CONTROL 0x4B43
de2bdb3dcf92280 Tom St Denis 2016-10-26  2907  #define mmDIG5_AFMT_AUDIO_CRC_RESULT 0x4B49
de2bdb3dcf92280 Tom St Denis 2016-10-26  2908  #define mmDIG5_AFMT_AUDIO_DBG_DTO_CNTL 0x4B52
de2bdb3dcf92280 Tom St Denis 2016-10-26  2909  #define mmDIG5_AFMT_AUDIO_INFO0 0x4B3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2910  #define mmDIG5_AFMT_AUDIO_INFO1 0x4B40
de2bdb3dcf92280 Tom St Denis 2016-10-26  2911  #define mmDIG5_AFMT_AUDIO_PACKET_CONTROL 0x4B4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2912  #define mmDIG5_AFMT_AUDIO_PACKET_CONTROL2 0x4B17
de2bdb3dcf92280 Tom St Denis 2016-10-26  2913  #define mmDIG5_AFMT_AUDIO_SRC_CONTROL 0x4B4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2914  #define mmDIG5_AFMT_AVI_INFO0 0x4B21
de2bdb3dcf92280 Tom St Denis 2016-10-26  2915  #define mmDIG5_AFMT_AVI_INFO1 0x4B22
de2bdb3dcf92280 Tom St Denis 2016-10-26  2916  #define mmDIG5_AFMT_AVI_INFO2 0x4B23
de2bdb3dcf92280 Tom St Denis 2016-10-26  2917  #define mmDIG5_AFMT_AVI_INFO3 0x4B24
de2bdb3dcf92280 Tom St Denis 2016-10-26  2918  #define mmDIG5_AFMT_GENERIC_0 0x4B28
de2bdb3dcf92280 Tom St Denis 2016-10-26  2919  #define mmDIG5_AFMT_GENERIC_1 0x4B29
de2bdb3dcf92280 Tom St Denis 2016-10-26  2920  #define mmDIG5_AFMT_GENERIC_2 0x4B2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2921  #define mmDIG5_AFMT_GENERIC_3 0x4B2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2922  #define mmDIG5_AFMT_GENERIC_4 0x4B2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2923  #define mmDIG5_AFMT_GENERIC_5 0x4B2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2924  #define mmDIG5_AFMT_GENERIC_6 0x4B2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2925  #define mmDIG5_AFMT_GENERIC_7 0x4B2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2926  #define mmDIG5_AFMT_GENERIC_HDR 0x4B27
de2bdb3dcf92280 Tom St Denis 2016-10-26  2927  #define mmDIG5_AFMT_INFOFRAME_CONTROL0 0x4B4D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2928  #define mmDIG5_AFMT_INTERRUPT_STATUS 0x4B14
de2bdb3dcf92280 Tom St Denis 2016-10-26  2929  #define mmDIG5_AFMT_ISRC1_0 0x4B18
de2bdb3dcf92280 Tom St Denis 2016-10-26  2930  #define mmDIG5_AFMT_ISRC1_1 0x4B19
de2bdb3dcf92280 Tom St Denis 2016-10-26  2931  #define mmDIG5_AFMT_ISRC1_2 0x4B1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2932  #define mmDIG5_AFMT_ISRC1_3 0x4B1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2933  #define mmDIG5_AFMT_ISRC1_4 0x4B1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2934  #define mmDIG5_AFMT_ISRC2_0 0x4B1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2935  #define mmDIG5_AFMT_ISRC2_1 0x4B1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2936  #define mmDIG5_AFMT_ISRC2_2 0x4B1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2937  #define mmDIG5_AFMT_ISRC2_3 0x4B20
de2bdb3dcf92280 Tom St Denis 2016-10-26  2938  #define mmDIG5_AFMT_MPEG_INFO0 0x4B25
de2bdb3dcf92280 Tom St Denis 2016-10-26  2939  #define mmDIG5_AFMT_MPEG_INFO1 0x4B26
de2bdb3dcf92280 Tom St Denis 2016-10-26  2940  #define mmDIG5_AFMT_RAMP_CONTROL0 0x4B44
de2bdb3dcf92280 Tom St Denis 2016-10-26  2941  #define mmDIG5_AFMT_RAMP_CONTROL1 0x4B45
de2bdb3dcf92280 Tom St Denis 2016-10-26  2942  #define mmDIG5_AFMT_RAMP_CONTROL2 0x4B46
de2bdb3dcf92280 Tom St Denis 2016-10-26  2943  #define mmDIG5_AFMT_RAMP_CONTROL3 0x4B47
de2bdb3dcf92280 Tom St Denis 2016-10-26  2944  #define mmDIG5_AFMT_STATUS 0x4B4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2945  #define mmDIG5_AFMT_VBI_PACKET_CONTROL 0x4B4C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2946  #define mmDIG5_DIG_BE_CNTL 0x4B50
de2bdb3dcf92280 Tom St Denis 2016-10-26  2947  #define mmDIG5_DIG_BE_EN_CNTL 0x4B51
de2bdb3dcf92280 Tom St Denis 2016-10-26  2948  #define mmDIG5_DIG_CLOCK_PATTERN 0x4B03
de2bdb3dcf92280 Tom St Denis 2016-10-26  2949  #define mmDIG5_DIG_DISPCLK_SWITCH_CNTL 0x4B08
de2bdb3dcf92280 Tom St Denis 2016-10-26  2950  #define mmDIG5_DIG_DISPCLK_SWITCH_STATUS 0x4B09
de2bdb3dcf92280 Tom St Denis 2016-10-26  2951  #define mmDIG5_DIG_FE_CNTL 0x4B00
de2bdb3dcf92280 Tom St Denis 2016-10-26  2952  #define mmDIG5_DIG_FIFO_STATUS 0x4B0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2953  #define mmDIG5_DIG_LANE_ENABLE 0x4B8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2954  #define mmDIG5_DIG_OUTPUT_CRC_CNTL 0x4B01
de2bdb3dcf92280 Tom St Denis 2016-10-26  2955  #define mmDIG5_DIG_OUTPUT_CRC_RESULT 0x4B02
de2bdb3dcf92280 Tom St Denis 2016-10-26  2956  #define mmDIG5_DIG_RANDOM_PATTERN_SEED 0x4B05
de2bdb3dcf92280 Tom St Denis 2016-10-26  2957  #define mmDIG5_DIG_TEST_PATTERN 0x4B04
de2bdb3dcf92280 Tom St Denis 2016-10-26  2958  #define mmDIG5_HDMI_ACR_32_0 0x4B37
de2bdb3dcf92280 Tom St Denis 2016-10-26  2959  #define mmDIG5_HDMI_ACR_32_1 0x4B38
de2bdb3dcf92280 Tom St Denis 2016-10-26  2960  #define mmDIG5_HDMI_ACR_44_0 0x4B39
de2bdb3dcf92280 Tom St Denis 2016-10-26  2961  #define mmDIG5_HDMI_ACR_44_1 0x4B3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2962  #define mmDIG5_HDMI_ACR_48_0 0x4B3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  2963  #define mmDIG5_HDMI_ACR_48_1 0x4B3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2964  #define mmDIG5_HDMI_ACR_PACKET_CONTROL 0x4B0F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2965  #define mmDIG5_HDMI_ACR_STATUS_0 0x4B3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2966  #define mmDIG5_HDMI_ACR_STATUS_1 0x4B3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2967  #define mmDIG5_HDMI_AUDIO_PACKET_CONTROL 0x4B0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2968  #define mmDIG5_HDMI_CONTROL 0x4B0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2969  #define mmDIG5_HDMI_GC 0x4B16
de2bdb3dcf92280 Tom St Denis 2016-10-26  2970  #define mmDIG5_HDMI_GENERIC_PACKET_CONTROL0 0x4B13
de2bdb3dcf92280 Tom St Denis 2016-10-26  2971  #define mmDIG5_HDMI_GENERIC_PACKET_CONTROL1 0x4B30
de2bdb3dcf92280 Tom St Denis 2016-10-26  2972  #define mmDIG5_HDMI_INFOFRAME_CONTROL0 0x4B11
de2bdb3dcf92280 Tom St Denis 2016-10-26  2973  #define mmDIG5_HDMI_INFOFRAME_CONTROL1 0x4B12
de2bdb3dcf92280 Tom St Denis 2016-10-26  2974  #define mmDIG5_HDMI_STATUS 0x4B0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2975  #define mmDIG5_HDMI_VBI_PACKET_CONTROL 0x4B10
de2bdb3dcf92280 Tom St Denis 2016-10-26  2976  #define mmDIG5_LVDS_DATA_CNTL 0x4B8C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2977  #define mmDIG5_TMDS_CNTL 0x4B7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  2978  #define mmDIG5_TMDS_CONTROL0_FEEDBACK 0x4B7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  2979  #define mmDIG5_TMDS_CONTROL_CHAR 0x4B7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2980  #define mmDIG5_TMDS_CTL0_1_GEN_CNTL 0x4B86
de2bdb3dcf92280 Tom St Denis 2016-10-26  2981  #define mmDIG5_TMDS_CTL2_3_GEN_CNTL 0x4B87
de2bdb3dcf92280 Tom St Denis 2016-10-26  2982  #define mmDIG5_TMDS_CTL_BITS 0x4B83
de2bdb3dcf92280 Tom St Denis 2016-10-26  2983  #define mmDIG5_TMDS_DCBALANCER_CONTROL 0x4B84
de2bdb3dcf92280 Tom St Denis 2016-10-26  2984  #define mmDIG5_TMDS_DEBUG 0x4B82
de2bdb3dcf92280 Tom St Denis 2016-10-26  2985  #define mmDIG5_TMDS_STEREOSYNC_CTL_SEL 0x4B7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  2986  #define mmDIG5_TMDS_SYNC_CHAR_PATTERN_0_1 0x4B80
de2bdb3dcf92280 Tom St Denis 2016-10-26  2987  #define mmDIG5_TMDS_SYNC_CHAR_PATTERN_2_3 0x4B81
de2bdb3dcf92280 Tom St Denis 2016-10-26  2988  #define mmDIG_BE_CNTL 0x1C50
de2bdb3dcf92280 Tom St Denis 2016-10-26  2989  #define mmDIG_BE_EN_CNTL 0x1C51
de2bdb3dcf92280 Tom St Denis 2016-10-26  2990  #define mmDIG_CLOCK_PATTERN 0x1C03
de2bdb3dcf92280 Tom St Denis 2016-10-26  2991  #define mmDIG_DISPCLK_SWITCH_CNTL 0x1C08
de2bdb3dcf92280 Tom St Denis 2016-10-26  2992  #define mmDIG_DISPCLK_SWITCH_STATUS 0x1C09
de2bdb3dcf92280 Tom St Denis 2016-10-26  2993  #define mmDIG_FE_CNTL 0x1C00
de2bdb3dcf92280 Tom St Denis 2016-10-26  2994  #define mmDIG_FIFO_STATUS 0x1C0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  2995  #define mmDIG_LANE_ENABLE 0x1C8D
de2bdb3dcf92280 Tom St Denis 2016-10-26  2996  #define mmDIG_OUTPUT_CRC_CNTL 0x1C01
de2bdb3dcf92280 Tom St Denis 2016-10-26  2997  #define mmDIG_OUTPUT_CRC_RESULT 0x1C02
de2bdb3dcf92280 Tom St Denis 2016-10-26  2998  #define mmDIG_RANDOM_PATTERN_SEED 0x1C05
de2bdb3dcf92280 Tom St Denis 2016-10-26  2999  #define mmDIG_SOFT_RESET 0x013D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3000  #define mmDIG_TEST_PATTERN 0x1C04
de2bdb3dcf92280 Tom St Denis 2016-10-26  3001  #define mmDISPCLK_CGTT_BLK_CTRL_REG 0x0135
de2bdb3dcf92280 Tom St Denis 2016-10-26  3002  #define mmDISPCLK_FREQ_CHANGE_CNTL 0x0131
de2bdb3dcf92280 Tom St Denis 2016-10-26  3003  #define mmDISP_INTERRUPT_STATUS 0x183D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3004  #define mmDISP_INTERRUPT_STATUS_CONTINUE 0x183E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3005  #define mmDISP_INTERRUPT_STATUS_CONTINUE2 0x183F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3006  #define mmDISP_INTERRUPT_STATUS_CONTINUE3 0x1840
de2bdb3dcf92280 Tom St Denis 2016-10-26  3007  #define mmDISP_INTERRUPT_STATUS_CONTINUE4 0x1853
de2bdb3dcf92280 Tom St Denis 2016-10-26  3008  #define mmDISP_INTERRUPT_STATUS_CONTINUE5 0x1854
de2bdb3dcf92280 Tom St Denis 2016-10-26  3009  #define mmDISPOUT_STEREOSYNC_SEL 0x18BF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3010  #define mmDISPPLL_BG_CNTL 0x013C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3011  #define mmDISP_TIMER_CONTROL 0x1842
de2bdb3dcf92280 Tom St Denis 2016-10-26  3012  #define mmDMCU_CTRL 0x1600
de2bdb3dcf92280 Tom St Denis 2016-10-26  3013  #define mmDMCU_ERAM_RD_CTRL 0x160B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3014  #define mmDMCU_ERAM_RD_DATA 0x160C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3015  #define mmDMCU_ERAM_WR_CTRL 0x1609
de2bdb3dcf92280 Tom St Denis 2016-10-26  3016  #define mmDMCU_ERAM_WR_DATA 0x160A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3017  #define mmDMCU_EVENT_TRIGGER 0x1611
de2bdb3dcf92280 Tom St Denis 2016-10-26  3018  #define mmDMCU_FW_CHECKSUM_SMPL_BYTE_POS 0x161A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3019  #define mmDMCU_FW_CS_HI 0x1606
de2bdb3dcf92280 Tom St Denis 2016-10-26  3020  #define mmDMCU_FW_CS_LO 0x1607
de2bdb3dcf92280 Tom St Denis 2016-10-26  3021  #define mmDMCU_FW_END_ADDR 0x1604
de2bdb3dcf92280 Tom St Denis 2016-10-26  3022  #define mmDMCU_FW_ISR_START_ADDR 0x1605
de2bdb3dcf92280 Tom St Denis 2016-10-26  3023  #define mmDMCU_FW_START_ADDR 0x1603
de2bdb3dcf92280 Tom St Denis 2016-10-26  3024  #define mmDMCU_INT_CNT 0x1619
de2bdb3dcf92280 Tom St Denis 2016-10-26  3025  #define mmDMCU_INTERRUPT_STATUS 0x1614
de2bdb3dcf92280 Tom St Denis 2016-10-26  3026  #define mmDMCU_INTERRUPT_TO_HOST_EN_MASK 0x1615
de2bdb3dcf92280 Tom St Denis 2016-10-26  3027  #define mmDMCU_INTERRUPT_TO_UC_EN_MASK 0x1616
de2bdb3dcf92280 Tom St Denis 2016-10-26  3028  #define mmDMCU_INTERRUPT_TO_UC_XIRQ_IRQ_SEL 0x1617
de2bdb3dcf92280 Tom St Denis 2016-10-26  3029  #define mmDMCU_IRAM_RD_CTRL 0x160F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3030  #define mmDMCU_IRAM_RD_DATA 0x1610
de2bdb3dcf92280 Tom St Denis 2016-10-26  3031  #define mmDMCU_IRAM_WR_CTRL 0x160D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3032  #define mmDMCU_IRAM_WR_DATA 0x160E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3033  #define mmDMCU_PC_START_ADDR 0x1602
de2bdb3dcf92280 Tom St Denis 2016-10-26  3034  #define mmDMCU_RAM_ACCESS_CTRL 0x1608
de2bdb3dcf92280 Tom St Denis 2016-10-26  3035  #define mmDMCU_STATUS 0x1601
de2bdb3dcf92280 Tom St Denis 2016-10-26  3036  #define mmDMCU_TEST_DEBUG_DATA 0x1627
de2bdb3dcf92280 Tom St Denis 2016-10-26  3037  #define mmDMCU_TEST_DEBUG_INDEX 0x1626
de2bdb3dcf92280 Tom St Denis 2016-10-26  3038  #define mmDMCU_UC_CLK_GATING_CNTL 0x161B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3039  #define mmDMCU_UC_INTERNAL_INT_STATUS 0x1612
de2bdb3dcf92280 Tom St Denis 2016-10-26  3040  #define mmDMIF_ADDR_CALC 0x0300
de2bdb3dcf92280 Tom St Denis 2016-10-26  3041  #define mmDMIF_ADDR_CONFIG 0x02F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3042  #define mmDMIF_ARBITRATION_CONTROL 0x02F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3043  #define mmDMIF_CONTROL 0x02F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3044  #define mmDMIF_HW_DEBUG 0x02F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3045  #define mmDMIF_PG0_DPG_PIPE_ARBITRATION_CONTROL1 0x1B30
de2bdb3dcf92280 Tom St Denis 2016-10-26  3046  #define mmDMIF_PG0_DPG_PIPE_ARBITRATION_CONTROL2 0x1B31
de2bdb3dcf92280 Tom St Denis 2016-10-26  3047  #define mmDMIF_PG0_DPG_PIPE_DPM_CONTROL 0x1B34
de2bdb3dcf92280 Tom St Denis 2016-10-26  3048  #define mmDMIF_PG0_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x1B36
de2bdb3dcf92280 Tom St Denis 2016-10-26  3049  #define mmDMIF_PG0_DPG_PIPE_STUTTER_CONTROL 0x1B35
de2bdb3dcf92280 Tom St Denis 2016-10-26  3050  #define mmDMIF_PG0_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x1B37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3051  #define mmDMIF_PG0_DPG_PIPE_URGENCY_CONTROL 0x1B33
de2bdb3dcf92280 Tom St Denis 2016-10-26  3052  #define mmDMIF_PG0_DPG_TEST_DEBUG_DATA 0x1B39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3053  #define mmDMIF_PG0_DPG_TEST_DEBUG_INDEX 0x1B38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3054  #define mmDMIF_PG1_DPG_PIPE_ARBITRATION_CONTROL1 0x1E30
de2bdb3dcf92280 Tom St Denis 2016-10-26  3055  #define mmDMIF_PG1_DPG_PIPE_ARBITRATION_CONTROL2 0x1E31
de2bdb3dcf92280 Tom St Denis 2016-10-26  3056  #define mmDMIF_PG1_DPG_PIPE_DPM_CONTROL 0x1E34
de2bdb3dcf92280 Tom St Denis 2016-10-26  3057  #define mmDMIF_PG1_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x1E36
de2bdb3dcf92280 Tom St Denis 2016-10-26  3058  #define mmDMIF_PG1_DPG_PIPE_STUTTER_CONTROL 0x1E35
de2bdb3dcf92280 Tom St Denis 2016-10-26  3059  #define mmDMIF_PG1_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x1E37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3060  #define mmDMIF_PG1_DPG_PIPE_URGENCY_CONTROL 0x1E33
de2bdb3dcf92280 Tom St Denis 2016-10-26  3061  #define mmDMIF_PG1_DPG_TEST_DEBUG_DATA 0x1E39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3062  #define mmDMIF_PG1_DPG_TEST_DEBUG_INDEX 0x1E38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3063  #define mmDMIF_PG2_DPG_PIPE_ARBITRATION_CONTROL1 0x4130
de2bdb3dcf92280 Tom St Denis 2016-10-26  3064  #define mmDMIF_PG2_DPG_PIPE_ARBITRATION_CONTROL2 0x4131
de2bdb3dcf92280 Tom St Denis 2016-10-26  3065  #define mmDMIF_PG2_DPG_PIPE_DPM_CONTROL 0x4134
de2bdb3dcf92280 Tom St Denis 2016-10-26  3066  #define mmDMIF_PG2_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x4136
de2bdb3dcf92280 Tom St Denis 2016-10-26  3067  #define mmDMIF_PG2_DPG_PIPE_STUTTER_CONTROL 0x4135
de2bdb3dcf92280 Tom St Denis 2016-10-26  3068  #define mmDMIF_PG2_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x4137
de2bdb3dcf92280 Tom St Denis 2016-10-26  3069  #define mmDMIF_PG2_DPG_PIPE_URGENCY_CONTROL 0x4133
de2bdb3dcf92280 Tom St Denis 2016-10-26  3070  #define mmDMIF_PG2_DPG_TEST_DEBUG_DATA 0x4139
de2bdb3dcf92280 Tom St Denis 2016-10-26  3071  #define mmDMIF_PG2_DPG_TEST_DEBUG_INDEX 0x4138
de2bdb3dcf92280 Tom St Denis 2016-10-26  3072  #define mmDMIF_PG3_DPG_PIPE_ARBITRATION_CONTROL1 0x4430
de2bdb3dcf92280 Tom St Denis 2016-10-26  3073  #define mmDMIF_PG3_DPG_PIPE_ARBITRATION_CONTROL2 0x4431
de2bdb3dcf92280 Tom St Denis 2016-10-26  3074  #define mmDMIF_PG3_DPG_PIPE_DPM_CONTROL 0x4434
de2bdb3dcf92280 Tom St Denis 2016-10-26  3075  #define mmDMIF_PG3_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x4436
de2bdb3dcf92280 Tom St Denis 2016-10-26  3076  #define mmDMIF_PG3_DPG_PIPE_STUTTER_CONTROL 0x4435
de2bdb3dcf92280 Tom St Denis 2016-10-26  3077  #define mmDMIF_PG3_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x4437
de2bdb3dcf92280 Tom St Denis 2016-10-26  3078  #define mmDMIF_PG3_DPG_PIPE_URGENCY_CONTROL 0x4433
de2bdb3dcf92280 Tom St Denis 2016-10-26  3079  #define mmDMIF_PG3_DPG_TEST_DEBUG_DATA 0x4439
de2bdb3dcf92280 Tom St Denis 2016-10-26  3080  #define mmDMIF_PG3_DPG_TEST_DEBUG_INDEX 0x4438
de2bdb3dcf92280 Tom St Denis 2016-10-26  3081  #define mmDMIF_PG4_DPG_PIPE_ARBITRATION_CONTROL1 0x4730
de2bdb3dcf92280 Tom St Denis 2016-10-26  3082  #define mmDMIF_PG4_DPG_PIPE_ARBITRATION_CONTROL2 0x4731
de2bdb3dcf92280 Tom St Denis 2016-10-26  3083  #define mmDMIF_PG4_DPG_PIPE_DPM_CONTROL 0x4734
de2bdb3dcf92280 Tom St Denis 2016-10-26  3084  #define mmDMIF_PG4_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x4736
de2bdb3dcf92280 Tom St Denis 2016-10-26  3085  #define mmDMIF_PG4_DPG_PIPE_STUTTER_CONTROL 0x4735
de2bdb3dcf92280 Tom St Denis 2016-10-26  3086  #define mmDMIF_PG4_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x4737
de2bdb3dcf92280 Tom St Denis 2016-10-26  3087  #define mmDMIF_PG4_DPG_PIPE_URGENCY_CONTROL 0x4733
de2bdb3dcf92280 Tom St Denis 2016-10-26  3088  #define mmDMIF_PG4_DPG_TEST_DEBUG_DATA 0x4739
de2bdb3dcf92280 Tom St Denis 2016-10-26  3089  #define mmDMIF_PG4_DPG_TEST_DEBUG_INDEX 0x4738
de2bdb3dcf92280 Tom St Denis 2016-10-26  3090  #define mmDMIF_PG5_DPG_PIPE_ARBITRATION_CONTROL1 0x4A30
de2bdb3dcf92280 Tom St Denis 2016-10-26  3091  #define mmDMIF_PG5_DPG_PIPE_ARBITRATION_CONTROL2 0x4A31
de2bdb3dcf92280 Tom St Denis 2016-10-26  3092  #define mmDMIF_PG5_DPG_PIPE_DPM_CONTROL 0x4A34
de2bdb3dcf92280 Tom St Denis 2016-10-26  3093  #define mmDMIF_PG5_DPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x4A36
de2bdb3dcf92280 Tom St Denis 2016-10-26  3094  #define mmDMIF_PG5_DPG_PIPE_STUTTER_CONTROL 0x4A35
de2bdb3dcf92280 Tom St Denis 2016-10-26  3095  #define mmDMIF_PG5_DPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x4A37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3096  #define mmDMIF_PG5_DPG_PIPE_URGENCY_CONTROL 0x4A33
de2bdb3dcf92280 Tom St Denis 2016-10-26  3097  #define mmDMIF_PG5_DPG_TEST_DEBUG_DATA 0x4A39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3098  #define mmDMIF_PG5_DPG_TEST_DEBUG_INDEX 0x4A38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3099  #define mmDMIF_STATUS 0x02F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3100  #define mmDMIF_STATUS2 0x0301
de2bdb3dcf92280 Tom St Denis 2016-10-26  3101  #define mmDMIF_TEST_DEBUG_DATA 0x0313
de2bdb3dcf92280 Tom St Denis 2016-10-26  3102  #define mmDMIF_TEST_DEBUG_INDEX 0x0312
de2bdb3dcf92280 Tom St Denis 2016-10-26  3103  #define mmDOUT_DCE_VCE_CONTROL 0x18FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3104  #define mmDOUT_POWER_MANAGEMENT_CNTL 0x1841
de2bdb3dcf92280 Tom St Denis 2016-10-26  3105  #define mmDOUT_SCRATCH0 0x1844
de2bdb3dcf92280 Tom St Denis 2016-10-26  3106  #define mmDOUT_SCRATCH1 0x1845
de2bdb3dcf92280 Tom St Denis 2016-10-26  3107  #define mmDOUT_SCRATCH2 0x1846
de2bdb3dcf92280 Tom St Denis 2016-10-26  3108  #define mmDOUT_SCRATCH3 0x1847
de2bdb3dcf92280 Tom St Denis 2016-10-26  3109  #define mmDOUT_SCRATCH4 0x1848
de2bdb3dcf92280 Tom St Denis 2016-10-26  3110  #define mmDOUT_SCRATCH5 0x1849
de2bdb3dcf92280 Tom St Denis 2016-10-26  3111  #define mmDOUT_SCRATCH6 0x184A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3112  #define mmDOUT_SCRATCH7 0x184B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3113  #define mmDOUT_TEST_DEBUG_DATA 0x184E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3114  #define mmDOUT_TEST_DEBUG_INDEX 0x184D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3115  #define mmDP0_DP_CONFIG 0x1CC2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3116  #define mmDP0_DP_DPHY_8B10B_CNTL 0x1CD3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3117  #define mmDP0_DP_DPHY_CNTL 0x1CD0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3118  #define mmDP0_DP_DPHY_CRC_CNTL 0x1CD7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3119  #define mmDP0_DP_DPHY_CRC_EN 0x1CD6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3120  #define mmDP0_DP_DPHY_CRC_MST_CNTL 0x1CC6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3121  #define mmDP0_DP_DPHY_CRC_MST_STATUS 0x1CC7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3122  #define mmDP0_DP_DPHY_CRC_RESULT 0x1CD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3123  #define mmDP0_DP_DPHY_FAST_TRAINING 0x1CCE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3124  #define mmDP0_DP_DPHY_FAST_TRAINING_STATUS 0x1CE9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3125  #define mmDP0_DP_DPHY_PRBS_CNTL 0x1CD4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3126  #define mmDP0_DP_DPHY_SYM0 0x1CD2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3127  #define mmDP0_DP_DPHY_SYM1 0x1CE0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3128  #define mmDP0_DP_DPHY_SYM2 0x1CDF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3129  #define mmDP0_DP_DPHY_TRAINING_PATTERN_SEL 0x1CD1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3130  #define mmDP0_DP_HBR2_EYE_PATTERN 0x1CC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3131  #define mmDP0_DP_LINK_CNTL 0x1CC0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3132  #define mmDP0_DP_LINK_FRAMING_CNTL 0x1CCC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3133  #define mmDP0_DP_MSA_COLORIMETRY 0x1CDA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3134  #define mmDP0_DP_MSA_MISC 0x1CC5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3135  #define mmDP0_DP_MSA_V_TIMING_OVERRIDE1 0x1CEA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3136  #define mmDP0_DP_MSA_V_TIMING_OVERRIDE2 0x1CEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3137  #define mmDP0_DP_MSE_LINK_TIMING 0x1CE8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3138  #define mmDP0_DP_MSE_MISC_CNTL 0x1CDB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3139  #define mmDP0_DP_MSE_RATE_CNTL 0x1CE1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3140  #define mmDP0_DP_MSE_RATE_UPDATE 0x1CE3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3141  #define mmDP0_DP_MSE_SAT0 0x1CE4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3142  #define mmDP0_DP_MSE_SAT1 0x1CE5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3143  #define mmDP0_DP_MSE_SAT2 0x1CE6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3144  #define mmDP0_DP_MSE_SAT_UPDATE 0x1CE7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3145  #define mmDP0_DP_PIXEL_FORMAT 0x1CC1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3146  #define mmDP0_DP_SEC_AUD_M 0x1CA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3147  #define mmDP0_DP_SEC_AUD_M_READBACK 0x1CA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3148  #define mmDP0_DP_SEC_AUD_N 0x1CA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3149  #define mmDP0_DP_SEC_AUD_N_READBACK 0x1CA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3150  #define mmDP0_DP_SEC_CNTL 0x1CA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3151  #define mmDP0_DP_SEC_CNTL1 0x1CAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3152  #define mmDP0_DP_SEC_FRAMING1 0x1CA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3153  #define mmDP0_DP_SEC_FRAMING2 0x1CA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3154  #define mmDP0_DP_SEC_FRAMING3 0x1CA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3155  #define mmDP0_DP_SEC_FRAMING4 0x1CA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3156  #define mmDP0_DP_SEC_PACKET_CNTL 0x1CAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3157  #define mmDP0_DP_SEC_TIMESTAMP 0x1CA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3158  #define mmDP0_DP_STEER_FIFO 0x1CC4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3159  #define mmDP0_DP_TEST_DEBUG_DATA 0x1CFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3160  #define mmDP0_DP_TEST_DEBUG_INDEX 0x1CFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3161  #define mmDP0_DP_VID_INTERRUPT_CNTL 0x1CCF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3162  #define mmDP0_DP_VID_M 0x1CCB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3163  #define mmDP0_DP_VID_MSA_VBID 0x1CCD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3164  #define mmDP0_DP_VID_N 0x1CCA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3165  #define mmDP0_DP_VID_STREAM_CNTL 0x1CC3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3166  #define mmDP0_DP_VID_TIMING 0x1CC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3167  #define mmDP1_DP_CONFIG 0x1FC2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3168  #define mmDP1_DP_DPHY_8B10B_CNTL 0x1FD3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3169  #define mmDP1_DP_DPHY_CNTL 0x1FD0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3170  #define mmDP1_DP_DPHY_CRC_CNTL 0x1FD7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3171  #define mmDP1_DP_DPHY_CRC_EN 0x1FD6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3172  #define mmDP1_DP_DPHY_CRC_MST_CNTL 0x1FC6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3173  #define mmDP1_DP_DPHY_CRC_MST_STATUS 0x1FC7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3174  #define mmDP1_DP_DPHY_CRC_RESULT 0x1FD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3175  #define mmDP1_DP_DPHY_FAST_TRAINING 0x1FCE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3176  #define mmDP1_DP_DPHY_FAST_TRAINING_STATUS 0x1FE9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3177  #define mmDP1_DP_DPHY_PRBS_CNTL 0x1FD4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3178  #define mmDP1_DP_DPHY_SYM0 0x1FD2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3179  #define mmDP1_DP_DPHY_SYM1 0x1FE0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3180  #define mmDP1_DP_DPHY_SYM2 0x1FDF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3181  #define mmDP1_DP_DPHY_TRAINING_PATTERN_SEL 0x1FD1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3182  #define mmDP1_DP_HBR2_EYE_PATTERN 0x1FC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3183  #define mmDP1_DP_LINK_CNTL 0x1FC0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3184  #define mmDP1_DP_LINK_FRAMING_CNTL 0x1FCC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3185  #define mmDP1_DP_MSA_COLORIMETRY 0x1FDA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3186  #define mmDP1_DP_MSA_MISC 0x1FC5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3187  #define mmDP1_DP_MSA_V_TIMING_OVERRIDE1 0x1FEA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3188  #define mmDP1_DP_MSA_V_TIMING_OVERRIDE2 0x1FEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3189  #define mmDP1_DP_MSE_LINK_TIMING 0x1FE8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3190  #define mmDP1_DP_MSE_MISC_CNTL 0x1FDB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3191  #define mmDP1_DP_MSE_RATE_CNTL 0x1FE1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3192  #define mmDP1_DP_MSE_RATE_UPDATE 0x1FE3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3193  #define mmDP1_DP_MSE_SAT0 0x1FE4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3194  #define mmDP1_DP_MSE_SAT1 0x1FE5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3195  #define mmDP1_DP_MSE_SAT2 0x1FE6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3196  #define mmDP1_DP_MSE_SAT_UPDATE 0x1FE7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3197  #define mmDP1_DP_PIXEL_FORMAT 0x1FC1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3198  #define mmDP1_DP_SEC_AUD_M 0x1FA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3199  #define mmDP1_DP_SEC_AUD_M_READBACK 0x1FA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3200  #define mmDP1_DP_SEC_AUD_N 0x1FA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3201  #define mmDP1_DP_SEC_AUD_N_READBACK 0x1FA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3202  #define mmDP1_DP_SEC_CNTL 0x1FA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3203  #define mmDP1_DP_SEC_CNTL1 0x1FAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3204  #define mmDP1_DP_SEC_FRAMING1 0x1FA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3205  #define mmDP1_DP_SEC_FRAMING2 0x1FA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3206  #define mmDP1_DP_SEC_FRAMING3 0x1FA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3207  #define mmDP1_DP_SEC_FRAMING4 0x1FA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3208  #define mmDP1_DP_SEC_PACKET_CNTL 0x1FAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3209  #define mmDP1_DP_SEC_TIMESTAMP 0x1FA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3210  #define mmDP1_DP_STEER_FIFO 0x1FC4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3211  #define mmDP1_DP_TEST_DEBUG_DATA 0x1FFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3212  #define mmDP1_DP_TEST_DEBUG_INDEX 0x1FFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3213  #define mmDP1_DP_VID_INTERRUPT_CNTL 0x1FCF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3214  #define mmDP1_DP_VID_M 0x1FCB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3215  #define mmDP1_DP_VID_MSA_VBID 0x1FCD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3216  #define mmDP1_DP_VID_N 0x1FCA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3217  #define mmDP1_DP_VID_STREAM_CNTL 0x1FC3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3218  #define mmDP1_DP_VID_TIMING 0x1FC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3219  #define mmDP2_DP_CONFIG 0x42C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3220  #define mmDP2_DP_DPHY_8B10B_CNTL 0x42D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3221  #define mmDP2_DP_DPHY_CNTL 0x42D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3222  #define mmDP2_DP_DPHY_CRC_CNTL 0x42D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3223  #define mmDP2_DP_DPHY_CRC_EN 0x42D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3224  #define mmDP2_DP_DPHY_CRC_MST_CNTL 0x42C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3225  #define mmDP2_DP_DPHY_CRC_MST_STATUS 0x42C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3226  #define mmDP2_DP_DPHY_CRC_RESULT 0x42D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3227  #define mmDP2_DP_DPHY_FAST_TRAINING 0x42CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3228  #define mmDP2_DP_DPHY_FAST_TRAINING_STATUS 0x42E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3229  #define mmDP2_DP_DPHY_PRBS_CNTL 0x42D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3230  #define mmDP2_DP_DPHY_SYM0 0x42D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3231  #define mmDP2_DP_DPHY_SYM1 0x42E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3232  #define mmDP2_DP_DPHY_SYM2 0x42DF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3233  #define mmDP2_DP_DPHY_TRAINING_PATTERN_SEL 0x42D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3234  #define mmDP2_DP_HBR2_EYE_PATTERN 0x42C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3235  #define mmDP2_DP_LINK_CNTL 0x42C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3236  #define mmDP2_DP_LINK_FRAMING_CNTL 0x42CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3237  #define mmDP2_DP_MSA_COLORIMETRY 0x42DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3238  #define mmDP2_DP_MSA_MISC 0x42C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3239  #define mmDP2_DP_MSA_V_TIMING_OVERRIDE1 0x42EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3240  #define mmDP2_DP_MSA_V_TIMING_OVERRIDE2 0x42EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3241  #define mmDP2_DP_MSE_LINK_TIMING 0x42E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3242  #define mmDP2_DP_MSE_MISC_CNTL 0x42DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3243  #define mmDP2_DP_MSE_RATE_CNTL 0x42E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3244  #define mmDP2_DP_MSE_RATE_UPDATE 0x42E3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3245  #define mmDP2_DP_MSE_SAT0 0x42E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3246  #define mmDP2_DP_MSE_SAT1 0x42E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3247  #define mmDP2_DP_MSE_SAT2 0x42E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3248  #define mmDP2_DP_MSE_SAT_UPDATE 0x42E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3249  #define mmDP2_DP_PIXEL_FORMAT 0x42C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3250  #define mmDP2_DP_SEC_AUD_M 0x42A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3251  #define mmDP2_DP_SEC_AUD_M_READBACK 0x42A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3252  #define mmDP2_DP_SEC_AUD_N 0x42A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3253  #define mmDP2_DP_SEC_AUD_N_READBACK 0x42A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3254  #define mmDP2_DP_SEC_CNTL 0x42A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3255  #define mmDP2_DP_SEC_CNTL1 0x42AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3256  #define mmDP2_DP_SEC_FRAMING1 0x42A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3257  #define mmDP2_DP_SEC_FRAMING2 0x42A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3258  #define mmDP2_DP_SEC_FRAMING3 0x42A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3259  #define mmDP2_DP_SEC_FRAMING4 0x42A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3260  #define mmDP2_DP_SEC_PACKET_CNTL 0x42AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3261  #define mmDP2_DP_SEC_TIMESTAMP 0x42A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3262  #define mmDP2_DP_STEER_FIFO 0x42C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3263  #define mmDP2_DP_TEST_DEBUG_DATA 0x42FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3264  #define mmDP2_DP_TEST_DEBUG_INDEX 0x42FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3265  #define mmDP2_DP_VID_INTERRUPT_CNTL 0x42CF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3266  #define mmDP2_DP_VID_M 0x42CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3267  #define mmDP2_DP_VID_MSA_VBID 0x42CD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3268  #define mmDP2_DP_VID_N 0x42CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3269  #define mmDP2_DP_VID_STREAM_CNTL 0x42C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3270  #define mmDP2_DP_VID_TIMING 0x42C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3271  #define mmDP3_DP_CONFIG 0x45C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3272  #define mmDP3_DP_DPHY_8B10B_CNTL 0x45D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3273  #define mmDP3_DP_DPHY_CNTL 0x45D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3274  #define mmDP3_DP_DPHY_CRC_CNTL 0x45D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3275  #define mmDP3_DP_DPHY_CRC_EN 0x45D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3276  #define mmDP3_DP_DPHY_CRC_MST_CNTL 0x45C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3277  #define mmDP3_DP_DPHY_CRC_MST_STATUS 0x45C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3278  #define mmDP3_DP_DPHY_CRC_RESULT 0x45D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3279  #define mmDP3_DP_DPHY_FAST_TRAINING 0x45CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3280  #define mmDP3_DP_DPHY_FAST_TRAINING_STATUS 0x45E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3281  #define mmDP3_DP_DPHY_PRBS_CNTL 0x45D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3282  #define mmDP3_DP_DPHY_SYM0 0x45D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3283  #define mmDP3_DP_DPHY_SYM1 0x45E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3284  #define mmDP3_DP_DPHY_SYM2 0x45DF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3285  #define mmDP3_DP_DPHY_TRAINING_PATTERN_SEL 0x45D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3286  #define mmDP3_DP_HBR2_EYE_PATTERN 0x45C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3287  #define mmDP3_DP_LINK_CNTL 0x45C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3288  #define mmDP3_DP_LINK_FRAMING_CNTL 0x45CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3289  #define mmDP3_DP_MSA_COLORIMETRY 0x45DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3290  #define mmDP3_DP_MSA_MISC 0x45C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3291  #define mmDP3_DP_MSA_V_TIMING_OVERRIDE1 0x45EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3292  #define mmDP3_DP_MSA_V_TIMING_OVERRIDE2 0x45EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3293  #define mmDP3_DP_MSE_LINK_TIMING 0x45E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3294  #define mmDP3_DP_MSE_MISC_CNTL 0x45DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3295  #define mmDP3_DP_MSE_RATE_CNTL 0x45E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3296  #define mmDP3_DP_MSE_RATE_UPDATE 0x45E3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3297  #define mmDP3_DP_MSE_SAT0 0x45E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3298  #define mmDP3_DP_MSE_SAT1 0x45E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3299  #define mmDP3_DP_MSE_SAT2 0x45E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3300  #define mmDP3_DP_MSE_SAT_UPDATE 0x45E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3301  #define mmDP3_DP_PIXEL_FORMAT 0x45C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3302  #define mmDP3_DP_SEC_AUD_M 0x45A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3303  #define mmDP3_DP_SEC_AUD_M_READBACK 0x45A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3304  #define mmDP3_DP_SEC_AUD_N 0x45A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3305  #define mmDP3_DP_SEC_AUD_N_READBACK 0x45A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3306  #define mmDP3_DP_SEC_CNTL 0x45A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3307  #define mmDP3_DP_SEC_CNTL1 0x45AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3308  #define mmDP3_DP_SEC_FRAMING1 0x45A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3309  #define mmDP3_DP_SEC_FRAMING2 0x45A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3310  #define mmDP3_DP_SEC_FRAMING3 0x45A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3311  #define mmDP3_DP_SEC_FRAMING4 0x45A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3312  #define mmDP3_DP_SEC_PACKET_CNTL 0x45AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3313  #define mmDP3_DP_SEC_TIMESTAMP 0x45A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3314  #define mmDP3_DP_STEER_FIFO 0x45C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3315  #define mmDP3_DP_TEST_DEBUG_DATA 0x45FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3316  #define mmDP3_DP_TEST_DEBUG_INDEX 0x45FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3317  #define mmDP3_DP_VID_INTERRUPT_CNTL 0x45CF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3318  #define mmDP3_DP_VID_M 0x45CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3319  #define mmDP3_DP_VID_MSA_VBID 0x45CD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3320  #define mmDP3_DP_VID_N 0x45CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3321  #define mmDP3_DP_VID_STREAM_CNTL 0x45C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3322  #define mmDP3_DP_VID_TIMING 0x45C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3323  #define mmDP4_DP_CONFIG 0x48C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3324  #define mmDP4_DP_DPHY_8B10B_CNTL 0x48D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3325  #define mmDP4_DP_DPHY_CNTL 0x48D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3326  #define mmDP4_DP_DPHY_CRC_CNTL 0x48D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3327  #define mmDP4_DP_DPHY_CRC_EN 0x48D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3328  #define mmDP4_DP_DPHY_CRC_MST_CNTL 0x48C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3329  #define mmDP4_DP_DPHY_CRC_MST_STATUS 0x48C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3330  #define mmDP4_DP_DPHY_CRC_RESULT 0x48D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3331  #define mmDP4_DP_DPHY_FAST_TRAINING 0x48CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3332  #define mmDP4_DP_DPHY_FAST_TRAINING_STATUS 0x48E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3333  #define mmDP4_DP_DPHY_PRBS_CNTL 0x48D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3334  #define mmDP4_DP_DPHY_SYM0 0x48D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3335  #define mmDP4_DP_DPHY_SYM1 0x48E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3336  #define mmDP4_DP_DPHY_SYM2 0x48DF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3337  #define mmDP4_DP_DPHY_TRAINING_PATTERN_SEL 0x48D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3338  #define mmDP4_DP_HBR2_EYE_PATTERN 0x48C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3339  #define mmDP4_DP_LINK_CNTL 0x48C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3340  #define mmDP4_DP_LINK_FRAMING_CNTL 0x48CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3341  #define mmDP4_DP_MSA_COLORIMETRY 0x48DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3342  #define mmDP4_DP_MSA_MISC 0x48C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3343  #define mmDP4_DP_MSA_V_TIMING_OVERRIDE1 0x48EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3344  #define mmDP4_DP_MSA_V_TIMING_OVERRIDE2 0x48EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3345  #define mmDP4_DP_MSE_LINK_TIMING 0x48E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3346  #define mmDP4_DP_MSE_MISC_CNTL 0x48DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3347  #define mmDP4_DP_MSE_RATE_CNTL 0x48E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3348  #define mmDP4_DP_MSE_RATE_UPDATE 0x48E3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3349  #define mmDP4_DP_MSE_SAT0 0x48E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3350  #define mmDP4_DP_MSE_SAT1 0x48E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3351  #define mmDP4_DP_MSE_SAT2 0x48E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3352  #define mmDP4_DP_MSE_SAT_UPDATE 0x48E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3353  #define mmDP4_DP_PIXEL_FORMAT 0x48C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3354  #define mmDP4_DP_SEC_AUD_M 0x48A7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3355  #define mmDP4_DP_SEC_AUD_M_READBACK 0x48A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3356  #define mmDP4_DP_SEC_AUD_N 0x48A5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3357  #define mmDP4_DP_SEC_AUD_N_READBACK 0x48A6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3358  #define mmDP4_DP_SEC_CNTL 0x48A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3359  #define mmDP4_DP_SEC_CNTL1 0x48AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3360  #define mmDP4_DP_SEC_FRAMING1 0x48A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3361  #define mmDP4_DP_SEC_FRAMING2 0x48A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3362  #define mmDP4_DP_SEC_FRAMING3 0x48A3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3363  #define mmDP4_DP_SEC_FRAMING4 0x48A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3364  #define mmDP4_DP_SEC_PACKET_CNTL 0x48AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3365  #define mmDP4_DP_SEC_TIMESTAMP 0x48A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3366  #define mmDP4_DP_STEER_FIFO 0x48C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3367  #define mmDP4_DP_TEST_DEBUG_DATA 0x48FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3368  #define mmDP4_DP_TEST_DEBUG_INDEX 0x48FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3369  #define mmDP4_DP_VID_INTERRUPT_CNTL 0x48CF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3370  #define mmDP4_DP_VID_M 0x48CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3371  #define mmDP4_DP_VID_MSA_VBID 0x48CD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3372  #define mmDP4_DP_VID_N 0x48CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3373  #define mmDP4_DP_VID_STREAM_CNTL 0x48C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3374  #define mmDP4_DP_VID_TIMING 0x48C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3375  #define mmDP5_DP_CONFIG 0x4BC2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3376  #define mmDP5_DP_DPHY_8B10B_CNTL 0x4BD3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3377  #define mmDP5_DP_DPHY_CNTL 0x4BD0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3378  #define mmDP5_DP_DPHY_CRC_CNTL 0x4BD7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3379  #define mmDP5_DP_DPHY_CRC_EN 0x4BD6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3380  #define mmDP5_DP_DPHY_CRC_MST_CNTL 0x4BC6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3381  #define mmDP5_DP_DPHY_CRC_MST_STATUS 0x4BC7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3382  #define mmDP5_DP_DPHY_CRC_RESULT 0x4BD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3383  #define mmDP5_DP_DPHY_FAST_TRAINING 0x4BCE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3384  #define mmDP5_DP_DPHY_FAST_TRAINING_STATUS 0x4BE9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3385  #define mmDP5_DP_DPHY_PRBS_CNTL 0x4BD4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3386  #define mmDP5_DP_DPHY_SYM0 0x4BD2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3387  #define mmDP5_DP_DPHY_SYM1 0x4BE0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3388  #define mmDP5_DP_DPHY_SYM2 0x4BDF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3389  #define mmDP5_DP_DPHY_TRAINING_PATTERN_SEL 0x4BD1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3390  #define mmDP5_DP_HBR2_EYE_PATTERN 0x4BC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3391  #define mmDP5_DP_LINK_CNTL 0x4BC0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3392  #define mmDP5_DP_LINK_FRAMING_CNTL 0x4BCC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3393  #define mmDP5_DP_MSA_COLORIMETRY 0x4BDA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3394  #define mmDP5_DP_MSA_MISC 0x4BC5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3395  #define mmDP5_DP_MSA_V_TIMING_OVERRIDE1 0x4BEA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3396  #define mmDP5_DP_MSA_V_TIMING_OVERRIDE2 0x4BEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3397  #define mmDP5_DP_MSE_LINK_TIMING 0x4BE8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3398  #define mmDP5_DP_MSE_MISC_CNTL 0x4BDB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3399  #define mmDP5_DP_MSE_RATE_CNTL 0x4BE1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3400  #define mmDP5_DP_MSE_RATE_UPDATE 0x4BE3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3401  #define mmDP5_DP_MSE_SAT0 0x4BE4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3402  #define mmDP5_DP_MSE_SAT1 0x4BE5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3403  #define mmDP5_DP_MSE_SAT2 0x4BE6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3404  #define mmDP5_DP_MSE_SAT_UPDATE 0x4BE7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3405  #define mmDP5_DP_PIXEL_FORMAT 0x4BC1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3406  #define mmDP5_DP_SEC_AUD_M 0x4BA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3407  #define mmDP5_DP_SEC_AUD_M_READBACK 0x4BA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3408  #define mmDP5_DP_SEC_AUD_N 0x4BA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3409  #define mmDP5_DP_SEC_AUD_N_READBACK 0x4BA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3410  #define mmDP5_DP_SEC_CNTL 0x4BA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3411  #define mmDP5_DP_SEC_CNTL1 0x4BAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3412  #define mmDP5_DP_SEC_FRAMING1 0x4BA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3413  #define mmDP5_DP_SEC_FRAMING2 0x4BA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3414  #define mmDP5_DP_SEC_FRAMING3 0x4BA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3415  #define mmDP5_DP_SEC_FRAMING4 0x4BA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3416  #define mmDP5_DP_SEC_PACKET_CNTL 0x4BAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3417  #define mmDP5_DP_SEC_TIMESTAMP 0x4BA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3418  #define mmDP5_DP_STEER_FIFO 0x4BC4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3419  #define mmDP5_DP_TEST_DEBUG_DATA 0x4BFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3420  #define mmDP5_DP_TEST_DEBUG_INDEX 0x4BFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3421  #define mmDP5_DP_VID_INTERRUPT_CNTL 0x4BCF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3422  #define mmDP5_DP_VID_M 0x4BCB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3423  #define mmDP5_DP_VID_MSA_VBID 0x4BCD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3424  #define mmDP5_DP_VID_N 0x4BCA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3425  #define mmDP5_DP_VID_STREAM_CNTL 0x4BC3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3426  #define mmDP5_DP_VID_TIMING 0x4BC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3427  #define mmDP_AUX0_AUX_ARB_CONTROL 0x1882
de2bdb3dcf92280 Tom St Denis 2016-10-26  3428  #define mmDP_AUX0_AUX_CONTROL 0x1880
de2bdb3dcf92280 Tom St Denis 2016-10-26  3429  #define mmDP_AUX0_AUX_DPHY_RX_CONTROL0 0x188A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3430  #define mmDP_AUX0_AUX_DPHY_RX_CONTROL1 0x188B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3431  #define mmDP_AUX0_AUX_DPHY_RX_STATUS 0x188D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3432  #define mmDP_AUX0_AUX_DPHY_TX_CONTROL 0x1889
de2bdb3dcf92280 Tom St Denis 2016-10-26  3433  #define mmDP_AUX0_AUX_DPHY_TX_REF_CONTROL 0x1888
de2bdb3dcf92280 Tom St Denis 2016-10-26  3434  #define mmDP_AUX0_AUX_DPHY_TX_STATUS 0x188C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3435  #define mmDP_AUX0_AUX_GTC_SYNC_CONTROL 0x188E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3436  #define mmDP_AUX0_AUX_GTC_SYNC_DATA 0x1890
de2bdb3dcf92280 Tom St Denis 2016-10-26  3437  #define mmDP_AUX0_AUX_INTERRUPT_CONTROL 0x1883
de2bdb3dcf92280 Tom St Denis 2016-10-26  3438  #define mmDP_AUX0_AUX_LS_DATA 0x1887
de2bdb3dcf92280 Tom St Denis 2016-10-26  3439  #define mmDP_AUX0_AUX_LS_STATUS 0x1885
de2bdb3dcf92280 Tom St Denis 2016-10-26  3440  #define mmDP_AUX0_AUX_SW_CONTROL 0x1881
de2bdb3dcf92280 Tom St Denis 2016-10-26  3441  #define mmDP_AUX0_AUX_SW_DATA 0x1886
de2bdb3dcf92280 Tom St Denis 2016-10-26  3442  #define mmDP_AUX0_AUX_SW_STATUS 0x1884
de2bdb3dcf92280 Tom St Denis 2016-10-26  3443  #define mmDP_AUX1_AUX_ARB_CONTROL 0x1896
de2bdb3dcf92280 Tom St Denis 2016-10-26  3444  #define mmDP_AUX1_AUX_CONTROL 0x1894
de2bdb3dcf92280 Tom St Denis 2016-10-26  3445  #define mmDP_AUX1_AUX_DPHY_RX_CONTROL0 0x189E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3446  #define mmDP_AUX1_AUX_DPHY_RX_CONTROL1 0x189F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3447  #define mmDP_AUX1_AUX_DPHY_RX_STATUS 0x18A1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3448  #define mmDP_AUX1_AUX_DPHY_TX_CONTROL 0x189D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3449  #define mmDP_AUX1_AUX_DPHY_TX_REF_CONTROL 0x189C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3450  #define mmDP_AUX1_AUX_DPHY_TX_STATUS 0x18A0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3451  #define mmDP_AUX1_AUX_GTC_SYNC_CONTROL 0x18A2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3452  #define mmDP_AUX1_AUX_GTC_SYNC_DATA 0x18A4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3453  #define mmDP_AUX1_AUX_INTERRUPT_CONTROL 0x1897
de2bdb3dcf92280 Tom St Denis 2016-10-26  3454  #define mmDP_AUX1_AUX_LS_DATA 0x189B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3455  #define mmDP_AUX1_AUX_LS_STATUS 0x1899
de2bdb3dcf92280 Tom St Denis 2016-10-26  3456  #define mmDP_AUX1_AUX_SW_CONTROL 0x1895
de2bdb3dcf92280 Tom St Denis 2016-10-26  3457  #define mmDP_AUX1_AUX_SW_DATA 0x189A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3458  #define mmDP_AUX1_AUX_SW_STATUS 0x1898
de2bdb3dcf92280 Tom St Denis 2016-10-26  3459  #define mmDP_AUX2_AUX_ARB_CONTROL 0x18AA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3460  #define mmDP_AUX2_AUX_CONTROL 0x18A8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3461  #define mmDP_AUX2_AUX_DPHY_RX_CONTROL0 0x18B2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3462  #define mmDP_AUX2_AUX_DPHY_RX_CONTROL1 0x18B3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3463  #define mmDP_AUX2_AUX_DPHY_RX_STATUS 0x18B5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3464  #define mmDP_AUX2_AUX_DPHY_TX_CONTROL 0x18B1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3465  #define mmDP_AUX2_AUX_DPHY_TX_REF_CONTROL 0x18B0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3466  #define mmDP_AUX2_AUX_DPHY_TX_STATUS 0x18B4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3467  #define mmDP_AUX2_AUX_GTC_SYNC_CONTROL 0x18B6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3468  #define mmDP_AUX2_AUX_GTC_SYNC_DATA 0x18B8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3469  #define mmDP_AUX2_AUX_INTERRUPT_CONTROL 0x18AB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3470  #define mmDP_AUX2_AUX_LS_DATA 0x18AF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3471  #define mmDP_AUX2_AUX_LS_STATUS 0x18AD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3472  #define mmDP_AUX2_AUX_SW_CONTROL 0x18A9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3473  #define mmDP_AUX2_AUX_SW_DATA 0x18AE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3474  #define mmDP_AUX2_AUX_SW_STATUS 0x18AC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3475  #define mmDP_AUX3_AUX_ARB_CONTROL 0x18C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3476  #define mmDP_AUX3_AUX_CONTROL 0x18C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3477  #define mmDP_AUX3_AUX_DPHY_RX_CONTROL0 0x18CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3478  #define mmDP_AUX3_AUX_DPHY_RX_CONTROL1 0x18CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3479  #define mmDP_AUX3_AUX_DPHY_RX_STATUS 0x18CD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3480  #define mmDP_AUX3_AUX_DPHY_TX_CONTROL 0x18C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3481  #define mmDP_AUX3_AUX_DPHY_TX_REF_CONTROL 0x18C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3482  #define mmDP_AUX3_AUX_DPHY_TX_STATUS 0x18CC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3483  #define mmDP_AUX3_AUX_GTC_SYNC_CONTROL 0x18CE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3484  #define mmDP_AUX3_AUX_GTC_SYNC_DATA 0x18D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3485  #define mmDP_AUX3_AUX_INTERRUPT_CONTROL 0x18C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3486  #define mmDP_AUX3_AUX_LS_DATA 0x18C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3487  #define mmDP_AUX3_AUX_LS_STATUS 0x18C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3488  #define mmDP_AUX3_AUX_SW_CONTROL 0x18C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3489  #define mmDP_AUX3_AUX_SW_DATA 0x18C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3490  #define mmDP_AUX3_AUX_SW_STATUS 0x18C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3491  #define mmDP_AUX4_AUX_ARB_CONTROL 0x18D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3492  #define mmDP_AUX4_AUX_CONTROL 0x18D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3493  #define mmDP_AUX4_AUX_DPHY_RX_CONTROL0 0x18DE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3494  #define mmDP_AUX4_AUX_DPHY_RX_CONTROL1 0x18DF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3495  #define mmDP_AUX4_AUX_DPHY_RX_STATUS 0x18E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3496  #define mmDP_AUX4_AUX_DPHY_TX_CONTROL 0x18DD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3497  #define mmDP_AUX4_AUX_DPHY_TX_REF_CONTROL 0x18DC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3498  #define mmDP_AUX4_AUX_DPHY_TX_STATUS 0x18E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3499  #define mmDP_AUX4_AUX_GTC_SYNC_CONTROL 0x18E2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3500  #define mmDP_AUX4_AUX_GTC_SYNC_DATA 0x18E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3501  #define mmDP_AUX4_AUX_INTERRUPT_CONTROL 0x18D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3502  #define mmDP_AUX4_AUX_LS_DATA 0x18DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3503  #define mmDP_AUX4_AUX_LS_STATUS 0x18D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3504  #define mmDP_AUX4_AUX_SW_CONTROL 0x18D5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3505  #define mmDP_AUX4_AUX_SW_DATA 0x18DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3506  #define mmDP_AUX4_AUX_SW_STATUS 0x18D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3507  #define mmDP_AUX5_AUX_ARB_CONTROL 0x18EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3508  #define mmDP_AUX5_AUX_CONTROL 0x18E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3509  #define mmDP_AUX5_AUX_DPHY_RX_CONTROL0 0x18F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3510  #define mmDP_AUX5_AUX_DPHY_RX_CONTROL1 0x18F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3511  #define mmDP_AUX5_AUX_DPHY_RX_STATUS 0x18F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3512  #define mmDP_AUX5_AUX_DPHY_TX_CONTROL 0x18F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3513  #define mmDP_AUX5_AUX_DPHY_TX_REF_CONTROL 0x18F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3514  #define mmDP_AUX5_AUX_DPHY_TX_STATUS 0x18F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3515  #define mmDP_AUX5_AUX_GTC_SYNC_CONTROL 0x18F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3516  #define mmDP_AUX5_AUX_GTC_SYNC_DATA 0x18F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3517  #define mmDP_AUX5_AUX_INTERRUPT_CONTROL 0x18EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3518  #define mmDP_AUX5_AUX_LS_DATA 0x18EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3519  #define mmDP_AUX5_AUX_LS_STATUS 0x18ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3520  #define mmDP_AUX5_AUX_SW_CONTROL 0x18E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3521  #define mmDP_AUX5_AUX_SW_DATA 0x18EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3522  #define mmDP_AUX5_AUX_SW_STATUS 0x18EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3523  #define mmDP_CONFIG 0x1CC2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3524  #define mmDP_DPHY_8B10B_CNTL 0x1CD3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3525  #define mmDP_DPHY_CNTL 0x1CD0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3526  #define mmDP_DPHY_CRC_CNTL 0x1CD7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3527  #define mmDP_DPHY_CRC_EN 0x1CD6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3528  #define mmDP_DPHY_CRC_MST_CNTL 0x1CC6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3529  #define mmDP_DPHY_CRC_MST_STATUS 0x1CC7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3530  #define mmDP_DPHY_CRC_RESULT 0x1CD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3531  #define mmDP_DPHY_FAST_TRAINING 0x1CCE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3532  #define mmDP_DPHY_FAST_TRAINING_STATUS 0x1CE9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3533  #define mmDP_DPHY_PRBS_CNTL 0x1CD4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3534  #define mmDP_DPHY_SYM0 0x1CD2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3535  #define mmDP_DPHY_SYM1 0x1CE0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3536  #define mmDP_DPHY_SYM2 0x1CDF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3537  #define mmDP_DPHY_TRAINING_PATTERN_SEL 0x1CD1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3538  #define mmDP_DTO0_MODULO 0x0142
de2bdb3dcf92280 Tom St Denis 2016-10-26  3539  #define mmDP_DTO0_PHASE 0x0141
de2bdb3dcf92280 Tom St Denis 2016-10-26  3540  #define mmDP_DTO1_MODULO 0x0146
de2bdb3dcf92280 Tom St Denis 2016-10-26  3541  #define mmDP_DTO1_PHASE 0x0145
de2bdb3dcf92280 Tom St Denis 2016-10-26  3542  #define mmDP_DTO2_MODULO 0x014A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3543  #define mmDP_DTO2_PHASE 0x0149
de2bdb3dcf92280 Tom St Denis 2016-10-26  3544  #define mmDP_DTO3_MODULO 0x014E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3545  #define mmDP_DTO3_PHASE 0x014D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3546  #define mmDP_DTO4_MODULO 0x0152
de2bdb3dcf92280 Tom St Denis 2016-10-26  3547  #define mmDP_DTO4_PHASE 0x0151
de2bdb3dcf92280 Tom St Denis 2016-10-26  3548  #define mmDP_DTO5_MODULO 0x0156
de2bdb3dcf92280 Tom St Denis 2016-10-26  3549  #define mmDP_DTO5_PHASE 0x0155
de2bdb3dcf92280 Tom St Denis 2016-10-26  3550  #define mmDPG_PIPE_ARBITRATION_CONTROL1 0x1B30
de2bdb3dcf92280 Tom St Denis 2016-10-26  3551  #define mmDPG_PIPE_ARBITRATION_CONTROL2 0x1B31
de2bdb3dcf92280 Tom St Denis 2016-10-26  3552  #define mmDPG_PIPE_DPM_CONTROL 0x1B34
de2bdb3dcf92280 Tom St Denis 2016-10-26  3553  #define mmDPG_PIPE_NB_PSTATE_CHANGE_CONTROL 0x1B36
de2bdb3dcf92280 Tom St Denis 2016-10-26  3554  #define mmDPG_PIPE_STUTTER_CONTROL 0x1B35
de2bdb3dcf92280 Tom St Denis 2016-10-26  3555  #define mmDPG_PIPE_STUTTER_CONTROL_NONLPTCH 0x1B37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3556  #define mmDPG_PIPE_URGENCY_CONTROL 0x1B33
de2bdb3dcf92280 Tom St Denis 2016-10-26  3557  #define mmDPG_TEST_DEBUG_DATA 0x1B39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3558  #define mmDPG_TEST_DEBUG_INDEX 0x1B38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3559  #define mmDP_HBR2_EYE_PATTERN 0x1CC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3560  #define mmDP_LINK_CNTL 0x1CC0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3561  #define mmDP_LINK_FRAMING_CNTL 0x1CCC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3562  #define mmDP_MSA_COLORIMETRY 0x1CDA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3563  #define mmDP_MSA_MISC 0x1CC5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3564  #define mmDP_MSA_V_TIMING_OVERRIDE1 0x1CEA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3565  #define mmDP_MSA_V_TIMING_OVERRIDE2 0x1CEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3566  #define mmDP_MSE_LINK_TIMING 0x1CE8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3567  #define mmDP_MSE_MISC_CNTL 0x1CDB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3568  #define mmDP_MSE_RATE_CNTL 0x1CE1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3569  #define mmDP_MSE_RATE_UPDATE 0x1CE3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3570  #define mmDP_MSE_SAT0 0x1CE4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3571  #define mmDP_MSE_SAT1 0x1CE5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3572  #define mmDP_MSE_SAT2 0x1CE6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3573  #define mmDP_MSE_SAT_UPDATE 0x1CE7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3574  #define mmDP_PIXEL_FORMAT 0x1CC1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3575  #define mmDP_SEC_AUD_M 0x1CA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3576  #define mmDP_SEC_AUD_M_READBACK 0x1CA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3577  #define mmDP_SEC_AUD_N 0x1CA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3578  #define mmDP_SEC_AUD_N_READBACK 0x1CA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3579  #define mmDP_SEC_CNTL 0x1CA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3580  #define mmDP_SEC_CNTL1 0x1CAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3581  #define mmDP_SEC_FRAMING1 0x1CA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3582  #define mmDP_SEC_FRAMING2 0x1CA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3583  #define mmDP_SEC_FRAMING3 0x1CA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3584  #define mmDP_SEC_FRAMING4 0x1CA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3585  #define mmDP_SEC_PACKET_CNTL 0x1CAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3586  #define mmDP_SEC_TIMESTAMP 0x1CA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3587  #define mmDP_STEER_FIFO 0x1CC4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3588  #define mmDP_TEST_DEBUG_DATA 0x1CFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3589  #define mmDP_TEST_DEBUG_INDEX 0x1CFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3590  #define mmDP_VID_INTERRUPT_CNTL 0x1CCF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3591  #define mmDP_VID_M 0x1CCB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3592  #define mmDP_VID_MSA_VBID 0x1CCD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3593  #define mmDP_VID_N 0x1CCA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3594  #define mmDP_VID_STREAM_CNTL 0x1CC3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3595  #define mmDP_VID_TIMING 0x1CC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3596  #define mmDVOACLKC_CNTL 0x016A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3597  #define mmDVOACLKC_MVP_CNTL 0x0169
de2bdb3dcf92280 Tom St Denis 2016-10-26  3598  #define mmDVOACLKD_CNTL 0x0168
de2bdb3dcf92280 Tom St Denis 2016-10-26  3599  #define mmDVO_CLK_ENABLE 0x0129
de2bdb3dcf92280 Tom St Denis 2016-10-26  3600  #define mmDVO_CONTROL 0x185B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3601  #define mmDVO_CRC2_SIG_MASK 0x185D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3602  #define mmDVO_CRC2_SIG_RESULT 0x185E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3603  #define mmDVO_CRC_EN 0x185C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3604  #define mmDVO_ENABLE 0x1858
de2bdb3dcf92280 Tom St Denis 2016-10-26  3605  #define mmDVO_FIFO_ERROR_STATUS 0x185F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3606  #define mmDVO_OUTPUT 0x185A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3607  #define mmDVO_SKEW_ADJUST 0x197D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3608  #define mmDVO_SOURCE_SELECT 0x1859
de2bdb3dcf92280 Tom St Denis 2016-10-26  3609  #define mmDVO_STRENGTH_CONTROL 0x197B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3610  #define mmDVO_VREF_CONTROL 0x197C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3611  #define mmEXT_OVERSCAN_LEFT_RIGHT 0x1B5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3612  #define mmEXT_OVERSCAN_TOP_BOTTOM 0x1B5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3613  #define mmFBC_CLIENT_REGION_MASK 0x16EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3614  #define mmFBC_CNTL 0x16D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3615  #define mmFBC_COMP_CNTL 0x16D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3616  #define mmFBC_COMP_MODE 0x16D5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3617  #define mmFBC_CSM_REGION_OFFSET_01 0x16E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3618  #define mmFBC_CSM_REGION_OFFSET_23 0x16EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3619  #define mmFBC_DEBUG0 0x16D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3620  #define mmFBC_DEBUG1 0x16D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3621  #define mmFBC_DEBUG2 0x16D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3622  #define mmFBC_DEBUG_COMP 0x16EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3623  #define mmFBC_DEBUG_CSR 0x16ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3624  #define mmFBC_DEBUG_CSR_RDATA 0x16EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3625  #define mmFBC_DEBUG_CSR_RDATA_HI 0x16F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3626  #define mmFBC_DEBUG_CSR_WDATA 0x16EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3627  #define mmFBC_DEBUG_CSR_WDATA_HI 0x16F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3628  #define mmFBC_IDLE_FORCE_CLEAR_MASK 0x16D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3629  #define mmFBC_IDLE_MASK 0x16D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3630  #define mmFBC_IND_LUT0 0x16D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3631  #define mmFBC_IND_LUT10 0x16E3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3632  #define mmFBC_IND_LUT1 0x16DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3633  #define mmFBC_IND_LUT11 0x16E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3634  #define mmFBC_IND_LUT12 0x16E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3635  #define mmFBC_IND_LUT13 0x16E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3636  #define mmFBC_IND_LUT14 0x16E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3637  #define mmFBC_IND_LUT15 0x16E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3638  #define mmFBC_IND_LUT2 0x16DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3639  #define mmFBC_IND_LUT3 0x16DC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3640  #define mmFBC_IND_LUT4 0x16DD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3641  #define mmFBC_IND_LUT5 0x16DE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3642  #define mmFBC_IND_LUT6 0x16DF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3643  #define mmFBC_IND_LUT7 0x16E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3644  #define mmFBC_IND_LUT8 0x16E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3645  #define mmFBC_IND_LUT9 0x16E2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3646  #define mmFBC_MISC 0x16F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3647  #define mmFBC_START_STOP_DELAY 0x16D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3648  #define mmFBC_STATUS 0x16F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3649  #define mmFBC_TEST_DEBUG_DATA 0x16F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3650  #define mmFBC_TEST_DEBUG_INDEX 0x16F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3651  #define mmFMT0_FMT_BIT_DEPTH_CONTROL 0x1BF2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3652  #define mmFMT0_FMT_CLAMP_CNTL 0x1BF9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3653  #define mmFMT0_FMT_CONTROL 0x1BEE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3654  #define mmFMT0_FMT_CRC_CNTL 0x1BFA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3655  #define mmFMT0_FMT_CRC_SIG_BLUE_CONTROL 0x1BFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3656  #define mmFMT0_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x1BFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3657  #define mmFMT0_FMT_CRC_SIG_RED_GREEN 0x1BFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3658  #define mmFMT0_FMT_CRC_SIG_RED_GREEN_MASK 0x1BFB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3659  #define mmFMT0_FMT_DEBUG_CNTL 0x1BFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3660  #define mmFMT0_FMT_DITHER_RAND_B_SEED 0x1BF5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3661  #define mmFMT0_FMT_DITHER_RAND_G_SEED 0x1BF4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3662  #define mmFMT0_FMT_DITHER_RAND_R_SEED 0x1BF3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3663  #define mmFMT0_FMT_DYNAMIC_EXP_CNTL 0x1BED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3664  #define mmFMT0_FMT_FORCE_DATA_0_1 0x1BF0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3665  #define mmFMT0_FMT_FORCE_DATA_2_3 0x1BF1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3666  #define mmFMT0_FMT_FORCE_OUTPUT_CNTL 0x1BEF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3667  #define mmFMT0_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x1BF6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3668  #define mmFMT0_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x1BF7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3669  #define mmFMT0_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x1BF8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3670  #define mmFMT0_FMT_TEST_DEBUG_DATA 0x1BEC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3671  #define mmFMT0_FMT_TEST_DEBUG_INDEX 0x1BEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3672  #define mmFMT1_FMT_BIT_DEPTH_CONTROL 0x1EF2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3673  #define mmFMT1_FMT_CLAMP_CNTL 0x1EF9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3674  #define mmFMT1_FMT_CONTROL 0x1EEE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3675  #define mmFMT1_FMT_CRC_CNTL 0x1EFA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3676  #define mmFMT1_FMT_CRC_SIG_BLUE_CONTROL 0x1EFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3677  #define mmFMT1_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x1EFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3678  #define mmFMT1_FMT_CRC_SIG_RED_GREEN 0x1EFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3679  #define mmFMT1_FMT_CRC_SIG_RED_GREEN_MASK 0x1EFB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3680  #define mmFMT1_FMT_DEBUG_CNTL 0x1EFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3681  #define mmFMT1_FMT_DITHER_RAND_B_SEED 0x1EF5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3682  #define mmFMT1_FMT_DITHER_RAND_G_SEED 0x1EF4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3683  #define mmFMT1_FMT_DITHER_RAND_R_SEED 0x1EF3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3684  #define mmFMT1_FMT_DYNAMIC_EXP_CNTL 0x1EED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3685  #define mmFMT1_FMT_FORCE_DATA_0_1 0x1EF0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3686  #define mmFMT1_FMT_FORCE_DATA_2_3 0x1EF1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3687  #define mmFMT1_FMT_FORCE_OUTPUT_CNTL 0x1EEF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3688  #define mmFMT1_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x1EF6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3689  #define mmFMT1_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x1EF7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3690  #define mmFMT1_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x1EF8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3691  #define mmFMT1_FMT_TEST_DEBUG_DATA 0x1EEC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3692  #define mmFMT1_FMT_TEST_DEBUG_INDEX 0x1EEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3693  #define mmFMT2_FMT_BIT_DEPTH_CONTROL 0x41F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3694  #define mmFMT2_FMT_CLAMP_CNTL 0x41F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3695  #define mmFMT2_FMT_CONTROL 0x41EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3696  #define mmFMT2_FMT_CRC_CNTL 0x41FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3697  #define mmFMT2_FMT_CRC_SIG_BLUE_CONTROL 0x41FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3698  #define mmFMT2_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x41FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3699  #define mmFMT2_FMT_CRC_SIG_RED_GREEN 0x41FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3700  #define mmFMT2_FMT_CRC_SIG_RED_GREEN_MASK 0x41FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3701  #define mmFMT2_FMT_DEBUG_CNTL 0x41FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3702  #define mmFMT2_FMT_DITHER_RAND_B_SEED 0x41F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3703  #define mmFMT2_FMT_DITHER_RAND_G_SEED 0x41F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3704  #define mmFMT2_FMT_DITHER_RAND_R_SEED 0x41F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3705  #define mmFMT2_FMT_DYNAMIC_EXP_CNTL 0x41ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3706  #define mmFMT2_FMT_FORCE_DATA_0_1 0x41F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3707  #define mmFMT2_FMT_FORCE_DATA_2_3 0x41F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3708  #define mmFMT2_FMT_FORCE_OUTPUT_CNTL 0x41EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3709  #define mmFMT2_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x41F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3710  #define mmFMT2_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x41F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3711  #define mmFMT2_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x41F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3712  #define mmFMT2_FMT_TEST_DEBUG_DATA 0x41EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3713  #define mmFMT2_FMT_TEST_DEBUG_INDEX 0x41EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3714  #define mmFMT3_FMT_BIT_DEPTH_CONTROL 0x44F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3715  #define mmFMT3_FMT_CLAMP_CNTL 0x44F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3716  #define mmFMT3_FMT_CONTROL 0x44EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3717  #define mmFMT3_FMT_CRC_CNTL 0x44FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3718  #define mmFMT3_FMT_CRC_SIG_BLUE_CONTROL 0x44FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3719  #define mmFMT3_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x44FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3720  #define mmFMT3_FMT_CRC_SIG_RED_GREEN 0x44FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3721  #define mmFMT3_FMT_CRC_SIG_RED_GREEN_MASK 0x44FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3722  #define mmFMT3_FMT_DEBUG_CNTL 0x44FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3723  #define mmFMT3_FMT_DITHER_RAND_B_SEED 0x44F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3724  #define mmFMT3_FMT_DITHER_RAND_G_SEED 0x44F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3725  #define mmFMT3_FMT_DITHER_RAND_R_SEED 0x44F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3726  #define mmFMT3_FMT_DYNAMIC_EXP_CNTL 0x44ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3727  #define mmFMT3_FMT_FORCE_DATA_0_1 0x44F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3728  #define mmFMT3_FMT_FORCE_DATA_2_3 0x44F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3729  #define mmFMT3_FMT_FORCE_OUTPUT_CNTL 0x44EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3730  #define mmFMT3_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x44F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3731  #define mmFMT3_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x44F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3732  #define mmFMT3_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x44F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3733  #define mmFMT3_FMT_TEST_DEBUG_DATA 0x44EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3734  #define mmFMT3_FMT_TEST_DEBUG_INDEX 0x44EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3735  #define mmFMT4_FMT_BIT_DEPTH_CONTROL 0x47F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3736  #define mmFMT4_FMT_CLAMP_CNTL 0x47F9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3737  #define mmFMT4_FMT_CONTROL 0x47EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3738  #define mmFMT4_FMT_CRC_CNTL 0x47FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3739  #define mmFMT4_FMT_CRC_SIG_BLUE_CONTROL 0x47FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3740  #define mmFMT4_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x47FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3741  #define mmFMT4_FMT_CRC_SIG_RED_GREEN 0x47FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3742  #define mmFMT4_FMT_CRC_SIG_RED_GREEN_MASK 0x47FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3743  #define mmFMT4_FMT_DEBUG_CNTL 0x47FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3744  #define mmFMT4_FMT_DITHER_RAND_B_SEED 0x47F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3745  #define mmFMT4_FMT_DITHER_RAND_G_SEED 0x47F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3746  #define mmFMT4_FMT_DITHER_RAND_R_SEED 0x47F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3747  #define mmFMT4_FMT_DYNAMIC_EXP_CNTL 0x47ED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3748  #define mmFMT4_FMT_FORCE_DATA_0_1 0x47F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3749  #define mmFMT4_FMT_FORCE_DATA_2_3 0x47F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3750  #define mmFMT4_FMT_FORCE_OUTPUT_CNTL 0x47EF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3751  #define mmFMT4_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x47F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3752  #define mmFMT4_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x47F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3753  #define mmFMT4_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x47F8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3754  #define mmFMT4_FMT_TEST_DEBUG_DATA 0x47EC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3755  #define mmFMT4_FMT_TEST_DEBUG_INDEX 0x47EB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3756  #define mmFMT5_FMT_BIT_DEPTH_CONTROL 0x4AF2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3757  #define mmFMT5_FMT_CLAMP_CNTL 0x4AF9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3758  #define mmFMT5_FMT_CONTROL 0x4AEE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3759  #define mmFMT5_FMT_CRC_CNTL 0x4AFA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3760  #define mmFMT5_FMT_CRC_SIG_BLUE_CONTROL 0x4AFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3761  #define mmFMT5_FMT_CRC_SIG_BLUE_CONTROL_MASK 0x4AFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3762  #define mmFMT5_FMT_CRC_SIG_RED_GREEN 0x4AFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3763  #define mmFMT5_FMT_CRC_SIG_RED_GREEN_MASK 0x4AFB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3764  #define mmFMT5_FMT_DEBUG_CNTL 0x4AFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3765  #define mmFMT5_FMT_DITHER_RAND_B_SEED 0x4AF5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3766  #define mmFMT5_FMT_DITHER_RAND_G_SEED 0x4AF4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3767  #define mmFMT5_FMT_DITHER_RAND_R_SEED 0x4AF3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3768  #define mmFMT5_FMT_DYNAMIC_EXP_CNTL 0x4AED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3769  #define mmFMT5_FMT_FORCE_DATA_0_1 0x4AF0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3770  #define mmFMT5_FMT_FORCE_DATA_2_3 0x4AF1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3771  #define mmFMT5_FMT_FORCE_OUTPUT_CNTL 0x4AEF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3772  #define mmFMT5_FMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x4AF6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3773  #define mmFMT5_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x4AF7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3774  #define mmFMT5_FMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x4AF8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3775  #define mmFMT5_FMT_TEST_DEBUG_DATA 0x4AEC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3776  #define mmFMT5_FMT_TEST_DEBUG_INDEX 0x4AEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3777  #define mmFMT_BIT_DEPTH_CONTROL 0x1BF2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3778  #define mmFMT_CLAMP_CNTL 0x1BF9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3779  #define mmFMT_CONTROL 0x1BEE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3780  #define mmFMT_CRC_CNTL 0x1BFA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3781  #define mmFMT_CRC_SIG_BLUE_CONTROL 0x1BFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3782  #define mmFMT_CRC_SIG_BLUE_CONTROL_MASK 0x1BFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3783  #define mmFMT_CRC_SIG_RED_GREEN 0x1BFD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3784  #define mmFMT_CRC_SIG_RED_GREEN_MASK 0x1BFB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3785  #define mmFMT_DEBUG_CNTL 0x1BFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3786  #define mmFMT_DITHER_RAND_B_SEED 0x1BF5
de2bdb3dcf92280 Tom St Denis 2016-10-26  3787  #define mmFMT_DITHER_RAND_G_SEED 0x1BF4
de2bdb3dcf92280 Tom St Denis 2016-10-26  3788  #define mmFMT_DITHER_RAND_R_SEED 0x1BF3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3789  #define mmFMT_DYNAMIC_EXP_CNTL 0x1BED
de2bdb3dcf92280 Tom St Denis 2016-10-26  3790  #define mmFMT_FORCE_DATA_0_1 0x1BF0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3791  #define mmFMT_FORCE_DATA_2_3 0x1BF1
de2bdb3dcf92280 Tom St Denis 2016-10-26  3792  #define mmFMT_FORCE_OUTPUT_CNTL 0x1BEF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3793  #define mmFMT_TEMPORAL_DITHER_PATTERN_CONTROL 0x1BF6
de2bdb3dcf92280 Tom St Denis 2016-10-26  3794  #define mmFMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_S_MATRIX 0x1BF7
de2bdb3dcf92280 Tom St Denis 2016-10-26  3795  #define mmFMT_TEMPORAL_DITHER_PROGRAMMABLE_PATTERN_T_MATRIX 0x1BF8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3796  #define mmFMT_TEST_DEBUG_DATA 0x1BEC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3797  #define mmFMT_TEST_DEBUG_INDEX 0x1BEB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3798  #define mmGAMUT_REMAP_C11_C12 0x1A5A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3799  #define mmGAMUT_REMAP_C13_C14 0x1A5B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3800  #define mmGAMUT_REMAP_C21_C22 0x1A5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3801  #define mmGAMUT_REMAP_C23_C24 0x1A5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3802  #define mmGAMUT_REMAP_C31_C32 0x1A5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3803  #define mmGAMUT_REMAP_C33_C34 0x1A5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3804  #define mmGAMUT_REMAP_CONTROL 0x1A59
de2bdb3dcf92280 Tom St Denis 2016-10-26  3805  #define mmGENENB 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3806  #define mmGENERIC_I2C_CONTROL 0x1834
de2bdb3dcf92280 Tom St Denis 2016-10-26  3807  #define mmGENERIC_I2C_DATA 0x183A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3808  #define mmGENERIC_I2C_INTERRUPT_CONTROL 0x1835
de2bdb3dcf92280 Tom St Denis 2016-10-26  3809  #define mmGENERIC_I2C_PIN_DEBUG 0x183C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3810  #define mmGENERIC_I2C_PIN_SELECTION 0x183B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3811  #define mmGENERIC_I2C_SETUP 0x1838
de2bdb3dcf92280 Tom St Denis 2016-10-26  3812  #define mmGENERIC_I2C_SPEED 0x1837
de2bdb3dcf92280 Tom St Denis 2016-10-26  3813  #define mmGENERIC_I2C_STATUS 0x1836
de2bdb3dcf92280 Tom St Denis 2016-10-26  3814  #define mmGENERIC_I2C_TRANSACTION 0x1839
de2bdb3dcf92280 Tom St Denis 2016-10-26  3815  #define mmGENFC_RD 0x00F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  3816  #define mmGENFC_WT 0x00EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3817  #define mmGENMO_RD 0x00F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3818  #define mmGENMO_WT 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3819  #define mmGENS0 0x00F0
de2bdb3dcf92280 Tom St Denis 2016-10-26  3820  #define mmGENS1 0x00EE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3821  #define mmGRPH8_DATA 0x00F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3822  #define mmGRPH8_IDX 0x00F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  3823  #define mmGRPH_COMPRESS_PITCH 0x1A1A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3824  #define mmGRPH_COMPRESS_SURFACE_ADDRESS 0x1A19
de2bdb3dcf92280 Tom St Denis 2016-10-26  3825  #define mmGRPH_COMPRESS_SURFACE_ADDRESS_HIGH 0x1A1B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3826  #define mmGRPH_CONTROL 0x1A01
de2bdb3dcf92280 Tom St Denis 2016-10-26  3827  #define mmGRPH_DFQ_CONTROL 0x1A14
de2bdb3dcf92280 Tom St Denis 2016-10-26  3828  #define mmGRPH_DFQ_STATUS 0x1A15
de2bdb3dcf92280 Tom St Denis 2016-10-26  3829  #define mmGRPH_ENABLE 0x1A00
de2bdb3dcf92280 Tom St Denis 2016-10-26  3830  #define mmGRPH_FLIP_CONTROL 0x1A12
de2bdb3dcf92280 Tom St Denis 2016-10-26  3831  #define mmGRPH_INTERRUPT_CONTROL 0x1A17
de2bdb3dcf92280 Tom St Denis 2016-10-26  3832  #define mmGRPH_INTERRUPT_STATUS 0x1A16
de2bdb3dcf92280 Tom St Denis 2016-10-26  3833  #define mmGRPH_LUT_10BIT_BYPASS 0x1A02
de2bdb3dcf92280 Tom St Denis 2016-10-26  3834  #define mmGRPH_PITCH 0x1A06
de2bdb3dcf92280 Tom St Denis 2016-10-26  3835  #define mmGRPH_PRIMARY_SURFACE_ADDRESS 0x1A04
de2bdb3dcf92280 Tom St Denis 2016-10-26  3836  #define mmGRPH_PRIMARY_SURFACE_ADDRESS_HIGH 0x1A07
de2bdb3dcf92280 Tom St Denis 2016-10-26  3837  #define mmGRPH_SECONDARY_SURFACE_ADDRESS 0x1A05
de2bdb3dcf92280 Tom St Denis 2016-10-26  3838  #define mmGRPH_SECONDARY_SURFACE_ADDRESS_HIGH 0x1A08
de2bdb3dcf92280 Tom St Denis 2016-10-26  3839  #define mmGRPH_STEREOSYNC_FLIP 0x1A97
de2bdb3dcf92280 Tom St Denis 2016-10-26  3840  #define mmGRPH_SURFACE_ADDRESS_HIGH_INUSE 0x1A18
de2bdb3dcf92280 Tom St Denis 2016-10-26  3841  #define mmGRPH_SURFACE_ADDRESS_INUSE 0x1A13
de2bdb3dcf92280 Tom St Denis 2016-10-26  3842  #define mmGRPH_SURFACE_OFFSET_X 0x1A09
de2bdb3dcf92280 Tom St Denis 2016-10-26  3843  #define mmGRPH_SURFACE_OFFSET_Y 0x1A0A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3844  #define mmGRPH_SWAP_CNTL 0x1A03
de2bdb3dcf92280 Tom St Denis 2016-10-26  3845  #define mmGRPH_UPDATE 0x1A11
de2bdb3dcf92280 Tom St Denis 2016-10-26  3846  #define mmGRPH_X_END 0x1A0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3847  #define mmGRPH_X_START 0x1A0B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3848  #define mmGRPH_Y_END 0x1A0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3849  #define mmGRPH_Y_START 0x1A0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3850  #define mmHDMI_ACR_32_0 0x1C37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3851  #define mmHDMI_ACR_32_1 0x1C38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3852  #define mmHDMI_ACR_44_0 0x1C39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3853  #define mmHDMI_ACR_44_1 0x1C3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3854  #define mmHDMI_ACR_48_0 0x1C3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3855  #define mmHDMI_ACR_48_1 0x1C3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3856  #define mmHDMI_ACR_PACKET_CONTROL 0x1C0F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3857  #define mmHDMI_ACR_STATUS_0 0x1C3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3858  #define mmHDMI_ACR_STATUS_1 0x1C3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3859  #define mmHDMI_AUDIO_PACKET_CONTROL 0x1C0E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3860  #define mmHDMI_CONTROL 0x1C0C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3861  #define mmHDMI_GC 0x1C16
de2bdb3dcf92280 Tom St Denis 2016-10-26  3862  #define mmHDMI_GENERIC_PACKET_CONTROL0 0x1C13
de2bdb3dcf92280 Tom St Denis 2016-10-26  3863  #define mmHDMI_GENERIC_PACKET_CONTROL1 0x1C30
de2bdb3dcf92280 Tom St Denis 2016-10-26  3864  #define mmHDMI_INFOFRAME_CONTROL0 0x1C11
de2bdb3dcf92280 Tom St Denis 2016-10-26  3865  #define mmHDMI_INFOFRAME_CONTROL1 0x1C12
de2bdb3dcf92280 Tom St Denis 2016-10-26  3866  #define mmHDMI_STATUS 0x1C0D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3867  #define mmHDMI_VBI_PACKET_CONTROL 0x1C10
de2bdb3dcf92280 Tom St Denis 2016-10-26  3868  #define mmINPUT_CSC_C11_C12 0x1A36
de2bdb3dcf92280 Tom St Denis 2016-10-26  3869  #define mmINPUT_CSC_C13_C14 0x1A37
de2bdb3dcf92280 Tom St Denis 2016-10-26  3870  #define mmINPUT_CSC_C21_C22 0x1A38
de2bdb3dcf92280 Tom St Denis 2016-10-26  3871  #define mmINPUT_CSC_C23_C24 0x1A39
de2bdb3dcf92280 Tom St Denis 2016-10-26  3872  #define mmINPUT_CSC_C31_C32 0x1A3A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3873  #define mmINPUT_CSC_C33_C34 0x1A3B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3874  #define mmINPUT_CSC_CONTROL 0x1A35
de2bdb3dcf92280 Tom St Denis 2016-10-26  3875  #define mmINPUT_GAMMA_CONTROL 0x1A10
de2bdb3dcf92280 Tom St Denis 2016-10-26  3876  #define mmKEY_CONTROL 0x1A53
de2bdb3dcf92280 Tom St Denis 2016-10-26  3877  #define mmKEY_RANGE_ALPHA 0x1A54
de2bdb3dcf92280 Tom St Denis 2016-10-26  3878  #define mmKEY_RANGE_BLUE 0x1A57
de2bdb3dcf92280 Tom St Denis 2016-10-26  3879  #define mmKEY_RANGE_GREEN 0x1A56
de2bdb3dcf92280 Tom St Denis 2016-10-26  3880  #define mmKEY_RANGE_RED 0x1A55
de2bdb3dcf92280 Tom St Denis 2016-10-26  3881  #define mmLB0_DC_MVP_LB_CONTROL 0x1ADB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3882  #define mmLB0_LB_DEBUG 0x1AFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3883  #define mmLB0_LB_DEBUG2 0x1AC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3884  #define mmLB0_LB_NO_OUTSTANDING_REQ_STATUS 0x1AC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3885  #define mmLB0_LB_SYNC_RESET_SEL 0x1ACA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3886  #define mmLB0_LB_TEST_DEBUG_DATA 0x1AFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3887  #define mmLB0_LB_TEST_DEBUG_INDEX 0x1AFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3888  #define mmLB0_MVP_AFR_FLIP_FIFO_CNTL 0x1AD9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3889  #define mmLB0_MVP_AFR_FLIP_MODE 0x1AD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3890  #define mmLB0_MVP_FLIP_LINE_NUM_INSERT 0x1ADA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3891  #define mmLB1_DC_MVP_LB_CONTROL 0x1DDB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3892  #define mmLB1_LB_DEBUG 0x1DFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3893  #define mmLB1_LB_DEBUG2 0x1DC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3894  #define mmLB1_LB_NO_OUTSTANDING_REQ_STATUS 0x1DC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3895  #define mmLB1_LB_SYNC_RESET_SEL 0x1DCA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3896  #define mmLB1_LB_TEST_DEBUG_DATA 0x1DFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3897  #define mmLB1_LB_TEST_DEBUG_INDEX 0x1DFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3898  #define mmLB1_MVP_AFR_FLIP_FIFO_CNTL 0x1DD9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3899  #define mmLB1_MVP_AFR_FLIP_MODE 0x1DD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3900  #define mmLB1_MVP_FLIP_LINE_NUM_INSERT 0x1DDA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3901  #define mmLB2_DC_MVP_LB_CONTROL 0x40DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3902  #define mmLB2_LB_DEBUG 0x40FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3903  #define mmLB2_LB_DEBUG2 0x40C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3904  #define mmLB2_LB_NO_OUTSTANDING_REQ_STATUS 0x40C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3905  #define mmLB2_LB_SYNC_RESET_SEL 0x40CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3906  #define mmLB2_LB_TEST_DEBUG_DATA 0x40FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3907  #define mmLB2_LB_TEST_DEBUG_INDEX 0x40FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3908  #define mmLB2_MVP_AFR_FLIP_FIFO_CNTL 0x40D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3909  #define mmLB2_MVP_AFR_FLIP_MODE 0x40D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3910  #define mmLB2_MVP_FLIP_LINE_NUM_INSERT 0x40DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3911  #define mmLB3_DC_MVP_LB_CONTROL 0x43DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3912  #define mmLB3_LB_DEBUG 0x43FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3913  #define mmLB3_LB_DEBUG2 0x43C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3914  #define mmLB3_LB_NO_OUTSTANDING_REQ_STATUS 0x43C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3915  #define mmLB3_LB_SYNC_RESET_SEL 0x43CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3916  #define mmLB3_LB_TEST_DEBUG_DATA 0x43FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3917  #define mmLB3_LB_TEST_DEBUG_INDEX 0x43FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3918  #define mmLB3_MVP_AFR_FLIP_FIFO_CNTL 0x43D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3919  #define mmLB3_MVP_AFR_FLIP_MODE 0x43D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3920  #define mmLB3_MVP_FLIP_LINE_NUM_INSERT 0x43DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3921  #define mmLB4_DC_MVP_LB_CONTROL 0x46DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3922  #define mmLB4_LB_DEBUG 0x46FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3923  #define mmLB4_LB_DEBUG2 0x46C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3924  #define mmLB4_LB_NO_OUTSTANDING_REQ_STATUS 0x46C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3925  #define mmLB4_LB_SYNC_RESET_SEL 0x46CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3926  #define mmLB4_LB_TEST_DEBUG_DATA 0x46FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3927  #define mmLB4_LB_TEST_DEBUG_INDEX 0x46FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3928  #define mmLB4_MVP_AFR_FLIP_FIFO_CNTL 0x46D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3929  #define mmLB4_MVP_AFR_FLIP_MODE 0x46D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3930  #define mmLB4_MVP_FLIP_LINE_NUM_INSERT 0x46DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3931  #define mmLB5_DC_MVP_LB_CONTROL 0x49DB
de2bdb3dcf92280 Tom St Denis 2016-10-26  3932  #define mmLB5_LB_DEBUG 0x49FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3933  #define mmLB5_LB_DEBUG2 0x49C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3934  #define mmLB5_LB_NO_OUTSTANDING_REQ_STATUS 0x49C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3935  #define mmLB5_LB_SYNC_RESET_SEL 0x49CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3936  #define mmLB5_LB_TEST_DEBUG_DATA 0x49FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3937  #define mmLB5_LB_TEST_DEBUG_INDEX 0x49FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3938  #define mmLB5_MVP_AFR_FLIP_FIFO_CNTL 0x49D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3939  #define mmLB5_MVP_AFR_FLIP_MODE 0x49D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3940  #define mmLB5_MVP_FLIP_LINE_NUM_INSERT 0x49DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3941  #define mmLB_DEBUG 0x1AFC
de2bdb3dcf92280 Tom St Denis 2016-10-26  3942  #define mmLB_DEBUG2 0x1AC9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3943  #define mmLB_NO_OUTSTANDING_REQ_STATUS 0x1AC8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3944  #define mmLB_SYNC_RESET_SEL 0x1ACA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3945  #define mmLB_TEST_DEBUG_DATA 0x1AFF
de2bdb3dcf92280 Tom St Denis 2016-10-26  3946  #define mmLB_TEST_DEBUG_INDEX 0x1AFE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3947  #define mmLIGHT_SLEEP_CNTL 0x0132
de2bdb3dcf92280 Tom St Denis 2016-10-26  3948  #define mmLOW_POWER_TILING_CONTROL 0x0325
de2bdb3dcf92280 Tom St Denis 2016-10-26  3949  #define mmLVDS_DATA_CNTL 0x1C8C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3950  #define mmLVTMA_PWRSEQ_CNTL 0x1919
de2bdb3dcf92280 Tom St Denis 2016-10-26  3951  #define mmLVTMA_PWRSEQ_DELAY1 0x191C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3952  #define mmLVTMA_PWRSEQ_DELAY2 0x191D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3953  #define mmLVTMA_PWRSEQ_REF_DIV 0x191B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3954  #define mmLVTMA_PWRSEQ_STATE 0x191A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3955  #define mmMASTER_COMM_CMD_REG 0x161F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3956  #define mmMASTER_COMM_CNTL_REG 0x1620
de2bdb3dcf92280 Tom St Denis 2016-10-26  3957  #define mmMASTER_COMM_DATA_REG1 0x161C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3958  #define mmMASTER_COMM_DATA_REG2 0x161D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3959  #define mmMASTER_COMM_DATA_REG3 0x161E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3960  #define mmMASTER_UPDATE_LOCK 0x1BBD
de2bdb3dcf92280 Tom St Denis 2016-10-26  3961  #define mmMASTER_UPDATE_MODE 0x1BBE
de2bdb3dcf92280 Tom St Denis 2016-10-26  3962  #define mmMC_DC_INTERFACE_NACK_STATUS 0x031C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3963  #define mmMCIF_CONTROL 0x0314
de2bdb3dcf92280 Tom St Denis 2016-10-26  3964  #define mmMCIF_MEM_CONTROL 0x0319
de2bdb3dcf92280 Tom St Denis 2016-10-26  3965  #define mmMCIF_TEST_DEBUG_DATA 0x0317
de2bdb3dcf92280 Tom St Denis 2016-10-26  3966  #define mmMCIF_TEST_DEBUG_INDEX 0x0316
de2bdb3dcf92280 Tom St Denis 2016-10-26  3967  #define mmMCIF_VMID 0x0318
de2bdb3dcf92280 Tom St Denis 2016-10-26  3968  #define mmMCIF_WRITE_COMBINE_CONTROL 0x0315
de2bdb3dcf92280 Tom St Denis 2016-10-26  3969  #define mmMICROSECOND_TIME_BASE_DIV 0x013B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3970  #define mmMILLISECOND_TIME_BASE_DIV 0x0130
de2bdb3dcf92280 Tom St Denis 2016-10-26  3971  #define mmMVP_AFR_FLIP_FIFO_CNTL 0x1AD9
de2bdb3dcf92280 Tom St Denis 2016-10-26  3972  #define mmMVP_AFR_FLIP_MODE 0x1AD8
de2bdb3dcf92280 Tom St Denis 2016-10-26  3973  #define mmMVP_BLACK_KEYER 0x1686
de2bdb3dcf92280 Tom St Denis 2016-10-26  3974  #define mmMVP_CONTROL1 0x1680
de2bdb3dcf92280 Tom St Denis 2016-10-26  3975  #define mmMVP_CONTROL2 0x1681
de2bdb3dcf92280 Tom St Denis 2016-10-26  3976  #define mmMVP_CONTROL3 0x168A
de2bdb3dcf92280 Tom St Denis 2016-10-26  3977  #define mmMVP_CRC_CNTL 0x1687
de2bdb3dcf92280 Tom St Denis 2016-10-26  3978  #define mmMVP_CRC_RESULT_BLUE_GREEN 0x1688
de2bdb3dcf92280 Tom St Denis 2016-10-26  3979  #define mmMVP_CRC_RESULT_RED 0x1689
de2bdb3dcf92280 Tom St Denis 2016-10-26  3980  #define mmMVP_DEBUG 0x168F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3981  #define mmMVP_FIFO_CONTROL 0x1682
de2bdb3dcf92280 Tom St Denis 2016-10-26  3982  #define mmMVP_FIFO_STATUS 0x1683
de2bdb3dcf92280 Tom St Denis 2016-10-26  3983  #define mmMVP_FLIP_LINE_NUM_INSERT 0x1ADA
de2bdb3dcf92280 Tom St Denis 2016-10-26  3984  #define mmMVP_INBAND_CNTL_CAP 0x1685
de2bdb3dcf92280 Tom St Denis 2016-10-26  3985  #define mmMVP_RECEIVE_CNT_CNTL1 0x168B
de2bdb3dcf92280 Tom St Denis 2016-10-26  3986  #define mmMVP_RECEIVE_CNT_CNTL2 0x168C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3987  #define mmMVP_SLAVE_STATUS 0x1684
de2bdb3dcf92280 Tom St Denis 2016-10-26  3988  #define mmMVP_TEST_DEBUG_DATA 0x168E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3989  #define mmMVP_TEST_DEBUG_INDEX 0x168D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3990  #define mmOUTPUT_CSC_C11_C12 0x1A3D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3991  #define mmOUTPUT_CSC_C13_C14 0x1A3E
de2bdb3dcf92280 Tom St Denis 2016-10-26  3992  #define mmOUTPUT_CSC_C21_C22 0x1A3F
de2bdb3dcf92280 Tom St Denis 2016-10-26  3993  #define mmOUTPUT_CSC_C23_C24 0x1A40
de2bdb3dcf92280 Tom St Denis 2016-10-26  3994  #define mmOUTPUT_CSC_C31_C32 0x1A41
de2bdb3dcf92280 Tom St Denis 2016-10-26  3995  #define mmOUTPUT_CSC_C33_C34 0x1A42
de2bdb3dcf92280 Tom St Denis 2016-10-26  3996  #define mmOUTPUT_CSC_CONTROL 0x1A3C
de2bdb3dcf92280 Tom St Denis 2016-10-26  3997  #define mmOUT_ROUND_CONTROL 0x1A51
de2bdb3dcf92280 Tom St Denis 2016-10-26  3998  #define mmOVL_CONTROL1 0x1A1D
de2bdb3dcf92280 Tom St Denis 2016-10-26  3999  #define mmOVL_CONTROL2 0x1A1E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4000  #define mmOVL_DFQ_CONTROL 0x1A29
de2bdb3dcf92280 Tom St Denis 2016-10-26  4001  #define mmOVL_DFQ_STATUS 0x1A2A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4002  #define mmOVL_ENABLE 0x1A1C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4003  #define mmOVL_END 0x1A26
de2bdb3dcf92280 Tom St Denis 2016-10-26  4004  #define mmOVL_PITCH 0x1A21
de2bdb3dcf92280 Tom St Denis 2016-10-26  4005  #define mmOVLSCL_EDGE_PIXEL_CNTL 0x1A2C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4006  #define mmOVL_SECONDARY_SURFACE_ADDRESS 0x1A92
de2bdb3dcf92280 Tom St Denis 2016-10-26  4007  #define mmOVL_SECONDARY_SURFACE_ADDRESS_HIGH 0x1A94
de2bdb3dcf92280 Tom St Denis 2016-10-26  4008  #define mmOVL_START 0x1A25
de2bdb3dcf92280 Tom St Denis 2016-10-26  4009  #define mmOVL_STEREOSYNC_FLIP 0x1A93
de2bdb3dcf92280 Tom St Denis 2016-10-26  4010  #define mmOVL_SURFACE_ADDRESS 0x1A20
de2bdb3dcf92280 Tom St Denis 2016-10-26  4011  #define mmOVL_SURFACE_ADDRESS_HIGH 0x1A22
de2bdb3dcf92280 Tom St Denis 2016-10-26  4012  #define mmOVL_SURFACE_ADDRESS_HIGH_INUSE 0x1A2B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4013  #define mmOVL_SURFACE_ADDRESS_INUSE 0x1A28
de2bdb3dcf92280 Tom St Denis 2016-10-26  4014  #define mmOVL_SURFACE_OFFSET_X 0x1A23
de2bdb3dcf92280 Tom St Denis 2016-10-26  4015  #define mmOVL_SURFACE_OFFSET_Y 0x1A24
de2bdb3dcf92280 Tom St Denis 2016-10-26  4016  #define mmOVL_SWAP_CNTL 0x1A1F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4017  #define mmOVL_UPDATE 0x1A27
de2bdb3dcf92280 Tom St Denis 2016-10-26  4018  #define mmPHY_AUX_CNTL 0x197F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4019  #define mmPIPE0_ARBITRATION_CONTROL3 0x02FA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4020  #define mmPIPE0_DMIF_BUFFER_CONTROL 0x0328
de2bdb3dcf92280 Tom St Denis 2016-10-26  4021  #define mmPIPE0_MAX_REQUESTS 0x0302
de2bdb3dcf92280 Tom St Denis 2016-10-26  4022  #define mmPIPE0_PG_CONFIG 0x1760
de2bdb3dcf92280 Tom St Denis 2016-10-26  4023  #define mmPIPE0_PG_ENABLE 0x1761
de2bdb3dcf92280 Tom St Denis 2016-10-26  4024  #define mmPIPE0_PG_STATUS 0x1762
de2bdb3dcf92280 Tom St Denis 2016-10-26  4025  #define mmPIPE1_ARBITRATION_CONTROL3 0x02FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  4026  #define mmPIPE1_DMIF_BUFFER_CONTROL 0x0330
de2bdb3dcf92280 Tom St Denis 2016-10-26  4027  #define mmPIPE1_MAX_REQUESTS 0x0303
de2bdb3dcf92280 Tom St Denis 2016-10-26  4028  #define mmPIPE1_PG_CONFIG 0x1764
de2bdb3dcf92280 Tom St Denis 2016-10-26  4029  #define mmPIPE1_PG_ENABLE 0x1765
de2bdb3dcf92280 Tom St Denis 2016-10-26  4030  #define mmPIPE1_PG_STATUS 0x1766
de2bdb3dcf92280 Tom St Denis 2016-10-26  4031  #define mmPIPE2_ARBITRATION_CONTROL3 0x02FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  4032  #define mmPIPE2_DMIF_BUFFER_CONTROL 0x0338
de2bdb3dcf92280 Tom St Denis 2016-10-26  4033  #define mmPIPE2_MAX_REQUESTS 0x0304
de2bdb3dcf92280 Tom St Denis 2016-10-26  4034  #define mmPIPE2_PG_CONFIG 0x1768
de2bdb3dcf92280 Tom St Denis 2016-10-26  4035  #define mmPIPE2_PG_ENABLE 0x1769
de2bdb3dcf92280 Tom St Denis 2016-10-26  4036  #define mmPIPE2_PG_STATUS 0x176A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4037  #define mmPIPE3_ARBITRATION_CONTROL3 0x02FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  4038  #define mmPIPE3_DMIF_BUFFER_CONTROL 0x0340
de2bdb3dcf92280 Tom St Denis 2016-10-26  4039  #define mmPIPE3_MAX_REQUESTS 0x0305
de2bdb3dcf92280 Tom St Denis 2016-10-26  4040  #define mmPIPE3_PG_CONFIG 0x176C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4041  #define mmPIPE3_PG_ENABLE 0x176D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4042  #define mmPIPE3_PG_STATUS 0x176E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4043  #define mmPIPE4_ARBITRATION_CONTROL3 0x02FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  4044  #define mmPIPE4_DMIF_BUFFER_CONTROL 0x0348
de2bdb3dcf92280 Tom St Denis 2016-10-26  4045  #define mmPIPE4_MAX_REQUESTS 0x0306
de2bdb3dcf92280 Tom St Denis 2016-10-26  4046  #define mmPIPE4_PG_CONFIG 0x1770
de2bdb3dcf92280 Tom St Denis 2016-10-26  4047  #define mmPIPE4_PG_ENABLE 0x1771
de2bdb3dcf92280 Tom St Denis 2016-10-26  4048  #define mmPIPE4_PG_STATUS 0x1772
de2bdb3dcf92280 Tom St Denis 2016-10-26  4049  #define mmPIPE5_ARBITRATION_CONTROL3 0x02FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  4050  #define mmPIPE5_DMIF_BUFFER_CONTROL 0x0350
de2bdb3dcf92280 Tom St Denis 2016-10-26  4051  #define mmPIPE5_MAX_REQUESTS 0x0307
de2bdb3dcf92280 Tom St Denis 2016-10-26  4052  #define mmPIPE5_PG_CONFIG 0x1774
de2bdb3dcf92280 Tom St Denis 2016-10-26  4053  #define mmPIPE5_PG_ENABLE 0x1775
de2bdb3dcf92280 Tom St Denis 2016-10-26  4054  #define mmPIPE5_PG_STATUS 0x1776
de2bdb3dcf92280 Tom St Denis 2016-10-26  4055  #define mmPIXCLK0_RESYNC_CNTL 0x013A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4056  #define mmPIXCLK1_RESYNC_CNTL 0x0138
de2bdb3dcf92280 Tom St Denis 2016-10-26  4057  #define mmPIXCLK2_RESYNC_CNTL 0x0139
de2bdb3dcf92280 Tom St Denis 2016-10-26  4058  #define mmPLL_ANALOG 0x1708
de2bdb3dcf92280 Tom St Denis 2016-10-26  4059  #define mmPLL_CNTL 0x1707
de2bdb3dcf92280 Tom St Denis 2016-10-26  4060  #define mmPLL_DEBUG_CNTL 0x170B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4061  #define mmPLL_DISPCLK_CURRENT_DTO_PHASE 0x170F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4062  #define mmPLL_DISPCLK_DTO_CNTL 0x170E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4063  #define mmPLL_DS_CNTL 0x1705
de2bdb3dcf92280 Tom St Denis 2016-10-26  4064  #define mmPLL_FB_DIV 0x1701
de2bdb3dcf92280 Tom St Denis 2016-10-26  4065  #define mmPLL_IDCLK_CNTL 0x1706
de2bdb3dcf92280 Tom St Denis 2016-10-26  4066  #define mmPLL_POST_DIV 0x1702
de2bdb3dcf92280 Tom St Denis 2016-10-26  4067  #define mmPLL_REF_DIV 0x1700
de2bdb3dcf92280 Tom St Denis 2016-10-26  4068  #define mmPLL_SS_AMOUNT_DSFRAC 0x1703
de2bdb3dcf92280 Tom St Denis 2016-10-26  4069  #define mmPLL_SS_CNTL 0x1704
de2bdb3dcf92280 Tom St Denis 2016-10-26  4070  #define mmPLL_UNLOCK_DETECT_CNTL 0x170A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4071  #define mmPLL_UPDATE_CNTL 0x170D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4072  #define mmPLL_UPDATE_LOCK 0x170C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4073  #define mmPLL_VREG_CNTL 0x1709
de2bdb3dcf92280 Tom St Denis 2016-10-26  4074  #define mmPRESCALE_GRPH_CONTROL 0x1A2D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4075  #define mmPRESCALE_OVL_CONTROL 0x1A31
de2bdb3dcf92280 Tom St Denis 2016-10-26  4076  #define mmPRESCALE_VALUES_GRPH_B 0x1A30
de2bdb3dcf92280 Tom St Denis 2016-10-26  4077  #define mmPRESCALE_VALUES_GRPH_G 0x1A2F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4078  #define mmPRESCALE_VALUES_GRPH_R 0x1A2E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4079  #define mmPRESCALE_VALUES_OVL_CB 0x1A32
de2bdb3dcf92280 Tom St Denis 2016-10-26  4080  #define mmPRESCALE_VALUES_OVL_CR 0x1A34
de2bdb3dcf92280 Tom St Denis 2016-10-26  4081  #define mmPRESCALE_VALUES_OVL_Y 0x1A33
de2bdb3dcf92280 Tom St Denis 2016-10-26  4082  #define mmREGAMMA_CNTLA_END_CNTL1 0x1AA6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4083  #define mmREGAMMA_CNTLA_END_CNTL2 0x1AA7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4084  #define mmREGAMMA_CNTLA_REGION_0_1 0x1AA8
de2bdb3dcf92280 Tom St Denis 2016-10-26  4085  #define mmREGAMMA_CNTLA_REGION_10_11 0x1AAD
de2bdb3dcf92280 Tom St Denis 2016-10-26  4086  #define mmREGAMMA_CNTLA_REGION_12_13 0x1AAE
de2bdb3dcf92280 Tom St Denis 2016-10-26  4087  #define mmREGAMMA_CNTLA_REGION_14_15 0x1AAF
de2bdb3dcf92280 Tom St Denis 2016-10-26  4088  #define mmREGAMMA_CNTLA_REGION_2_3 0x1AA9
de2bdb3dcf92280 Tom St Denis 2016-10-26  4089  #define mmREGAMMA_CNTLA_REGION_4_5 0x1AAA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4090  #define mmREGAMMA_CNTLA_REGION_6_7 0x1AAB
de2bdb3dcf92280 Tom St Denis 2016-10-26  4091  #define mmREGAMMA_CNTLA_REGION_8_9 0x1AAC
de2bdb3dcf92280 Tom St Denis 2016-10-26  4092  #define mmREGAMMA_CNTLA_SLOPE_CNTL 0x1AA5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4093  #define mmREGAMMA_CNTLA_START_CNTL 0x1AA4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4094  #define mmREGAMMA_CNTLB_END_CNTL1 0x1AB2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4095  #define mmREGAMMA_CNTLB_END_CNTL2 0x1AB3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4096  #define mmREGAMMA_CNTLB_REGION_0_1 0x1AB4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4097  #define mmREGAMMA_CNTLB_REGION_10_11 0x1AB9
de2bdb3dcf92280 Tom St Denis 2016-10-26  4098  #define mmREGAMMA_CNTLB_REGION_12_13 0x1ABA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4099  #define mmREGAMMA_CNTLB_REGION_14_15 0x1ABB
de2bdb3dcf92280 Tom St Denis 2016-10-26  4100  #define mmREGAMMA_CNTLB_REGION_2_3 0x1AB5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4101  #define mmREGAMMA_CNTLB_REGION_4_5 0x1AB6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4102  #define mmREGAMMA_CNTLB_REGION_6_7 0x1AB7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4103  #define mmREGAMMA_CNTLB_REGION_8_9 0x1AB8
de2bdb3dcf92280 Tom St Denis 2016-10-26  4104  #define mmREGAMMA_CNTLB_SLOPE_CNTL 0x1AB1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4105  #define mmREGAMMA_CNTLB_START_CNTL 0x1AB0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4106  #define mmREGAMMA_CONTROL 0x1AA0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4107  #define mmREGAMMA_LUT_DATA 0x1AA2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4108  #define mmREGAMMA_LUT_INDEX 0x1AA1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4109  #define mmREGAMMA_LUT_WRITE_EN_MASK 0x1AA3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4110  #define mmSCL0_EXT_OVERSCAN_LEFT_RIGHT 0x1B5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4111  #define mmSCL0_EXT_OVERSCAN_TOP_BOTTOM 0x1B5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4112  #define mmSCL0_SCL_ALU_CONTROL 0x1B54
de2bdb3dcf92280 Tom St Denis 2016-10-26  4113  #define mmSCL0_SCL_AUTOMATIC_MODE_CONTROL 0x1B47
de2bdb3dcf92280 Tom St Denis 2016-10-26  4114  #define mmSCL0_SCL_BYPASS_CONTROL 0x1B45
de2bdb3dcf92280 Tom St Denis 2016-10-26  4115  #define mmSCL0_SCL_COEF_RAM_CONFLICT_STATUS 0x1B55
de2bdb3dcf92280 Tom St Denis 2016-10-26  4116  #define mmSCL0_SCL_COEF_RAM_SELECT 0x1B40
de2bdb3dcf92280 Tom St Denis 2016-10-26  4117  #define mmSCL0_SCL_COEF_RAM_TAP_DATA 0x1B41
de2bdb3dcf92280 Tom St Denis 2016-10-26  4118  #define mmSCL0_SCL_CONTROL 0x1B44
de2bdb3dcf92280 Tom St Denis 2016-10-26  4119  #define mmSCL0_SCL_DEBUG 0x1B6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4120  #define mmSCL0_SCL_DEBUG2 0x1B69
de2bdb3dcf92280 Tom St Denis 2016-10-26  4121  #define mmSCL0_SCL_F_SHARP_CONTROL 0x1B53
de2bdb3dcf92280 Tom St Denis 2016-10-26  4122  #define mmSCL0_SCL_HORZ_FILTER_CONTROL 0x1B4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4123  #define mmSCL0_SCL_HORZ_FILTER_SCALE_RATIO 0x1B4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4124  #define mmSCL0_SCL_MANUAL_REPLICATE_CONTROL 0x1B46
de2bdb3dcf92280 Tom St Denis 2016-10-26  4125  #define mmSCL0_SCL_MODE_CHANGE_DET1 0x1B60
de2bdb3dcf92280 Tom St Denis 2016-10-26  4126  #define mmSCL0_SCL_MODE_CHANGE_DET2 0x1B61
de2bdb3dcf92280 Tom St Denis 2016-10-26  4127  #define mmSCL0_SCL_MODE_CHANGE_DET3 0x1B62
de2bdb3dcf92280 Tom St Denis 2016-10-26  4128  #define mmSCL0_SCL_MODE_CHANGE_MASK 0x1B63
de2bdb3dcf92280 Tom St Denis 2016-10-26  4129  #define mmSCL0_SCL_TAP_CONTROL 0x1B43
de2bdb3dcf92280 Tom St Denis 2016-10-26  4130  #define mmSCL0_SCL_TEST_DEBUG_DATA 0x1B6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4131  #define mmSCL0_SCL_TEST_DEBUG_INDEX 0x1B6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4132  #define mmSCL0_SCL_UPDATE 0x1B51
de2bdb3dcf92280 Tom St Denis 2016-10-26  4133  #define mmSCL0_SCL_VERT_FILTER_CONTROL 0x1B4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4134  #define mmSCL0_SCL_VERT_FILTER_INIT 0x1B50
de2bdb3dcf92280 Tom St Denis 2016-10-26  4135  #define mmSCL0_SCL_VERT_FILTER_INIT_BOT 0x1B57
de2bdb3dcf92280 Tom St Denis 2016-10-26  4136  #define mmSCL0_SCL_VERT_FILTER_SCALE_RATIO 0x1B4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4137  #define mmSCL0_VIEWPORT_SIZE 0x1B5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4138  #define mmSCL0_VIEWPORT_START 0x1B5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4139  #define mmSCL1_EXT_OVERSCAN_LEFT_RIGHT 0x1E5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4140  #define mmSCL1_EXT_OVERSCAN_TOP_BOTTOM 0x1E5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4141  #define mmSCL1_SCL_ALU_CONTROL 0x1E54
de2bdb3dcf92280 Tom St Denis 2016-10-26  4142  #define mmSCL1_SCL_AUTOMATIC_MODE_CONTROL 0x1E47
de2bdb3dcf92280 Tom St Denis 2016-10-26  4143  #define mmSCL1_SCL_BYPASS_CONTROL 0x1E45
de2bdb3dcf92280 Tom St Denis 2016-10-26  4144  #define mmSCL1_SCL_COEF_RAM_CONFLICT_STATUS 0x1E55
de2bdb3dcf92280 Tom St Denis 2016-10-26  4145  #define mmSCL1_SCL_COEF_RAM_SELECT 0x1E40
de2bdb3dcf92280 Tom St Denis 2016-10-26  4146  #define mmSCL1_SCL_COEF_RAM_TAP_DATA 0x1E41
de2bdb3dcf92280 Tom St Denis 2016-10-26  4147  #define mmSCL1_SCL_CONTROL 0x1E44
de2bdb3dcf92280 Tom St Denis 2016-10-26  4148  #define mmSCL1_SCL_DEBUG 0x1E6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4149  #define mmSCL1_SCL_DEBUG2 0x1E69
de2bdb3dcf92280 Tom St Denis 2016-10-26  4150  #define mmSCL1_SCL_F_SHARP_CONTROL 0x1E53
de2bdb3dcf92280 Tom St Denis 2016-10-26  4151  #define mmSCL1_SCL_HORZ_FILTER_CONTROL 0x1E4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4152  #define mmSCL1_SCL_HORZ_FILTER_SCALE_RATIO 0x1E4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4153  #define mmSCL1_SCL_MANUAL_REPLICATE_CONTROL 0x1E46
de2bdb3dcf92280 Tom St Denis 2016-10-26  4154  #define mmSCL1_SCL_MODE_CHANGE_DET1 0x1E60
de2bdb3dcf92280 Tom St Denis 2016-10-26  4155  #define mmSCL1_SCL_MODE_CHANGE_DET2 0x1E61
de2bdb3dcf92280 Tom St Denis 2016-10-26  4156  #define mmSCL1_SCL_MODE_CHANGE_DET3 0x1E62
de2bdb3dcf92280 Tom St Denis 2016-10-26  4157  #define mmSCL1_SCL_MODE_CHANGE_MASK 0x1E63
de2bdb3dcf92280 Tom St Denis 2016-10-26  4158  #define mmSCL1_SCL_TAP_CONTROL 0x1E43
de2bdb3dcf92280 Tom St Denis 2016-10-26  4159  #define mmSCL1_SCL_TEST_DEBUG_DATA 0x1E6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4160  #define mmSCL1_SCL_TEST_DEBUG_INDEX 0x1E6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4161  #define mmSCL1_SCL_UPDATE 0x1E51
de2bdb3dcf92280 Tom St Denis 2016-10-26  4162  #define mmSCL1_SCL_VERT_FILTER_CONTROL 0x1E4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4163  #define mmSCL1_SCL_VERT_FILTER_INIT 0x1E50
de2bdb3dcf92280 Tom St Denis 2016-10-26  4164  #define mmSCL1_SCL_VERT_FILTER_INIT_BOT 0x1E57
de2bdb3dcf92280 Tom St Denis 2016-10-26  4165  #define mmSCL1_SCL_VERT_FILTER_SCALE_RATIO 0x1E4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4166  #define mmSCL1_VIEWPORT_SIZE 0x1E5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4167  #define mmSCL1_VIEWPORT_START 0x1E5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4168  #define mmSCL2_EXT_OVERSCAN_LEFT_RIGHT 0x415E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4169  #define mmSCL2_EXT_OVERSCAN_TOP_BOTTOM 0x415F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4170  #define mmSCL2_SCL_ALU_CONTROL 0x4154
de2bdb3dcf92280 Tom St Denis 2016-10-26  4171  #define mmSCL2_SCL_AUTOMATIC_MODE_CONTROL 0x4147
de2bdb3dcf92280 Tom St Denis 2016-10-26  4172  #define mmSCL2_SCL_BYPASS_CONTROL 0x4145
de2bdb3dcf92280 Tom St Denis 2016-10-26  4173  #define mmSCL2_SCL_COEF_RAM_CONFLICT_STATUS 0x4155
de2bdb3dcf92280 Tom St Denis 2016-10-26  4174  #define mmSCL2_SCL_COEF_RAM_SELECT 0x4140
de2bdb3dcf92280 Tom St Denis 2016-10-26  4175  #define mmSCL2_SCL_COEF_RAM_TAP_DATA 0x4141
de2bdb3dcf92280 Tom St Denis 2016-10-26  4176  #define mmSCL2_SCL_CONTROL 0x4144
de2bdb3dcf92280 Tom St Denis 2016-10-26  4177  #define mmSCL2_SCL_DEBUG 0x416A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4178  #define mmSCL2_SCL_DEBUG2 0x4169
de2bdb3dcf92280 Tom St Denis 2016-10-26  4179  #define mmSCL2_SCL_F_SHARP_CONTROL 0x4153
de2bdb3dcf92280 Tom St Denis 2016-10-26  4180  #define mmSCL2_SCL_HORZ_FILTER_CONTROL 0x414A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4181  #define mmSCL2_SCL_HORZ_FILTER_SCALE_RATIO 0x414B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4182  #define mmSCL2_SCL_MANUAL_REPLICATE_CONTROL 0x4146
de2bdb3dcf92280 Tom St Denis 2016-10-26  4183  #define mmSCL2_SCL_MODE_CHANGE_DET1 0x4160
de2bdb3dcf92280 Tom St Denis 2016-10-26  4184  #define mmSCL2_SCL_MODE_CHANGE_DET2 0x4161
de2bdb3dcf92280 Tom St Denis 2016-10-26  4185  #define mmSCL2_SCL_MODE_CHANGE_DET3 0x4162
de2bdb3dcf92280 Tom St Denis 2016-10-26  4186  #define mmSCL2_SCL_MODE_CHANGE_MASK 0x4163
de2bdb3dcf92280 Tom St Denis 2016-10-26  4187  #define mmSCL2_SCL_TAP_CONTROL 0x4143
de2bdb3dcf92280 Tom St Denis 2016-10-26  4188  #define mmSCL2_SCL_TEST_DEBUG_DATA 0x416C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4189  #define mmSCL2_SCL_TEST_DEBUG_INDEX 0x416B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4190  #define mmSCL2_SCL_UPDATE 0x4151
de2bdb3dcf92280 Tom St Denis 2016-10-26  4191  #define mmSCL2_SCL_VERT_FILTER_CONTROL 0x414E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4192  #define mmSCL2_SCL_VERT_FILTER_INIT 0x4150
de2bdb3dcf92280 Tom St Denis 2016-10-26  4193  #define mmSCL2_SCL_VERT_FILTER_INIT_BOT 0x4157
de2bdb3dcf92280 Tom St Denis 2016-10-26  4194  #define mmSCL2_SCL_VERT_FILTER_SCALE_RATIO 0x414F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4195  #define mmSCL2_VIEWPORT_SIZE 0x415D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4196  #define mmSCL2_VIEWPORT_START 0x415C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4197  #define mmSCL3_EXT_OVERSCAN_LEFT_RIGHT 0x445E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4198  #define mmSCL3_EXT_OVERSCAN_TOP_BOTTOM 0x445F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4199  #define mmSCL3_SCL_ALU_CONTROL 0x4454
de2bdb3dcf92280 Tom St Denis 2016-10-26  4200  #define mmSCL3_SCL_AUTOMATIC_MODE_CONTROL 0x4447
de2bdb3dcf92280 Tom St Denis 2016-10-26  4201  #define mmSCL3_SCL_BYPASS_CONTROL 0x4445
de2bdb3dcf92280 Tom St Denis 2016-10-26  4202  #define mmSCL3_SCL_COEF_RAM_CONFLICT_STATUS 0x4455
de2bdb3dcf92280 Tom St Denis 2016-10-26  4203  #define mmSCL3_SCL_COEF_RAM_SELECT 0x4440
de2bdb3dcf92280 Tom St Denis 2016-10-26  4204  #define mmSCL3_SCL_COEF_RAM_TAP_DATA 0x4441
de2bdb3dcf92280 Tom St Denis 2016-10-26  4205  #define mmSCL3_SCL_CONTROL 0x4444
de2bdb3dcf92280 Tom St Denis 2016-10-26  4206  #define mmSCL3_SCL_DEBUG 0x446A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4207  #define mmSCL3_SCL_DEBUG2 0x4469
de2bdb3dcf92280 Tom St Denis 2016-10-26  4208  #define mmSCL3_SCL_F_SHARP_CONTROL 0x4453
de2bdb3dcf92280 Tom St Denis 2016-10-26  4209  #define mmSCL3_SCL_HORZ_FILTER_CONTROL 0x444A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4210  #define mmSCL3_SCL_HORZ_FILTER_SCALE_RATIO 0x444B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4211  #define mmSCL3_SCL_MANUAL_REPLICATE_CONTROL 0x4446
de2bdb3dcf92280 Tom St Denis 2016-10-26  4212  #define mmSCL3_SCL_MODE_CHANGE_DET1 0x4460
de2bdb3dcf92280 Tom St Denis 2016-10-26  4213  #define mmSCL3_SCL_MODE_CHANGE_DET2 0x4461
de2bdb3dcf92280 Tom St Denis 2016-10-26  4214  #define mmSCL3_SCL_MODE_CHANGE_DET3 0x4462
de2bdb3dcf92280 Tom St Denis 2016-10-26  4215  #define mmSCL3_SCL_MODE_CHANGE_MASK 0x4463
de2bdb3dcf92280 Tom St Denis 2016-10-26  4216  #define mmSCL3_SCL_TAP_CONTROL 0x4443
de2bdb3dcf92280 Tom St Denis 2016-10-26  4217  #define mmSCL3_SCL_TEST_DEBUG_DATA 0x446C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4218  #define mmSCL3_SCL_TEST_DEBUG_INDEX 0x446B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4219  #define mmSCL3_SCL_UPDATE 0x4451
de2bdb3dcf92280 Tom St Denis 2016-10-26  4220  #define mmSCL3_SCL_VERT_FILTER_CONTROL 0x444E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4221  #define mmSCL3_SCL_VERT_FILTER_INIT 0x4450
de2bdb3dcf92280 Tom St Denis 2016-10-26  4222  #define mmSCL3_SCL_VERT_FILTER_INIT_BOT 0x4457
de2bdb3dcf92280 Tom St Denis 2016-10-26  4223  #define mmSCL3_SCL_VERT_FILTER_SCALE_RATIO 0x444F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4224  #define mmSCL3_VIEWPORT_SIZE 0x445D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4225  #define mmSCL3_VIEWPORT_START 0x445C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4226  #define mmSCL4_EXT_OVERSCAN_LEFT_RIGHT 0x475E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4227  #define mmSCL4_EXT_OVERSCAN_TOP_BOTTOM 0x475F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4228  #define mmSCL4_SCL_ALU_CONTROL 0x4754
de2bdb3dcf92280 Tom St Denis 2016-10-26  4229  #define mmSCL4_SCL_AUTOMATIC_MODE_CONTROL 0x4747
de2bdb3dcf92280 Tom St Denis 2016-10-26  4230  #define mmSCL4_SCL_BYPASS_CONTROL 0x4745
de2bdb3dcf92280 Tom St Denis 2016-10-26  4231  #define mmSCL4_SCL_COEF_RAM_CONFLICT_STATUS 0x4755
de2bdb3dcf92280 Tom St Denis 2016-10-26  4232  #define mmSCL4_SCL_COEF_RAM_SELECT 0x4740
de2bdb3dcf92280 Tom St Denis 2016-10-26  4233  #define mmSCL4_SCL_COEF_RAM_TAP_DATA 0x4741
de2bdb3dcf92280 Tom St Denis 2016-10-26  4234  #define mmSCL4_SCL_CONTROL 0x4744
de2bdb3dcf92280 Tom St Denis 2016-10-26  4235  #define mmSCL4_SCL_DEBUG 0x476A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4236  #define mmSCL4_SCL_DEBUG2 0x4769
de2bdb3dcf92280 Tom St Denis 2016-10-26  4237  #define mmSCL4_SCL_F_SHARP_CONTROL 0x4753
de2bdb3dcf92280 Tom St Denis 2016-10-26  4238  #define mmSCL4_SCL_HORZ_FILTER_CONTROL 0x474A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4239  #define mmSCL4_SCL_HORZ_FILTER_SCALE_RATIO 0x474B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4240  #define mmSCL4_SCL_MANUAL_REPLICATE_CONTROL 0x4746
de2bdb3dcf92280 Tom St Denis 2016-10-26  4241  #define mmSCL4_SCL_MODE_CHANGE_DET1 0x4760
de2bdb3dcf92280 Tom St Denis 2016-10-26  4242  #define mmSCL4_SCL_MODE_CHANGE_DET2 0x4761
de2bdb3dcf92280 Tom St Denis 2016-10-26  4243  #define mmSCL4_SCL_MODE_CHANGE_DET3 0x4762
de2bdb3dcf92280 Tom St Denis 2016-10-26  4244  #define mmSCL4_SCL_MODE_CHANGE_MASK 0x4763
de2bdb3dcf92280 Tom St Denis 2016-10-26  4245  #define mmSCL4_SCL_TAP_CONTROL 0x4743
de2bdb3dcf92280 Tom St Denis 2016-10-26  4246  #define mmSCL4_SCL_TEST_DEBUG_DATA 0x476C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4247  #define mmSCL4_SCL_TEST_DEBUG_INDEX 0x476B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4248  #define mmSCL4_SCL_UPDATE 0x4751
de2bdb3dcf92280 Tom St Denis 2016-10-26  4249  #define mmSCL4_SCL_VERT_FILTER_CONTROL 0x474E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4250  #define mmSCL4_SCL_VERT_FILTER_INIT 0x4750
de2bdb3dcf92280 Tom St Denis 2016-10-26  4251  #define mmSCL4_SCL_VERT_FILTER_INIT_BOT 0x4757
de2bdb3dcf92280 Tom St Denis 2016-10-26  4252  #define mmSCL4_SCL_VERT_FILTER_SCALE_RATIO 0x474F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4253  #define mmSCL4_VIEWPORT_SIZE 0x475D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4254  #define mmSCL4_VIEWPORT_START 0x475C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4255  #define mmSCL5_EXT_OVERSCAN_LEFT_RIGHT 0x4A5E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4256  #define mmSCL5_EXT_OVERSCAN_TOP_BOTTOM 0x4A5F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4257  #define mmSCL5_SCL_ALU_CONTROL 0x4A54
de2bdb3dcf92280 Tom St Denis 2016-10-26  4258  #define mmSCL5_SCL_AUTOMATIC_MODE_CONTROL 0x4A47
de2bdb3dcf92280 Tom St Denis 2016-10-26  4259  #define mmSCL5_SCL_BYPASS_CONTROL 0x4A45
de2bdb3dcf92280 Tom St Denis 2016-10-26  4260  #define mmSCL5_SCL_COEF_RAM_CONFLICT_STATUS 0x4A55
de2bdb3dcf92280 Tom St Denis 2016-10-26  4261  #define mmSCL5_SCL_COEF_RAM_SELECT 0x4A40
de2bdb3dcf92280 Tom St Denis 2016-10-26  4262  #define mmSCL5_SCL_COEF_RAM_TAP_DATA 0x4A41
de2bdb3dcf92280 Tom St Denis 2016-10-26  4263  #define mmSCL5_SCL_CONTROL 0x4A44
de2bdb3dcf92280 Tom St Denis 2016-10-26  4264  #define mmSCL5_SCL_DEBUG 0x4A6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4265  #define mmSCL5_SCL_DEBUG2 0x4A69
de2bdb3dcf92280 Tom St Denis 2016-10-26  4266  #define mmSCL5_SCL_F_SHARP_CONTROL 0x4A53
de2bdb3dcf92280 Tom St Denis 2016-10-26  4267  #define mmSCL5_SCL_HORZ_FILTER_CONTROL 0x4A4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4268  #define mmSCL5_SCL_HORZ_FILTER_SCALE_RATIO 0x4A4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4269  #define mmSCL5_SCL_MANUAL_REPLICATE_CONTROL 0x4A46
de2bdb3dcf92280 Tom St Denis 2016-10-26  4270  #define mmSCL5_SCL_MODE_CHANGE_DET1 0x4A60
de2bdb3dcf92280 Tom St Denis 2016-10-26  4271  #define mmSCL5_SCL_MODE_CHANGE_DET2 0x4A61
de2bdb3dcf92280 Tom St Denis 2016-10-26  4272  #define mmSCL5_SCL_MODE_CHANGE_DET3 0x4A62
de2bdb3dcf92280 Tom St Denis 2016-10-26  4273  #define mmSCL5_SCL_MODE_CHANGE_MASK 0x4A63
de2bdb3dcf92280 Tom St Denis 2016-10-26  4274  #define mmSCL5_SCL_TAP_CONTROL 0x4A43
de2bdb3dcf92280 Tom St Denis 2016-10-26  4275  #define mmSCL5_SCL_TEST_DEBUG_DATA 0x4A6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4276  #define mmSCL5_SCL_TEST_DEBUG_INDEX 0x4A6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4277  #define mmSCL5_SCL_UPDATE 0x4A51
de2bdb3dcf92280 Tom St Denis 2016-10-26  4278  #define mmSCL5_SCL_VERT_FILTER_CONTROL 0x4A4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4279  #define mmSCL5_SCL_VERT_FILTER_INIT 0x4A50
de2bdb3dcf92280 Tom St Denis 2016-10-26  4280  #define mmSCL5_SCL_VERT_FILTER_INIT_BOT 0x4A57
de2bdb3dcf92280 Tom St Denis 2016-10-26  4281  #define mmSCL5_SCL_VERT_FILTER_SCALE_RATIO 0x4A4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4282  #define mmSCL5_VIEWPORT_SIZE 0x4A5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4283  #define mmSCL5_VIEWPORT_START 0x4A5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4284  #define mmSCL_ALU_CONTROL 0x1B54
de2bdb3dcf92280 Tom St Denis 2016-10-26  4285  #define mmSCL_AUTOMATIC_MODE_CONTROL 0x1B47
de2bdb3dcf92280 Tom St Denis 2016-10-26  4286  #define mmSCL_BYPASS_CONTROL 0x1B45
de2bdb3dcf92280 Tom St Denis 2016-10-26  4287  #define mmSCL_COEF_RAM_CONFLICT_STATUS 0x1B55
de2bdb3dcf92280 Tom St Denis 2016-10-26  4288  #define mmSCL_COEF_RAM_SELECT 0x1B40
de2bdb3dcf92280 Tom St Denis 2016-10-26  4289  #define mmSCL_COEF_RAM_TAP_DATA 0x1B41
de2bdb3dcf92280 Tom St Denis 2016-10-26  4290  #define mmSCL_CONTROL 0x1B44
de2bdb3dcf92280 Tom St Denis 2016-10-26  4291  #define mmSCL_DEBUG 0x1B6A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4292  #define mmSCL_DEBUG2 0x1B69
de2bdb3dcf92280 Tom St Denis 2016-10-26  4293  #define mmSCL_F_SHARP_CONTROL 0x1B53
de2bdb3dcf92280 Tom St Denis 2016-10-26  4294  #define mmSCL_HORZ_FILTER_CONTROL 0x1B4A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4295  #define mmSCL_HORZ_FILTER_SCALE_RATIO 0x1B4B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4296  #define mmSCLK_CGTT_BLK_CTRL_REG 0x0136
de2bdb3dcf92280 Tom St Denis 2016-10-26  4297  #define mmSCL_MANUAL_REPLICATE_CONTROL 0x1B46
de2bdb3dcf92280 Tom St Denis 2016-10-26  4298  #define mmSCL_MODE_CHANGE_DET1 0x1B60
de2bdb3dcf92280 Tom St Denis 2016-10-26  4299  #define mmSCL_MODE_CHANGE_DET2 0x1B61
de2bdb3dcf92280 Tom St Denis 2016-10-26  4300  #define mmSCL_MODE_CHANGE_DET3 0x1B62
de2bdb3dcf92280 Tom St Denis 2016-10-26  4301  #define mmSCL_MODE_CHANGE_MASK 0x1B63
de2bdb3dcf92280 Tom St Denis 2016-10-26  4302  #define mmSCL_TAP_CONTROL 0x1B43
de2bdb3dcf92280 Tom St Denis 2016-10-26  4303  #define mmSCL_TEST_DEBUG_DATA 0x1B6C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4304  #define mmSCL_TEST_DEBUG_INDEX 0x1B6B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4305  #define mmSCL_UPDATE 0x1B51
de2bdb3dcf92280 Tom St Denis 2016-10-26  4306  #define mmSCL_VERT_FILTER_CONTROL 0x1B4E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4307  #define mmSCL_VERT_FILTER_INIT 0x1B50
de2bdb3dcf92280 Tom St Denis 2016-10-26  4308  #define mmSCL_VERT_FILTER_INIT_BOT 0x1B57
de2bdb3dcf92280 Tom St Denis 2016-10-26  4309  #define mmSCL_VERT_FILTER_SCALE_RATIO 0x1B4F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4310  #define mmSEQ8_DATA 0x00F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4311  #define mmSEQ8_IDX 0x00F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4312  #define mmSLAVE_COMM_CMD_REG 0x1624
de2bdb3dcf92280 Tom St Denis 2016-10-26  4313  #define mmSLAVE_COMM_CNTL_REG 0x1625
de2bdb3dcf92280 Tom St Denis 2016-10-26  4314  #define mmSLAVE_COMM_DATA_REG1 0x1621
de2bdb3dcf92280 Tom St Denis 2016-10-26  4315  #define mmSLAVE_COMM_DATA_REG2 0x1622
de2bdb3dcf92280 Tom St Denis 2016-10-26  4316  #define mmSLAVE_COMM_DATA_REG3 0x1623
de2bdb3dcf92280 Tom St Denis 2016-10-26  4317  #define mmSYMCLKA_CLOCK_ENABLE 0x0160
de2bdb3dcf92280 Tom St Denis 2016-10-26  4318  #define mmSYMCLKB_CLOCK_ENABLE 0x0161
de2bdb3dcf92280 Tom St Denis 2016-10-26  4319  #define mmSYMCLKC_CLOCK_ENABLE 0x0162
de2bdb3dcf92280 Tom St Denis 2016-10-26  4320  #define mmSYMCLKD_CLOCK_ENABLE 0x0163
de2bdb3dcf92280 Tom St Denis 2016-10-26  4321  #define mmSYMCLKE_CLOCK_ENABLE 0x0164
de2bdb3dcf92280 Tom St Denis 2016-10-26  4322  #define mmSYMCLKF_CLOCK_ENABLE 0x0165
de2bdb3dcf92280 Tom St Denis 2016-10-26  4323  #define mmTMDS_CNTL 0x1C7C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4324  #define mmTMDS_CONTROL0_FEEDBACK 0x1C7E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4325  #define mmTMDS_CONTROL_CHAR 0x1C7D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4326  #define mmTMDS_CTL0_1_GEN_CNTL 0x1C86
de2bdb3dcf92280 Tom St Denis 2016-10-26  4327  #define mmTMDS_CTL2_3_GEN_CNTL 0x1C87
de2bdb3dcf92280 Tom St Denis 2016-10-26  4328  #define mmTMDS_CTL_BITS 0x1C83
de2bdb3dcf92280 Tom St Denis 2016-10-26  4329  #define mmTMDS_DCBALANCER_CONTROL 0x1C84
de2bdb3dcf92280 Tom St Denis 2016-10-26  4330  #define mmTMDS_DEBUG 0x1C82
de2bdb3dcf92280 Tom St Denis 2016-10-26  4331  #define mmTMDS_STEREOSYNC_CTL_SEL 0x1C7F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4332  #define mmTMDS_SYNC_CHAR_PATTERN_0_1 0x1C80
de2bdb3dcf92280 Tom St Denis 2016-10-26  4333  #define mmTMDS_SYNC_CHAR_PATTERN_2_3 0x1C81
de2bdb3dcf92280 Tom St Denis 2016-10-26  4334  #define mmUNIPHYAB_TPG_CONTROL 0x1931
de2bdb3dcf92280 Tom St Denis 2016-10-26  4335  #define mmUNIPHYAB_TPG_SEED 0x1932
de2bdb3dcf92280 Tom St Denis 2016-10-26  4336  #define mmUNIPHY_ANG_BIST_CNTL 0x198C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4337  #define mmUNIPHYCD_TPG_CONTROL 0x1933
de2bdb3dcf92280 Tom St Denis 2016-10-26  4338  #define mmUNIPHYCD_TPG_SEED 0x1934
de2bdb3dcf92280 Tom St Denis 2016-10-26  4339  #define mmUNIPHY_CHANNEL_XBAR_CNTL 0x198E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4340  #define mmUNIPHY_DATA_SYNCHRONIZATION 0x198A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4341  #define mmUNIPHYEF_TPG_CONTROL 0x1935
de2bdb3dcf92280 Tom St Denis 2016-10-26  4342  #define mmUNIPHYEF_TPG_SEED 0x1936
de2bdb3dcf92280 Tom St Denis 2016-10-26  4343  #define mmUNIPHY_IMPCAL_LINKA 0x1908
de2bdb3dcf92280 Tom St Denis 2016-10-26  4344  #define mmUNIPHY_IMPCAL_LINKB 0x1909
de2bdb3dcf92280 Tom St Denis 2016-10-26  4345  #define mmUNIPHY_IMPCAL_LINKC 0x190F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4346  #define mmUNIPHY_IMPCAL_LINKD 0x1910
de2bdb3dcf92280 Tom St Denis 2016-10-26  4347  #define mmUNIPHY_IMPCAL_LINKE 0x1913
de2bdb3dcf92280 Tom St Denis 2016-10-26  4348  #define mmUNIPHY_IMPCAL_LINKF 0x1914
de2bdb3dcf92280 Tom St Denis 2016-10-26  4349  #define mmUNIPHY_IMPCAL_PERIOD 0x190A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4350  #define mmUNIPHY_IMPCAL_PSW_AB 0x190E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4351  #define mmUNIPHY_IMPCAL_PSW_CD 0x1912
de2bdb3dcf92280 Tom St Denis 2016-10-26  4352  #define mmUNIPHY_IMPCAL_PSW_EF 0x1916
de2bdb3dcf92280 Tom St Denis 2016-10-26  4353  #define mmUNIPHY_LINK_CNTL 0x198D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4354  #define mmUNIPHY_PLL_CONTROL1 0x1986
de2bdb3dcf92280 Tom St Denis 2016-10-26  4355  #define mmUNIPHY_PLL_CONTROL2 0x1987
de2bdb3dcf92280 Tom St Denis 2016-10-26  4356  #define mmUNIPHY_PLL_FBDIV 0x1985
de2bdb3dcf92280 Tom St Denis 2016-10-26  4357  #define mmUNIPHY_PLL_SS_CNTL 0x1989
de2bdb3dcf92280 Tom St Denis 2016-10-26  4358  #define mmUNIPHY_PLL_SS_STEP_SIZE 0x1988
de2bdb3dcf92280 Tom St Denis 2016-10-26  4359  #define mmUNIPHY_POWER_CONTROL 0x1984
de2bdb3dcf92280 Tom St Denis 2016-10-26  4360  #define mmUNIPHY_REG_TEST_OUTPUT 0x198B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4361  #define mmUNIPHY_SOFT_RESET 0x0166
de2bdb3dcf92280 Tom St Denis 2016-10-26  4362  #define mmUNIPHY_TX_CONTROL1 0x1980
de2bdb3dcf92280 Tom St Denis 2016-10-26  4363  #define mmUNIPHY_TX_CONTROL2 0x1981
de2bdb3dcf92280 Tom St Denis 2016-10-26  4364  #define mmUNIPHY_TX_CONTROL3 0x1982
de2bdb3dcf92280 Tom St Denis 2016-10-26  4365  #define mmUNIPHY_TX_CONTROL4 0x1983
de2bdb3dcf92280 Tom St Denis 2016-10-26  4366  #define mmVGA25_PPLL_ANALOG 0x00E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4367  #define mmVGA25_PPLL_FB_DIV 0x00DC
de2bdb3dcf92280 Tom St Denis 2016-10-26  4368  #define mmVGA25_PPLL_POST_DIV 0x00E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4369  #define mmVGA25_PPLL_REF_DIV 0x00D8
de2bdb3dcf92280 Tom St Denis 2016-10-26  4370  #define mmVGA28_PPLL_ANALOG 0x00E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4371  #define mmVGA28_PPLL_FB_DIV 0x00DD
de2bdb3dcf92280 Tom St Denis 2016-10-26  4372  #define mmVGA28_PPLL_POST_DIV 0x00E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4373  #define mmVGA28_PPLL_REF_DIV 0x00D9
de2bdb3dcf92280 Tom St Denis 2016-10-26  4374  #define mmVGA41_PPLL_ANALOG 0x00E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4375  #define mmVGA41_PPLL_FB_DIV 0x00DE
de2bdb3dcf92280 Tom St Denis 2016-10-26  4376  #define mmVGA41_PPLL_POST_DIV 0x00E2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4377  #define mmVGA41_PPLL_REF_DIV 0x00DA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4378  #define mmVGA_CACHE_CONTROL 0x00CB
de2bdb3dcf92280 Tom St Denis 2016-10-26  4379  #define mmVGA_DEBUG_READBACK_DATA 0x00D7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4380  #define mmVGA_DEBUG_READBACK_INDEX 0x00D6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4381  #define mmVGA_DISPBUF1_SURFACE_ADDR 0x00C6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4382  #define mmVGA_DISPBUF2_SURFACE_ADDR 0x00C8
de2bdb3dcf92280 Tom St Denis 2016-10-26  4383  #define mmVGA_HDP_CONTROL 0x00CA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4384  #define mmVGA_HW_DEBUG 0x00CF
de2bdb3dcf92280 Tom St Denis 2016-10-26  4385  #define mmVGA_INTERRUPT_CONTROL 0x00D1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4386  #define mmVGA_INTERRUPT_STATUS 0x00D3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4387  #define mmVGA_MAIN_CONTROL 0x00D4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4388  #define mmVGA_MEMORY_BASE_ADDRESS 0x00C4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4389  #define mmVGA_MEMORY_BASE_ADDRESS_HIGH 0x00C9
de2bdb3dcf92280 Tom St Denis 2016-10-26  4390  #define mmVGA_MEM_READ_PAGE_ADDR 0x0013
de2bdb3dcf92280 Tom St Denis 2016-10-26  4391  #define mmVGA_MEM_WRITE_PAGE_ADDR 0x0012
de2bdb3dcf92280 Tom St Denis 2016-10-26  4392  #define mmVGA_MODE_CONTROL 0x00C2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4393  #define mmVGA_RENDER_CONTROL 0x00C0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4394  #define mmVGA_SEQUENCER_RESET_CONTROL 0x00C1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4395  #define mmVGA_SOURCE_SELECT 0x00FC
de2bdb3dcf92280 Tom St Denis 2016-10-26  4396  #define mmVGA_STATUS 0x00D0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4397  #define mmVGA_STATUS_CLEAR 0x00D2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4398  #define mmVGA_SURFACE_PITCH_SELECT 0x00C3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4399  #define mmVGA_TEST_CONTROL 0x00D5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4400  #define mmVGA_TEST_DEBUG_DATA 0x00C7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4401  #define mmVGA_TEST_DEBUG_INDEX 0x00C5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4402  #define mmVIEWPORT_SIZE 0x1B5D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4403  #define mmVIEWPORT_START 0x1B5C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4404  #define mmXDMA_CLOCK_GATING_CNTL 0x0409
de2bdb3dcf92280 Tom St Denis 2016-10-26  4405  #define mmXDMA_IF_BIF_STATUS 0x0418
de2bdb3dcf92280 Tom St Denis 2016-10-26  4406  #define mmXDMA_INTERRUPT 0x0406
de2bdb3dcf92280 Tom St Denis 2016-10-26  4407  #define mmXDMA_LOCAL_SURFACE_TILING1 0x03F4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4408  #define mmXDMA_LOCAL_SURFACE_TILING2 0x03F5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4409  #define mmXDMA_MC_PCIE_CLIENT_CONFIG 0x03E9
de2bdb3dcf92280 Tom St Denis 2016-10-26  4410  #define mmXDMA_MEM_POWER_CNTL 0x040B
de2bdb3dcf92280 Tom St Denis 2016-10-26  4411  #define mmXDMA_MSTR_CMD_URGENT_CNTL 0x03F6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4412  #define mmXDMA_MSTR_CNTL 0x03E0
de2bdb3dcf92280 Tom St Denis 2016-10-26  4413  #define mmXDMA_MSTR_HEIGHT 0x03E3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4414  #define mmXDMA_MSTR_LOCAL_SURFACE_BASE_ADDR 0x03F1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4415  #define mmXDMA_MSTR_LOCAL_SURFACE_BASE_ADDR_HIGH 0x03F2
de2bdb3dcf92280 Tom St Denis 2016-10-26  4416  #define mmXDMA_MSTR_LOCAL_SURFACE_PITCH 0x03F3
de2bdb3dcf92280 Tom St Denis 2016-10-26  4417  #define mmXDMA_MSTR_MEM_CLIENT_CONFIG 0x03EA
de2bdb3dcf92280 Tom St Denis 2016-10-26  4418  #define mmXDMA_MSTR_MEM_NACK_STATUS 0x040D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4419  #define mmXDMA_MSTR_MEM_URGENT_CNTL 0x03F7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4420  #define mmXDMA_MSTR_PCIE_NACK_STATUS 0x040C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4421  #define mmXDMA_MSTR_READ_COMMAND 0x03E1
de2bdb3dcf92280 Tom St Denis 2016-10-26  4422  #define mmXDMA_MSTR_REMOTE_GPU_ADDRESS 0x03E6
de2bdb3dcf92280 Tom St Denis 2016-10-26  4423  #define mmXDMA_MSTR_REMOTE_GPU_ADDRESS_HIGH 0x03E7
de2bdb3dcf92280 Tom St Denis 2016-10-26  4424  #define mmXDMA_MSTR_REMOTE_SURFACE_BASE 0x03E4
de2bdb3dcf92280 Tom St Denis 2016-10-26  4425  #define mmXDMA_MSTR_REMOTE_SURFACE_BASE_HIGH 0x03E5
de2bdb3dcf92280 Tom St Denis 2016-10-26  4426  #define mmXDMA_MSTR_STATUS 0x03E8
de2bdb3dcf92280 Tom St Denis 2016-10-26  4427  #define mmXDMA_RBBMIF_RDWR_CNTL 0x040A
de2bdb3dcf92280 Tom St Denis 2016-10-26  4428  #define mmXDMA_SLV_CNTL 0x03FB
de2bdb3dcf92280 Tom St Denis 2016-10-26  4429  #define mmXDMA_SLV_FLIP_PENDING 0x0407
de2bdb3dcf92280 Tom St Denis 2016-10-26  4430  #define mmXDMA_SLV_MEM_CLIENT_CONFIG 0x03FD
de2bdb3dcf92280 Tom St Denis 2016-10-26  4431  #define mmXDMA_SLV_MEM_NACK_STATUS 0x040F
de2bdb3dcf92280 Tom St Denis 2016-10-26  4432  #define mmXDMA_SLV_PCIE_NACK_STATUS 0x040E
de2bdb3dcf92280 Tom St Denis 2016-10-26  4433  #define mmXDMA_SLV_READ_LATENCY_AVE 0x0405
de2bdb3dcf92280 Tom St Denis 2016-10-26  4434  #define mmXDMA_SLV_READ_LATENCY_MINMAX 0x0404
de2bdb3dcf92280 Tom St Denis 2016-10-26  4435  #define mmXDMA_SLV_READ_LATENCY_TIMER 0x0412
de2bdb3dcf92280 Tom St Denis 2016-10-26  4436  #define mmXDMA_SLV_READ_URGENT_CNTL 0x03FF
de2bdb3dcf92280 Tom St Denis 2016-10-26  4437  #define mmXDMA_SLV_REMOTE_GPU_ADDRESS 0x0402
de2bdb3dcf92280 Tom St Denis 2016-10-26  4438  #define mmXDMA_SLV_REMOTE_GPU_ADDRESS_HIGH 0x0403
de2bdb3dcf92280 Tom St Denis 2016-10-26  4439  #define mmXDMA_SLV_SLS_PITCH 0x03FE
de2bdb3dcf92280 Tom St Denis 2016-10-26  4440  #define mmXDMA_SLV_WB_RATE_CNTL 0x0401
de2bdb3dcf92280 Tom St Denis 2016-10-26  4441  #define mmXDMA_SLV_WRITE_URGENT_CNTL 0x0400
de2bdb3dcf92280 Tom St Denis 2016-10-26  4442  #define mmXDMA_TEST_DEBUG_DATA 0x041D
de2bdb3dcf92280 Tom St Denis 2016-10-26  4443  #define mmXDMA_TEST_DEBUG_INDEX 0x041C
de2bdb3dcf92280 Tom St Denis 2016-10-26  4444  

:::::: The code at line 568 was first introduced by commit
:::::: de2bdb3dcf9228030b4e0a2d83f3d6b6bedc6c33 drm/amd/amdgpu: Introduction of SI registers (v2)

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--7JfCtLOvnd9MIVvH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--7JfCtLOvnd9MIVvH--
