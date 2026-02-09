Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIi4JxSmiWk0AQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:17:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6510D6E3
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 10:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276110E357;
	Mon,  9 Feb 2026 09:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7duD4wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34E310E134
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770628625; x=1802164625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CAIyTwPLvJ/09ecTZ0sMoQQz882KcFGCIu2kE1d7mJk=;
 b=B7duD4wfoLvGafD8JVWAq09Z0rtSD4EO9A0n49Qil3/vLY3dpigpcNbE
 bWJvxQm65L/7vixOMZlmoVuWtAzMOOlsffxU07fDiugncBP6zn1X8K7qt
 C1S/jwK1ztWkv00M/Iwpr+Z72gQsMEd6qEFMH/3obPzdohs/D1fJUJj8n
 eOQF4qYgyTv8fpaA1gAJw84E2YJgVIwryTLWUlAoHCp08OB7yT4Omb8Z4
 QQHt4CfmaqWWiHqOwmxP61dxGt6L5ipsLYpq40iH556BKafMuPMgQn+EW
 /v4rZdaW3px2Wkc0+goNHWwpwtefUPEdQT64/wQeRs033C0fqcdMYSJig A==;
X-CSE-ConnectionGUID: IidLqZwuTESOBdryAwL4vg==
X-CSE-MsgGUID: P49s8c5hTMaHgQsyL0mqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="83178853"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="83178853"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 01:17:05 -0800
X-CSE-ConnectionGUID: FQw8uyxkTSOaFT6z5zVpFg==
X-CSE-MsgGUID: dOtjPHVSTS6Js1utt0icRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211594182"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 01:17:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vpNO7-00000000mrQ-2vGM;
 Mon, 09 Feb 2026 09:16:59 +0000
Date: Mon, 9 Feb 2026 17:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Chen Ni <nichen@iscas.ac.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on
 non-mips platforms
Message-ID: <202602091743.HcmQ4SB4-lkp@intel.com>
References: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:deller@gmx.de,m:oe-kbuild-all@lists.linux.dev,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 05E6510D6E3
X-Rspamd-Action: no action

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0636e6205beed850d985276dc56fd73d785bea5c]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260209-015956
base:   0636e6205beed850d985276dc56fd73d785bea5c
patch link:    https://lore.kernel.org/r/67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: um-randconfig-r072-20260209 (https://download.01.org/0day-ci/archive/20260209/202602091743.HcmQ4SB4-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091743.HcmQ4SB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091743.HcmQ4SB4-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_setup':
>> drivers/video/fbdev/au1100fb.c:371:(.text+0x1ff): undefined reference to `fb_get_options'
   /usr/bin/ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_drv_probe':
>> drivers/video/fbdev/au1100fb.c:499:(.text+0xa7e): undefined reference to `fb_alloc_cmap'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.c:509:(.text+0xac2): undefined reference to `register_framebuffer'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.c:522:(.text+0xb3e): undefined reference to `fb_dealloc_cmap'
   /usr/bin/ld: drivers/video/fbdev/au1100fb.o: in function `au1100fb_drv_remove':
>> drivers/video/fbdev/au1100fb.c:540:(.text+0xb73): undefined reference to `unregister_framebuffer'
   /usr/bin/ld: drivers/video/fbdev/au1100fb.c:542:(.text+0xb86): undefined reference to `fb_dealloc_cmap'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x18): undefined reference to `fb_io_read'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x20): undefined reference to `fb_io_write'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x58): undefined reference to `cfb_fillrect'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x60): undefined reference to `cfb_copyarea'
