Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B576CFBD6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 08:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350E410ECDF;
	Thu, 30 Mar 2023 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C0DE10ECDF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:46:56 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:49992.1004970275
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 05A171002CF;
 Thu, 30 Mar 2023 14:46:51 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 8848f98944564ef38c37ea117c5c5e46 for lkp@intel.com; 
 Thu, 30 Mar 2023 14:46:53 CST
X-Transaction-ID: 8848f98944564ef38c37ea117c5c5e46
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <83c392c9-52de-d819-70e5-651106341f20@189.cn>
Date: Thu, 30 Mar 2023 14:46:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 2/2] drm: add kms driver for loongson display controller
To: kernel test robot <lkp@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 suijingfeng <suijingfeng@loongson.cn>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian Koenig <christian.koenig@amd.com>
References: <20230329155033.1303550-3-15330273260@189.cn>
 <202303301403.lRjtbd5K-lkp@intel.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <202303301403.lRjtbd5K-lkp@intel.com>
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
Cc: loongson-kernel@lists.loongnix.cn, Li Yi <liyi@loongson.cn>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 oe-kbuild-all@lists.linux.dev, nathan@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/3/30 14:28, kernel test robot wrote:
> Hi Sui,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linus/master v6.3-rc4 next-20230329]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230329-235338
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230329155033.1303550-3-15330273260%40189.cn
> patch subject: [PATCH v9 2/2] drm: add kms driver for loongson display controller
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303301403.lRjtbd5K-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/ed6a57085a2dc87999193a71c28399a56e29097b
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230329-235338
>          git checkout ed6a57085a2dc87999193a71c28399a56e29097b
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/fpga/ drivers/gpu/drm/loongson/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303301403.lRjtbd5K-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/loongson/lsdc_drv.c:342:11: warning: variable 'ddev' is uninitialized when used here [-Wuninitialized]
>                     drm_err(ddev, "Not known device, the driver need update!\n");
>                             ^~~~
>     include/drm/drm_print.h:469:16: note: expanded from macro 'drm_err'
>             __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
>                           ^~~
>     include/drm/drm_print.h:456:21: note: expanded from macro '__drm_printk'
>             dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
>                                ^~~
>     include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
>             dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                                       ^~~
>     include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
>                     _p_func(dev, fmt, ##__VA_ARGS__);                       \
>                             ^~~
>     drivers/gpu/drm/loongson/lsdc_drv.c:326:25: note: initialize the variable 'ddev' to silence this warning
>             struct drm_device *ddev;
>                                    ^
>                                     = NULL
>     1 warning generated.
>
>
> vim +/ddev +342 drivers/gpu/drm/loongson/lsdc_drv.c
>
>     321	
>     322	static int lsdc_pci_probe(struct pci_dev *pdev,
>     323				  const struct pci_device_id *ent)
>     324	{
>     325		const struct lsdc_desc *descp;
>     326		struct drm_device *ddev;
>     327		struct lsdc_device *ldev;
>     328		int ret;
>     329	
>     330		ret = pcim_enable_device(pdev);
>     331		if (ret)
>     332			return ret;
>     333	
>     334		pci_set_master(pdev);
>     335	
>     336		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
>     337		if (ret)
>     338			return ret;
>     339	
>     340		descp = lsdc_detect_chip(pdev, ent);
>     341		if (IS_ERR_OR_NULL(descp)) {
>   > 342			drm_err(ddev, "Not known device, the driver need update!\n");
>     343			return -ENODEV;
>     344		}
>     345	

Right, i admit this.


I move  lsdc_detect_chip() function out from lsdc_create_device() to 
here in v9.

Since i think the chip probe should be run as early as possible.

Remove  line 342 `drm_err(ddev, "Not known device, the driver need 
update!\n");` would solve the problem.

This time robot win.

I will wait one or two day before send next version, ok?

>     346		dev_info(&pdev->dev, "%s found, revision: %u",
>     347			 chip_to_str(descp->chip), pdev->revision);
>     348	
>     349		ldev = lsdc_create_device(pdev, descp, &lsdc_drm_driver);
>     350		if (IS_ERR(ldev))
>     351			return PTR_ERR(ldev);
>     352	
>     353		ddev = &ldev->base;
>     354	
>     355		pci_set_drvdata(pdev, ddev);
>     356	
>     357		ret = devm_request_irq(&pdev->dev,
>     358				       pdev->irq,
>     359				       lsdc_get_irq_handler(descp),
>     360				       IRQF_SHARED,
>     361				       dev_name(&pdev->dev),
>     362				       ddev);
>     363		if (ret) {
>     364			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
>     365			return ret;
>     366		}
>     367	
>     368		ret = drm_dev_register(ddev, 0);
>     369		if (ret)
>     370			return ret;
>     371	
>     372		drm_fbdev_generic_setup(ddev, 32);
>     373	
>     374		return 0;
>     375	}
>     376	
>
