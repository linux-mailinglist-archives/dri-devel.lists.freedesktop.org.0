Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B73723283
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 23:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06CD10E102;
	Mon,  5 Jun 2023 21:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3E810E0B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686001590; x=1717537590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VFMj0R5xssTi49SMy256biw2lktzNYXCNpkrvHTLzHw=;
 b=DiYRCJqon+3d9uUquepNoHoNL81RS08PJXDefrgrRhIDoKiSdAmuTi4h
 aj8gQgdS0P2FStnPCCyuXDxHa+b1REagL2WAaXbcheTWXNcCXedJN+B3Q
 wjmQoc4qogZ/l8zKoviwXpMs7yaplbarWVjceT5bcISNG9evz9OYgOnZ0
 8Y0xAbVmnXzq1hbHOunPYSZZR41ZfKA61IajMNLCvOUpIKkYaSnzNHaRa
 I6K/6nk6Ys0OI6mm2Y81IVoNS0imAH4Jfi7M63fL6FabUrDQ+LOfEB59O
 hjqNvqE5ciegpXKt1obnqp3GNwaJjKYgAqf73kJb880fjzk/q11XGLBBV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341128477"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="341128477"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 14:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821327834"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="821327834"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 14:46:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q6I1x-0004T9-0j;
 Mon, 05 Jun 2023 21:46:25 +0000
Date: Tue, 6 Jun 2023 05:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
Message-ID: <202306060547.528pADrX-lkp@intel.com>
References: <20230605144812.15241-31-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605144812.15241-31-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230605]
[cannot apply to drm-misc/drm-misc-next lee-backlight/for-backlight-next staging/staging-testing staging/staging-next staging/staging-linus linus/master lee-backlight/for-backlight-fixes v6.4-rc5 v6.4-rc4 v6.4-rc3 v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/backlight-bd6107-Compare-against-struct-fb_info-device/20230605-225002
base:   next-20230605
patch link:    https://lore.kernel.org/r/20230605144812.15241-31-tzimmermann%40suse.de
patch subject: [PATCH 30/30] fbdev: Make support for userspace interfaces configurable
config: powerpc-randconfig-r036-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060547.528pADrX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d309f36af8a1ee56ef56e54287ca6d2bf7d239de
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/backlight-bd6107-Compare-against-struct-fb_info-device/20230605-225002
        git checkout d309f36af8a1ee56ef56e54287ca6d2bf7d239de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/video/fbdev/mb862xx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060547.528pADrX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:793:15: error: no member named 'dev' in 'struct fb_info'
           dev_dbg(fbi->dev, "%s release\n", fbi->fix.id);
                   ~~~  ^
   include/linux/dev_printk.h:163:26: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                          ^~~
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^~~
   1 error generated.


vim +793 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c

17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  785  
3a2ab02ddfacb0 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c Uwe Kleine-König   2023-03-19  786  static void of_platform_mb862xx_remove(struct platform_device *ofdev)
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  787  {
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  788  	struct fb_info *fbi = dev_get_drvdata(&ofdev->dev);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  789  	struct mb862xxfb_par *par = fbi->par;
28f65c11f2ffb3 drivers/video/mb862xx/mb862xxfbdrv.c       Joe Perches        2011-06-09  790  	resource_size_t res_size = resource_size(par->res);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  791  	unsigned long reg;
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  792  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06 @793  	dev_dbg(fbi->dev, "%s release\n", fbi->fix.id);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  794  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  795  	/* display off */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  796  	reg = inreg(disp, GC_DCM1);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  797  	reg &= ~(GC_DCM01_DEN | GC_DCM01_L0E);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  798  	outreg(disp, GC_DCM1, reg);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  799  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  800  	/* disable interrupts */
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  801  	outreg(host, GC_IMASK, 0);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  802  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  803  	free_irq(par->irq, (void *)par);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  804  	irq_dispose_mapping(par->irq);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  805  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  806  	device_remove_file(&ofdev->dev, &dev_attr_dispregs);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  807  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  808  	unregister_framebuffer(fbi);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  809  	fb_dealloc_cmap(&fbi->cmap);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  810  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  811  	iounmap(par->mmio_base);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  812  	iounmap(par->fb_base);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  813  
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  814  	release_mem_region(par->res->start, res_size);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  815  	framebuffer_release(fbi);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  816  }
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  817  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
