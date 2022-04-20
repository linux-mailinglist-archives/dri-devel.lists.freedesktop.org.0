Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE0507E2D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662F210EAF1;
	Wed, 20 Apr 2022 01:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F98D10EAF1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650418374; x=1681954374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZW3hZx2KJcLc7kiC1IDxZPjOenLvNKBfwQoBLaD+iPk=;
 b=XvZDS7ZbWRNKPeDrPLd0LFL8SGtgR+7tLvz70zHsYts5F5XmSEcWBR3I
 gPNMnXXc6j5uJUjaPQrszTRurd6FhB0AsKaKHQBRuahKOJRQ0jNC26aXg
 vfSITG7u7PZRoBlVyuluz07gTQNg+K0CcJZQXuV4c3hF80tJLIrISw+ut
 ljTGXa90uaGu+a+GEeFOdjlzDtjEJt3M237zTHLTlP/n4ROkCSDxzeZzG
 JcJBfKqlj821nKd+21tSGBH8N+AF7tZt+af/5e9r3dQGKDqIuo6nvLAVH
 xBpDPuN2xLw4XnJaIDnp1KtriYhVWCz8XDHAMP3pFMN68k74gpudB8ZS2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="326813045"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="326813045"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="647476269"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2022 18:32:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ngzD8-0006PO-Au;
 Wed, 20 Apr 2022 01:32:50 +0000
