Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42E6CBA60
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 11:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2981C10E320;
	Tue, 28 Mar 2023 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D9F10E1FB;
 Tue, 28 Mar 2023 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679995320; x=1711531320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NEodsf9qOMz0LrPdYsRrX9vLsE9vQRvcCQWk2WPyZ6k=;
 b=I87Um0Ka2mXeEmmYUQyOQn31CT/j5a86UbPbqNvoOj2sxR0aAJfGuNUd
 m/IX6lPXO3fJi6foQpTnbTlagCAwc6v10T/CtIfHJHouQx1CChRtl2Wwf
 LwtsfUDdWIoC2rWnHfNhBGNQcWHJnTv6DNwykJU/X/UeqN9ey6Qjaq2pV
 N8EO4MSGhfJuYjtGkP37TxX1XNKkp6uzo/EhwcqbOgXiaVx/VTI/GyNzX
 rlO3ALTmuqgIG4VYe+TJ8t7jFbjRtdQ5c2Pm0rFxyOyByJEMDDqkSDpth
 D+3lphSG58o4W5oExIQ3PsXbJ3twmlfCdj25pQYJ8g30X0rvIUf6DyJru w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320168608"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="320168608"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 02:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="753067432"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="753067432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 02:21:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ph5Wf-000IQh-2Y;
 Tue, 28 Mar 2023 09:21:57 +0000
Date: Tue, 28 Mar 2023 17:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch
 points operation
Message-ID: <202303281754.75Z2VixI-lkp@intel.com>
References: <20230327184339.125016-27-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327184339.125016-27-jonathan.kim@amd.com>
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-tip/drm-tip next-20230328]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230327184339.125016-27-jonathan.kim%40amd.com
patch subject: [PATCH 27/34] drm/amdkfd: add debug set and clear address watch points operation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281754.75Z2VixI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/8c5e1781294f7e41d41632cb46e533c598933cd8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
        git checkout 8c5e1781294f7e41d41632cb46e533c598933cd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281754.75Z2VixI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:164:10: warning: no previous prototype for 'kgd_gfx_aldebaran_clear_address_watch' [-Wmissing-prototypes]
     164 | uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:63,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c:22:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:781:10: warning: no previous prototype for 'kgd_gfx_v11_clear_address_watch' [-Wmissing-prototypes]
     781 | uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:63,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c:23:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kgd_gfx_aldebaran_clear_address_watch +164 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c

   163	
 > 164	uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
   165						uint32_t watch_id)
   166	{
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
