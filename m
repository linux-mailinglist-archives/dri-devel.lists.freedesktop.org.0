Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4FAADE66
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C50010E78C;
	Wed,  7 May 2025 12:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZspNtnUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE70710E19D;
 Wed,  7 May 2025 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746619752; x=1778155752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=paGV1q2h7/lg7vxDvEidXrD48WHvwPvlQUHhB7Z4Nm8=;
 b=ZspNtnUDkagSXE0aBruovN+sVvPgrMOBCLhamdjkkYO7YWyYvEgwQli+
 aWwQTNcqHkSf60P4Lw8RSqcujepLdwMJNxi3S88Kg4HzRl3V6Pl3VIak5
 TGGIwEfpUIOsInxnrJzVR+NoCrB+HGpPZWDnuZIi5VEu/0RMEty+Q7/aJ
 ZS7e6Yj4wspKWE+Rgk1mRsZSKCxR8vhK9lfoprbs6TcwffOpU0Rhd7UXK
 VGSygO7pbsxuKPG+UFzkLlVZNqdU7oNGBb59H5mj2PmRa3p9RDsIGPel0
 o5bZ+mKc0vQ06P4sYka+d/m0Fm1Ui4SoxxhOC2Yu6p8UdwZJ8OE34gZHq A==;
X-CSE-ConnectionGUID: rS6jzg74RrKpRAl3I5Tiww==
X-CSE-MsgGUID: yIBP6It1QqG3Ko4+vc7WMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58541954"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="58541954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 05:09:11 -0700
X-CSE-ConnectionGUID: 1pEevdIVSJKOPV3123rMDA==
X-CSE-MsgGUID: HasotoA7QjiJHhLrpwlQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136450640"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 05:08:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCdZg-0007kj-1P;
 Wed, 07 May 2025 12:08:32 +0000
Date: Wed, 7 May 2025 20:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 35/43] drm/amd/display: add 3x4 matrix colorop
Message-ID: <202505071913.raR4oCjA-lkp@intel.com>
References: <20250430011115.223996-36-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430011115.223996-36-alex.hung@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on next-20250507]
[cannot apply to linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250430-092409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250430011115.223996-36-alex.hung%40amd.com
patch subject: [PATCH V9 35/43] drm/amd/display: add 3x4 matrix colorop
config: parisc-randconfig-r122-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071913.raR4oCjA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071913.raR4oCjA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071913.raR4oCjA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c: In function '__set_dm_plane_colorop_3x4_matrix':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'const unsigned int'} [-Wformat=]
    #define dev_fmt(fmt) "amdgpu: " fmt
                         ^~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:156:54: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                         ^~~~~~~
   include/drm/drm_print.h:595:2: note: in expansion of macro 'dev_warn'
     dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
     ^~~~
   include/drm/drm_print.h:605:2: note: in expansion of macro '__drm_printk'
     __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
     ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1246:4: note: in expansion of macro 'drm_warn'
       drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
       ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1246:35: note: format string is defined here
       drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
                                    ~~^
                                    %u


vim +41 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h

539489fc91ea77 Aurabindo Pillai 2020-04-08  40  
539489fc91ea77 Aurabindo Pillai 2020-04-08 @41  #define dev_fmt(fmt) "amdgpu: " fmt
539489fc91ea77 Aurabindo Pillai 2020-04-08  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
