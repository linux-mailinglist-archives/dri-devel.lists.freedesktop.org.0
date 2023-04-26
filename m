Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D546EF508
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 15:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8AA10E990;
	Wed, 26 Apr 2023 13:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6E310E990
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682514398; x=1714050398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oVxuTR4A/wrlt9G6C/zKK3j09fIf1TBLj219Iy+IWg4=;
 b=cZ1CJFmmJ8Tt1hKvS6cEQc1IySVLcvIP8wh6e41qv/0X4X/pgeThcTz3
 cAl+qwWKE4AuVCW8PPHQVhgfRKMZqSZeACKslaB4RN8Z5x64l7dso3zoQ
 r7rv6ov9YiWvOP0SDb3QF34n1Zs8xnF9Tq5pcZBo1Pf8EMGhMb6EoEIyZ
 h6mufUH3JtMTZu/lpkxZFxaXLA1M0VIrILq4ZIk081Em7rzgVdxbSoJna
 23x+i1Z3yNpjc9r2CNmQrsdnEbkAfddTQ3kVD3hV8nCu/ycfYIdH6vQmR
 cMXTumocwcVs/+eIl800bI7Zo0Gg6d/da+fv1kDmcUalWcW+h+T2uKfz3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="349033784"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="349033784"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 06:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="783323577"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="783323577"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2023 06:06:33 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1preqv-0000AU-0U;
 Wed, 26 Apr 2023 13:06:33 +0000
Date: Wed, 26 Apr 2023 21:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v1] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Message-ID: <202304262003.Lzpyh2BA-lkp@intel.com>
References: <20230426072455.3887717-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426072455.3887717-1-AVKrasnov@sberdevices.ru>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-mtd@lists.infradead.org, oxffffaa@gmail.com,
 oe-kbuild-all@lists.linux.dev, kernel@sberdevices.ru,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arseniy,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v6.3 next-20230425]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Krasnov/mtd-rawnand-macronix-OTP-access-for-MX30LFxG18AC/20230426-153143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230426072455.3887717-1-AVKrasnov%40sberdevices.ru
patch subject: [PATCH v1] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
config: i386-randconfig-a001-20230424 (https://download.01.org/0day-ci/archive/20230426/202304262003.Lzpyh2BA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3529f3465e99379489b59c035a8a0506c3756ef4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arseniy-Krasnov/mtd-rawnand-macronix-OTP-access-for-MX30LFxG18AC/20230426-153143
        git checkout 3529f3465e99379489b59c035a8a0506c3756ef4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304262003.Lzpyh2BA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/nand_macronix.c:384:12: error: implicit declaration of function 'kmalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
                     ^
   drivers/mtd/nand/raw/nand_macronix.c:384:12: note: did you mean 'mm_alloc'?
   include/linux/sched/mm.h:16:26: note: 'mm_alloc' declared here
   extern struct mm_struct *mm_alloc(void);
                            ^
>> drivers/mtd/nand/raw/nand_macronix.c:384:10: warning: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/nand_macronix.c:437:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(dma_buf);
           ^
   1 warning and 2 errors generated.


vim +/kmalloc +384 drivers/mtd/nand/raw/nand_macronix.c

   366	
   367	static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
   368						loff_t offs_in_flash,
   369						size_t len, size_t *retlen,
   370						u_char *buf, bool write)
   371	{
   372		struct nand_chip *nand;
   373		size_t bytes_handled;
   374		unsigned long page;
   375		off_t offs_in_page;
   376		void *dma_buf;
   377		int ret;
   378	
   379		/* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
   380		 * so allocate properly aligned memory for it. This is
   381		 * needed because cross page accesses may lead to unaligned
   382		 * buffer address for DMA.
   383		 */
 > 384		dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
   385		if (!dma_buf)
   386			return -ENOMEM;
   387	
   388		nand = mtd_to_nand(mtd);
   389		nand_select_target(nand, 0);
   390	
   391		ret = macronix_30lfxg18ac_otp_enable(nand);
   392		if (ret)
   393			goto out_otp;
   394	
   395		page = offs_in_flash;
   396		/* 'page' will be result of division. */
   397		offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
   398		bytes_handled = 0;
   399	
   400		while (bytes_handled < len &&
   401		       page < MACRONIX_30LFXG18AC_OTP_PAGES) {
   402			size_t bytes_to_handle;
   403	
   404			bytes_to_handle = min_t(size_t, len - bytes_handled,
   405						MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
   406						offs_in_page);
   407	
   408			if (write) {
   409				memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
   410				ret = nand_prog_page_op(nand, page, offs_in_page,
   411							dma_buf, bytes_to_handle);
   412			} else {
   413				ret = nand_read_page_op(nand, page, offs_in_page,
   414							dma_buf, bytes_to_handle);
   415				if (!ret)
   416					memcpy(&buf[bytes_handled], dma_buf,
   417					       bytes_to_handle);
   418			}
   419			if (ret)
   420				goto out_otp;
   421	
   422			bytes_handled += bytes_to_handle;
   423			offs_in_page = 0;
   424			page++;
   425		}
   426	
   427		*retlen = bytes_handled;
   428	
   429	out_otp:
   430		if (ret)
   431			dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
   432	
   433		ret = macronix_30lfxg18ac_otp_disable(nand);
   434		WARN(ret, "failed to leave OTP mode after %s\n",
   435		     write ? "write" : "read");
   436		nand_deselect_target(nand);
 > 437		kfree(dma_buf);
   438	
   439		return ret;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
