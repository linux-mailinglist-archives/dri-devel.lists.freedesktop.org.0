Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6A6CF8BA
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 03:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF9B10ECAC;
	Thu, 30 Mar 2023 01:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id F131510ECAC;
 Thu, 30 Mar 2023 01:30:32 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:56584.343497374
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id E1F891002FD;
 Thu, 30 Mar 2023 09:30:27 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 2a513672f4724ede906719b5faed2f28 for lkp@intel.com; 
 Thu, 30 Mar 2023 09:30:30 CST
X-Transaction-ID: 2a513672f4724ede906719b5faed2f28
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <eca6b468-1bf6-01a1-c9e4-5241f2d7cad9@189.cn>
Date: Thu, 30 Mar 2023 09:30:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 5/6] drm/etnaviv: expand driver support for the pci
 devices
To: kernel test robot <lkp@intel.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
References: <20230329205129.1513734-6-15330273260@189.cn>
 <202303300759.E9lbKNTQ-lkp@intel.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <202303300759.E9lbKNTQ-lkp@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, pci_clear_master is located at pci.h.


  Added by commit 6a479079c07211bf348ac8a79754f26bea258f26 (PCI: Add 
pci_clear_master() as opposite of pci_set_master())


  I don't know what the reason arc architecture can't use this.


On 2023/3/30 08:07, kernel test robot wrote:
> Hi Sui,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc4 next-20230329]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-etnaviv-add-a-dedicate-function-to-register-irq-handler-for-the-gpu/20230330-045519
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230329205129.1513734-6-15330273260%40189.cn
> patch subject: [PATCH v3 5/6] drm/etnaviv: expand driver support for the pci devices
> config: arc-randconfig-r043-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300759.E9lbKNTQ-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/cfc3554b9fbd8ca3f3f6731d45d811bfa7fdf777
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sui-Jingfeng/drm-etnaviv-add-a-dedicate-function-to-register-irq-handler-for-the-gpu/20230330-045519
>          git checkout cfc3554b9fbd8ca3f3f6731d45d811bfa7fdf777
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/etnaviv/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303300759.E9lbKNTQ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c: In function 'etnaviv_gpu_pci_fini':
>>> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9: error: implicit declaration of function 'pci_clear_master'; did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
>        32 |         pci_clear_master(pdev);
>           |         ^~~~~~~~~~~~~~~~
>           |         pci_set_master
>     cc1: some warnings being treated as errors
>
>
> vim +32 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>
>      27	
>      28	static void etnaviv_gpu_pci_fini(struct etnaviv_gpu *gpu, bool component)
>      29	{
>      30		struct pci_dev *pdev = to_pci_dev(gpu->dev);
>      31	
>    > 32		pci_clear_master(pdev);
>      33	
>      34		dev_dbg(gpu->dev, "component is %s\n",
>      35			component ? "enabled" : "disabled");
>      36	}
>      37	
>
