Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CF859887
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 19:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A298310E052;
	Sun, 18 Feb 2024 18:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnG8sN6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA7710E052;
 Sun, 18 Feb 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708280583; x=1739816583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b6UNUqskdALPc5YaCrG59ka+8cySp7Diz64kUvr+bXo=;
 b=HnG8sN6DsItrqeVpzRs3dpUXt63WR7JPCFg4bShsL+rWIHuW30+laW88
 5I902q7YpchIBlHlcEdmVLt91L+PB6mF1C5xy8EDVB4Wj77dtifVO5y0k
 X1eTmVwMTstwrPYDDiXlYvO2hSv28a4BoqQqsL7UQlkrBTlWNVekA9f4+
 nxyHaUeKQJwk/xar0X/iVPdpbMyAPhXTp9v2ne1hNXd0NzbD3whzU8OCY
 5rk5Hhc3aiYp9pPL1r9W6zCd1sdXVqeNblgG4513oK36MjjEZoNbh/SFH
 qVP4T8yA9OwTIwt/7jOfYx1XFHJzCIIv1V6nHN+YKmXpUqUsrsjK+BdB2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19881737"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; d="scan'208";a="19881737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 10:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="8890725"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2024 10:22:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rbloV-0003EY-0t;
 Sun, 18 Feb 2024 18:22:55 +0000
