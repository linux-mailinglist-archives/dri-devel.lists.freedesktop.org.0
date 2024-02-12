Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30315851DDC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 20:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A070210E0A2;
	Mon, 12 Feb 2024 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xdf1t+y6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457B310E0A3;
 Mon, 12 Feb 2024 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707765957; x=1739301957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J/MHatstWn38K1DNK96JUzl/2l6I7HyrZOSz07os770=;
 b=Xdf1t+y6NAZEJgzV4vejKZMBNwkMQuXZ0YMWeRFxru4aRwmVb6wVayi0
 bQoS6hBfsJOX3rkYtYGb/7FuXgIMfv2fwp/0etbKe2vja1UGIDMJaJlqm
 AGyNQxcuddzVMJ6n0Y/FwZUlUzQwXdlO7bbVp1Jjp8yvmuV3XvIFpcD3s
 ltUTQ8nBLBp1yPhWOybdA6h2PCr+nG0PIN5j5hUUnCv8gkXNtRyJqsE8I
 Be1K3Mbxdz1tGSulhRvMl7LmAbvzp/vCRGxSBw2TTY07+lUATEliyYFCW
 wbKOV15CatOeEa8znXHpIqcyaFIZcZYCVgt6HJnrhADd8DW/3vvb8VLQS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1610673"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1610673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:25:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7420855"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 12 Feb 2024 11:25:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rZbvz-0007KY-2e;
 Mon, 12 Feb 2024 19:25:43 +0000
Date: Tue, 13 Feb 2024 03:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
Message-ID: <202402130207.8ZFxCEYs-lkp@intel.com>
References: <20240212101712.23675-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212101712.23675-3-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8-rc4 next-20240212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-nouveau-Include-linux-backlight-h/20240212-181930
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240212101712.23675-3-tzimmermann%40suse.de
patch subject: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240213/202402130207.8ZFxCEYs-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402130207.8ZFxCEYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402130207.8ZFxCEYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/fbtft/fb_ssd1351.c: In function 'update_onboard_backlight':
   drivers/staging/fbtft/fb_ssd1351.c:192:33: error: implicit declaration of function 'bl_get_data'; did you mean 'acpi_get_data'? [-Werror=implicit-function-declaration]
     192 |         struct fbtft_par *par = bl_get_data(bd);
         |                                 ^~~~~~~~~~~
         |                                 acpi_get_data
