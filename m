Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C837F20612E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 23:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733F6E7F5;
	Tue, 23 Jun 2020 21:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149F86E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 21:05:18 +0000 (UTC)
IronPort-SDR: w7CABbHwIEvudqHzR4cY5oziSlqwYHWJzXG6XGPWU8DUfQTuVkurQybwoyQAzhVWFGPGhgAW6f
 lbfTIVOq6GoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="209410071"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
 d="gz'50?scan'50,208,50";a="209410071"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 14:05:12 -0700
IronPort-SDR: jT7xluQCJGJh4e/JU6KGXs3kUW+EJCx9Dm2SLh3duoHxS6mqXbGBvF1Nr1S4Y3WPk5xqWwnbzo
 sRiJ9qouNMxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
 d="gz'50?scan'50,208,50";a="384972776"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2020 14:05:08 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jnq6O-0000X4-34; Tue, 23 Jun 2020 21:05:08 +0000
Date: Wed, 24 Jun 2020 05:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sonny Jiang <sonny.jiang@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 9963/9999]
 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:26:
 warning: "CC_DRM_ID_STRAPS__ATI_REV_ID_MASK" redefined
Message-ID: <202006240538.xf1IpqYJ%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SUOF0GtieIMvvwua"
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


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   2fecc2a42eb2ca00277fe34dafcf9ece398a848e
commit: 788c2ef8c423ccd8c62a471c7e7debe115b3e124 [9963/9999] drm amdgpu: SI UVD add uvd_v3_1 to makefile
config: x86_64-randconfig-a014-20200623 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        git checkout 788c2ef8c423ccd8c62a471c7e7debe115b3e124
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:26: warning: "CC_DRM_ID_STRAPS__ATI_REV_ID_MASK" redefined
      26 | #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK 0xf0000000L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2471: note: this is the location of the previous definition
    2471 | #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK  0xf0000000
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:27: warning: "CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT" redefined
      27 | #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x0000001c
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2472: note: this is the location of the previous definition
    2472 | #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x1c
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:744: warning: "IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK" redefined
     744 | #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2345: note: this is the location of the previous definition
    2345 | #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:760: warning: "IH_RB_WPTR__RB_OVERFLOW_MASK" redefined
     760 | #define IH_RB_WPTR__RB_OVERFLOW_MASK 0x00000001L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2344: note: this is the location of the previous definition
    2344 | #define IH_RB_WPTR__RB_OVERFLOW_MASK 0x1
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:988: warning: "SRBM_SOFT_RESET__SOFT_RESET_IH_MASK" redefined
     988 | #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK 0x00000400L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2347: note: this is the location of the previous definition
    2347 | #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK 0x400
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1028: warning: "SRBM_STATUS__IH_BUSY_MASK" redefined
    1028 | #define SRBM_STATUS__IH_BUSY_MASK 0x00020000L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2346: note: this is the location of the previous definition
    2346 | #define SRBM_STATUS__IH_BUSY_MASK 0x20000
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1032: warning: "SRBM_STATUS__MCB_BUSY_MASK" redefined
    1032 | #define SRBM_STATUS__MCB_BUSY_MASK 0x00000200L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2435: note: this is the location of the previous definition
    2435 | #define SRBM_STATUS__MCB_BUSY_MASK 0x200
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1033: warning: "SRBM_STATUS__MCB_BUSY__SHIFT" redefined
    1033 | #define SRBM_STATUS__MCB_BUSY__SHIFT 0x00000009
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2436: note: this is the location of the previous definition
    2436 | #define SRBM_STATUS__MCB_BUSY__SHIFT 0x9
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1034: warning: "SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK" redefined
    1034 | #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x00000400L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2437: note: this is the location of the previous definition
    2437 | #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x400
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1035: warning: "SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT" redefined
    1035 | #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0x0000000a
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2438: note: this is the location of the previous definition
    2438 | #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0xa
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1036: warning: "SRBM_STATUS__MCC_BUSY_MASK" redefined
    1036 | #define SRBM_STATUS__MCC_BUSY_MASK 0x00000800L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2439: note: this is the location of the previous definition
    2439 | #define SRBM_STATUS__MCC_BUSY_MASK 0x800
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1037: warning: "SRBM_STATUS__MCC_BUSY__SHIFT" redefined
    1037 | #define SRBM_STATUS__MCC_BUSY__SHIFT 0x0000000b
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2440: note: this is the location of the previous definition
    2440 | #define SRBM_STATUS__MCC_BUSY__SHIFT 0xb
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1038: warning: "SRBM_STATUS__MCD_BUSY_MASK" redefined
    1038 | #define SRBM_STATUS__MCD_BUSY_MASK 0x00001000L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2441: note: this is the location of the previous definition
    2441 | #define SRBM_STATUS__MCD_BUSY_MASK 0x1000
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1039: warning: "SRBM_STATUS__MCD_BUSY__SHIFT" redefined
    1039 | #define SRBM_STATUS__MCD_BUSY__SHIFT 0x0000000c
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2442: note: this is the location of the previous definition
    2442 | #define SRBM_STATUS__MCD_BUSY__SHIFT 0xc
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1048: warning: "SRBM_STATUS__VMC_BUSY_MASK" redefined
    1048 | #define SRBM_STATUS__VMC_BUSY_MASK 0x00000100L
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2443: note: this is the location of the previous definition
    2443 | #define SRBM_STATUS__VMC_BUSY_MASK 0x100
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:35:
>> drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h:1049: warning: "SRBM_STATUS__VMC_BUSY__SHIFT" redefined
    1049 | #define SRBM_STATUS__VMC_BUSY__SHIFT 0x00000008
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:29:
   drivers/gpu/drm/amd/amdgpu/sid.h:2444: note: this is the location of the previous definition
    2444 | #define SRBM_STATUS__VMC_BUSY__SHIFT 0x8
         | 
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c:27:
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

vim +/CC_DRM_ID_STRAPS__ATI_REV_ID_MASK +26 drivers/gpu/drm/amd/amdgpu/../include/asic_reg/oss/oss_1_0_sh_mask.h

