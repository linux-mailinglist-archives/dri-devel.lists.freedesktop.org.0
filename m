Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5D6DB930
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 08:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8D110E0CA;
	Sat,  8 Apr 2023 06:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0591910E0CA
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 06:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680935018; x=1712471018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ffIcKF6JLzI/Q34ihMZs5pPTke+VOLtLE4gbl3XwRis=;
 b=Qco2ED6CWXwY2nDP1R34y+2sx83I/vjwXQgPc5yd4gojP7XZhAWMUy//
 rO1q3POT2FscL+N/btPKuBDCIgmRZG1R8LiA8xCjp8nCBdXaoj6OBof24
 9rgxPj3yEgdC2XnSyWVIg9ivweyWdoYP0Df/Fl/iTe9wHXYGGi5GCzzjV
 Uo28rkB7IvNX7xVvcuFb3zis3YjEPIfL+cXAsb2E5q25q9kPgXvqweD+d
 +XdwUVr9eYOPQOgV4VQrB8OIbvmTRFmts657SEH3C7ayys0JRGdmY0hD8
 GwKgdPdpwmH4MBhSJJafcaEAA/2mUymZN1RrNX35NI0IM/bV+SAVV0okL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405942101"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="405942101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 23:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="831384611"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="831384611"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 23:23:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pl1z4-000TPp-0w;
 Sat, 08 Apr 2023 06:23:34 +0000
Date: Sat, 8 Apr 2023 14:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and
 parenthesis issue
Message-ID: <202304081417.MgYKE9jj-lkp@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Deepanshu Kartikey <kartikey406@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Deepanshu,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/Staging-fbtft-fbtft-bus-fixed-extra-space-and-parenthesis-issue/20230408-130429
patch link:    https://lore.kernel.org/r/20230408050323.70919-1-kartikey406%40gmail.com
patch subject: [PATCH] Staging: fbtft: fbtft-bus: fixed extra space and parenthesis issue
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304081417.MgYKE9jj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a5c79ed6665465f3101e8251ca030a600cf1ea88
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepanshu-Kartikey/Staging-fbtft-fbtft-bus-fixed-extra-space-and-parenthesis-issue/20230408-130429
        git checkout a5c79ed6665465f3101e8251ca030a600cf1ea88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081417.MgYKE9jj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-bus.c:65:53: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                                                     ^
   drivers/staging/fbtft/fbtft-bus.c:14: note: macro "define_fbtft_write_reg" defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         | 
>> drivers/staging/fbtft/fbtft-bus.c:65:23: error: expected ';' before 'void'
      65 | define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
         |                       ^
         |                       ;
   drivers/staging/fbtft/fbtft-bus.c:67:57: error: macro "define_fbtft_write_reg" requires 4 arguments, but only 3 given
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
         |                                                         ^
   drivers/staging/fbtft/fbtft-bus.c:14: note: macro "define_fbtft_write_reg" defined here
      14 | #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
         | 
   drivers/staging/fbtft/fbtft-bus.c:67:23: error: expected ';' before 'void'
      67 | define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
         |                       ^
         |                       ;
      68 | 
      69 | void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
         | ~~~~                   


vim +/define_fbtft_write_reg +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
