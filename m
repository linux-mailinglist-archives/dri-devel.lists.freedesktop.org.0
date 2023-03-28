Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B86CC8CF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 19:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF09A10E494;
	Tue, 28 Mar 2023 17:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D110E494
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:06:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 475F4B81DB5;
 Tue, 28 Mar 2023 17:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E436C433D2;
 Tue, 28 Mar 2023 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680023198;
 bh=mSJs5c0u+mvYERTVXLbz2yaNg7v/fMoz0d2LwP4Amgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BzVDmw43m60lvH0Y3KjAIrZm6woD7+AuyL5jMqZObEtFgYW0wKZ620dZ4j9la6GKr
 VH8ZHy/40ROZYD+wpguyi+Hnrz60lue9UANRUfwDWT/XbZvuIjg+BtjmxcvuJFM0ua
 1/dAgwGGnlprh119IPhnzAFOQwKOkEQBbBkalAwVG2eSKm3HK2LifA8O54SAtv0OrM
 Q2Imm1uVHmcTk5A4PFzt+qUwbo+dHHPbScXOewUOlstrb1u7MWsTKJsUqKlg2vlWQd
 YoFG0MgDzpeekikZ/MLrmC269nUqCEwWEpjubIXnIc3R2OyHsl3hwsR4CkmRyAcYF8
 vzeSM9lwScGGA==
Date: Tue, 28 Mar 2023 10:06:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v8 2/2] drm: add kms driver for loongson display controller
Message-ID: <20230328170636.GA1986005@dev-arch.thelio-3990X>
References: <20230320100131.1277034-3-15330273260@189.cn>
 <202303281754.jWI20j2C-lkp@intel.com>
 <027cf6d5-6de2-3424-7a81-a43ab689c3d4@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <027cf6d5-6de2-3424-7a81-a43ab689c3d4@189.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 11:22:50PM +0800, Sui Jingfeng wrote:
> HI,
> 
> On 2023/3/28 17:27, kernel test robot wrote:
> > Hi Sui,
> > 
> > Thank you for the patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on drm-misc/drm-misc-next]
> > [also build test WARNING on linus/master v6.3-rc4 next-20230328]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/20230320100131.1277034-3-15330273260%40189.cn
> > patch subject: [PATCH v8 2/2] drm: add kms driver for loongson display controller
> > config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281754.jWI20j2C-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # https://github.com/intel-lab-lkp/linux/commit/80b4115f44993f4ebf47b1cb9e8f02953575b977
> >          git remote add linux-review https://github.com/intel-lab-lkp/linux
> >          git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230320-180408
> >          git checkout 80b4115f44993f4ebf47b1cb9e8f02953575b977
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/accel/ drivers/gpu/drm/loongson/ drivers/iio/light/ drivers/media/pci/intel/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303281754.jWI20j2C-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > > > drivers/gpu/drm/loongson/lsdc_drv.c:232:11: warning: variable 'gpu' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >             else if (descp->chip == CHIP_LS7A2000)
> >                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/gpu/drm/loongson/lsdc_drv.c:235:7: note: uninitialized use occurs here
> >             if (!gpu) {
> >                  ^~~
> >     drivers/gpu/drm/loongson/lsdc_drv.c:232:7: note: remove the 'if' if its condition is always true
> >             else if (descp->chip == CHIP_LS7A2000)
> >                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/gpu/drm/loongson/lsdc_drv.c:217:21: note: initialize the variable 'gpu' to silence this warning
> >             struct pci_dev *gpu;
> >                                ^
> >                                 = NULL
> >     1 warning generated.
> > --
> 
> In practice,  either  descp->chip == CHIP_LS7A2000 or descp->chip ==
> CHIP_LS7A1000 will be happened at runtime.
> 
> the variable 'gpu' is guaranteed to be initialized when code run at 
> drivers/gpu/drm/loongson/lsdc_drv.c:235
> 
> This warnning is almost wrong here.

Clang's semantic analysis happens before optimizations, meaning it does
not perform interprocedural analysis, so it does not have enough
information at this point to tell that. Either just initialize gpu to
NULL and let the existing 'if (!gpu)' handle it or add a separate else
branch that warns about an unhandled chip value so that it is obvious
what needs to be done if someone forgets to update this statement when a
new chip is supported by this driver.

> > > > drivers/gpu/drm/loongson/lsdc_pll.c:188:14: warning: variable 'diff' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >                                     else if (clock_khz < computed)
> >                                              ^~~~~~~~~~~~~~~~~~~~
> >     drivers/gpu/drm/loongson/lsdc_pll.c:191:9: note: uninitialized use occurs here
> >                                     if (diff < min) {
> >                                         ^~~~
> >     drivers/gpu/drm/loongson/lsdc_pll.c:188:10: note: remove the 'if' if its condition is always true
> >                                     else if (clock_khz < computed)
> >                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/gpu/drm/loongson/lsdc_pll.c:177:22: note: initialize the variable 'diff' to silence this warning
> >                                     unsigned int diff;
> >                                                      ^
> >                                                       = 0
> >     1 warning generated.
> 
> Here the robot is also wrong here in practice,
> 
> because either  if (clock_khz >= computed) or else if (clock_khz < computed)
> will be happen.
> 
> 'diff' variable is guaranteed to be initialized.

Make that clearer by turning 'else if (clock_khz < computed)' into just
'else' as the warning suggests? I do not see why the condition is
specified at all if it is just an 'else' in practice.

Cheers,
Nathan

> > 
> > vim +232 drivers/gpu/drm/loongson/lsdc_drv.c
> > 
> >     212	
> >     213	static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
> >     214					   const struct lsdc_desc *descp)
> >     215	{
> >     216		struct drm_device *ddev = &ldev->base;
> >     217		struct pci_dev *gpu;
> >     218		resource_size_t base, size;
> >     219	
> >     220		/*
> >     221		 * The GPU and display controller in LS7A1000/LS7A2000 are separated
> >     222		 * PCIE devices, they are two devices not one. The DC does not has a
> >     223		 * dedicate VRAM bar, because the BIOS engineer choose to assign the
> >     224		 * VRAM to the GPU device. Sadly, after years application, this form
> >     225		 * as a convention for loongson integrated graphics. Bar 2 of the GPU
> >     226		 * device contain the base address and size of the VRAM, both the GPU
> >     227		 * and the DC can access the on-board VRAM as long as the DMA address
> >     228		 * emitted fall in [base, base + size).
> >     229		 */
> >     230		if (descp->chip == CHIP_LS7A1000)
> >     231			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
> >   > 232		else if (descp->chip == CHIP_LS7A2000)
> >     233			gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
> >     234	
> >     235		if (!gpu) {
> >     236			drm_warn(ddev, "No GPU device found\n");
> >     237			return -ENODEV;
> >     238		}
> >     239	
> >     240		base = pci_resource_start(gpu, 2);
> >     241		size = pci_resource_len(gpu, 2);
> >     242	
> >     243		ldev->vram_base = base;
> >     244		ldev->vram_size = size;
> >     245	
> >     246		drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
> >     247			 (u64)base, (u32)(size >> 20));
> >     248	
> >     249		return 0;
> >     250	}
> >     251	
> > 
> 
