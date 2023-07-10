Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62ED74CA1E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 04:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA7310E092;
	Mon, 10 Jul 2023 02:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AFC10E092
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688957889; x=1720493889;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=dA/BLCat2d8axTAjUhfBYN3jkDNbdYnlv2J0A26Cdyk=;
 b=M7kql3D3S7EQXf89KpOvLtdg1V+hygenrwvZ1qVDnkQndZ/KjeZeBWTZ
 QqcrHNBnl3XPWl63W3HND0TpXkxFsFZB/96kzObwJh4kpzb23zNCMKFAK
 UTcJn6fvE8bG/YwxbByVnyZsos3D+SRh+5QIA4/JT+zvDiulCp18SzxGN
 7xtuo/+DRca9FoP7wbrRMhkm/nORjIuq1o0mtsLkA9phYPUlk2xFr1+ci
 un3bnlKYY/6H0pb+N36ZhCNFLdZJ8aJ7MetvhKUcZBmS3aLg9yNE7ZTUW
 omRzev5IipFX8dhXnlNo8Cl9/eoBOzhA9X2IqBry6h+g/nc6DkRu0aVGH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="450604878"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="450604878"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2023 19:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="670783331"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="670783331"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 09 Jul 2023 19:58:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qIh6C-0003VQ-38;
 Mon, 10 Jul 2023 02:58:04 +0000
Date: Mon, 10 Jul 2023 10:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 1/15]
 drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier
 'screen_info'
Message-ID: <202307101042.rqehuauj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   70d1ace56db6c79d39dbe9c0d5244452b67e2fde
commit: 8b0d13545b091729e0aa05ff9981e2d06c1e2ee5 [1/15] efi: Do not include <linux/screen_info.h> from EFI header
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230710/202307101042.rqehuauj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307101042.rqehuauj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307101042.rqehuauj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier 'screen_info'
    1033 |                 base = screen_info.lfb_base;
         |                        ^
   drivers/video/fbdev/hyperv_fb.c:1034:10: error: use of undeclared identifier 'screen_info'
    1034 |                 size = screen_info.lfb_size;
         |                        ^
>> drivers/video/fbdev/hyperv_fb.c:1080:3: error: must use 'struct' tag to refer to type 'screen_info'
    1080 |                 screen_info.lfb_size = 0;
         |                 ^
         |                 struct 
>> drivers/video/fbdev/hyperv_fb.c:1080:14: error: expected identifier or '('
    1080 |                 screen_info.lfb_size = 0;
         |                            ^
   drivers/video/fbdev/hyperv_fb.c:1081:3: error: must use 'struct' tag to refer to type 'screen_info'
    1081 |                 screen_info.lfb_base = 0;
         |                 ^
         |                 struct 
   drivers/video/fbdev/hyperv_fb.c:1081:14: error: expected identifier or '('
    1081 |                 screen_info.lfb_base = 0;
         |                            ^
   drivers/video/fbdev/hyperv_fb.c:1082:3: error: must use 'struct' tag to refer to type 'screen_info'
    1082 |                 screen_info.orig_video_isVGA = 0;
         |                 ^
         |                 struct 
   drivers/video/fbdev/hyperv_fb.c:1082:14: error: expected identifier or '('
    1082 |                 screen_info.orig_video_isVGA = 0;
         |                            ^
   8 errors generated.


vim +/screen_info +1033 drivers/video/fbdev/hyperv_fb.c

