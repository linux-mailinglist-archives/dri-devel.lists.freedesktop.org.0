Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94A2795F1
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 03:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C206E071;
	Sat, 26 Sep 2020 01:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626286E071
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 01:22:32 +0000 (UTC)
IronPort-SDR: CtuT7II0Rqc6IFa03/N+dBqeOdHZdCsleQmclLlN5rjeTTtWi87nx8FppAMjVdYeGKZcm9Tolo
 g45yCWysXxBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="141699982"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
 d="gz'50?scan'50,208,50";a="141699982"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 18:22:30 -0700
IronPort-SDR: jXDJDSC90f4LI+DTgWvS61djCyLwlgB5KbVqKmKK0dPurWVxlR8hY/2VP4R/bk0qRXA2PT7V+/
 aJo5mmg5Rxcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
 d="gz'50?scan'50,208,50";a="456086167"
Received: from lkp-server01.sh.intel.com (HELO 2dda29302fe3) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 25 Sep 2020 18:22:27 -0700
Received: from kbuild by 2dda29302fe3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kLyuw-0000KF-AL; Sat, 26 Sep 2020 01:22:26 +0000
Date: Sat, 26 Sep 2020 09:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Subject: [radeon-alex:amd-staging-drm-next-vangogh 45/47]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:96:6:
 warning: no previous prototype for 'vg_update_clocks'
