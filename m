Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F967FD26
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 07:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10B10E07D;
	Sun, 29 Jan 2023 06:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3510E045;
 Sun, 29 Jan 2023 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674974093; x=1706510093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JBVSW09m4oCTd6bOXWl3/8kb708D4wokFFHySa6TEVs=;
 b=iz57ofGJMORXZjVvqqhdcjaWoBUOpJZYwYYrqeRx9UPcVXU4eujBEzg6
 naaanz7n8Tz0lhdoEqlXB1lnhMOzc1ciPGNv/qjaz6WaSyq4EbyXp0z6y
 sI5VTJzYmcQQNjSTpo1UUNxhTMG+nVCh0WKxQofh2rr7pB+QmrRhc6ShW
 MWQ+e2vLX1S6Ad3MpEcJYO0VBVntF0Z8PndajMzTnLQH4al8AwI7hwUr2
 QQQ3/EGbBDE+EJLOteTnJtqYzCOY6WjN6YiYvM4fvbZKnaX2FDlvMjjgK
 Q8/hIqA2ofQOtKZKyG6Nn8a4tXKGklF+ONATLXUtStNBl/RzCS+ahPd/I A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413588256"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="413588256"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 22:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="663747832"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="663747832"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 22:34:50 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pM1H7-0002Ws-1Y;
 Sun, 29 Jan 2023 06:34:49 +0000
Date: Sun, 29 Jan 2023 14:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/32] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Message-ID: <202301291457.nbbgmBEG-lkp@intel.com>
References: <20230125195401.4183544-8-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125195401.4183544-8-jonathan.kim@amd.com>
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
patch link:    https://lore.kernel.org/r/20230125195401.4183544-8-jonathan.kim%40amd.com
patch subject: [PATCH 07/32] drm/amdgpu: add gfx9.4.1 hw debug mode enable and disable calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291457.nbbgmBEG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/3983dc0f35ebf17452f97c096b866e38c98318db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-add-debug-and-runtime-enable-interface/20230128-092952
        git checkout 3983dc0f35ebf17452f97c096b866e38c98318db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: In function 'suspend_resume_compute_scheduler':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:312:53: warning: implicit conversion from 'enum amd_hw_ip_block_type' to 'enum amd_ip_block_type' [-Wenum-conversion]
     312 |         return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
         |                                                     ^~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:36,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:64,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:26:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:343: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * restore_dbg_reisters is ignored here but is a general interface requirement
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:369: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * keep_trap_enabled is ignored here but is a general interface requirement


vim +312 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c

   281	
   282	/*
   283	 * Helper used to suspend/resume gfx pipe for image post process work to set
   284	 * barrier behaviour.
   285	 */
   286	static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool suspend)
   287	{
   288		int i, r = 0;
   289	
   290		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
   291			struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
   292	
   293			if (!(ring && ring->sched.thread))
   294				continue;
   295	
   296			/* stop secheduler and drain ring. */
   297			if (suspend) {
   298				drm_sched_stop(&ring->sched, NULL);
   299				r = amdgpu_fence_wait_empty(ring);
   300				if (r)
   301					goto out;
   302			} else {
   303				drm_sched_start(&ring->sched, false);
   304			}
   305		}
   306	
   307	out:
   308		/* return on resume or failure to drain rings. */
   309		if (!suspend || r)
   310			return r;
   311	
 > 312		return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
   313	}
   314	
   315	static void set_barrier_auto_waitcnt(struct amdgpu_device *adev, bool enable_waitcnt)
   316	{
   317		uint32_t data;
   318	
   319		WRITE_ONCE(adev->barrier_has_auto_waitcnt, enable_waitcnt);
   320	
   321		if (!down_read_trylock(&adev->reset_domain->sem))
   322			return;
   323	
   324		amdgpu_amdkfd_suspend(adev, false);
   325	
   326		if (suspend_resume_compute_scheduler(adev, true))
   327			goto out;
   328	
   329		data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG));
   330		data = REG_SET_FIELD(data, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
   331							enable_waitcnt ? 0 : 1);
   332		WREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG), data);
   333	
   334	out:
   335		suspend_resume_compute_scheduler(adev, false);
   336	
   337		amdgpu_amdkfd_resume(adev, false);
   338	
   339		up_read(&adev->reset_domain->sem);
   340	}
   341	
   342	/**
 > 343	 * restore_dbg_reisters is ignored here but is a general interface requirement
   344	 * for devices that support GFXOFF and where the RLC save/restore list
   345	 * does not support hw registers for debugging i.e. the driver has to manually
   346	 * initialize the debug mode registers after it has disabled GFX off during the
   347	 * debug session.
   348	 */
   349	static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
   350					bool restore_dbg_registers,
   351					uint32_t vmid)
   352	{
   353		mutex_lock(&adev->grbm_idx_mutex);
   354	
   355		kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
   356	
   357		set_barrier_auto_waitcnt(adev, true);
   358	
   359		WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
   360	
   361		kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
   362	
   363		mutex_unlock(&adev->grbm_idx_mutex);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
