Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01742BC265
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 23:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5A389E63;
	Sat, 21 Nov 2020 22:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BF689E63
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 22:20:45 +0000 (UTC)
IronPort-SDR: C1YsKBBL+5wEvM3/Ne1mZdMtxXzRJr6FGeDYwR3rW7jeld5kBnZLlwYW0792WaIffIakWG+asB
 Eje/imXW1i9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9812"; a="169046705"
X-IronPort-AV: E=Sophos;i="5.78,360,1599548400"; 
 d="gz'50?scan'50,208,50";a="169046705"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2020 14:20:44 -0800
IronPort-SDR: xXOqQ/0cWAYLrlUUTJ6yuHGqbCbrYR7CNuEdGGqXxRE6c5eGkPBf2hNsotB1lBoFR5ql8jU0OL
 hCT7g4Dlp+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,360,1599548400"; 
 d="gz'50?scan'50,208,50";a="545917056"
Received: from lkp-server01.sh.intel.com (HELO 00bc34107a07) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 21 Nov 2020 14:20:42 -0800
Received: from kbuild by 00bc34107a07 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kgbFJ-0000RV-8n; Sat, 21 Nov 2020 22:20:41 +0000
Date: Sun, 22 Nov 2020 06:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-20.45 1379/2417]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:164:2: error:
 expected specifier-qualifier-list before
 'DCN21_HUBP_REG_COMMON_VARIABLE_LIST'