>> /usr/bin/ld: drivers/video/fbdev/au1100fb.o:(.rodata+0x68): undefined reference to `cfb_imageblit'
   collect2: error: ld returned 1 exit status


vim +371 drivers/video/fbdev/au1100fb.c

^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  360  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  361  static int au1100fb_setup(struct au1100fb_device *fbdev)
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  362  {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  363  	char *this_opt, *options;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  364  	int num_panels = ARRAY_SIZE(known_lcd_panels);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  365  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  366  	if (num_panels <= 0) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  367  		print_err("No LCD panels supported by driver!");
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  368  		return -ENODEV;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  369  	}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  370  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30 @371  	if (fb_get_options(DRIVER_NAME, &options))
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  372  		return -ENODEV;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  373  	if (!options)
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  374  		return -ENODEV;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  375  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  376  	while ((this_opt = strsep(&options, ",")) != NULL) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  377  		/* Panel option */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  378  		if (!strncmp(this_opt, "panel:", 6)) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  379  			int i;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  380  			this_opt += 6;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  381  			for (i = 0; i < num_panels; i++) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  382  				if (!strncmp(this_opt, known_lcd_panels[i].name,
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  383  					     strlen(this_opt))) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  384  					fbdev->panel = &known_lcd_panels[i];
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  385  					fbdev->panel_idx = i;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  386  					break;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  387  				}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  388  			}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  389  			if (i >= num_panels) {
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  390  				print_warn("Panel '%s' not supported!", this_opt);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  391  				return -ENODEV;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  392  			}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  393  		}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  394  		/* Unsupported option */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  395  		else
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  396  			print_warn("Unsupported option \"%s\"", this_opt);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  397  	}
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  398  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  399  	print_info("Panel=%s", fbdev->panel->name);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  400  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  401  	return 0;
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  402  }
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
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  428  	fbdev->info.fix = (struct fb_fix_screeninfo) {
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  429  		.mmio_start = regs_res->start,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  430  		.mmio_len = resource_size(regs_res),
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  431  		.id = "AU1100 FB",
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  432  		.xpanstep = 1,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  433  		.ypanstep = 1,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  434  		.type = FB_TYPE_PACKED_PIXELS,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  435  		.accel = FB_ACCEL_NONE,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  436  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  437  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  438  	if (!devm_request_mem_region(&dev->dev,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  439  				     fbdev->info.fix.mmio_start,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  440  				     fbdev->info.fix.mmio_len,
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  441  				     DRIVER_NAME)) {
c05b7f3d12b945 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-30  442  		print_err("fail to lock memory region at 0x%08lx",
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  443  			  fbdev->info.fix.mmio_start);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  444  		return -EBUSY;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  445  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  446  
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  447  	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  448  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  449  	print_dbg("Register memory map at %p", fbdev->regs);
deee40d267c04a drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  450  	print_dbg("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
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
deee40d267c04a drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  467  		print_err("fail to allocate framebuffer (size: %zuK))",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  468  			  fbdev->fb_len / 1024);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  469  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  470  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  471  
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  472  	fbdev->info.fix.smem_start = fbdev->fb_phys;
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  473  	fbdev->info.fix.smem_len = fbdev->fb_len;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  474  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  475  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
8a19e8c9c05d78 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  476  	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  477  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  478  	/* load the panel info into the var struct */
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  479  	fbdev->info.var = (struct fb_var_screeninfo) {
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  480  		.activate = FB_ACTIVATE_NOW,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  481  		.height = -1,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  482  		.width = -1,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  483  		.vmode = FB_VMODE_NONINTERLACED,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  484  		.bits_per_pixel = fbdev->panel->bpp,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  485  		.xres = fbdev->panel->xres,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  486  		.xres_virtual = fbdev->panel->xres,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  487  		.yres = fbdev->panel->yres,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  488  		.yres_virtual = fbdev->panel->yres,
0938c7cf68c618 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  489  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  490  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  491  	fbdev->info.screen_base = fbdev->fb_mem;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  492  	fbdev->info.fbops = &au1100fb_ops;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  493  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  494  	fbdev->info.pseudo_palette =
a86854d0c599b3 drivers/video/fbdev/au1100fb.c Kees Cook          2018-06-12  495  		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  496  	if (!fbdev->info.pseudo_palette)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  497  		return -ENOMEM;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  498  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @499  	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  500  		print_err("Fail to allocate colormap (%d entries)",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  501  			   AU1100_LCD_NBR_PALETTE_ENTRIES);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  502  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  503  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  504  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  505  	/* Set h/w registers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  506  	au1100fb_setmode(fbdev);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  507  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  508  	/* Register new framebuffer */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @509  	if (register_framebuffer(&fbdev->info) < 0) {
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
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @522  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  523  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  524  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  525  	return -ENODEV;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  526  }
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  527  
65ead1cf1fc59b drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-08  528  static void au1100fb_drv_remove(struct platform_device *dev)
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  529  {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  530  	struct au1100fb_device *fbdev = NULL;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  531  
5a7bbe86b0b99b drivers/video/au1100fb.c       Jingoo Han         2013-09-09  532  	fbdev = platform_get_drvdata(dev);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  533  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  534  #if !defined(CONFIG_FRAMEBUFFER_CONSOLE) && defined(CONFIG_LOGO)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  535  	au1100fb_fb_blank(VESA_POWERDOWN, &fbdev->info);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  536  #endif
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  537  	fbdev->regs->lcd_control &= ~LCD_CONTROL_GO;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  538  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  539  	/* Clean up all probe data */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @540  	unregister_framebuffer(&fbdev->info);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  541  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  542  	fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  543  
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  544  	if (fbdev->lcdclk) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  545  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  546  		clk_put(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  547  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  548  }
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  549  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