Message-ID: <202009260948.Cmi7y2Ss%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next-vangogh
head:   6067a749d66ef3815908c86ee0b08733e391955f
commit: 356e0c5b8e5c7cd698641f3f7605d25ad793b159 [45/47] drm/amd/display: Add dcn3.01 support to DC
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-staging-drm-next-vangogh
        git checkout 356e0c5b8e5c7cd698641f3f7605d25ad793b159
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:96:6: warning: no previous prototype for 'vg_update_clocks' [-Wmissing-prototypes]
      96 | void vg_update_clocks(struct clk_mgr *clk_mgr_base,
         |      ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:375:6: warning: no previous prototype for 'vg_get_clk_states' [-Wmissing-prototypes]
     375 | void vg_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *s)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:393:6: warning: no previous prototype for 'vg_init_clocks' [-Wmissing-prototypes]
     393 | void vg_init_clocks(struct clk_mgr *clk_mgr)
         |      ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:43:
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:218:29: warning: 'VCN_BASE' defined but not used [-Wunused-const-variable=]
     218 | static const struct IP_BASE VCN_BASE = { { { { 0x00007800, 0x00007E00, 0x02403000, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:210:29: warning: 'USB_BASE' defined but not used [-Wunused-const-variable=]
     210 | static const struct IP_BASE USB_BASE = { { { { 0x0242A800, 0x05B00000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:202:29: warning: 'UMC_BASE' defined but not used [-Wunused-const-variable=]
     202 | static const struct IP_BASE UMC_BASE = { { { { 0x00014000, 0x02425800, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:194:29: warning: 'THM_BASE' defined but not used [-Wunused-const-variable=]
     194 | static const struct IP_BASE THM_BASE = { { { { 0x00016600, 0x02400C00, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:186:29: warning: 'SMUIO_BASE' defined but not used [-Wunused-const-variable=]
     186 | static const struct IP_BASE SMUIO_BASE = { { { { 0x00016800, 0x00016A00, 0x02401000, 0x00440000, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:178:29: warning: 'PCIE0_BASE' defined but not used [-Wunused-const-variable=]
     178 | static const struct IP_BASE PCIE0_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:170:29: warning: 'OSSSYS_BASE' defined but not used [-Wunused-const-variable=]
     170 | static const struct IP_BASE OSSSYS_BASE = { { { { 0x000010A0, 0x0240A000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:162:29: warning: 'NBIO_BASE' defined but not used [-Wunused-const-variable=]
     162 | static const struct IP_BASE NBIO_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:154:29: warning: 'MP2_BASE' defined but not used [-Wunused-const-variable=]
     154 | static const struct IP_BASE MP2_BASE = { { { { 0x00016400, 0x02400800, 0x00F40000, 0x00F80000, 0x00FC0000, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:146:29: warning: 'MP1_BASE' defined but not used [-Wunused-const-variable=]
     146 | static const struct IP_BASE MP1_BASE = { { { { 0x00016000, 0x0243FC00, 0x00DC0000, 0x00E00000, 0x00E40000, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:138:29: warning: 'MP0_BASE' defined but not used [-Wunused-const-variable=]
     138 | static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x0243FC00, 0x00DC0000, 0x00E00000, 0x00E40000, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:130:29: warning: 'MMHUB_BASE' defined but not used [-Wunused-const-variable=]
     130 | static const struct IP_BASE MMHUB_BASE = { { { { 0x00013200, 0x0001A000, 0x02408800, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:122:29: warning: 'ISP_BASE' defined but not used [-Wunused-const-variable=]
     122 | static const struct IP_BASE ISP_BASE = { { { { 0x00018000, 0x0240B000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:114:29: warning: 'HDP_BASE' defined but not used [-Wunused-const-variable=]
     114 | static const struct IP_BASE HDP_BASE = { { { { 0x00000F20, 0x0240A400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:106:29: warning: 'GC_BASE' defined but not used [-Wunused-const-variable=]
     106 | static const struct IP_BASE GC_BASE = { { { { 0x00001260, 0x0000A000, 0x02402C00, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:98:29: warning: 'FUSE_BASE' defined but not used [-Wunused-const-variable=]
      98 | static const struct IP_BASE FUSE_BASE = { { { { 0x00017400, 0x02401400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:90:29: warning: 'FCH_BASE' defined but not used [-Wunused-const-variable=]
      90 | static const struct IP_BASE FCH_BASE = { { { { 0x0240C000, 0x00B40000, 0x11000000, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:82:29: warning: 'DPCS_BASE' defined but not used [-Wunused-const-variable=]
      82 | static const struct IP_BASE DPCS_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:74:29: warning: 'DCN_BASE' defined but not used [-Wunused-const-variable=]
      74 | static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:66:29: warning: 'DF_BASE' defined but not used [-Wunused-const-variable=]
      66 | static const struct IP_BASE DF_BASE = { { { { 0x00007000, 0x0240B800, 0, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:50:29: warning: 'ATHUB_BASE' defined but not used [-Wunused-const-variable=]
      50 | static const struct IP_BASE ATHUB_BASE = { { { { 0x00000C00, 0x00013300, 0x02408C00, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:42:29: warning: 'ACP_BASE' defined but not used [-Wunused-const-variable=]
      42 | static const struct IP_BASE ACP_BASE = { { { { 0x02403800, 0x00480000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:86,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/clk_mgr_internal.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dpp.h:50:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      50 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/clk_mgr_internal.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dccg.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:91:5: warning: no previous prototype for 'dcn301_smu_send_msg_with_param' [-Wmissing-prototypes]
      91 | int dcn301_smu_send_msg_with_param(
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:33:
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:218:29: warning: 'VCN_BASE' defined but not used [-Wunused-const-variable=]
     218 | static const struct IP_BASE VCN_BASE = { { { { 0x00007800, 0x00007E00, 0x02403000, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:210:29: warning: 'USB_BASE' defined but not used [-Wunused-const-variable=]
     210 | static const struct IP_BASE USB_BASE = { { { { 0x0242A800, 0x05B00000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:202:29: warning: 'UMC_BASE' defined but not used [-Wunused-const-variable=]
     202 | static const struct IP_BASE UMC_BASE = { { { { 0x00014000, 0x02425800, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:194:29: warning: 'THM_BASE' defined but not used [-Wunused-const-variable=]
     194 | static const struct IP_BASE THM_BASE = { { { { 0x00016600, 0x02400C00, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:186:29: warning: 'SMUIO_BASE' defined but not used [-Wunused-const-variable=]
     186 | static const struct IP_BASE SMUIO_BASE = { { { { 0x00016800, 0x00016A00, 0x02401000, 0x00440000, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:178:29: warning: 'PCIE0_BASE' defined but not used [-Wunused-const-variable=]
     178 | static const struct IP_BASE PCIE0_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:170:29: warning: 'OSSSYS_BASE' defined but not used [-Wunused-const-variable=]
     170 | static const struct IP_BASE OSSSYS_BASE = { { { { 0x000010A0, 0x0240A000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:162:29: warning: 'NBIO_BASE' defined but not used [-Wunused-const-variable=]
     162 | static const struct IP_BASE NBIO_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:154:29: warning: 'MP2_BASE' defined but not used [-Wunused-const-variable=]
     154 | static const struct IP_BASE MP2_BASE = { { { { 0x00016400, 0x02400800, 0x00F40000, 0x00F80000, 0x00FC0000, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:146:29: warning: 'MP1_BASE' defined but not used [-Wunused-const-variable=]
     146 | static const struct IP_BASE MP1_BASE = { { { { 0x00016000, 0x0243FC00, 0x00DC0000, 0x00E00000, 0x00E40000, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:130:29: warning: 'MMHUB_BASE' defined but not used [-Wunused-const-variable=]
     130 | static const struct IP_BASE MMHUB_BASE = { { { { 0x00013200, 0x0001A000, 0x02408800, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:122:29: warning: 'ISP_BASE' defined but not used [-Wunused-const-variable=]
     122 | static const struct IP_BASE ISP_BASE = { { { { 0x00018000, 0x0240B000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:114:29: warning: 'HDP_BASE' defined but not used [-Wunused-const-variable=]
     114 | static const struct IP_BASE HDP_BASE = { { { { 0x00000F20, 0x0240A400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:106:29: warning: 'GC_BASE' defined but not used [-Wunused-const-variable=]
     106 | static const struct IP_BASE GC_BASE = { { { { 0x00001260, 0x0000A000, 0x02402C00, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:98:29: warning: 'FUSE_BASE' defined but not used [-Wunused-const-variable=]
      98 | static const struct IP_BASE FUSE_BASE = { { { { 0x00017400, 0x02401400, 0, 0, 0, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:90:29: warning: 'FCH_BASE' defined but not used [-Wunused-const-variable=]
      90 | static const struct IP_BASE FCH_BASE = { { { { 0x0240C000, 0x00B40000, 0x11000000, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:82:29: warning: 'DPCS_BASE' defined but not used [-Wunused-const-variable=]
      82 | static const struct IP_BASE DPCS_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
         |                             ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:74:29: warning: 'DCN_BASE' defined but not used [-Wunused-const-variable=]
      74 | static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:66:29: warning: 'DF_BASE' defined but not used [-Wunused-const-variable=]
      66 | static const struct IP_BASE DF_BASE = { { { { 0x00007000, 0x0240B800, 0, 0, 0, 0 } },
         |                             ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:58:29: warning: 'CLK_BASE' defined but not used [-Wunused-const-variable=]
      58 | static const struct IP_BASE CLK_BASE = { { { { 0x00016C00, 0x02401800, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:50:29: warning: 'ATHUB_BASE' defined but not used [-Wunused-const-variable=]
      50 | static const struct IP_BASE ATHUB_BASE = { { { { 0x00000C00, 0x00013300, 0x02408C00, 0, 0, 0 } },
         |                             ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:42:29: warning: 'ACP_BASE' defined but not used [-Wunused-const-variable=]
      42 | static const struct IP_BASE ACP_BASE = { { { { 0x02403800, 0x00480000, 0, 0, 0, 0 } },
         |                             ^~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:86,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dpp.h:50:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      50 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/dcn301_smu.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:141:6: warning: no previous prototype for 'dcn301_hw_sequencer_construct' [-Wmissing-prototypes]
     141 | void dcn301_hw_sequencer_construct(struct dc *dc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:86,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/dc/inc/hw/dpp.h:50:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      50 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_init.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:66:
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[0].DP_SEC_METADATA_TRANSMISSION')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[0].HDMI_METADATA_PACKET_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[0].DIG_FE_CNTL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:447:2: note: in expansion of macro 'stream_enc_regs'
     447 |  stream_enc_regs(0),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[1].DP_SEC_METADATA_TRANSMISSION')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[1].HDMI_METADATA_PACKET_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[1].DIG_FE_CNTL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:448:2: note: in expansion of macro 'stream_enc_regs'
     448 |  stream_enc_regs(1),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[2].DP_SEC_METADATA_TRANSMISSION')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[2].HDMI_METADATA_PACKET_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[2].DIG_FE_CNTL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:449:2: note: in expansion of macro 'stream_enc_regs'
     449 |  stream_enc_regs(2),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[3].DP_SEC_METADATA_TRANSMISSION')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:104:2: note: in expansion of macro 'SRI'
     104 |  SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[3].HDMI_METADATA_PACKET_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:105:2: note: in expansion of macro 'SRI'
     105 |  SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'stream_enc_regs[3].DIG_FE_CNTL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dio_stream_encoder.h:106:2: note: in expansion of macro 'SRI'
     106 |  SRI(DIG_FE_CNTL, DIG, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:443:2: note: in expansion of macro 'SE_DCN3_REG_LIST'
     443 |  SE_DCN3_REG_LIST(id)\
         |  ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:450:2: note: in expansion of macro 'stream_enc_regs'
     450 |  stream_enc_regs(3),
         |  ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:72:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:27667:111: warning: initialized field overwritten [-Woverride-init]
   27667 | #define DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT                                              0x1f
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro 'DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT'
     214 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:204:2: note: in expansion of macro 'AUX_SF'
     204 |  AUX_SF(DP_AUX0_AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:493:2: note: in expansion of macro 'DCN_AUX_MASK_SH_LIST'
     493 |  DCN_AUX_MASK_SH_LIST(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:27667:111: note: (near initialization for 'aux_shift.AUX_SW_AUTOINCREMENT_DISABLE')
   27667 | #define DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT                                              0x1f
         |                                                                                                               ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro 'DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE__SHIFT'
     214 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:204:2: note: in expansion of macro 'AUX_SF'
     204 |  AUX_SF(DP_AUX0_AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:493:2: note: in expansion of macro 'DCN_AUX_MASK_SH_LIST'
     493 |  DCN_AUX_MASK_SH_LIST(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:27671:111: warning: initialized field overwritten [-Woverride-init]
   27671 | #define DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK                                                0x80000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro 'DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK'
     214 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:204:2: note: in expansion of macro 'AUX_SF'
     204 |  AUX_SF(DP_AUX0_AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:497:2: note: in expansion of macro 'DCN_AUX_MASK_SH_LIST'
     497 |  DCN_AUX_MASK_SH_LIST(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:27671:111: note: (near initialization for 'aux_mask.AUX_SW_AUTOINCREMENT_DISABLE')
   27671 | #define DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK                                                0x80000000L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:214:16: note: in expansion of macro 'DP_AUX0_AUX_SW_DATA__AUX_SW_AUTOINCREMENT_DISABLE_MASK'
     214 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_aux.h:204:2: note: in expansion of macro 'AUX_SF'
     204 |  AUX_SF(DP_AUX0_AUX_SW_DATA, AUX_SW_AUTOINCREMENT_DISABLE, mask_sh),\
         |  ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:497:2: note: in expansion of macro 'DCN_AUX_MASK_SH_LIST'
     497 |  DCN_AUX_MASK_SH_LIST(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:29741:111: warning: initialized field overwritten [-Woverride-init]
   29741 | #define DIG0_TMDS_CTL_BITS__TMDS_CTL0__SHIFT                                                                  0x0
         |                                                                                                               ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.h:166:16: note: in expansion of macro 'DIG0_TMDS_CTL_BITS__TMDS_CTL0__SHIFT'
     166 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:184:2: note: in expansion of macro 'LE_SF'
     184 |  LE_SF(DIG0_TMDS_CTL_BITS, TMDS_CTL0, mask_sh), \
         |  ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.h:59:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN20'
      59 |  LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:508:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN301'
     508 |  LINK_ENCODER_MASK_SH_LIST_DCN301(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:29741:111: note: (near initialization for 'le_shift.TMDS_CTL0')
   29741 | #define DIG0_TMDS_CTL_BITS__TMDS_CTL0__SHIFT                                                                  0x0
         |                                                                                                               ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.h:166:16: note: in expansion of macro 'DIG0_TMDS_CTL_BITS__TMDS_CTL0__SHIFT'
     166 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:184:2: note: in expansion of macro 'LE_SF'
     184 |  LE_SF(DIG0_TMDS_CTL_BITS, TMDS_CTL0, mask_sh), \
         |  ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.h:59:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN20'
      59 |  LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:508:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN301'
     508 |  LINK_ENCODER_MASK_SH_LIST_DCN301(__SHIFT)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:29745:111: warning: initialized field overwritten [-Woverride-init]
   29745 | #define DIG0_TMDS_CTL_BITS__TMDS_CTL0_MASK                                                                    0x00000001L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.h:166:16: note: in expansion of macro 'DIG0_TMDS_CTL_BITS__TMDS_CTL0_MASK'
     166 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:184:2: note: in expansion of macro 'LE_SF'
     184 |  LE_SF(DIG0_TMDS_CTL_BITS, TMDS_CTL0, mask_sh), \
         |  ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.h:59:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN20'
      59 |  LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:512:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN301'
     512 |  LINK_ENCODER_MASK_SH_LIST_DCN301(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dcn/dcn_3_0_1_sh_mask.h:29745:111: note: (near initialization for 'le_mask.TMDS_CTL0')
   29745 | #define DIG0_TMDS_CTL_BITS__TMDS_CTL0_MASK                                                                    0x00000001L
         |                                                                                                               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.h:166:16: note: in expansion of macro 'DIG0_TMDS_CTL_BITS__TMDS_CTL0_MASK'
     166 |  .field_name = reg_name ## __ ## field_name ## post_fix
         |                ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_link_encoder.h:184:2: note: in expansion of macro 'LE_SF'
     184 |  LE_SF(DIG0_TMDS_CTL_BITS, TMDS_CTL0, mask_sh), \
         |  ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_dio_link_encoder.h:59:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN20'
      59 |  LINK_ENCODER_MASK_SH_LIST_DCN20(mask_sh),\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:512:2: note: in expansion of macro 'LINK_ENCODER_MASK_SH_LIST_DCN301'
     512 |  LINK_ENCODER_MASK_SH_LIST_DCN301(_MASK)
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:66:
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[0].CM_GAMCOR_LUT_INDEX')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[0].CURSOR_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:162:2: note: in expansion of macro 'SRI'
     162 |  SRI(CM_BLNDGAM_CONTROL, CM, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[0].CM_BLNDGAM_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:162:2: note: in expansion of macro 'SRI'
     162 |  SRI(CM_BLNDGAM_CONTROL, CM, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:539:2: note: in expansion of macro 'dpp_regs'
     539 |  dpp_regs(0),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[1].CM_GAMCOR_LUT_INDEX')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[1].CURSOR_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:162:2: note: in expansion of macro 'SRI'
     162 |  SRI(CM_BLNDGAM_CONTROL, CM, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[1].CM_BLNDGAM_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:162:2: note: in expansion of macro 'SRI'
     162 |  SRI(CM_BLNDGAM_CONTROL, CM, id), \
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:540:2: note: in expansion of macro 'dpp_regs'
     540 |  dpp_regs(1),
         |  ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:541:2: note: in expansion of macro 'dpp_regs'
     541 |  dpp_regs(2),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[2].CM_GAMCOR_LUT_INDEX')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:42:2: note: in expansion of macro 'SRI'
      42 |  SRI(CM_GAMCOR_LUT_INDEX, CM, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:541:2: note: in expansion of macro 'dpp_regs'
     541 |  dpp_regs(2),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:541:2: note: in expansion of macro 'dpp_regs'
     541 |  dpp_regs(2),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: note: (near initialization for 'dpp_regs[2].CURSOR_CONTROL')
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:252:19: note: in expansion of macro 'BASE_INNER'
     252 | #define BASE(seg) BASE_INNER(seg)
         |                   ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:259:14: note: in expansion of macro 'BASE'
     259 |  .reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
         |              ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:155:2: note: in expansion of macro 'SRI'
     155 |  SRI(CURSOR_CONTROL, CURSOR0_, id),\
         |  ^~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.h:160:2: note: in expansion of macro 'DPP_REG_LIST_DCN30_COMMON'
     160 |  DPP_REG_LIST_DCN30_COMMON(id), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:535:2: note: in expansion of macro 'DPP_REG_LIST_DCN30'
     535 |  DPP_REG_LIST_DCN30(id),\
         |  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:541:2: note: in expansion of macro 'dpp_regs'
     541 |  dpp_regs(2),
         |  ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../include/vangogh_ip_offset.h:454:52: warning: initialized field overwritten [-Woverride-init]
     454 | #define DCN_BASE__INST0_SEG2                       0x000034C0
         |                                                    ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dcn301/dcn301_resource.c:250:25: note: in expansion of macro 'DCN_BASE__INST0_SEG2'
     250 | #define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
..

vim +/vg_update_clocks +96 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn301/vg_clk_mgr.c

    95	
  > 96	void vg_update_clocks(struct clk_mgr *clk_mgr_base,
    97				struct dc_state *context,
    98				bool safe_to_lower)
    99	{
   100		struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
   101		struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
   102		struct dc *dc = clk_mgr_base->ctx->dc;
   103		int display_count;
   104		bool update_dppclk = false;
   105		bool update_dispclk = false;
   106		bool dpp_clock_lowered = false;
   107	
   108		if (dc->work_arounds.skip_clock_update)
   109			return;
   110	
   111		/*
   112		 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
   113		 * also if safe to lower is false, we just go in the higher state
   114		 */
   115		if (safe_to_lower) {
   116			/* check that we're not already in lower */
   117			if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
   118	
   119				display_count = vg_get_active_display_cnt_wa(dc, context);
   120				/* if we can go lower, go lower */
   121				if (display_count == 0) {
   122					union display_idle_optimization_u idle_info = { 0 };
   123	
   124					idle_info.idle_info.df_request_disabled = 1;
   125					idle_info.idle_info.phy_ref_clk_off = 1;
   126	
   127					dcn301_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
   128					/* update power state */
   129					clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
   130				}
   131			}
   132		} else {
   133			/* check that we're not already in D0 */
   134			if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
   135				union display_idle_optimization_u idle_info = { 0 };
   136	
   137				dcn301_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
   138				/* update power state */
   139				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
   140			}
   141		}
   142	
   143		if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
   144			clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
   145			dcn301_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
   146		}
   147	
   148		if (should_set_clock(safe_to_lower,
   149				new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
   150			clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
   151			dcn301_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
   152		}
   153	
   154		// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
   155		if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
   156			if (new_clocks->dppclk_khz < 100000)
   157				new_clocks->dppclk_khz = 100000;
   158		}
   159	
   160		if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
   161			if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
   162				dpp_clock_lowered = true;
   163			clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
   164			update_dppclk = true;
   165		}
   166	
   167		if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
   168			clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
   169			dcn301_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
   170	
   171			update_dispclk = true;
   172		}
   173	
   174		if (dpp_clock_lowered) {
   175			// increase per DPP DTO before lowering global dppclk
   176			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
   177			dcn301_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
   178		} else {
   179			// increase global DPPCLK before lowering per DPP DTO
   180			if (update_dppclk || update_dispclk)
   181				dcn301_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
   182			// always update dtos unless clock is lowered and not safe to lower
   183			if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
   184				dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
   185		}
   186	}
   187	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--vkogqOf2sHV7VnPd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--vkogqOf2sHV7VnPd--
