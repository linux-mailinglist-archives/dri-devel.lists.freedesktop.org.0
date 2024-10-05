Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2A991646
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 13:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F91610E2BE;
	Sat,  5 Oct 2024 11:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4kYnZ/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604010E0B1;
 Sat,  5 Oct 2024 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728126248; x=1759662248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HbU7XjnYjMH/mYc8HKKiw6gmJi3Pb1MqP1uN5hG4ajQ=;
 b=f4kYnZ/LuxpLeYHDvYg5NPzu6SwP2qX9oWLDTHVasQUMhJWwl9Tml6vI
 uiH+ysy2KNxrJvjvKcB/92g+mqZspHJEwq7sxSHDcFmO0T+0KHLoOLwAr
 hRVVMb0p4eT93KflSiglxbCHteYDwfuWYXZIfWFn/HruhUUgUqHurzGL0
 eB2zZ6nQbMYVRYFX4sUsDAdvJlm3xVy97wQc7neZWVwgWqxEnP9NsO/zj
 CFVdammvoSaXDr/UbcEVhi2yXbltpNiSQ+0Hiaz4XNy+I3ma2CO1F9xxH
 L2wzh+quJ+q5Nw1+9FdYYG3+iQxbbz0ydEkf8OQk3LCERw+GuryklkA8G w==;
X-CSE-ConnectionGUID: WpOJotXXQ6mWiahoz5LlFA==
X-CSE-MsgGUID: 0kE7mD9UQeyjesqhYhfglw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37940914"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="37940914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 04:04:08 -0700
X-CSE-ConnectionGUID: SGAk9gCNSyO6vkw0F1AMcA==
X-CSE-MsgGUID: B9UK5IerQsmQSGWOYNGU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="75087103"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2024 04:04:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sx2Zw-0002sc-1E;
 Sat, 05 Oct 2024 11:04:04 +0000
Date: Sat, 5 Oct 2024 19:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v6 36/44] drm/amd/display: add 3x4 matrix colorop
Message-ID: <202410051812.tVvPrkdr-lkp@intel.com>
References: <20241003200129.1732122-37-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-37-harry.wentland@amd.com>
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

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-37-harry.wentland%40amd.com
patch subject: [PATCH v6 36/44] drm/amd/display: add 3x4 matrix colorop
config: i386-randconfig-063-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051812.tVvPrkdr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051812.tVvPrkdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051812.tVvPrkdr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ring.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c: In function '__set_dm_plane_colorop_3x4_matrix':
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
      41 | #define dev_fmt(fmt) "amdgpu: " fmt
         |                      ^~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:522:9: note: in expansion of macro 'dev_warn'
     522 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:532:9: note: in expansion of macro '__drm_printk'
     532 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1247:25: note: in expansion of macro 'drm_warn'
    1247 |                         drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%lu)\n",
         |                         ^~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:41:22: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Werror=format=]
      41 | #define dev_fmt(fmt) "amdgpu: " fmt
         |                      ^~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   include/drm/drm_print.h:522:9: note: in expansion of macro 'dev_warn'
     522 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:532:9: note: in expansion of macro '__drm_printk'
     532 |         __drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:1247:25: note: in expansion of macro 'drm_warn'
    1247 |                         drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%lu)\n",
         |                         ^~~~~~~~
   cc1: all warnings being treated as errors


vim +41 drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h

539489fc91ea77 Aurabindo Pillai 2020-04-08  40  
539489fc91ea77 Aurabindo Pillai 2020-04-08 @41  #define dev_fmt(fmt) "amdgpu: " fmt
539489fc91ea77 Aurabindo Pillai 2020-04-08  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
