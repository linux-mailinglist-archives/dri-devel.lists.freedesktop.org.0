Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2C689147
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 08:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352D10E711;
	Fri,  3 Feb 2023 07:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB310E711
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675410830; x=1706946830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VhR5KoH4oPSWCW9crH+ugZ1sfwXDRMMPwPxfz+SP15Y=;
 b=CNxi4BltuIy9ZU60xBStbSN9JAaue2XmV54Ibnsbv/XLvrpbadcITTV/
 F+WK3oD9vDgf+4GSMjpkpIKEZj7jNbFNcxDLap7Y55YOHIBI6KS7bnFZ2
 wZjZ4hkKYuXwOK/kica5w5Y0P8ChBjXIvolco/HhtTvjKCXTBT/Z1maUM
 xE3xJWYUG6IJdl2yNBd03AN9zFlz2wY8XhU1LOIdzZq5hVHDIHo8hxCma
 BBk2LeszyBz1LQSR29laC0zDwJy4ibA5rNozH9VyWgfGpa4VAqJKpnYEm
 k9KK+ulrSM5o2SaYnLqZxlYS7rI4iNH2uuorju8dQu/x25cNIkpafI7Qw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393275873"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="393275873"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 23:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774222155"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="774222155"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 23:53:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNqtG-0000HR-18;
 Fri, 03 Feb 2023 07:53:46 +0000
