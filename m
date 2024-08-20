Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5C957CDB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 07:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E577010E10D;
	Tue, 20 Aug 2024 05:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgCbmbW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E9E10E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 05:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724132903; x=1755668903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kioHVavi4eJx3pXSFgQY5R+2SmG3W8PhoaqTGAwxUVc=;
 b=TgCbmbW3+Va66kKSOoBj2JzWlldUXENeY2d3Q5TLzHvym5ibSZNSQ7fl
 GScnIjUfIKB8EfcpYw3NhcoHXMSyFkUOCQF8lg0O8nF9tThh8MIbDHZOn
 0CcHXOY+AuACsJZWjcTGsIwpbFOv63BYMuuhkjsKeS/LvwywswsLvrNs1
 NkILeQpzn9cGuduJ/KvrhPlE5om0ydDFqWmnj8uc372O4AGiz+RKa05/d
 xbrq+HjFS9xE/os3k5AT0Xsd0rtf5HYp2V0ktK8CurCFKR9CHlmEbUxaz
 SX7+d25NDpzQB+FXMKa7JgZ3VtmmywNLTv/pm4JKAeDMxDVMgiy7CRcY6 g==;
X-CSE-ConnectionGUID: hVA6CbxDTOucIi93oeqSMQ==
X-CSE-MsgGUID: WeWUzIHQSKWmOWX8MpX9MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26162707"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26162707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 22:48:23 -0700
X-CSE-ConnectionGUID: PgarJjMXQLS1/fA8vVZ+Dg==
X-CSE-MsgGUID: ZOASBjw8SIibnKhxYvaaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60759314"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2024 22:48:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sgHj5-0009lq-2t;
 Tue, 20 Aug 2024 05:48:15 +0000
Date: Tue, 20 Aug 2024 13:47:27 +0800
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
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408201329.v0SoF3eS-lkp@intel.com>
References: <20240819092037.110260-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-3-hpchen0nvt@gmail.com>
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
[also build test WARNING on linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240819-172155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240819092037.110260-3-hpchen0nvt%40gmail.com
patch subject: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: parisc-randconfig-r123-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201329.v0SoF3eS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240820/202408201329.v0SoF3eS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201329.v0SoF3eS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:231:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse:     got unsigned char [noderef] [usertype] __iomem *
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got char [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse:     got char [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got char [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse:     got char [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *

vim +736 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   731	
   732	static int ma35_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
   733					      int oob_required, int page)
   734	{
   735		struct ma35_nand_info *nand = nand_get_controller_data(chip);
 > 736		u8 *ptr = (u8 __iomem *)(nand->regs + MA35_NFI_REG_NANDRA0);
   737		struct mtd_info *mtd = nand_to_mtd(chip);
   738		u8 *ecc_calc = chip->ecc.calc_buf;
   739	
   740		memset((void *)ptr, 0xFF, mtd->oobsize);
   741		memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize - chip->ecc.total);
   742	
   743		ma35_nand_command(chip, NAND_CMD_SEQIN, 0, page);
   744		ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x1);
   745		ma35_nand_command(chip, NAND_CMD_PAGEPROG, -1, -1);
   746		ma35_waitfunc(chip);
   747	
   748		/* Copy parity code in NANDRA to calc */
   749		memcpy((void *)ecc_calc,
   750			(void *)(ptr + (mtd->oobsize - chip->ecc.total)),
   751			chip->ecc.total);
   752	
   753		/* Copy parity code in calc to oob_poi */
   754		memcpy((void *)(chip->oob_poi + (mtd->oobsize - chip->ecc.total)),
   755			(void *)ecc_calc, chip->ecc.total);
   756	
   757		return 0;
   758	}
   759	
   760	static int ma35_nand_read_page_hwecc_oob_first(struct nand_chip *chip, u8 *buf,
   761							int oob_required, int page)
   762	{
   763		struct ma35_nand_info *nand = nand_get_controller_data(chip);
 > 764		char *ptr = (char __iomem *)(nand->regs + MA35_NFI_REG_NANDRA0);
   765		struct mtd_info *mtd = nand_to_mtd(chip);
   766	
   767		/* 1. read the OOB area  */
   768		ma35_nand_command(chip, NAND_CMD_READOOB, 0, page);
   769		ma35_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
   770	
   771		/* 2. copy OOB data to NANDRA for page read */
   772		memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize);
   773	
   774		if ((*(ptr+2) != 0) && (*(ptr+3) != 0))
   775			memset((void *)buf, 0xff, mtd->writesize);
   776		else {
   777			/* 3. read data from nand */
   778			ma35_nand_command(chip, NAND_CMD_READ0, 0, page);
   779			ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x0);
   780	
   781			/* 4. restore OOB data from SMRA */
   782			memcpy((void *)chip->oob_poi, (void *)ptr, mtd->oobsize);
   783		}
   784	
   785		return 0;
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
