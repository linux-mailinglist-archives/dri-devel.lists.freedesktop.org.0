Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4845AC140
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 21:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779E10E060;
	Sat,  3 Sep 2022 19:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1EE10E060;
 Sat,  3 Sep 2022 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662234669; x=1693770669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3NPntIDVBvHXGIzNn2Egr3SFUyvwpkrt48LyCws0pmg=;
 b=ZddUeGP/KjZPOFmWKUwBrFbBn62bGyRUMBSm3igNYhlpK/iW/JpTxvwq
 7XeoyxOeJ4HnzzJyWi/hzZVnpn7mC+lhJWeWbQp+e9YB6OG+Xm7Qr2ut9
 rhMmEZDYLArrhREBdFO6IKB7bokLlVIR6vgr67yzqlxrEXeJFvZSIskak
 fXmgH2yt0fobEuqrINSOBsq323jw0aZ9BjS+fbaWPGhEm24j0SSfUOxd3
 uS0p8dTYODp1FzkrJmD3vRqqNDT7pYZbcGLDV8Yaeevc6oxpOUvdAD1aO
 zatAnzYby32zhq8DOM6FZQQUIDXWCghoYzIL2eusbuNV0V48sdypgVgWJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="357897766"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; d="scan'208";a="357897766"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2022 12:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; d="scan'208";a="739193302"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 03 Sep 2022 12:51:03 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oUZAU-00026P-1a;
 Sat, 03 Sep 2022 19:51:02 +0000
Date: Sun, 4 Sep 2022 03:50:41 +0800
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
Subject: Re: [PATCH v2 6/8] drm/amd/display: Introduce KUnit tests for
 dcn20_fpu
Message-ID: <202209040310.aa1jd14e-lkp@intel.com>
References: <20220831172239.344446-7-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831172239.344446-7-mairacanal@riseup.net>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-amd-display-Introduce-KUnit-to-Display-Mode-Library/20220901-012715
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220904/202209040310.aa1jd14e-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/6b01e906d58654fb9c209fa848883658d203b073
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-amd-display-Introduce-KUnit-to-Display-Mode-Library/20220901-012715
        git checkout 6b01e906d58654fb9c209fa848883658d203b073
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/tests/dc/dml/dcn20/dcn20_fpu_test.c:455:5: warning: no previous prototype for 'dcn20_fpu_dcn21_update_bw_bounding_box_test_init' [-Wmissing-prototypes]
     455 | int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/resource.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/tests/dc/dml/dcn20/dcn20_fpu_test.c:10:
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


vim +/dcn20_fpu_dcn21_update_bw_bounding_box_test_init +455 drivers/gpu/drm/amd/amdgpu/../display/tests/dc/dml/dcn20/dcn20_fpu_test.c

   450	
   451	/**
   452	 * dcn20_fpu_dcn21_update_bw_bounding_box_test_init - Store backup copies of DCN global structures
   453	 * @test: represents a running instance of a test.
   454	 */
 > 455	int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
   456	{
   457		memcpy(&original_dcn2_1_soc, &dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
   458		memcpy(&original_dcn2_1_ip, &dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
   459	
   460		return 0;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