de2bdb3dcf9228 Tom St Denis 2016-10-26    25  
de2bdb3dcf9228 Tom St Denis 2016-10-26   @26  #define CC_DRM_ID_STRAPS__ATI_REV_ID_MASK 0xf0000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   @27  #define CC_DRM_ID_STRAPS__ATI_REV_ID__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26    28  #define CC_DRM_ID_STRAPS__DEVICE_ID_MASK 0x000ffff0L
de2bdb3dcf9228 Tom St Denis 2016-10-26    29  #define CC_DRM_ID_STRAPS__DEVICE_ID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26    30  #define CC_DRM_ID_STRAPS__MAJOR_REV_ID_MASK 0x00f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    31  #define CC_DRM_ID_STRAPS__MAJOR_REV_ID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26    32  #define CC_DRM_ID_STRAPS__MINOR_REV_ID_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    33  #define CC_DRM_ID_STRAPS__MINOR_REV_ID__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26    34  #define CC_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26    35  #define CC_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26    36  #define CLIENT0_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    37  #define CLIENT0_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    38  #define CLIENT0_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    39  #define CLIENT0_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    40  #define CLIENT0_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    41  #define CLIENT0_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    42  #define CLIENT0_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    43  #define CLIENT0_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    44  #define CLIENT0_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    45  #define CLIENT0_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    46  #define CLIENT0_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    47  #define CLIENT0_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    48  #define CLIENT0_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    49  #define CLIENT0_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    50  #define CLIENT0_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    51  #define CLIENT0_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    52  #define CLIENT0_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    53  #define CLIENT0_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    54  #define CLIENT0_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    55  #define CLIENT0_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    56  #define CLIENT0_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    57  #define CLIENT0_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    58  #define CLIENT0_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    59  #define CLIENT0_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    60  #define CLIENT0_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    61  #define CLIENT0_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    62  #define CLIENT0_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    63  #define CLIENT0_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    64  #define CLIENT0_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    65  #define CLIENT0_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    66  #define CLIENT0_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    67  #define CLIENT0_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    68  #define CLIENT1_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    69  #define CLIENT1_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    70  #define CLIENT1_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    71  #define CLIENT1_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    72  #define CLIENT1_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    73  #define CLIENT1_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    74  #define CLIENT1_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    75  #define CLIENT1_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    76  #define CLIENT1_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    77  #define CLIENT1_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    78  #define CLIENT1_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    79  #define CLIENT1_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    80  #define CLIENT1_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    81  #define CLIENT1_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    82  #define CLIENT1_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    83  #define CLIENT1_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    84  #define CLIENT1_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    85  #define CLIENT1_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    86  #define CLIENT1_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    87  #define CLIENT1_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    88  #define CLIENT1_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    89  #define CLIENT1_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    90  #define CLIENT1_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    91  #define CLIENT1_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    92  #define CLIENT1_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    93  #define CLIENT1_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    94  #define CLIENT1_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    95  #define CLIENT1_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    96  #define CLIENT1_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    97  #define CLIENT1_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26    98  #define CLIENT1_PORT_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26    99  #define CLIENT1_PORT_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   100  #define CLIENT2_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   101  #define CLIENT2_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   102  #define CLIENT2_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   103  #define CLIENT2_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   104  #define CLIENT2_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   105  #define CLIENT2_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   106  #define CLIENT2_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   107  #define CLIENT2_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   108  #define CLIENT2_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   109  #define CLIENT2_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   110  #define CLIENT2_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   111  #define CLIENT2_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   112  #define CLIENT2_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   113  #define CLIENT2_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   114  #define CLIENT2_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   115  #define CLIENT2_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   116  #define CLIENT2_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   117  #define CLIENT2_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   118  #define CLIENT2_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   119  #define CLIENT2_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   120  #define CLIENT2_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   121  #define CLIENT2_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   122  #define CLIENT2_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   123  #define CLIENT2_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   124  #define CLIENT2_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   125  #define CLIENT2_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   126  #define CLIENT2_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   127  #define CLIENT2_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   128  #define CLIENT2_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   129  #define CLIENT2_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   130  #define CLIENT2_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   131  #define CLIENT2_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   132  #define CLIENT3_BM__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   133  #define CLIENT3_BM__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   134  #define CLIENT3_CD0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   135  #define CLIENT3_CD0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   136  #define CLIENT3_CD1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   137  #define CLIENT3_CD1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   138  #define CLIENT3_CD2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   139  #define CLIENT3_CD2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   140  #define CLIENT3_CD3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   141  #define CLIENT3_CD3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   142  #define CLIENT3_CK0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   143  #define CLIENT3_CK0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   144  #define CLIENT3_CK1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   145  #define CLIENT3_CK1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   146  #define CLIENT3_CK2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   147  #define CLIENT3_CK2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   148  #define CLIENT3_CK3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   149  #define CLIENT3_CK3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   150  #define CLIENT3_K0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   151  #define CLIENT3_K0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   152  #define CLIENT3_K1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   153  #define CLIENT3_K1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   154  #define CLIENT3_K2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   155  #define CLIENT3_K2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   156  #define CLIENT3_K3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   157  #define CLIENT3_K3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   158  #define CLIENT3_OFFSET_HI__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   159  #define CLIENT3_OFFSET_HI__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   160  #define CLIENT3_OFFSET__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   161  #define CLIENT3_OFFSET__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   162  #define CLIENT3_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   163  #define CLIENT3_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   164  #define CP_CONFIG__CP_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   165  #define CP_CONFIG__CP_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   166  #define CP_CONFIG__CP_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   167  #define CP_CONFIG__CP_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   168  #define DC_TEST_DEBUG_DATA__DC_TEST_DEBUG_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   169  #define DC_TEST_DEBUG_DATA__DC_TEST_DEBUG_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   170  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_INDEX_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   171  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   172  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_WRITE_EN_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   173  #define DC_TEST_DEBUG_INDEX__DC_TEST_DEBUG_WRITE_EN__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   174  #define DH_TEST__DH_TEST_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   175  #define DH_TEST__DH_TEST__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   176  #define EXP0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   177  #define EXP0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   178  #define EXP1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   179  #define EXP1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   180  #define EXP2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   181  #define EXP2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   182  #define EXP3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   183  #define EXP3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   184  #define EXP4__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   185  #define EXP4__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   186  #define EXP5__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   187  #define EXP5__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   188  #define EXP6__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   189  #define EXP6__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   190  #define EXP7__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   191  #define EXP7__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   192  #define GC_USER_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   193  #define GC_USER_SYS_RB_BACKEND_DISABLE__BACKEND_DISABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   194  #define HDP_ADDR_CONFIG__BANK_INTERLEAVE_SIZE_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   195  #define HDP_ADDR_CONFIG__BANK_INTERLEAVE_SIZE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   196  #define HDP_ADDR_CONFIG__MULTI_GPU_TILE_SIZE_MASK 0x03000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   197  #define HDP_ADDR_CONFIG__MULTI_GPU_TILE_SIZE__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   198  #define HDP_ADDR_CONFIG__NUM_GPUS_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   199  #define HDP_ADDR_CONFIG__NUM_GPUS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   200  #define HDP_ADDR_CONFIG__NUM_LOWER_PIPES_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   201  #define HDP_ADDR_CONFIG__NUM_LOWER_PIPES__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   202  #define HDP_ADDR_CONFIG__NUM_PIPES_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   203  #define HDP_ADDR_CONFIG__NUM_PIPES__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   204  #define HDP_ADDR_CONFIG__NUM_SHADER_ENGINES_MASK 0x00003000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   205  #define HDP_ADDR_CONFIG__NUM_SHADER_ENGINES__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   206  #define HDP_ADDR_CONFIG__PIPE_INTERLEAVE_SIZE_MASK 0x00000070L
de2bdb3dcf9228 Tom St Denis 2016-10-26   207  #define HDP_ADDR_CONFIG__PIPE_INTERLEAVE_SIZE__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   208  #define HDP_ADDR_CONFIG__ROW_SIZE_MASK 0x30000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   209  #define HDP_ADDR_CONFIG__ROW_SIZE__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   210  #define HDP_ADDR_CONFIG__SHADER_ENGINE_TILE_SIZE_MASK 0x00070000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   211  #define HDP_ADDR_CONFIG__SHADER_ENGINE_TILE_SIZE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   212  #define HDP_DEBUG0__HDP_DEBUG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   213  #define HDP_DEBUG1__HDP_DEBUG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   214  #define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   215  #define HDP_HOST_PATH_CNTL__ALL_SURFACES_DIS__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   216  #define HDP_HOST_PATH_CNTL__BIF_RDRET_CREDIT_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   217  #define HDP_HOST_PATH_CNTL__BIF_RDRET_CREDIT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   218  #define HDP_HOST_PATH_CNTL__CACHE_INVALIDATE_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   219  #define HDP_HOST_PATH_CNTL__CACHE_INVALIDATE__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   220  #define HDP_HOST_PATH_CNTL__CLOCK_GATING_DIS_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   221  #define HDP_HOST_PATH_CNTL__CLOCK_GATING_DIS__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   222  #define HDP_HOST_PATH_CNTL__LIN_RD_CACHE_DIS_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   223  #define HDP_HOST_PATH_CNTL__LIN_RD_CACHE_DIS__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   224  #define HDP_HOST_PATH_CNTL__MC_WRREQ_CREDIT_MASK 0x000001f8L
de2bdb3dcf9228 Tom St Denis 2016-10-26   225  #define HDP_HOST_PATH_CNTL__MC_WRREQ_CREDIT__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   226  #define HDP_HOST_PATH_CNTL__RD_STALL_TIMER_MASK 0x00001800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   227  #define HDP_HOST_PATH_CNTL__RD_STALL_TIMER__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   228  #define HDP_HOST_PATH_CNTL__REG_CLK_ENABLE_COUNT_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   229  #define HDP_HOST_PATH_CNTL__REG_CLK_ENABLE_COUNT__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   230  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   231  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_EN__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   232  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER_MASK 0x00180000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   233  #define HDP_HOST_PATH_CNTL__WRITE_COMBINE_TIMER__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   234  #define HDP_HOST_PATH_CNTL__WRITE_THROUGH_CACHE_DIS_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   235  #define HDP_HOST_PATH_CNTL__WRITE_THROUGH_CACHE_DIS__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   236  #define HDP_HOST_PATH_CNTL__WR_STALL_TIMER_MASK 0x00000600L
de2bdb3dcf9228 Tom St Denis 2016-10-26   237  #define HDP_HOST_PATH_CNTL__WR_STALL_TIMER__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   238  #define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   239  #define HDP_LAST_SURFACE_HIT__LAST_SURFACE_HIT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   240  #define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   241  #define HDP_MEMIO_ADDR__MEMIO_ADDR_LOWER__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   242  #define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER_MASK 0x00003f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   243  #define HDP_MEMIO_CNTL__MEMIO_ADDR_UPPER__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   244  #define HDP_MEMIO_CNTL__MEMIO_BE_MASK 0x0000003cL
de2bdb3dcf9228 Tom St Denis 2016-10-26   245  #define HDP_MEMIO_CNTL__MEMIO_BE__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   246  #define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   247  #define HDP_MEMIO_CNTL__MEMIO_CLR_RD_ERROR__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   248  #define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   249  #define HDP_MEMIO_CNTL__MEMIO_CLR_WR_ERROR__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   250  #define HDP_MEMIO_CNTL__MEMIO_OP_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   251  #define HDP_MEMIO_CNTL__MEMIO_OP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   252  #define HDP_MEMIO_CNTL__MEMIO_RD_STROBE_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   253  #define HDP_MEMIO_CNTL__MEMIO_RD_STROBE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   254  #define HDP_MEMIO_CNTL__MEMIO_SEND_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   255  #define HDP_MEMIO_CNTL__MEMIO_SEND__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   256  #define HDP_MEMIO_CNTL__MEMIO_WR_STROBE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   257  #define HDP_MEMIO_CNTL__MEMIO_WR_STROBE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   258  #define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   259  #define HDP_MEMIO_RD_DATA__MEMIO_RD_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   260  #define HDP_MEMIO_STATUS__MEMIO_RD_ERROR_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   261  #define HDP_MEMIO_STATUS__MEMIO_RD_ERROR__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   262  #define HDP_MEMIO_STATUS__MEMIO_RD_STATUS_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   263  #define HDP_MEMIO_STATUS__MEMIO_RD_STATUS__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   264  #define HDP_MEMIO_STATUS__MEMIO_WR_ERROR_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   265  #define HDP_MEMIO_STATUS__MEMIO_WR_ERROR__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   266  #define HDP_MEMIO_STATUS__MEMIO_WR_STATUS_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   267  #define HDP_MEMIO_STATUS__MEMIO_WR_STATUS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   268  #define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   269  #define HDP_MEMIO_WR_DATA__MEMIO_WR_DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   270  #define HDP_MEM_POWER_LS__LS_ENABLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   271  #define HDP_MEM_POWER_LS__LS_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   272  #define HDP_MEM_POWER_LS__LS_HOLD_MASK 0x00001f80L
de2bdb3dcf9228 Tom St Denis 2016-10-26   273  #define HDP_MEM_POWER_LS__LS_HOLD__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   274  #define HDP_MEM_POWER_LS__LS_SETUP_MASK 0x0000007eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   275  #define HDP_MEM_POWER_LS__LS_SETUP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   276  #define HDP_MISC_CNTL__ADDRLIB_LINEAR_BYPASS_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   277  #define HDP_MISC_CNTL__ADDRLIB_LINEAR_BYPASS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   278  #define HDP_MISC_CNTL__FED_ENABLE_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   279  #define HDP_MISC_CNTL__FED_ENABLE__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   280  #define HDP_MISC_CNTL__FLUSH_INVALIDATE_CACHE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   281  #define HDP_MISC_CNTL__FLUSH_INVALIDATE_CACHE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   282  #define HDP_MISC_CNTL__HDP_BIF_RDRET_CREDIT_MASK 0x00000780L
de2bdb3dcf9228 Tom St Denis 2016-10-26   283  #define HDP_MISC_CNTL__HDP_BIF_RDRET_CREDIT__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   284  #define HDP_MISC_CNTL__MC_RDREQ_CREDIT_MASK 0x0007e000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   285  #define HDP_MISC_CNTL__MC_RDREQ_CREDIT__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   286  #define HDP_MISC_CNTL__MULTIPLE_READS_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   287  #define HDP_MISC_CNTL__MULTIPLE_READS__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   288  #define HDP_MISC_CNTL__NO_SPLIT_ARRAY_LINEAR_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   289  #define HDP_MISC_CNTL__NO_SPLIT_ARRAY_LINEAR__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   290  #define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   291  #define HDP_MISC_CNTL__OUTSTANDING_WRITE_COUNT_1024__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   292  #define HDP_MISC_CNTL__READ_CACHE_INVALIDATE_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   293  #define HDP_MISC_CNTL__READ_CACHE_INVALIDATE__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   294  #define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   295  #define HDP_MISC_CNTL__SIMULTANEOUS_READS_WRITES__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   296  #define HDP_MISC_CNTL__VM_ID_MASK 0x0000001eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   297  #define HDP_MISC_CNTL__VM_ID__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   298  #define HDP_NONSURFACE_BASE__NONSURF_BASE_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   299  #define HDP_NONSURFACE_BASE__NONSURF_BASE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   300  #define HDP_NONSURFACE_INFO__NONSURF_ADDR_TYPE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   301  #define HDP_NONSURFACE_INFO__NONSURF_ADDR_TYPE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   302  #define HDP_NONSURFACE_INFO__NONSURF_ARRAY_MODE_MASK 0x0000001eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   303  #define HDP_NONSURFACE_INFO__NONSURF_ARRAY_MODE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   304  #define HDP_NONSURFACE_INFO__NONSURF_BANK_HEIGHT_MASK 0x03000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   305  #define HDP_NONSURFACE_INFO__NONSURF_BANK_HEIGHT__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   306  #define HDP_NONSURFACE_INFO__NONSURF_BANK_WIDTH_MASK 0x00c00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   307  #define HDP_NONSURFACE_INFO__NONSURF_BANK_WIDTH__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   308  #define HDP_NONSURFACE_INFO__NONSURF_ENDIAN_MASK 0x00000060L
de2bdb3dcf9228 Tom St Denis 2016-10-26   309  #define HDP_NONSURFACE_INFO__NONSURF_ENDIAN__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   310  #define HDP_NONSURFACE_INFO__NONSURF_MACRO_TILE_ASPECT_MASK 0x0c000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   311  #define HDP_NONSURFACE_INFO__NONSURF_MACRO_TILE_ASPECT__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   312  #define HDP_NONSURFACE_INFO__NONSURF_MICRO_TILE_MODE_MASK 0x30000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   313  #define HDP_NONSURFACE_INFO__NONSURF_MICRO_TILE_MODE__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   314  #define HDP_NONSURFACE_INFO__NONSURF_NUM_BANKS_MASK 0x00300000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   315  #define HDP_NONSURFACE_INFO__NONSURF_NUM_BANKS__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   316  #define HDP_NONSURFACE_INFO__NONSURF_PIXEL_SIZE_MASK 0x00000380L
de2bdb3dcf9228 Tom St Denis 2016-10-26   317  #define HDP_NONSURFACE_INFO__NONSURF_PIXEL_SIZE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   318  #define HDP_NONSURFACE_INFO__NONSURF_PRIV_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   319  #define HDP_NONSURFACE_INFO__NONSURF_PRIV__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   320  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_NUM_MASK 0x00001c00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   321  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_NUM__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   322  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_SIZE_MASK 0x00006000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   323  #define HDP_NONSURFACE_INFO__NONSURF_SAMPLE_SIZE__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   324  #define HDP_NONSURFACE_INFO__NONSURF_SLICE_TILE_MAX_MSB_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   325  #define HDP_NONSURFACE_INFO__NONSURF_SLICE_TILE_MAX_MSB__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   326  #define HDP_NONSURFACE_INFO__NONSURF_TILE_COMPACT_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   327  #define HDP_NONSURFACE_INFO__NONSURF_TILE_COMPACT__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   328  #define HDP_NONSURFACE_INFO__NONSURF_TILE_SPLIT_MASK 0x000e0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   329  #define HDP_NONSURFACE_INFO__NONSURF_TILE_SPLIT__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   330  #define HDP_NONSURFACE_PREFETCH__NONSURF_PIPE_CONFIG_MASK 0xf8000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   331  #define HDP_NONSURFACE_PREFETCH__NONSURF_PIPE_CONFIG__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   332  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_DIR_MASK 0x00000038L
de2bdb3dcf9228 Tom St Denis 2016-10-26   333  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_DIR__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   334  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_MAX_Z_MASK 0x000ffe00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   335  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_MAX_Z__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   336  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_NUM_MASK 0x000001c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   337  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_NUM__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   338  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_PRI_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   339  #define HDP_NONSURFACE_PREFETCH__NONSURF_PREFETCH_PRI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   340  #define HDP_NONSURFACE_SIZE__NONSURF_PITCH_TILE_MAX_MASK 0x000007ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   341  #define HDP_NONSURFACE_SIZE__NONSURF_PITCH_TILE_MAX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   342  #define HDP_NONSURFACE_SIZE__NONSURF_SLICE_TILE_MAX_MASK 0xfffff800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   343  #define HDP_NONSURFACE_SIZE__NONSURF_SLICE_TILE_MAX__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   344  #define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   345  #define HDP_NONSURF_FLAGS_CLR__NONSURF_READ_FLAG_CLR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   346  #define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   347  #define HDP_NONSURF_FLAGS_CLR__NONSURF_WRITE_FLAG_CLR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   348  #define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   349  #define HDP_NONSURF_FLAGS__NONSURF_READ_FLAG__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   350  #define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   351  #define HDP_NONSURF_FLAGS__NONSURF_WRITE_FLAG__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   352  #define HDP_OUTSTANDING_REQ__READ_REQ_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   353  #define HDP_OUTSTANDING_REQ__READ_REQ__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   354  #define HDP_OUTSTANDING_REQ__WRITE_REQ_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   355  #define HDP_OUTSTANDING_REQ__WRITE_REQ__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   356  #define HDP_SC_MULTI_CHIP_CNTL__LOG2_NUM_CHIPS_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   357  #define HDP_SC_MULTI_CHIP_CNTL__LOG2_NUM_CHIPS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   358  #define HDP_SC_MULTI_CHIP_CNTL__MULTI_CHIP_TILE_SIZE_MASK 0x00000018L
de2bdb3dcf9228 Tom St Denis 2016-10-26   359  #define HDP_SC_MULTI_CHIP_CNTL__MULTI_CHIP_TILE_SIZE__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   360  #define HDP_SW_SEMAPHORE__SW_SEMAPHORE_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   361  #define HDP_SW_SEMAPHORE__SW_SEMAPHORE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   362  #define HDP_TILING_CONFIG__BANK_SWAPS_MASK 0x00003800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   363  #define HDP_TILING_CONFIG__BANK_SWAPS__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   364  #define HDP_TILING_CONFIG__BANK_TILING_MASK 0x00000030L
de2bdb3dcf9228 Tom St Denis 2016-10-26   365  #define HDP_TILING_CONFIG__BANK_TILING__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   366  #define HDP_TILING_CONFIG__GROUP_SIZE_MASK 0x000000c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   367  #define HDP_TILING_CONFIG__GROUP_SIZE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   368  #define HDP_TILING_CONFIG__PIPE_TILING_MASK 0x0000000eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   369  #define HDP_TILING_CONFIG__PIPE_TILING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   370  #define HDP_TILING_CONFIG__ROW_TILING_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   371  #define HDP_TILING_CONFIG__ROW_TILING__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   372  #define HDP_TILING_CONFIG__SAMPLE_SPLIT_MASK 0x0000c000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   373  #define HDP_TILING_CONFIG__SAMPLE_SPLIT__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   374  #define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   375  #define HDP_XDP_BARS_ADDR_39_36__BAR0_ADDR_39_36__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   376  #define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   377  #define HDP_XDP_BARS_ADDR_39_36__BAR1_ADDR_39_36__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   378  #define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   379  #define HDP_XDP_BARS_ADDR_39_36__BAR2_ADDR_39_36__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   380  #define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36_MASK 0x0000f000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   381  #define HDP_XDP_BARS_ADDR_39_36__BAR3_ADDR_39_36__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   382  #define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   383  #define HDP_XDP_BARS_ADDR_39_36__BAR4_ADDR_39_36__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   384  #define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36_MASK 0x00f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   385  #define HDP_XDP_BARS_ADDR_39_36__BAR5_ADDR_39_36__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   386  #define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36_MASK 0x0f000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   387  #define HDP_XDP_BARS_ADDR_39_36__BAR6_ADDR_39_36__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   388  #define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36_MASK 0xf0000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   389  #define HDP_XDP_BARS_ADDR_39_36__BAR7_ADDR_39_36__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   390  #define HDP_XDP_BUSY_STS__BUSY_BITS_MASK 0x0003ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   391  #define HDP_XDP_BUSY_STS__BUSY_BITS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   392  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_0_ON_DELAY_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   393  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_0_ON_DELAY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   394  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_1_OFF_DELAY_MASK 0x00000ff0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   395  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_1_OFF_DELAY__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   396  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_2_RSVD_MASK 0x3ffff000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   397  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_2_RSVD__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   398  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_3_SOFT_CORE_OVERRIDE_MASK 0x40000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   399  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_3_SOFT_CORE_OVERRIDE__SHIFT 0x0000001e
de2bdb3dcf9228 Tom St Denis 2016-10-26   400  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_4_SOFT_REG_OVERRIDE_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   401  #define HDP_XDP_CGTT_BLK_CTRL__CGTT_BLK_CTRL_4_SOFT_REG_OVERRIDE__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   402  #define HDP_XDP_CHKN__CHKN_0_RSVD_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   403  #define HDP_XDP_CHKN__CHKN_0_RSVD__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   404  #define HDP_XDP_CHKN__CHKN_1_RSVD_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   405  #define HDP_XDP_CHKN__CHKN_1_RSVD__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   406  #define HDP_XDP_CHKN__CHKN_2_RSVD_MASK 0x00ff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   407  #define HDP_XDP_CHKN__CHKN_2_RSVD__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   408  #define HDP_XDP_CHKN__CHKN_3_RSVD_MASK 0xff000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   409  #define HDP_XDP_CHKN__CHKN_3_RSVD__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   410  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   411  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   412  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   413  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_BAR_NUM__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   414  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   415  #define HDP_XDP_D2H_BAR_UPDATE__D2H_BAR_UPDATE_FLUSH_NUM__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   416  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   417  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_ALTER_FLUSH_NUM__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26   418  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   419  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_FLUSH_NUM__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   420  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL_MASK 0x00000700L
de2bdb3dcf9228 Tom St Denis 2016-10-26   421  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ADDR_SEL__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   422  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   423  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_MBX_ENC_DATA__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   424  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   425  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_0__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   426  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   427  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_RSVD_1__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   428  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   429  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_HOST__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   430  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_SIDE_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   431  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_SEND_SIDE__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   432  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG_MASK 0x0000f800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   433  #define HDP_XDP_D2H_FLUSH__D2H_FLUSH_XPB_CLG__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   434  #define HDP_XDP_D2H_RSVD_10__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   435  #define HDP_XDP_D2H_RSVD_10__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   436  #define HDP_XDP_D2H_RSVD_11__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   437  #define HDP_XDP_D2H_RSVD_11__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   438  #define HDP_XDP_D2H_RSVD_12__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   439  #define HDP_XDP_D2H_RSVD_12__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   440  #define HDP_XDP_D2H_RSVD_13__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   441  #define HDP_XDP_D2H_RSVD_13__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   442  #define HDP_XDP_D2H_RSVD_14__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   443  #define HDP_XDP_D2H_RSVD_14__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   444  #define HDP_XDP_D2H_RSVD_15__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   445  #define HDP_XDP_D2H_RSVD_15__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   446  #define HDP_XDP_D2H_RSVD_16__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   447  #define HDP_XDP_D2H_RSVD_16__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   448  #define HDP_XDP_D2H_RSVD_17__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   449  #define HDP_XDP_D2H_RSVD_17__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   450  #define HDP_XDP_D2H_RSVD_18__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   451  #define HDP_XDP_D2H_RSVD_18__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   452  #define HDP_XDP_D2H_RSVD_19__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   453  #define HDP_XDP_D2H_RSVD_19__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   454  #define HDP_XDP_D2H_RSVD_20__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   455  #define HDP_XDP_D2H_RSVD_20__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   456  #define HDP_XDP_D2H_RSVD_21__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   457  #define HDP_XDP_D2H_RSVD_21__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   458  #define HDP_XDP_D2H_RSVD_22__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   459  #define HDP_XDP_D2H_RSVD_22__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   460  #define HDP_XDP_D2H_RSVD_23__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   461  #define HDP_XDP_D2H_RSVD_23__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   462  #define HDP_XDP_D2H_RSVD_24__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   463  #define HDP_XDP_D2H_RSVD_24__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   464  #define HDP_XDP_D2H_RSVD_25__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   465  #define HDP_XDP_D2H_RSVD_25__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   466  #define HDP_XDP_D2H_RSVD_26__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   467  #define HDP_XDP_D2H_RSVD_26__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   468  #define HDP_XDP_D2H_RSVD_27__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   469  #define HDP_XDP_D2H_RSVD_27__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   470  #define HDP_XDP_D2H_RSVD_28__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   471  #define HDP_XDP_D2H_RSVD_28__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   472  #define HDP_XDP_D2H_RSVD_29__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   473  #define HDP_XDP_D2H_RSVD_29__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   474  #define HDP_XDP_D2H_RSVD_30__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   475  #define HDP_XDP_D2H_RSVD_30__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   476  #define HDP_XDP_D2H_RSVD_31__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   477  #define HDP_XDP_D2H_RSVD_31__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   478  #define HDP_XDP_D2H_RSVD_32__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   479  #define HDP_XDP_D2H_RSVD_32__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   480  #define HDP_XDP_D2H_RSVD_33__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   481  #define HDP_XDP_D2H_RSVD_33__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   482  #define HDP_XDP_D2H_RSVD_34__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   483  #define HDP_XDP_D2H_RSVD_34__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   484  #define HDP_XDP_D2H_RSVD_3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   485  #define HDP_XDP_D2H_RSVD_3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   486  #define HDP_XDP_D2H_RSVD_4__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   487  #define HDP_XDP_D2H_RSVD_4__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   488  #define HDP_XDP_D2H_RSVD_5__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   489  #define HDP_XDP_D2H_RSVD_5__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   490  #define HDP_XDP_D2H_RSVD_6__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   491  #define HDP_XDP_D2H_RSVD_6__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   492  #define HDP_XDP_D2H_RSVD_7__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   493  #define HDP_XDP_D2H_RSVD_7__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   494  #define HDP_XDP_D2H_RSVD_8__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   495  #define HDP_XDP_D2H_RSVD_8__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   496  #define HDP_XDP_D2H_RSVD_9__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   497  #define HDP_XDP_D2H_RSVD_9__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   498  #define HDP_XDP_DBG_ADDR__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   499  #define HDP_XDP_DBG_ADDR__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   500  #define HDP_XDP_DBG_ADDR__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   501  #define HDP_XDP_DBG_ADDR__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   502  #define HDP_XDP_DBG_DATA__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   503  #define HDP_XDP_DBG_DATA__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   504  #define HDP_XDP_DBG_DATA__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   505  #define HDP_XDP_DBG_DATA__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   506  #define HDP_XDP_DBG_MASK__CTRL_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   507  #define HDP_XDP_DBG_MASK__CTRL__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   508  #define HDP_XDP_DBG_MASK__STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   509  #define HDP_XDP_DBG_MASK__STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   510  #define HDP_XDP_DIRECT2HDP_FIRST__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   511  #define HDP_XDP_DIRECT2HDP_FIRST__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   512  #define HDP_XDP_DIRECT2HDP_LAST__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   513  #define HDP_XDP_DIRECT2HDP_LAST__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   514  #define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   515  #define HDP_XDP_FLUSH_ARMED_STS__FLUSH_ARMED_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   516  #define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS_MASK 0x03ffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   517  #define HDP_XDP_FLUSH_CNTR0_STS__FLUSH_CNTR0_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   518  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   519  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_INVERSE_PEER_TAG_MATCHING__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   520  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN_MASK 0x00002000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   521  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_P2P_RD_EN__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   522  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_SYS_FIFO_DEPTH_OVERRIDE_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   523  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_SYS_FIFO_DEPTH_OVERRIDE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   524  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_XDP_FIFO_DEPTH_OVERRIDE_MASK 0x00000fc0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   525  #define HDP_XDP_HDP_IPH_CFG__HDP_IPH_CFG_XDP_FIFO_DEPTH_OVERRIDE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   526  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_PRIV_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   527  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_PRIV__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   528  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   529  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   530  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   531  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   532  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   533  #define HDP_XDP_HDP_MBX_MC_CFG__HDP_MBX_MC_CFG_TAP_WRREQ_VMID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   534  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_PRIV_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   535  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_PRIV__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   536  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   537  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   538  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   539  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   540  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_VMID_MASK 0x07800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   541  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_HST_TAP_WRREQ_VMID__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   542  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_MC_STALL_ON_BUF_FULL_MASK_MASK 0x00700000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   543  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_MC_STALL_ON_BUF_FULL_MASK__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   544  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_PRIV_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   545  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_PRIV__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   546  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_SWAP_MASK 0x00000060L
de2bdb3dcf9228 Tom St Denis 2016-10-26   547  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_SWAP__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   548  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_TRAN_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   549  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_TRAN__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   550  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_VMID_MASK 0x78000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   551  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_SID_TAP_WRREQ_VMID__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   552  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH_MASK 0x000fc000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   553  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XDP_HIGHER_PRI_THRESH__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   554  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XL8R_WRREQ_CRD_OVERRIDE_MASK 0x00003f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   555  #define HDP_XDP_HDP_MC_CFG__HDP_MC_CFG_XL8R_WRREQ_CRD_OVERRIDE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   556  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   557  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_EN__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   558  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   559  #define HDP_XDP_HST_CFG__HST_CFG_WR_COMBINE_TIMER__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   560  #define HDP_XDP_P2P_BAR0__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   561  #define HDP_XDP_P2P_BAR0__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   562  #define HDP_XDP_P2P_BAR0__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   563  #define HDP_XDP_P2P_BAR0__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   564  #define HDP_XDP_P2P_BAR0__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   565  #define HDP_XDP_P2P_BAR0__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   566  #define HDP_XDP_P2P_BAR1__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   567  #define HDP_XDP_P2P_BAR1__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   568  #define HDP_XDP_P2P_BAR1__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   569  #define HDP_XDP_P2P_BAR1__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   570  #define HDP_XDP_P2P_BAR1__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   571  #define HDP_XDP_P2P_BAR1__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   572  #define HDP_XDP_P2P_BAR2__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   573  #define HDP_XDP_P2P_BAR2__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   574  #define HDP_XDP_P2P_BAR2__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   575  #define HDP_XDP_P2P_BAR2__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   576  #define HDP_XDP_P2P_BAR2__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   577  #define HDP_XDP_P2P_BAR2__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   578  #define HDP_XDP_P2P_BAR3__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   579  #define HDP_XDP_P2P_BAR3__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   580  #define HDP_XDP_P2P_BAR3__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   581  #define HDP_XDP_P2P_BAR3__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   582  #define HDP_XDP_P2P_BAR3__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   583  #define HDP_XDP_P2P_BAR3__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   584  #define HDP_XDP_P2P_BAR4__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   585  #define HDP_XDP_P2P_BAR4__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   586  #define HDP_XDP_P2P_BAR4__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   587  #define HDP_XDP_P2P_BAR4__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   588  #define HDP_XDP_P2P_BAR4__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   589  #define HDP_XDP_P2P_BAR4__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   590  #define HDP_XDP_P2P_BAR5__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   591  #define HDP_XDP_P2P_BAR5__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   592  #define HDP_XDP_P2P_BAR5__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   593  #define HDP_XDP_P2P_BAR5__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   594  #define HDP_XDP_P2P_BAR5__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   595  #define HDP_XDP_P2P_BAR5__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   596  #define HDP_XDP_P2P_BAR6__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   597  #define HDP_XDP_P2P_BAR6__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   598  #define HDP_XDP_P2P_BAR6__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   599  #define HDP_XDP_P2P_BAR6__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   600  #define HDP_XDP_P2P_BAR6__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   601  #define HDP_XDP_P2P_BAR6__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   602  #define HDP_XDP_P2P_BAR7__ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   603  #define HDP_XDP_P2P_BAR7__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   604  #define HDP_XDP_P2P_BAR7__FLUSH_MASK 0x000f0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   605  #define HDP_XDP_P2P_BAR7__FLUSH__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   606  #define HDP_XDP_P2P_BAR7__VALID_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   607  #define HDP_XDP_P2P_BAR7__VALID__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   608  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   609  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_ADDR_SIZE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   610  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM_MASK 0x00000030L
de2bdb3dcf9228 Tom St Denis 2016-10-26   611  #define HDP_XDP_P2P_BAR_CFG__P2P_BAR_CFG_BAR_FROM__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   612  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   613  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   614  #define HDP_XDP_P2P_MBX_ADDR0__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   615  #define HDP_XDP_P2P_MBX_ADDR0__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   616  #define HDP_XDP_P2P_MBX_ADDR0__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   617  #define HDP_XDP_P2P_MBX_ADDR0__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   618  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   619  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   620  #define HDP_XDP_P2P_MBX_ADDR1__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   621  #define HDP_XDP_P2P_MBX_ADDR1__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   622  #define HDP_XDP_P2P_MBX_ADDR1__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   623  #define HDP_XDP_P2P_MBX_ADDR1__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   624  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   625  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   626  #define HDP_XDP_P2P_MBX_ADDR2__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   627  #define HDP_XDP_P2P_MBX_ADDR2__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   628  #define HDP_XDP_P2P_MBX_ADDR2__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   629  #define HDP_XDP_P2P_MBX_ADDR2__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   630  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   631  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   632  #define HDP_XDP_P2P_MBX_ADDR3__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   633  #define HDP_XDP_P2P_MBX_ADDR3__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   634  #define HDP_XDP_P2P_MBX_ADDR3__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   635  #define HDP_XDP_P2P_MBX_ADDR3__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   636  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   637  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   638  #define HDP_XDP_P2P_MBX_ADDR4__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   639  #define HDP_XDP_P2P_MBX_ADDR4__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   640  #define HDP_XDP_P2P_MBX_ADDR4__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   641  #define HDP_XDP_P2P_MBX_ADDR4__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   642  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   643  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   644  #define HDP_XDP_P2P_MBX_ADDR5__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   645  #define HDP_XDP_P2P_MBX_ADDR5__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   646  #define HDP_XDP_P2P_MBX_ADDR5__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   647  #define HDP_XDP_P2P_MBX_ADDR5__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   648  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36_MASK 0x01e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   649  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_39_36__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   650  #define HDP_XDP_P2P_MBX_ADDR6__ADDR_MASK 0x001ffffeL
de2bdb3dcf9228 Tom St Denis 2016-10-26   651  #define HDP_XDP_P2P_MBX_ADDR6__ADDR__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   652  #define HDP_XDP_P2P_MBX_ADDR6__VALID_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   653  #define HDP_XDP_P2P_MBX_ADDR6__VALID__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   654  #define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET_MASK 0x00003fffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   655  #define HDP_XDP_P2P_MBX_OFFSET__P2P_MBX_OFFSET__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   656  #define HDP_XDP_SID_CFG__SID_CFG_FLNUM_MSB_SEL_MASK 0x00000018L
de2bdb3dcf9228 Tom St Denis 2016-10-26   657  #define HDP_XDP_SID_CFG__SID_CFG_FLNUM_MSB_SEL__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   658  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_EN_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   659  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_EN__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   660  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_TIMER_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   661  #define HDP_XDP_SID_CFG__SID_CFG_WR_COMBINE_TIMER__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   662  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_ENABLE_COUNT_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   663  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_ENABLE_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   664  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_GATING_DIS_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   665  #define HDP_XDP_SRBM_CFG__SRBM_CFG_REG_CLK_GATING_DIS__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   666  #define HDP_XDP_SRBM_CFG__SRBM_CFG_WAKE_DYN_CLK_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   667  #define HDP_XDP_SRBM_CFG__SRBM_CFG_WAKE_DYN_CLK__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   668  #define HDP_XDP_STICKY__STICKY_STS_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   669  #define HDP_XDP_STICKY__STICKY_STS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   670  #define HDP_XDP_STICKY__STICKY_W1C_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   671  #define HDP_XDP_STICKY__STICKY_W1C__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   672  #define HFS_SEED0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   673  #define HFS_SEED0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   674  #define HFS_SEED1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   675  #define HFS_SEED1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   676  #define HFS_SEED2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   677  #define HFS_SEED2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   678  #define HFS_SEED3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   679  #define HFS_SEED3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   680  #define IH_ADVFAULT_CNTL__NUM_FAULTS_DROPPED_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   681  #define IH_ADVFAULT_CNTL__NUM_FAULTS_DROPPED__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   682  #define IH_ADVFAULT_CNTL__WAIT_TIMER_MASK 0x3fff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   683  #define IH_ADVFAULT_CNTL__WAIT_TIMER__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   684  #define IH_ADVFAULT_CNTL__WATERMARK_ENABLE_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   685  #define IH_ADVFAULT_CNTL__WATERMARK_ENABLE__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   686  #define IH_ADVFAULT_CNTL__WATERMARK_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   687  #define IH_ADVFAULT_CNTL__WATERMARK_REACHED_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   688  #define IH_ADVFAULT_CNTL__WATERMARK_REACHED__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   689  #define IH_ADVFAULT_CNTL__WATERMARK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   690  #define IH_CNTL__CLIENT_FIFO_HIGHWATER_MASK 0x00000300L
de2bdb3dcf9228 Tom St Denis 2016-10-26   691  #define IH_CNTL__CLIENT_FIFO_HIGHWATER__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   692  #define IH_CNTL__ENABLE_INTR_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   693  #define IH_CNTL__ENABLE_INTR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   694  #define IH_CNTL__MC_FIFO_HIGHWATER_MASK 0x00007c00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   695  #define IH_CNTL__MC_FIFO_HIGHWATER__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   696  #define IH_CNTL__MC_SWAP_MASK 0x00000006L
de2bdb3dcf9228 Tom St Denis 2016-10-26   697  #define IH_CNTL__MC_SWAP__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   698  #define IH_CNTL__MC_TRAN_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   699  #define IH_CNTL__MC_TRAN__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   700  #define IH_CNTL__MC_VMID_MASK 0x1e000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   701  #define IH_CNTL__MC_VMID__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   702  #define IH_CNTL__MC_WR_CLEAN_CNT_MASK 0x01f00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   703  #define IH_CNTL__MC_WR_CLEAN_CNT__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   704  #define IH_CNTL__MC_WRREQ_CREDIT_MASK 0x000f8000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   705  #define IH_CNTL__MC_WRREQ_CREDIT__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   706  #define IH_CNTL__RPTR_REARM_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   707  #define IH_CNTL__RPTR_REARM__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   708  #define IH_LEVEL_STATUS__BIF_STATUS_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   709  #define IH_LEVEL_STATUS__BIF_STATUS__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   710  #define IH_LEVEL_STATUS__DC_STATUS_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   711  #define IH_LEVEL_STATUS__DC_STATUS__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   712  #define IH_LEVEL_STATUS__ROM_STATUS_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   713  #define IH_LEVEL_STATUS__ROM_STATUS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   714  #define IH_LEVEL_STATUS__SRBM_STATUS_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   715  #define IH_LEVEL_STATUS__SRBM_STATUS__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   716  #define IH_LEVEL_STATUS__XDMA_STATUS_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   717  #define IH_LEVEL_STATUS__XDMA_STATUS__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   718  #define IH_PERFCOUNTER0_RESULT__PERF_COUNT_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   719  #define IH_PERFCOUNTER0_RESULT__PERF_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   720  #define IH_PERFCOUNTER1_RESULT__PERF_COUNT_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   721  #define IH_PERFCOUNTER1_RESULT__PERF_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   722  #define IH_PERFMON_CNTL__CLEAR0_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   723  #define IH_PERFMON_CNTL__CLEAR0__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   724  #define IH_PERFMON_CNTL__CLEAR1_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   725  #define IH_PERFMON_CNTL__CLEAR1__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   726  #define IH_PERFMON_CNTL__ENABLE0_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   727  #define IH_PERFMON_CNTL__ENABLE0__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   728  #define IH_PERFMON_CNTL__ENABLE1_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   729  #define IH_PERFMON_CNTL__ENABLE1__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   730  #define IH_PERFMON_CNTL__PERF_SEL0_MASK 0x000000fcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   731  #define IH_PERFMON_CNTL__PERF_SEL0__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   732  #define IH_PERFMON_CNTL__PERF_SEL1_MASK 0x0000fc00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   733  #define IH_PERFMON_CNTL__PERF_SEL1__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   734  #define IH_RB_BASE__ADDR_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   735  #define IH_RB_BASE__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   736  #define IH_RB_CNTL__RB_ENABLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   737  #define IH_RB_CNTL__RB_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   738  #define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   739  #define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   740  #define IH_RB_CNTL__RB_GPU_TS_ENABLE_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   741  #define IH_RB_CNTL__RB_GPU_TS_ENABLE__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   742  #define IH_RB_CNTL__RB_SIZE_MASK 0x0000003eL
de2bdb3dcf9228 Tom St Denis 2016-10-26   743  #define IH_RB_CNTL__RB_SIZE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   744  #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   745  #define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   746  #define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   747  #define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   748  #define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   749  #define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   750  #define IH_RB_CNTL__WPTR_WRITEBACK_TIMER_MASK 0x00003e00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   751  #define IH_RB_CNTL__WPTR_WRITEBACK_TIMER__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   752  #define IH_RB_RPTR__OFFSET_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   753  #define IH_RB_RPTR__OFFSET__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   754  #define IH_RB_WPTR_ADDR_HI__ADDR_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   755  #define IH_RB_WPTR_ADDR_HI__ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   756  #define IH_RB_WPTR_ADDR_LO__ADDR_MASK 0xfffffffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   757  #define IH_RB_WPTR_ADDR_LO__ADDR__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   758  #define IH_RB_WPTR__OFFSET_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   759  #define IH_RB_WPTR__OFFSET__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   760  #define IH_RB_WPTR__RB_OVERFLOW_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   761  #define IH_RB_WPTR__RB_OVERFLOW__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   762  #define IH_STATUS__BIF_INTERRUPT_LINE_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   763  #define IH_STATUS__BIF_INTERRUPT_LINE__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   764  #define IH_STATUS__IDLE_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   765  #define IH_STATUS__IDLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   766  #define IH_STATUS__INPUT_IDLE_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   767  #define IH_STATUS__INPUT_IDLE__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   768  #define IH_STATUS__MC_WR_CLEAN_PENDING_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   769  #define IH_STATUS__MC_WR_CLEAN_PENDING__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   770  #define IH_STATUS__MC_WR_CLEAN_STALL_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   771  #define IH_STATUS__MC_WR_CLEAN_STALL__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   772  #define IH_STATUS__MC_WR_IDLE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   773  #define IH_STATUS__MC_WR_IDLE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   774  #define IH_STATUS__MC_WR_STALL_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   775  #define IH_STATUS__MC_WR_STALL__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   776  #define IH_STATUS__RB_FULL_DRAIN_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   777  #define IH_STATUS__RB_FULL_DRAIN__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   778  #define IH_STATUS__RB_FULL_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26   779  #define IH_STATUS__RB_FULL__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   780  #define IH_STATUS__RB_IDLE_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   781  #define IH_STATUS__RB_IDLE__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   782  #define IH_STATUS__RB_OVERFLOW_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   783  #define IH_STATUS__RB_OVERFLOW__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   784  #define KEFUSE0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   785  #define KEFUSE0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   786  #define KEFUSE1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   787  #define KEFUSE1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   788  #define KEFUSE2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   789  #define KEFUSE2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   790  #define KEFUSE3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   791  #define KEFUSE3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   792  #define KHFS0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   793  #define KHFS0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   794  #define KHFS1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   795  #define KHFS1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   796  #define KHFS2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   797  #define KHFS2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   798  #define KHFS3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   799  #define KHFS3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   800  #define KSESSION0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   801  #define KSESSION0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   802  #define KSESSION1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   803  #define KSESSION1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   804  #define KSESSION2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   805  #define KSESSION2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   806  #define KSESSION3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   807  #define KSESSION3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   808  #define KSIG0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   809  #define KSIG0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   810  #define KSIG1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   811  #define KSIG1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   812  #define KSIG2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   813  #define KSIG2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   814  #define KSIG3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   815  #define KSIG3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   816  #define LX0__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   817  #define LX0__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   818  #define LX1__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   819  #define LX1__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   820  #define LX2__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   821  #define LX2__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   822  #define LX3__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   823  #define LX3__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   824  #define RINGOSC_MASK__MASK_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   825  #define RINGOSC_MASK__MASK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   826  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT0_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   827  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT0__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   828  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT1_MASK 0x00000038L
de2bdb3dcf9228 Tom St Denis 2016-10-26   829  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT1__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26   830  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT2_MASK 0x000001c0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   831  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT2__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   832  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT3_MASK 0x00000e00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   833  #define SEM_MAILBOX_CLIENTCONFIG__CP_CLIENT3__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   834  #define SEM_MAILBOX_CLIENTCONFIG__UVD_CLIENT0_MASK 0x00038000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   835  #define SEM_MAILBOX_CLIENTCONFIG__UVD_CLIENT0__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   836  #define SEM_MAILBOX_CLIENTCONFIG__VCE_CLIENT0_MASK 0x00e00000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   837  #define SEM_MAILBOX_CLIENTCONFIG__VCE_CLIENT0__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   838  #define SEM_MAILBOX_CONTROL__HOSTPORT_ENABLE_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   839  #define SEM_MAILBOX_CONTROL__HOSTPORT_ENABLE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   840  #define SEM_MAILBOX_CONTROL__SIDEPORT_ENABLE_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   841  #define SEM_MAILBOX_CONTROL__SIDEPORT_ENABLE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   842  #define SEM_MAILBOX__HOSTPORT_MASK 0x0000ff00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   843  #define SEM_MAILBOX__HOSTPORT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   844  #define SEM_MAILBOX__SIDEPORT_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   845  #define SEM_MAILBOX__SIDEPORT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   846  #define SEM_MCIF_CONFIG__MC_REQ_SWAP_MASK 0x00000003L
de2bdb3dcf9228 Tom St Denis 2016-10-26   847  #define SEM_MCIF_CONFIG__MC_REQ_SWAP__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   848  #define SPU_PORT_STATUS__RESERVED_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   849  #define SPU_PORT_STATUS__RESERVED__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   850  #define SRBM_CAM_DATA__CAM_ADDR_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   851  #define SRBM_CAM_DATA__CAM_ADDR__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   852  #define SRBM_CAM_DATA__CAM_REMAPADDR_MASK 0xffff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   853  #define SRBM_CAM_DATA__CAM_REMAPADDR__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   854  #define SRBM_CAM_INDEX__CAM_INDEX_MASK 0x00000007L
de2bdb3dcf9228 Tom St Denis 2016-10-26   855  #define SRBM_CAM_INDEX__CAM_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   856  #define SRBM_CHIP_REVISION__CHIP_REVISION_MASK 0x000000ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   857  #define SRBM_CHIP_REVISION__CHIP_REVISION__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   858  #define SRBM_CNTL__COMBINE_SYSTEM_MC_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   859  #define SRBM_CNTL__COMBINE_SYSTEM_MC__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   860  #define SRBM_CNTL__PWR_REQUEST_HALT_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   861  #define SRBM_CNTL__PWR_REQUEST_HALT__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   862  #define SRBM_CNTL__READ_TIMEOUT_MASK 0x000003ffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   863  #define SRBM_CNTL__READ_TIMEOUT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   864  #define SRBM_DEBUG_CNTL__SRBM_DEBUG_INDEX_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   865  #define SRBM_DEBUG_CNTL__SRBM_DEBUG_INDEX__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   866  #define SRBM_DEBUG_DATA__DATA_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   867  #define SRBM_DEBUG_DATA__DATA__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   868  #define SRBM_DEBUG__DISABLE_READ_TIMEOUT_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   869  #define SRBM_DEBUG__DISABLE_READ_TIMEOUT__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   870  #define SRBM_DEBUG__IGNORE_RDY_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   871  #define SRBM_DEBUG__IGNORE_RDY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   872  #define SRBM_DEBUG__MC_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   873  #define SRBM_DEBUG__MC_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   874  #define SRBM_DEBUG_SNAPSHOT__BIF_RDY_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26   875  #define SRBM_DEBUG_SNAPSHOT__BIF_RDY__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26   876  #define SRBM_DEBUG_SNAPSHOT__DC_RDY_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   877  #define SRBM_DEBUG_SNAPSHOT__DC_RDY__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   878  #define SRBM_DEBUG__SNAPSHOT_FREE_CNTRS_MASK 0x00000004L
de2bdb3dcf9228 Tom St Denis 2016-10-26   879  #define SRBM_DEBUG__SNAPSHOT_FREE_CNTRS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   880  #define SRBM_DEBUG_SNAPSHOT__GRBM_RDY_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   881  #define SRBM_DEBUG_SNAPSHOT__GRBM_RDY__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   882  #define SRBM_DEBUG_SNAPSHOT__MCB_RDY_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   883  #define SRBM_DEBUG_SNAPSHOT__MCB_RDY__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   884  #define SRBM_DEBUG_SNAPSHOT__MCC0_RDY_MASK 0x10000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   885  #define SRBM_DEBUG_SNAPSHOT__MCC0_RDY__SHIFT 0x0000001c
de2bdb3dcf9228 Tom St Denis 2016-10-26   886  #define SRBM_DEBUG_SNAPSHOT__MCC1_RDY_MASK 0x08000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   887  #define SRBM_DEBUG_SNAPSHOT__MCC1_RDY__SHIFT 0x0000001b
de2bdb3dcf9228 Tom St Denis 2016-10-26   888  #define SRBM_DEBUG_SNAPSHOT__MCC2_RDY_MASK 0x04000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   889  #define SRBM_DEBUG_SNAPSHOT__MCC2_RDY__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   890  #define SRBM_DEBUG_SNAPSHOT__MCC3_RDY_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   891  #define SRBM_DEBUG_SNAPSHOT__MCC3_RDY__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   892  #define SRBM_DEBUG_SNAPSHOT__MCC4_RDY_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   893  #define SRBM_DEBUG_SNAPSHOT__MCC4_RDY__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   894  #define SRBM_DEBUG_SNAPSHOT__MCC5_RDY_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   895  #define SRBM_DEBUG_SNAPSHOT__MCC5_RDY__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   896  #define SRBM_DEBUG_SNAPSHOT__MCC6_RDY_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   897  #define SRBM_DEBUG_SNAPSHOT__MCC6_RDY__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   898  #define SRBM_DEBUG_SNAPSHOT__MCC7_RDY_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   899  #define SRBM_DEBUG_SNAPSHOT__MCC7_RDY__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26   900  #define SRBM_DEBUG_SNAPSHOT__MCD0_RDY_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   901  #define SRBM_DEBUG_SNAPSHOT__MCD0_RDY__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   902  #define SRBM_DEBUG_SNAPSHOT__MCD1_RDY_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   903  #define SRBM_DEBUG_SNAPSHOT__MCD1_RDY__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26   904  #define SRBM_DEBUG_SNAPSHOT__MCD2_RDY_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   905  #define SRBM_DEBUG_SNAPSHOT__MCD2_RDY__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26   906  #define SRBM_DEBUG_SNAPSHOT__MCD3_RDY_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   907  #define SRBM_DEBUG_SNAPSHOT__MCD3_RDY__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26   908  #define SRBM_DEBUG_SNAPSHOT__MCD4_RDY_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   909  #define SRBM_DEBUG_SNAPSHOT__MCD4_RDY__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26   910  #define SRBM_DEBUG_SNAPSHOT__MCD5_RDY_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   911  #define SRBM_DEBUG_SNAPSHOT__MCD5_RDY__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26   912  #define SRBM_DEBUG_SNAPSHOT__MCD6_RDY_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   913  #define SRBM_DEBUG_SNAPSHOT__MCD6_RDY__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   914  #define SRBM_DEBUG_SNAPSHOT__MCD7_RDY_MASK 0x00002000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   915  #define SRBM_DEBUG_SNAPSHOT__MCD7_RDY__SHIFT 0x0000000d
de2bdb3dcf9228 Tom St Denis 2016-10-26   916  #define SRBM_DEBUG_SNAPSHOT__ORB_RDY_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   917  #define SRBM_DEBUG_SNAPSHOT__ORB_RDY__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26   918  #define SRBM_DEBUG_SNAPSHOT__REGBB_RDY_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   919  #define SRBM_DEBUG_SNAPSHOT__REGBB_RDY__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   920  #define SRBM_DEBUG_SNAPSHOT__UVD_RDY_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   921  #define SRBM_DEBUG_SNAPSHOT__UVD_RDY__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   922  #define SRBM_DEBUG_SNAPSHOT__VCE_RDY_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   923  #define SRBM_DEBUG_SNAPSHOT__VCE_RDY__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   924  #define SRBM_DEBUG_SNAPSHOT__XDMA_RDY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   925  #define SRBM_DEBUG_SNAPSHOT__XDMA_RDY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   926  #define SRBM_DEBUG_SNAPSHOT__XSP_RDY_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   927  #define SRBM_DEBUG_SNAPSHOT__XSP_RDY__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   928  #define SRBM_DEBUG__SYS_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26   929  #define SRBM_DEBUG__SYS_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   930  #define SRBM_DEBUG__UVD_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26   931  #define SRBM_DEBUG__UVD_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26   932  #define SRBM_DEBUG__VCE_CLOCK_DOMAIN_OVERRIDE_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   933  #define SRBM_DEBUG__VCE_CLOCK_DOMAIN_OVERRIDE__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   934  #define SRBM_GFX_CNTL__VMID_MASK 0x000000f0L
de2bdb3dcf9228 Tom St Denis 2016-10-26   935  #define SRBM_GFX_CNTL__VMID__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26   936  #define SRBM_INT_ACK__RDERR_INT_ACK_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   937  #define SRBM_INT_ACK__RDERR_INT_ACK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   938  #define SRBM_INT_CNTL__RDERR_INT_MASK_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   939  #define SRBM_INT_CNTL__RDERR_INT_MASK__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   940  #define SRBM_INT_STATUS__RDERR_INT_STAT_MASK 0x00000001L
de2bdb3dcf9228 Tom St Denis 2016-10-26   941  #define SRBM_INT_STATUS__RDERR_INT_STAT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   942  #define SRBM_MC_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26   943  #define SRBM_MC_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   944  #define SRBM_MC_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   945  #define SRBM_MC_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   946  #define SRBM_PERFCOUNTER0_HI__PERF_COUNT0_HI_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   947  #define SRBM_PERFCOUNTER0_HI__PERF_COUNT0_HI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   948  #define SRBM_PERFCOUNTER0_LO__PERF_COUNT0_LO_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   949  #define SRBM_PERFCOUNTER0_LO__PERF_COUNT0_LO__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   950  #define SRBM_PERFCOUNTER0_SELECT__PERF_SEL_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   951  #define SRBM_PERFCOUNTER0_SELECT__PERF_SEL__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   952  #define SRBM_PERFCOUNTER1_HI__PERF_COUNT1_HI_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   953  #define SRBM_PERFCOUNTER1_HI__PERF_COUNT1_HI__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   954  #define SRBM_PERFCOUNTER1_LO__PERF_COUNT1_LO_MASK 0xffffffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26   955  #define SRBM_PERFCOUNTER1_LO__PERF_COUNT1_LO__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   956  #define SRBM_PERFCOUNTER1_SELECT__PERF_SEL_MASK 0x0000003fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   957  #define SRBM_PERFCOUNTER1_SELECT__PERF_SEL__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   958  #define SRBM_PERFMON_CNTL__PERFMON_ENABLE_MODE_MASK 0x00000300L
de2bdb3dcf9228 Tom St Denis 2016-10-26   959  #define SRBM_PERFMON_CNTL__PERFMON_ENABLE_MODE__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   960  #define SRBM_PERFMON_CNTL__PERFMON_SAMPLE_ENABLE_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   961  #define SRBM_PERFMON_CNTL__PERFMON_SAMPLE_ENABLE__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   962  #define SRBM_PERFMON_CNTL__PERFMON_STATE_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26   963  #define SRBM_PERFMON_CNTL__PERFMON_STATE__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26   964  #define SRBM_READ_ERROR__READ_ADDRESS_MASK 0x0003fffcL
de2bdb3dcf9228 Tom St Denis 2016-10-26   965  #define SRBM_READ_ERROR__READ_ADDRESS__SHIFT 0x00000002
de2bdb3dcf9228 Tom St Denis 2016-10-26   966  #define SRBM_READ_ERROR__READ_ERROR_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   967  #define SRBM_READ_ERROR__READ_ERROR__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26   968  #define SRBM_READ_ERROR__READ_REQUESTER_GRBM_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   969  #define SRBM_READ_ERROR__READ_REQUESTER_GRBM__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26   970  #define SRBM_READ_ERROR__READ_REQUESTER_HI_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   971  #define SRBM_READ_ERROR__READ_REQUESTER_HI__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26   972  #define SRBM_READ_ERROR__READ_REQUESTER_SMU_MASK 0x04000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   973  #define SRBM_READ_ERROR__READ_REQUESTER_SMU__SHIFT 0x0000001a
de2bdb3dcf9228 Tom St Denis 2016-10-26   974  #define SRBM_READ_ERROR__READ_REQUESTER_TST_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   975  #define SRBM_READ_ERROR__READ_REQUESTER_TST__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   976  #define SRBM_READ_ERROR__READ_REQUESTER_UVD_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   977  #define SRBM_READ_ERROR__READ_REQUESTER_UVD__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26   978  #define SRBM_READ_ERROR__READ_REQUESTER_VCE_MASK 0x00100000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   979  #define SRBM_READ_ERROR__READ_REQUESTER_VCE__SHIFT 0x00000014
de2bdb3dcf9228 Tom St Denis 2016-10-26   980  #define SRBM_SOFT_RESET__SOFT_RESET_BIF_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26   981  #define SRBM_SOFT_RESET__SOFT_RESET_BIF__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26   982  #define SRBM_SOFT_RESET__SOFT_RESET_DC_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26   983  #define SRBM_SOFT_RESET__SOFT_RESET_DC__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26   984  #define SRBM_SOFT_RESET__SOFT_RESET_GRBM_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26   985  #define SRBM_SOFT_RESET__SOFT_RESET_GRBM__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26   986  #define SRBM_SOFT_RESET__SOFT_RESET_HDP_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26   987  #define SRBM_SOFT_RESET__SOFT_RESET_HDP__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26   988  #define SRBM_SOFT_RESET__SOFT_RESET_IH_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26   989  #define SRBM_SOFT_RESET__SOFT_RESET_IH__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26   990  #define SRBM_SOFT_RESET__SOFT_RESET_MC_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26   991  #define SRBM_SOFT_RESET__SOFT_RESET_MC__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26   992  #define SRBM_SOFT_RESET__SOFT_RESET_ORB_MASK 0x00800000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   993  #define SRBM_SOFT_RESET__SOFT_RESET_ORB__SHIFT 0x00000017
de2bdb3dcf9228 Tom St Denis 2016-10-26   994  #define SRBM_SOFT_RESET__SOFT_RESET_REGBB_MASK 0x00400000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   995  #define SRBM_SOFT_RESET__SOFT_RESET_REGBB__SHIFT 0x00000016
de2bdb3dcf9228 Tom St Denis 2016-10-26   996  #define SRBM_SOFT_RESET__SOFT_RESET_ROM_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   997  #define SRBM_SOFT_RESET__SOFT_RESET_ROM__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26   998  #define SRBM_SOFT_RESET__SOFT_RESET_SEM_MASK 0x00008000L
de2bdb3dcf9228 Tom St Denis 2016-10-26   999  #define SRBM_SOFT_RESET__SOFT_RESET_SEM__SHIFT 0x0000000f
de2bdb3dcf9228 Tom St Denis 2016-10-26  1000  #define SRBM_SOFT_RESET__SOFT_RESET_TST_MASK 0x00200000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1001  #define SRBM_SOFT_RESET__SOFT_RESET_TST__SHIFT 0x00000015
de2bdb3dcf9228 Tom St Denis 2016-10-26  1002  #define SRBM_SOFT_RESET__SOFT_RESET_UVD_MASK 0x00040000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1003  #define SRBM_SOFT_RESET__SOFT_RESET_UVD__SHIFT 0x00000012
de2bdb3dcf9228 Tom St Denis 2016-10-26  1004  #define SRBM_SOFT_RESET__SOFT_RESET_VCE_MASK 0x01000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1005  #define SRBM_SOFT_RESET__SOFT_RESET_VCE__SHIFT 0x00000018
de2bdb3dcf9228 Tom St Denis 2016-10-26  1006  #define SRBM_SOFT_RESET__SOFT_RESET_VMC_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1007  #define SRBM_SOFT_RESET__SOFT_RESET_VMC__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26  1008  #define SRBM_SOFT_RESET__SOFT_RESET_XDMA_MASK 0x02000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1009  #define SRBM_SOFT_RESET__SOFT_RESET_XDMA__SHIFT 0x00000019
de2bdb3dcf9228 Tom St Denis 2016-10-26  1010  #define SRBM_SOFT_RESET__SOFT_RESET_XSP_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1011  #define SRBM_SOFT_RESET__SOFT_RESET_XSP__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1012  #define SRBM_STATUS2__TST_RQ_PENDING_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1013  #define SRBM_STATUS2__TST_RQ_PENDING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26  1014  #define SRBM_STATUS2__VCE_BUSY_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1015  #define SRBM_STATUS2__VCE_BUSY__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26  1016  #define SRBM_STATUS2__VCE_RQ_PENDING_MASK 0x00000008L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1017  #define SRBM_STATUS2__VCE_RQ_PENDING__SHIFT 0x00000003
de2bdb3dcf9228 Tom St Denis 2016-10-26  1018  #define SRBM_STATUS2__XDMA_BUSY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1019  #define SRBM_STATUS2__XDMA_BUSY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1020  #define SRBM_STATUS2__XSP_BUSY_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1021  #define SRBM_STATUS2__XSP_BUSY__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26  1022  #define SRBM_STATUS__BIF_BUSY_MASK 0x20000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1023  #define SRBM_STATUS__BIF_BUSY__SHIFT 0x0000001d
de2bdb3dcf9228 Tom St Denis 2016-10-26  1024  #define SRBM_STATUS__GRBM_RQ_PENDING_MASK 0x00000020L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1025  #define SRBM_STATUS__GRBM_RQ_PENDING__SHIFT 0x00000005
de2bdb3dcf9228 Tom St Denis 2016-10-26  1026  #define SRBM_STATUS__HI_RQ_PENDING_MASK 0x00000040L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1027  #define SRBM_STATUS__HI_RQ_PENDING__SHIFT 0x00000006
de2bdb3dcf9228 Tom St Denis 2016-10-26  1028  #define SRBM_STATUS__IH_BUSY_MASK 0x00020000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1029  #define SRBM_STATUS__IH_BUSY__SHIFT 0x00000011
de2bdb3dcf9228 Tom St Denis 2016-10-26  1030  #define SRBM_STATUS__IO_EXTERN_SIGNAL_MASK 0x00000080L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1031  #define SRBM_STATUS__IO_EXTERN_SIGNAL__SHIFT 0x00000007
de2bdb3dcf9228 Tom St Denis 2016-10-26  1032  #define SRBM_STATUS__MCB_BUSY_MASK 0x00000200L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1033  #define SRBM_STATUS__MCB_BUSY__SHIFT 0x00000009
de2bdb3dcf9228 Tom St Denis 2016-10-26  1034  #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK 0x00000400L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1035  #define SRBM_STATUS__MCB_NON_DISPLAY_BUSY__SHIFT 0x0000000a
de2bdb3dcf9228 Tom St Denis 2016-10-26  1036  #define SRBM_STATUS__MCC_BUSY_MASK 0x00000800L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1037  #define SRBM_STATUS__MCC_BUSY__SHIFT 0x0000000b
de2bdb3dcf9228 Tom St Denis 2016-10-26  1038  #define SRBM_STATUS__MCD_BUSY_MASK 0x00001000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1039  #define SRBM_STATUS__MCD_BUSY__SHIFT 0x0000000c
de2bdb3dcf9228 Tom St Denis 2016-10-26  1040  #define SRBM_STATUS__SEM_BUSY_MASK 0x00004000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1041  #define SRBM_STATUS__SEM_BUSY__SHIFT 0x0000000e
de2bdb3dcf9228 Tom St Denis 2016-10-26  1042  #define SRBM_STATUS__SMU_RQ_PENDING_MASK 0x00000010L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1043  #define SRBM_STATUS__SMU_RQ_PENDING__SHIFT 0x00000004
de2bdb3dcf9228 Tom St Denis 2016-10-26  1044  #define SRBM_STATUS__UVD_BUSY_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1045  #define SRBM_STATUS__UVD_BUSY__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1046  #define SRBM_STATUS__UVD_RQ_PENDING_MASK 0x00000002L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1047  #define SRBM_STATUS__UVD_RQ_PENDING__SHIFT 0x00000001
de2bdb3dcf9228 Tom St Denis 2016-10-26  1048  #define SRBM_STATUS__VMC_BUSY_MASK 0x00000100L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1049  #define SRBM_STATUS__VMC_BUSY__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1050  #define SRBM_SYS_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1051  #define SRBM_SYS_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1052  #define SRBM_SYS_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1053  #define SRBM_SYS_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1054  #define SRBM_UVD_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1055  #define SRBM_UVD_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1056  #define SRBM_UVD_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1057  #define SRBM_UVD_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1058  #define SRBM_VCE_CLKEN_CNTL__POST_DELAY_CNT_MASK 0x00001f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1059  #define SRBM_VCE_CLKEN_CNTL__POST_DELAY_CNT__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1060  #define SRBM_VCE_CLKEN_CNTL__PREFIX_DELAY_CNT_MASK 0x0000000fL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1061  #define SRBM_VCE_CLKEN_CNTL__PREFIX_DELAY_CNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1062  #define UVD_CONFIG__UVD_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1063  #define UVD_CONFIG__UVD_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1064  #define UVD_CONFIG__UVD_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1065  #define UVD_CONFIG__UVD_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1066  #define VCE_CONFIG__VCE_RDREQ_URG_MASK 0x00000f00L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1067  #define VCE_CONFIG__VCE_RDREQ_URG__SHIFT 0x00000008
de2bdb3dcf9228 Tom St Denis 2016-10-26  1068  #define VCE_CONFIG__VCE_REQ_TRAN_MASK 0x00010000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1069  #define VCE_CONFIG__VCE_REQ_TRAN__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1070  #define XDMA_MSTR_CNTL__XDMA_MSTR_LAT_TEST_EN_MASK 0x00080000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1071  #define XDMA_MSTR_CNTL__XDMA_MSTR_LAT_TEST_EN__SHIFT 0x00000013
de2bdb3dcf9228 Tom St Denis 2016-10-26  1072  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_ENABLE_MASK 0x80000000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1073  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_ENABLE__SHIFT 0x0000001f
de2bdb3dcf9228 Tom St Denis 2016-10-26  1074  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT_MASK 0x0000ffffL
de2bdb3dcf9228 Tom St Denis 2016-10-26  1075  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_COUNT__SHIFT 0x00000000
de2bdb3dcf9228 Tom St Denis 2016-10-26  1076  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_THRESHOLD_MASK 0x3fff0000L
de2bdb3dcf9228 Tom St Denis 2016-10-26  1077  #define XDMA_MSTR_MEM_OVERFLOW_CNTL__XDMA_MSTR_OVERFLOW_THRESHOLD__SHIFT 0x00000010
de2bdb3dcf9228 Tom St Denis 2016-10-26  1078  

:::::: The code at line 26 was first introduced by commit
:::::: de2bdb3dcf9228030b4e0a2d83f3d6b6bedc6c33 drm/amd/amdgpu: Introduction of SI registers (v2)

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--SUOF0GtieIMvvwua
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
P5Q8VQis7AEA

--SUOF0GtieIMvvwua
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--SUOF0GtieIMvvwua--
