Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA461A48CBA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 00:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8110EBB4;
	Thu, 27 Feb 2025 23:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3oQ6t55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAA810EBB4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740698643; x=1772234643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9qqsIcFHcWeelKsEhLOKTawkuw3WGIYSVSE+zevFptA=;
 b=h3oQ6t55+tDhuvBpc70ffkpv8v7kcVLQXgQyyR7MYUD43cO5nK13F/ot
 GBNUeTDJvDQ+ezCGrAP7YSlx5kRoEJ8iUA3Ai3Z0vQcq0jEQGlMq/DNQR
 wrI2X98XXlBQlW5mfLsiTQGsQopG9cyITMiPbhlBdN0SVCh4JenKqUTiN
 qBQg7G7LDA4FxzRd3jOlqZVlYbawu+PUapTp+HfLIkMisjTJo2VXttOB+
 /WRzX9l01kyg3U13IhcKktT+B/M2h2pKRRbaw599IZ5Buzgq2k8w0R/w+
 cbzvJ+v4FKZnZoahXLM8C+kN4vXyK7l/tgxrpzGg4DbgyzqbnUgY3IfHB A==;
X-CSE-ConnectionGUID: inZeLPxNRQyPxPBWRDGehw==
X-CSE-MsgGUID: +fSAkCisQ5qZ44N0rlMLlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45264206"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="45264206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:24:01 -0800
X-CSE-ConnectionGUID: DXt2oDOUQYahVXJS996/xw==
X-CSE-MsgGUID: 3811Ks0VT4Wl/K5AktfhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154353473"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 27 Feb 2025 15:23:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnnEM-000EAQ-37;
 Thu, 27 Feb 2025 23:23:51 +0000
Date: Fri, 28 Feb 2025 07:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <202502280740.4ffoKiLx-lkp@intel.com>
References: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
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

Hi Aditya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Garg/drm-format-helper-Add-conversion-from-XRGB8888-to-BGR888/20250224-214352
base:   linus/master
patch link:    https://lore.kernel.org/r/844C1D39-4891-4DC2-8458-F46FA1B59FA0%40live.com
patch subject: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280740.4ffoKiLx-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280740.4ffoKiLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280740.4ffoKiLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/appletbdrm.c:13:
   drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_send_request':
>> include/drm/drm_print.h:589:54: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     589 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                                      ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:589:9: note: in expansion of macro 'dev_err'
     589 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:602:9: note: in expansion of macro '__drm_printk'
     602 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/appletbdrm.c:173:17: note: in expansion of macro 'drm_err'
     173 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
         |                 ^~~~~~~
   drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_read_response':
>> include/drm/drm_print.h:589:54: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     589 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                                      ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:589:9: note: in expansion of macro 'dev_err'
     589 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:602:9: note: in expansion of macro '__drm_printk'
     602 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/appletbdrm.c:214:17: note: in expansion of macro 'drm_err'
     214 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
         |                 ^~~~~~~
   drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_primary_plane_duplicate_state':
   drivers/gpu/drm/tiny/appletbdrm.c:524:40: warning: variable 'old_appletbdrm_state' set but not used [-Wunused-but-set-variable]
     524 |         struct appletbdrm_plane_state *old_appletbdrm_state;
         |                                        ^~~~~~~~~~~~~~~~~~~~


vim +589 include/drm/drm_print.h

e820f52577b14c6 Jim Cromie            2022-09-11  549  
02c9656b2f0d699 Haneen Mohammed       2017-10-17  550  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  551   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d699 Haneen Mohammed       2017-10-17  552   *
306589856399e18 Douglas Anderson      2021-09-21  553   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e18 Douglas Anderson      2021-09-21  554   *
091756bbb1a9613 Haneen Mohammed       2017-10-17  555   * @dev: device pointer
091756bbb1a9613 Haneen Mohammed       2017-10-17  556   * @fmt: printf() like format string.
02c9656b2f0d699 Haneen Mohammed       2017-10-17  557   */
db87086492581c8 Joe Perches           2018-03-16  558  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c8 Joe Perches           2018-03-16  559  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  560  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  561   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  562   *
306589856399e18 Douglas Anderson      2021-09-21  563   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e18 Douglas Anderson      2021-09-21  564   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  565   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  566   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  567   */
db87086492581c8 Joe Perches           2018-03-16  568  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  569  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  570  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  571   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  572   *
306589856399e18 Douglas Anderson      2021-09-21  573   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e18 Douglas Anderson      2021-09-21  574   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  575   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  576   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  577   */
db87086492581c8 Joe Perches           2018-03-16  578  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  579  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af7 Lyude Paul            2018-07-16  580  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  581  /*
fb6c7ab8718eb25 Jani Nikula           2019-12-10  582   * struct drm_device based logging
fb6c7ab8718eb25 Jani Nikula           2019-12-10  583   *
fb6c7ab8718eb25 Jani Nikula           2019-12-10  584   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb25 Jani Nikula           2019-12-10  585   */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  586  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  587  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  588  #define __drm_printk(drm, level, type, fmt, ...)			\
e04d24c4e8062b5 Luben Tuikov          2023-11-16 @589  	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb25 Jani Nikula           2019-12-10  590  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
