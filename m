Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBAC6A4329
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4710E1D0;
	Mon, 27 Feb 2023 13:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E518110E1D0;
 Mon, 27 Feb 2023 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677505487; x=1709041487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7msrzgjWYVf6Tlhokxp8pkIAtikCgkjHo/2h8nTwrmY=;
 b=hidPYAQseUJuoK23oI25XEY7z51A7lUOeS8HY0fsMtsuKQPvccIdth7X
 6z1BnjjyTIC22FpQGhcK0024E/z+yoocC3rpDYCHAMKz7JykQQvhPGDxC
 ZD4T03juB8AyVFiRJsNOv7Ad6k3zFhD4C4nTmB+Y+cvl9yAjReM3lerL7
 0QYDMYMpCWlQ3aD14LP5Jj8ttnxKM2h7SHM+FO1BLku9obsG6rfHTuC5A
 zDZos+S9Wj64fCLiCzCLeO7E1cv2vqTiA+JZicw4ccY+fTbIu0lrBmx2Q
 7qoMn26PVCbOHytZ1q1ndYnJHNl456fpCtfGI8qnOeH3jHg1L4P7gh3xJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396410920"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="396410920"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:44:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="783383473"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="783383473"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2023 05:44:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pWdo2-0004SM-1t;
 Mon, 27 Feb 2023 13:44:42 +0000
Date: Mon, 27 Feb 2023 21:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanzhi Wang <wangyuanzhi@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, mario.limonciello@amd.com, Bokun.Zhang@amd.com,
 tzimmermann@suse.de, hdegoede@redhat.com, jingyuwang_vip@163.com,
 rafael.j.wysocki@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] amdgpu: add a filter condition when set brightness
Message-ID: <202302272122.p3DfX4S8-lkp@intel.com>
References: <20230227073953.326-1-wangyuanzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227073953.326-1-wangyuanzhi@uniontech.com>
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
Cc: Yuanzhi Wang <wangyuanzhi@uniontech.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuanzhi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230227073953.326-1-wangyuanzhi%40uniontech.com
patch subject: [PATCH] amdgpu: add a filter condition when set brightness
config: loongarch-randconfig-r036-20230226 (https://download.01.org/0day-ci/archive/20230227/202302272122.p3DfX4S8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/95d9579e31d0b601aa1422cf767ca5138d3efcee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuanzhi-Wang/amdgpu-add-a-filter-condition-when-set-brightness/20230227-154108
        git checkout 95d9579e31d0b601aa1422cf767ca5138d3efcee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272122.p3DfX4S8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: In function 'amdgpu_atif_handler':
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:50: warning: missing terminating " character
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:450:53: warning: missing terminating " character
     450 |                                                 %d\n", old_brightness, req.backlight_level);
         |                                                     ^
>> cc1: error: unterminated argument list invoking macro "DRM_WARN"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: 'DRM_WARN' undeclared (first use in this function)
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                         ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:49: error: expected ';' at end of input
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                                 ^
         |                                                 ;
   ......
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:448:33: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     448 |                                 if (old_brightness > req.backlight_level)
         |                                 ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:448:33: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
     449 |                                         DRM_WARN("old brightness %d is greater than ACPI brightness
         |                                         ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
>> drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:449:41: error: expected declaration or statement at end of input
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:404:12: warning: 'amdgpu_atif_handler' defined but not used [-Wunused-function]
     404 | static int amdgpu_atif_handler(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:308:12: warning: 'amdgpu_atif_query_backlight_caps' defined but not used [-Wunused-function]
     308 | static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:240:12: warning: 'amdgpu_atif_get_notification_params' defined but not used [-Wunused-function]
     240 | static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:195:12: warning: 'amdgpu_atif_verify_interface' defined but not used [-Wunused-function]
     195 | static int amdgpu_atif_verify_interface(struct amdgpu_atif *atif)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:35:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
