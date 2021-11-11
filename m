Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FCA44DE8C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 00:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56D189B68;
	Thu, 11 Nov 2021 23:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594D389AD2;
 Thu, 11 Nov 2021 23:33:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="213765003"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; 
 d="gz'50?scan'50,208,50";a="213765003"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 15:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; 
 d="gz'50?scan'50,208,50";a="602795521"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 11 Nov 2021 15:33:00 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mlJYx-000HFL-Ps; Thu, 11 Nov 2021 23:32:59 +0000
Date: Fri, 12 Nov 2021 07:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com, jgg@nvidia.com,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
Message-ID: <202111120709.0HZyzp3c-lkp@intel.com>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20211108212718.10576-1-zhi.a.wang@intel.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhi,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on v5.15 next-20211111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhi-Wang/i915-gvt-seperate-tracked-MMIO-table-from-handlers-c/20211109-052907
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/8d4393b277b5196206271d5191d25fe61b1b34f1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zhi-Wang/i915-gvt-seperate-tracked-MMIO-table-from-handlers-c/20211109-052907
        git checkout 8d4393b277b5196206271d5191d25fe61b1b34f1
        # save the attached .config to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/gvt/mmio_table.h:85:52: error: 'struct intel_gvt' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      85 | static int intel_gvt_init_generic_mmio_info(struct intel_gvt *gvt)
         |                                                    ^~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h: In function 'intel_gvt_init_generic_mmio_info':
