Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB19BDA68
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 01:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAA010E636;
	Wed,  6 Nov 2024 00:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcgpBxHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC3B10E636
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 00:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730853538; x=1762389538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OY1hlIVYQYS0vaFdEQbDhhBtFBmY9oVIQ6rqxklOL7Q=;
 b=LcgpBxHptWTqsaPvULxcwsX/J70pBAGtu8/EdUt8qJWFMUm11dWUbIYr
 6CHwB1vSEgSk+pH80nxeK1VNPQVI65a15E/PDFkwbDuHDVCNbbALxwUvw
 Gj5uVHU65hz8hjP9IHiw1QyTeDe60NcapkousnEMSIZWyZJpMDQvqOXge
 KI9k29ATlmn/ylqzYGaeNofIQGXzU0/bzuvg0kMLSzn5vbwqItnrmoIW9
 qeFzWSGM14IyVNXc4WbxsT6dhya4FLHGMLPXStC13K8fO21akfHUwAkUn
 0MtV1AdUl0Ulf9YH1dosMemjnGwtrvW+OXpMkzK8WJ25phXbBqVBg8w6x Q==;
X-CSE-ConnectionGUID: wJaCVIC/Qv2Tuq99HIAGRg==
X-CSE-MsgGUID: EKZR14bZQnexBdyE8tFISA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30793761"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30793761"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 16:38:58 -0800
X-CSE-ConnectionGUID: I3dyyNjpT2qz2VOPNAR7VQ==
X-CSE-MsgGUID: Tn51CGnTRsuvRpj/uZhEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88746269"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2024 16:38:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8U4R-000me3-2V;
 Wed, 06 Nov 2024 00:38:51 +0000
Date: Wed, 6 Nov 2024 08:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v6 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202411060804.HiQa1eSZ-lkp@intel.com>
References: <20241105125109.226866-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105125109.226866-3-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on d78f0ee0406803cda8801fd5201746ccf89e5e4a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Move-drawing-functions-to-drm_draw/20241105-205432
base:   d78f0ee0406803cda8801fd5201746ccf89e5e4a
patch link:    https://lore.kernel.org/r/20241105125109.226866-3-jfalempe%40redhat.com
patch subject: [PATCH v6 2/6] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: s390-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060804.HiQa1eSZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060804.HiQa1eSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060804.HiQa1eSZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/arm/display/komeda/komeda_drv.o: in function `komeda_platform_probe':
>> drivers/gpu/drm/arm/display/komeda/komeda_drv.c:87:(.text+0x18e): undefined reference to `drm_client_setup'
   s390-linux-ld: drivers/gpu/drm/radeon/radeon_drv.o: in function `radeon_pci_probe':
>> drivers/gpu/drm/radeon/radeon_drv.c:336:(.text+0x594): undefined reference to `drm_client_setup'
   s390-linux-ld: drivers/gpu/drm/vkms/vkms_drv.o: in function `vkms_create':
>> drivers/gpu/drm/vkms/vkms_drv.c:230:(.text.unlikely+0x1b4): undefined reference to `drm_client_setup'
   s390-linux-ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
>> drivers/gpu/drm/nouveau/nouveau_drm.c:882:(.text+0x2c26): undefined reference to `drm_client_setup'
   s390-linux-ld: drivers/gpu/drm/ast/ast_drv.o: in function `ast_pci_probe':
>> drivers/gpu/drm/ast/ast_drv.c:365:(.text+0x916): undefined reference to `drm_client_setup'
   s390-linux-ld: drivers/gpu/drm/qxl/qxl_drv.o:drivers/gpu/drm/qxl/qxl_drv.c:122: more undefined references to `drm_client_setup' follow


vim +87 drivers/gpu/drm/arm/display/komeda/komeda_drv.c

ce3d99c8349584 Douglas Anderson                       2023-09-01   55  
4cfe5cc02e3f62 Faiz Abbas                             2023-07-12   56  static int komeda_platform_probe(struct platform_device *pdev)
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   57) {
4cfe5cc02e3f62 Faiz Abbas                             2023-07-12   58  	struct device *dev = &pdev->dev;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   59) 	struct komeda_drv *mdrv;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   60) 	int err;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   61) 
a918dcfecc36f8 Amjad Ouled-Ameur                      2024-02-19   62  	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
a918dcfecc36f8 Amjad Ouled-Ameur                      2024-02-19   63  	if (err)
a918dcfecc36f8 Amjad Ouled-Ameur                      2024-02-19   64  		return dev_err_probe(dev, err, "DMA mask error\n");
a918dcfecc36f8 Amjad Ouled-Ameur                      2024-02-19   65  
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   66) 	mdrv = devm_kzalloc(dev, sizeof(*mdrv), GFP_KERNEL);
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   67) 	if (!mdrv)
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   68) 		return -ENOMEM;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   69) 
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   70) 	mdrv->mdev = komeda_dev_create(dev);
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   71) 	if (IS_ERR(mdrv->mdev)) {
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   72) 		err = PTR_ERR(mdrv->mdev);
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   73) 		goto free_mdrv;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   74) 	}
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   75) 
efb46508851874 james qian wang (Arm Technology China  2019-12-12   76) 	pm_runtime_enable(dev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12   77) 	if (!pm_runtime_enabled(dev))
efb46508851874 james qian wang (Arm Technology China  2019-12-12   78) 		komeda_dev_resume(mdrv->mdev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12   79) 
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   80) 	mdrv->kms = komeda_kms_attach(mdrv->mdev);
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   81) 	if (IS_ERR(mdrv->kms)) {
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   82) 		err = PTR_ERR(mdrv->kms);
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   83) 		goto destroy_mdev;
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   84) 	}
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   85) 
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   86) 	dev_set_drvdata(dev, mdrv);
dd5891e7a4099e Thomas Zimmermann                      2024-09-24  @87  	drm_client_setup(&mdrv->kms->base, NULL);
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   88) 
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   89) 	return 0;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   90) 
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   91) destroy_mdev:
efb46508851874 james qian wang (Arm Technology China  2019-12-12   92) 	if (pm_runtime_enabled(dev))
efb46508851874 james qian wang (Arm Technology China  2019-12-12   93) 		pm_runtime_disable(dev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12   94) 	else
efb46508851874 james qian wang (Arm Technology China  2019-12-12   95) 		komeda_dev_suspend(mdrv->mdev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12   96) 
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   97) 	komeda_dev_destroy(mdrv->mdev);
61f1c4a8ab7575 james qian wang (Arm Technology China  2019-01-03   98) 
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03   99) free_mdrv:
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03  100) 	devm_kfree(dev, mdrv);
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03  101) 	return err;
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03  102) }
26bd43a7599639 james qian wang (Arm Technology China  2019-01-03  103) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
