Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D04D3B08
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 21:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2D10E427;
	Wed,  9 Mar 2022 20:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B254510E41A;
 Wed,  9 Mar 2022 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646857582; x=1678393582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XYGYiiHogmpFuHGy6AO1d/vfoZSLV1I1q11IeeQJ4DE=;
 b=X6OskWMKJz3ZqhP4DdeMXGxlhw38nU0vTLxdjgt7zriy3RsaoM0Puof5
 yGGWe1YPmienjLnZ6MGeMpVzS9SghBys3V2AIVApOjeZ2AAiOeC/c0Djp
 ebxagnpwb7gpP719Y8slTgqnvvDBuUoNny2S4QnJUgzDkA2MH1LM6iiJ/
 adiziyfBl+Xz2iEEl5MpoN4/Lvboo443I8X+fm0P9fs7umVndEu9T78sS
 LfdIxT9T4Wv9pMKPL7aTNLXP3pUoIlmJLao8hxUR9NmSSh3l4cG1WGvTF
 FCWWHOHiOMqp7b9J7/wijQFRjTjFyNQah9Hf9TUMwAjqWRLMtyjvSXPqM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235691560"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="235691560"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 12:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="596404224"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2022 12:26:18 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nS2sz-0003nJ-UM; Wed, 09 Mar 2022 20:26:17 +0000
Date: Thu, 10 Mar 2022 04:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, harry.wentland@amd.com,
 alexdeucher@gmail.com
Subject: Re: [PATCH v2] drm/amdgpu: Add support for drm_privacy_screen
Message-ID: <202203100441.aipzrKHU-lkp@intel.com>
References: <20220309150606.1877288-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309150606.1877288-1-sean@poorly.run>
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 hdegoede@redhat.com, Sean Paul <seanpaul@chromium.org>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 rajatja@google.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next next-20220309]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sean-Paul/drm-amdgpu-Add-support-for-drm_privacy_screen/20220309-230712
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arc-randconfig-r043-20220309 (https://download.01.org/0day-ci/archive/20220310/202203100441.aipzrKHU-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6fedd7f8ea75c68634df4fa3cbacb0ee5f2fc984
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sean-Paul/drm-amdgpu-Add-support-for-drm_privacy_screen/20220309-230712
        git checkout 6fedd7f8ea75c68634df4fa3cbacb0ee5f2fc984
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:44:
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h: In function 'dmub_rb_flush_pending':
   drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2961:26: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
    2961 |                 uint64_t temp;
         |                          ^~~~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:26:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c: In function 'amdgpu_dm_initialize_dp_connector':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
      41 | #define dev_fmt(fmt) "amdgpu: " fmt
         |                      ^~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
     425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
     438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:533:25: note: in expansion of macro 'drm_err'
     533 |                         drm_err(dev, "Error getting privacy screen, ret=%d\n",
         |                         ^~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/dc_link_ddc.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:39:
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


vim +41 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h

539489fc91ea77 Aurabindo Pillai 2020-04-08  40  
539489fc91ea77 Aurabindo Pillai 2020-04-08 @41  #define dev_fmt(fmt) "amdgpu: " fmt
539489fc91ea77 Aurabindo Pillai 2020-04-08  42  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