>> drivers/staging/fbtft/fb_ssd1351.c:192:33: warning: initialization of 'struct fbtft_par *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/spi/spi.h:9,
                    from drivers/staging/fbtft/fb_ssd1351.c:5:
   drivers/staging/fbtft/fb_ssd1351.c:197:35: error: invalid use of undefined type 'struct backlight_device'
     197 |                       __func__, bd->props.power, bd->props.fb_blank);
         |                                   ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:433:17: note: in expansion of macro 'dev_info'
     433 |                 dev_info((par)->info->device, format, ##arg);  \
         |                 ^~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:195:9: note: in expansion of macro 'fbtft_par_dbg'
     195 |         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
         |         ^~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:197:52: error: invalid use of undefined type 'struct backlight_device'
     197 |                       __func__, bd->props.power, bd->props.fb_blank);
         |                                                    ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:433:17: note: in expansion of macro 'dev_info'
     433 |                 dev_info((par)->info->device, format, ##arg);  \
         |                 ^~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:195:9: note: in expansion of macro 'fbtft_par_dbg'
     195 |         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
         |         ^~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:199:15: error: implicit declaration of function 'backlight_is_blank' [-Werror=implicit-function-declaration]
     199 |         on = !backlight_is_blank(bd);
         |               ^~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c: At top level:
   drivers/staging/fbtft/fb_ssd1351.c:206:21: error: variable 'bl_ops' has initializer but incomplete type
     206 | static const struct backlight_ops bl_ops = {
         |                     ^~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:207:10: error: 'const struct backlight_ops' has no member named 'update_status'
     207 |         .update_status = update_onboard_backlight,
         |          ^~~~~~~~~~~~~
>> drivers/staging/fbtft/fb_ssd1351.c:207:26: warning: excess elements in struct initializer
     207 |         .update_status = update_onboard_backlight,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:207:26: note: (near initialization for 'bl_ops')
   drivers/staging/fbtft/fb_ssd1351.c: In function 'register_onboard_backlight':
   drivers/staging/fbtft/fb_ssd1351.c:213:16: error: variable 'bl_props' has initializer but incomplete type
     213 |         struct backlight_properties bl_props = { 0, };
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:213:50: warning: excess elements in struct initializer
     213 |         struct backlight_properties bl_props = { 0, };
         |                                                  ^
   drivers/staging/fbtft/fb_ssd1351.c:213:50: note: (near initialization for 'bl_props')
   drivers/staging/fbtft/fb_ssd1351.c:213:37: error: storage size of 'bl_props' isn't known
     213 |         struct backlight_properties bl_props = { 0, };
         |                                     ^~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c:215:25: error: 'BACKLIGHT_RAW' undeclared (first use in this function); did you mean 'FB_BACKLIGHT_MAX'?
     215 |         bl_props.type = BACKLIGHT_RAW;
         |                         ^~~~~~~~~~~~~
         |                         FB_BACKLIGHT_MAX
   drivers/staging/fbtft/fb_ssd1351.c:215:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/staging/fbtft/fb_ssd1351.c:218:14: error: implicit declaration of function 'backlight_device_register'; did you mean 'root_device_register'? [-Werror=implicit-function-declaration]
     218 |         bd = backlight_device_register(dev_driver_string(par->info->device),
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              root_device_register
>> drivers/staging/fbtft/fb_ssd1351.c:213:37: warning: unused variable 'bl_props' [-Wunused-variable]
     213 |         struct backlight_properties bl_props = { 0, };
         |                                     ^~~~~~~~
   drivers/staging/fbtft/fb_ssd1351.c: At top level:
   drivers/staging/fbtft/fb_ssd1351.c:206:35: error: storage size of 'bl_ops' isn't known
     206 | static const struct backlight_ops bl_ops = {
         |                                   ^~~~~~
   cc1: some warnings being treated as errors


vim +192 drivers/staging/fbtft/fb_ssd1351.c

883daf0a5c35c8 Thomas Petazzoni 2014-12-31  189  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  190  static int update_onboard_backlight(struct backlight_device *bd)
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  191  {
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @192  	struct fbtft_par *par = bl_get_data(bd);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  193  	bool on;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  194  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  195  	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  196  		      "%s: power=%d, fb_blank=%d\n",
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  197  		      __func__, bd->props.power, bd->props.fb_blank);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  198  
66d653c37228cb Stephen Kitt     2022-06-07  199  	on = !backlight_is_blank(bd);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  200  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  201  	write_reg(par, 0xB5, on ? 0x03 : 0x02);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  202  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  203  	return 0;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  204  }
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  205  
23801e3438f6ce Mike Rapoport    2015-09-03 @206  static const struct backlight_ops bl_ops = {
23801e3438f6ce Mike Rapoport    2015-09-03 @207  	.update_status = update_onboard_backlight,
23801e3438f6ce Mike Rapoport    2015-09-03  208  };
23801e3438f6ce Mike Rapoport    2015-09-03  209  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  210  static void register_onboard_backlight(struct fbtft_par *par)
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  211  {
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  212  	struct backlight_device *bd;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @213  	struct backlight_properties bl_props = { 0, };
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  214  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @215  	bl_props.type = BACKLIGHT_RAW;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  216  	bl_props.power = FB_BLANK_POWERDOWN;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  217  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  218  	bd = backlight_device_register(dev_driver_string(par->info->device),
333c7b940526be Leonardo Brás    2018-08-07  219  				       par->info->device, par, &bl_ops,
333c7b940526be Leonardo Brás    2018-08-07  220  				       &bl_props);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  221  	if (IS_ERR(bd)) {
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  222  		dev_err(par->info->device,
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  223  			"cannot register backlight device (%ld)\n",
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  224  			PTR_ERR(bd));
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  225  		return;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  226  	}
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  227  	par->info->bl_dev = bd;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  228  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  229  	if (!par->fbtftops.unregister_backlight)
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  230  		par->fbtftops.unregister_backlight = fbtft_unregister_backlight;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  231  }
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
