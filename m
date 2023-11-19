Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E77F0454
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 05:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE9410E0C0;
	Sun, 19 Nov 2023 04:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA710E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 04:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700369208; x=1731905208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yjy1hnZoy8EpUYxdS9+3c1qFSR3s+PuC8hjfRrt0Szg=;
 b=jCPZswtv3UbQyVudsuizeXsMra0TRvvUHPPGiIdO+L2Au/AGYFLvkTd7
 HrxIfvml6cYEvaqpOQUg6+3DDRz75iLdYZ4WAWP23NzRNAuxJFNgk+afF
 PHzyg+cgVPBhSEdZsOzIm4+7I0XisUcV2v3vcd3/DiaOSPAaBYOxGNBnn
 r1ImxHAdnNuWcp3HWk0KxYd0VysZtzi/HxurOqb9tb2fMsCtLnuvcooZP
 jkkAqgsUQYp9FlwYffkBrzI293sIJCiUU2coHkQOAQdKsCEb2L+IZO6kq
 F0RLWM//3dsx1BcBguHwIX0XiWPuVijXUV3cv1NfQ7yV5VrS1fEBbHDF5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="390331101"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; d="scan'208";a="390331101"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2023 20:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="889610134"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; d="scan'208";a="889610134"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 18 Nov 2023 20:46:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r4Zhi-0004eV-0z;
 Sun, 19 Nov 2023 04:46:42 +0000
Date: Sun, 19 Nov 2023 12:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Wolfram Sang <wsa-dev@sang-engineering.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
Message-ID: <202311191235.fdwRQUG6-lkp@intel.com>
References: <20231118174221.851-6-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118174221.851-6-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes sunxi/sunxi/for-next wsa/i2c/for-next drm-tip/drm-tip linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/drivers-gpu-drm-rockchip-remove-I2C_CLASS_DDC-support/20231119-014549
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231118174221.851-6-hkallweit1%40gmail.com
patch subject: [PATCH v2 05/20] drivers/video/fbdev: remove I2C_CLASS_DDC support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311191235.fdwRQUG6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191235.fdwRQUG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191235.fdwRQUG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/matrox/i2c-matroxfb.c: In function 'i2c_matroxfb_probe':
>> drivers/video/fbdev/matrox/i2c-matroxfb.c:178:23: error: too many arguments to function 'i2c_bus_reg'
     178 |                 err = i2c_bus_reg(&m2info->maven, minfo,
         |                       ^~~~~~~~~~~
   drivers/video/fbdev/matrox/i2c-matroxfb.c:102:12: note: declared here
     102 | static int i2c_bus_reg(struct i2c_bit_adapter* b, struct matrox_fb_info* minfo,
         |            ^~~~~~~~~~~


vim +/i2c_bus_reg +178 drivers/video/fbdev/matrox/i2c-matroxfb.c

^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  141  
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  142  static void* i2c_matroxfb_probe(struct matrox_fb_info* minfo) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  143  	int err;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  144  	unsigned long flags;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  145  	struct matroxfb_dh_maven_info* m2info;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  146  
2fdbe5cf27aff9 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2007-02-12  147  	m2info = kzalloc(sizeof(*m2info), GFP_KERNEL);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  148  	if (!m2info)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  149  		return NULL;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  150  
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  151  	matroxfb_DAC_lock_irqsave(flags);
316b4d644caceb drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  152  	matroxfb_DAC_out(minfo, DAC_XGENIODATA, 0xFF);
316b4d644caceb drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  153  	matroxfb_DAC_out(minfo, DAC_XGENIOCTRL, 0x00);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  154  	matroxfb_DAC_unlock_irqrestore(flags);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  155  
fc2d10ddfc8989 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  156  	switch (minfo->chip) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  157  		case MGA_2064:
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  158  		case MGA_2164:
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  159  			err = i2c_bus_reg(&m2info->ddc1, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  160  					  DDC1B_DATA, DDC1B_CLK,
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  161  					  "DDC:fb%u #0");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  162  			break;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  163  		default:
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  164  			err = i2c_bus_reg(&m2info->ddc1, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  165  					  DDC1_DATA, DDC1_CLK,
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  166  					  "DDC:fb%u #0");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  167  			break;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  168  	}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  169  	if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  170  		goto fail_ddc1;
fc2d10ddfc8989 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2009-09-22  171  	if (minfo->devflags.dualhead) {
d0e2994db76d4c drivers/video/fbdev/matrox/i2c-matroxfb.c Heiner Kallweit 2023-11-18  172  		err = i2c_bus_reg(&m2info->ddc2, minfo, DDC2_DATA, DDC2_CLK, "DDC:fb%u #1");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  173  		if (err == -ENODEV) {
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  174  			printk(KERN_INFO "i2c-matroxfb: VGA->TV plug detected, DDC unavailable.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  175  		} else if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  176  			printk(KERN_INFO "i2c-matroxfb: Could not register secondary output i2c bus. Continuing anyway.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  177  		/* Register maven bus even on G450/G550 */
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14 @178  		err = i2c_bus_reg(&m2info->maven, minfo,
c1b6b4f2342d07 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-07-14  179  				  MAT_DATA, MAT_CLK, "MAVEN:fb%u", 0);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  180  		if (err)
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  181  			printk(KERN_INFO "i2c-matroxfb: Could not register Maven i2c bus. Continuing anyway.\n");
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  182  		else {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  183  			struct i2c_board_info maven_info = {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  184  				I2C_BOARD_INFO("maven", 0x1b),
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  185  			};
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  186  			unsigned short const addr_list[2] = {
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  187  				0x1b, I2C_CLIENT_END
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  188  			};
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  189  
a72e27f7a47069 drivers/video/fbdev/matrox/i2c-matroxfb.c Wolfram Sang    2019-11-06  190  			i2c_new_scanned_device(&m2info->maven.adapter,
9a94241afcc9a4 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2010-08-11  191  					       &maven_info, addr_list, NULL);
10546355323e48 drivers/video/matrox/i2c-matroxfb.c       Jean Delvare    2008-08-12  192  		}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  193  	}
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  194  	return m2info;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  195  fail_ddc1:;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  196  	kfree(m2info);
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  197  	printk(KERN_ERR "i2c-matroxfb: Could not register primary adapter DDC bus.\n");
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  198  	return NULL;
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  199  }
^1da177e4c3f41 drivers/video/matrox/i2c-matroxfb.c       Linus Torvalds  2005-04-16  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