Date: Mon, 19 Feb 2024 02:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 3/8] fbdev: Do not include <linux/backlight.h> in header
Message-ID: <202402190101.UXQ9OLgS-lkp@intel.com>
References: <20240213084403.20995-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213084403.20995-4-tzimmermann@suse.de>
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

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus drm-misc/drm-misc-next linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-nouveau-Include-linux-backlight-h/20240213-164639
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240213084403.20995-4-tzimmermann%40suse.de
patch subject: [PATCH v2 3/8] fbdev: Do not include <linux/backlight.h> in header
config: arm-spitz_defconfig (https://download.01.org/0day-ci/archive/20240219/202402190101.UXQ9OLgS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402190101.UXQ9OLgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402190101.UXQ9OLgS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/corgi_lcd.c: In function 'corgi_bl_get_intensity':
>> drivers/video/backlight/corgi_lcd.c:390:33: error: implicit declaration of function 'bl_get_data'; did you mean 'lcd_get_data'? [-Werror=implicit-function-declaration]
     390 |         struct corgi_lcd *lcd = bl_get_data(bd);
         |                                 ^~~~~~~~~~~
         |                                 lcd_get_data
   drivers/video/backlight/corgi_lcd.c:390:33: warning: initialization of 'struct corgi_lcd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/video/backlight/corgi_lcd.c: In function 'corgi_bl_update_status':
   drivers/video/backlight/corgi_lcd.c:422:33: warning: initialization of 'struct corgi_lcd *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     422 |         struct corgi_lcd *lcd = bl_get_data(bd);
         |                                 ^~~~~~~~~~~
>> drivers/video/backlight/corgi_lcd.c:423:25: error: implicit declaration of function 'backlight_get_brightness' [-Werror=implicit-function-declaration]
     423 |         int intensity = backlight_get_brightness(bd);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c: In function 'corgi_lcd_limit_intensity':
>> drivers/video/backlight/corgi_lcd.c:441:9: error: implicit declaration of function 'backlight_update_status' [-Werror=implicit-function-declaration]
     441 |         backlight_update_status(the_corgi_lcd->bl_dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c: At top level:
>> drivers/video/backlight/corgi_lcd.c:445:21: error: variable 'corgi_bl_ops' has initializer but incomplete type
     445 | static const struct backlight_ops corgi_bl_ops = {
         |                     ^~~~~~~~~~~~~
>> drivers/video/backlight/corgi_lcd.c:446:10: error: 'const struct backlight_ops' has no member named 'get_brightness'
     446 |         .get_brightness = corgi_bl_get_intensity,
         |          ^~~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c:446:27: warning: excess elements in struct initializer
     446 |         .get_brightness = corgi_bl_get_intensity,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c:446:27: note: (near initialization for 'corgi_bl_ops')
>> drivers/video/backlight/corgi_lcd.c:447:10: error: 'const struct backlight_ops' has no member named 'update_status'
     447 |         .update_status  = corgi_bl_update_status,
         |          ^~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c:447:27: warning: excess elements in struct initializer
     447 |         .update_status  = corgi_bl_update_status,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/corgi_lcd.c:447:27: note: (near initialization for 'corgi_bl_ops')
   drivers/video/backlight/corgi_lcd.c: In function 'corgi_lcd_probe':
>> drivers/video/backlight/corgi_lcd.c:494:37: error: storage size of 'props' isn't known
     494 |         struct backlight_properties props;
         |                                     ^~~~~
>> drivers/video/backlight/corgi_lcd.c:518:34: error: invalid application of 'sizeof' to incomplete type 'struct backlight_properties'
     518 |         memset(&props, 0, sizeof(struct backlight_properties));
         |                                  ^~~~~~
>> drivers/video/backlight/corgi_lcd.c:519:22: error: 'BACKLIGHT_RAW' undeclared (first use in this function); did you mean 'FB_BACKLIGHT_MAX'?
     519 |         props.type = BACKLIGHT_RAW;
         |                      ^~~~~~~~~~~~~
         |                      FB_BACKLIGHT_MAX
   drivers/video/backlight/corgi_lcd.c:519:22: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/video/backlight/corgi_lcd.c:521:23: error: implicit declaration of function 'devm_backlight_device_register'; did you mean 'devm_lcd_device_register'? [-Werror=implicit-function-declaration]
     521 |         lcd->bl_dev = devm_backlight_device_register(&spi->dev, "corgi_bl",
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       devm_lcd_device_register
>> drivers/video/backlight/corgi_lcd.c:527:20: error: invalid use of undefined type 'struct backlight_device'
     527 |         lcd->bl_dev->props.brightness = pdata->default_intensity;
         |                    ^~
   drivers/video/backlight/corgi_lcd.c:528:20: error: invalid use of undefined type 'struct backlight_device'
     528 |         lcd->bl_dev->props.power = FB_BLANK_UNBLANK;
         |                    ^~
   drivers/video/backlight/corgi_lcd.c:494:37: warning: unused variable 'props' [-Wunused-variable]
     494 |         struct backlight_properties props;
         |                                     ^~~~~
   drivers/video/backlight/corgi_lcd.c: In function 'corgi_lcd_remove':
   drivers/video/backlight/corgi_lcd.c:549:20: error: invalid use of undefined type 'struct backlight_device'
     549 |         lcd->bl_dev->props.power = FB_BLANK_UNBLANK;
         |                    ^~
   drivers/video/backlight/corgi_lcd.c:550:20: error: invalid use of undefined type 'struct backlight_device'
     550 |         lcd->bl_dev->props.brightness = 0;
         |                    ^~
   drivers/video/backlight/corgi_lcd.c: At top level:
>> drivers/video/backlight/corgi_lcd.c:445:35: error: storage size of 'corgi_bl_ops' isn't known
     445 | static const struct backlight_ops corgi_bl_ops = {
         |                                   ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +527 drivers/video/backlight/corgi_lcd.c

b18250a8f66050 Eric Miao        2008-08-29  387  
b18250a8f66050 Eric Miao        2008-08-29  388  static int corgi_bl_get_intensity(struct backlight_device *bd)
b18250a8f66050 Eric Miao        2008-08-29  389  {
4d89c3b38927be Jingoo Han       2013-02-21 @390  	struct corgi_lcd *lcd = bl_get_data(bd);
b18250a8f66050 Eric Miao        2008-08-29  391  
b18250a8f66050 Eric Miao        2008-08-29  392  	return lcd->intensity;
b18250a8f66050 Eric Miao        2008-08-29  393  }
b18250a8f66050 Eric Miao        2008-08-29  394  
b18250a8f66050 Eric Miao        2008-08-29  395  static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
b18250a8f66050 Eric Miao        2008-08-29  396  {
ff7a4c7130c0ad Eric Miao        2008-09-07  397  	int cont;
ff7a4c7130c0ad Eric Miao        2008-09-07  398  
b18250a8f66050 Eric Miao        2008-08-29  399  	if (intensity > 0x10)
b18250a8f66050 Eric Miao        2008-08-29  400  		intensity += 0x10;
b18250a8f66050 Eric Miao        2008-08-29  401  
b18250a8f66050 Eric Miao        2008-08-29  402  	corgi_ssp_lcdtg_send(lcd, DUTYCTRL_ADRS, intensity);
b18250a8f66050 Eric Miao        2008-08-29  403  
ff7a4c7130c0ad Eric Miao        2008-09-07  404  	/* Bit 5 via GPIO_BACKLIGHT_CONT */
ee0c8e494cc3c1 Linus Walleij    2020-02-20  405  	cont = !!(intensity & 0x20);
ff7a4c7130c0ad Eric Miao        2008-09-07  406  
ee0c8e494cc3c1 Linus Walleij    2020-02-20  407  	if (lcd->backlight_cont)
ee0c8e494cc3c1 Linus Walleij    2020-02-20  408  		gpiod_set_value_cansleep(lcd->backlight_cont, cont);
ff7a4c7130c0ad Eric Miao        2008-09-07  409  
ee0c8e494cc3c1 Linus Walleij    2020-02-20  410  	if (lcd->backlight_on)
ee0c8e494cc3c1 Linus Walleij    2020-02-20  411  		gpiod_set_value_cansleep(lcd->backlight_on, intensity);
b18250a8f66050 Eric Miao        2008-08-29  412  
b18250a8f66050 Eric Miao        2008-08-29  413  	if (lcd->kick_battery)
b18250a8f66050 Eric Miao        2008-08-29  414  		lcd->kick_battery();
b18250a8f66050 Eric Miao        2008-08-29  415  
ff7a4c7130c0ad Eric Miao        2008-09-07  416  	lcd->intensity = intensity;
b18250a8f66050 Eric Miao        2008-08-29  417  	return 0;
b18250a8f66050 Eric Miao        2008-08-29  418  }
b18250a8f66050 Eric Miao        2008-08-29  419  
b18250a8f66050 Eric Miao        2008-08-29  420  static int corgi_bl_update_status(struct backlight_device *bd)
b18250a8f66050 Eric Miao        2008-08-29  421  {
4d89c3b38927be Jingoo Han       2013-02-21  422  	struct corgi_lcd *lcd = bl_get_data(bd);
51d53e5b06b8e7 Sam Ravnborg     2020-07-19 @423  	int intensity = backlight_get_brightness(bd);
b18250a8f66050 Eric Miao        2008-08-29  424  
bfdcaa3b6899bb Eric Miao        2008-08-29  425  	if (corgibl_flags & CORGIBL_SUSPENDED)
bfdcaa3b6899bb Eric Miao        2008-08-29  426  		intensity = 0;
716bdf18746471 Pavel Machek     2009-11-06  427  
716bdf18746471 Pavel Machek     2009-11-06  428  	if ((corgibl_flags & CORGIBL_BATTLOW) && intensity > lcd->limit_mask)
716bdf18746471 Pavel Machek     2009-11-06  429  		intensity = lcd->limit_mask;
bfdcaa3b6899bb Eric Miao        2008-08-29  430  
b18250a8f66050 Eric Miao        2008-08-29  431  	return corgi_bl_set_intensity(lcd, intensity);
b18250a8f66050 Eric Miao        2008-08-29  432  }
b18250a8f66050 Eric Miao        2008-08-29  433  
5cbff9603a77d0 Dmitry Baryshkov 2008-10-28  434  void corgi_lcd_limit_intensity(int limit)
bfdcaa3b6899bb Eric Miao        2008-08-29  435  {
bfdcaa3b6899bb Eric Miao        2008-08-29  436  	if (limit)
bfdcaa3b6899bb Eric Miao        2008-08-29  437  		corgibl_flags |= CORGIBL_BATTLOW;
bfdcaa3b6899bb Eric Miao        2008-08-29  438  	else
bfdcaa3b6899bb Eric Miao        2008-08-29  439  		corgibl_flags &= ~CORGIBL_BATTLOW;
bfdcaa3b6899bb Eric Miao        2008-08-29  440  
bfdcaa3b6899bb Eric Miao        2008-08-29 @441  	backlight_update_status(the_corgi_lcd->bl_dev);
bfdcaa3b6899bb Eric Miao        2008-08-29  442  }
5cbff9603a77d0 Dmitry Baryshkov 2008-10-28  443  EXPORT_SYMBOL(corgi_lcd_limit_intensity);
bfdcaa3b6899bb Eric Miao        2008-08-29  444  
9905a43b2d563e Emese Revfy      2009-12-14 @445  static const struct backlight_ops corgi_bl_ops = {
b18250a8f66050 Eric Miao        2008-08-29 @446  	.get_brightness	= corgi_bl_get_intensity,
b18250a8f66050 Eric Miao        2008-08-29 @447  	.update_status  = corgi_bl_update_status,
b18250a8f66050 Eric Miao        2008-08-29  448  };
b18250a8f66050 Eric Miao        2008-08-29  449  
bb0747105728fb Jingoo Han       2013-04-29  450  #ifdef CONFIG_PM_SLEEP
bb0747105728fb Jingoo Han       2013-04-29  451  static int corgi_lcd_suspend(struct device *dev)
b18250a8f66050 Eric Miao        2008-08-29  452  {
bb0747105728fb Jingoo Han       2013-04-29  453  	struct corgi_lcd *lcd = dev_get_drvdata(dev);
b18250a8f66050 Eric Miao        2008-08-29  454  
bfdcaa3b6899bb Eric Miao        2008-08-29  455  	corgibl_flags |= CORGIBL_SUSPENDED;
b18250a8f66050 Eric Miao        2008-08-29  456  	corgi_bl_set_intensity(lcd, 0);
b18250a8f66050 Eric Miao        2008-08-29  457  	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_POWERDOWN);
b18250a8f66050 Eric Miao        2008-08-29  458  	return 0;
b18250a8f66050 Eric Miao        2008-08-29  459  }
b18250a8f66050 Eric Miao        2008-08-29  460  
bb0747105728fb Jingoo Han       2013-04-29  461  static int corgi_lcd_resume(struct device *dev)
b18250a8f66050 Eric Miao        2008-08-29  462  {
bb0747105728fb Jingoo Han       2013-04-29  463  	struct corgi_lcd *lcd = dev_get_drvdata(dev);
b18250a8f66050 Eric Miao        2008-08-29  464  
bfdcaa3b6899bb Eric Miao        2008-08-29  465  	corgibl_flags &= ~CORGIBL_SUSPENDED;
b18250a8f66050 Eric Miao        2008-08-29  466  	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
b18250a8f66050 Eric Miao        2008-08-29  467  	backlight_update_status(lcd->bl_dev);
b18250a8f66050 Eric Miao        2008-08-29  468  	return 0;
b18250a8f66050 Eric Miao        2008-08-29  469  }
b18250a8f66050 Eric Miao        2008-08-29  470  #endif
b18250a8f66050 Eric Miao        2008-08-29  471  
bb0747105728fb Jingoo Han       2013-04-29  472  static SIMPLE_DEV_PM_OPS(corgi_lcd_pm_ops, corgi_lcd_suspend, corgi_lcd_resume);
bb0747105728fb Jingoo Han       2013-04-29  473  
ff7a4c7130c0ad Eric Miao        2008-09-07  474  static int setup_gpio_backlight(struct corgi_lcd *lcd,
ff7a4c7130c0ad Eric Miao        2008-09-07  475  				struct corgi_lcd_platform_data *pdata)
ff7a4c7130c0ad Eric Miao        2008-09-07  476  {
ff7a4c7130c0ad Eric Miao        2008-09-07  477  	struct spi_device *spi = lcd->spi_dev;
ff7a4c7130c0ad Eric Miao        2008-09-07  478  
ee0c8e494cc3c1 Linus Walleij    2020-02-20  479  	lcd->backlight_on = devm_gpiod_get_optional(&spi->dev,
ee0c8e494cc3c1 Linus Walleij    2020-02-20  480  						    "BL_ON", GPIOD_OUT_LOW);
ee0c8e494cc3c1 Linus Walleij    2020-02-20  481  	if (IS_ERR(lcd->backlight_on))
ee0c8e494cc3c1 Linus Walleij    2020-02-20  482  		return PTR_ERR(lcd->backlight_on);
ff7a4c7130c0ad Eric Miao        2008-09-07  483  
ee0c8e494cc3c1 Linus Walleij    2020-02-20  484  	lcd->backlight_cont = devm_gpiod_get_optional(&spi->dev, "BL_CONT",
ee0c8e494cc3c1 Linus Walleij    2020-02-20  485  						      GPIOD_OUT_LOW);
ee0c8e494cc3c1 Linus Walleij    2020-02-20  486  	if (IS_ERR(lcd->backlight_cont))
ee0c8e494cc3c1 Linus Walleij    2020-02-20  487  		return PTR_ERR(lcd->backlight_cont);
ff7a4c7130c0ad Eric Miao        2008-09-07  488  
ff7a4c7130c0ad Eric Miao        2008-09-07  489  	return 0;
ff7a4c7130c0ad Eric Miao        2008-09-07  490  }
ff7a4c7130c0ad Eric Miao        2008-09-07  491  
1b9e450de105c1 Bill Pemberton   2012-11-19  492  static int corgi_lcd_probe(struct spi_device *spi)
b18250a8f66050 Eric Miao        2008-08-29  493  {
a19a6ee6cad2b2 Matthew Garrett  2010-02-17 @494  	struct backlight_properties props;
c512794cada491 Jingoo Han       2013-11-12  495  	struct corgi_lcd_platform_data *pdata = dev_get_platdata(&spi->dev);
b18250a8f66050 Eric Miao        2008-08-29  496  	struct corgi_lcd *lcd;
b18250a8f66050 Eric Miao        2008-08-29  497  	int ret = 0;
b18250a8f66050 Eric Miao        2008-08-29  498  
b18250a8f66050 Eric Miao        2008-08-29  499  	if (pdata == NULL) {
b18250a8f66050 Eric Miao        2008-08-29  500  		dev_err(&spi->dev, "platform data not available\n");
b18250a8f66050 Eric Miao        2008-08-29  501  		return -EINVAL;
b18250a8f66050 Eric Miao        2008-08-29  502  	}
b18250a8f66050 Eric Miao        2008-08-29  503  
06c96f189bf944 Jingoo Han       2012-05-29  504  	lcd = devm_kzalloc(&spi->dev, sizeof(struct corgi_lcd), GFP_KERNEL);
3b20b894d4b342 Jingoo Han       2014-04-03  505  	if (!lcd)
b18250a8f66050 Eric Miao        2008-08-29  506  		return -ENOMEM;
b18250a8f66050 Eric Miao        2008-08-29  507  
b18250a8f66050 Eric Miao        2008-08-29  508  	lcd->spi_dev = spi;
b18250a8f66050 Eric Miao        2008-08-29  509  
10645a1d1878cf Jingoo Han       2013-11-12  510  	lcd->lcd_dev = devm_lcd_device_register(&spi->dev, "corgi_lcd",
10645a1d1878cf Jingoo Han       2013-11-12  511  						&spi->dev, lcd, &corgi_lcd_ops);
06c96f189bf944 Jingoo Han       2012-05-29  512  	if (IS_ERR(lcd->lcd_dev))
06c96f189bf944 Jingoo Han       2012-05-29  513  		return PTR_ERR(lcd->lcd_dev);
06c96f189bf944 Jingoo Han       2012-05-29  514  
b18250a8f66050 Eric Miao        2008-08-29  515  	lcd->power = FB_BLANK_POWERDOWN;
b18250a8f66050 Eric Miao        2008-08-29  516  	lcd->mode = (pdata) ? pdata->init_mode : CORGI_LCD_MODE_VGA;
b18250a8f66050 Eric Miao        2008-08-29  517  
a19a6ee6cad2b2 Matthew Garrett  2010-02-17 @518  	memset(&props, 0, sizeof(struct backlight_properties));
bb7ca747f8d624 Matthew Garrett  2011-03-22 @519  	props.type = BACKLIGHT_RAW;
a19a6ee6cad2b2 Matthew Garrett  2010-02-17  520  	props.max_brightness = pdata->max_intensity;
10645a1d1878cf Jingoo Han       2013-11-12 @521  	lcd->bl_dev = devm_backlight_device_register(&spi->dev, "corgi_bl",
10645a1d1878cf Jingoo Han       2013-11-12  522  						&spi->dev, lcd, &corgi_bl_ops,
10645a1d1878cf Jingoo Han       2013-11-12  523  						&props);
10645a1d1878cf Jingoo Han       2013-11-12  524  	if (IS_ERR(lcd->bl_dev))
10645a1d1878cf Jingoo Han       2013-11-12  525  		return PTR_ERR(lcd->bl_dev);
10645a1d1878cf Jingoo Han       2013-11-12  526  
b18250a8f66050 Eric Miao        2008-08-29 @527  	lcd->bl_dev->props.brightness = pdata->default_intensity;
b18250a8f66050 Eric Miao        2008-08-29  528  	lcd->bl_dev->props.power = FB_BLANK_UNBLANK;
b18250a8f66050 Eric Miao        2008-08-29  529  
ff7a4c7130c0ad Eric Miao        2008-09-07  530  	ret = setup_gpio_backlight(lcd, pdata);
ff7a4c7130c0ad Eric Miao        2008-09-07  531  	if (ret)
10645a1d1878cf Jingoo Han       2013-11-12  532  		return ret;
ff7a4c7130c0ad Eric Miao        2008-09-07  533  
b18250a8f66050 Eric Miao        2008-08-29  534  	lcd->kick_battery = pdata->kick_battery;
b18250a8f66050 Eric Miao        2008-08-29  535  
9319dfa1e08700 Jingoo Han       2013-02-21  536  	spi_set_drvdata(spi, lcd);
b18250a8f66050 Eric Miao        2008-08-29  537  	corgi_lcd_set_power(lcd->lcd_dev, FB_BLANK_UNBLANK);
b18250a8f66050 Eric Miao        2008-08-29  538  	backlight_update_status(lcd->bl_dev);
bfdcaa3b6899bb Eric Miao        2008-08-29  539  
bfdcaa3b6899bb Eric Miao        2008-08-29  540  	lcd->limit_mask = pdata->limit_mask;
bfdcaa3b6899bb Eric Miao        2008-08-29  541  	the_corgi_lcd = lcd;
b18250a8f66050 Eric Miao        2008-08-29  542  	return 0;
b18250a8f66050 Eric Miao        2008-08-29  543  }
b18250a8f66050 Eric Miao        2008-08-29  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
