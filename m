Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D24A3B0E6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 06:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B63110E1FD;
	Wed, 19 Feb 2025 05:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJuI6tCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328A210E229
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739942753; x=1771478753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S8Bo1mBNhsHitvYqtIs6rp8B5fdMlpBSYkGUIFzfbm4=;
 b=XJuI6tCKDZl58xCYEk09a5FOmZeoP/Y/Tu3FATW+7HK/jM988CBu1dcM
 7HVVO3jLBFPzRaoCtlwl15G0v/i1qDxQOh+lyogNL38OtKYrevzVLjO0Q
 ++UksXYZGQ/LpnDd/ieycQKeur1oyvXXiZqTZLY+wPyAYUqbsQLZxKkhj
 MHR3E1LAxbeobcexd6FCLUNcTtlhfX48haulaje0mkzY68QcdHx0I9Rln
 kl39m26zJ2hLAOtvVjg8SLsIlkxm3992roTaOiulw/bML9JQ+LaTxZLrs
 7Y9YdJU8u6c0Kx3nDQLz+RxwyVs0ihivUV5buVgzcabDgrZD1h5CW6Yfw w==;
X-CSE-ConnectionGUID: jYYUHc8ESreWxWMVAVt5Zw==
X-CSE-MsgGUID: Is87C3SHS2Om3UTweZOUfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40530060"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40530060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 21:25:53 -0800
X-CSE-ConnectionGUID: 7coZRVwtRnuLC2mtXb/sSg==
X-CSE-MsgGUID: eT5/0cxQQpum+SAVrkC6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114462839"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2025 21:25:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tkcaT-0001Gt-0i;
 Wed, 19 Feb 2025 05:25:36 +0000
Date: Wed, 19 Feb 2025 13:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH v2] fbdev: lcdcfb: add missing device_remove_file()
Message-ID: <202502191200.AVwVc1DY-lkp@intel.com>
References: <20250208092918.251733-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208092918.251733-1-oushixiong1025@163.com>
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on linus/master v6.14-rc3 next-20250218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbdev-lcdcfb-add-missing-device_remove_file/20250208-173203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250208092918.251733-1-oushixiong1025%40163.com
patch subject: [PATCH v2] fbdev: lcdcfb: add missing device_remove_file()
config: nios2-randconfig-r072-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191200.AVwVc1DY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191200.AVwVc1DY-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/sh_mobile_lcdcfb.c:1544 sh_mobile_lcdc_overlay_fb_register() warn: always true condition '(--i >= 0) => (0-u32max >= 0)'
drivers/video/fbdev/sh_mobile_lcdcfb.c:1544 sh_mobile_lcdc_overlay_fb_register() warn: always true condition '(--i >= 0) => (0-u32max >= 0)'
drivers/video/fbdev/sh_mobile_lcdcfb.c:2652 sh_mobile_lcdc_probe() warn: 'irq' from request_irq() not released on lines: 2652.
drivers/video/fbdev/sh_mobile_lcdcfb.c:2652 sh_mobile_lcdc_probe() warn: 'priv->base' from ioremap() not released on lines: 2652.

vim +1544 drivers/video/fbdev/sh_mobile_lcdcfb.c

  1517	
  1518	static int
  1519	sh_mobile_lcdc_overlay_fb_register(struct sh_mobile_lcdc_overlay *ovl)
  1520	{
  1521		struct sh_mobile_lcdc_priv *lcdc = ovl->channel->lcdc;
  1522		struct fb_info *info = ovl->info;
  1523		unsigned int i, error = 0;
  1524		int ret;
  1525	
  1526		if (info == NULL)
  1527			return 0;
  1528	
  1529		ret = register_framebuffer(info);
  1530		if (ret < 0)
  1531			return ret;
  1532	
  1533		dev_info(lcdc->dev, "registered %s/overlay %u as %dx%d %dbpp.\n",
  1534			 dev_name(lcdc->dev), ovl->index, info->var.xres,
  1535			 info->var.yres, info->var.bits_per_pixel);
  1536	
  1537		for (i = 0; i < ARRAY_SIZE(overlay_sysfs_attrs); ++i) {
  1538			error = device_create_file(info->dev, &overlay_sysfs_attrs[i]);
  1539			if (error)
  1540				break;
  1541		}
  1542	
  1543		if (error) {
> 1544			while (--i >= 0)
  1545				device_remove_file(info->dev, &overlay_sysfs_attrs[i]);
  1546			return error;
  1547		}
  1548	
  1549		return 0;
  1550	}
  1551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
