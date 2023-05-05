Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3946F8531
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 17:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD7810E625;
	Fri,  5 May 2023 15:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AFF10E625
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683298947; x=1714834947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CE0l/faMRL3j+GUaQ0XO9bqeDaRnnBzt1VfxirJS3x4=;
 b=TZ3KOhu7dw6M/jCv+8Z8SzzhKlkL5kQiuody9RGhgQWE+0VcFOLy8s4Z
 N97bPGgO45bSrvRAw5juQ6wMRLkx5n3b4Zc6A6IlNJ67wPnj1Ix/UgaCb
 vfM+CL194lLcSCAZZk0XjRyub2IY3oX18c5NRGoyS+pvcN/LzV6NLeS0g
 Mt4Okex0TwYPAiGfN9QsaDece37KuHVctbu4N3BwkRm6piaDGvbW8Z8Y8
 DqcGM5UtCnqZJjV7TpdiOhJvdSniMqcrEoYBkGuMyn3Dl0OA7PWQKKdeH
 X3Xv6v9vGBaBiOdfs1G57vfLiugXbCKjRfcEaH981c5IGhhy+5nyI00iZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414761234"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="414761234"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 08:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="1027533320"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="1027533320"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 05 May 2023 08:02:21 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1puwwt-0000fV-0v;
 Fri, 05 May 2023 15:02:19 +0000
Date: Fri, 5 May 2023 23:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 lyude@redhat.com
Subject: Re: [PATCH 3/4] drm/mgag200: Add IRQ support
Message-ID: <202305052227.GGoicr9j-lkp@intel.com>
References: <20230505124337.854845-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505124337.854845-4-jfalempe@redhat.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230505124337.854845-4-jfalempe%40redhat.com
patch subject: [PATCH 3/4] drm/mgag200: Add IRQ support
config: i386-randconfig-a013-20230501 (https://download.01.org/0day-ci/archive/20230505/202305052227.GGoicr9j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cbbd69ea02ffdcee64621b76bf22cb360d943294
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
        git checkout cbbd69ea02ffdcee64621b76bf22cb360d943294
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305052227.GGoicr9j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_drv.c:113:13: warning: no previous prototype for function 'mgag200_driver_irq_handler' [-Wmissing-prototypes]
   irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
               ^
   drivers/gpu/drm/mgag200/mgag200_drv.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
   ^
   static 
>> drivers/gpu/drm/mgag200/mgag200_drv.c:129:6: warning: no previous prototype for function 'mgag200_init_irq' [-Wmissing-prototypes]
   void mgag200_init_irq(struct mga_device *mdev)
        ^
   drivers/gpu/drm/mgag200/mgag200_drv.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mgag200_init_irq(struct mga_device *mdev)
   ^
   static 
>> drivers/gpu/drm/mgag200/mgag200_drv.c:137:6: warning: no previous prototype for function 'mgag200_enable_irq' [-Wmissing-prototypes]
   void mgag200_enable_irq(struct mga_device *mdev)
        ^
   drivers/gpu/drm/mgag200/mgag200_drv.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mgag200_enable_irq(struct mga_device *mdev)
   ^
   static 
   3 warnings generated.


vim +/mgag200_driver_irq_handler +113 drivers/gpu/drm/mgag200/mgag200_drv.c

   112	
 > 113	irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
   114	{
   115		struct mga_device *mdev = (struct mga_device *) arg;
   116		u32 status;
   117	
   118		status = RREG32(MGAREG_STATUS);
   119	
   120		if (status & MGAIRQ_SOFTRAP) {
   121			WREG32(MGAREG_ICLEAR, MGAIRQ_SOFTRAP);
   122			mdev->dma_in_use = 0;
   123			wake_up(&mdev->waitq);
   124			return IRQ_HANDLED;
   125		}
   126		return IRQ_NONE;
   127	}
   128	
 > 129	void mgag200_init_irq(struct mga_device *mdev)
   130	{
   131		/* Disable *all* interrupts */
   132		WREG32(MGAREG_IEN, 0);
   133		/* Clear bits if they're already high */
   134		WREG32(MGAREG_ICLEAR, 0xf);
   135	}
   136	
 > 137	void mgag200_enable_irq(struct mga_device *mdev)
   138	{
   139		/* Enable only Softrap IRQ */
   140		WREG32(MGAREG_IEN, MGAIRQ_SOFTRAP);
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
