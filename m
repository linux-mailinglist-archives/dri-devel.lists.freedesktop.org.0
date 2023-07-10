Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1974CB48
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 06:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FA610E041;
	Mon, 10 Jul 2023 04:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09C5D10E041
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 04:38:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx5fAui6tktPICAA--.8608S3;
 Mon, 10 Jul 2023 12:38:07 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxniMUi6tkfb0mAA--.4543S3; 
 Mon, 10 Jul 2023 12:38:04 +0800 (CST)
Message-ID: <e1b7d594-220e-7c17-09c8-ff8867382129@loongson.cn>
Date: Mon, 10 Jul 2023 12:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [drm-misc:drm-misc-next 1/15]
 drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier
 'screen_info'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Deepak Rawat <drawat.floss@gmail.com>,
 Michael Kelley <mikelley@microsoft.com>
References: <202307101042.rqehuauj-lkp@intel.com>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <202307101042.rqehuauj-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxniMUi6tkfb0mAA--.4543S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3ZrWkZF1xKw45Jw1DtFW3CFX_yoW8Xr48Ao
 WxC343ZF1rX3W8A395Za1Dt3WIq39FgFs8Kay3Xa1qq342qF93XFWrArW3AFsYqr1qqrnr
 Za4UXF45JwsIgFZ7l-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUOb7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2eT5DUUUU
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
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Deepak and Michael


Would you like to review this trivial patch ?

Please help to push this to drm/hyperv, because kernel test robots are 
crying.


