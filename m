Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F8591D34
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 02:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6B311B9B2;
	Sun, 14 Aug 2022 00:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF8111A52F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 00:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660435301; x=1691971301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ki15VuR/ZcrHb6KOsI4Hb28mSfS0dHDolz9tJFyhME=;
 b=al7RiCGG/AvLuQv3TiyEsn00JGqkRAIXK3sL5ofbjrYh7Fp7PBhyzHsy
 oj9AxRHp4IohrAGXgb/gAmThgbbL99CKZZ49yLFGWlqE95E3y6W/GwFCY
 n1AhihXWUvIOXzxs88plXup5lWvoi156fjZGk6LRQIyadxsLtTaFvcVpJ
 w0v8/CNa9StWDXtRVHoIRs1YEhi38eHBOyJ6Jcj4nBckF+Lc+6bXvoGL3
 vZttM4kxBcukSGAvx2dE7sul93t4JELQHzGksheesEzb+g3uaFuRr3Q3L
 NPvTRIc11hsWiqtZ/kzWXaK0gmmFxOVueEY10RecnmA4qavGR1za1eUC4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="355792417"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="355792417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 17:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="851912119"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 13 Aug 2022 17:01:34 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oN14P-0002Cw-1K;
 Sun, 14 Aug 2022 00:01:33 +0000
Date: Sun, 14 Aug 2022 08:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] efi: earlycon: Add support for generic
 framebuffers and move to console subsystem
Message-ID: <202208140705.bU9i1c1t-lkp@intel.com>
References: <20220806163255.10404-4-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220806163255.10404-4-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Markuss,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on efi/next staging/staging-testing usb/usb-testing linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220807-003646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: loongarch-randconfig-s031-20220807 (https://download.01.org/0day-ci/archive/20220814/202208140705.bU9i1c1t-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/97dfc2aa69b065de769a191352afe2099c52fedb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-generic-framebuffer-support-to-EFI-earlycon-driver/20220807-003646
        git checkout 97dfc2aa69b065de769a191352afe2099c52fedb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/video/console/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/video/console/earlycon.c:43:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *static [toplevel] virt_base @@     got void * @@
   drivers/video/console/earlycon.c:43:24: sparse:     expected void [noderef] __iomem *static [toplevel] virt_base
   drivers/video/console/earlycon.c:43:24: sparse:     got void *
>> drivers/video/console/earlycon.c:53:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *static [toplevel] virt_base @@
   drivers/video/console/earlycon.c:53:30: sparse:     expected void *addr
   drivers/video/console/earlycon.c:53:30: sparse:     got void [noderef] __iomem *static [toplevel] virt_base
>> drivers/video/console/earlycon.c:63:39: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/video/console/earlycon.c:63:39: sparse:     expected void *
   drivers/video/console/earlycon.c:63:39: sparse:     got void [noderef] __iomem *
>> drivers/video/console/earlycon.c:74:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *addr @@
   drivers/video/console/earlycon.c:74:24: sparse:     expected void [noderef] __iomem *addr
   drivers/video/console/earlycon.c:74:24: sparse:     got void *addr

vim +43 drivers/video/console/earlycon.c

    29	
    30	static int __init simplefb_earlycon_remap_fb(void)
    31	{
    32		unsigned long mapping;
    33		/* bail if there is no bootconsole or it has been disabled already */
    34		if (!earlycon_console || !(earlycon_console->flags & CON_ENABLED))
    35			return 0;
    36	
    37		if (region_intersects(info.phys_base, info.size,
    38				      IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE) == REGION_INTERSECTS)		
    39			mapping = MEMREMAP_WB;
    40		else
    41			mapping = MEMREMAP_WC;
    42	
  > 43		info.virt_base = memremap(info.phys_base, info.size, mapping);
    44	
    45		return info.virt_base ? 0 : -ENOMEM;
    46	}
    47	early_initcall(simplefb_earlycon_remap_fb);
    48	
    49	static int __init simplefb_earlycon_unmap_fb(void)
    50	{
    51		/* unmap the bootconsole fb unless keep_bootcon has left it enabled */
    52		if (info.virt_base && !(earlycon_console->flags & CON_ENABLED))
  > 53			memunmap(info.virt_base);
    54		return 0;
    55	}
    56	late_initcall(simplefb_earlycon_unmap_fb);
    57	
    58	static __ref void *simplefb_earlycon_map(unsigned long start, unsigned long len)
    59	{
    60		pgprot_t fb_prot;
    61	
    62		if (info.virt_base)
  > 63			return info.virt_base + start;
    64	
    65		fb_prot = PAGE_KERNEL;
    66		return early_memremap_prot(info.phys_base + start, len, pgprot_val(fb_prot));
    67	}
    68	
    69	static __ref void simplefb_earlycon_unmap(void *addr, unsigned long len)
    70	{
    71		if (info.virt_base)
    72			return;
    73	
  > 74		early_memunmap(addr, len);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
