Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE54806354
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 01:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3F010E64A;
	Wed,  6 Dec 2023 00:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774210E64A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701822007; x=1733358007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l4YdvopjLjJ2U0zhsVcGZcQG4VQJm6QrrZ1qgnvzx4U=;
 b=Zyu22kDiLYiTtuUWpXfYPx66c3qbJUQsgtf1KDpKEM3gF5WmwGUYDTez
 //413Qq0N46yfIplEnLWZFCfNOQZaO2pfGuW0jqN5eCILCCVgmYFXYMWM
 2nc0x6+hS1iOC1VBINcy1/CC/2f4Pkb2fa+iBVjA5aQVUOmNslJykpzr+
 AMQSSrTkmr2O1TXGE6Z4qFQhSKOYHrg+ugAzLyo90UZAZLlhYLRkepEkL
 OOPyKczfyidjJLVNXY7wDlybLv8AhtXhDRC9LMunKlQIRmWI2n+8Pxv7g
 HTftqSWN9psL6SBMF4IRwt94bKVJvkt5R5MOr937tXkdCsXGAi4bLepx6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="425131115"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="425131115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800150423"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="800150423"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 16:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rAfdw-0009va-3C;
 Wed, 06 Dec 2023 00:20:00 +0000
Date: Wed, 6 Dec 2023 08:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 deller@gmx.de, pjones@redhat.com
Subject: Re: [PATCH v2 1/4] fbdev/efifb: Replace references to global
 screen_info by local pointer
Message-ID: <202312060820.0Kjx88on-lkp@intel.com>
References: <20231204092812.2612-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204092812.2612-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-efifb-Replace-references-to-global-screen_info-by-local-pointer/20231204-173019
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231204092812.2612-2-tzimmermann%40suse.de
patch subject: [PATCH v2 1/4] fbdev/efifb: Replace references to global screen_info by local pointer
config: x86_64-randconfig-006-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060820.0Kjx88on-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060820.0Kjx88on-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060820.0Kjx88on-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/efifb.c: In function 'efifb_probe':
>> drivers/video/fbdev/efifb.c:511:2: error: too few arguments to function 'efifb_show_boot_graphics'
     efifb_show_boot_graphics(info);
     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/efifb.c:150:13: note: declared here
    static void efifb_show_boot_graphics(struct fb_info *info, struct screen_info *si)
                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/efifb_show_boot_graphics +511 drivers/video/fbdev/efifb.c

dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  358  
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  359  static int efifb_probe(struct platform_device *dev)
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  360  {
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  361  	struct screen_info *si = &screen_info;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  362  	struct fb_info *info;
82dcb90b651bcb drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  363  	struct efifb_par *par;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  364  	int err, orientation;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  365  	unsigned int size_vmode;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  366  	unsigned int size_remap;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  367  	unsigned int size_total;
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  368  	char *option = NULL;
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  369  	efi_memory_desc_t md;
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  370  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  371  	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  372  		return -ENODEV;
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  373  
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  374  	if (fb_get_options("efifb", &option))
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  375  		return -ENODEV;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  376  	efifb_setup(si, option);
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  377  
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  378  	/* We don't get linelength from UGA Draw Protocol, only from
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  379  	 * EFI Graphics Protocol.  So if it's not in DMI, and it's not
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  380  	 * passed in from the user, we really can't use the framebuffer.
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  381  	 */
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  382  	if (!si->lfb_linelength)
e6816a8d855494 drivers/video/efifb.c       David Rheinsberg  2013-08-02  383  		return -ENODEV;
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  384  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  385  	if (!si->lfb_depth)
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  386  		si->lfb_depth = 32;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  387  	if (!si->pages)
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  388  		si->pages = 1;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  389  	if (!fb_base_is_valid(si)) {
133bb070e94ab4 drivers/video/efifb.c       Matthew Garrett   2009-04-13  390  		printk(KERN_DEBUG "efifb: invalid framebuffer address\n");
133bb070e94ab4 drivers/video/efifb.c       Matthew Garrett   2009-04-13  391  		return -ENODEV;
133bb070e94ab4 drivers/video/efifb.c       Matthew Garrett   2009-04-13  392  	}
133bb070e94ab4 drivers/video/efifb.c       Matthew Garrett   2009-04-13  393  	printk(KERN_INFO "efifb: probing for efifb\n");
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  394  
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  395  	/* just assume they're all unset if any are */
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  396  	if (!si->blue_size) {
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  397  		si->blue_size = 8;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  398  		si->blue_pos = 0;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  399  		si->green_size = 8;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  400  		si->green_pos = 8;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  401  		si->red_size = 8;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  402  		si->red_pos = 16;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  403  		si->rsvd_size = 8;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  404  		si->rsvd_pos = 24;
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  405  	}
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  406  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  407  	efifb_fix.smem_start = si->lfb_base;
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  408  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  409  	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  410  		u64 ext_lfb_base;
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  411  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  412  		ext_lfb_base = (u64)(unsigned long)si->ext_lfb_base << 32;
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  413  		efifb_fix.smem_start |= ext_lfb_base;
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  414  	}
ae2ee627dc87a7 drivers/video/fbdev/efifb.c Matt Fleming      2015-08-25  415  
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  416  	if (bar_resource &&
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  417  	    bar_resource->start + bar_offset != efifb_fix.smem_start) {
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  418  		dev_info(&efifb_pci_dev->dev,
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  419  			 "BAR has moved, updating efifb address\n");
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  420  		efifb_fix.smem_start = bar_resource->start + bar_offset;
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  421  	}
dcf8f5ce316565 drivers/video/fbdev/efifb.c Ard Biesheuvel    2017-08-18  422  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  423  	efifb_defined.bits_per_pixel = si->lfb_depth;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  424  	efifb_defined.xres = si->lfb_width;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  425  	efifb_defined.yres = si->lfb_height;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  426  	efifb_fix.line_length = si->lfb_linelength;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  427  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  428  	/*   size_vmode -- that is the amount of memory needed for the
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  429  	 *                 used video mode, i.e. the minimum amount of
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  430  	 *                 memory we need. */
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  431  	size_vmode = efifb_defined.yres * efifb_fix.line_length;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  432  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  433  	/*   size_total -- all video memory we have. Used for
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  434  	 *                 entries, ressource allocation and bounds
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  435  	 *                 checking. */
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  436  	size_total = si->lfb_size;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  437  	if (size_total < size_vmode)
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  438  		size_total = size_vmode;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  439  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  440  	/*   size_remap -- the amount of video memory we are going to
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  441  	 *                 use for efifb.  With modern cards it is no
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  442  	 *                 option to simply use size_total as that
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  443  	 *                 wastes plenty of kernel address space. */
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  444  	size_remap  = size_vmode * 2;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  445  	if (size_remap > size_total)
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  446  		size_remap = size_total;
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  447  	if (size_remap % PAGE_SIZE)
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  448  		size_remap += PAGE_SIZE - (size_remap % PAGE_SIZE);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  449  	efifb_fix.smem_len = size_remap;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  450  
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  451  	if (request_mem_region(efifb_fix.smem_start, size_remap, "efifb")) {
da0241f12bf785 drivers/video/efifb.c       Andy Lutomirski   2011-05-26  452  		request_mem_succeeded = true;
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  453  	} else {
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  454  		/* We cannot make this fatal. Sometimes this comes from magic
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  455  		   spaces our resource handlers simply don't know about */
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  456  		pr_warn("efifb: cannot reserve video memory at 0x%lx\n",
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  457  			efifb_fix.smem_start);
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  458  	}
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  459  
82dcb90b651bcb drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  460  	info = framebuffer_alloc(sizeof(*par), &dev->dev);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  461  	if (!info) {
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  462  		err = -ENOMEM;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  463  		goto err_release_mem;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  464  	}
65b4021ed67622 drivers/video/efifb.c       David Rheinsberg  2014-01-23  465  	platform_set_drvdata(dev, info);
82dcb90b651bcb drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  466  	par = info->par;
82dcb90b651bcb drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  467  	info->pseudo_palette = par->pseudo_palette;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  468  
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  469  	par->base = efifb_fix.smem_start;
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  470  	par->size = size_remap;
4410f3910947dc drivers/video/efifb.c       Dave Airlie       2009-06-16  471  
6163a985e50cb1 drivers/video/fbdev/efifb.c Juergen Gross     2020-07-10  472  	if (efi_enabled(EFI_MEMMAP) &&
c2999c281ea2d2 drivers/video/fbdev/efifb.c Ard Biesheuvel    2019-03-28  473  	    !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  474  		if ((efifb_fix.smem_start + efifb_fix.smem_len) >
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  475  		    (md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT))) {
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  476  			pr_err("efifb: video memory @ 0x%lx spans multiple EFI memory regions\n",
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  477  			       efifb_fix.smem_start);
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  478  			err = -EIO;
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  479  			goto err_release_fb;
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  480  		}
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  481  		/*
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  482  		 * If the UEFI memory map covers the efifb region, we may only
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  483  		 * remap it using the attributes the memory map prescribes.
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  484  		 */
f8585539df0a15 drivers/video/fbdev/efifb.c Ard Biesheuvel    2019-05-16  485  		md.attribute &= EFI_MEMORY_UC | EFI_MEMORY_WC |
f8585539df0a15 drivers/video/fbdev/efifb.c Ard Biesheuvel    2019-05-16  486  				EFI_MEMORY_WT | EFI_MEMORY_WB;
f8585539df0a15 drivers/video/fbdev/efifb.c Ard Biesheuvel    2019-05-16  487  		if (md.attribute) {
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  488  			mem_flags |= EFI_MEMORY_WT | EFI_MEMORY_WB;
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  489  			mem_flags &= md.attribute;
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  490  		}
f8585539df0a15 drivers/video/fbdev/efifb.c Ard Biesheuvel    2019-05-16  491  	}
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  492  	if (mem_flags & EFI_MEMORY_WC)
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  493  		info->screen_base = ioremap_wc(efifb_fix.smem_start,
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  494  					       efifb_fix.smem_len);
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  495  	else if (mem_flags & EFI_MEMORY_UC)
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  496  		info->screen_base = ioremap(efifb_fix.smem_start,
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  497  					    efifb_fix.smem_len);
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  498  	else if (mem_flags & EFI_MEMORY_WT)
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  499  		info->screen_base = memremap(efifb_fix.smem_start,
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  500  					     efifb_fix.smem_len, MEMREMAP_WT);
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  501  	else if (mem_flags & EFI_MEMORY_WB)
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  502  		info->screen_base = memremap(efifb_fix.smem_start,
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  503  					     efifb_fix.smem_len, MEMREMAP_WB);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  504  	if (!info->screen_base) {
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  505  		pr_err("efifb: abort, cannot remap video memory 0x%x @ 0x%lx\n",
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  506  			efifb_fix.smem_len, efifb_fix.smem_start);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  507  		err = -EIO;
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  508  		goto err_release_fb;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  509  	}
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  510  
34db50e5565662 drivers/video/fbdev/efifb.c Hans de Goede     2018-07-03 @511  	efifb_show_boot_graphics(info);
34db50e5565662 drivers/video/fbdev/efifb.c Hans de Goede     2018-07-03  512  
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  513  	pr_info("efifb: framebuffer at 0x%lx, using %dk, total %dk\n",
a53dd258279c1e drivers/video/fbdev/efifb.c Andy Lutomirski   2016-05-11  514  	       efifb_fix.smem_start, size_remap/1024, size_total/1024);
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  515  	pr_info("efifb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  516  	       efifb_defined.xres, efifb_defined.yres,
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  517  	       efifb_defined.bits_per_pixel, efifb_fix.line_length,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  518  	       si->pages);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  519  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  520  	efifb_defined.xres_virtual = efifb_defined.xres;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  521  	efifb_defined.yres_virtual = efifb_fix.smem_len /
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  522  					efifb_fix.line_length;
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  523  	pr_info("efifb: scrolling: redraw\n");
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  524  	efifb_defined.yres_virtual = efifb_defined.yres;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  525  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  526  	/* some dummy values for timing to make fbset happy */
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  527  	efifb_defined.pixclock     = 10000000 / efifb_defined.xres *
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  528  					1000 / efifb_defined.yres;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  529  	efifb_defined.left_margin  = (efifb_defined.xres / 8) & 0xf8;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  530  	efifb_defined.hsync_len    = (efifb_defined.xres / 8) & 0xf8;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  531  
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  532  	efifb_defined.red.offset    = si->red_pos;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  533  	efifb_defined.red.length    = si->red_size;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  534  	efifb_defined.green.offset  = si->green_pos;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  535  	efifb_defined.green.length  = si->green_size;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  536  	efifb_defined.blue.offset   = si->blue_pos;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  537  	efifb_defined.blue.length   = si->blue_size;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  538  	efifb_defined.transp.offset = si->rsvd_pos;
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  539  	efifb_defined.transp.length = si->rsvd_size;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  540  
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  541  	pr_info("efifb: %s: "
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  542  	       "size=%d:%d:%d:%d, shift=%d:%d:%d:%d\n",
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  543  	       "Truecolor",
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  544  	       si->rsvd_size,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  545  	       si->red_size,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  546  	       si->green_size,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  547  	       si->blue_size,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  548  	       si->rsvd_pos,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  549  	       si->red_pos,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  550  	       si->green_pos,
c1c324fc4ecca7 drivers/video/fbdev/efifb.c Thomas Zimmermann 2023-12-04  551  	       si->blue_pos);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  552  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  553  	efifb_fix.ypanstep  = 0;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  554  	efifb_fix.ywrapstep = 0;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  555  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  556  	info->fbops = &efifb_ops;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  557  	info->var = efifb_defined;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  558  	info->fix = efifb_fix;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  559  
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  560  	orientation = drm_get_panel_orientation_quirk(efifb_defined.xres,
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  561  						      efifb_defined.yres);
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  562  	switch (orientation) {
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  563  	default:
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  564  		info->fbcon_rotate_hint = FB_ROTATE_UR;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  565  		break;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  566  	case DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP:
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  567  		info->fbcon_rotate_hint = FB_ROTATE_UD;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  568  		break;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  569  	case DRM_MODE_PANEL_ORIENTATION_LEFT_UP:
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  570  		info->fbcon_rotate_hint = FB_ROTATE_CCW;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  571  		break;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  572  	case DRM_MODE_PANEL_ORIENTATION_RIGHT_UP:
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  573  		info->fbcon_rotate_hint = FB_ROTATE_CW;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  574  		break;
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  575  	}
028b186f4489dc drivers/video/fbdev/efifb.c Hans de Goede     2017-11-25  576  
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  577  	err = sysfs_create_groups(&dev->dev.kobj, efifb_groups);
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  578  	if (err) {
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  579  		pr_err("efifb: cannot add sysfs attrs\n");
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  580  		goto err_unmap;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  581  	}
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  582  	err = fb_alloc_cmap(&info->cmap, 256, 0);
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  583  	if (err < 0) {
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  584  		pr_err("efifb: cannot allocate colormap\n");
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  585  		goto err_groups;
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  586  	}
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  587  
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  588  	if (efifb_pci_dev)
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  589  		WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  590  
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  591  	err = devm_aperture_acquire_for_platform_device(dev, par->base, par->size);
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  592  	if (err) {
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  593  		pr_err("efifb: cannot acquire aperture\n");
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  594  		goto err_put_rpm_ref;
7191ec8015f363 drivers/video/fbdev/efifb.c Thomas Zimmermann 2022-12-19  595  	}
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  596  	err = register_framebuffer(info);
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  597  	if (err < 0) {
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  598  		pr_err("efifb: cannot register framebuffer\n");
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  599  		goto err_put_rpm_ref;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  600  	}
31b6780c15a4e3 drivers/video/efifb.c       Joe Perches       2013-09-19  601  	fb_info(info, "%s frame buffer device\n", info->fix.id);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  602  	return 0;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  603  
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  604  err_put_rpm_ref:
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  605  	if (efifb_pci_dev)
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  606  		pm_runtime_put(&efifb_pci_dev->dev);
55285e21f04517 drivers/video/fbdev/efifb.c Imre Deak         2021-08-09  607  
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  608  	fb_dealloc_cmap(&info->cmap);
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  609  err_groups:
753375a881caa0 drivers/video/fbdev/efifb.c Peter Jones       2016-10-18  610  	sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  611  err_unmap:
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  612  	if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  613  		iounmap(info->screen_base);
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  614  	else
38ac0287b7f4f3 drivers/video/fbdev/efifb.c Ard Biesheuvel    2018-07-11  615  		memunmap(info->screen_base);
7c08c9ae0c1458 drivers/video/efifb.c       Peter Jones       2008-10-15  616  err_release_fb:
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  617  	framebuffer_release(info);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  618  err_release_mem:
da0241f12bf785 drivers/video/efifb.c       Andy Lutomirski   2011-05-26  619  	if (request_mem_succeeded)
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  620  		release_mem_region(efifb_fix.smem_start, size_total);
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  621  	return err;
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  622  }
7c83172b98e569 drivers/video/efifb.c       Huang, Ying       2007-11-28  623  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
