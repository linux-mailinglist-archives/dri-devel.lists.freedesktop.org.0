Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60294799F51
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 20:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA010E033;
	Sun, 10 Sep 2023 18:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F5A10E033
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694370558; x=1725906558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PzGu76tMua3HCUi2AOOfNljJel3wCG4fnugGy7jKLbs=;
 b=UM8iFGyWGr005nydNRwi6CNWc9YEbOGGmgpEU7ca1hTIbWlH4D5Yc/xS
 bNvGnK/T2dyOmwsvjyjIcw5q+0WSU6G8I0+cBgGk3saw43yVGIoxEcjK/
 kKAxG7JMcNWYJI0IHYDNbIpGDZ8QGR9u4VsKIw1KdHsR1+6//pqUVDrR9
 4YoceOW4cIt6iTpq0JoTHM8aoybsfiGgskCOGutXOgfdoRt6OFBWFievN
 5bZU+eRfnaVx3XX67gkmh8BqvzQRgxQq2nG3BuYTa9k/SdGRC+PddoOWZ
 RQlXUtOOXWFVkBcDiT9eGvLWbWgM6OxIdUSiAIEPmUDQoSWxLo8ZmegQR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441932692"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; d="scan'208";a="441932692"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 11:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="743080658"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; d="scan'208";a="743080658"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 10 Sep 2023 11:29:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qfPBJ-0005GC-0d;
 Sun, 10 Sep 2023 18:29:13 +0000
Date: Mon, 11 Sep 2023 02:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
Message-ID: <202309110206.wDXP9YXl-lkp@intel.com>
References: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 15d30b46573d75f5cb58cfacded8ebab9c76a2b0]

url:    https://github.com/intel-lab-lkp/linux/commits/Janne-Grunau-via-B4-Relay/drm-simpledrm-Add-support-for-multiple-power-domains/20230911-004026
base:   15d30b46573d75f5cb58cfacded8ebab9c76a2b0
patch link:    https://lore.kernel.org/r/20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685%40jannau.net
patch subject: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309110206.wDXP9YXl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110206.wDXP9YXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110206.wDXP9YXl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:7,
                    from include/linux/platform_data/simplefb.h:12,
                    from drivers/gpu/drm/tiny/simpledrm.c:7:
   drivers/gpu/drm/tiny/simpledrm.c: In function 'simpledrm_device_detach_genpd':
>> include/drm/drm_print.h:456:39: warning: ' ' flag used with '%p' gnu_printf format [-Wformat=]
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_err'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:469:9: note: in expansion of macro '__drm_printk'
     469 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/simpledrm.c:506:9: note: in expansion of macro 'drm_err'
     506 |         drm_err(&sdev->dev, "% power-domains count:%d\n", __func__, sdev->pwr_dom_count);
         |         ^~~~~~~


vim +456 include/drm/drm_print.h

e820f52577b14c6 Jim Cromie            2022-09-11  416  
02c9656b2f0d699 Haneen Mohammed       2017-10-17  417  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  418   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d699 Haneen Mohammed       2017-10-17  419   *
306589856399e18 Douglas Anderson      2021-09-21  420   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e18 Douglas Anderson      2021-09-21  421   *
091756bbb1a9613 Haneen Mohammed       2017-10-17  422   * @dev: device pointer
091756bbb1a9613 Haneen Mohammed       2017-10-17  423   * @fmt: printf() like format string.
02c9656b2f0d699 Haneen Mohammed       2017-10-17  424   */
db87086492581c8 Joe Perches           2018-03-16  425  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c8 Joe Perches           2018-03-16  426  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  427  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  428   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  429   *
306589856399e18 Douglas Anderson      2021-09-21  430   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e18 Douglas Anderson      2021-09-21  431   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  432   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  433   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  434   */
db87086492581c8 Joe Perches           2018-03-16  435  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  436  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  437  /**
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  438   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  439   *
306589856399e18 Douglas Anderson      2021-09-21  440   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e18 Douglas Anderson      2021-09-21  441   *
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  442   * @dev: device pointer
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  443   * @fmt: printf() like format string.
b52817e9de06a3a Mauro Carvalho Chehab 2020-10-27  444   */
db87086492581c8 Joe Perches           2018-03-16  445  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c8 Joe Perches           2018-03-16  446  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af7 Lyude Paul            2018-07-16  447  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  448  /*
fb6c7ab8718eb25 Jani Nikula           2019-12-10  449   * struct drm_device based logging
fb6c7ab8718eb25 Jani Nikula           2019-12-10  450   *
fb6c7ab8718eb25 Jani Nikula           2019-12-10  451   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb25 Jani Nikula           2019-12-10  452   */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  453  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  454  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb25 Jani Nikula           2019-12-10  455  #define __drm_printk(drm, level, type, fmt, ...)			\
fb6c7ab8718eb25 Jani Nikula           2019-12-10 @456  	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb25 Jani Nikula           2019-12-10  457  
fb6c7ab8718eb25 Jani Nikula           2019-12-10  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
