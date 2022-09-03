Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16135ABECC
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 13:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAB410E9BF;
	Sat,  3 Sep 2022 11:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8030710E97E;
 Sat,  3 Sep 2022 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662205714; x=1693741714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PTRpdYTZVjkzB9A3G/dP9KDaNGEagJf1u6l6G72lnkM=;
 b=DVt/195JwG0ywJw2ZJFRt42o/GpVRaGxj+fyAA2CwB/xCCOK2vRwvpNP
 Celvqt4MYYUnUznxcSPRNNWwwM7RKLBGygrlFRDYvjxx9WqSnxqPleHKs
 F6S1vCdoq3WXCzDDSkBEIblguyptm6coyDT2Xd+8JtIveJQVjde/KHR86
 kQ04MK9ZGkA8CI6eVUIPOw9Zpn/mgi2L6KJVUwj4qJVvjfLudo4HHW5dY
 RmOwFcfqfH71Cm9UcEY6B5TztalGPjmnU6m3HeQ9If0UoYV6zMaQ69hRx
 YK7cxUaC2IjNjgEZ+d0pET4Ae6lINRvJcqVgSFCHIzsWcEkgInjBDMqVh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="357866838"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; d="scan'208";a="357866838"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2022 04:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; d="scan'208";a="702412172"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2022 04:48:28 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oURdT-0001ad-1q;
 Sat, 03 Sep 2022 11:48:27 +0000
Date: Sat, 3 Sep 2022 19:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 7/8] drm/amd/display: Introduce KUnit tests to
 dc_dmub_srv library
Message-ID: <202209031904.Q8eJt6X4-lkp@intel.com>
References: <20220831172239.344446-8-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831172239.344446-8-mairacanal@riseup.net>
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
Cc: kbuild-all@lists.01.org, magalilemes00@gmail.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Maíra,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-amd-display-Introduce-KUnit-to-Display-Mode-Library/20220901-012715
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20220903/202209031904.Q8eJt6X4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/510f486251586c33675dc1e1639f1b5fa2bd0da7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-amd-display-Introduce-KUnit-to-Display-Mode-Library/20220901-012715
        git checkout 510f486251586c33675dc1e1639f1b5fa2bd0da7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:814:
   drivers/gpu/drm/amd/amdgpu/../display/dc/../tests/dc/dc_dmub_srv_test.c: In function 'populate_subvp_cmd_drr_info_test':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/../tests/dc/dc_dmub_srv_test.c:260:9: error: implicit declaration of function 'populate_subvp_cmd_drr_info'; did you mean 'populate_subvp_cmd_drr_info_test'? [-Werror=implicit-function-declaration]
     260 |         populate_subvp_cmd_drr_info(test_param->dc, test_param->subvp_pipe,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         populate_subvp_cmd_drr_info_test
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:31:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:137:22: warning: 'SYNAPTICS_DEVICE_ID' defined but not used [-Wunused-const-variable=]
     137 | static const uint8_t SYNAPTICS_DEVICE_ID[] = "SYNA";
         |                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:134:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]
     134 | static const u8 DP_SINK_BRANCH_DEV_NAME_7580[] = "7580\x80u";
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:132:22: warning: 'DP_SINK_DEVICE_STR_ID_2' defined but not used [-Wunused-const-variable=]
     132 | static const uint8_t DP_SINK_DEVICE_STR_ID_2[] = {7, 1, 8, 7, 5, 0};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:131:22: warning: 'DP_SINK_DEVICE_STR_ID_1' defined but not used [-Wunused-const-variable=]
     131 | static const uint8_t DP_SINK_DEVICE_STR_ID_1[] = {7, 1, 8, 7, 3, 0};
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +260 drivers/gpu/drm/amd/amdgpu/../display/dc/../tests/dc/dc_dmub_srv_test.c

   246	
   247	KUNIT_ARRAY_PARAM(populate_subvp_cmd_drr_info, populate_subvp_cmd_drr_info_cases,
   248			  populate_subvp_cmd_drr_info_test_to_desc);
   249	
   250	static void populate_subvp_cmd_drr_info_test(struct kunit *test)
   251	{
   252		const struct populate_subvp_cmd_drr_info_test_case *test_param =
   253			test->param_value;
   254		struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data;
   255	
   256		pipe_data = kunit_kzalloc(test,
   257					  sizeof(struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2),
   258					  GFP_KERNEL);
   259	
 > 260		populate_subvp_cmd_drr_info(test_param->dc, test_param->subvp_pipe,
   261					    test_param->vblank_pipe, pipe_data);
   262	
   263		KUNIT_EXPECT_EQ(test, test_param->drr_in_use,
   264				pipe_data->pipe_config.vblank_data.drr_info.drr_in_use);
   265		KUNIT_EXPECT_EQ(test, test_param->drr_window_size_ms,
   266				pipe_data->pipe_config.vblank_data.drr_info.drr_window_size_ms);
   267		KUNIT_EXPECT_EQ(test, test_param->use_ramping,
   268				pipe_data->pipe_config.vblank_data.drr_info.use_ramping);
   269		KUNIT_EXPECT_EQ(test, test_param->min_vtotal_supported,
   270				pipe_data->pipe_config.vblank_data.drr_info.min_vtotal_supported);
   271		KUNIT_EXPECT_EQ(test, test_param->max_vtotal_supported,
   272				pipe_data->pipe_config.vblank_data.drr_info.max_vtotal_supported);
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
