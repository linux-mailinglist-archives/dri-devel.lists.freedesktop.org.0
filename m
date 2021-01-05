Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3202EB5C6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 00:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAFD6E0F2;
	Tue,  5 Jan 2021 23:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE26D6E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 23:04:14 +0000 (UTC)
IronPort-SDR: sZda8KrGwThNlHUnPQs3UUdhzHwFQ8b79vETlFVbeWxO0OLwy4OXW7du9Vgp/BoYHC51IdIflo
 fYxOhHWjruMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="177346726"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
 d="gz'50?scan'50,208,50";a="177346726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 15:04:13 -0800
IronPort-SDR: PVU9nfqeR894ggBIxsNhjUtDKUbuP13STni78JtRBHw9SQMCOwBUkr2xMaPP+1vFj/MK7NlUDa
 yZjQ1dVMIBCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; 
 d="gz'50?scan'50,208,50";a="569874422"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jan 2021 15:04:10 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kwvN3-0008RJ-3R; Tue, 05 Jan 2021 23:04:09 +0000
Date: Wed, 6 Jan 2021 07:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/8] drm/vmwgfx: Cleanup fifo mmio handling
Message-ID: <202101060655.SbgqObKT-lkp@intel.com>
References: <20210105182612.46431-5-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20210105182612.46431-5-zackr@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip linus/master v5.11-rc2 next-20210104]
[cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/Misc-cleanups-and-fixes-for-vmwgfx/20210106-022755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
config: i386-randconfig-a006-20210106 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/15c65b4940b46b333f5bd0ddd5377ca90250ef80
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/Misc-cleanups-and-fixes-for-vmwgfx/20210106-022755
        git checkout 15c65b4940b46b333f5bd0ddd5377ca90250ef80
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:29:
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_load':
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/drm/drm_print.h:481:15: note: in expansion of macro 'KERN_INFO'
     481 |  printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
         |               ^~~~~
   include/drm/drm_print.h:484:2: note: in expansion of macro '_DRM_PRINTK'
     484 |  _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:800:2: note: in expansion of macro 'DRM_INFO'
     800 |  DRM_INFO("Maximum display memory size is %llu kiB\n",
         |  ^~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:800:46: note: format string is defined here
     800 |  DRM_INFO("Maximum display memory size is %llu kiB\n",
         |                                           ~~~^
         |                                              |
         |                                              long long unsigned int
         |                                           %u
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:29:
   include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/drm/drm_print.h:481:15: note: in expansion of macro 'KERN_INFO'
     481 |  printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
         |               ^~~~~
   include/drm/drm_print.h:484:2: note: in expansion of macro '_DRM_PRINTK'
     484 |  _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:802:2: note: in expansion of macro 'DRM_INFO'
     802 |  DRM_INFO("VRAM at 0x%08llx size is %llu kiB\n",
         |  ^~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:802:27: note: format string is defined here
     802 |  DRM_INFO("VRAM at 0x%08llx size is %llu kiB\n",
         |                      ~~~~~^
         |                           |
         |                           long long unsigned int
         |                      %08x
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:29:
   include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/drm/drm_print.h:481:15: note: in expansion of macro 'KERN_INFO'
     481 |  printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
         |               ^~~~~
   include/drm/drm_print.h:484:2: note: in expansion of macro '_DRM_PRINTK'
     484 |  _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:802:2: note: in expansion of macro 'DRM_INFO'
     802 |  DRM_INFO("VRAM at 0x%08llx size is %llu kiB\n",
         |  ^~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:802:40: note: format string is defined here
     802 |  DRM_INFO("VRAM at 0x%08llx size is %llu kiB\n",
         |                                     ~~~^
         |                                        |
         |                                        long long unsigned int
         |                                     %u
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:29:
   include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/drm/drm_print.h:481:15: note: in expansion of macro 'KERN_INFO'
     481 |  printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UlVJffcvxoiEqYs2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--UlVJffcvxoiEqYs2--
