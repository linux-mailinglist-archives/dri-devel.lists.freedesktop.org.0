Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A56CBA90
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 11:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5134810E356;
	Tue, 28 Mar 2023 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081610E356
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679995683; x=1711531683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/WXek2QrxRQfHYNGEo8wCjFsnFgypZubTj2Ft+Tco2g=;
 b=DHvc+JCwtaQS2PIOkSCS2yHhN6S+wB9bjvON/bfZKIAEWM501CBJbS6o
 EYMSD+IMRZ4JVssUbiGW4LkhjYQ0W718TTsL8BQOKbGu1GWO4kX8e04ft
 eSKp7EcOo+CGBJ+/EOEFMsSfww2Ej7nEjOCh2+QGxXpDt/b7bkwRGgbOn
 Zz9sb0nKJgE3OE/p24B0wEqgvFWJoazUyg5axhZMQdKKBjYllpsZescDd
 5HouBF6siR2zNrgHHQpqVswIAlHkBd1OWumMIbZ3PwOXoJuzaPWYYZKnp
 Zo+5RHioGYGFL99uEZIYaOO96xu95SAxNHqD82GKByGi7Ugg50ohKK+v2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339243149"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="339243149"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 02:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748341275"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; d="scan'208";a="748341275"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2023 02:27:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ph5cU-000IQt-0k;
 Tue, 28 Mar 2023 09:27:58 +0000
Date: Tue, 28 Mar 2023 17:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v8 2/2] drm: add kms driver for loongson display controller
Message-ID: <202303281754.jWI20j2C-lkp@intel.com>
References: <20230320100131.1277034-3-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320100131.1277034-3-15330273260@189.cn>
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
Cc: Li Yi <liyi@loongson.cn>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230320100131.1277034-3-15330273260%40189.cn
patch subject: [PATCH v8 2/2] drm: add kms driver for loongson display controller
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281754.jWI20j2C-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/80b4115f44993f4ebf47b1cb9e8f02953575b977
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
        git checkout 80b4115f44993f4ebf47b1cb9e8f02953575b977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/accel/ drivers/gpu/drm/loongson/ drivers/iio/light/ drivers/media/pci/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281754.jWI20j2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/lsdc_drv.c:232:11: warning: variable 'gpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (descp->chip == CHIP_LS7A2000)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_drv.c:235:7: note: uninitialized use occurs here
           if (!gpu) {
                ^~~
   drivers/gpu/drm/loongson/lsdc_drv.c:232:7: note: remove the 'if' if its condition is always true
           else if (descp->chip == CHIP_LS7A2000)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_drv.c:217:21: note: initialize the variable 'gpu' to silence this warning
           struct pci_dev *gpu;
                              ^
                               = NULL
   1 warning generated.
--
>> drivers/gpu/drm/loongson/lsdc_pll.c:188:14: warning: variable 'diff' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                                   else if (clock_khz < computed)
                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_pll.c:191:9: note: uninitialized use occurs here
                                   if (diff < min) {
                                       ^~~~
   drivers/gpu/drm/loongson/lsdc_pll.c:188:10: note: remove the 'if' if its condition is always true
                                   else if (clock_khz < computed)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/lsdc_pll.c:177:22: note: initialize the variable 'diff' to silence this warning
                                   unsigned int diff;
                                                    ^
                                                     = 0
   1 warning generated.


vim +232 drivers/gpu/drm/loongson/lsdc_drv.c

   212	
   213	static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
   214					   const struct lsdc_desc *descp)
   215	{
   216		struct drm_device *ddev = &ldev->base;
   217		struct pci_dev *gpu;
   218		resource_size_t base, size;
   219	
   220		/*
   221		 * The GPU and display controller in LS7A1000/LS7A2000 are separated
   222		 * PCIE devices, they are two devices not one. The DC does not has a
   223		 * dedicate VRAM bar, because the BIOS engineer choose to assign the
   224		 * VRAM to the GPU device. Sadly, after years application, this form
   225		 * as a convention for loongson integrated graphics. Bar 2 of the GPU
   226		 * device contain the base address and size of the VRAM, both the GPU
   227		 * and the DC can access the on-board VRAM as long as the DMA address
   228		 * emitted fall in [base, base + size).
   229		 */
   230		if (descp->chip == CHIP_LS7A1000)
   231			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
 > 232		else if (descp->chip == CHIP_LS7A2000)
   233			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
   234	
   235		if (!gpu) {
   236			drm_warn(ddev, "No GPU device found\n");
   237			return -ENODEV;
   238		}
   239	
   240		base = pci_resource_start(gpu, 2);
   241		size = pci_resource_len(gpu, 2);
   242	
   243		ldev->vram_base = base;
   244		ldev->vram_size = size;
   245	
   246		drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
   247			 (u64)base, (u32)(size >> 20));
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