3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   988  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   989  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   990  /* Get framebuffer memory from Hyper-V video pci space */
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05   991  static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   992  {
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   993  	struct hvfb_par *par = info->par;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   994  	struct pci_dev *pdev  = NULL;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   995  	void __iomem *fb_virt;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   996  	int gen2vm = efi_enabled(EFI_BOOT);
81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19   997  	resource_size_t base, size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   998  	phys_addr_t paddr;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   999  	int ret;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1000  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1001  	if (!gen2vm) {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1002  		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1003  			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1004  		if (!pdev) {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1005  			pr_err("Unable to find PCI Hyper-V video\n");
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1006  			return -ENODEV;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1007  		}
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1008  
81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1009  		base = pci_resource_start(pdev, 0);
81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1010  		size = pci_resource_len(pdev, 0);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1011  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1012  		/*
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1013  		 * For Gen 1 VM, we can directly use the contiguous memory
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1014  		 * from VM. If we succeed, deferred IO happens directly
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1015  		 * on this allocated framebuffer memory, avoiding extra
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1016  		 * memory copy.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1017  		 */
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1018  		paddr = hvfb_get_phymem(hdev, screen_fb_size);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1019  		if (paddr != (phys_addr_t) -1) {
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1020  			par->mmio_pp = paddr;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1021  			par->mmio_vp = par->dio_vp = __va(paddr);
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1022  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1023  			info->fix.smem_start = paddr;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1024  			info->fix.smem_len = screen_fb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1025  			info->screen_base = par->mmio_vp;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1026  			info->screen_size = screen_fb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1027  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1028  			par->need_docopy = false;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1029  			goto getmem_done;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1030  		}
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1031  		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1032  	} else {
81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19 @1033  		base = screen_info.lfb_base;
81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1034  		size = screen_info.lfb_size;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1035  	}
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1036  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1037  	/*
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1038  	 * Cannot use the contiguous physical memory.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1039  	 * Allocate mmio space for framebuffer.
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1040  	 */
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1041  	dio_fb_size =
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1042  		screen_width * screen_height * screen_depth / 8;
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1043  
c4b4d7047f16a8 drivers/video/fbdev/hyperv_fb.c Saurabh Sengar    2022-04-27  1044  	ret = vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1045  				  screen_fb_size, 0x100000, true);
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1046  	if (ret != 0) {
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1047  		pr_err("Unable to allocate framebuffer memory\n");
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1048  		goto err1;
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1049  	}
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1050  
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1051  	/*
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1052  	 * Map the VRAM cacheable for performance. This is also required for
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1053  	 * VM Connect to display properly for ARM64 Linux VM, as the host also
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1054  	 * maps the VRAM cacheable.
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1055  	 */
5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1056  	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1057  	if (!fb_virt)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1058  		goto err2;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1059  
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1060  	/* Allocate memory for deferred IO */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1061  	par->dio_vp = vzalloc(round_up(dio_fb_size, PAGE_SIZE));
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1062  	if (par->dio_vp == NULL)
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1063  		goto err3;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1064  
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1065  	/* Physical address of FB device */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1066  	par->mmio_pp = par->mem->start;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1067  	/* Virtual address of FB device */
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1068  	par->mmio_vp = (unsigned char *) fb_virt;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1069  
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1070  	info->fix.smem_start = par->mem->start;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1071  	info->fix.smem_len = dio_fb_size;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1072  	info->screen_base = par->dio_vp;
d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1073  	info->screen_size = dio_fb_size;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1074  
3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1075  getmem_done:
5fbcc6708fe32e drivers/video/fbdev/hyperv_fb.c Daniel Vetter     2023-04-06  1076  	aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1077  
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1078  	if (gen2vm) {
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1079  		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14 @1080  		screen_info.lfb_size = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1081  		screen_info.lfb_base = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1082  		screen_info.orig_video_isVGA = 0;
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1083  	} else {
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1084  		pci_dev_put(pdev);
3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1085  	}
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1086  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1087  	return 0;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1088  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1089  err3:
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1090  	iounmap(fb_virt);
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1091  err2:
696ca5e82c057a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2016-04-05  1092  	vmbus_free_mmio(par->mem->start, screen_fb_size);
3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1093  	par->mem = NULL;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1094  err1:
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1095  	if (!gen2vm)
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1096  		pci_dev_put(pdev);
9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1097  
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1098  	return -ENOMEM;
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1099  }
68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1100  

:::::: The code at line 1033 was first introduced by commit
:::::: 81d2393485f0990cf6566b0c9e0697c199f68ae5 fbdev/hyperv-fb: Do not set struct fb_info.apertures

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
