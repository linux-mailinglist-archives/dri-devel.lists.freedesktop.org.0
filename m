Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C585567FD7B
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 08:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801FC10E189;
	Sun, 29 Jan 2023 07:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56CC10E170;
 Sun, 29 Jan 2023 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674978957; x=1706514957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x4WTrpuvv+/zgSnOBDWsX2EtXNw7Yj18SFXCDGN2RQU=;
 b=DU7Q/0g4medleQrls4KK5j0VZ2WWfftEYNC9n9dYcF/9ZEe4c6yxGLeC
 9ZUNRt+6UzJX9HRcA67JCNQ7O62zSRdBQMvJkHNxrXcob29oPu9EagFFz
 F8SzDMA4Q/xG4SVjXmkiHL9P9xmPKOuxp3sae8AWmnRM5bRGi/uJe6+zx
 qlvr3g9p6t0KlnaU8nEPjyzUh+eBJUFNMzqMOwXsYCFyXQ5frtp8Pw2sQ
 R/q5X6HJDhALh6PEYEAPlsuWfywQXvgHPCX8AY3w1w2zEPR2YaZ4Lgb+9
 EtRoE9j79aor8tViX6KNDA7b90+O2pao/6wjKau6Vty8/QvNjc+O5v2lk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="389753587"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="389753587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 23:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752450871"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="752450871"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 23:55:53 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pM2XZ-0002aw-0E;
 Sun, 29 Jan 2023 07:55:53 +0000
Date: Sun, 29 Jan 2023 15:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 08/32] drm/amdgpu: add gfx10 hw debug mode enable and
 disable calls
Message-ID: <202301291502.el73Nchv-lkp@intel.com>
References: <20230125195401.4183544-9-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125195401.4183544-9-jonathan.kim@amd.com>
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
Cc: Felix.Kuehling@amd.com, Jonathan.Kim@amd.com, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.2-rc5]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Kim/drm-amdkfd-add-debug-and-runtime-enable-interface/20230128-092952
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230125195401.4183544-9-jonathan.kim%40amd.com
patch subject: [PATCH 08/32] drm/amdgpu: add gfx10 hw debug mode enable and disable calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291502.el73Nchv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/ca722ec7f4d749b61a30b4654fabf05f03d8d2cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-add-debug-and-runtime-enable-interface/20230128-092952
        git checkout ca722ec7f4d749b61a30b4654fabf05f03d8d2cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:750:10: warning: no previous prototype for 'kgd_gfx_v10_enable_debug_trap' [-Wmissing-prototypes]
     750 | uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:787:10: warning: no previous prototype for 'kgd_gfx_v10_disable_debug_trap' [-Wmissing-prototypes]
     787 | uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c:22:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kgd_gfx_v10_enable_debug_trap +750 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c

   749	
 > 750	uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
   751					bool restore_dbg_registers,
   752					uint32_t vmid)
   753	{
   754	
   755		mutex_lock(&adev->grbm_idx_mutex);
   756	
   757		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
   758	
   759		/* assume gfx off is disabled for the debug session if rlc restore not supported. */
   760		if (restore_dbg_registers) {
   761			uint32_t data = 0;
   762	
   763			data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
   764					VMID_SEL, 1 << vmid);
   765			data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
   766					TRAP_EN, 1);
   767			WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
   768			WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
   769			WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
   770	
   771			kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
   772	
   773			mutex_unlock(&adev->grbm_idx_mutex);
   774	
   775			return 0;
   776		}
   777	
   778		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
   779	
   780		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
   781	
   782		mutex_unlock(&adev->grbm_idx_mutex);
   783	
   784		return 0;
   785	}
   786	
 > 787	uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
   788						bool keep_trap_enabled,
   789						uint32_t vmid)
   790	{
   791		mutex_lock(&adev->grbm_idx_mutex);
   792	
   793		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
   794	
   795		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
   796	
   797		kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
   798	
   799		mutex_unlock(&adev->grbm_idx_mutex);
   800	
   801		return 0;
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
