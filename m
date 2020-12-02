Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9342CC1D2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 17:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169596EA49;
	Wed,  2 Dec 2020 16:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859F76EA49
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 16:15:05 +0000 (UTC)
IronPort-SDR: aH0pYoE14QjDES8Eb5tAwGM2bGLUHNKcSWrOufOorTKpeVTfASoO0wUfYNhrLxujX+/hqCVEST
 98E7BHzZitWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="170474905"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
 d="gz'50?scan'50,208,50";a="170474905"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 08:14:54 -0800
IronPort-SDR: TDvyp0jRJzO3noE5DDKZyUV1Ln032tTUuTbUF+vXUPt+wOsxsYFxr7ZiHNh/c/OqMOQ+IF89jN
 0omMxl0vzl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; 
 d="gz'50?scan'50,208,50";a="539749913"
Received: from lkp-server01.sh.intel.com (HELO 54133fc185c3) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Dec 2020 08:14:52 -0800
Received: from kbuild by 54133fc185c3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkUmJ-0000Ca-I5; Wed, 02 Dec 2020 16:14:51 +0000
Date: Thu, 3 Dec 2020 00:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: mdurnev@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: [PATCH v2 2/3] drm/tiny: Add driver for ili9341 with parallel bus
Message-ID: <202012030053.Jd9g07RF-lkp@intel.com>
References: <1606777536-14783-3-git-send-email-mikhail_durnev@mentor.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <1606777536-14783-3-git-send-email-mikhail_durnev@mentor.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 mikhail_durnev@mentor.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.10-rc6 next-20201201]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/mdurnev-gmail-com/drm-mipi-dbi-Type-B-bus-support-drm-tiny-MRB2801/20201201-071109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 09162bc32c880a791c6c0668ce0745cf7958f576
config: riscv-randconfig-r024-20201202 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 2671fccf0381769276ca8246ec0499adcb9b0355)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6d76a991fa9d2c883126667b704c729eaa22df0e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review mdurnev-gmail-com/drm-mipi-dbi-Type-B-bus-support-drm-tiny-MRB2801/20201201-071109
        git checkout 6d76a991fa9d2c883126667b704c729eaa22df0e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9341_gpio.c:157:14: error: use of undeclared identifier 'mipi_dbi_release'; did you mean 'mipi_dbi_hw_reset'?
           .release                = mipi_dbi_release,
                                     ^~~~~~~~~~~~~~~~
                                     mipi_dbi_hw_reset
   include/drm/drm_mipi_dbi.h:184:6: note: 'mipi_dbi_hw_reset' declared here
   void mipi_dbi_hw_reset(struct mipi_dbi *dbi);
        ^
>> drivers/gpu/drm/tiny/ili9341_gpio.c:158:2: error: use of undeclared identifier 'DRM_GEM_CMA_VMAP_DRIVER_OPS'
           DRM_GEM_CMA_VMAP_DRIVER_OPS,
           ^
>> drivers/gpu/drm/tiny/ili9341_gpio.c:192:8: error: implicit declaration of function 'devm_drm_dev_init' [-Werror,-Wimplicit-function-declaration]
           ret = devm_drm_dev_init(dev, drm, &ili9341gpio_driver);
                 ^
   3 errors generated.

vim +157 drivers/gpu/drm/tiny/ili9341_gpio.c

   153	
   154	static struct drm_driver ili9341gpio_driver = {
   155		.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
   156		.fops			= &ili9341gpio_fops,
 > 157		.release		= mipi_dbi_release,
 > 158		DRM_GEM_CMA_VMAP_DRIVER_OPS,
   159		.debugfs_init		= mipi_dbi_debugfs_init,
   160		.name			= "ili9341gpio",
   161		.desc			= "Ilitek ILI9341",
   162		.date			= "20201114",
   163		.major			= 1,
   164		.minor			= 0,
   165	};
   166	
   167	static const struct of_device_id ili9341gpio_of_match[] = {
   168		{ .compatible = "ronbo,mrb2801" },
   169		{ }
   170	};
   171	MODULE_DEVICE_TABLE(of, ili9341gpio_of_match);
   172	
   173	static int ili9341gpio_probe(struct platform_device *pdev)
   174	{
   175		struct device *dev = &pdev->dev;
   176		struct mipi_dbi_dev *dbidev;
   177		struct drm_device *drm;
   178		struct mipi_dbi *dbi;
   179		struct gpio_desc *dc;
   180		struct gpio_desc *wr;
   181		struct gpio_descs *db;
   182		u32 rotation = 0;
   183		u32 wr_delays[2] = {15, 60};
   184		int ret;
   185	
   186		dbidev = kzalloc(sizeof(*dbidev), GFP_KERNEL);
   187		if (!dbidev)
   188			return -ENOMEM;
   189	
   190		dbi = &dbidev->dbi;
   191		drm = &dbidev->drm;
 > 192		ret = devm_drm_dev_init(dev, drm, &ili9341gpio_driver);
   193		if (ret) {
   194			kfree(dbidev);
   195			return ret;
   196		}
   197	
   198		drm_mode_config_init(drm);
   199	
   200		dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
   201		if (IS_ERR(dbi->reset)) {
   202			DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
   203			return PTR_ERR(dbi->reset);
   204		}
   205	
   206		dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_HIGH);
   207		if (IS_ERR(dc)) {
   208			DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
   209			return PTR_ERR(dc);
   210		}
   211	
   212		wr = devm_gpiod_get(dev, "wr", GPIOD_OUT_HIGH);
   213		if (IS_ERR(wr)) {
   214			DRM_DEV_ERROR(dev, "Failed to get gpio 'wr'\n");
   215			return PTR_ERR(wr);
   216		}
   217	
   218		db = devm_gpiod_get_array(dev, "db", GPIOD_OUT_LOW);
   219		if (IS_ERR(db)) {
   220			DRM_DEV_ERROR(dev, "Failed to get gpio 'db'\n");
   221			return PTR_ERR(db);
   222		}
   223		if (db->ndescs != 16 && db->ndescs != 8) {
   224			/*
   225			 * The data bus can be either 8 or 16 bits wide.
   226			 * ILI9341 can work with 6, 8, 9, 16, and 18-bit parallel interfaces,
   227			 * but the MRB2801 board supports only 8 or 16-bit interfaces.
   228			 */
   229			DRM_DEV_ERROR(dev, "Wrong number of bits in gpio 'db': %u\n", db->ndescs);
   230			return PTR_ERR(db);
   231		}
   232	
   233		dbidev->backlight = devm_of_find_backlight(dev);
   234		if (IS_ERR(dbidev->backlight))
   235			return PTR_ERR(dbidev->backlight);
   236	
   237		device_property_read_u32(dev, "rotation", &rotation);
   238	
   239		device_property_read_u32_array(dev, "wr-up-down-delays", wr_delays, 2);
   240	
   241		ret = mipi_dbi_gpio_init(dbi, dc, wr, db, wr_delays[0], wr_delays[1]);
   242		if (ret)
   243			return ret;
   244	
   245		ret = mipi_dbi_dev_init(dbidev, &ili9341gpio_pipe_funcs, &yx240qv29_mode, rotation);
   246		if (ret)
   247			return ret;
   248	
   249		drm_mode_config_reset(drm);
   250	
   251		ret = drm_dev_register(drm, 0);
   252		if (ret)
   253			return ret;
   254	
   255		platform_set_drvdata(pdev, drm);
   256	
   257		drm_fbdev_generic_setup(drm, 0);
   258	
   259		return 0;
   260	}
   261	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--45Z9DzgjV8m4Oswq
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--45Z9DzgjV8m4Oswq--