>> drivers/gpu/drm/i915/gvt/mmio_table.h:87:41: error: dereferencing pointer to incomplete type 'struct intel_gvt'
      87 |  struct drm_i915_private *dev_priv = gvt->gt->i915;
         |                                         ^~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:36:8: error: implicit declaration of function 'new_mmio_info' [-Werror=implicit-function-declaration]
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |        ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:62:2: note: in expansion of macro 'MMIO_F'
      62 |  MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
         |  ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:36:27: error: implicit declaration of function 'i915_mmio_reg_offset' [-Werror=implicit-function-declaration]
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:62:2: note: in expansion of macro 'MMIO_F'
      62 |  MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
         |  ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:91:16: error: implicit declaration of function 'RING_IMR' [-Werror=implicit-function-declaration]
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |                ^~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:62:16: error: 'RENDER_RING_BASE' undeclared (first use in this function)
      62 |  MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
         |                ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:62:16: note: each undeclared identifier is reported only once for each function it appears in
      62 |  MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
         |                ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:91:26: error: 'D_ALL' undeclared (first use in this function)
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |                          ^~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:17: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                 ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:91:36: error: 'NULL' undeclared (first use in this function)
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |                                    ^~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:20: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                    ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:1:1: note: 'NULL' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
     +++ |+#include <stddef.h>
       1 | /*
>> drivers/gpu/drm/i915/gvt/mmio_table.h:92:3: error: 'intel_vgpu_reg_imr_handler' undeclared (first use in this function)
      92 |   intel_vgpu_reg_imr_handler);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:23: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                       ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:63:16: error: 'BLT_RING_BASE' undeclared (first use in this function)
      63 |  MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d, r, w); \
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:64:16: error: 'GEN6_BSD_RING_BASE' undeclared (first use in this function)
      64 |  MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d, r, w); \
         |                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:65:16: error: 'VEBOX_RING_BASE' undeclared (first use in this function)
      65 |  MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d, r, w); \
         |                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:66:6: error: implicit declaration of function 'HAS_ENGINE' [-Werror=implicit-function-declaration]
      66 |  if (HAS_ENGINE(gvt->gt, VCS1)) \
         |      ^~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:66:26: error: 'VCS1' undeclared (first use in this function)
      66 |  if (HAS_ENGINE(gvt->gt, VCS1)) \
         |                          ^~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:67:17: error: 'GEN8_BSD2_RING_BASE' undeclared (first use in this function)
      67 |   MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d, r, w); \
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:91:2: note: in expansion of macro 'MMIO_RING_DFH'
      91 |  MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:94:11: error: 'SDEIMR' undeclared (first use in this function)
      94 |  MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
         |           ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:94:2: note: in expansion of macro 'MMIO_DFH'
      94 |  MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
         |  ^~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:95:11: error: 'SDEIER' undeclared (first use in this function)
      95 |  MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
         |           ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:95:2: note: in expansion of macro 'MMIO_DFH'
      95 |  MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
         |  ^~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:95:35: error: 'intel_vgpu_reg_ier_handler' undeclared (first use in this function)
      95 |  MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:23: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                       ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:95:2: note: in expansion of macro 'MMIO_DFH'
      95 |  MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
         |  ^~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:96:11: error: 'SDEIIR' undeclared (first use in this function)
      96 |  MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
         |           ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:96:2: note: in expansion of macro 'MMIO_DFH'
      96 |  MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
         |  ^~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:96:35: error: 'intel_vgpu_reg_iir_handler' undeclared (first use in this function)
      96 |  MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:23: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                       ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:96:2: note: in expansion of macro 'MMIO_DFH'
      96 |  MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
         |  ^~~~~~~~
>> drivers/gpu/drm/i915/gvt/mmio_table.h:97:9: error: 'SDEISR' undeclared (first use in this function)
      97 |  MMIO_D(SDEISR, D_ALL);
         |         ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:97:2: note: in expansion of macro 'MMIO_D'
      97 |  MMIO_D(SDEISR, D_ALL);
         |  ^~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:99:16: error: implicit declaration of function 'RING_HWSTAM' [-Werror=implicit-function-declaration]
      99 |  MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:74:2: note: in expansion of macro 'MMIO_RING_F'
      74 |  MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:99:2: note: in expansion of macro 'MMIO_RING_DFH'
      99 |  MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
         |  ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:102:10: error: 'GEN8_GAMW_ECO_DEV_RW_IA' undeclared (first use in this function)
     102 |  MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:102:2: note: in expansion of macro 'MMIO_DH'
     102 |  MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
         |  ^~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:102:35: error: 'D_BDW_PLUS' undeclared (first use in this function)
     102 |  MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
         |                                   ^~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:17: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                 ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:102:2: note: in expansion of macro 'MMIO_DH'
     102 |  MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
         |  ^~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:103:3: error: 'gamw_echo_dev_rw_ia_write' undeclared (first use in this function)
     103 |   gamw_echo_dev_rw_ia_write);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:23: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |                       ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:102:2: note: in expansion of macro 'MMIO_DH'
     102 |  MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
         |  ^~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:105:14: error: 'BSD_HWS_PGA_GEN7' undeclared (first use in this function)
     105 |  MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:105:2: note: in expansion of macro 'MMIO_GM_RDR'
     105 |  MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:56:17: error: 'F_GMADR' undeclared (first use in this function)
      56 |  MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
         |                 ^~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:3: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |   ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:105:2: note: in expansion of macro 'MMIO_GM_RDR'
     105 |  MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:56:27: error: 'F_CMD_ACCESS' undeclared (first use in this function)
      56 |  MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
         |                           ^~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:37:3: note: in definition of macro 'MMIO_F'
      37 |   f, s, am, rm, d, r, w); \
         |   ^
   drivers/gpu/drm/i915/gvt/mmio_table.h:105:2: note: in expansion of macro 'MMIO_GM_RDR'
     105 |  MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:106:14: error: 'BLT_HWS_PGA_GEN7' undeclared (first use in this function)
     106 |  MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:106:2: note: in expansion of macro 'MMIO_GM_RDR'
     106 |  MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:107:14: error: 'VEBOX_HWS_PGA_GEN7' undeclared (first use in this function)
     107 |  MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |              ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:107:2: note: in expansion of macro 'MMIO_GM_RDR'
     107 |  MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
         |  ^~~~~~~~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:109:24: error: implicit declaration of function '_MMIO' [-Werror=implicit-function-declaration]
     109 | #define RING_REG(base) _MMIO((base) + 0x28)
         |                        ^~~~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:36:48: note: in definition of macro 'MMIO_F'
      36 |  ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
         |                                                ^~~
   drivers/gpu/drm/i915/gvt/mmio_table.h:62:9: note: in expansion of macro 'RING_REG'
      62 |  MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \


vim +87 drivers/gpu/drm/i915/gvt/mmio_table.h

    27	
    28	#ifdef GENERATE_MMIO_TABLE_IN_I915
    29	#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
    30		ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg)); \
    31		if (ret) \
    32			return ret; \
    33	} while (0)
    34	#else
    35	#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
  > 36		ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
    37			f, s, am, rm, d, r, w); \
    38		if (ret) \
    39			return ret; \
    40	} while (0)
    41	#endif
    42	
    43	#define MMIO_D(reg, d) \
    44		MMIO_F(reg, 4, 0, 0, 0, d, NULL, NULL)
    45	
    46	#define MMIO_DH(reg, d, r, w) \
    47		MMIO_F(reg, 4, 0, 0, 0, d, r, w)
    48	
    49	#define MMIO_DFH(reg, d, f, r, w) \
    50		MMIO_F(reg, 4, f, 0, 0, d, r, w)
    51	
    52	#define MMIO_GM(reg, d, r, w) \
    53		MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
    54	
    55	#define MMIO_GM_RDR(reg, d, r, w) \
  > 56		MMIO_F(reg, 4, F_GMADR | F_CMD_ACCESS, 0xFFFFF000, 0, d, r, w)
    57	
    58	#define MMIO_RO(reg, d, f, rm, r, w) \
  > 59		MMIO_F(reg, 4, F_RO | f, 0, rm, d, r, w)
    60	
    61	#define MMIO_RING_F(prefix, s, f, am, rm, d, r, w) do { \
  > 62		MMIO_F(prefix(RENDER_RING_BASE), s, f, am, rm, d, r, w); \
  > 63		MMIO_F(prefix(BLT_RING_BASE), s, f, am, rm, d, r, w); \
  > 64		MMIO_F(prefix(GEN6_BSD_RING_BASE), s, f, am, rm, d, r, w); \
  > 65		MMIO_F(prefix(VEBOX_RING_BASE), s, f, am, rm, d, r, w); \
  > 66		if (HAS_ENGINE(gvt->gt, VCS1)) \
  > 67			MMIO_F(prefix(GEN8_BSD2_RING_BASE), s, f, am, rm, d, r, w); \
    68	} while (0)
    69	
    70	#define MMIO_RING_D(prefix, d) \
    71		MMIO_RING_F(prefix, 4, 0, 0, 0, d, NULL, NULL)
    72	
    73	#define MMIO_RING_DFH(prefix, d, f, r, w) \
    74		MMIO_RING_F(prefix, 4, f, 0, 0, d, r, w)
    75	
    76	#define MMIO_RING_GM(prefix, d, r, w) \
    77		MMIO_RING_F(prefix, 4, F_GMADR, 0xFFFF0000, 0, d, r, w)
    78	
    79	#define MMIO_RING_GM_RDR(prefix, d, r, w) \
    80		MMIO_RING_F(prefix, 4, F_GMADR | F_CMD_ACCESS, 0xFFFF0000, 0, d, r, w)
    81	
    82	#define MMIO_RING_RO(prefix, d, f, rm, r, w) \
    83		MMIO_RING_F(prefix, 4, F_RO | f, 0, rm, d, r, w)
    84	
    85	static int intel_gvt_init_generic_mmio_info(struct intel_gvt *gvt)
    86	{
  > 87		struct drm_i915_private *dev_priv = gvt->gt->i915;
    88	
    89		int ret;
    90	
  > 91		MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
  > 92			intel_vgpu_reg_imr_handler);
    93	
  > 94		MMIO_DFH(SDEIMR, D_ALL, 0, NULL, intel_vgpu_reg_imr_handler);
  > 95		MMIO_DFH(SDEIER, D_ALL, 0, NULL, intel_vgpu_reg_ier_handler);
  > 96		MMIO_DFH(SDEIIR, D_ALL, 0, NULL, intel_vgpu_reg_iir_handler);
  > 97		MMIO_D(SDEISR, D_ALL);
    98	
  > 99		MMIO_RING_DFH(RING_HWSTAM, D_ALL, 0, NULL, NULL);
   100	
   101	
 > 102		MMIO_DH(GEN8_GAMW_ECO_DEV_RW_IA, D_BDW_PLUS, NULL,
 > 103			gamw_echo_dev_rw_ia_write);
   104	
 > 105		MMIO_GM_RDR(BSD_HWS_PGA_GEN7, D_ALL, NULL, NULL);
 > 106		MMIO_GM_RDR(BLT_HWS_PGA_GEN7, D_ALL, NULL, NULL);
 > 107		MMIO_GM_RDR(VEBOX_HWS_PGA_GEN7, D_ALL, NULL, NULL);
   108	
 > 109	#define RING_REG(base) _MMIO((base) + 0x28)
   110		MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
   111	#undef RING_REG
   112	
   113	#define RING_REG(base) _MMIO((base) + 0x134)
   114		MMIO_RING_DFH(RING_REG, D_ALL, F_CMD_ACCESS, NULL, NULL);
   115	#undef RING_REG
   116	
   117	#define RING_REG(base) _MMIO((base) + 0x6c)
 > 118		MMIO_RING_DFH(RING_REG, D_ALL, 0, mmio_read_from_hw, NULL);
   119	#undef RING_REG
 > 120		MMIO_DH(GEN7_SC_INSTDONE, D_BDW_PLUS, mmio_read_from_hw, NULL);
   121	
   122		MMIO_GM_RDR(_MMIO(0x2148), D_ALL, NULL, NULL);
 > 123		MMIO_GM_RDR(CCID(RENDER_RING_BASE), D_ALL, NULL, NULL);
   124		MMIO_GM_RDR(_MMIO(0x12198), D_ALL, NULL, NULL);
 > 125		MMIO_D(GEN7_CXT_SIZE, D_ALL);
   126	
 > 127		MMIO_RING_DFH(RING_TAIL, D_ALL, 0, NULL, NULL);
 > 128		MMIO_RING_DFH(RING_HEAD, D_ALL, 0, NULL, NULL);
 > 129		MMIO_RING_DFH(RING_CTL, D_ALL, 0, NULL, NULL);
 > 130		MMIO_RING_DFH(RING_ACTHD, D_ALL, 0, mmio_read_from_hw, NULL);
 > 131		MMIO_RING_GM(RING_START, D_ALL, NULL, NULL);
   132	
   133		/* RING MODE */
   134	#define RING_REG(base) _MMIO((base) + 0x29c)
   135		MMIO_RING_DFH(RING_REG, D_ALL,
 > 136			F_MODE_MASK | F_CMD_ACCESS | F_CMD_WRITE_PATCH, NULL,
 > 137			ring_mode_mmio_write);
   138	#undef RING_REG
   139	
 > 140		MMIO_RING_DFH(RING_MI_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
   141			NULL, NULL);
 > 142		MMIO_RING_DFH(RING_INSTPM, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
   143				NULL, NULL);
 > 144		MMIO_RING_DFH(RING_TIMESTAMP, D_ALL, F_CMD_ACCESS,
   145				mmio_read_from_hw, NULL);
 > 146		MMIO_RING_DFH(RING_TIMESTAMP_UDW, D_ALL, F_CMD_ACCESS,
   147				mmio_read_from_hw, NULL);
   148	
 > 149		MMIO_DFH(GEN7_GT_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 150		MMIO_DFH(CACHE_MODE_0_GEN7, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
   151			NULL, NULL);
 > 152		MMIO_DFH(CACHE_MODE_1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 153		MMIO_DFH(CACHE_MODE_0, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   154		MMIO_DFH(_MMIO(0x2124), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   155	
   156		MMIO_DFH(_MMIO(0x20dc), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 157		MMIO_DFH(_3D_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   158		MMIO_DFH(_MMIO(0x2088), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 159		MMIO_DFH(FF_SLICE_CS_CHICKEN2, D_ALL,
   160			 F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   161		MMIO_DFH(_MMIO(0x2470), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 162		MMIO_DFH(GAM_ECOCHK, D_ALL, F_CMD_ACCESS, NULL, NULL);
 > 163		MMIO_DFH(GEN7_COMMON_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
   164			NULL, NULL);
 > 165		MMIO_DFH(COMMON_SLICE_CHICKEN2, D_ALL, F_MODE_MASK | F_CMD_ACCESS,
   166			 NULL, NULL);
   167		MMIO_DFH(_MMIO(0x9030), D_ALL, F_CMD_ACCESS, NULL, NULL);
   168		MMIO_DFH(_MMIO(0x20a0), D_ALL, F_CMD_ACCESS, NULL, NULL);
   169		MMIO_DFH(_MMIO(0x2420), D_ALL, F_CMD_ACCESS, NULL, NULL);
   170		MMIO_DFH(_MMIO(0x2430), D_ALL, F_CMD_ACCESS, NULL, NULL);
   171		MMIO_DFH(_MMIO(0x2434), D_ALL, F_CMD_ACCESS, NULL, NULL);
   172		MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
   173		MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
   174		MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 175		MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 > 176		MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   177	
   178		/* display */
   179		MMIO_F(_MMIO(0x60220), 0x20, 0, 0, 0, D_ALL, NULL, NULL);
   180		MMIO_D(_MMIO(0x602a0), D_ALL);
   181	
   182		MMIO_D(_MMIO(0x65050), D_ALL);
   183		MMIO_D(_MMIO(0x650b4), D_ALL);
   184	
   185		MMIO_D(_MMIO(0xc4040), D_ALL);
 > 186		MMIO_D(DERRMR, D_ALL);
   187	
 > 188		MMIO_D(PIPEDSL(PIPE_A), D_ALL);
 > 189		MMIO_D(PIPEDSL(PIPE_B), D_ALL);
 > 190		MMIO_D(PIPEDSL(PIPE_C), D_ALL);
 > 191		MMIO_D(PIPEDSL(_PIPE_EDP), D_ALL);
   192	
 > 193		MMIO_DH(PIPECONF(PIPE_A), D_ALL, NULL, pipeconf_mmio_write);
   194		MMIO_DH(PIPECONF(PIPE_B), D_ALL, NULL, pipeconf_mmio_write);
   195		MMIO_DH(PIPECONF(PIPE_C), D_ALL, NULL, pipeconf_mmio_write);
   196		MMIO_DH(PIPECONF(_PIPE_EDP), D_ALL, NULL, pipeconf_mmio_write);
   197	
 > 198		MMIO_D(PIPESTAT(PIPE_A), D_ALL);
   199		MMIO_D(PIPESTAT(PIPE_B), D_ALL);
   200		MMIO_D(PIPESTAT(PIPE_C), D_ALL);
   201		MMIO_D(PIPESTAT(_PIPE_EDP), D_ALL);
   202	
 > 203		MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_A), D_ALL);
   204		MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_B), D_ALL);
   205		MMIO_D(PIPE_FLIPCOUNT_G4X(PIPE_C), D_ALL);
   206		MMIO_D(PIPE_FLIPCOUNT_G4X(_PIPE_EDP), D_ALL);
   207	
 > 208		MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_A), D_ALL);
   209		MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_B), D_ALL);
   210		MMIO_D(PIPE_FRMCOUNT_G4X(PIPE_C), D_ALL);
   211		MMIO_D(PIPE_FRMCOUNT_G4X(_PIPE_EDP), D_ALL);
   212	
 > 213		MMIO_D(CURCNTR(PIPE_A), D_ALL);
   214		MMIO_D(CURCNTR(PIPE_B), D_ALL);
   215		MMIO_D(CURCNTR(PIPE_C), D_ALL);
   216	
 > 217		MMIO_D(CURPOS(PIPE_A), D_ALL);
   218		MMIO_D(CURPOS(PIPE_B), D_ALL);
   219		MMIO_D(CURPOS(PIPE_C), D_ALL);
   220	
 > 221		MMIO_D(CURBASE(PIPE_A), D_ALL);
   222		MMIO_D(CURBASE(PIPE_B), D_ALL);
   223		MMIO_D(CURBASE(PIPE_C), D_ALL);
   224	
 > 225		MMIO_D(CUR_FBC_CTL(PIPE_A), D_ALL);
   226		MMIO_D(CUR_FBC_CTL(PIPE_B), D_ALL);
   227		MMIO_D(CUR_FBC_CTL(PIPE_C), D_ALL);
   228	
   229		MMIO_D(_MMIO(0x700ac), D_ALL);
   230		MMIO_D(_MMIO(0x710ac), D_ALL);
   231		MMIO_D(_MMIO(0x720ac), D_ALL);
   232	
   233		MMIO_D(_MMIO(0x70090), D_ALL);
   234		MMIO_D(_MMIO(0x70094), D_ALL);
   235		MMIO_D(_MMIO(0x70098), D_ALL);
   236		MMIO_D(_MMIO(0x7009c), D_ALL);
   237	
 > 238		MMIO_D(DSPCNTR(PIPE_A), D_ALL);
 > 239		MMIO_D(DSPADDR(PIPE_A), D_ALL);
 > 240		MMIO_D(DSPSTRIDE(PIPE_A), D_ALL);
 > 241		MMIO_D(DSPPOS(PIPE_A), D_ALL);
 > 242		MMIO_D(DSPSIZE(PIPE_A), D_ALL);
 > 243		MMIO_DH(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
 > 244		MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
 > 245		MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
 > 246		MMIO_DH(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL,
 > 247			reg50080_mmio_write);
   248	
   249		MMIO_D(DSPCNTR(PIPE_B), D_ALL);
   250		MMIO_D(DSPADDR(PIPE_B), D_ALL);
   251		MMIO_D(DSPSTRIDE(PIPE_B), D_ALL);
   252		MMIO_D(DSPPOS(PIPE_B), D_ALL);
   253		MMIO_D(DSPSIZE(PIPE_B), D_ALL);
   254		MMIO_DH(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
   255		MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
   256		MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
   257		MMIO_DH(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL,
   258			reg50080_mmio_write);
   259	
   260		MMIO_D(DSPCNTR(PIPE_C), D_ALL);
   261		MMIO_D(DSPADDR(PIPE_C), D_ALL);
   262		MMIO_D(DSPSTRIDE(PIPE_C), D_ALL);
   263		MMIO_D(DSPPOS(PIPE_C), D_ALL);
   264		MMIO_D(DSPSIZE(PIPE_C), D_ALL);
   265		MMIO_DH(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
   266		MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
   267		MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
   268		MMIO_DH(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL,
   269			reg50080_mmio_write);
   270	
 > 271		MMIO_D(SPRCTL(PIPE_A), D_ALL);
 > 272		MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
 > 273		MMIO_D(SPRSTRIDE(PIPE_A), D_ALL);
 > 274		MMIO_D(SPRPOS(PIPE_A), D_ALL);
 > 275		MMIO_D(SPRSIZE(PIPE_A), D_ALL);
 > 276		MMIO_D(SPRKEYVAL(PIPE_A), D_ALL);
 > 277		MMIO_D(SPRKEYMSK(PIPE_A), D_ALL);
 > 278		MMIO_DH(SPRSURF(PIPE_A), D_ALL, NULL, spr_surf_mmio_write);
 > 279		MMIO_D(SPRKEYMAX(PIPE_A), D_ALL);
 > 280		MMIO_D(SPROFFSET(PIPE_A), D_ALL);
 > 281		MMIO_D(SPRSCALE(PIPE_A), D_ALL);
 > 282		MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
 > 283		MMIO_DH(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL,
   284			reg50080_mmio_write);
   285	
   286		MMIO_D(SPRCTL(PIPE_B), D_ALL);
   287		MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
   288		MMIO_D(SPRSTRIDE(PIPE_B), D_ALL);
   289		MMIO_D(SPRPOS(PIPE_B), D_ALL);
   290		MMIO_D(SPRSIZE(PIPE_B), D_ALL);
   291		MMIO_D(SPRKEYVAL(PIPE_B), D_ALL);
   292		MMIO_D(SPRKEYMSK(PIPE_B), D_ALL);
   293		MMIO_DH(SPRSURF(PIPE_B), D_ALL, NULL, spr_surf_mmio_write);
   294		MMIO_D(SPRKEYMAX(PIPE_B), D_ALL);
   295		MMIO_D(SPROFFSET(PIPE_B), D_ALL);
   296		MMIO_D(SPRSCALE(PIPE_B), D_ALL);
   297		MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
   298		MMIO_DH(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL,
   299			reg50080_mmio_write);
   300	
   301		MMIO_D(SPRCTL(PIPE_C), D_ALL);
   302		MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
   303		MMIO_D(SPRSTRIDE(PIPE_C), D_ALL);
   304		MMIO_D(SPRPOS(PIPE_C), D_ALL);
   305		MMIO_D(SPRSIZE(PIPE_C), D_ALL);
   306		MMIO_D(SPRKEYVAL(PIPE_C), D_ALL);
   307		MMIO_D(SPRKEYMSK(PIPE_C), D_ALL);
   308		MMIO_DH(SPRSURF(PIPE_C), D_ALL, NULL, spr_surf_mmio_write);
   309		MMIO_D(SPRKEYMAX(PIPE_C), D_ALL);
   310		MMIO_D(SPROFFSET(PIPE_C), D_ALL);
   311		MMIO_D(SPRSCALE(PIPE_C), D_ALL);
   312		MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
   313		MMIO_DH(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL,
   314			reg50080_mmio_write);
   315	
   316		MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
   317		MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
   318		MMIO_D(HSYNC(TRANSCODER_A), D_ALL);
   319		MMIO_D(VTOTAL(TRANSCODER_A), D_ALL);
   320		MMIO_D(VBLANK(TRANSCODER_A), D_ALL);
   321		MMIO_D(VSYNC(TRANSCODER_A), D_ALL);
   322		MMIO_D(BCLRPAT(TRANSCODER_A), D_ALL);
   323		MMIO_D(VSYNCSHIFT(TRANSCODER_A), D_ALL);
   324		MMIO_D(PIPESRC(TRANSCODER_A), D_ALL);
   325	
   326		MMIO_D(HTOTAL(TRANSCODER_B), D_ALL);
   327		MMIO_D(HBLANK(TRANSCODER_B), D_ALL);
   328		MMIO_D(HSYNC(TRANSCODER_B), D_ALL);
   329		MMIO_D(VTOTAL(TRANSCODER_B), D_ALL);
   330		MMIO_D(VBLANK(TRANSCODER_B), D_ALL);
   331		MMIO_D(VSYNC(TRANSCODER_B), D_ALL);
   332		MMIO_D(BCLRPAT(TRANSCODER_B), D_ALL);
   333		MMIO_D(VSYNCSHIFT(TRANSCODER_B), D_ALL);
   334		MMIO_D(PIPESRC(TRANSCODER_B), D_ALL);
   335	
   336		MMIO_D(HTOTAL(TRANSCODER_C), D_ALL);
   337		MMIO_D(HBLANK(TRANSCODER_C), D_ALL);
   338		MMIO_D(HSYNC(TRANSCODER_C), D_ALL);
   339		MMIO_D(VTOTAL(TRANSCODER_C), D_ALL);
   340		MMIO_D(VBLANK(TRANSCODER_C), D_ALL);
   341		MMIO_D(VSYNC(TRANSCODER_C), D_ALL);
   342		MMIO_D(BCLRPAT(TRANSCODER_C), D_ALL);
   343		MMIO_D(VSYNCSHIFT(TRANSCODER_C), D_ALL);
   344		MMIO_D(PIPESRC(TRANSCODER_C), D_ALL);
   345	
   346		MMIO_D(HTOTAL(TRANSCODER_EDP), D_ALL);
   347		MMIO_D(HBLANK(TRANSCODER_EDP), D_ALL);
   348		MMIO_D(HSYNC(TRANSCODER_EDP), D_ALL);
   349		MMIO_D(VTOTAL(TRANSCODER_EDP), D_ALL);
   350		MMIO_D(VBLANK(TRANSCODER_EDP), D_ALL);
   351		MMIO_D(VSYNC(TRANSCODER_EDP), D_ALL);
   352		MMIO_D(BCLRPAT(TRANSCODER_EDP), D_ALL);
   353		MMIO_D(VSYNCSHIFT(TRANSCODER_EDP), D_ALL);
   354	
   355		MMIO_D(PIPE_DATA_M1(TRANSCODER_A), D_ALL);
   356		MMIO_D(PIPE_DATA_N1(TRANSCODER_A), D_ALL);
   357		MMIO_D(PIPE_DATA_M2(TRANSCODER_A), D_ALL);
   358		MMIO_D(PIPE_DATA_N2(TRANSCODER_A), D_ALL);
   359		MMIO_D(PIPE_LINK_M1(TRANSCODER_A), D_ALL);
   360		MMIO_D(PIPE_LINK_N1(TRANSCODER_A), D_ALL);
   361		MMIO_D(PIPE_LINK_M2(TRANSCODER_A), D_ALL);
   362		MMIO_D(PIPE_LINK_N2(TRANSCODER_A), D_ALL);
   363	
   364		MMIO_D(PIPE_DATA_M1(TRANSCODER_B), D_ALL);
   365		MMIO_D(PIPE_DATA_N1(TRANSCODER_B), D_ALL);
   366		MMIO_D(PIPE_DATA_M2(TRANSCODER_B), D_ALL);
   367		MMIO_D(PIPE_DATA_N2(TRANSCODER_B), D_ALL);
   368		MMIO_D(PIPE_LINK_M1(TRANSCODER_B), D_ALL);
   369		MMIO_D(PIPE_LINK_N1(TRANSCODER_B), D_ALL);
   370		MMIO_D(PIPE_LINK_M2(TRANSCODER_B), D_ALL);
   371		MMIO_D(PIPE_LINK_N2(TRANSCODER_B), D_ALL);
   372	
   373		MMIO_D(PIPE_DATA_M1(TRANSCODER_C), D_ALL);
   374		MMIO_D(PIPE_DATA_N1(TRANSCODER_C), D_ALL);
   375		MMIO_D(PIPE_DATA_M2(TRANSCODER_C), D_ALL);
   376		MMIO_D(PIPE_DATA_N2(TRANSCODER_C), D_ALL);
   377		MMIO_D(PIPE_LINK_M1(TRANSCODER_C), D_ALL);
   378		MMIO_D(PIPE_LINK_N1(TRANSCODER_C), D_ALL);
   379		MMIO_D(PIPE_LINK_M2(TRANSCODER_C), D_ALL);
   380		MMIO_D(PIPE_LINK_N2(TRANSCODER_C), D_ALL);
   381	
   382		MMIO_D(PIPE_DATA_M1(TRANSCODER_EDP), D_ALL);
   383		MMIO_D(PIPE_DATA_N1(TRANSCODER_EDP), D_ALL);
   384		MMIO_D(PIPE_DATA_M2(TRANSCODER_EDP), D_ALL);
   385		MMIO_D(PIPE_DATA_N2(TRANSCODER_EDP), D_ALL);
   386		MMIO_D(PIPE_LINK_M1(TRANSCODER_EDP), D_ALL);
   387		MMIO_D(PIPE_LINK_N1(TRANSCODER_EDP), D_ALL);
   388		MMIO_D(PIPE_LINK_M2(TRANSCODER_EDP), D_ALL);
   389		MMIO_D(PIPE_LINK_N2(TRANSCODER_EDP), D_ALL);
   390	
   391		MMIO_D(PF_CTL(PIPE_A), D_ALL);
   392		MMIO_D(PF_WIN_SZ(PIPE_A), D_ALL);
   393		MMIO_D(PF_WIN_POS(PIPE_A), D_ALL);
   394		MMIO_D(PF_VSCALE(PIPE_A), D_ALL);
   395		MMIO_D(PF_HSCALE(PIPE_A), D_ALL);
   396	
   397		MMIO_D(PF_CTL(PIPE_B), D_ALL);
   398		MMIO_D(PF_WIN_SZ(PIPE_B), D_ALL);
   399		MMIO_D(PF_WIN_POS(PIPE_B), D_ALL);
   400		MMIO_D(PF_VSCALE(PIPE_B), D_ALL);
   401		MMIO_D(PF_HSCALE(PIPE_B), D_ALL);
   402	
   403		MMIO_D(PF_CTL(PIPE_C), D_ALL);
   404		MMIO_D(PF_WIN_SZ(PIPE_C), D_ALL);
   405		MMIO_D(PF_WIN_POS(PIPE_C), D_ALL);
   406		MMIO_D(PF_VSCALE(PIPE_C), D_ALL);
   407		MMIO_D(PF_HSCALE(PIPE_C), D_ALL);
   408	
   409		MMIO_D(WM0_PIPE_ILK(PIPE_A), D_ALL);
   410		MMIO_D(WM0_PIPE_ILK(PIPE_B), D_ALL);
   411		MMIO_D(WM0_PIPE_ILK(PIPE_C), D_ALL);
   412		MMIO_D(WM1_LP_ILK, D_ALL);
   413		MMIO_D(WM2_LP_ILK, D_ALL);
   414		MMIO_D(WM3_LP_ILK, D_ALL);
   415		MMIO_D(WM1S_LP_ILK, D_ALL);
   416		MMIO_D(WM2S_LP_IVB, D_ALL);
   417		MMIO_D(WM3S_LP_IVB, D_ALL);
   418	
   419		MMIO_D(BLC_PWM_CPU_CTL2, D_ALL);
   420		MMIO_D(BLC_PWM_CPU_CTL, D_ALL);
   421		MMIO_D(BLC_PWM_PCH_CTL1, D_ALL);
   422		MMIO_D(BLC_PWM_PCH_CTL2, D_ALL);
   423	
   424		MMIO_D(_MMIO(0x48268), D_ALL);
   425	
   426		MMIO_F(PCH_GMBUS0, 4 * 4, 0, 0, 0, D_ALL, gmbus_mmio_read,
   427			gmbus_mmio_write);
   428		MMIO_F(PCH_GPIO_BASE, 6 * 4, F_UNALIGN, 0, 0, D_ALL, NULL, NULL);
   429		MMIO_F(_MMIO(0xe4f00), 0x28, 0, 0, 0, D_ALL, NULL, NULL);
   430	
   431		MMIO_F(_MMIO(_PCH_DPB_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
   432			dp_aux_ch_ctl_mmio_write);
   433		MMIO_F(_MMIO(_PCH_DPC_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
   434			dp_aux_ch_ctl_mmio_write);
   435		MMIO_F(_MMIO(_PCH_DPD_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_PRE_SKL, NULL,
   436			dp_aux_ch_ctl_mmio_write);
   437	
   438		MMIO_DH(PCH_ADPA, D_PRE_SKL, NULL, pch_adpa_mmio_write);
   439	
   440		MMIO_DH(_MMIO(_PCH_TRANSACONF), D_ALL, NULL, transconf_mmio_write);
   441		MMIO_DH(_MMIO(_PCH_TRANSBCONF), D_ALL, NULL, transconf_mmio_write);
   442	
   443		MMIO_DH(FDI_RX_IIR(PIPE_A), D_ALL, NULL, fdi_rx_iir_mmio_write);
   444		MMIO_DH(FDI_RX_IIR(PIPE_B), D_ALL, NULL, fdi_rx_iir_mmio_write);
   445		MMIO_DH(FDI_RX_IIR(PIPE_C), D_ALL, NULL, fdi_rx_iir_mmio_write);
   446		MMIO_DH(FDI_RX_IMR(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
   447		MMIO_DH(FDI_RX_IMR(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
   448		MMIO_DH(FDI_RX_IMR(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
   449		MMIO_DH(FDI_RX_CTL(PIPE_A), D_ALL, NULL, update_fdi_rx_iir_status);
   450		MMIO_DH(FDI_RX_CTL(PIPE_B), D_ALL, NULL, update_fdi_rx_iir_status);
   451		MMIO_DH(FDI_RX_CTL(PIPE_C), D_ALL, NULL, update_fdi_rx_iir_status);
   452	
   453		MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_A), D_ALL);
   454		MMIO_D(_MMIO(_PCH_TRANS_HBLANK_A), D_ALL);
   455		MMIO_D(_MMIO(_PCH_TRANS_HSYNC_A), D_ALL);
   456		MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_A), D_ALL);
   457		MMIO_D(_MMIO(_PCH_TRANS_VBLANK_A), D_ALL);
   458		MMIO_D(_MMIO(_PCH_TRANS_VSYNC_A), D_ALL);
   459		MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_A), D_ALL);
   460	
   461		MMIO_D(_MMIO(_PCH_TRANS_HTOTAL_B), D_ALL);
   462		MMIO_D(_MMIO(_PCH_TRANS_HBLANK_B), D_ALL);
   463		MMIO_D(_MMIO(_PCH_TRANS_HSYNC_B), D_ALL);
   464		MMIO_D(_MMIO(_PCH_TRANS_VTOTAL_B), D_ALL);
   465		MMIO_D(_MMIO(_PCH_TRANS_VBLANK_B), D_ALL);
   466		MMIO_D(_MMIO(_PCH_TRANS_VSYNC_B), D_ALL);
   467		MMIO_D(_MMIO(_PCH_TRANS_VSYNCSHIFT_B), D_ALL);
   468	
   469		MMIO_D(_MMIO(_PCH_TRANSA_DATA_M1), D_ALL);
   470		MMIO_D(_MMIO(_PCH_TRANSA_DATA_N1), D_ALL);
   471		MMIO_D(_MMIO(_PCH_TRANSA_DATA_M2), D_ALL);
   472		MMIO_D(_MMIO(_PCH_TRANSA_DATA_N2), D_ALL);
   473		MMIO_D(_MMIO(_PCH_TRANSA_LINK_M1), D_ALL);
   474		MMIO_D(_MMIO(_PCH_TRANSA_LINK_N1), D_ALL);
   475		MMIO_D(_MMIO(_PCH_TRANSA_LINK_M2), D_ALL);
   476		MMIO_D(_MMIO(_PCH_TRANSA_LINK_N2), D_ALL);
   477	
   478		MMIO_D(TRANS_DP_CTL(PIPE_A), D_ALL);
   479		MMIO_D(TRANS_DP_CTL(PIPE_B), D_ALL);
   480		MMIO_D(TRANS_DP_CTL(PIPE_C), D_ALL);
   481	
   482		MMIO_D(TVIDEO_DIP_CTL(PIPE_A), D_ALL);
   483		MMIO_D(TVIDEO_DIP_DATA(PIPE_A), D_ALL);
   484		MMIO_D(TVIDEO_DIP_GCP(PIPE_A), D_ALL);
   485	
   486		MMIO_D(TVIDEO_DIP_CTL(PIPE_B), D_ALL);
   487		MMIO_D(TVIDEO_DIP_DATA(PIPE_B), D_ALL);
   488		MMIO_D(TVIDEO_DIP_GCP(PIPE_B), D_ALL);
   489	
   490		MMIO_D(TVIDEO_DIP_CTL(PIPE_C), D_ALL);
   491		MMIO_D(TVIDEO_DIP_DATA(PIPE_C), D_ALL);
   492		MMIO_D(TVIDEO_DIP_GCP(PIPE_C), D_ALL);
   493	
   494		MMIO_D(_MMIO(_FDI_RXA_MISC), D_ALL);
   495		MMIO_D(_MMIO(_FDI_RXB_MISC), D_ALL);
   496		MMIO_D(_MMIO(_FDI_RXA_TUSIZE1), D_ALL);
   497		MMIO_D(_MMIO(_FDI_RXA_TUSIZE2), D_ALL);
   498		MMIO_D(_MMIO(_FDI_RXB_TUSIZE1), D_ALL);
   499		MMIO_D(_MMIO(_FDI_RXB_TUSIZE2), D_ALL);
   500	
   501		MMIO_DH(PCH_PP_CONTROL, D_ALL, NULL, pch_pp_control_mmio_write);
   502		MMIO_D(PCH_PP_DIVISOR, D_ALL);
   503		MMIO_D(PCH_PP_STATUS,  D_ALL);
   504		MMIO_D(PCH_LVDS, D_ALL);
   505		MMIO_D(_MMIO(_PCH_DPLL_A), D_ALL);
   506		MMIO_D(_MMIO(_PCH_DPLL_B), D_ALL);
   507		MMIO_D(_MMIO(_PCH_FPA0), D_ALL);
   508		MMIO_D(_MMIO(_PCH_FPA1), D_ALL);
   509		MMIO_D(_MMIO(_PCH_FPB0), D_ALL);
   510		MMIO_D(_MMIO(_PCH_FPB1), D_ALL);
   511		MMIO_D(PCH_DREF_CONTROL, D_ALL);
   512		MMIO_D(PCH_RAWCLK_FREQ, D_ALL);
   513		MMIO_D(PCH_DPLL_SEL, D_ALL);
   514	
   515		MMIO_D(_MMIO(0x61208), D_ALL);
   516		MMIO_D(_MMIO(0x6120c), D_ALL);
   517		MMIO_D(PCH_PP_ON_DELAYS, D_ALL);
   518		MMIO_D(PCH_PP_OFF_DELAYS, D_ALL);
   519	
   520		MMIO_DH(_MMIO(0xe651c), D_ALL, dpy_reg_mmio_read, NULL);
   521		MMIO_DH(_MMIO(0xe661c), D_ALL, dpy_reg_mmio_read, NULL);
   522		MMIO_DH(_MMIO(0xe671c), D_ALL, dpy_reg_mmio_read, NULL);
   523		MMIO_DH(_MMIO(0xe681c), D_ALL, dpy_reg_mmio_read, NULL);
   524		MMIO_DH(_MMIO(0xe6c04), D_ALL, dpy_reg_mmio_read, NULL);
   525		MMIO_DH(_MMIO(0xe6e1c), D_ALL, dpy_reg_mmio_read, NULL);
   526	
   527		MMIO_RO(PCH_PORT_HOTPLUG, D_ALL, 0,
   528			PORTA_HOTPLUG_STATUS_MASK
   529			| PORTB_HOTPLUG_STATUS_MASK
   530			| PORTC_HOTPLUG_STATUS_MASK
   531			| PORTD_HOTPLUG_STATUS_MASK,
   532			NULL, NULL);
   533	
   534		MMIO_DH(LCPLL_CTL, D_ALL, NULL, lcpll_ctl_mmio_write);
   535		MMIO_D(FUSE_STRAP, D_ALL);
   536		MMIO_D(DIGITAL_PORT_HOTPLUG_CNTRL, D_ALL);
   537	
   538		MMIO_D(DISP_ARB_CTL, D_ALL);
   539		MMIO_D(DISP_ARB_CTL2, D_ALL);
   540	
   541		MMIO_D(ILK_DISPLAY_CHICKEN1, D_ALL);
   542		MMIO_D(ILK_DISPLAY_CHICKEN2, D_ALL);
   543		MMIO_D(ILK_DSPCLK_GATE_D, D_ALL);
   544	
   545		MMIO_D(SOUTH_CHICKEN1, D_ALL);
   546		MMIO_DH(SOUTH_CHICKEN2, D_ALL, NULL, south_chicken2_mmio_write);
   547		MMIO_D(_MMIO(_TRANSA_CHICKEN1), D_ALL);
   548		MMIO_D(_MMIO(_TRANSB_CHICKEN1), D_ALL);
   549		MMIO_D(SOUTH_DSPCLK_GATE_D, D_ALL);
   550		MMIO_D(_MMIO(_TRANSA_CHICKEN2), D_ALL);
   551		MMIO_D(_MMIO(_TRANSB_CHICKEN2), D_ALL);
   552	
   553		MMIO_D(ILK_DPFC_CB_BASE, D_ALL);
   554		MMIO_D(ILK_DPFC_CONTROL, D_ALL);
   555		MMIO_D(ILK_DPFC_RECOMP_CTL, D_ALL);
   556		MMIO_D(ILK_DPFC_STATUS, D_ALL);
   557		MMIO_D(ILK_DPFC_FENCE_YOFF, D_ALL);
   558		MMIO_D(ILK_DPFC_CHICKEN, D_ALL);
   559		MMIO_D(ILK_FBC_RT_BASE, D_ALL);
   560	
   561		MMIO_D(IPS_CTL, D_ALL);
   562	
   563		MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_A), D_ALL);
   564		MMIO_D(PIPE_CSC_COEFF_BY(PIPE_A), D_ALL);
   565		MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_A), D_ALL);
   566		MMIO_D(PIPE_CSC_COEFF_BU(PIPE_A), D_ALL);
   567		MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_A), D_ALL);
   568		MMIO_D(PIPE_CSC_COEFF_BV(PIPE_A), D_ALL);
   569		MMIO_D(PIPE_CSC_MODE(PIPE_A), D_ALL);
   570		MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_A), D_ALL);
   571		MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_A), D_ALL);
   572		MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_A), D_ALL);
   573		MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_A), D_ALL);
   574		MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_A), D_ALL);
   575		MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_A), D_ALL);
   576	
   577		MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_B), D_ALL);
   578		MMIO_D(PIPE_CSC_COEFF_BY(PIPE_B), D_ALL);
   579		MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_B), D_ALL);
   580		MMIO_D(PIPE_CSC_COEFF_BU(PIPE_B), D_ALL);
   581		MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_B), D_ALL);
   582		MMIO_D(PIPE_CSC_COEFF_BV(PIPE_B), D_ALL);
   583		MMIO_D(PIPE_CSC_MODE(PIPE_B), D_ALL);
   584		MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_B), D_ALL);
   585		MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_B), D_ALL);
   586		MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_B), D_ALL);
   587		MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_B), D_ALL);
   588		MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_B), D_ALL);
   589		MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_B), D_ALL);
   590	
   591		MMIO_D(PIPE_CSC_COEFF_RY_GY(PIPE_C), D_ALL);
   592		MMIO_D(PIPE_CSC_COEFF_BY(PIPE_C), D_ALL);
   593		MMIO_D(PIPE_CSC_COEFF_RU_GU(PIPE_C), D_ALL);
   594		MMIO_D(PIPE_CSC_COEFF_BU(PIPE_C), D_ALL);
   595		MMIO_D(PIPE_CSC_COEFF_RV_GV(PIPE_C), D_ALL);
   596		MMIO_D(PIPE_CSC_COEFF_BV(PIPE_C), D_ALL);
   597		MMIO_D(PIPE_CSC_MODE(PIPE_C), D_ALL);
   598		MMIO_D(PIPE_CSC_PREOFF_HI(PIPE_C), D_ALL);
   599		MMIO_D(PIPE_CSC_PREOFF_ME(PIPE_C), D_ALL);
   600		MMIO_D(PIPE_CSC_PREOFF_LO(PIPE_C), D_ALL);
   601		MMIO_D(PIPE_CSC_POSTOFF_HI(PIPE_C), D_ALL);
   602		MMIO_D(PIPE_CSC_POSTOFF_ME(PIPE_C), D_ALL);
   603		MMIO_D(PIPE_CSC_POSTOFF_LO(PIPE_C), D_ALL);
   604	
   605		MMIO_D(PREC_PAL_INDEX(PIPE_A), D_ALL);
   606		MMIO_D(PREC_PAL_DATA(PIPE_A), D_ALL);
   607		MMIO_F(PREC_PAL_GC_MAX(PIPE_A, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
   608	
   609		MMIO_D(PREC_PAL_INDEX(PIPE_B), D_ALL);
   610		MMIO_D(PREC_PAL_DATA(PIPE_B), D_ALL);
   611		MMIO_F(PREC_PAL_GC_MAX(PIPE_B, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
   612	
   613		MMIO_D(PREC_PAL_INDEX(PIPE_C), D_ALL);
   614		MMIO_D(PREC_PAL_DATA(PIPE_C), D_ALL);
   615		MMIO_F(PREC_PAL_GC_MAX(PIPE_C, 0), 4 * 3, 0, 0, 0, D_ALL, NULL, NULL);
   616	
   617		MMIO_D(_MMIO(0x60110), D_ALL);
   618		MMIO_D(_MMIO(0x61110), D_ALL);
   619		MMIO_F(_MMIO(0x70400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
   620		MMIO_F(_MMIO(0x71400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
   621		MMIO_F(_MMIO(0x72400), 0x40, 0, 0, 0, D_ALL, NULL, NULL);
   622		MMIO_F(_MMIO(0x70440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   623		MMIO_F(_MMIO(0x71440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   624		MMIO_F(_MMIO(0x72440), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   625		MMIO_F(_MMIO(0x7044c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   626		MMIO_F(_MMIO(0x7144c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   627		MMIO_F(_MMIO(0x7244c), 0xc, 0, 0, 0, D_PRE_SKL, NULL, NULL);
   628	
   629		MMIO_D(WM_LINETIME(PIPE_A), D_ALL);
   630		MMIO_D(WM_LINETIME(PIPE_B), D_ALL);
   631		MMIO_D(WM_LINETIME(PIPE_C), D_ALL);
   632		MMIO_D(SPLL_CTL, D_ALL);
   633		MMIO_D(_MMIO(_WRPLL_CTL1), D_ALL);
   634		MMIO_D(_MMIO(_WRPLL_CTL2), D_ALL);
   635		MMIO_D(PORT_CLK_SEL(PORT_A), D_ALL);
   636		MMIO_D(PORT_CLK_SEL(PORT_B), D_ALL);
   637		MMIO_D(PORT_CLK_SEL(PORT_C), D_ALL);
   638		MMIO_D(PORT_CLK_SEL(PORT_D), D_ALL);
   639		MMIO_D(PORT_CLK_SEL(PORT_E), D_ALL);
   640		MMIO_D(TRANS_CLK_SEL(TRANSCODER_A), D_ALL);
   641		MMIO_D(TRANS_CLK_SEL(TRANSCODER_B), D_ALL);
   642		MMIO_D(TRANS_CLK_SEL(TRANSCODER_C), D_ALL);
   643	
   644		MMIO_D(HSW_NDE_RSTWRN_OPT, D_ALL);
   645		MMIO_D(_MMIO(0x46508), D_ALL);
   646	
   647		MMIO_D(_MMIO(0x49080), D_ALL);
   648		MMIO_D(_MMIO(0x49180), D_ALL);
   649		MMIO_D(_MMIO(0x49280), D_ALL);
   650	
   651		MMIO_F(_MMIO(0x49090), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
   652		MMIO_F(_MMIO(0x49190), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
   653		MMIO_F(_MMIO(0x49290), 0x14, 0, 0, 0, D_ALL, NULL, NULL);
   654	
   655		MMIO_D(GAMMA_MODE(PIPE_A), D_ALL);
   656		MMIO_D(GAMMA_MODE(PIPE_B), D_ALL);
   657		MMIO_D(GAMMA_MODE(PIPE_C), D_ALL);
   658	
   659		MMIO_D(PIPE_MULT(PIPE_A), D_ALL);
   660		MMIO_D(PIPE_MULT(PIPE_B), D_ALL);
   661		MMIO_D(PIPE_MULT(PIPE_C), D_ALL);
   662	
   663		MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_A), D_ALL);
   664		MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_B), D_ALL);
   665		MMIO_D(HSW_TVIDEO_DIP_CTL(TRANSCODER_C), D_ALL);
   666	
   667		MMIO_DH(SFUSE_STRAP, D_ALL, NULL, NULL);
   668		MMIO_D(SBI_ADDR, D_ALL);
   669		MMIO_DH(SBI_DATA, D_ALL, sbi_data_mmio_read, NULL);
   670		MMIO_DH(SBI_CTL_STAT, D_ALL, NULL, sbi_ctl_mmio_write);
   671		MMIO_D(PIXCLK_GATE, D_ALL);
   672	
   673		MMIO_F(_MMIO(_DPA_AUX_CH_CTL), 6 * 4, 0, 0, 0, D_ALL, NULL,
   674			dp_aux_ch_ctl_mmio_write);
   675	
   676		MMIO_DH(DDI_BUF_CTL(PORT_A), D_ALL, NULL, ddi_buf_ctl_mmio_write);
   677		MMIO_DH(DDI_BUF_CTL(PORT_B), D_ALL, NULL, ddi_buf_ctl_mmio_write);
   678		MMIO_DH(DDI_BUF_CTL(PORT_C), D_ALL, NULL, ddi_buf_ctl_mmio_write);
   679		MMIO_DH(DDI_BUF_CTL(PORT_D), D_ALL, NULL, ddi_buf_ctl_mmio_write);
   680		MMIO_DH(DDI_BUF_CTL(PORT_E), D_ALL, NULL, ddi_buf_ctl_mmio_write);
   681	
   682		MMIO_DH(DP_TP_CTL(PORT_A), D_ALL, NULL, dp_tp_ctl_mmio_write);
   683		MMIO_DH(DP_TP_CTL(PORT_B), D_ALL, NULL, dp_tp_ctl_mmio_write);
   684		MMIO_DH(DP_TP_CTL(PORT_C), D_ALL, NULL, dp_tp_ctl_mmio_write);
   685		MMIO_DH(DP_TP_CTL(PORT_D), D_ALL, NULL, dp_tp_ctl_mmio_write);
   686		MMIO_DH(DP_TP_CTL(PORT_E), D_ALL, NULL, dp_tp_ctl_mmio_write);
   687	
   688		MMIO_DH(DP_TP_STATUS(PORT_A), D_ALL, NULL, dp_tp_status_mmio_write);
   689		MMIO_DH(DP_TP_STATUS(PORT_B), D_ALL, NULL, dp_tp_status_mmio_write);
   690		MMIO_DH(DP_TP_STATUS(PORT_C), D_ALL, NULL, dp_tp_status_mmio_write);
   691		MMIO_DH(DP_TP_STATUS(PORT_D), D_ALL, NULL, dp_tp_status_mmio_write);
   692		MMIO_DH(DP_TP_STATUS(PORT_E), D_ALL, NULL, NULL);
   693	
   694		MMIO_F(_MMIO(_DDI_BUF_TRANS_A), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
   695		MMIO_F(_MMIO(0x64e60), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
   696		MMIO_F(_MMIO(0x64eC0), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
   697		MMIO_F(_MMIO(0x64f20), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
   698		MMIO_F(_MMIO(0x64f80), 0x50, 0, 0, 0, D_ALL, NULL, NULL);
   699	
   700		MMIO_D(HSW_AUD_CFG(PIPE_A), D_ALL);
   701		MMIO_D(HSW_AUD_PIN_ELD_CP_VLD, D_ALL);
   702		MMIO_D(HSW_AUD_MISC_CTRL(PIPE_A), D_ALL);
   703	
   704		MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_A), D_ALL, NULL, NULL);
   705		MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_B), D_ALL, NULL, NULL);
   706		MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_C), D_ALL, NULL, NULL);
   707		MMIO_DH(_MMIO(_TRANS_DDI_FUNC_CTL_EDP), D_ALL, NULL, NULL);
   708	
   709		MMIO_D(_MMIO(_TRANSA_MSA_MISC), D_ALL);
   710		MMIO_D(_MMIO(_TRANSB_MSA_MISC), D_ALL);
   711		MMIO_D(_MMIO(_TRANSC_MSA_MISC), D_ALL);
   712		MMIO_D(_MMIO(_TRANS_EDP_MSA_MISC), D_ALL);
   713	
   714		MMIO_DH(FORCEWAKE, D_ALL, NULL, NULL);
   715		MMIO_D(FORCEWAKE_ACK, D_ALL);
   716		MMIO_D(GEN6_GT_CORE_STATUS, D_ALL);
   717		MMIO_D(GEN6_GT_THREAD_STATUS_REG, D_ALL);
   718		MMIO_DFH(GTFIFODBG, D_ALL, F_CMD_ACCESS, NULL, NULL);
   719		MMIO_DFH(GTFIFOCTL, D_ALL, F_CMD_ACCESS, NULL, NULL);
   720		MMIO_DH(FORCEWAKE_MT, D_PRE_SKL, NULL, mul_force_wake_write);
   721		MMIO_DH(FORCEWAKE_ACK_HSW, D_BDW, NULL, NULL);
   722		MMIO_D(ECOBUS, D_ALL);
   723		MMIO_DH(GEN6_RC_CONTROL, D_ALL, NULL, NULL);
   724		MMIO_DH(GEN6_RC_STATE, D_ALL, NULL, NULL);
   725		MMIO_D(GEN6_RPNSWREQ, D_ALL);
   726		MMIO_D(GEN6_RC_VIDEO_FREQ, D_ALL);
   727		MMIO_D(GEN6_RP_DOWN_TIMEOUT, D_ALL);
   728		MMIO_D(GEN6_RP_INTERRUPT_LIMITS, D_ALL);
   729		MMIO_D(GEN6_RPSTAT1, D_ALL);
   730		MMIO_D(GEN6_RP_CONTROL, D_ALL);
   731		MMIO_D(GEN6_RP_UP_THRESHOLD, D_ALL);
   732		MMIO_D(GEN6_RP_DOWN_THRESHOLD, D_ALL);
   733		MMIO_D(GEN6_RP_CUR_UP_EI, D_ALL);
   734		MMIO_D(GEN6_RP_CUR_UP, D_ALL);
   735		MMIO_D(GEN6_RP_PREV_UP, D_ALL);
   736		MMIO_D(GEN6_RP_CUR_DOWN_EI, D_ALL);
   737		MMIO_D(GEN6_RP_CUR_DOWN, D_ALL);
   738		MMIO_D(GEN6_RP_PREV_DOWN, D_ALL);
   739		MMIO_D(GEN6_RP_UP_EI, D_ALL);
   740		MMIO_D(GEN6_RP_DOWN_EI, D_ALL);
   741		MMIO_D(GEN6_RP_IDLE_HYSTERSIS, D_ALL);
   742		MMIO_D(GEN6_RC1_WAKE_RATE_LIMIT, D_ALL);
   743		MMIO_D(GEN6_RC6_WAKE_RATE_LIMIT, D_ALL);
   744		MMIO_D(GEN6_RC6pp_WAKE_RATE_LIMIT, D_ALL);
   745		MMIO_D(GEN6_RC_EVALUATION_INTERVAL, D_ALL);
   746		MMIO_D(GEN6_RC_IDLE_HYSTERSIS, D_ALL);
   747		MMIO_D(GEN6_RC_SLEEP, D_ALL);
   748		MMIO_D(GEN6_RC1e_THRESHOLD, D_ALL);
   749		MMIO_D(GEN6_RC6_THRESHOLD, D_ALL);
   750		MMIO_D(GEN6_RC6p_THRESHOLD, D_ALL);
   751		MMIO_D(GEN6_RC6pp_THRESHOLD, D_ALL);
   752		MMIO_D(GEN6_PMINTRMSK, D_ALL);
   753		MMIO_DH(HSW_PWR_WELL_CTL1, D_BDW, NULL, power_well_ctl_mmio_write);
   754		MMIO_DH(HSW_PWR_WELL_CTL2, D_BDW, NULL, power_well_ctl_mmio_write);
   755		MMIO_DH(HSW_PWR_WELL_CTL3, D_BDW, NULL, power_well_ctl_mmio_write);
   756		MMIO_DH(HSW_PWR_WELL_CTL4, D_BDW, NULL, power_well_ctl_mmio_write);
   757		MMIO_DH(HSW_PWR_WELL_CTL5, D_BDW, NULL, power_well_ctl_mmio_write);
   758		MMIO_DH(HSW_PWR_WELL_CTL6, D_BDW, NULL, power_well_ctl_mmio_write);
   759	
   760		MMIO_D(RSTDBYCTL, D_ALL);
   761	
   762		MMIO_DH(GEN6_GDRST, D_ALL, NULL, gdrst_mmio_write);
   763		MMIO_F(FENCE_REG_GEN6_LO(0), 0x80, 0, 0, 0, D_ALL, fence_mmio_read, fence_mmio_write);
   764		MMIO_DH(CPU_VGACNTRL, D_ALL, NULL, vga_control_mmio_write);
   765	
   766		MMIO_D(TILECTL, D_ALL);
   767	
   768		MMIO_D(GEN6_UCGCTL1, D_ALL);
   769		MMIO_D(GEN6_UCGCTL2, D_ALL);
   770	
   771		MMIO_F(_MMIO(0x4f000), 0x90, 0, 0, 0, D_ALL, NULL, NULL);
   772	
   773		MMIO_D(GEN6_PCODE_DATA, D_ALL);
   774		MMIO_D(_MMIO(0x13812c), D_ALL);
   775		MMIO_DH(GEN7_ERR_INT, D_ALL, NULL, NULL);
   776		MMIO_D(HSW_EDRAM_CAP, D_ALL);
   777		MMIO_D(HSW_IDICR, D_ALL);
   778		MMIO_DH(GFX_FLSH_CNTL_GEN6, D_ALL, NULL, NULL);
   779	
   780		MMIO_D(_MMIO(0x3c), D_ALL);
   781		MMIO_D(_MMIO(0x860), D_ALL);
   782		MMIO_D(ECOSKPD, D_ALL);
   783		MMIO_D(_MMIO(0x121d0), D_ALL);
   784		MMIO_D(GEN6_BLITTER_ECOSKPD, D_ALL);
   785		MMIO_D(_MMIO(0x41d0), D_ALL);
   786		MMIO_D(GAC_ECO_BITS, D_ALL);
   787		MMIO_D(_MMIO(0x6200), D_ALL);
   788		MMIO_D(_MMIO(0x6204), D_ALL);
   789		MMIO_D(_MMIO(0x6208), D_ALL);
   790		MMIO_D(_MMIO(0x7118), D_ALL);
   791		MMIO_D(_MMIO(0x7180), D_ALL);
   792		MMIO_D(_MMIO(0x7408), D_ALL);
   793		MMIO_D(_MMIO(0x7c00), D_ALL);
   794		MMIO_DH(GEN6_MBCTL, D_ALL, NULL, mbctl_write);
   795		MMIO_D(_MMIO(0x911c), D_ALL);
   796		MMIO_D(_MMIO(0x9120), D_ALL);
   797		MMIO_DFH(GEN7_UCGCTL4, D_ALL, F_CMD_ACCESS, NULL, NULL);
   798	
   799		MMIO_D(GAB_CTL, D_ALL);
   800		MMIO_D(_MMIO(0x48800), D_ALL);
   801		MMIO_D(_MMIO(0xce044), D_ALL);
   802		MMIO_D(_MMIO(0xe6500), D_ALL);
   803		MMIO_D(_MMIO(0xe6504), D_ALL);
   804		MMIO_D(_MMIO(0xe6600), D_ALL);
   805		MMIO_D(_MMIO(0xe6604), D_ALL);
   806		MMIO_D(_MMIO(0xe6700), D_ALL);
   807		MMIO_D(_MMIO(0xe6704), D_ALL);
   808		MMIO_D(_MMIO(0xe6800), D_ALL);
   809		MMIO_D(_MMIO(0xe6804), D_ALL);
   810		MMIO_D(PCH_GMBUS4, D_ALL);
   811		MMIO_D(PCH_GMBUS5, D_ALL);
   812	
   813		MMIO_D(_MMIO(0x902c), D_ALL);
   814		MMIO_D(_MMIO(0xec008), D_ALL);
   815		MMIO_D(_MMIO(0xec00c), D_ALL);
   816		MMIO_D(_MMIO(0xec008 + 0x18), D_ALL);
   817		MMIO_D(_MMIO(0xec00c + 0x18), D_ALL);
   818		MMIO_D(_MMIO(0xec008 + 0x18 * 2), D_ALL);
   819		MMIO_D(_MMIO(0xec00c + 0x18 * 2), D_ALL);
   820		MMIO_D(_MMIO(0xec008 + 0x18 * 3), D_ALL);
   821		MMIO_D(_MMIO(0xec00c + 0x18 * 3), D_ALL);
   822		MMIO_D(_MMIO(0xec408), D_ALL);
   823		MMIO_D(_MMIO(0xec40c), D_ALL);
   824		MMIO_D(_MMIO(0xec408 + 0x18), D_ALL);
   825		MMIO_D(_MMIO(0xec40c + 0x18), D_ALL);
   826		MMIO_D(_MMIO(0xec408 + 0x18 * 2), D_ALL);
   827		MMIO_D(_MMIO(0xec40c + 0x18 * 2), D_ALL);
   828		MMIO_D(_MMIO(0xec408 + 0x18 * 3), D_ALL);
   829		MMIO_D(_MMIO(0xec40c + 0x18 * 3), D_ALL);
   830		MMIO_D(_MMIO(0xfc810), D_ALL);
   831		MMIO_D(_MMIO(0xfc81c), D_ALL);
   832		MMIO_D(_MMIO(0xfc828), D_ALL);
   833		MMIO_D(_MMIO(0xfc834), D_ALL);
   834		MMIO_D(_MMIO(0xfcc00), D_ALL);
   835		MMIO_D(_MMIO(0xfcc0c), D_ALL);
   836		MMIO_D(_MMIO(0xfcc18), D_ALL);
   837		MMIO_D(_MMIO(0xfcc24), D_ALL);
   838		MMIO_D(_MMIO(0xfd000), D_ALL);
   839		MMIO_D(_MMIO(0xfd00c), D_ALL);
   840		MMIO_D(_MMIO(0xfd018), D_ALL);
   841		MMIO_D(_MMIO(0xfd024), D_ALL);
   842		MMIO_D(_MMIO(0xfd034), D_ALL);
   843	
   844		MMIO_DH(FPGA_DBG, D_ALL, NULL, fpga_dbg_mmio_write);
   845		MMIO_D(_MMIO(0x2054), D_ALL);
   846		MMIO_D(_MMIO(0x12054), D_ALL);
   847		MMIO_D(_MMIO(0x22054), D_ALL);
   848		MMIO_D(_MMIO(0x1a054), D_ALL);
   849	
   850		MMIO_D(_MMIO(0x44070), D_ALL);
   851		MMIO_DFH(_MMIO(0x215c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   852		MMIO_DFH(_MMIO(0x2178), D_ALL, F_CMD_ACCESS, NULL, NULL);
   853		MMIO_DFH(_MMIO(0x217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
   854		MMIO_DFH(_MMIO(0x12178), D_ALL, F_CMD_ACCESS, NULL, NULL);
   855		MMIO_DFH(_MMIO(0x1217c), D_ALL, F_CMD_ACCESS, NULL, NULL);
   856	
   857		MMIO_F(_MMIO(0x2290), 8, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL, NULL);
   858		MMIO_D(_MMIO(0x2b00), D_BDW_PLUS);
   859		MMIO_D(_MMIO(0x2360), D_BDW_PLUS);
   860		MMIO_F(_MMIO(0x5200), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   861		MMIO_F(_MMIO(0x5240), 32, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   862		MMIO_F(_MMIO(0x5280), 16, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   863	
   864		MMIO_DFH(_MMIO(0x1c17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   865		MMIO_DFH(_MMIO(0x1c178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   866		MMIO_DFH(BCS_SWCTRL, D_ALL, F_CMD_ACCESS, NULL, NULL);
   867	
   868		MMIO_F(HS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   869		MMIO_F(DS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   870		MMIO_F(IA_VERTICES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   871		MMIO_F(IA_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   872		MMIO_F(VS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   873		MMIO_F(GS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   874		MMIO_F(GS_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   875		MMIO_F(CL_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   876		MMIO_F(CL_PRIMITIVES_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   877		MMIO_F(PS_INVOCATION_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   878		MMIO_F(PS_DEPTH_COUNT, 8, F_CMD_ACCESS, 0, 0, D_ALL, NULL, NULL);
   879		MMIO_DH(_MMIO(0x4260), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
   880		MMIO_DH(_MMIO(0x4264), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
   881		MMIO_DH(_MMIO(0x4268), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
   882		MMIO_DH(_MMIO(0x426c), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
   883		MMIO_DH(_MMIO(0x4270), D_BDW_PLUS, NULL, gvt_reg_tlb_control_handler);
   884		MMIO_DFH(_MMIO(0x4094), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   885	
   886		MMIO_DFH(ARB_MODE, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
   887		MMIO_RING_GM(RING_BBADDR, D_ALL, NULL, NULL);
   888		MMIO_DFH(_MMIO(0x2220), D_ALL, F_CMD_ACCESS, NULL, NULL);
   889		MMIO_DFH(_MMIO(0x12220), D_ALL, F_CMD_ACCESS, NULL, NULL);
   890		MMIO_DFH(_MMIO(0x22220), D_ALL, F_CMD_ACCESS, NULL, NULL);
   891		MMIO_RING_DFH(RING_SYNC_1, D_ALL, F_CMD_ACCESS, NULL, NULL);
   892		MMIO_RING_DFH(RING_SYNC_0, D_ALL, F_CMD_ACCESS, NULL, NULL);
   893		MMIO_DFH(_MMIO(0x22178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   894		MMIO_DFH(_MMIO(0x1a178), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   895		MMIO_DFH(_MMIO(0x1a17c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   896		MMIO_DFH(_MMIO(0x2217c), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
   897	
   898		MMIO_DH(EDP_PSR_IMR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
   899		MMIO_DH(EDP_PSR_IIR, D_BDW_PLUS, NULL, edp_psr_imr_iir_write);
   900		MMIO_DH(GUC_STATUS, D_ALL, guc_status_read, NULL);
   901	
   902		return 0;
   903	}
   904	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--mP3DRpeJDSE+ciuQ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--mP3DRpeJDSE+ciuQ--
