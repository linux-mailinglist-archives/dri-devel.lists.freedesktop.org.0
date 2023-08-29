Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F7D78C8F0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3C10E3C4;
	Tue, 29 Aug 2023 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302610E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324583; x=1724860583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Net98/tBKWwHvEeymx3Z6uXP6ZPeuR/3kE/rCN6ir8=;
 b=I7VZE7f9Z9OqRO6j5WwRasqKTcqg/f8CVMKPhRAZYpsG+c2Epvbf5v1s
 J7Vfd5hUt8PVXZk681Hhv9Vb4ZlN1Knb3UiSGCI2PjeiXCSWjb1xXrBIx
 sohoPyIIvcyQ3zIR46VEL7120CTyDLLGqCzH7OEA8IlWzWBoUITHr2f8i
 dbTqUvpbVEaa/Q63HkNec+g56623EkzislQ2xUjaHVPkT8SvcFgX91uD3
 C71w1LFH+ivzoB7q1KLNbpc3GzgOXvY1/qeII5OLMki4JIhBor+DiN64h
 a3BP2L0tB8EWjJPq6zotJ8tNs08OUSE1kDfcDstdQscy/3HLcN1Dk5MMH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375365766"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="375365766"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="741870843"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="741870843"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 08:56:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qb14k-0008sN-2f;
 Tue, 29 Aug 2023 15:56:18 +0000
Date: Tue, 29 Aug 2023 23:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 javierm@redhat.com, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] fbdev/core: Move logo functions into separate source
 file
Message-ID: <202308292302.bkYBkvrg-lkp@intel.com>
References: <20230829142109.4521-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829142109.4521-5-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230829]
[cannot apply to linus/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-au1200fb-Do-not-display-boot-up-logo/20230829-222419
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230829142109.4521-5-tzimmermann%40suse.de
patch subject: [PATCH 4/7] fbdev/core: Move logo functions into separate source file
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230829/202308292302.bkYBkvrg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292302.bkYBkvrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292302.bkYBkvrg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_logo.c:433:5: warning: no previous prototype for 'fb_prepare_logo' [-Wmissing-prototypes]
     433 | int fb_prepare_logo(struct fb_info *info, int rotate)
         |     ^~~~~~~~~~~~~~~
>> drivers/video/fbdev/core/fb_logo.c:506:5: warning: no previous prototype for 'fb_show_logo' [-Wmissing-prototypes]
     506 | int fb_show_logo(struct fb_info *info, int rotate)
         |     ^~~~~~~~~~~~


vim +/fb_prepare_logo +433 drivers/video/fbdev/core/fb_logo.c

   432	
 > 433	int fb_prepare_logo(struct fb_info *info, int rotate)
   434	{
   435		int depth = fb_get_color_depth(&info->var, &info->fix);
   436		unsigned int yres;
   437		int height;
   438	
   439		memset(&fb_logo, 0, sizeof(struct logo_data));
   440	
   441		if (info->flags & FBINFO_MISC_TILEBLITTING ||
   442		    info->fbops->owner || !fb_logo_count)
   443			return 0;
   444	
   445		if (info->fix.visual == FB_VISUAL_DIRECTCOLOR) {
   446			depth = info->var.blue.length;
   447			if (info->var.red.length < depth)
   448				depth = info->var.red.length;
   449			if (info->var.green.length < depth)
   450				depth = info->var.green.length;
   451		}
   452	
   453		if (info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR && depth > 4) {
   454			/* assume console colormap */
   455			depth = 4;
   456		}
   457	
   458		/* Return if no suitable logo was found */
   459		fb_logo.logo = fb_find_logo(depth);
   460	
   461		if (!fb_logo.logo)
   462			return 0;
   463	
   464		if (rotate == FB_ROTATE_UR || rotate == FB_ROTATE_UD)
   465			yres = info->var.yres;
   466		else
   467			yres = info->var.xres;
   468	
   469		if (fb_logo.logo->height > yres) {
   470			fb_logo.logo = NULL;
   471			return 0;
   472		}
   473	
   474		/* What depth we asked for might be different from what we get */
   475		if (fb_logo.logo->type == LINUX_LOGO_CLUT224)
   476			fb_logo.depth = 8;
   477		else if (fb_logo.logo->type == LINUX_LOGO_VGA16)
   478			fb_logo.depth = 4;
   479		else
   480			fb_logo.depth = 1;
   481	
   482	
   483		if (fb_logo.depth > 4 && depth > 4) {
   484			switch (info->fix.visual) {
   485			case FB_VISUAL_TRUECOLOR:
   486				fb_logo.needs_truepalette = 1;
   487				break;
   488			case FB_VISUAL_DIRECTCOLOR:
   489				fb_logo.needs_directpalette = 1;
   490				fb_logo.needs_cmapreset = 1;
   491				break;
   492			case FB_VISUAL_PSEUDOCOLOR:
   493				fb_logo.needs_cmapreset = 1;
   494				break;
   495			}
   496		}
   497	
   498		height = fb_logo.logo->height;
   499		if (fb_center_logo)
   500			height += (yres - fb_logo.logo->height) / 2;
   501	
   502		return fb_prepare_extra_logos(info, height, yres);
   503	}
   504	EXPORT_SYMBOL(fb_prepare_logo);
   505	
 > 506	int fb_show_logo(struct fb_info *info, int rotate)
   507	{
   508		unsigned int count;
   509		int y;
   510	
   511		if (!fb_logo_count)
   512			return 0;
   513	
   514		count = fb_logo_count < 0 ? num_online_cpus() : fb_logo_count;
   515		y = fb_show_logo_line(info, rotate, fb_logo.logo, 0, count);
   516		y = fb_show_extra_logos(info, y, rotate);
   517	
   518		return y;
   519	}
   520	EXPORT_SYMBOL(fb_show_logo);
   521	#else
   522	int fb_prepare_logo(struct fb_info *info, int rotate)
   523	{
   524		return 0;
   525	}
   526	EXPORT_SYMBOL(fb_prepare_logo);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
