Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFF76C095
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 00:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029010E030;
	Tue,  1 Aug 2023 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C7210E030
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690930307; x=1722466307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0FABI0Hn1TGOigaqU5qUbB7MXUDhQ1YPzC/i8fOoHOQ=;
 b=cE2NtLM6o+pApLr45CeUDkeOlncbrliJ2mXKqTlkpG/qAb5yGPTWkeB2
 IMXe14+9nu9vXB7rOkH+XfVQbj+UNaFDXyDYWd5np2KMBdprYetozsGHw
 NMYvuIEkNOuVTkHoC73id3AggkPtZi3Ja1+WHwQuNtRPxID8YeQ68r/dE
 MHBrLYLfjxYQTPRV3YPJd7wkhgQd2uYyiHGwhAn0kj/GbxQzazWqB0Zno
 kU0zRGIEciRgpu26N2YySt7JuPoh3DpVpDX1cV9XZbo4+dA5KUKQBJMze
 0wOIA5nW4XYCidbtG/XoT7QkXQb3XHss/jammj6S3CponmpaR+YTKEIy+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="366896547"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="366896547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 15:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758508355"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="758508355"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 15:51:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qQyDQ-0000dt-0M;
 Tue, 01 Aug 2023 22:51:44 +0000
Date: Wed, 2 Aug 2023 06:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI/VGA: Fixup the firmware fb address om demanding time
Message-ID: <202308020634.9sXwtdN0-lkp@intel.com>
References: <20230801183706.702567-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801183706.702567-1-suijingfeng@loongson.cn>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/PCI-VGA-Fixup-the-firmware-fb-address-om-demanding-time/20230802-023743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230801183706.702567-1-suijingfeng%40loongson.cn
patch subject: [PATCH] PCI/VGA: Fixup the firmware fb address om demanding time
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308020634.9sXwtdN0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020634.9sXwtdN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020634.9sXwtdN0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/pci/vgaarb.c:17:
   drivers/pci/vgaarb.c: In function 'vga_arb_get_fb_range_from_tracker':
>> drivers/pci/vgaarb.c:13:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                                      ^~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pci/vgaarb.c:13:41: note: in expansion of macro 'dev_dbg'
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/vgaarb.c:131:17: note: in expansion of macro 'vgaarb_dbg'
     131 |                 vgaarb_dbg(&pdev->dev,
         |                 ^~~~~~~~~~
   drivers/pci/vgaarb.c:13:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                                      ^~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pci/vgaarb.c:13:41: note: in expansion of macro 'dev_dbg'
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/vgaarb.c:131:17: note: in expansion of macro 'vgaarb_dbg'
     131 |                 vgaarb_dbg(&pdev->dev,
         |                 ^~~~~~~~~~
   drivers/pci/vgaarb.c:13:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                                      ^~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pci/vgaarb.c:13:41: note: in expansion of macro 'dev_dbg'
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/vgaarb.c:131:17: note: in expansion of macro 'vgaarb_dbg'
     131 |                 vgaarb_dbg(&pdev->dev,
         |                 ^~~~~~~~~~
   drivers/pci/vgaarb.c:13:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                                      ^~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:271:9: note: in expansion of macro '_dynamic_func_call'
     271 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pci/vgaarb.c:13:41: note: in expansion of macro 'dev_dbg'
      13 | #define vgaarb_dbg(dev, fmt, arg...)    dev_dbg(dev, "vgaarb: " fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/vgaarb.c:131:17: note: in expansion of macro 'vgaarb_dbg'
     131 |                 vgaarb_dbg(&pdev->dev,
         |                 ^~~~~~~~~~


vim +13 drivers/pci/vgaarb.c

8b7e2e865fef94 drivers/gpu/vga/vgaarb.c Thierry Reding 2015-08-12  12  
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas  2016-11-17 @13  #define vgaarb_dbg(dev, fmt, arg...)	dev_dbg(dev, "vgaarb: " fmt, ##arg)
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas  2016-11-17  14  #define vgaarb_info(dev, fmt, arg...)	dev_info(dev, "vgaarb: " fmt, ##arg)
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas  2016-11-17  15  #define vgaarb_err(dev, fmt, arg...)	dev_err(dev, "vgaarb: " fmt, ##arg)
a75d68f62106fe drivers/gpu/vga/vgaarb.c Bjorn Helgaas  2016-11-17  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