On 2023/7/10 10:57, kernel test robot wrote:
> tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> head:   70d1ace56db6c79d39dbe9c0d5244452b67e2fde
> commit: 8b0d13545b091729e0aa05ff9981e2d06c1e2ee5 [1/15] efi: Do not include <linux/screen_info.h> from EFI header
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230710/202307101042.rqehuauj-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230710/202307101042.rqehuauj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307101042.rqehuauj-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/video/fbdev/hyperv_fb.c:1033:10: error: use of undeclared identifier 'screen_info'
>      1033 |                 base = screen_info.lfb_base;
>           |                        ^
>     drivers/video/fbdev/hyperv_fb.c:1034:10: error: use of undeclared identifier 'screen_info'
>      1034 |                 size = screen_info.lfb_size;
>           |                        ^
>>> drivers/video/fbdev/hyperv_fb.c:1080:3: error: must use 'struct' tag to refer to type 'screen_info'
>      1080 |                 screen_info.lfb_size = 0;
>           |                 ^
>           |                 struct
>>> drivers/video/fbdev/hyperv_fb.c:1080:14: error: expected identifier or '('
>      1080 |                 screen_info.lfb_size = 0;
>           |                            ^
>     drivers/video/fbdev/hyperv_fb.c:1081:3: error: must use 'struct' tag to refer to type 'screen_info'
>      1081 |                 screen_info.lfb_base = 0;
>           |                 ^
>           |                 struct
>     drivers/video/fbdev/hyperv_fb.c:1081:14: error: expected identifier or '('
>      1081 |                 screen_info.lfb_base = 0;
>           |                            ^
>     drivers/video/fbdev/hyperv_fb.c:1082:3: error: must use 'struct' tag to refer to type 'screen_info'
>      1082 |                 screen_info.orig_video_isVGA = 0;
>           |                 ^
>           |                 struct
>     drivers/video/fbdev/hyperv_fb.c:1082:14: error: expected identifier or '('
>      1082 |                 screen_info.orig_video_isVGA = 0;
>           |                            ^
>     8 errors generated.
>
>
> vim +/screen_info +1033 drivers/video/fbdev/hyperv_fb.c
>
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   988
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   989
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   990  /* Get framebuffer memory from Hyper-V video pci space */
> 3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05   991  static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   992  {
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   993  	struct hvfb_par *par = info->par;
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   994  	struct pci_dev *pdev  = NULL;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29   995  	void __iomem *fb_virt;
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   996  	int gen2vm = efi_enabled(EFI_BOOT);
> 81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19   997  	resource_size_t base, size;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09   998  	phys_addr_t paddr;
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26   999  	int ret;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1000
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1001  	if (!gen2vm) {
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1002  		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1003  			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1004  		if (!pdev) {
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1005  			pr_err("Unable to find PCI Hyper-V video\n");
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1006  			return -ENODEV;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1007  		}
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1008
> 81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1009  		base = pci_resource_start(pdev, 0);
> 81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1010  		size = pci_resource_len(pdev, 0);
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1011
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1012  		/*
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1013  		 * For Gen 1 VM, we can directly use the contiguous memory
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1014  		 * from VM. If we succeed, deferred IO happens directly
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1015  		 * on this allocated framebuffer memory, avoiding extra
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1016  		 * memory copy.
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1017  		 */
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1018  		paddr = hvfb_get_phymem(hdev, screen_fb_size);
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1019  		if (paddr != (phys_addr_t) -1) {
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1020  			par->mmio_pp = paddr;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1021  			par->mmio_vp = par->dio_vp = __va(paddr);
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1022
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1023  			info->fix.smem_start = paddr;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1024  			info->fix.smem_len = screen_fb_size;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1025  			info->screen_base = par->mmio_vp;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1026  			info->screen_size = screen_fb_size;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1027
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1028  			par->need_docopy = false;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1029  			goto getmem_done;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1030  		}
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1031  		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1032  	} else {
> 81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19 @1033  		base = screen_info.lfb_base;
> 81d2393485f099 drivers/video/fbdev/hyperv_fb.c Thomas Zimmermann 2022-12-19  1034  		size = screen_info.lfb_size;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1035  	}
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1036
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1037  	/*
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1038  	 * Cannot use the contiguous physical memory.
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1039  	 * Allocate mmio space for framebuffer.
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1040  	 */
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1041  	dio_fb_size =
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1042  		screen_width * screen_height * screen_depth / 8;
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1043
> c4b4d7047f16a8 drivers/video/fbdev/hyperv_fb.c Saurabh Sengar    2022-04-27  1044  	ret = vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
> 3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1045  				  screen_fb_size, 0x100000, true);
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1046  	if (ret != 0) {
> 3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1047  		pr_err("Unable to allocate framebuffer memory\n");
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1048  		goto err1;
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1049  	}
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1050
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1051  	/*
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1052  	 * Map the VRAM cacheable for performance. This is also required for
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1053  	 * VM Connect to display properly for ARM64 Linux VM, as the host also
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1054  	 * maps the VRAM cacheable.
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1055  	 */
> 5f1251a48c17b5 drivers/video/fbdev/hyperv_fb.c Dexuan Cui        2020-11-17  1056  	fb_virt = ioremap_cache(par->mem->start, screen_fb_size);
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1057  	if (!fb_virt)
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1058  		goto err2;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1059
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1060  	/* Allocate memory for deferred IO */
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1061  	par->dio_vp = vzalloc(round_up(dio_fb_size, PAGE_SIZE));
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1062  	if (par->dio_vp == NULL)
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1063  		goto err3;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1064
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1065  	/* Physical address of FB device */
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1066  	par->mmio_pp = par->mem->start;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1067  	/* Virtual address of FB device */
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1068  	par->mmio_vp = (unsigned char *) fb_virt;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1069
> 3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1070  	info->fix.smem_start = par->mem->start;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1071  	info->fix.smem_len = dio_fb_size;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1072  	info->screen_base = par->dio_vp;
> d21987d709e807 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-09-18  1073  	info->screen_size = dio_fb_size;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1074
> 3a6fb6c4255c38 drivers/video/fbdev/hyperv_fb.c Wei Hu            2019-12-09  1075  getmem_done:
> 5fbcc6708fe32e drivers/video/fbdev/hyperv_fb.c Daniel Vetter     2023-04-06  1076  	aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1077
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1078  	if (gen2vm) {
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1079  		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14 @1080  		screen_info.lfb_size = 0;
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1081  		screen_info.lfb_base = 0;
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1082  		screen_info.orig_video_isVGA = 0;
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1083  	} else {
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1084  		pci_dev_put(pdev);
> 3cb73bc3fa2a3c drivers/video/fbdev/hyperv_fb.c Kairui Song       2020-10-14  1085  	}
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1086
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1087  	return 0;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1088
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1089  err3:
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1090  	iounmap(fb_virt);
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1091  err2:
> 696ca5e82c057a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2016-04-05  1092  	vmbus_free_mmio(par->mem->start, screen_fb_size);
> 3546448338e76a drivers/video/fbdev/hyperv_fb.c Jake Oshins       2015-08-05  1093  	par->mem = NULL;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1094  err1:
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1095  	if (!gen2vm)
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1096  		pci_dev_put(pdev);
> 9069fd54960304 drivers/video/hyperv_fb.c       Gerd Hoffmann     2014-02-26  1097
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1098  	return -ENOMEM;
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1099  }
> 68a2d20b79b105 drivers/video/hyperv_fb.c       Haiyang Zhang     2013-04-29  1100
>
> :::::: The code at line 1033 was first introduced by commit
> :::::: 81d2393485f0990cf6566b0c9e0697c199f68ae5 fbdev/hyperv-fb: Do not set struct fb_info.apertures
>
> :::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
> :::::: CC: Thomas Zimmermann <tzimmermann@suse.de>
>

