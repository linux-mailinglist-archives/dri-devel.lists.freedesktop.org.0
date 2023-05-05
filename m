Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3CA6F809D
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 12:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D3210E207;
	Fri,  5 May 2023 10:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E574310E1F9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683281539; x=1714817539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+Tsbdo5pjmj5u3W5R6dLVr9eBlkJdAaspJjhiqP2evg=;
 b=ZQv8woXruDCNEHKg3uh0QtzTgQu+IfLqSRyUKYomZnhMYNbR6ABHiAnA
 XSmYV3C7hLIXAOmA8wiK2ruJbdbkBeTLdsxRv+ujLNV1OFPKaVAhKbUkp
 Ixib5gaxK/fcpYfhsY8Xq3XhaIvEfLFSJL2BXGIo5UVsUOKmugw4BOcEO
 h5OzWipEaWMxPao6i/GvchfJ4UcVrj1zRplcvCkqGV3CqOI9xtwztdaVE
 TG1XTKE5/LM2bLLquLl2mpbQY0RBoGKbduBZ9na7jNpg1e2LWy4Zv4dUI
 qVJYjTFZ4KmzBXaoQnUSSznRTuq11ohQbBRxHOFD10YSq3c4lWLVWKTZ6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="412404978"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="412404978"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 03:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="697503684"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="697503684"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2023 03:12:12 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pusQ7-0000Ut-2G;
 Fri, 05 May 2023 10:12:11 +0000
Date: Fri, 5 May 2023 18:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Helge Deller <deller@gmx.de>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/3] Input: ads7846 - Convert to use software nodes
Message-ID: <202305051758.yjd7CtkI-lkp@intel.com>
References: <20230430-nokia770-regression-v2-1-984ed3ca5444@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v2-1-984ed3ca5444@linaro.org>
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
Cc: linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 348551ddaf311c76b01cdcbaf61b6fef06a49144]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/Input-ads7846-Convert-to-use-software-nodes/20230505-162601
base:   348551ddaf311c76b01cdcbaf61b6fef06a49144
patch link:    https://lore.kernel.org/r/20230430-nokia770-regression-v2-1-984ed3ca5444%40linaro.org
patch subject: [PATCH v2 1/3] Input: ads7846 - Convert to use software nodes
config: hexagon-randconfig-r041-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051758.yjd7CtkI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9708c9277cc820e52916ddf795926d3254bb5eed
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/Input-ads7846-Convert-to-use-software-nodes/20230505-162601
        git checkout 9708c9277cc820e52916ddf795926d3254bb5eed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051758.yjd7CtkI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/ads7846.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/input/touchscreen/ads7846.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/input/touchscreen/ads7846.c:24:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/input/touchscreen/ads7846.c:1406:21: error: use of undeclared identifier 'ads7846_dt_ids'
                   .of_match_table = ads7846_dt_ids,
                                     ^
   6 warnings and 1 error generated.


vim +/ads7846_dt_ids +1406 drivers/input/touchscreen/ads7846.c

  1401	
  1402	static struct spi_driver ads7846_driver = {
  1403		.driver = {
  1404			.name	= "ads7846",
  1405			.pm	= pm_sleep_ptr(&ads7846_pm),
> 1406			.of_match_table = ads7846_dt_ids,
  1407		},
  1408		.probe		= ads7846_probe,
  1409		.remove		= ads7846_remove,
  1410	};
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
