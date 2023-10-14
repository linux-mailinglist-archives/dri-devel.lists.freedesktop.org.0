Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE947C92BC
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 06:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BAE10E008;
	Sat, 14 Oct 2023 04:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AF210E008;
 Sat, 14 Oct 2023 04:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697257013; x=1728793013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3r/8q1XI29rdQEGxNz6p37DXj12l7HnDpzLdqMNJSFQ=;
 b=Ic+oSLGSYoooh68Tgq/GmeQ+Xz0iixsJEMmLAl8GyCUgYxcbZkOh8CCW
 RtIbF69VFc0koG9S3kad9oy2MS+7ngFrh8xpNTKK+54BAyKFvaxAcI1pO
 zmCnGq7RhW0kwibBkzckopTAKbTGRisZB0Ii3FKVxiun+TwqzCgSZ6Bkb
 vHWYJxfZD3d5O71AF1C3Tv4BHxbT/eBr2Jb+86AHjDweP+6/6QfL/svUN
 Y44dAXonlS+w2pxYIGtwhNE6M2r5eJDTaqHXGJq0DbD2NybvbWvjQjrOx
 KXcYMTQyyItBQHkIs6/aQkwc6dubl+jdSjAnI8u/BbGHlO6DxU9/lmlt0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416363943"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; d="scan'208";a="416363943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 21:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871354127"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; d="scan'208";a="871354127"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 21:16:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qrW50-0005ge-0O;
 Sat, 14 Oct 2023 04:16:46 +0000
Date: Sat, 14 Oct 2023 12:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: Re: [PATCH v3 09/16] platform/x86/amd/pmf: Add facility to dump TA
 inputs
Message-ID: <202310141247.22Coajca-lkp@intel.com>
References: <20231010125917.138225-10-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010125917.138225-10-Shyam-sundar.S-k@amd.com>
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-input@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 oe-kbuild-all@lists.linux.dev, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/platform-x86-amd-pmf-Add-PMF-TEE-interface/20231010-210347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20231010125917.138225-10-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v3 09/16] platform/x86/amd/pmf: Add facility to dump TA inputs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141247.22Coajca-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141247.22Coajca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141247.22Coajca-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/platform/x86/amd/pmf/pmf.h:14,
                    from drivers/platform/x86/amd/pmf/sps.c:11:
   drivers/platform/x86/amd/pmf/sps.c: In function 'amd_pmf_dump_sps_defaults':
   drivers/platform/x86/amd/pmf/sps.c:50:65: error: implicit declaration of function 'source_as_str' [-Werror=implicit-function-declaration]
      50 |                         pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
         |                                                                 ^~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/platform/x86/amd/pmf/sps.c:50:25: note: in expansion of macro 'pr_debug'
      50 |                         pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
         |                         ^~~~~~~~
>> drivers/platform/x86/amd/pmf/sps.c:50:34: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
      50 |                         pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:345:21: note: in definition of macro 'pr_fmt'
     345 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/platform/x86/amd/pmf/sps.c:50:25: note: in expansion of macro 'pr_debug'
      50 |                         pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
         |                         ^~~~~~~~
   drivers/platform/x86/amd/pmf/sps.c:50:47: note: format string is defined here
      50 |                         pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
         |                                              ~^
         |                                               |
         |                                               char *
         |                                              %d
   cc1: some warnings being treated as errors


vim +50 drivers/platform/x86/amd/pmf/sps.c

a82ebb3d800d7b Shyam Sundar S K 2023-05-10  41  
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  42  static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data)
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  43  {
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  44  	int i, j;
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  45  
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  46  	pr_debug("Static Slider Data - BEGIN\n");
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  47  
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  48  	for (i = 0; i < POWER_SOURCE_MAX; i++) {
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  49  		for (j = 0; j < POWER_MODE_MAX; j++) {
a82ebb3d800d7b Shyam Sundar S K 2023-05-10 @50  			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  51  			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  52  			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  53  			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  54  			pr_debug("FPPT: %u mW\n", data->prop[i][j].fppt);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  55  			pr_debug("STTMinLimit: %u mW\n", data->prop[i][j].stt_min);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  56  			pr_debug("STT_SkinTempLimit_APU: %u C\n",
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  57  				 data->prop[i][j].stt_skin_temp[STT_TEMP_APU]);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  58  			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  59  				 data->prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  60  		}
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  61  	}
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  62  
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  63  	pr_debug("Static Slider Data - END\n");
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  64  }
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  65  #else
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  66  static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  67  #endif
a82ebb3d800d7b Shyam Sundar S K 2023-05-10  68  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