Date: Wed, 20 Apr 2022 09:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Cowan <ian@linux.cowan.aero>, gregkh@linuxfoundation.org
Subject: Re: [PATCH] Staging: fbtft: Fix style problem in header
Message-ID: <202204200954.tbOBwAKP-lkp@intel.com>
References: <20220419192128.445023-1-ian@linux.cowan.aero>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220419192128.445023-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, kbuild-all@lists.01.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 ian@linux.cowan.aero, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ian,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Cowan/Staging-fbtft-Fix-style-problem-in-header/20220420-040428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git bed6d200f8ca38e1ecbdd8fb7e0564884002abd1
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220420/202204200954.tbOBwAKP-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/77c04f63df8342cff035e42cda5606c2c87d33db
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ian-Cowan/Staging-fbtft-Fix-style-problem-in-header/20220420-040428
        git checkout 77c04f63df8342cff035e42cda5606c2c87d33db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/staging/fbtft/fb_agm1264k-fl.c:15:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_agm1264k-fl.c:435:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     435 | FBTFT_REGISTER_DRIVER(DRVNAME, "displaytronic,fb_agm1264k-fl", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_agm1264k-fl.c:435:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     435 | FBTFT_REGISTER_DRIVER(DRVNAME, "displaytronic,fb_agm1264k-fl", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_bd663474.c:17:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_bd663474.c:162:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     162 | FBTFT_REGISTER_DRIVER(DRVNAME, "hitachi,bd663474", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_bd663474.c:162:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     162 | FBTFT_REGISTER_DRIVER(DRVNAME, "hitachi,bd663474", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_hx8340bn.c:21:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8340bn.c:216:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     216 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8340bn", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8340bn.c:216:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     216 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8340bn", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_hx8347d.c:15:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8347d.c:174:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8347d.c:174:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_hx8353d.c:15:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8353d.c:139:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     139 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8353d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8353d.c:139:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     139 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8353d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_hx8357d.c:18:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8357d.c:192:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     192 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8357d.c:192:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     192 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_ili9163.c:17:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9163.c:251:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     251 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9163", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9163.c:251:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     251 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9163", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_ili9320.c:14:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9320.c:258:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     258 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9320", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9320.c:258:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     258 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9320", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_ili9325.c:15:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9325.c:252:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     252 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9325", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9325.c:252:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     252 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9325", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_ili9340.c:14:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9340.c:130:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     130 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9340", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9340.c:130:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     130 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9340", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/staging/fbtft/fb_ili9341.c:20:
>> drivers/staging/fbtft/fbtft.h:284:1: error: expected ',' or ';' before 'static'
     284 | static int fbtft_driver_probe_spi(struct spi_device *spi)                       \
         | ^~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9341.c:148:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     148 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft.h:302:18: error: 'fbtft_driver_probe_spi' undeclared here (not in a function); did you mean 'fbtft_driver_remove_spi'?
     302 |         .probe = fbtft_driver_probe_spi,                                        \
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:1: note: in expansion of macro 'FBTFT_SPI_DRIVER'
     323 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ^~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fb_ili9341.c:148:1: note: in expansion of macro 'FBTFT_REGISTER_DRIVER'
     148 | FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
         | ^~~~~~~~~~~~~~~~~~~~~
..


vim +284 drivers/staging/fbtft/fbtft.h

c222ea5d2f3361 Uwe Kleine-König 2022-01-23  281  
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  282  #define FBTFT_SPI_DRIVER(_name, _compatible, _display, _spi_ids)		\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  283  										\
c296d5f9957c03 Thomas Petazzoni 2014-12-31 @284  static int fbtft_driver_probe_spi(struct spi_device *spi)			\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  285  {										\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  286  	return fbtft_probe_common(_display, spi, NULL);				\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  287  }										\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  288  										\
a0386bba70934d Uwe Kleine-König 2022-01-23  289  static void fbtft_driver_remove_spi(struct spi_device *spi)			\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  290  {										\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  291  	struct fb_info *info = spi_get_drvdata(spi);				\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  292  										\
cb08d3d2a3e4d2 Uwe Kleine-König 2021-10-12  293  	fbtft_remove_common(&spi->dev, info);					\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  294  }										\
c296d5f9957c03 Thomas Petazzoni 2014-12-31  295  										\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  296  static struct spi_driver fbtft_driver_spi_driver = {				\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  297  	.driver = {								\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  298  		.name = _name,							\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  299  		.of_match_table = dt_ids,					\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  300  	},									\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  301  	.id_table = _spi_ids,							\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23 @302  	.probe = fbtft_driver_probe_spi,					\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  303  	.remove = fbtft_driver_remove_spi,					\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  304  };
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  305  
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  306  #define FBTFT_REGISTER_DRIVER(_name, _compatible, _display)                \
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  307  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  308  static int fbtft_driver_probe_pdev(struct platform_device *pdev)           \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  309  {                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  310  	return fbtft_probe_common(_display, NULL, pdev);                   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  311  }                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  312  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  313  static int fbtft_driver_remove_pdev(struct platform_device *pdev)          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  314  {                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  315  	struct fb_info *info = platform_get_drvdata(pdev);                 \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  316  									   \
cb08d3d2a3e4d2 Uwe Kleine-König 2021-10-12  317  	fbtft_remove_common(&pdev->dev, info);                             \
cb08d3d2a3e4d2 Uwe Kleine-König 2021-10-12  318  	return 0;                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  319  }                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  320  									   \
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  321  FBTFT_DT_TABLE(_compatible)						   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  322  									   \
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  323  FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)			   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  324  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  325  static struct platform_driver fbtft_driver_platform_driver = {             \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  326  	.driver = {                                                        \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  327  		.name   = _name,                                           \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  328  		.owner  = THIS_MODULE,                                     \
189f39ee6ac51d Andy Shevchenko  2019-11-20  329  		.of_match_table = dt_ids,                                  \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  330  	},                                                                 \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  331  	.probe  = fbtft_driver_probe_pdev,                                 \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  332  	.remove = fbtft_driver_remove_pdev,                                \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  333  };                                                                         \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  334  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  335  static int __init fbtft_driver_module_init(void)                           \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  336  {                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  337  	int ret;                                                           \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  338  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  339  	ret = spi_register_driver(&fbtft_driver_spi_driver);               \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  340  	if (ret < 0)                                                       \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  341  		return ret;                                                \
7d8e4c98d13b6b Uwe Kleine-König 2022-01-23  342  	ret = platform_driver_register(&fbtft_driver_platform_driver);     \
7d8e4c98d13b6b Uwe Kleine-König 2022-01-23  343  	if (ret < 0)                                                       \
7d8e4c98d13b6b Uwe Kleine-König 2022-01-23  344  		spi_unregister_driver(&fbtft_driver_spi_driver);           \
7d8e4c98d13b6b Uwe Kleine-König 2022-01-23  345  	return ret;                                                        \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  346  }                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  347  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  348  static void __exit fbtft_driver_module_exit(void)                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  349  {                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  350  	spi_unregister_driver(&fbtft_driver_spi_driver);                   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  351  	platform_driver_unregister(&fbtft_driver_platform_driver);         \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  352  }                                                                          \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  353  									   \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  354  module_init(fbtft_driver_module_init);                                     \
c296d5f9957c03 Thomas Petazzoni 2014-12-31  355  module_exit(fbtft_driver_module_exit);
15e66fc72925a4 Heiner Kallweit  2021-12-01  356  
15e66fc72925a4 Heiner Kallweit  2021-12-01  357  #define FBTFT_REGISTER_SPI_DRIVER(_name, _comp_vend, _comp_dev, _display)	\
15e66fc72925a4 Heiner Kallweit  2021-12-01  358  										\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  359  FBTFT_DT_TABLE(_comp_vend "," _comp_dev)					\
15e66fc72925a4 Heiner Kallweit  2021-12-01  360  										\
15e66fc72925a4 Heiner Kallweit  2021-12-01 @361  static const struct spi_device_id spi_ids[] = {					\
15e66fc72925a4 Heiner Kallweit  2021-12-01  362  	{ .name = _comp_dev },							\
15e66fc72925a4 Heiner Kallweit  2021-12-01  363  	{},									\
15e66fc72925a4 Heiner Kallweit  2021-12-01  364  };										\
15e66fc72925a4 Heiner Kallweit  2021-12-01 @365  MODULE_DEVICE_TABLE(spi, spi_ids);						\
15e66fc72925a4 Heiner Kallweit  2021-12-01  366  										\
c222ea5d2f3361 Uwe Kleine-König 2022-01-23  367  FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
15e66fc72925a4 Heiner Kallweit  2021-12-01  368  										\
15e66fc72925a4 Heiner Kallweit  2021-12-01  369  module_spi_driver(fbtft_driver_spi_driver);
c296d5f9957c03 Thomas Petazzoni 2014-12-31  370  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
