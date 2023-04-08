Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02316DBA1A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 12:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB81210E083;
	Sat,  8 Apr 2023 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A1810E083
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680950333; x=1712486333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tj/ggpYw50HfAyBFPq7ICd0Kc7tgKVtlkma/BblHx2Y=;
 b=fMteUlNDmv2Nw3G7d1z29TVFGCYd9nkcKlO/H1x12yPOjhxxrsWQcsqZ
 ZJtwifZjeIna+48tGVBvmXVGnUe+44oBAjo/q+014Bn6ONhJTyQwGbE6d
 n0TssVJzTwhEX4PCQ05EKCZK1dhUYzskFKGALKvuz9Mt792bY5tMj5P0i
 kcb9bQ3MCW1RgfYl7wiOCeNgsiDvH94cCh1jLmKwjw3CExcHGYJ9VFs0w
 54phoF2883NiGMiYpyRO0hoWnQUPVW0Pd+SU6pfFxPPWMbtxg0o3pKUFP
 qhe/uaKQr+R1wFsxUI9xfzFYIuWXaw+z8gnb2JEiFPzEwPwgI7pCaqQfD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344911162"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="344911162"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2023 03:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="665149579"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="665149579"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 08 Apr 2023 03:38:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pl5y0-000Tdf-0b;
 Sat, 08 Apr 2023 10:38:44 +0000
Date: Sat, 8 Apr 2023 18:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and
 parenthesis issue
Message-ID: <202304081830.7kKqUkLL-lkp@intel.com>
References: <20230408050323.70919-1-kartikey406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408050323.70919-1-kartikey406@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 Deepanshu Kartikey <kartikey406@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Deepanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/Staging-fbtft-fbtft-bus-fixed-extra-space-and-parenthesis-issue/20230408-130429
patch link:    https://lore.kernel.org/r/20230408050323.70919-1-kartikey406%40gmail.com
patch subject: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and parenthesis issue
config: i386-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081830.7kKqUkLL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a5c79ed6665465f3101e8251ca030a600cf1ea88
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepanshu-Kartikey/Staging-fbtft-fbtft-bus-fixed-extra-space-and-parenthesis-issue/20230408-130429
        git checkout a5c79ed6665465f3101e8251ca030a600cf1ea88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081830.7kKqUkLL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: too few arguments provided to function-like macro invocation
   define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
                                                       ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
   #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
           ^
>> drivers/staging/fbtft/fbtft-bus.c:65:1: error: unknown type name 'define_fbtft_write_reg'
   define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
   ^
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: too few arguments provided to function-like macro invocation
   define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
                                                           ^
   drivers/staging/fbtft/fbtft-bus.c:14:9: note: macro 'define_fbtft_write_reg' defined here
   #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
           ^
   drivers/staging/fbtft/fbtft-bus.c:67:1: error: unknown type name 'define_fbtft_write_reg'
   define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
   ^
>> drivers/staging/fbtft/fbtft-bus.c:86:3: error: non-void function 'fbtft_write_reg8_bus9' should return a value [-Wreturn-type]
                   return;
                   ^
   drivers/staging/fbtft/fbtft-bus.c:109:3: error: non-void function 'fbtft_write_reg8_bus9' should return a value [-Wreturn-type]
                   return;
                   ^
   6 errors generated.


vim +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
  > 67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
    68	
    69	void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
    70	{
    71		va_list args;
    72		int i, ret;
    73		int pad = 0;
    74		u16 *buf = (u16 *)par->buf;
    75	
    76		if (unlikely(par->debug & DEBUG_WRITE_REGISTER)) {
    77			va_start(args, len);
    78			for (i = 0; i < len; i++)
    79				*(((u8 *)buf) + i) = (u8)va_arg(args, unsigned int);
    80			va_end(args);
    81			fbtft_par_dbg_hex(DEBUG_WRITE_REGISTER, par,
    82					  par->info->device, u8, buf, len, "%s: ",
    83					  __func__);
    84		}
    85		if (len <= 0)
  > 86			return;
    87	
    88		if (par->spi && (par->spi->bits_per_word == 8)) {
    89			/* we're emulating 9-bit, pad start of buffer with no-ops
    90			 * (assuming here that zero is a no-op)
    91			 */
    92			pad = (len % 4) ? 4 - (len % 4) : 0;
    93			for (i = 0; i < pad; i++)
    94				*buf++ = 0x000;
    95		}
    96	
    97		va_start(args, len);
    98		*buf++ = (u8)va_arg(args, unsigned int);
    99		i = len - 1;
   100		while (i--) {
   101			*buf = (u8)va_arg(args, unsigned int);
   102			*buf++ |= 0x100; /* dc=1 */
   103		}
   104		va_end(args);
   105		ret = par->fbtftops.write(par, par->buf, (len + pad) * sizeof(u16));
   106		if (ret < 0) {
   107			dev_err(par->info->device,
   108				"write() failed and returned %d\n", ret);
   109			return;
   110		}
   111	}
   112	EXPORT_SYMBOL(fbtft_write_reg8_bus9);
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