Message-ID: <202011220627.iskIRRja-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
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
Cc: Yang Xiong <Yang.Xiong@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   1807abbb3a7f17fc931a15d7fd4365ea148c6bb1
commit: 470f4be73099cc46478d2c708411fecde8197ca3 [1379/2417] drm/amdkcl: update DRM_AMD_DC_DCN3_0 to depends on legacy display config
config: i386-randconfig-a003-20201120 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-20.45
        git checkout 470f4be73099cc46478d2c708411fecde8197ca3
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:42:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:164:2: error: expected specifier-qualifier-list before 'DCN21_HUBP_REG_COMMON_VARIABLE_LIST'
     164 |  DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:164:2: note: in definition of macro 'DCN30_HUBP_REG_COMMON_VARIABLE_LIST'
     164 |  DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: error: expected specifier-qualifier-list before 'DCN21_HUBP_REG_FIELD_VARIABLE_LIST'
     207 |  DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: note: in definition of macro 'DCN30_HUBP_REG_FIELD_VARIABLE_LIST'
     207 |  DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: error: expected specifier-qualifier-list before 'DCN21_HUBP_REG_FIELD_VARIABLE_LIST'
     207 |  DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:207:2: note: in definition of macro 'DCN30_HUBP_REG_FIELD_VARIABLE_LIST'
     207 |  DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: initialized field overwritten [-Woverride-init]
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:202:2: note: in expansion of macro 'SRI'
     202 |  SRI(TMDS_CTL_BITS, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:235:2: note: in expansion of macro 'DPCS_DCN2_CMN_REG_LIST'
     235 |  DPCS_DCN2_CMN_REG_LIST(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:678:2: note: in expansion of macro 'DPCS_DCN2_REG_LIST'
     678 |  DPCS_DCN2_REG_LIST(id), \
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:683:2: note: in expansion of macro 'link_regs'
     683 |  link_regs(0, A),
         |  ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'link_enc_regs[0].TMDS_CTL_BITS')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:202:2: note: in expansion of macro 'SRI'
     202 |  SRI(TMDS_CTL_BITS, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:235:2: note: in expansion of macro 'DPCS_DCN2_CMN_REG_LIST'
     235 |  DPCS_DCN2_CMN_REG_LIST(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:678:2: note: in expansion of macro 'DPCS_DCN2_REG_LIST'
     678 |  DPCS_DCN2_REG_LIST(id), \
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:683:2: note: in expansion of macro 'link_regs'
     683 |  link_regs(0, A),
         |  ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: initialized field overwritten [-Woverride-init]
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:679:2: note: in expansion of macro 'SRI'
     679 |  SRI(DP_DPHY_INTERNAL_CTRL, DP, id) \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:683:2: note: in expansion of macro 'link_regs'
     683 |  link_regs(0, A),
         |  ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'link_enc_regs[0].DP_DPHY_INTERNAL_CTRL')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:679:2: note: in expansion of macro 'SRI'
     679 |  SRI(DP_DPHY_INTERNAL_CTRL, DP, id) \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:683:2: note: in expansion of macro 'link_regs'
     683 |  link_regs(0, A),
         |  ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: initialized field overwritten [-Woverride-init]
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
--
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:48:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN'
      48 |  TG_COMMON_MASK_SH_LIST_DCN(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:873:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     873 |  TG_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31037:111: note: (near initialization for 'tg_shift.OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP')
   31037 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP__SHIFT                                  0x12
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31037:111: note: in definition of macro 'OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP__SHIFT'
   31037 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP__SHIFT                                  0x12
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_optc.h:224:2: note: in expansion of macro 'SF'
     224 |  SF(OTG0_OTG_STEREO_CONTROL, OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:48:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN'
      48 |  TG_COMMON_MASK_SH_LIST_DCN(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:873:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     873 |  TG_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31110:111: warning: initialized field overwritten [-Woverride-init]
   31110 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT                              0x18
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31110:111: note: in definition of macro 'OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT'
   31110 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT                              0x18
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:54:2: note: in expansion of macro 'SF'
      54 |  SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_RANGE_TIMING_DBUF_UPDATE_MODE, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:873:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     873 |  TG_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31110:111: note: (near initialization for 'tg_shift.OTG_RANGE_TIMING_DBUF_UPDATE_MODE')
   31110 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT                              0x18
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31110:111: note: in definition of macro 'OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT'
   31110 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE__SHIFT                              0x18
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:54:2: note: in expansion of macro 'SF'
      54 |  SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_RANGE_TIMING_DBUF_UPDATE_MODE, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:873:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     873 |  TG_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31044:111: warning: initialized field overwritten [-Woverride-init]
   31044 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK                                    0x00040000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31044:111: note: in definition of macro 'OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK'
   31044 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK                                    0x00040000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_optc.h:224:2: note: in expansion of macro 'SF'
     224 |  SF(OTG0_OTG_STEREO_CONTROL, OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:48:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN'
      48 |  TG_COMMON_MASK_SH_LIST_DCN(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:877:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     877 |  TG_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31044:111: note: (near initialization for 'tg_mask.OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP')
   31044 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK                                    0x00040000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31044:111: note: in definition of macro 'OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK'
   31044 | #define OTG0_OTG_STEREO_CONTROL__OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP_MASK                                    0x00040000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/../dcn10/dcn10_optc.h:224:2: note: in expansion of macro 'SF'
     224 |  SF(OTG0_OTG_STEREO_CONTROL, OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:48:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN'
      48 |  TG_COMMON_MASK_SH_LIST_DCN(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:877:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     877 |  TG_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31122:111: warning: initialized field overwritten [-Woverride-init]
   31122 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK                                0x03000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31122:111: note: in definition of macro 'OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK'
   31122 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK                                0x03000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:54:2: note: in expansion of macro 'SF'
      54 |  SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_RANGE_TIMING_DBUF_UPDATE_MODE, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:877:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     877 |  TG_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31122:111: note: (near initialization for 'tg_mask.OTG_RANGE_TIMING_DBUF_UPDATE_MODE')
   31122 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK                                0x03000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h:31122:111: note: in definition of macro 'OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK'
   31122 | #define OTG0_OTG_DOUBLE_BUFFER_CONTROL__OTG_RANGE_TIMING_DBUF_UPDATE_MODE_MASK                                0x03000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_optc.h:54:2: note: in expansion of macro 'SF'
      54 |  SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_RANGE_TIMING_DBUF_UPDATE_MODE, mask_sh),\
         |  ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:877:2: note: in expansion of macro 'TG_COMMON_MASK_SH_LIST_DCN2_0'
     877 |  TG_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:35:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCHUBP_CNTL'
      35 |  SRI(DCHUBP_CNTL, HUBP, id),\
         |      ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:35:2: note: in expansion of macro 'SRI'
      35 |  SRI(DCHUBP_CNTL, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:35:2: note: in expansion of macro 'SRI'
      35 |  SRI(DCHUBP_CNTL, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:36:6: error: 'const struct dcn_hubp2_registers' has no member named 'HUBPREQ_DEBUG_DB'
      36 |  SRI(HUBPREQ_DEBUG_DB, HUBP, id),\
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:36:2: note: in expansion of macro 'SRI'
      36 |  SRI(HUBPREQ_DEBUG_DB, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:36:2: note: in expansion of macro 'SRI'
      36 |  SRI(HUBPREQ_DEBUG_DB, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:37:6: error: 'const struct dcn_hubp2_registers' has no member named 'HUBPREQ_DEBUG'
      37 |  SRI(HUBPREQ_DEBUG, HUBP, id),\
         |      ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:37:2: note: in expansion of macro 'SRI'
      37 |  SRI(HUBPREQ_DEBUG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:37:2: note: in expansion of macro 'SRI'
      37 |  SRI(HUBPREQ_DEBUG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:38:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_ADDR_CONFIG'
      38 |  SRI(DCSURF_ADDR_CONFIG, HUBP, id),\
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:38:2: note: in expansion of macro 'SRI'
      38 |  SRI(DCSURF_ADDR_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:38:2: note: in expansion of macro 'SRI'
      38 |  SRI(DCSURF_ADDR_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:39:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_TILING_CONFIG'
      39 |  SRI(DCSURF_TILING_CONFIG, HUBP, id),\
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:39:2: note: in expansion of macro 'SRI'
      39 |  SRI(DCSURF_TILING_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:39:2: note: in expansion of macro 'SRI'
      39 |  SRI(DCSURF_TILING_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:40:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_SURFACE_PITCH'
      40 |  SRI(DCSURF_SURFACE_PITCH, HUBPREQ, id),\
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:40:2: note: in expansion of macro 'SRI'
      40 |  SRI(DCSURF_SURFACE_PITCH, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:40:2: note: in expansion of macro 'SRI'
      40 |  SRI(DCSURF_SURFACE_PITCH, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:41:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_SURFACE_PITCH_C'
      41 |  SRI(DCSURF_SURFACE_PITCH_C, HUBPREQ, id),\
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:41:2: note: in expansion of macro 'SRI'
      41 |  SRI(DCSURF_SURFACE_PITCH_C, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:41:2: note: in expansion of macro 'SRI'
      41 |  SRI(DCSURF_SURFACE_PITCH_C, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:42:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_SURFACE_CONFIG'
      42 |  SRI(DCSURF_SURFACE_CONFIG, HUBP, id),\
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
>> drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(DCSURF_SURFACE_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(DCSURF_SURFACE_CONFIG, HUBP, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
>> drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:43:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_FLIP_CONTROL'
      43 |  SRI(DCSURF_FLIP_CONTROL, HUBPREQ, id),\
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:43:2: note: in expansion of macro 'SRI'
      43 |  SRI(DCSURF_FLIP_CONTROL, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: note: (near initialization for 'hubp_regs[0]')
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:14: note: in expansion of macro 'BASE'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:43:2: note: in expansion of macro 'SRI'
      43 |  SRI(DCSURF_FLIP_CONTROL, HUBPREQ, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h:44:6: error: 'const struct dcn_hubp2_registers' has no member named 'DCSURF_PRI_VIEWPORT_DIMENSION'
      44 |  SRI(DCSURF_PRI_VIEWPORT_DIMENSION, HUBP, id), \
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:503:3: note: in definition of macro 'SRI'
     503 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:35:2: note: in expansion of macro 'HUBP_REG_LIST_DCN'
      35 |  HUBP_REG_LIST_DCN(id),\
         |  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h:65:2: note: in expansion of macro 'HUBP_REG_LIST_DCN2_COMMON'
      65 |  HUBP_REG_LIST_DCN2_COMMON(id),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:882:2: note: in expansion of macro 'HUBP_REG_LIST_DCN20'
     882 |  HUBP_REG_LIST_DCN20(id)\
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:886:3: note: in expansion of macro 'hubp_regs'
     886 |   hubp_regs(0),
         |   ^~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:68:
   drivers/gpu/drm/amd/include/navi10_ip_offset.h:269:52: warning: excess elements in struct initializer
     269 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:494:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     494 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:496:19: note: in expansion of macro 'BASE_INNER'
     496 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
..

vim +/DCN21_HUBP_REG_COMMON_VARIABLE_LIST +164 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hubp.h

bbeb64d0eb78f4 Harry Wentland    2019-05-07   30  
bbeb64d0eb78f4 Harry Wentland    2019-05-07   31  #define TO_DCN20_HUBP(hubp)\
bbeb64d0eb78f4 Harry Wentland    2019-05-07   32  	container_of(hubp, struct dcn20_hubp, base)
bbeb64d0eb78f4 Harry Wentland    2019-05-07   33  
0213541d4b6b24 Yongqiang Sun     2019-03-28   34  #define HUBP_REG_LIST_DCN2_COMMON(id)\
bbeb64d0eb78f4 Harry Wentland    2019-05-07   35  	HUBP_REG_LIST_DCN(id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07   36  	HUBP_REG_LIST_DCN_VM(id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @37  	SRI(PREFETCH_SETTINGS, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @38  	SRI(PREFETCH_SETTINGS_C, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @39  	SRI(DCN_VM_SYSTEM_APERTURE_LOW_ADDR, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @40  	SRI(DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @41  	SRI(CURSOR_SETTINGS, HUBPREQ, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @42  	SRI(CURSOR_SURFACE_ADDRESS_HIGH, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @43  	SRI(CURSOR_SURFACE_ADDRESS, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @44  	SRI(CURSOR_SIZE, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @45  	SRI(CURSOR_CONTROL, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @46  	SRI(CURSOR_POSITION, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @47  	SRI(CURSOR_HOT_SPOT, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @48  	SRI(CURSOR_DST_OFFSET, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @49  	SRI(DMDATA_ADDRESS_HIGH, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @50  	SRI(DMDATA_ADDRESS_LOW, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @51  	SRI(DMDATA_CNTL, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @52  	SRI(DMDATA_SW_CNTL, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @53  	SRI(DMDATA_QOS_CNTL, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @54  	SRI(DMDATA_SW_DATA, CURSOR0_, id), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @55  	SRI(DMDATA_STATUS, CURSOR0_, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @56  	SRI(FLIP_PARAMETERS_0, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @57  	SRI(FLIP_PARAMETERS_1, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @58  	SRI(FLIP_PARAMETERS_2, HUBPREQ, id),\
4850ce697f9892 Charlene Liu      2019-05-07  @59  	SRI(DCN_CUR1_TTU_CNTL0, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @60  	SRI(DCN_CUR1_TTU_CNTL1, HUBPREQ, id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @61  	SRI(DCSURF_FLIP_CONTROL2, HUBPREQ, id), \
0213541d4b6b24 Yongqiang Sun     2019-03-28  @62  	SRI(VMID_SETTINGS_0, HUBPREQ, id)
0213541d4b6b24 Yongqiang Sun     2019-03-28   63  
0213541d4b6b24 Yongqiang Sun     2019-03-28   64  #define HUBP_REG_LIST_DCN20(id)\
0213541d4b6b24 Yongqiang Sun     2019-03-28   65  	HUBP_REG_LIST_DCN2_COMMON(id),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @66  	SR(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @67  	SR(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB)
bbeb64d0eb78f4 Harry Wentland    2019-05-07   68  
c70b4016306a10 Charlene Liu      2019-06-05   69  #define HUBP_MASK_SH_LIST_DCN2_SHARE_COMMON(mask_sh)\
c70b4016306a10 Charlene Liu      2019-06-05   70  	HUBP_MASK_SH_LIST_DCN_SHARE_COMMON(mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07   71  	HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @72  	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ROTATION_ANGLE, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @73  	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, H_MIRROR_EN, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @74  	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, DST_Y_PREFETCH, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @75  	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, VRATIO_PREFETCH, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @76  	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS_C, VRATIO_PREFETCH_C, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @77  	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_LOW_ADDR, MC_VM_SYSTEM_APERTURE_LOW_ADDR, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @78  	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @79  	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_DST_Y_OFFSET, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @80  	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_CHUNK_HDL_ADJUST, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @81  	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS_HIGH, CURSOR_SURFACE_ADDRESS_HIGH, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @82  	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS, CURSOR_SURFACE_ADDRESS, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @83  	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_WIDTH, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @84  	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_HEIGHT, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @85  	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_MODE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @86  	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_2X_MAGNIFY, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @87  	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_PITCH, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @88  	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_LINES_PER_CHUNK, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @89  	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_ENABLE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @90  	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_X_POSITION, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @91  	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_Y_POSITION, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @92  	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_X, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @93  	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_Y, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @94  	HUBP_SF(CURSOR0_0_CURSOR_DST_OFFSET, CURSOR_DST_X_OFFSET, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @95  	HUBP_SF(CURSOR0_0_DMDATA_ADDRESS_HIGH, DMDATA_ADDRESS_HIGH, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @96  	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_MODE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @97  	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_UPDATED, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @98  	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_REPEAT, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  @99  	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_SIZE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @100  	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_UPDATED, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @101  	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_REPEAT, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @102  	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_SIZE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @103  	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_MODE, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @104  	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_LEVEL, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @105  	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_DL_DELTA, mask_sh), \
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @106  	HUBP_SF(CURSOR0_0_DMDATA_STATUS, DMDATA_DONE, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @107  	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_VM_FLIP, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @108  	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_ROW_FLIP, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @109  	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_1, REFCYC_PER_PTE_GROUP_FLIP_L, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @110  	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_2, REFCYC_PER_META_CHUNK_FLIP_L, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @111  	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @112  	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_DISABLE_STOP_DATA_DURING_VM, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @113  	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, HUBPREQ_MASTER_UPDATE_LOCK_STATUS, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @114  	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_GSL_ENABLE, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @115  	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_TRIPLE_BUFFER_ENABLE, mask_sh),\
0213541d4b6b24 Yongqiang Sun     2019-03-28 @116  	HUBP_SF(HUBPREQ0_VMID_SETTINGS_0, VMID, mask_sh)
0213541d4b6b24 Yongqiang Sun     2019-03-28  117  
c70b4016306a10 Charlene Liu      2019-06-05  118  /*DCN2.x and DCN1.x*/
c70b4016306a10 Charlene Liu      2019-06-05  119  #define HUBP_MASK_SH_LIST_DCN2_COMMON(mask_sh)\
c70b4016306a10 Charlene Liu      2019-06-05  120  	HUBP_MASK_SH_LIST_DCN2_SHARE_COMMON(mask_sh),\
c70b4016306a10 Charlene Liu      2019-06-05 @121  	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, RB_ALIGNED, mask_sh),\
c70b4016306a10 Charlene Liu      2019-06-05 @122  	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, MPTE_GROUP_SIZE, mask_sh),\
c70b4016306a10 Charlene Liu      2019-06-05 @123  	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, MPTE_GROUP_SIZE_C, mask_sh)
c70b4016306a10 Charlene Liu      2019-06-05  124  
c70b4016306a10 Charlene Liu      2019-06-05  125  /*DCN2.0 specific*/
0213541d4b6b24 Yongqiang Sun     2019-03-28  126  #define HUBP_MASK_SH_LIST_DCN20(mask_sh)\
0213541d4b6b24 Yongqiang Sun     2019-03-28  127  	HUBP_MASK_SH_LIST_DCN2_COMMON(mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @128  	HUBP_SF(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB, DCN_VM_SYSTEM_APERTURE_DEFAULT_SYSTEM, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @129  	HUBP_SF(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB, DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB, mask_sh),\
bbeb64d0eb78f4 Harry Wentland    2019-05-07 @130  	HUBP_SF(DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB, DCN_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB, mask_sh)
bbeb64d0eb78f4 Harry Wentland    2019-05-07  131  
c70b4016306a10 Charlene Liu      2019-06-05  132  /*DCN2.x */
bbeb64d0eb78f4 Harry Wentland    2019-05-07  133  #define DCN2_HUBP_REG_COMMON_VARIABLE_LIST \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  134  	HUBP_COMMON_REG_VARIABLE_LIST; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  135  	uint32_t DMDATA_ADDRESS_HIGH; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  136  	uint32_t DMDATA_ADDRESS_LOW; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  137  	uint32_t DMDATA_CNTL; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  138  	uint32_t DMDATA_SW_CNTL; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  139  	uint32_t DMDATA_QOS_CNTL; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  140  	uint32_t DMDATA_SW_DATA; \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  141  	uint32_t DMDATA_STATUS;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  142  	uint32_t DCSURF_FLIP_CONTROL2;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  143  	uint32_t FLIP_PARAMETERS_0;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  144  	uint32_t FLIP_PARAMETERS_1;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  145  	uint32_t FLIP_PARAMETERS_2;\
4850ce697f9892 Charlene Liu      2019-05-07  146  	uint32_t DCN_CUR1_TTU_CNTL0;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  147  	uint32_t DCN_CUR1_TTU_CNTL1;\
c70b4016306a10 Charlene Liu      2019-06-05  148  	uint32_t VMID_SETTINGS_0
c70b4016306a10 Charlene Liu      2019-06-05  149  
bbeb64d0eb78f4 Harry Wentland    2019-05-07  150  
6162ba9234c124 Yifan Zhang       2019-11-28  151  #if defined(CONFIG_DRM_AMD_DC_DCN2_1)
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  152  #define DCN21_HUBP_REG_COMMON_VARIABLE_LIST \
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  153  	DCN2_HUBP_REG_COMMON_VARIABLE_LIST; \
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  154  	uint32_t FLIP_PARAMETERS_3;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  155  	uint32_t FLIP_PARAMETERS_4;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  156  	uint32_t FLIP_PARAMETERS_5;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  157  	uint32_t FLIP_PARAMETERS_6;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  158  	uint32_t VBLANK_PARAMETERS_5;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  159  	uint32_t VBLANK_PARAMETERS_6
6162ba9234c124 Yifan Zhang       2019-11-28  160  #endif
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  161  
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  162  #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  163  #define DCN30_HUBP_REG_COMMON_VARIABLE_LIST \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21 @164  	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  165  	uint32_t DCN_DMDATA_VM_CNTL
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  166  #endif
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  167  
bbeb64d0eb78f4 Harry Wentland    2019-05-07  168  #define DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type) \
c70b4016306a10 Charlene Liu      2019-06-05  169  	DCN_HUBP_REG_FIELD_BASE_LIST(type); \
bbeb64d0eb78f4 Harry Wentland    2019-05-07  170  	type DMDATA_ADDRESS_HIGH;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  171  	type DMDATA_MODE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  172  	type DMDATA_UPDATED;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  173  	type DMDATA_REPEAT;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  174  	type DMDATA_SIZE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  175  	type DMDATA_SW_UPDATED;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  176  	type DMDATA_SW_REPEAT;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  177  	type DMDATA_SW_SIZE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  178  	type DMDATA_QOS_MODE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  179  	type DMDATA_QOS_LEVEL;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  180  	type DMDATA_DL_DELTA;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  181  	type DMDATA_DONE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  182  	type DST_Y_PER_VM_FLIP;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  183  	type DST_Y_PER_ROW_FLIP;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  184  	type REFCYC_PER_PTE_GROUP_FLIP_L;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  185  	type REFCYC_PER_META_CHUNK_FLIP_L;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  186  	type HUBP_VREADY_AT_OR_AFTER_VSYNC;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  187  	type HUBP_DISABLE_STOP_DATA_DURING_VM;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  188  	type HUBPREQ_MASTER_UPDATE_LOCK_STATUS;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  189  	type SURFACE_GSL_ENABLE;\
bbeb64d0eb78f4 Harry Wentland    2019-05-07  190  	type SURFACE_TRIPLE_BUFFER_ENABLE;\
64f223b0dd1200 Yongqiang Sun     2019-04-02  191  	type VMID
64f223b0dd1200 Yongqiang Sun     2019-04-02  192  
6162ba9234c124 Yifan Zhang       2019-11-28  193  #ifdef CONFIG_DRM_AMD_DC_DCN2_1
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  194  #define DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type) \
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  195  	DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type);\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  196  	type REFCYC_PER_VM_GROUP_FLIP;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  197  	type REFCYC_PER_VM_REQ_FLIP;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  198  	type REFCYC_PER_VM_GROUP_VBLANK;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  199  	type REFCYC_PER_VM_REQ_VBLANK;\
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  200  	type REFCYC_PER_PTE_GROUP_FLIP_C; \
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  201  	type REFCYC_PER_META_CHUNK_FLIP_C; \
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  202  	type VM_GROUP_SIZE
6162ba9234c124 Yifan Zhang       2019-11-28  203  #endif
35b82ba8f2fa9b Bhawanpreet Lakha 2019-08-28  204  
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  205  #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  206  #define DCN30_HUBP_REG_FIELD_VARIABLE_LIST(type) \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21 @207  	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  208  	type PRIMARY_SURFACE_DCC_IND_BLK;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  209  	type SECONDARY_SURFACE_DCC_IND_BLK;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  210  	type PRIMARY_SURFACE_DCC_IND_BLK_C;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  211  	type SECONDARY_SURFACE_DCC_IND_BLK_C;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  212  	type ALPHA_PLANE_EN;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  213  	type REFCYC_PER_VM_DMDATA;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  214  	type DMDATA_VM_FAULT_STATUS;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  215  	type DMDATA_VM_FAULT_STATUS_CLEAR; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  216  	type DMDATA_VM_UNDERFLOW_STATUS;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  217  	type DMDATA_VM_LATE_STATUS;\
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  218  	type DMDATA_VM_UNDERFLOW_STATUS_CLEAR; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  219  	type DMDATA_VM_DONE; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  220  	type CROSSBAR_SRC_Y_G; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  221  	type CROSSBAR_SRC_ALPHA; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  222  	type PACK_3TO2_ELEMENT_DISABLE; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  223  	type ROW_TTU_MODE; \
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  224  	type NUM_PKRS
d2898ece6bedb5 Bhawanpreet Lakha 2020-05-21  225  #endif
bbeb64d0eb78f4 Harry Wentland    2019-05-07  226  

:::::: The code at line 164 was first introduced by commit
:::::: d2898ece6bedb5a51e5822369af38c7fda182838 drm/amd/display: Add DCN3 HUBP

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Yang Xiong <Yang.Xiong@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--PNTmBPCT7hxwcZjr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
so5hbKiLKvaS5CAIrGYvjv8B6kEQ5uoAAgA=

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--PNTmBPCT7hxwcZjr--
