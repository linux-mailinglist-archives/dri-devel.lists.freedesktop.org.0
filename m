Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA452DF41
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 23:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FF811A909;
	Thu, 19 May 2022 21:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCAF11A908
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652995542; x=1684531542;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5HLlWYcgzBtISfn1gKPyn+P9BLnVyOtVgVOJ7TSVO9o=;
 b=RKUR0HsgdDlO1LZJXItcXzXvD5sCtzuQgY7FCUmyMMnCSlkoAx2W16Gm
 2O+jAABnaeUrHVentsHeRBlxOgHUJ9ZWcEZiVeSLq/zVDiz0ioo6KV5e2
 ViYoJvokjzepZh6njQsAfscAsXp4CfC5E0jwEOrXwtXaYoNAo/aDvwQax
 utiV/tjnsLYi2DiWHIPNNCwJvBUpdUzH6OE8th6nMvQkll0zYjdYOsQL/
 HKxaccw0VzYuK5adw274lL1gpjviYAmBtmXzcyzIp7JH0QQ0CMAnz3+QJ
 ZzDgfx6ciePt2bAyL/8pzHQ7UTBmz76W2Wj3BI5feJiFp15wSYrxxQ7GS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272514192"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="272514192"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 14:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="818204498"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2022 14:25:36 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrneJ-0003xV-SX;
 Thu, 19 May 2022 21:25:35 +0000
Date: Fri, 20 May 2022 05:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Uri Arev <me@wantyapps.xyz>
Subject: Re: [PATCH] staging: fbtft: fix checkpatch.pl struct should normally
 be const
Message-ID: <202205200517.BCEmgrh4-lkp@intel.com>
References: <20220519172503.10821-1-me@wantyapps.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519172503.10821-1-me@wantyapps.xyz>
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
Cc: Srivathsa Dara <srivathsa729.8@gmail.com>, Uri Arev <me@wantyapps.xyz>,
 kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uri,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Uri-Arev/staging-fbtft-fix-checkpatch-pl-struct-should-normally-be-const/20220520-012948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 4d0cc9e0e53e9946d7b8dc58279c62dfa7a2191b
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220520/202205200517.BCEmgrh4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d26e139bfc29011b0a147df71f0b91485189c66e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uri-Arev/staging-fbtft-fix-checkpatch-pl-struct-should-normally-be-const/20220520-012948
        git checkout d26e139bfc29011b0a147df71f0b91485189c66e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/staging/fbtft/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_framebuffer_alloc':
   drivers/staging/fbtft/fbtft-core.c:617:15: error: type defaults to 'int' in declaration of 'fbops' [-Werror=implicit-int]
     617 |         const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
         |               ^~~~~
   drivers/staging/fbtft/fbtft-core.c:617:15: error: conflicting type qualifiers for 'fbops'
   drivers/staging/fbtft/fbtft-core.c:542:30: note: previous definition of 'fbops' with type 'const struct fb_ops *'
     542 |         const struct fb_ops *fbops = NULL;
         |                              ^~~~~
>> drivers/staging/fbtft/fbtft-core.c:617:23: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     617 |         const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
         |                       ^~~~~~~~~~~~
>> drivers/staging/fbtft/fbtft-core.c:617:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     617 |         const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
         |         ^~~~~
>> drivers/staging/fbtft/fbtft-core.c:644:21: warning: assignment to 'const struct fb_ops *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     644 |         info->fbops = fbops;
         |                     ^
   drivers/staging/fbtft/fbtft-core.c:647:14: error: invalid type argument of '->' (have 'int')
     647 |         fbops->owner        =      dev->driver->owner;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:648:14: error: invalid type argument of '->' (have 'int')
     648 |         fbops->fb_read      =      fb_sys_read;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:649:14: error: invalid type argument of '->' (have 'int')
     649 |         fbops->fb_write     =      fbtft_fb_write;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:650:14: error: invalid type argument of '->' (have 'int')
     650 |         fbops->fb_fillrect  =      fbtft_fb_fillrect;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:651:14: error: invalid type argument of '->' (have 'int')
     651 |         fbops->fb_copyarea  =      fbtft_fb_copyarea;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:652:14: error: invalid type argument of '->' (have 'int')
     652 |         fbops->fb_imageblit =      fbtft_fb_imageblit;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:653:14: error: invalid type argument of '->' (have 'int')
     653 |         fbops->fb_setcolreg =      fbtft_fb_setcolreg;
         |              ^~
   drivers/staging/fbtft/fbtft-core.c:654:14: error: invalid type argument of '->' (have 'int')
     654 |         fbops->fb_blank     =      fbtft_fb_blank;
         |              ^~
   cc1: some warnings being treated as errors


