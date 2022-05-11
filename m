Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5C523F51
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 23:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE0C10E2C6;
	Wed, 11 May 2022 21:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8610E2C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652303724; x=1683839724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XA/9k8fum1hnT6N9LahgNbseCi/JRz/UAlaSHgl2wpw=;
 b=mfo3Iu6Ptt2L7P2d+wUJsTdKlPMDow3c+Gps14XBcyob2gjviuo3lQS+
 vck6TUNPDarkvzrmD8JVkYUFI1Is6ySOga/B5+x17V3LgxR8ErXDjuUH5
 gUuBQBYdWjUJNMr4DqM3bO/b86v/nAr05b4xJG3A/NUZPzk3a3yZCzs+9
 kvSeB1VgDAn6tcEsSBsGg3UqcMppiOgJAsnpWmLLwP/njjUgWSoi9R98S
 Ij4tOCT2+SX6qgKkrJ4hTOB8OyOryYw56TyjLYN11Vssy2FgzGFHp2bAH
 HYeqgUHBYFpBL+enYWc8S+QHpKMziothJ2xC3dWB3fRaRdjAg1Mcvp/gg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="257365591"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="257365591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 14:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="636577197"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 11 May 2022 14:15:21 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1notg0-000Jap-Sb;
 Wed, 11 May 2022 21:15:20 +0000
Date: Thu, 12 May 2022 05:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, tzimmermann@suse.de
Subject: Re: [PATCH v2] mgag200: Enable atomic gamma lut update
Message-ID: <202205120525.DrSeu95X-lkp@intel.com>
References: <20220511152815.892562-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511152815.892562-1-jfalempe@redhat.com>
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
Cc: michel@daenzer.net, kbuild-all@lists.01.org,
 Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra-drm/drm/tegra/for-next]
[also build test WARNING on v5.18-rc6]
[cannot apply to drm/drm-next drm-tip/drm-tip airlied/drm-next next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220511-233134
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220512/202205120525.DrSeu95X-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0831f1db9ae8814796efea603749709e80d2808c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220511-233134
        git checkout 0831f1db9ae8814796efea603749709e80d2808c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic_helper.h:31,
                    from drivers/gpu/drm/mgag200/mgag200_mode.c:14:
   drivers/gpu/drm/mgag200/mgag200_mode.c: In function 'mgag200_simple_display_pipe_check':
>> include/drm/drm_print.h:425:39: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
     425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
     438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:971:25: note: in expansion of macro 'drm_err'
     971 |                         drm_err(dev, "Wrong size for gamma_lut %ld\n",
         |                         ^~~~~~~


vim +425 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed       2017-10-17  385  
02c9656b2f0d69 Haneen Mohammed       2017-10-17  386  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  387   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d69 Haneen Mohammed       2017-10-17  388   *
306589856399e1 Douglas Anderson      2021-09-21  389   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e1 Douglas Anderson      2021-09-21  390   *
091756bbb1a961 Haneen Mohammed       2017-10-17  391   * @dev: device pointer
091756bbb1a961 Haneen Mohammed       2017-10-17  392   * @fmt: printf() like format string.
02c9656b2f0d69 Haneen Mohammed       2017-10-17  393   */
db87086492581c Joe Perches           2018-03-16  394  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c Joe Perches           2018-03-16  395  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  396  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  397   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  398   *
306589856399e1 Douglas Anderson      2021-09-21  399   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e1 Douglas Anderson      2021-09-21  400   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  401   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  402   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  403   */
db87086492581c Joe Perches           2018-03-16  404  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  405  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  406  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  407   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  408   *
306589856399e1 Douglas Anderson      2021-09-21  409   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e1 Douglas Anderson      2021-09-21  410   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  411   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  412   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  413   */
db87086492581c Joe Perches           2018-03-16  414  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  415  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af Lyude Paul            2018-07-16  416  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  417  /*
fb6c7ab8718eb2 Jani Nikula           2019-12-10  418   * struct drm_device based logging
fb6c7ab8718eb2 Jani Nikula           2019-12-10  419   *
fb6c7ab8718eb2 Jani Nikula           2019-12-10  420   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb2 Jani Nikula           2019-12-10  421   */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  422  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  423  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  424  #define __drm_printk(drm, level, type, fmt, ...)			\
fb6c7ab8718eb2 Jani Nikula           2019-12-10 @425  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb2 Jani Nikula           2019-12-10  426  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  427  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
