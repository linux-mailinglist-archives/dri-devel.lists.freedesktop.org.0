Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD795851E36
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 20:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4C110E289;
	Mon, 12 Feb 2024 19:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjIgjePG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785A10E253;
 Mon, 12 Feb 2024 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707767814; x=1739303814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VbiWwUlRwFGEs9WFueIKvPJkqFyBrhzz4cOYE4POKHY=;
 b=WjIgjePGgReMaUlODe6zZvGNM0Ryup60UlnFsi7eLBkGKjCmRS5lMeft
 DpcoN4lPSNwujcS9cZWMVsnxDq1rvZwKznWr1giRqbCj1NLBvVzodVem8
 Vmo/eV2EpK5CTL6x9dICKX+PTlSMDiVZASdssl+d5xdNv2ip+mnND55Ni
 rAV/DROdgXaX1l1Dx2UuDiUyDNbxODcYlSvnLaMHoRpRuQUhqn+cgR+NT
 HvwRvQczFuF7a9iAaosW9hcfkBV7fm1hOo47zIdUNZppVs6glrdmPxUtT
 eMSvw1+mTIBFVIuEfp1SnoqR0r92eTbpoAgtz5RzwCrcbxGWItibj0428 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1898410"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1898410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 11:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="2986160"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2024 11:56:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rZcQ3-0007LE-12;
 Mon, 12 Feb 2024 19:56:47 +0000
Date: Tue, 13 Feb 2024 03:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
Message-ID: <202402130346.2iGNwgDE-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.8-rc4 next-20240212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-nouveau-Include-linux-backlight-h/20240212-181930
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240212101712.23675-3-tzimmermann%40suse.de
patch subject: [PATCH 2/7] fbdev: Do not include <linux/backlight.h> in header
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240213/202402130346.2iGNwgDE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402130346.2iGNwgDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402130346.2iGNwgDE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fb_ssd1351.c:192:26: error: call to undeclared function 'bl_get_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     192 |         struct fbtft_par *par = bl_get_data(bd);
         |                                 ^
>> drivers/staging/fbtft/fb_ssd1351.c:192:20: error: incompatible integer to pointer conversion initializing 'struct fbtft_par *' with an expression of type 'int' [-Wint-conversion]
     192 |         struct fbtft_par *par = bl_get_data(bd);
         |                           ^     ~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fb_ssd1351.c:197:21: error: incomplete definition of type 'struct backlight_device'
     197 |                       __func__, bd->props.power, bd->props.fb_blank);
         |                                 ~~^
   drivers/staging/fbtft/fbtft.h:433:43: note: expanded from macro 'fbtft_par_dbg'
     433 |                 dev_info((par)->info->device, format, ##arg);  \
         |                                                         ^~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/linux/fb.h:20:8: note: forward declaration of 'struct backlight_device'
      20 | struct backlight_device;
         |        ^
   drivers/staging/fbtft/fb_ssd1351.c:197:38: error: incomplete definition of type 'struct backlight_device'
     197 |                       __func__, bd->props.power, bd->props.fb_blank);
         |                                                  ~~^
   drivers/staging/fbtft/fbtft.h:433:43: note: expanded from macro 'fbtft_par_dbg'
     433 |                 dev_info((par)->info->device, format, ##arg);  \
         |                                                         ^~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/linux/fb.h:20:8: note: forward declaration of 'struct backlight_device'
      20 | struct backlight_device;
         |        ^
>> drivers/staging/fbtft/fb_ssd1351.c:199:8: error: call to undeclared function 'backlight_is_blank'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     199 |         on = !backlight_is_blank(bd);
         |               ^
>> drivers/staging/fbtft/fb_ssd1351.c:206:35: error: variable has incomplete type 'const struct backlight_ops'
     206 | static const struct backlight_ops bl_ops = {
         |                                   ^
   drivers/staging/fbtft/fb_ssd1351.c:206:21: note: forward declaration of 'struct backlight_ops'
     206 | static const struct backlight_ops bl_ops = {
         |                     ^
>> drivers/staging/fbtft/fb_ssd1351.c:213:30: error: variable has incomplete type 'struct backlight_properties'
     213 |         struct backlight_properties bl_props = { 0, };
         |                                     ^
   drivers/staging/fbtft/fb_ssd1351.c:213:9: note: forward declaration of 'struct backlight_properties'
     213 |         struct backlight_properties bl_props = { 0, };
         |                ^
>> drivers/staging/fbtft/fb_ssd1351.c:215:18: error: use of undeclared identifier 'BACKLIGHT_RAW'
     215 |         bl_props.type = BACKLIGHT_RAW;
         |                         ^
>> drivers/staging/fbtft/fb_ssd1351.c:218:7: error: call to undeclared function 'backlight_device_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     218 |         bd = backlight_device_register(dev_driver_string(par->info->device),
         |              ^
   drivers/staging/fbtft/fb_ssd1351.c:218:7: note: did you mean '__root_device_register'?
   include/linux/device.h:1143:16: note: '__root_device_register' declared here
    1143 | struct device *__root_device_register(const char *name, struct module *owner);
         |                ^
   9 errors generated.


vim +197 drivers/staging/fbtft/fb_ssd1351.c

883daf0a5c35c8 Thomas Petazzoni 2014-12-31  189  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  190  static int update_onboard_backlight(struct backlight_device *bd)
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  191  {
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @192  	struct fbtft_par *par = bl_get_data(bd);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  193  	bool on;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  194  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  195  	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  196  		      "%s: power=%d, fb_blank=%d\n",
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @197  		      __func__, bd->props.power, bd->props.fb_blank);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  198  
66d653c37228cb Stephen Kitt     2022-06-07 @199  	on = !backlight_is_blank(bd);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  200  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  201  	write_reg(par, 0xB5, on ? 0x03 : 0x02);
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  202  
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  203  	return 0;
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  204  }
883daf0a5c35c8 Thomas Petazzoni 2014-12-31  205  
23801e3438f6ce Mike Rapoport    2015-09-03 @206  static const struct backlight_ops bl_ops = {
23801e3438f6ce Mike Rapoport    2015-09-03  207  	.update_status = update_onboard_backlight,
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
883daf0a5c35c8 Thomas Petazzoni 2014-12-31 @218  	bd = backlight_device_register(dev_driver_string(par->info->device),
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