Date: Fri, 3 Feb 2023 15:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: suijingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm: add kms driver for loongson display controller
Message-ID: <202302031525.A4udCUh1-lkp@intel.com>
References: <20230201170403.167665-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201170403.167665-1-15330273260@189.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi suijingfeng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/suijingfeng/drm-add-kms-driver-for-loongson-display-controller/20230202-011138
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230201170403.167665-1-15330273260%40189.cn
patch subject: [PATCH] drm: add kms driver for loongson display controller
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031525.A4udCUh1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff8d5959f6dcf4abbbdbf2951345f552dc3bea46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review suijingfeng/drm-add-kms-driver-for-loongson-display-controller/20230202-011138
        git checkout ff8d5959f6dcf4abbbdbf2951345f552dc3bea46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/lsdc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/lsdc/lsdc_drv.c:227:1: warning: no previous prototype for 'lsdc_detect_chip' [-Wmissing-prototypes]
     227 | lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id * const ent)
         | ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/lsdc/lsdc_drv.c:295:21: warning: no previous prototype for 'lsdc_create_device' [-Wmissing-prototypes]
     295 | struct lsdc_device *lsdc_create_device(struct pci_dev *pdev,
         |                     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/gpu/drm/lsdc/lsdc_drv.c:11:
   drivers/gpu/drm/lsdc/lsdc_drv.c: In function 'lsdc_create_device':
>> drivers/gpu/drm/lsdc/lsdc_drv.c:325:46: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     325 |         drm_info(ddev, "reg base: 0x%llx\n", (u64)ldev->reg_base);
         |                                              ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_info'
     456 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:460:9: note: in expansion of macro '__drm_printk'
     460 |         __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_drv.c:325:9: note: in expansion of macro 'drm_info'
     325 |         drm_info(ddev, "reg base: 0x%llx\n", (u64)ldev->reg_base);
         |         ^~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_drv.c: At top level:
   drivers/gpu/drm/lsdc/lsdc_drv.c:52:31: warning: 'dc_in_ls2k1000' defined but not used [-Wunused-const-variable=]
      52 | static const struct lsdc_desc dc_in_ls2k1000 = {
         |                               ^~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_drv.c:34:31: warning: 'dc_in_ls2k0500' defined but not used [-Wunused-const-variable=]
      34 | static const struct lsdc_desc dc_in_ls2k0500 = {
         |                               ^~~~~~~~~~~~~~


vim +/lsdc_detect_chip +227 drivers/gpu/drm/lsdc/lsdc_drv.c

   222	
   223	/*
   224	 * lsdc_detect_chip - a function to tell different chips apart.
   225	 */
   226	const struct lsdc_desc *
 > 227	lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id * const ent)
   228	{
   229		if (ent) {
   230			struct lsdc_desc *dc_descp;
   231	
   232			dc_descp = (struct lsdc_desc *)ent->driver_data;
   233			if (dc_descp->chip == CHIP_LS7A1000)
   234				dev_info(&pdev->dev, "LS7A1000 Found, revision: %u\n", pdev->revision);
   235			else if (dc_descp->chip == CHIP_LS7A2000)
   236				dev_info(&pdev->dev, "LS7A2000 Found, revison: %u\n", pdev->revision);
   237	
   238			return dc_descp;
   239		}
   240	
   241		dev_err(&pdev->dev, "No Known Device Found\n");
   242	
   243		return NULL;
   244	}
   245	
   246	static int lsdc_vram_init(struct lsdc_device *ldev,
   247				  const struct lsdc_desc *descp)
   248	{
   249		struct drm_device *ddev = &ldev->base;
   250		struct pci_dev *gpu;
   251		resource_size_t base, size;
   252	
   253		/* The GPU and display controller in LS7A1000/LS7A2000 are separated
   254		 * PCIE devices, they are two devices not one. The DC is a pci device,
   255		 * but it don't have a dedicate VRAM bar, the BIOS engineer choose to
   256		 * assign the VRAM to the gpu device. Sadly, after years application,
   257		 * this decision form as a convention for loongson integrate graphics.
   258		 * For LS7A1000 and LS7A2000, bar 2 of GPU device contain the VRAM,
   259		 * both the GPU and the DC can make use of the VRAM depend on how DRM
   260		 * device driver is written. Therefore, we have to do some tricks here.
   261		 */
   262		if (descp->chip == CHIP_LS7A1000)
   263			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
   264		else if (descp->chip == CHIP_LS7A2000)
   265			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
   266	
   267		if (!gpu) {
   268			drm_warn(ddev, "No GPU device found\n");
   269			return -ENODEV;
   270		}
   271	
   272		base = pci_resource_start(gpu, 2);
   273		size = pci_resource_len(gpu, 2);
   274	
   275		ldev->vram_base = base;
   276		ldev->vram_size = size;
   277	
   278		drm_info(ddev, "vram start: 0x%llx, size: %uMB\n",
   279			 (u64)base, (u32)(size >> 20));
   280	
   281		return 0;
   282	}
   283	
   284	static int
   285	lsdc_remove_conflicting_framebuffers(const struct drm_driver *pdriver,
   286					     resource_size_t base,
   287					     resource_size_t size)
   288	{
   289		return drm_aperture_remove_conflicting_framebuffers(base,
   290								    size,
   291								    false,
   292								    pdriver);
   293	}
   294	
 > 295	struct lsdc_device *lsdc_create_device(struct pci_dev *pdev,
   296					       const struct pci_device_id *ent,
   297					       const struct drm_driver *drv)
   298	{
   299		struct lsdc_device *ldev;
   300		struct drm_device *ddev;
   301		const struct lsdc_desc *descp;
   302		int ret;
   303	
   304		ldev = devm_drm_dev_alloc(&pdev->dev, drv, struct lsdc_device, base);
   305		if (IS_ERR(ldev))
   306			return ldev;
   307	
   308		ddev = &ldev->base;
   309	
   310		pci_set_drvdata(pdev, ddev);
   311	
   312		descp = lsdc_detect_chip(pdev, ent);
   313		if (!descp)
   314			return NULL;
   315	
   316		ldev->descp = descp;
   317	
   318		spin_lock_init(&ldev->reglock);
   319	
   320		/* BAR 0 the DC device contains registers */
   321		ldev->reg_base = pcim_iomap(pdev, 0, 0);
   322		if (!ldev->reg_base)
   323			return ERR_PTR(-EIO);
   324	
 > 325		drm_info(ddev, "reg base: 0x%llx\n", (u64)ldev->reg_base);
   326	
   327		ret = lsdc_vram_init(ldev, descp);
   328		if (ret)
   329			return ERR_PTR(ret);
   330	
   331		ret = lsdc_remove_conflicting_framebuffers(drv,
   332							   ldev->vram_base,
   333							   ldev->vram_size);
   334		if (ret) {
   335			drm_err(ddev, "remove firmware framebuffers failed: %d\n", ret);
   336			return ERR_PTR(ret);
   337		}
   338	
   339		ret = drmm_vram_helper_init(ddev, ldev->vram_base, ldev->vram_size);
   340		if (ret) {
   341			drm_err(ddev, "vram helper init failed: %d\n", ret);
   342			goto err;
   343		}
   344	
   345		ret = lsdc_mode_config_init(ddev, descp);
   346		if (ret) {
   347			drm_dbg(ddev, "%s: %d\n", __func__, ret);
   348			goto err;
   349		}
   350	
   351		ret = lsdc_modeset_init(ldev, descp);
   352		if (ret)
   353			goto err;
   354	
   355		ret = drm_vblank_init(ddev, descp->num_of_crtc);
   356		if (ret)
   357			goto err;
   358	
   359		ret = request_threaded_irq(pdev->irq,
   360					   lsdc_get_irq_handler(ldev),
   361					   lsdc_irq_thread_handler,
   362					   IRQF_ONESHOT,
   363					   dev_name(ddev->dev),
   364					   ddev);
   365		if (ret) {
   366			drm_err(ddev, "Failed to register lsdc interrupt\n");
   367			goto err;
   368		}
   369	
   370		drm_kms_helper_poll_init(ddev);
   371	
   372		return ldev;
   373	
   374	err:
   375		return ERR_PTR(ret);
   376	}
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
