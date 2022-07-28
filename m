Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA258387D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 08:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416EA1128C1;
	Thu, 28 Jul 2022 06:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B979556D;
 Thu, 28 Jul 2022 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658988719; x=1690524719;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Xr51dimz+9TGtjOW1YNz+19g5Rc4+NHVfupjAhgEi5g=;
 b=JuHc1QZlYE5ahVNVogxAZP4hDr7VIPpWVIvnnXP4gF7l5ypdmDBtcI85
 cmD1eNo+2oL3ECHCclvo+OU4EC5U/jsoa1uD2S1GtkJ+d34cvc6kxsEJa
 z9Ben9cbNw3RXLWuJzK7rUyoIhhutdlflpmLwz5yBsOsLH7LdoVEQpHQ6
 q0WaMENJlssywUr4UEzLsvmX0r/u3AUfQ3so52ZtrlIhtmGm9ZK0LorIf
 jTX75emhwDzk1nn338Z9oSHCpx+pveWkzZSbEWjDG4+3Q6H0fPPKi3NKm
 qz9yMjgt5RSEf5TWeDqvcoIiKOKUfG7BsHodqNQVF92MmzXmqpbN860c2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288443020"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="288443020"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 23:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="928131655"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2022 23:11:52 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oGwkR-0009k2-1b;
 Thu, 28 Jul 2022 06:11:51 +0000
Date: Thu, 28 Jul 2022 14:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1565:27:
 error: 'drm_primary_helper_destroy' undeclared here (not in a function); did
 you mean 'drm_plane_helper_destroy'?
Message-ID: <202207281420.Mnf0XrNj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   df865a97749db8fbb9ec3491f34bf40771ce1f7b
commit: 9c7f5cf088789957dcfb460cca1ab0fb578f2376 [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: alpha-randconfig-r003-20220728 (https://download.01.org/0day-ci/archive/20220728/202207281420.Mnf0XrNj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout 9c7f5cf088789957dcfb460cca1ab0fb578f2376
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:83:31: warning: no previous prototype for 'amd_get_format_info' [-Wmissing-prototypes]
      83 | const struct drm_format_info *amd_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
         |                               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:88:6: warning: no previous prototype for 'fill_blending_from_plane_state' [-Wmissing-prototypes]
      88 | void fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:152:6: warning: no previous prototype for 'modifier_has_dcc' [-Wmissing-prototypes]
     152 | bool modifier_has_dcc(uint64_t modifier)
         |      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:157:10: warning: no previous prototype for 'modifier_gfx9_swizzle_mode' [-Wmissing-prototypes]
     157 | unsigned modifier_gfx9_swizzle_mode(uint64_t modifier)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:752:5: warning: no previous prototype for 'fill_plane_buffer_attributes' [-Wmissing-prototypes]
     752 | int fill_plane_buffer_attributes(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:992:5: warning: no previous prototype for 'dm_plane_helper_check_state' [-Wmissing-prototypes]
     992 | int dm_plane_helper_check_state(struct drm_plane_state *state,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1046:5: warning: no previous prototype for 'fill_dc_scaling_info' [-Wmissing-prototypes]
    1046 | int fill_dc_scaling_info(struct amdgpu_device *adev,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1222:6: warning: no previous prototype for 'handle_cursor_update' [-Wmissing-prototypes]
    1222 | void handle_cursor_update(struct drm_plane *plane,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1565:27: error: 'drm_primary_helper_destroy' undeclared here (not in a function); did you mean 'drm_plane_helper_destroy'?
    1565 |         .destroy        = drm_primary_helper_destroy,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           drm_plane_helper_destroy
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1576:5: warning: no previous prototype for 'amdgpu_dm_plane_init' [-Wmissing-prototypes]
    1576 | int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:32,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_trace.h:41,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:36:
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


vim +1565 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c

5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1561  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1562  static const struct drm_plane_funcs dm_plane_funcs = {
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1563  	.update_plane	= drm_atomic_helper_update_plane,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1564  	.disable_plane	= drm_atomic_helper_disable_plane,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20 @1565  	.destroy	= drm_primary_helper_destroy,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1566  	.reset = dm_drm_plane_reset,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1567  	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1568  	.atomic_destroy_state = dm_drm_plane_destroy_state,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1569  	.format_mod_supported = dm_plane_format_mod_supported,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1570  #ifdef CONFIG_DRM_AMD_DC_HDR
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1571  	.atomic_set_property = dm_drm_plane_set_property,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1572  	.atomic_get_property = dm_drm_plane_get_property,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1573  #endif
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1574  };
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1575  

:::::: The code at line 1565 was first introduced by commit
:::::: 5d945cbcd4b16a29d6470a80dfb19738f9a4319f drm/amd/display: Create a file dedicated to planes

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
