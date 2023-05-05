Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6D6F850A
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 16:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384F110E025;
	Fri,  5 May 2023 14:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7A910E025
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683298163; x=1714834163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8SEqnu63V4aMgaTe+M9fdUF3uTxNhkdwiNzKzlV+YIE=;
 b=bAStoSTaOzDda1wwar+FTV4muQ27vBS+2uiuQjnfcLUgzUiqdE7TXn46
 nJKL/eEJFC259G+QdzRQ0doHOU5ekmaqDBE2uSCXV9D662QiDFSsV0Pnu
 b3h8Zx3YdreTgli+0LZHM5l6p4lFkCPrkWmnIb9hLexjrB4ZvGulO2y2U
 bN1dMLPVKCqwBiFDEQoBM6jZFuuMuaA0k8v68xv7267Kt7ChppTp5hBTg
 N+AAVEVSY9FIXMPBdO0Nd1Fu0ShNKQMP5n7yDyGFy/ZuI5yeBSTuAS1dx
 5QsdkYuJdw/r8Yj3a/NhYYnZu0aU16lZwRFwa1ePUVPhRksrHEPAm2xOd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="377300240"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="377300240"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 07:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="841779833"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="841779833"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 05 May 2023 07:49:19 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1puwkI-0000f3-3D;
 Fri, 05 May 2023 14:49:18 +0000
Date: Fri, 5 May 2023 22:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, javierm@redhat.com,
 lyude@redhat.com
Subject: Re: [PATCH 3/4] drm/mgag200: Add IRQ support
Message-ID: <202305052227.4o72gpi8-lkp@intel.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230505124337.854845-4-jfalempe%40redhat.com
patch subject: [PATCH 3/4] drm/mgag200: Add IRQ support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305052227.4o72gpi8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cbbd69ea02ffdcee64621b76bf22cb360d943294
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
        git checkout cbbd69ea02ffdcee64621b76bf22cb360d943294
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305052227.4o72gpi8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_drv.c:113:13: warning: no previous prototype for 'mgag200_driver_irq_handler' [-Wmissing-prototypes]
     113 | irqreturn_t mgag200_driver_irq_handler(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mgag200/mgag200_drv.c:129:6: warning: no previous prototype for 'mgag200_init_irq' [-Wmissing-prototypes]
     129 | void mgag200_init_irq(struct mga_device *mdev)
         |      ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mgag200/mgag200_drv.c:137:6: warning: no previous prototype for 'mgag200_enable_irq' [-Wmissing-prototypes]
     137 | void mgag200_enable_irq(struct mga_device *mdev)
         |      ^~~~~~~~~~~~~~~~~~


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
