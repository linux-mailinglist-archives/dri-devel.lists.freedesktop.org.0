Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383007E083C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 19:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5E10E190;
	Fri,  3 Nov 2023 18:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411F10E191
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699036540; x=1730572540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DVPYgB1I00YcVgUxHt2T0mWkDRxhNvhah1fVuaJivj0=;
 b=nxEx79rELUU0tKYXAKR3l60d3t1LvDN11LyVTBGOSWKnQJvARPzWrl8b
 eY21frGvVx9W/EJCudoBJxVNS/XUNdFrpW67O1o+a3Ms1I6Uu2B5n0m/T
 K5u4HbSFa4ZfkfoMr7oFgoHa/KQR0w3zyf9v+/eAXu8dX4OOpmZtuu7B7
 XgBEN52R7XpZpVZDyqbj57BBk5AmPFygYl9OcKjcZAOcB7HXEYK6Eh3S2
 t5SzUs/57hhBbjGL1SZ3vzG28Vg/9wss5OlzKN9FZLjQEk7qYWc1q4lYQ
 57iPdRQ5V2mHWGpOuuwQGu8PZoipbHaCswYsF2cIx5m4+EsMDCtNn7LkR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379394187"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="379394187"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 11:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738153049"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="738153049"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 11:35:36 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qyz13-0002po-2u;
 Fri, 03 Nov 2023 18:35:33 +0000
Date: Sat, 4 Nov 2023 02:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v5 1/6] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Message-ID: <202311040208.JqcG6ZbK-lkp@intel.com>
References: <20231103145526.628138-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103145526.628138-2-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20231103-225824
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/20231103145526.628138-2-jfalempe%40redhat.com
patch subject: [PATCH v5 1/6] drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
config: csky-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040208.JqcG6ZbK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040208.JqcG6ZbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040208.JqcG6ZbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_format_helper.c:491: warning: Function parameter or member 'dpitch' not described in 'drm_fb_blit_from_r1'
>> drivers/gpu/drm/drm_format_helper.c:491: warning: Excess function parameter 'dpich' description in 'drm_fb_blit_from_r1'
>> drivers/gpu/drm/drm_format_helper.c:578: warning: Function parameter or member 'dpitch' not described in 'drm_fb_fill'
>> drivers/gpu/drm/drm_format_helper.c:578: warning: Function parameter or member 'color' not described in 'drm_fb_fill'
>> drivers/gpu/drm/drm_format_helper.c:578: warning: Excess function parameter 'dpich' description in 'drm_fb_fill'
>> drivers/gpu/drm/drm_format_helper.c:578: warning: Excess function parameter 'fg_color' description in 'drm_fb_fill'
>> drivers/gpu/drm/drm_format_helper.c:578: warning: Excess function parameter 'bg_color' description in 'drm_fb_fill'