vim +617 drivers/staging/fbtft/fbtft-core.c

   516	
   517	/**
   518	 * fbtft_framebuffer_alloc - creates a new frame buffer info structure
   519	 *
   520	 * @display: pointer to structure describing the display
   521	 * @dev: pointer to the device for this fb, this can be NULL
   522	 * @pdata: platform data for the display in use
   523	 *
   524	 * Creates a new frame buffer info structure.
   525	 *
   526	 * Also creates and populates the following structures:
   527	 *   info->fbops
   528	 *   info->fbdefio
   529	 *   info->pseudo_palette
   530	 *   par->fbtftops
   531	 *   par->txbuf
   532	 *
   533	 * Returns the new structure, or NULL if an error occurred.
   534	 *
   535	 */
   536	struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
   537						struct device *dev,
   538						struct fbtft_platform_data *pdata)
   539	{
   540		struct fb_info *info;
   541		struct fbtft_par *par;
   542		const struct fb_ops *fbops = NULL;
   543		struct fb_deferred_io *fbdefio = NULL;
   544		u8 *vmem = NULL;
   545		void *txbuf = NULL;
   546		void *buf = NULL;
   547		unsigned int width;
   548		unsigned int height;
   549		int txbuflen = display->txbuflen;
   550		unsigned int bpp = display->bpp;
   551		unsigned int fps = display->fps;
   552		int vmem_size;
   553		const s16 *init_sequence = display->init_sequence;
   554		char *gamma = display->gamma;
   555		u32 *gamma_curves = NULL;
   556	
   557		/* sanity check */
   558		if (display->gamma_num * display->gamma_len >
   559				FBTFT_GAMMA_MAX_VALUES_TOTAL) {
   560			dev_err(dev, "FBTFT_GAMMA_MAX_VALUES_TOTAL=%d is exceeded\n",
   561				FBTFT_GAMMA_MAX_VALUES_TOTAL);
   562			return NULL;
   563		}
   564	
   565		/* defaults */
   566		if (!fps)
   567			fps = 20;
   568		if (!bpp)
   569			bpp = 16;
   570	
   571		if (!pdata) {
   572			dev_err(dev, "platform data is missing\n");
   573			return NULL;
   574		}
   575	
   576		/* override driver values? */
   577		if (pdata->fps)
   578			fps = pdata->fps;
   579		if (pdata->txbuflen)
   580			txbuflen = pdata->txbuflen;
   581		if (pdata->display.init_sequence)
   582			init_sequence = pdata->display.init_sequence;
   583		if (pdata->gamma)
   584			gamma = pdata->gamma;
   585		if (pdata->display.debug)
   586			display->debug = pdata->display.debug;
   587		if (pdata->display.backlight)
   588			display->backlight = pdata->display.backlight;
   589		if (pdata->display.width)
   590			display->width = pdata->display.width;
   591		if (pdata->display.height)
   592			display->height = pdata->display.height;
   593		if (pdata->display.buswidth)
   594			display->buswidth = pdata->display.buswidth;
   595		if (pdata->display.regwidth)
   596			display->regwidth = pdata->display.regwidth;
   597	
   598		display->debug |= debug;
   599		fbtft_expand_debug_value(&display->debug);
   600	
   601		switch (pdata->rotate) {
   602		case 90:
   603		case 270:
   604			width =  display->height;
   605			height = display->width;
   606			break;
   607		default:
   608			width =  display->width;
   609			height = display->height;
   610		}
   611	
   612		vmem_size = display->width * display->height * bpp / 8;
   613		vmem = vzalloc(vmem_size);
   614		if (!vmem)
   615			goto alloc_fail;
   616	
 > 617		const fbops = devm_kzalloc(dev, sizeof(struct fb_ops), GFP_KERNEL);
   618		if (!fbops)
   619			goto alloc_fail;
   620	
   621		fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
   622		if (!fbdefio)
   623			goto alloc_fail;
   624	
   625		buf = devm_kzalloc(dev, 128, GFP_KERNEL);
   626		if (!buf)
   627			goto alloc_fail;
   628	
   629		if (display->gamma_num && display->gamma_len) {
   630			gamma_curves = devm_kcalloc(dev,
   631						    display->gamma_num *
   632						    display->gamma_len,
   633						    sizeof(gamma_curves[0]),
   634						    GFP_KERNEL);
   635			if (!gamma_curves)
   636				goto alloc_fail;
   637		}
   638	
   639		info = framebuffer_alloc(sizeof(struct fbtft_par), dev);
   640		if (!info)
   641			goto alloc_fail;
   642	
   643		info->screen_buffer = vmem;
 > 644		info->fbops = fbops;
   645		info->fbdefio = fbdefio;
   646	
   647		fbops->owner        =      dev->driver->owner;
   648		fbops->fb_read      =      fb_sys_read;
   649		fbops->fb_write     =      fbtft_fb_write;
   650		fbops->fb_fillrect  =      fbtft_fb_fillrect;
   651		fbops->fb_copyarea  =      fbtft_fb_copyarea;
   652		fbops->fb_imageblit =      fbtft_fb_imageblit;
   653		fbops->fb_setcolreg =      fbtft_fb_setcolreg;
   654		fbops->fb_blank     =      fbtft_fb_blank;
   655	
   656		fbdefio->delay =           HZ / fps;
   657		fbdefio->sort_pagelist =   true;
   658		fbdefio->deferred_io =     fbtft_deferred_io;
   659		fb_deferred_io_init(info);
   660	
   661		snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
   662		info->fix.type =           FB_TYPE_PACKED_PIXELS;
   663		info->fix.visual =         FB_VISUAL_TRUECOLOR;
   664		info->fix.xpanstep =	   0;
   665		info->fix.ypanstep =	   0;
   666		info->fix.ywrapstep =	   0;
   667		info->fix.line_length =    width * bpp / 8;
   668		info->fix.accel =          FB_ACCEL_NONE;
   669		info->fix.smem_len =       vmem_size;
   670	
   671		info->var.rotate =         pdata->rotate;
   672		info->var.xres =           width;
   673		info->var.yres =           height;
   674		info->var.xres_virtual =   info->var.xres;
   675		info->var.yres_virtual =   info->var.yres;
   676		info->var.bits_per_pixel = bpp;
   677		info->var.nonstd =         1;
   678	
   679		/* RGB565 */
   680		info->var.red.offset =     11;
   681		info->var.red.length =     5;
   682		info->var.green.offset =   5;
   683		info->var.green.length =   6;
   684		info->var.blue.offset =    0;
   685		info->var.blue.length =    5;
   686		info->var.transp.offset =  0;
   687		info->var.transp.length =  0;
   688	
   689		info->flags =              FBINFO_FLAG_DEFAULT | FBINFO_VIRTFB;
   690	
   691		par = info->par;
   692		par->info = info;
   693		par->pdata = pdata;
   694		par->debug = display->debug;
   695		par->buf = buf;
   696		spin_lock_init(&par->dirty_lock);
   697		par->bgr = pdata->bgr;
   698		par->startbyte = pdata->startbyte;
   699		par->init_sequence = init_sequence;
   700		par->gamma.curves = gamma_curves;
   701		par->gamma.num_curves = display->gamma_num;
   702		par->gamma.num_values = display->gamma_len;
   703		mutex_init(&par->gamma.lock);
   704		info->pseudo_palette = par->pseudo_palette;
   705	
   706		if (par->gamma.curves && gamma) {
   707			if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
   708						  strlen(gamma)))
   709				goto release_framebuf;
   710		}
   711	
   712		/* Transmit buffer */
   713		if (txbuflen == -1)
   714			txbuflen = vmem_size + 2; /* add in case startbyte is used */
   715		if (txbuflen >= vmem_size + 2)
   716			txbuflen = 0;
   717	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
