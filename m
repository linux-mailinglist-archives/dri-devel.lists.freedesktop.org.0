Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3578F6CB617
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 07:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9975E10E443;
	Tue, 28 Mar 2023 05:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443F710E443;
 Tue, 28 Mar 2023 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679981397; x=1711517397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TlSiYkgPc+idxV0iFLyGQisyK8BGMSWO8q/o6til95I=;
 b=ZTXd67qYR3wI48x0CQfcUoRAL37YytpSW2PSkNzJt4QQ9a6OJ22Bt/K8
 8bZm2pxUiS90E7K6Uh2C+hj7bhcUuUC7P18CO/k1Zuh4HgHoai0p2z1Gm
 NDyfVKCOxeX+HoiklNJxF6N1PZgwv1qzsKhqNA9wWc7qPyDjSEmgpaoHP
 TorCVUklD1dBeuUh1GGyq3Fzc7i9Eyhg6/X70ckWarsjCC9QAPHaZwbX3
 A1sB8UhBaSfHDzKvuQtN2WGwrzjPCvoBhKsj8yhJxe/eBet0a24AoDyCv
 MNcje6/J2nrhPE6GhBK8K700xRWyxHWr+0UOj4JJjdpzXPMKA9Ft3nzCh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340500367"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="340500367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 22:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="794645431"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="794645431"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2023 22:29:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ph1u1-000IIj-1X;
 Tue, 28 Mar 2023 05:29:49 +0000
Date: Tue, 28 Mar 2023 13:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/34] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Message-ID: <202303281322.o1bwZYim-lkp@intel.com>
References: <20230327184339.125016-7-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327184339.125016-7-jonathan.kim@amd.com>
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
[also build test WARNING on drm-exynos/exynos-drm-next drm-tip/drm-tip next-20230327]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.3-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230327184339.125016-7-jonathan.kim%40amd.com
patch subject: [PATCH 07/34] drm/amdgpu: add gfx9.4.1 hw debug mode enable and disable calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281322.o1bwZYim-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d97444aab7664a04c8975f466a1422a6c0e2efc9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Kim/drm-amdkfd-display-debug-capabilities/20230328-024632
        git checkout d97444aab7664a04c8975f466a1422a6c0e2efc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281322.o1bwZYim-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: In function 'suspend_resume_compute_scheduler':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:312:53: warning: implicit conversion from 'enum amd_hw_ip_block_type' to 'enum amd_ip_block_type' [-Wenum-conversion]
     312 |         return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
         |                                                     ^~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:63,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:26:
   At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22: warning: 'dp_hdmi_dongle_signature_str' defined but not used [-Wunused-const-variable=]
      53 | static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
