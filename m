Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BltCUpUg2mJlQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:14:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65536E6E95
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634BD10E651;
	Wed,  4 Feb 2026 14:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NerKYCeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45910E651
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214469; x=1801750469;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vNG6ARJZgbFZvKIMXWp25KFOFGI5Gomnhn0D1Aq+Bms=;
 b=NerKYCeTBGSFu4osev8ypRHX6f/amAjwNFY+gjy1YMAmiwwwAJI1cuPs
 NTbxTavauMeYMoh3I/FgW2YS5pgBn4eINgZHvK7aNRicJxg9fGlb54QlU
 PvPrAQqwyX0WitlP5ebu/y0+BB2Ru2x27o6AaznwCNFA/QYHEbVzr2O+L
 p617JBAVNS3Xwsmh8Y1RfRVe6U9561EXt2uf5REuVt3xeP68JLssiZS79
 gOEu3piq8F1iP+IOeczW4KzAWcH1ilzof5230en8rubKNiaPJwMI7WHPv
 9ZFDD7kcHnsucIn7+xkP50aO1JYta1VhFfA6baSEVQy35n0hspKWQQ7Kq w==;
X-CSE-ConnectionGUID: R3e+MOipS9eJbLG2yNermA==
X-CSE-MsgGUID: tOcxRreHSYaOMOjPsErXUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75252195"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75252195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:14:29 -0800
X-CSE-ConnectionGUID: TjrIJITCRLyB58L6mPSOHQ==
X-CSE-MsgGUID: cdPnF5UoSFOIW22jxtp4Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214348983"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 04 Feb 2026 06:14:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vndeC-00000000htA-1VOo;
 Wed, 04 Feb 2026 14:14:24 +0000
Date: Wed, 4 Feb 2026 22:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602042233.GXk79AnA-lkp@intel.com>
References: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 65536E6E95
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Mark-several-local-functions-as-static/20260204-171704
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260204/202602042233.GXk79AnA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042233.GXk79AnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042233.GXk79AnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:473:6: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     472 |                 print_err("fail to allocate framebuffer (size: %dK))",
         |                                                                ~~
         |                                                                %zu
     473 |                           fbdev->fb_len / 1024);
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/au1100fb.h:33:74: note: expanded from macro 'print_err'
      33 | #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
         |                                                               ~          ^~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +473 drivers/video/fbdev/au1100fb.c

^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  415  
48c68c4f1b5424 drivers/video/au1100fb.c       Greg Kroah-Hartman 2012-12-21  416  static int au1100fb_drv_probe(struct platform_device *dev)
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  417  {
46953e6aab262d drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  418  	struct au1100fb_device *fbdev;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  419  	struct resource *regs_res;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  420  	struct clk *c;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  421  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  422  	/* Allocate new device private */
db66f0252e2f17 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  423  	fbdev = devm_kzalloc(&dev->dev, sizeof(*fbdev), GFP_KERNEL);
29914badc59b23 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  424  	if (!fbdev)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  425  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  426  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  427  	if (au1100fb_setup(fbdev))
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  428  		goto failed;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  429  
7a192ec334cab9 drivers/video/au1100fb.c       Ming Lei           2009-02-06  430  	platform_set_drvdata(dev, (void *)fbdev);
67f30ad19c4b32 drivers/video/fbdev/au1100fb.c Christoph Hellwig  2019-04-28  431  	fbdev->dev = &dev->dev;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  432  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  433  	/* Allocate region for our registers and map them */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  434  	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  435  	if (!regs_res) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  436  		print_err("fail to retrieve registers resource");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  437  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  438  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  439  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  440  	au1100fb_fix.mmio_start = regs_res->start;
28f65c11f2ffb3 drivers/video/au1100fb.c       Joe Perches        2011-06-09  441  	au1100fb_fix.mmio_len = resource_size(regs_res);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  442  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  443  	if (!devm_request_mem_region(&dev->dev,
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  444  				     au1100fb_fix.mmio_start,
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  445  				     au1100fb_fix.mmio_len,
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  446  				     DRIVER_NAME)) {
c05b7f3d12b945 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-30  447  		print_err("fail to lock memory region at 0x%08lx",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  448  				au1100fb_fix.mmio_start);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  449  		return -EBUSY;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  450  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  451  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  452  	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(au1100fb_fix.mmio_start);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  453  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  454  	print_dbg("Register memory map at %p", fbdev->regs);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  455  	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  456  
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  457  	c = clk_get(NULL, "lcd_intclk");
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  458  	if (!IS_ERR(c)) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  459  		fbdev->lcdclk = c;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  460  		clk_set_rate(c, 48000000);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  461  		clk_prepare_enable(c);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  462  	}
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  463  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  464  	/* Allocate the framebuffer to the maximum screen size * nbr of video buffers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  465  	fbdev->fb_len = fbdev->panel->xres * fbdev->panel->yres *
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  466  		  	(fbdev->panel->bpp >> 3) * AU1100FB_NBR_VIDEO_BUFFERS;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  467  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  468  	fbdev->fb_mem = dmam_alloc_coherent(&dev->dev,
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  469  					    PAGE_ALIGN(fbdev->fb_len),
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  470  					    &fbdev->fb_phys, GFP_KERNEL);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  471  	if (!fbdev->fb_mem) {
3879490f3a9765 drivers/video/fbdev/au1100fb.c Colin Ian King     2018-05-15  472  		print_err("fail to allocate framebuffer (size: %dK))",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @473  			  fbdev->fb_len / 1024);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  474  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  475  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  476  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  477  	au1100fb_fix.smem_start = fbdev->fb_phys;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  478  	au1100fb_fix.smem_len = fbdev->fb_len;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  479  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  480  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  481  	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  482  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  483  	/* load the panel info into the var struct */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  484  	au1100fb_var.bits_per_pixel = fbdev->panel->bpp;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  485  	au1100fb_var.xres = fbdev->panel->xres;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  486  	au1100fb_var.xres_virtual = au1100fb_var.xres;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  487  	au1100fb_var.yres = fbdev->panel->yres;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  488  	au1100fb_var.yres_virtual = au1100fb_var.yres;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  489  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  490  	fbdev->info.screen_base = fbdev->fb_mem;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  491  	fbdev->info.fbops = &au1100fb_ops;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  492  	fbdev->info.fix = au1100fb_fix;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  493  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  494  	fbdev->info.pseudo_palette =
a86854d0c599b3 drivers/video/fbdev/au1100fb.c Kees Cook          2018-06-12  495  		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  496  	if (!fbdev->info.pseudo_palette)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  497  		return -ENOMEM;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  498  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  499  	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  500  		print_err("Fail to allocate colormap (%d entries)",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  501  			   AU1100_LCD_NBR_PALETTE_ENTRIES);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  502  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  503  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  504  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  505  	fbdev->info.var = au1100fb_var;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  506  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  507  	/* Set h/w registers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  508  	au1100fb_setmode(fbdev);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  509  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  510  	/* Register new framebuffer */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  511  	if (register_framebuffer(&fbdev->info) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  512  		print_err("cannot register new framebuffer");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  513  		goto failed;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  514  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  515  
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  516  	return 0;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  517  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  518  failed:
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  519  	if (fbdev->lcdclk) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  520  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  521  		clk_put(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  522  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  523  	if (fbdev->info.cmap.len != 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  524  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  525  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  526  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  527  	return -ENODEV;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  528  }
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  529  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
