Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B466F298C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 18:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A910E03B;
	Sun, 30 Apr 2023 16:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7D10E03B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682873386; x=1714409386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/4lkaS66d7RfmGVcMxrZaN3B5HIVuHYecoGKid+YWlo=;
 b=K7bWVqp7L6mH+mSsWjKnoWDxmm4xXyTYmsFVCcCi+qYAgibYZjCXH4Oj
 gmFWJo6wWt2zjilqAZnIZl0CecD2Ez6wwZRF9MzGlb2ab1phVEwAG7nU4
 2jRkwA8EHqfA6eMi4i3LUfaflVadP7UfNbPR8utl7qbfUxnpo10z/DR7r
 sdsvlWNJvn6um0Rj9ycqCG5/tsb1vRr/+6JKNePRrQp487kS0EKYHif00
 B0t/94OsUvbnsc/QtF6MB625OmlRsEpl6CUlJrWWgO/29t9FOZEtvLFr7
 MW0wOPsqesHqYJSw5A/hPWTkS83fP3t64CI5ynKcLHi9bn+/K3UvqWOt6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="434351236"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="434351236"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2023 09:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695545916"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="695545916"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 09:49:41 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ptAF2-000033-0v;
 Sun, 30 Apr 2023 16:49:40 +0000
Date: Mon, 1 May 2023 00:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Message-ID: <202305010034.uh2F9KeO-lkp@intel.com>
References: <20230426172520.2004711-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426172520.2004711-1-AVKrasnov@sberdevices.ru>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, oe-kbuild-all@lists.linux.dev, kernel@sberdevices.ru,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arseniy,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Krasnov/mtd-rawnand-macronix-OTP-access-for-MX30LFxG18AC/20230427-013216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230426172520.2004711-1-AVKrasnov%40sberdevices.ru
patch subject: [PATCH v2] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
config: sparc-randconfig-c042-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010034.uh2F9KeO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/923eca7325935e1120923aeca0177cc0acc61475
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arseniy-Krasnov/mtd-rawnand-macronix-OTP-access-for-MX30LFxG18AC/20230427-013216
        git checkout 923eca7325935e1120923aeca0177cc0acc61475
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010034.uh2F9KeO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/sparc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/mtd/nand/raw/nand_macronix.c:9:
   drivers/mtd/nand/raw/nand_macronix.c: In function '__macronix_30lfxg18ac_rw_otp':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/mtd/nand/raw/nand_macronix.c:398:24: note: in expansion of macro 'do_div'
     398 |         offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
         |                        ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/preempt.h:11:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/mtd/nand/raw/nand_macronix.c:398:24: note: in expansion of macro 'do_div'
     398 |         offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
         |                        ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/mtd/nand/raw/nand_macronix.c:398:24: note: in expansion of macro 'do_div'
     398 |         offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
         |                        ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f415 Linus Torvalds     2005-04-16  215  
^1da177e4c3f415 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f415 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f415 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f415 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f415 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f415 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f415 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f86 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93f Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93f Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93f Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93f Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93f Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93f Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f86 Nicolas Pitre      2015-11-02 @234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f415 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f415 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f415 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190ef Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f415 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f415 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f415 Linus Torvalds     2005-04-16  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