vim +491 drivers/gpu/drm/drm_format_helper.c

   470	
   471	/**
   472	 * drm_fb_blit_from_r1 - convert a monochrome image to a linear framebuffer
   473	 * @dmap: destination iosys_map
   474	 * @dpich: destination pitch in bytes
   475	 * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
   476	 * @spitch: source pitch in bytes
   477	 * @height: height of the image to copy, in pixels
   478	 * @width: width of the image to copy, in pixels
   479	 * @fg_color: foreground color, in destination format
   480	 * @bg_color: background color, in destination format
   481	 * @pixel_width: pixel width in bytes.
   482	 *
   483	 * This can be used to draw font which are monochrome images, to a framebuffer
   484	 * in other supported format.
   485	 */
   486	void drm_fb_blit_from_r1(struct iosys_map *dmap, unsigned int dpitch,
   487				 const u8 *sbuf8, unsigned int spitch,
   488				 unsigned int height, unsigned int width,
   489				 u32 fg_color, u32 bg_color,
   490				 unsigned int pixel_width)
 > 491	{
   492		switch (pixel_width) {
   493		case 2:
   494			drm_fb_r1_to_16bit(dmap, dpitch, sbuf8, spitch,
   495					   height, width, fg_color, bg_color);
   496		break;
   497		case 3:
   498			drm_fb_r1_to_24bit(dmap, dpitch, sbuf8, spitch,
   499					   height, width, fg_color, bg_color);
   500		break;
   501		case 4:
   502			drm_fb_r1_to_32bit(dmap, dpitch, sbuf8, spitch,
   503					   height, width, fg_color, bg_color);
   504		break;
   505		default:
   506			WARN_ONCE(1, "Can't blit with pixel width %d\n", pixel_width);
   507		}
   508	}
   509	EXPORT_SYMBOL(drm_fb_blit_from_r1);
   510	
   511	static void drm_fb_fill8(struct iosys_map *dmap, unsigned int dpitch,
   512				 unsigned int height, unsigned int width,
   513				 u8 color)
   514	{
   515		unsigned int l, x;
   516	
   517		for (l = 0; l < height; l++)
   518			for (x = 0; x < width; x++)
   519				iosys_map_wr(dmap, l * dpitch + x * sizeof(u8), u8, color);
   520	}
   521	
   522	static void drm_fb_fill16(struct iosys_map *dmap, unsigned int dpitch,
   523				  unsigned int height, unsigned int width,
   524				  u16 color)
   525	{
   526		unsigned int l, x;
   527	
   528		for (l = 0; l < height; l++)
   529			for (x = 0; x < width; x++)
   530				iosys_map_wr(dmap, l * dpitch + x * sizeof(u16), u16, color);
   531	}
   532	
   533	static void drm_fb_fill24(struct iosys_map *dmap, unsigned int dpitch,
   534				  unsigned int height, unsigned int width,
   535				  u32 color)
   536	{
   537		unsigned int l, x;
   538	
   539		for (l = 0; l < height; l++) {
   540			for (x = 0; x < width; x++) {
   541				unsigned int off = l * dpitch + x * 3;
   542				u32 val32 = le32_to_cpu(color);
   543	
   544				/* write blue-green-red to output in little endianness */
   545				iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
   546				iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
   547				iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
   548			}
   549		}
   550	}
   551	
   552	static void drm_fb_fill32(struct iosys_map *dmap, unsigned int dpitch,
   553				  unsigned int height, unsigned int width,
   554				  u32 color)
   555	{
   556		unsigned int l, x;
   557	
   558		for (l = 0; l < height; l++)
   559			for (x = 0; x < width; x++)
   560				iosys_map_wr(dmap, l * dpitch + x * sizeof(u32), u32, color);
   561	}
   562	
   563	/**
   564	 * drm_fb_fill - Fill a rectangle with a color
   565	 * @dmap: destination iosys_map, pointing to the top left corner of the rectangle
   566	 * @dpich: destination pitch in bytes
   567	 * @height: height of the rectangle, in pixels
   568	 * @width: width of the rectangle, in pixels
   569	 * @fg_color: foreground color, in destination format
   570	 * @bg_color: background color, in destination format
   571	 * @pixel_width: pixel width in bytes
   572	 *
   573	 * Fill a rectangle with a color, in a linear framebuffer.
   574	 */
   575	void drm_fb_fill(struct iosys_map *dmap, unsigned int dpitch,
   576				 unsigned int height, unsigned int width,
   577				 u32 color, unsigned int pixel_width)
 > 578	{
   579		switch (pixel_width) {
   580		case 1:
   581			drm_fb_fill8(dmap, dpitch, height, width, color);
   582		break;
   583		case 2:
   584			drm_fb_fill16(dmap, dpitch, height, width, color);
   585		break;
   586		case 3:
   587			drm_fb_fill24(dmap, dpitch, height, width, color);
   588		break;
   589		case 4:
   590			drm_fb_fill32(dmap, dpitch, height, width, color);
   591		break;
   592		default:
   593			WARN_ONCE(1, "Can't fill with pixel width %d\n", pixel_width);
   594		}
   595	}
   596	EXPORT_SYMBOL(drm_fb_fill);
   597	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
