Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HbKtFsdviGn2pQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 12:13:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D11087F2
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 12:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEB210E127;
	Sun,  8 Feb 2026 11:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvsOheDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67D910E127
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770549186; x=1802085186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FE3dYNXudpBV/ACPrErZa0yy/tOkmFHyyhBheYU2aBQ=;
 b=RvsOheDOzEmWHvwrZJpx5WHaVEJD1AeINs7TFrxCJ5x40l5/m9fwyWVK
 D2YvSdH1i0ixav7QMUdBDp5KWpI/1DM8wsH1fJ95IR4xnL7EoQHQZmVDM
 BuQkzynUonT9CnCfk1L/vWaQY42nxAlirDeyHm9bDzSvB5N83tzPiPHV4
 /EW+dFwCXAmu9y1jW5KEswDB005MVqxSVlnwH/K0iEYjieZxuG+aEAZ1F
 +tsGLnfQcS4KwITej9I81qioEbPwnNwKmQKBASMneTiOTkDSRpUl16TVC
 HbCjHL6ElKtEEu6gUVDmVsJ4cJN5Ha56AMdrGq+f5AYIz6ut4lNUzj4PM w==;
X-CSE-ConnectionGUID: dnFrKoiaQ7KjN1miimjBhA==
X-CSE-MsgGUID: O9pzc7HOQRyP17qZnwAzFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71578654"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="71578654"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 03:13:05 -0800
X-CSE-ConnectionGUID: zEcqXVPfRsu9hInSSFicPQ==
X-CSE-MsgGUID: FHDl3XRcTKWqmb46znSZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; d="scan'208";a="210551946"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2026 03:13:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vp2ir-00000000m9Y-0aZ3;
 Sun, 08 Feb 2026 11:13:01 +0000
Date: Sun, 8 Feb 2026 19:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Chen Ni <nichen@iscas.ac.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602081811.HrSb1oUf-lkp@intel.com>
References: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig@baylibre.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmx.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 804D11087F2
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260208-011505
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/b894247689a7a920d9caa465dbcb840bca806cbf.1770483674.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v2 4/4] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: mips-randconfig-r123-20260208 (https://download.01.org/0day-ci/archive/20260208/202602081811.HrSb1oUf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081811.HrSb1oUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081811.HrSb1oUf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/video/fbdev/au1100fb.c:447:39: error: call to undeclared function 'KSEG1ADDR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     447 |         fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
         |                                              ^
>> drivers/video/fbdev/au1100fb.c:447:16: warning: cast to 'struct au1100fb_regs *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     447 |         fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/KSEG1ADDR +447 drivers/video/fbdev/au1100fb.c

^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  403  
48c68c4f1b5424 drivers/video/au1100fb.c       Greg Kroah-Hartman 2012-12-21  404  static int au1100fb_drv_probe(struct platform_device *dev)
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  405  {
46953e6aab262d drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  406  	struct au1100fb_device *fbdev;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  407  	struct resource *regs_res;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  408  	struct clk *c;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  409  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  410  	/* Allocate new device private */
db66f0252e2f17 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  411  	fbdev = devm_kzalloc(&dev->dev, sizeof(*fbdev), GFP_KERNEL);
29914badc59b23 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  412  	if (!fbdev)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  413  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  414  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  415  	if (au1100fb_setup(fbdev))
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  416  		goto failed;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  417  
7a192ec334cab9 drivers/video/au1100fb.c       Ming Lei           2009-02-06  418  	platform_set_drvdata(dev, (void *)fbdev);
67f30ad19c4b32 drivers/video/fbdev/au1100fb.c Christoph Hellwig  2019-04-28  419  	fbdev->dev = &dev->dev;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  420  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  421  	/* Allocate region for our registers and map them */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  422  	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  423  	if (!regs_res) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  424  		print_err("fail to retrieve registers resource");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  425  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  426  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  427  
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  428  	fbdev->info.fix = (struct fb_fix_screeninfo) {
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  429  		.mmio_start = regs_res->start,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  430  		.mmio_len = resource_size(regs_res),
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  431  		.id = "AU1100 FB",
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  432  		.xpanstep = 1,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  433  		.ypanstep = 1,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  434  		.type = FB_TYPE_PACKED_PIXELS,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  435  		.accel = FB_ACCEL_NONE,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  436  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  437  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  438  	if (!devm_request_mem_region(&dev->dev,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  439  				     fbdev->info.fix.mmio_start,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  440  				     fbdev->info.fix.mmio_len,
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  441  				     DRIVER_NAME)) {
c05b7f3d12b945 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-30  442  		print_err("fail to lock memory region at 0x%08lx",
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  443  			  fbdev->info.fix.mmio_start);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  444  		return -EBUSY;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  445  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  446  
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07 @447  	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  448  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  449  	print_dbg("Register memory map at %p", fbdev->regs);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  450  	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  451  
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  452  	c = clk_get(NULL, "lcd_intclk");
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  453  	if (!IS_ERR(c)) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  454  		fbdev->lcdclk = c;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  455  		clk_set_rate(c, 48000000);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  456  		clk_prepare_enable(c);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  457  	}
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  458  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  459  	/* Allocate the framebuffer to the maximum screen size * nbr of video buffers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  460  	fbdev->fb_len = fbdev->panel->xres * fbdev->panel->yres *
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  461  		  	(fbdev->panel->bpp >> 3) * AU1100FB_NBR_VIDEO_BUFFERS;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  462  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  463  	fbdev->fb_mem = dmam_alloc_coherent(&dev->dev,
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  464  					    PAGE_ALIGN(fbdev->fb_len),
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  465  					    &fbdev->fb_phys, GFP_KERNEL);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  466  	if (!fbdev->fb_mem) {
4bad214934b5f7 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  467  		print_err("fail to allocate framebuffer (size: %zuK))",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  468  			  fbdev->fb_len / 1024);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  469  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  470  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  471  
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  472  	fbdev->info.fix.smem_start = fbdev->fb_phys;
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  473  	fbdev->info.fix.smem_len = fbdev->fb_len;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  474  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  475  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  476  	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  477  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  478  	/* load the panel info into the var struct */
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  479  	fbdev->info.var = (struct fb_var_screeninfo) {
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  480  		.activate = FB_ACTIVATE_NOW,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  481  		.height = -1,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  482  		.width = -1,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  483  		.vmode = FB_VMODE_NONINTERLACED,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  484  		.bits_per_pixel = fbdev->panel->bpp,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  485  		.xres = fbdev->panel->xres,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  486  		.xres_virtual = fbdev->panel->xres,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  487  		.yres = fbdev->panel->yres,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  488  		.yres_virtual = fbdev->panel->yres,
fe1835daa1ae0e drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-07  489  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  490  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  491  	fbdev->info.screen_base = fbdev->fb_mem;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  492  	fbdev->info.fbops = &au1100fb_ops;
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
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  505  	/* Set h/w registers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  506  	au1100fb_setmode(fbdev);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  507  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  508  	/* Register new framebuffer */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  509  	if (register_framebuffer(&fbdev->info) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  510  		print_err("cannot register new framebuffer");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  511  		goto failed;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  512  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  513  
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  514  	return 0;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  515  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  516  failed:
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  517  	if (fbdev->lcdclk) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  518  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  519  		clk_put(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  520  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  521  	if (fbdev->info.cmap.len != 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  522  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  523  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  524  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  525  	return -ENODEV;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  526  }
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  527  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
