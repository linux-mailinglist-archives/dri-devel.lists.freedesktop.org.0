Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5D6CBBDC
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 12:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED8010E45D;
	Tue, 28 Mar 2023 10:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1710E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:06:41 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:48482.1980869033
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 7C0051002AE;
 Tue, 28 Mar 2023 18:06:36 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 45bd88eba3f44fce8024556f74106e20 for lkp@intel.com; 
 Tue, 28 Mar 2023 18:06:38 CST
X-Transaction-ID: 45bd88eba3f44fce8024556f74106e20
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <54baaafd-659d-45f8-5261-7df3436aba28@189.cn>
Date: Tue, 28 Mar 2023 18:06:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 2/2] drm: add kms driver for loongson display controller
To: kernel test robot <lkp@intel.com>, Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
References: <20230320100131.1277034-3-15330273260@189.cn>
 <202303281754.jWI20j2C-lkp@intel.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <202303281754.jWI20j2C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Is this all of warnings ?  I'm asking because  I'm afraid it is not all.

If I fix those, it will generate new again next time.


I'm compile this driver with GCC,  it report no warnings

On ls3a4000 mips machine:

   make  -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64- W=1

On ls3a5000 LoongArch machine:

| make -j$(nproc) ARCH=loongarch 
CROSS_COMPILE=loongarch64-unknown-linux-gnu-|

Build tools can be found link [1]

[1] https://github.com/loongson/build-tools

On x86-64 is also compiled.


Yet, It is easy to fix, is there any other questions or issues?

I will fix them all.


On 2023/3/28 17:27, kernel test robot wrote:
> Hi Sui,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linus/master v6.3-rc4 next-20230328]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230320100131.1277034-3-15330273260%40189.cn
> patch subject: [PATCH v8 2/2] drm: add kms driver for loongson display controller
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281754.jWI20j2C-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/80b4115f44993f4ebf47b1cb9e8f02953575b977
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
>          git checkout 80b4115f44993f4ebf47b1cb9e8f02953575b977
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/accel/ drivers/gpu/drm/loongson/ drivers/iio/light/ drivers/media/pci/intel/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303281754.jWI20j2C-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/loongson/lsdc_drv.c:232:11: warning: variable 'gpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>             else if (descp->chip == CHIP_LS7A2000)
>                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/loongson/lsdc_drv.c:235:7: note: uninitialized use occurs here
>             if (!gpu) {
>                  ^~~
>     drivers/gpu/drm/loongson/lsdc_drv.c:232:7: note: remove the 'if' if its condition is always true
>             else if (descp->chip == CHIP_LS7A2000)
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/loongson/lsdc_drv.c:217:21: note: initialize the variable 'gpu' to silence this warning
>             struct pci_dev *gpu;
>                                ^
>                                 = NULL
>     1 warning generated.
> --
>>> drivers/gpu/drm/loongson/lsdc_pll.c:188:14: warning: variable 'diff' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>                                     else if (clock_khz < computed)
>                                              ^~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/loongson/lsdc_pll.c:191:9: note: uninitialized use occurs here
>                                     if (diff < min) {
>                                         ^~~~
>     drivers/gpu/drm/loongson/lsdc_pll.c:188:10: note: remove the 'if' if its condition is always true
>                                     else if (clock_khz < computed)
>                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/loongson/lsdc_pll.c:177:22: note: initialize the variable 'diff' to silence this warning
>                                     unsigned int diff;
>                                                      ^
>                                                       = 0
>     1 warning generated.
>
>
> vim +232 drivers/gpu/drm/loongson/lsdc_drv.c
>
>     212	
>     213	static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
>     214					   const struct lsdc_desc *descp)
>     215	{
>     216		struct drm_device *ddev = &ldev->base;
>     217		struct pci_dev *gpu;
>     218		resource_size_t base, size;
>     219	
>     220		/*
>     221		 * The GPU and display controller in LS7A1000/LS7A2000 are separated
>     222		 * PCIE devices, they are two devices not one. The DC does not has a
>     223		 * dedicate VRAM bar, because the BIOS engineer choose to assign the
>     224		 * VRAM to the GPU device. Sadly, after years application, this form
>     225		 * as a convention for loongson integrated graphics. Bar 2 of the GPU
>     226		 * device contain the base address and size of the VRAM, both the GPU
>     227		 * and the DC can access the on-board VRAM as long as the DMA address
>     228		 * emitted fall in [base, base + size).
>     229		 */
>     230		if (descp->chip == CHIP_LS7A1000)
>     231			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
>   > 232		else if (descp->chip == CHIP_LS7A2000)
>     233			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
>     234	
>     235		if (!gpu) {
>     236			drm_warn(ddev, "No GPU device found\n");
>     237			return -ENODEV;
>     238		}
>     239	
>     240		base = pci_resource_start(gpu, 2);
>     241		size = pci_resource_len(gpu, 2);
>     242	
>     243		ldev->vram_base = base;
>     244		ldev->vram_size = size;
>     245	
>     246		drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
>     247			 (u64)base, (u32)(size >> 20));
>     248	
>     249		return 0;
>     250	}
>     251	
>
