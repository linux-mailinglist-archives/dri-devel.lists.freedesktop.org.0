Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B26FC115
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 10:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21A10E34D;
	Tue,  9 May 2023 08:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF6810E349
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683619255; x=1715155255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M8ldeZ8wYKyjh5+JLiPdYoonZd0SIk7CsE32UJHMbgg=;
 b=fLRu1q297N4vOCwYwKiW+t5yqrOe/55kTZ+iVrZMMmgvvysSLTYT82Qx
 +te1RfJ7NzrcTkOcp53eId/QsG9gapjf4SnHne6FpIAa2nqC0faBzGBQ+
 OhR0hykXYE/7eBp/IQ1KgG/wxpvD86/ciWZjipJpLz/P/jBUnNg5OB/WS
 V/yu2APX2VTwq+LyabZ7Ij0gXd6uktffW099+IKfmA3qtMa9NjxWYserd
 AT+gQ8/RGH94thmPAK7ogWfARhh4G7gllNZ4ZF1RxfnB1Uu3ZGyPQ0onJ
 OL799tg8r7FwaZCthCkfhDND7F9PxXLfQJRSoOl5w4Qgl1DEfQYchdcHn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413102458"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="413102458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763719607"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="763719607"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 01:00:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pwIGs-0001xM-2i;
 Tue, 09 May 2023 08:00:30 +0000
Date: Tue, 9 May 2023 15:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@hansenpartnership.com,
 arnd@arndb.de, sam@ravnborg.org, suijingfeng@loongson.cn
Subject: Re: [PATCH v5 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Message-ID: <202305091533.3zBlgYkC-lkp@intel.com>
References: <20230508114830.28182-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508114830.28182-6-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to deller-parisc/for-next arnd-asm-generic/master linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230508-195052
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230508114830.28182-6-tzimmermann%40suse.de
patch subject: [PATCH v5 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
config: mips-randconfig-r016-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091533.3zBlgYkC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c64dc7f407b3faa85d4e81ec762407388c5813c1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230508-195052
        git checkout c64dc7f407b3faa85d4e81ec762407388c5813c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091533.3zBlgYkC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/cfbfillrect.c: In function 'bitfill_aligned':
>> drivers/video/fbdev/core/cfbfillrect.c:26:21: error: implicit declaration of function 'fb_writeq'; did you mean 'fb_writel'? [-Werror=implicit-function-declaration]
      26 | #  define FB_WRITEL fb_writeq
         |                     ^~~~~~~~~
   drivers/video/fbdev/core/cfbfillrect.c:50:17: note: in expansion of macro 'FB_WRITEL'
      50 |                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         |                 ^~~~~~~~~
>> drivers/video/fbdev/core/cfbfillrect.c:27:21: error: implicit declaration of function 'fb_readq'; did you mean 'fb_readl'? [-Werror=implicit-function-declaration]
      27 | #  define FB_READL  fb_readq
         |                     ^~~~~~~~
   drivers/video/fbdev/core/cfbfillrect.c:50:37: note: in expansion of macro 'FB_READL'
      50 |                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         |                                     ^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/video/fbdev/core/cfbcopyarea.c: In function 'bitcpy':
>> drivers/video/fbdev/core/cfbcopyarea.c:37:21: error: implicit declaration of function 'fb_writeq'; did you mean 'fb_writel'? [-Werror=implicit-function-declaration]
      37 | #  define FB_WRITEL fb_writeq
         |                     ^~~~~~~~~
   drivers/video/fbdev/core/cfbcopyarea.c:73:25: note: in expansion of macro 'FB_WRITEL'
      73 |                         FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
         |                         ^~~~~~~~~
>> drivers/video/fbdev/core/cfbcopyarea.c:38:21: error: implicit declaration of function 'fb_readq'; did you mean 'fb_readl'? [-Werror=implicit-function-declaration]
      38 | #  define FB_READL  fb_readq
         |                     ^~~~~~~~
   drivers/video/fbdev/core/cfbcopyarea.c:73:42: note: in expansion of macro 'FB_READL'
      73 |                         FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
         |                                          ^~~~~~~~
   cc1: some warnings being treated as errors


vim +26 drivers/video/fbdev/core/cfbfillrect.c

^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  21  
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  22  #if BITS_PER_LONG == 32
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  23  #  define FB_WRITEL fb_writel
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  24  #  define FB_READL  fb_readl
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  25  #else
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16 @26  #  define FB_WRITEL fb_writeq
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16 @27  #  define FB_READL  fb_readq
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  28  #endif
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  29  
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  30      /*
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  31       *  Aligned pattern fill using 32/64-bit memory accesses
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  32       */
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
