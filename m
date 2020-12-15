Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCB2DA6E3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 04:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDCF89CB3;
	Tue, 15 Dec 2020 03:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478B189715
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:35:07 +0000 (UTC)
IronPort-SDR: ZGJN5SQey+goJVv+Wm3IKzbU5TbYk4gBaC4mMEwsGzcT/qpP3+EqCv4mvyjJc7l9H/Xq1XDul+
 q6RTPd8ZAsug==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="161873473"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="161873473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 19:35:06 -0800
IronPort-SDR: uPo5I9AQ+0GsjeHMP7GDL/f3KRw37lag99I1O15HTzxs8W+f/Y4pVxxz7vuwyZvt/xTRyAFHDm
 uUSAJE8YH8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
 d="gz'50?scan'50,208,50";a="389958712"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2020 19:35:04 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kp179-0000ZJ-KM; Tue, 15 Dec 2020 03:35:03 +0000
Date: Tue, 15 Dec 2020 11:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Koo <Anthony.Koo@amd.com>
Subject: [radeon-alex:amd-20.45 1087/2427]
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable
 'temp' set but not used
Message-ID: <202012151116.uiqRXPPz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
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
Cc: Yang Xiong <Yang.Xiong@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anthony,

FYI, the error/warning still remains.

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-20.45
head:   a3950d94b046fb206e58fd3ec717f071c0203ba3
commit: cba14b2c4e6c30f8af8c1fe00893e11e040d1873 [1087/2427] drm/amd/display: combine public interfaces into single header
config: i386-randconfig-r022-20201214 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-20.45
        git checkout cba14b2c4e6c30f8af8c1fe00893e11e040d1873
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:35:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:28:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:88,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:30:
   At top level:
   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h:54:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:30:
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:28:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c: In function 'calculate_16_bit_backlight_from_pwm':
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:54:11: warning: variable 'bl_pwm_cntl' set but not used [-Wunused-but-set-variable]
      54 |  uint32_t bl_pwm_cntl, bl_pwm, fractional_duty_cycle_en;
         |           ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:53:11: warning: variable 'pwm_period_cntl' set but not used [-Wunused-but-set-variable]
      53 |  uint32_t pwm_period_cntl, bl_period, bl_int_count;
         |           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:98:10: warning: no previous prototype for 'dce_panel_cntl_hw_init' [-Wmissing-prototypes]
      98 | uint32_t dce_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:158:6: warning: no previous prototype for 'dce_is_panel_backlight_on' [-Wmissing-prototypes]
     158 | bool dce_is_panel_backlight_on(struct panel_cntl *panel_cntl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:168:6: warning: no previous prototype for 'dce_is_panel_powered_on' [-Wmissing-prototypes]
     168 | bool dce_is_panel_powered_on(struct panel_cntl *panel_cntl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:180:6: warning: no previous prototype for 'dce_store_backlight_level' [-Wmissing-prototypes]
     180 | void dce_store_backlight_level(struct panel_cntl *panel_cntl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:195:6: warning: no previous prototype for 'dce_driver_set_backlight' [-Wmissing-prototypes]
     195 | void dce_driver_set_backlight(struct panel_cntl *panel_cntl,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:88,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:27:
   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h:54:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_panel_cntl.c:27:
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:61:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:788:6: warning: no previous prototype for 'apply_ctx_interdependent_lock' [-Wmissing-prototypes]
     788 | void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *context, struct dc_stream_state *stream, bool lock)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:88,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:33:
   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h:54:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:33:
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:49:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c: In function 'query_hdcp_capability':
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:599:28: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     599 |   enum hdcp_message_status status = HDCP_MESSAGE_UNSUPPORTED;
         |                            ^~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/core_types.h:88,
                    from drivers/gpu/drm/amd/display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:42:
   At top level:
   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h:54:42: warning: 'dpp_input_csc_matrix' defined but not used [-Wunused-const-variable=]
      54 | static const struct dpp_input_csc_matrix dpp_input_csc_matrix[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:36:
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:124:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:122:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
     122 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/ddc_service_types.h:120:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
     120 | static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:36:
   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
>> drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:679:12: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
     679 |   uint64_t temp;
         |            ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:325:10: warning: no previous prototype for 'generic_reg_get' [-Wmissing-prototypes]
     325 | uint32_t generic_reg_get(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:333:10: warning: no previous prototype for 'generic_reg_get2' [-Wmissing-prototypes]
     333 | uint32_t generic_reg_get2(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:343:10: warning: no previous prototype for 'generic_reg_get3' [-Wmissing-prototypes]
     343 | uint32_t generic_reg_get3(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:355:10: warning: no previous prototype for 'generic_reg_get4' [-Wmissing-prototypes]
     355 | uint32_t generic_reg_get4(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:369:10: warning: no previous prototype for 'generic_reg_get5' [-Wmissing-prototypes]
     369 | uint32_t generic_reg_get5(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:385:10: warning: no previous prototype for 'generic_reg_get6' [-Wmissing-prototypes]
     385 | uint32_t generic_reg_get6(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:403:10: warning: no previous prototype for 'generic_reg_get7' [-Wmissing-prototypes]
     403 | uint32_t generic_reg_get7(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:423:10: warning: no previous prototype for 'generic_reg_get8' [-Wmissing-prototypes]
     423 | uint32_t generic_reg_get8(const struct dc_context *ctx, uint32_t addr,
         |          ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:529:6: warning: no previous prototype for 'generic_write_indirect_reg' [-Wmissing-prototypes]
     529 | void generic_write_indirect_reg(const struct dc_context *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:537:10: warning: no previous prototype for 'generic_read_indirect_reg' [-Wmissing-prototypes]
     537 | uint32_t generic_read_indirect_reg(const struct dc_context *ctx,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:555:10: warning: no previous prototype for 'generic_indirect_reg_get' [-Wmissing-prototypes]
     555 | uint32_t generic_indirect_reg_get(const struct dc_context *ctx,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:586:10: warning: no previous prototype for 'generic_indirect_reg_update_ex' [-Wmissing-prototypes]
     586 | uint32_t generic_indirect_reg_update_ex(const struct dc_context *ctx,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/backport/include/kcl/kcl_amdgpu.h:5,
                    from drivers/gpu/drm/amd/backport/backport.h:17,
                    from <command-line>:
   drivers/gpu/drm/amd/display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~
   drivers/gpu/drm/amd/display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
..

vim +/temp +679 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h

   670	
   671	static inline void dmub_rb_flush_pending(const struct dmub_rb *rb)
   672	{
   673		uint32_t rptr = rb->rptr;
   674		uint32_t wptr = rb->wrpt;
   675	
   676		while (rptr != wptr) {
   677			uint64_t volatile *data = (uint64_t volatile *)rb->base_address + rptr / sizeof(uint64_t);
   678			//uint64_t volatile *p = (uint64_t volatile *)data;
 > 679			uint64_t temp;
   680			int i;
   681	
   682			for (i = 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i++)
   683				temp = *data++;
   684	
   685			rptr += DMUB_RB_CMD_SIZE;
   686			if (rptr >= rb->capacity)
   687				rptr %= rb->capacity;
   688		}
   689	}
   690	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--h31gzZEtNLTqOjlF
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICCAb2F8AAy5jb25maWcAlFxbc9w2sn7Pr5hyXpKHOLpZcc4pPYAkOIMMSdAAOBe9sBR5
7KjWknx02Y3//ekGeAHA5ji7teWI6Ma90f11ozE//vDjgr2+PN7fvNzd3nz58m3x+fBweLp5
OXxcfLr7cvjfRSYXlTQLngnzFpiLu4fXv3+9O39/uXj39vLtyWJ9eHo4fFmkjw+f7j6/Qs27
x4cffvwB/v8jFN5/hUae/mfx+fb2l98XP2WHP+9uHha/vz1/e/LL6buf3V/Am8oqF8s2TVuh
22WaXn3ri+Cj3XClhayufj85PzkZeAtWLQfSiddEyqq2ENV6bAQKV0y3TJftUhpJEkQFdfiE
tGWqaku2T3jbVKISRrBCXPPMY5SVNqpJjVR6LBXqQ7uVyhtE0ogiM6LkrWFJwVstlRmpZqU4
y2AUuYR/gEVjVbuMS7slXxbPh5fXr+NiJUquedXKqtVl7XUMY2x5tWmZWsIylMJcnZ/hZvSj
LWsBvRuuzeLuefHw+IINjwwNq0W7grFwNWHqWAqZsqJf+TdvqOKWNf4627m3mhXG41+xDW/X
XFW8aJfXwpuDT0mAckaTiuuS0ZTd9VwNOUe4AMKwCN6oyEXyx3aMAUdILKA/ymkVebzFC6LB
jOesKUy7ktpUrORXb356eHw4/Dystd4yb331Xm9EnU4K8L+pKfxR1VKLXVt+aHjDyXGlSmrd
lryUat8yY1i6IgbYaF6IxG+YNaBSCE67K0ylK8eBI2JF0Z8FOFaL59c/n789vxzux7Ow5BVX
IrWnrlYy8c6xT9IruaUp6cqXPyzJZMlEFZZpUVJM7UpwhUPeTxsvtUDOWcKkH39UJTMKVh/m
D0cL9AvNpbjmasMMHrtSZjwcYi5VyrNOv4hq6W16zZTm9OjsyHjSLHNtN+3w8HHx+Cla/lEV
y3StZQMdgb406SqTXjd2L32WjBl2hIwKzNOuHmUDqhcq87Zg2rTpPi2IfbYadjOKTUS27fEN
r4w+SkT1yrIUOjrOVsL2s+yPhuQrpW6bGofcy6+5uz88PVMibES6BmXOQUa9pirZrq5RaZey
8k8PFNbQh8xESpwhV0tkdn2GOraUOnFiuUIhskungv2eDLevUyvOy9pAm1XQR1++kUVTGab2
pM7ouIix9PVTCdX7RUvr5ldz8/yvxQsMZ3EDQ3t+uXl5Xtzc3j6+PrzcPXyOlhEqtCy1bTiJ
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

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--h31gzZEtNLTqOjlF--
