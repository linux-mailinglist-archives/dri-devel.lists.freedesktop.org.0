Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1E8715948
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1AB10E2EE;
	Tue, 30 May 2023 09:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A14C10E157;
 Tue, 30 May 2023 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437221; x=1716973221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rTflTYiV3VKyBm981Ml2WLipgh57SbrnaZBjjFs8J7A=;
 b=l/JPiFzk9GF0lbMZ1NSX2MVq2g0fYtmSFGUUNGnQkeb+rx2cgE55IT/x
 0QpqzHK+mYICQw4lu/+DDHfJJkYO/jsKsSlJE3R0FHhksmySKrZN/t3s8
 0Kr3P04eYC1S5u0XQvu3ksy3BYWg2jkV9Pf7rMY1vsXExY+EEYkx0bC9m
 oyFt/BhLeBdrLPbwfry75xuX/OdlMf2+GEMIEdrOwtnTfZuLZ1D0A3lAz
 GRow4YpBD+QuHUF+MUqpFHeJTtdRubPscEy4wrAkfNV6ot+sZKxfsf+7e
 ivex6A/hSSfPPjY7/POW8jAK9GTrWBQaYzaT0+va/3uSIqdjveSi6RtEB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335207059"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335207059"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880689121"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="880689121"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 30 May 2023 02:00:16 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q3vDE-0000Eo-2X;
 Tue, 30 May 2023 09:00:16 +0000
Date: Tue, 30 May 2023 17:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 5/6] drm/etnaviv: expand driver support for the PCI
 devices
Message-ID: <202305301659.4guSLavL-lkp@intel.com>
References: <20230529172452.2148819-6-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529172452.2148819-6-suijingfeng@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-etnaviv-add-a-dedicated-function-to-register-an-irq-handler/20230530-012547
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230529172452.2148819-6-suijingfeng%40loongson.cn
patch subject: [PATCH v5 5/6] drm/etnaviv: expand driver support for the PCI devices
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305301659.4guSLavL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d05a5fa048dd4b2a934ffbb07c330ddd9279287
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-etnaviv-add-a-dedicated-function-to-register-an-irq-handler/20230530-012547
        git checkout 1d05a5fa048dd4b2a934ffbb07c330ddd9279287
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/etnaviv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301659.4guSLavL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c: In function 'etnaviv_gpu_pci_fini':
>> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9: error: implicit declaration of function 'pci_clear_master'; did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
      32 |         pci_clear_master(pdev);
         |         ^~~~~~~~~~~~~~~~
         |         pci_set_master
   cc1: some warnings being treated as errors


vim +32 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c

    27	
    28	static void etnaviv_gpu_pci_fini(struct etnaviv_gpu *gpu, bool component)
    29	{
    30		struct pci_dev *pdev = to_pci_dev(gpu->dev);
    31	
  > 32		pci_clear_master(pdev);
    33	
    34		dev_dbg(gpu->dev, "component is %s\n",
    35			component ? "enabled" : "disabled");
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
