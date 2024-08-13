Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B0950F68
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 23:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E7D10E3F4;
	Tue, 13 Aug 2024 21:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTzDV2HV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BB110E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723586385; x=1755122385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=smDF0r7mvpJmOBP+6nWfU55YrbMwWFuJ1tY+3DSe/84=;
 b=OTzDV2HVSTO2whPte56+giQGwD1h/hgmVgxI/fKJstJiPP6io4HUMW9t
 OMIozs27suRESi8dQ7kezHKU/XLqR6Pns055+WHQXz2ffNYeMIk4N8coR
 JxfQ2y2VJIQa+AJd7XSCY43JE+JGGtECcj5bjZpu8vzHTDHt4HvWC5twR
 BGIssDDgqutuqPI9KS+QdinGrN9XKEJgdyyK3opc+qYS9vyOv5CwBLXnf
 wI15YRP8gLZyZdGkmvLV35fWImhMAVblQIicRr87Aa4B5USeVEe7RaFga
 oJRCwIYGbk2hXZeiJhesFcFsDSdyJNTO96pQnj2EjLrMO6V1vh28PzjFs w==;
X-CSE-ConnectionGUID: VgNutfNgRaOz/LZ//dWxrA==
X-CSE-MsgGUID: R9ibCcHGQc2GM7BqT/tuhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33185789"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="33185789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 14:59:45 -0700
X-CSE-ConnectionGUID: czxnPOqVQaaAwqDB554ucw==
X-CSE-MsgGUID: ho2IFztlTnWPog2fiZlSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="58737265"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 14:59:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sdzYH-0000kA-2n;
 Tue, 13 Aug 2024 21:59:37 +0000
Date: Wed, 14 Aug 2024 05:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, esben@geanix.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408140515.pbHkvxZD-lkp@intel.com>
References: <20240812030045.20831-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812030045.20831-3-hpchen0nvt@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hui-Ping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.11-rc3 next-20240813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240812-110259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240812030045.20831-3-hpchen0nvt%40gmail.com
patch subject: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: arc-randconfig-r133-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140515.pbHkvxZD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:119:3: sparse: sparse: symbol 'E_BCHALGORITHM' was not declared. Should it be static?
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:333:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:348:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:760:18: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *

vim +/E_BCHALGORITHM +119 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   111	
   112	/* BCH algorithm related constants and variables */
   113	enum {
   114		eBCH_NONE = 0,
   115		eBCH_T8,
   116		eBCH_T12,
   117		eBCH_T24,
   118		eBCH_CNT
 > 119	} E_BCHALGORITHM;
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
