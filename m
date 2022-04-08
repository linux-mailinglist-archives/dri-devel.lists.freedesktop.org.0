Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714194F963E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65E10F162;
	Fri,  8 Apr 2022 12:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00E010F15C;
 Fri,  8 Apr 2022 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649422648; x=1680958648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vgrTzyoKMqjmE/kdV28EOKl5RCHZO9YrE934eNG595Q=;
 b=nAiUnlyaarWvsgXxdoZTGeKK35nGQ8Fx8f6kQe5tpVath98+NTZ0PMAD
 hqLf/nEC6ELNGzrJ0ruWSl9vTc8n2AOiqqwn2BG+z4JRcBkemxQjyZz/8
 nPmNgft868uXlF58jJXHmhePzOfs6rDNI6y221Bg9ZNGp6yTfQSW4/kZ9
 SrQt1atXsQHa51+G+9O+hNmzZ+Egh17wonI/I9tNPwkgOK7gBwvtGZHgJ
 D6bx8GN+G0EghNkDmpBspAzhcxi6WLOSwr0DdBV6pSusw1cF6IiGVkI3p
 cvpvuIJQfc9SxH3do56J9erpwqi+G3wT4y5y89Oq1NkwMMsyW7bKR20i0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286574989"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="286574989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 05:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="795038516"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2022 05:57:25 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncoB2-0000Gt-CX;
 Fri, 08 Apr 2022 12:57:24 +0000
Date: Fri, 8 Apr 2022 20:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH 3/3] drm/amd/display: Move connector debugfs to drm
Message-ID: <202204082024.SJWgNUte-lkp@intel.com>
References: <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408065350.1485328-4-bhanuprakash.modem@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, kbuild-all@lists.01.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bhanuprakash,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20220408]
[cannot apply to drm/drm-next v5.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhanuprakash-Modem/Expose-max-and-current-bpc-via-debugfs/20220408-145638
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: s390-randconfig-r022-20220408 (https://download.01.org/0day-ci/archive/20220408/202204082024.SJWgNUte-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/25c70426c3d3454fc0c82bc71b101bf7b8bdf11f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bhanuprakash-Modem/Expose-max-and-current-bpc-via-debugfs/20220408-145638
        git checkout 25c70426c3d3454fc0c82bc71b101bf7b8bdf11f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dmub/dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2961:26: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
    2961 |                 uint64_t temp;
         |                          ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_crtc_late_register':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6614:9: error: implicit declaration of function 'crtc_debugfs_init'; did you mean 'amdgpu_debugfs_init'? [-Werror=implicit-function-declaration]
    6614 |         crtc_debugfs_init(crtc);
         |         ^~~~~~~~~~~~~~~~~
         |         amdgpu_debugfs_init
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link_enc_cfg.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:32:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:128:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     128 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:125:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     125 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5, 0};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:124:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     124 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3, 0};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6614 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland 2017-08-10  6611  
e69231c4451ae0 Wayne Lin      2021-03-08  6612  static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
86bc221918925a Wayne Lin      2021-03-02  6613  {
86bc221918925a Wayne Lin      2021-03-02 @6614  	crtc_debugfs_init(crtc);
86bc221918925a Wayne Lin      2021-03-02  6615  
86bc221918925a Wayne Lin      2021-03-02  6616  	return 0;
86bc221918925a Wayne Lin      2021-03-02  6617  }
86bc221918925a Wayne Lin      2021-03-02  6618  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
