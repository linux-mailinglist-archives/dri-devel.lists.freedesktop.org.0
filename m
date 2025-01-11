Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A325A0A156
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 07:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1DC10E1B1;
	Sat, 11 Jan 2025 06:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inum5wc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC6610E1B1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736577670; x=1768113670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HdKyHxggIQYtQM8D7g0jk2NHrHn+fD9Taizzo5G8HcU=;
 b=inum5wc+lDK0IwmH/EuPPJ+dRU6sBMUcGyMoTVJtHW7tXd7GferQ+ihT
 Ny9daZgjWzV+X0KwcI57G7GO3eC17etetA3d1zlhaysC0/2pX9ml9Dti5
 nz5DdMWLZvHmxOpWmOsJR61xBRz3EPLtfZeJNzZA1qnYJYijCCMq+Q6l6
 dcD7ni/K2EkbVmuV8hkUuzFcXY4Qez5PDKuLaqOT+akmO9TtQJQKqsPsb
 YDUsXIuwO+efCMrBFJpMyOimmkvzGw78Q9aPmLGHl+kNoLVT6YnbLD5hJ
 gKY/A4IyBb92DRw5AegyuEO+NZpWYIAmIgeNcvmyW7bFqcwoG6XrLuKrS Q==;
X-CSE-ConnectionGUID: iIYdw7eeQYubZqaQhTSzBA==
X-CSE-MsgGUID: Vo23aYIIQaOqmZWGUSy5YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62251528"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; d="scan'208";a="62251528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 22:41:09 -0800
X-CSE-ConnectionGUID: KFeE8qvWSK6up/z+Ktgo8A==
X-CSE-MsgGUID: dtAxG4+LTHiYIXjPvV1chg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108564311"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2025 22:41:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWVB9-000KIR-1m;
 Sat, 11 Jan 2025 06:41:03 +0000
Date: Sat, 11 Jan 2025 14:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ao Xu <ao.xu@amlogic.com>
Subject: Re: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
Message-ID: <202501111433.iVcR3vZY-lkp@intel.com>
References: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
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

Hi Ao,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Ao-Xu-via-B4-Relay/dt-bindings-display-meson-dw-hdmi-Add-compatible-for-S4-HDMI-controller/20250110-134113
base:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
patch link:    https://lore.kernel.org/r/20250110-drm-s4-v1-3-cbc2d5edaae8%40amlogic.com
patch subject: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
config: csky-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111433.iVcR3vZY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111433.iVcR3vZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111433.iVcR3vZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/sys_soc.h:9,
                    from drivers/gpu/drm/meson/meson_drv.c:16:
   drivers/gpu/drm/meson/meson_drv.c: In function 'meson_drv_pm_suspend':
>> include/drm/drm_print.h:588:42: error: 'struct device' has no member named 'dev'; did you mean 'devt'?
     588 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                          ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/drm/drm_print.h:588:9: note: in expansion of macro 'dev_err'
     588 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:601:9: note: in expansion of macro '__drm_printk'
     601 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_drv.c:541:17: note: in expansion of macro 'drm_err'
     541 |                 drm_err(dev, "suspend error: %d", ret);
         |                 ^~~~~~~
--
   In file included from include/linux/device.h:15,
                    from include/linux/sys_soc.h:9,
                    from meson_drv.c:16:
   meson_drv.c: In function 'meson_drv_pm_suspend':
>> include/drm/drm_print.h:588:42: error: 'struct device' has no member named 'dev'; did you mean 'devt'?
     588 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                          ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/drm/drm_print.h:588:9: note: in expansion of macro 'dev_err'
     588 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:601:9: note: in expansion of macro '__drm_printk'
     601 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   meson_drv.c:541:17: note: in expansion of macro 'drm_err'
     541 |                 drm_err(dev, "suspend error: %d", ret);
         |                 ^~~~~~~


vim +588 include/drm/drm_print.h

e820f52577b14c Jim Cromie            2022-09-11  548  
02c9656b2f0d69 Haneen Mohammed       2017-10-17  549  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  550   * DRM_DEV_DEBUG() - Debug output for generic drm code
02c9656b2f0d69 Haneen Mohammed       2017-10-17  551   *
306589856399e1 Douglas Anderson      2021-09-21  552   * NOTE: this is deprecated in favor of drm_dbg_core().
306589856399e1 Douglas Anderson      2021-09-21  553   *
091756bbb1a961 Haneen Mohammed       2017-10-17  554   * @dev: device pointer
091756bbb1a961 Haneen Mohammed       2017-10-17  555   * @fmt: printf() like format string.
02c9656b2f0d69 Haneen Mohammed       2017-10-17  556   */
db87086492581c Joe Perches           2018-03-16  557  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
db87086492581c Joe Perches           2018-03-16  558  	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  559  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  560   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  561   *
306589856399e1 Douglas Anderson      2021-09-21  562   * NOTE: this is deprecated in favor of drm_dbg() or dev_dbg().
306589856399e1 Douglas Anderson      2021-09-21  563   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  564   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  565   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  566   */
db87086492581c Joe Perches           2018-03-16  567  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  568  	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  569  /**
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  570   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  571   *
306589856399e1 Douglas Anderson      2021-09-21  572   * NOTE: this is deprecated in favor of drm_dbg_kms().
306589856399e1 Douglas Anderson      2021-09-21  573   *
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  574   * @dev: device pointer
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  575   * @fmt: printf() like format string.
b52817e9de06a3 Mauro Carvalho Chehab 2020-10-27  576   */
db87086492581c Joe Perches           2018-03-16  577  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
db87086492581c Joe Perches           2018-03-16  578  	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
a18b21929453af Lyude Paul            2018-07-16  579  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  580  /*
fb6c7ab8718eb2 Jani Nikula           2019-12-10  581   * struct drm_device based logging
fb6c7ab8718eb2 Jani Nikula           2019-12-10  582   *
fb6c7ab8718eb2 Jani Nikula           2019-12-10  583   * Prefer drm_device based logging over device or prink based logging.
fb6c7ab8718eb2 Jani Nikula           2019-12-10  584   */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  585  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  586  /* Helper for struct drm_device based logging. */
fb6c7ab8718eb2 Jani Nikula           2019-12-10  587  #define __drm_printk(drm, level, type, fmt, ...)			\
e04d24c4e8062b Luben Tuikov          2023-11-16 @588  	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
fb6c7ab8718eb2 Jani Nikula           2019-12-10  589  
fb6c7ab8718eb2 Jani Nikula           2019-12-10  590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
