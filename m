Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0CA24572E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 11:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C4A6E10A;
	Sun, 16 Aug 2020 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E036E057
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 09:59:29 +0000 (UTC)
IronPort-SDR: tlBQc2YlI1SK0ZtBC+QVKybZTqXw6aDJ5sYvnpfw5dduaurBCh8/Li82Ir14lgSjkbysb/1FTX
 xP6jYA1ZArRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9714"; a="153829562"
X-IronPort-AV: E=Sophos;i="5.76,319,1592895600"; 
 d="gz'50?scan'50,208,50";a="153829562"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2020 02:59:28 -0700
IronPort-SDR: fIeiFj+Sl547gVjlxoX1JlVSY/rjHmzugcYZgDYFgHz1OsKwGqZLLycFOb9alMWzGydEnQC22K
 bM0Rs0q+FFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,319,1592895600"; 
 d="gz'50?scan'50,208,50";a="496175213"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2020 02:59:26 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k7FRl-00001x-UT; Sun, 16 Aug 2020 09:59:26 +0000
Date: Sun, 16 Aug 2020 17:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 1403/1408]
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h:336:22:
 warning: variable 'Y_LessThanOne' set but not used
Message-ID: <202008161710.bZafxINC%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   2dec4fa1c0a2e25aaef50fba28fb7360b4e7dc43
commit: 82e6bcf7c9a0c82f3d41a5837bb1dadd68037e55 [1403/1408] drm/amd/pm: optimize the power related source code layout
config: alpha-randconfig-r005-20200816 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 82e6bcf7c9a0c82f3d41a5837bb1dadd68037e55
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c: In function 'arcturus_is_dpm_running':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:1845:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1845 |  int ret = 0;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.c: In function 'navi10_is_dpm_running':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.c:1346:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1346 |  int ret = 0;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.c:29:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/navi10_ppt.c:29:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c: In function 'sienna_cichlid_is_dpm_running':
>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:1150:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1150 |  int ret = 0;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:29:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:29:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.c: In function 'tonga_thermal_setup_fan_table':
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.c:2469:6: warning: variable 'res' set but not used [-Wunused-but-set-variable]
    2469 |  int res;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.c:30:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/tonga_smumgr.c:30:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.c: In function 'fiji_populate_smc_boot_level':
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.c:1604:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
    1604 |  int result = 0;
         |      ^~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.c:25:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/fiji_smumgr.c:25:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c: In function 'polaris10_populate_smc_boot_level':
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:1453:6: warning: variable 'result' set but not used [-Wunused-but-set-variable]
    1453 |  int result = 0;
         |      ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c: At top level:
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:2045:5: warning: no previous prototype for 'polaris10_thermal_avfs_enable' [-Wmissing-prototypes]
    2045 | int polaris10_thermal_avfs_enable(struct pp_hwmgr *hwmgr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:27:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:27:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2085:5: warning: no previous prototype for 'iceland_thermal_setup_fan_table' [-Wmissing-prototypes]
    2085 | int iceland_thermal_setup_fan_table(struct pp_hwmgr *hwmgr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c: In function 'iceland_thermal_setup_fan_table':
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2093:6: warning: variable 'res' set but not used [-Wunused-but-set-variable]
    2093 |  int res;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:32:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:32:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.c: In function 'ci_thermal_setup_fan_table':
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.c:2131:6: warning: variable 'res' set but not used [-Wunused-but-set-variable]
    2131 |  int res;
         |      ^~~
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.c:30:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:195:19: warning: 'no_system_mem_limit' defined but not used [-Wunused-const-variable=]
     195 | static const bool no_system_mem_limit;
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:194:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     194 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:193:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     193 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/amd_powerplay.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../pm/inc/smumgr.h:26,
                    from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/ci_smumgr.c:30:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~
..

vim +/Y_LessThanOne +336 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/ppevvmath.h

770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  331  
21039ac388c5325 drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Nils Wallménius 2016-04-24  332  static fInt fMultiply (fInt X, fInt Y) /* Uses 64-bit integers (int64_t) */
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  333  {
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  334  	fInt Product;
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  335  	int64_t tempProduct;
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09 @336  	bool X_LessThanOne, Y_LessThanOne;
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  337  
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  338  	X_LessThanOne = (X.partial.real == 0 && X.partial.decimal != 0 && X.full >= 0);
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  339  	Y_LessThanOne = (Y.partial.real == 0 && Y.partial.decimal != 0 && Y.full >= 0);
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  340  
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  341  	/*The following is for a very specific common case: Non-zero number with ONLY fractional portion*/
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  342  	/* TEMPORARILY DISABLED - CAN BE USED TO IMPROVE PRECISION
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  343  
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  344  	if (X_LessThanOne && Y_LessThanOne) {
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  345  		Product.full = X.full * Y.full;
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  346  		return Product
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  347  	}*/
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  348  
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  349  	tempProduct = ((int64_t)X.full) * ((int64_t)Y.full); /*Q(16,16)*Q(16,16) = Q(32, 32) - Might become a negative number! */
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  350  	tempProduct = tempProduct >> 16; /*Remove lagging 16 bits - Will lose some precision from decimal; */
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  351  	Product.full = (int)tempProduct; /*The int64_t will lose the leading 16 bits that were part of the integer portion */
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  352  
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  353  	return Product;
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  354  }
770911a3cfbb43b drivers/gpu/drm/amd/powerplay/hwmgr/ppevvmath.h Eric Huang      2015-11-09  355  

:::::: The code at line 336 was first introduced by commit
:::::: 770911a3cfbb43b67b5ea3189b624e4fe2cb27c1 drm/amd/powerplay: add/update headers for Fiji SMU and DPM

:::::: TO: Eric Huang <JinHuiEric.Huang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--NzB8fVQJ5HfG6fxh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--NzB8fVQJ5HfG6fxh--
