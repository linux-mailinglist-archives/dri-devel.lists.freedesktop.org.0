Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718D67FCCF
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 06:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0D10E1F7;
	Sun, 29 Jan 2023 05:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3C10E037;
 Sun, 29 Jan 2023 05:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674969167; x=1706505167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z13zcVVLBQ5KnhMvyN6O7PTmY7wxwKK0EOWVtTqiuog=;
 b=dAvVNgzsJzP2aKRI0AmKvZsuF40k267iAyCCr63aQZJpq4c6l/T9qQOH
 pkgEPp19srwsoviDtYKt1NK99+PzNnpIxqPClDyYrl2bLXO+nrE8CHz9K
 EpcD4JPqnY5MT9Ja8kLf9VsfMQ7S60Xqx1uNZwBWK7cw/ExRCU2ENuxDI
 nUfpuA5zrs/s5EHi9P2Qm1V0WG+j2t8wHgq5IGLio8BLuFW9ZjdmM4rU6
 8euaOZ4qiUFrGCUvZscMdHSA1Fn6x4NzCJtVlVTGBAhoLJwsBkfzbjGu+
 Z9OnLf8wmMYz+eUThR08uhHK0oPpjl0u+xnUuW/HEhVkmoDi6MTkpz8nO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326034983"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="326034983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 21:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752424808"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="752424808"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 21:12:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pLzzf-0002Tm-2N;
 Sun, 29 Jan 2023 05:12:43 +0000
Date: Sun, 29 Jan 2023 13:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 06/32] drm/amdgpu: add gfx9 hw debug mode enable and
 disable calls
Message-ID: <202301291257.PRqg0VpG-lkp@intel.com>
References: <20230125195401.4183544-7-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125195401.4183544-7-jonathan.kim@amd.com>
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
patch link:    https://lore.kernel.org/r/20230125195401.4183544-7-jonathan.kim%40amd.com
patch subject: [PATCH 06/32] drm/amdgpu: add gfx9 hw debug mode enable and disable calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291257.PRqg0VpG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/11bb8b2034cd92b687a2d5461298cc72d720d5c9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-add-debug-and-runtime-enable-interface/20230128-092952
        git checkout 11bb8b2034cd92b687a2d5461298cc72d720d5c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:694: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * restore_dbg_reisters is ignored here but is a general interface requirement
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:718: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * keep_trap_enabled is ignored here but is a general interface requirement


vim +694 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c

   692	
   693	/**
 > 694	 * restore_dbg_reisters is ignored here but is a general interface requirement
   695	 * for devices that support GFXOFF and where the RLC save/restore list
   696	 * does not support hw registers for debugging i.e. the driver has to manually
   697	 * initialize the debug mode registers after it has disabled GFX off during the
   698	 * debug session.
   699	 */
   700	uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
   701					bool restore_dbg_registers,
   702					uint32_t vmid)
   703	{
   704		mutex_lock(&adev->grbm_idx_mutex);
   705	
   706		kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
   707	
   708		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
   709	
   710		kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
   711	
   712		mutex_unlock(&adev->grbm_idx_mutex);
   713	
   714		return 0;
   715	}
   716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
