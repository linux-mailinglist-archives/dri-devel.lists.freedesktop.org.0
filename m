Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A77B6D82
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 17:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE5310E004;
	Tue,  3 Oct 2023 15:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A610E004
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 15:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696348623; x=1727884623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FkOFr7z5jWjxWgEUNS79SiFGMKt+PxoBy437RMrHOEk=;
 b=Gblh56O5H3Pxwh8PDHSVjKkvkXPNKCGsfh8z12RYeVOCjGEeCzDsJwpo
 OneX5oB/KV10Umb3Zob2Na9HW5/oRyqWd4GzcM6BvrABCW2HIPNHf+6hz
 03Y3nxDFcjEtL07qIKY5Wsw6ZkvsHac0E99bXFUnbLVfRXY6+Hox8kNT4
 4mNyf44SBpDHu1YfGuxHTHpgABh8Z4F/QwAqB/O3idljk6LHnZul3eked
 o/DVCHnykFM1Ote8YfyFGZODrBqZa3qxGqLwz4ptCzev3jAb2YKwp8vub
 Y3BKXrDPM2mUD1LvCRfPxwgl91MmZhajGHQINBCNF93Bp1moFTIn43Dt3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380187316"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="380187316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 08:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754496112"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754496112"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2023 08:56:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qnhlZ-0007Fo-06;
 Tue, 03 Oct 2023 15:56:57 +0000
Date: Tue, 3 Oct 2023 23:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: Re: [PATCH v4 1/4] drm/format-helper: Export line conversion helper
 for drm_panic
Message-ID: <202310032302.DqsgLDE3-lkp@intel.com>
References: <20231003142508.190246-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003142508.190246-2-jfalempe@redhat.com>
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

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Export-line-conversion-helper-for-drm_panic/20231003-222642
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20231003142508.190246-2-jfalempe%40redhat.com
patch subject: [PATCH v4 1/4] drm/format-helper: Export line conversion helper for drm_panic
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310032302.DqsgLDE3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310032302.DqsgLDE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032302.DqsgLDE3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_format_helper.c:436: warning: expecting prototype for drm_fb_xrgb8888_to_rgb565_line(). Prototype was for drm_fb_xrgb8888_to_xrgb1555_line() instead
>> drivers/gpu/drm/drm_format_helper.c:494: warning: expecting prototype for drm_fb_xrgb8888_to_rgb565_line(). Prototype was for drm_fb_xrgb8888_to_argb1555_line() instead
>> drivers/gpu/drm/drm_format_helper.c:777: warning: expecting prototype for drm_fb_xrgb8888_to_rgb888_line(). Prototype was for drm_fb_xrgb8888_to_xrgb2101010_line() instead
>> drivers/gpu/drm/drm_format_helper.c:836: warning: expecting prototype for drm_fb_xrgb8888_to_rgb888_line(). Prototype was for drm_fb_xrgb8888_to_argb2101010_line() instead


vim +436 drivers/gpu/drm/drm_format_helper.c

7415287e1f3675 Gerd Hoffmann     2019-04-05  428  
ce913131bdeb03 Jocelyn Falempe   2023-10-03  429  /**
ce913131bdeb03 Jocelyn Falempe   2023-10-03  430   * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to XRGB1555
ce913131bdeb03 Jocelyn Falempe   2023-10-03  431   * @dbuf: Pointer to the destination line (in XRGB1555)
ce913131bdeb03 Jocelyn Falempe   2023-10-03  432   * @sbuf: Pointer to the source line (in XRGB8888)
ce913131bdeb03 Jocelyn Falempe   2023-10-03  433   * @pixels: Number of pixels to convert.
ce913131bdeb03 Jocelyn Falempe   2023-10-03  434   */
ce913131bdeb03 Jocelyn Falempe   2023-10-03  435  void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
10cd592e639edc Thomas Zimmermann 2023-01-02 @436  {
10cd592e639edc Thomas Zimmermann 2023-01-02  437  	__le16 *dbuf16 = dbuf;
10cd592e639edc Thomas Zimmermann 2023-01-02  438  	const __le32 *sbuf32 = sbuf;
10cd592e639edc Thomas Zimmermann 2023-01-02  439  	unsigned int x;
10cd592e639edc Thomas Zimmermann 2023-01-02  440  	u16 val16;
10cd592e639edc Thomas Zimmermann 2023-01-02  441  	u32 pix;
10cd592e639edc Thomas Zimmermann 2023-01-02  442  
10cd592e639edc Thomas Zimmermann 2023-01-02  443  	for (x = 0; x < pixels; x++) {
10cd592e639edc Thomas Zimmermann 2023-01-02  444  		pix = le32_to_cpu(sbuf32[x]);
10cd592e639edc Thomas Zimmermann 2023-01-02  445  		val16 = ((pix & 0x00f80000) >> 9) |
10cd592e639edc Thomas Zimmermann 2023-01-02  446  			((pix & 0x0000f800) >> 6) |
10cd592e639edc Thomas Zimmermann 2023-01-02  447  			((pix & 0x000000f8) >> 3);
10cd592e639edc Thomas Zimmermann 2023-01-02  448  		dbuf16[x] = cpu_to_le16(val16);
10cd592e639edc Thomas Zimmermann 2023-01-02  449  	}
10cd592e639edc Thomas Zimmermann 2023-01-02  450  }
ce913131bdeb03 Jocelyn Falempe   2023-10-03  451  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555_line);
10cd592e639edc Thomas Zimmermann 2023-01-02  452  
10cd592e639edc Thomas Zimmermann 2023-01-02  453  /**
10cd592e639edc Thomas Zimmermann 2023-01-02  454   * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
10cd592e639edc Thomas Zimmermann 2023-01-02  455   * @dst: Array of XRGB1555 destination buffers
10cd592e639edc Thomas Zimmermann 2023-01-02  456   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
10cd592e639edc Thomas Zimmermann 2023-01-02  457   *             within @dst; can be NULL if scanlines are stored next to each other.
10cd592e639edc Thomas Zimmermann 2023-01-02  458   * @src: Array of XRGB8888 source buffer
10cd592e639edc Thomas Zimmermann 2023-01-02  459   * @fb: DRM framebuffer
10cd592e639edc Thomas Zimmermann 2023-01-02  460   * @clip: Clip rectangle area to copy
10cd592e639edc Thomas Zimmermann 2023-01-02  461   *
10cd592e639edc Thomas Zimmermann 2023-01-02  462   * This function copies parts of a framebuffer to display memory and converts
10cd592e639edc Thomas Zimmermann 2023-01-02  463   * the color format during the process. The parameters @dst, @dst_pitch and
10cd592e639edc Thomas Zimmermann 2023-01-02  464   * @src refer to arrays. Each array must have at least as many entries as
10cd592e639edc Thomas Zimmermann 2023-01-02  465   * there are planes in @fb's format. Each entry stores the value for the
10cd592e639edc Thomas Zimmermann 2023-01-02  466   * format's respective color plane at the same index.
10cd592e639edc Thomas Zimmermann 2023-01-02  467   *
10cd592e639edc Thomas Zimmermann 2023-01-02  468   * This function does not apply clipping on @dst (i.e. the destination is at the
10cd592e639edc Thomas Zimmermann 2023-01-02  469   * top-left corner).
10cd592e639edc Thomas Zimmermann 2023-01-02  470   *
10cd592e639edc Thomas Zimmermann 2023-01-02  471   * Drivers can use this function for XRGB1555 devices that don't support
10cd592e639edc Thomas Zimmermann 2023-01-02  472   * XRGB8888 natively.
10cd592e639edc Thomas Zimmermann 2023-01-02  473   */
10cd592e639edc Thomas Zimmermann 2023-01-02  474  void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
10cd592e639edc Thomas Zimmermann 2023-01-02  475  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
10cd592e639edc Thomas Zimmermann 2023-01-02  476  				 const struct drm_rect *clip)
10cd592e639edc Thomas Zimmermann 2023-01-02  477  {
10cd592e639edc Thomas Zimmermann 2023-01-02  478  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
10cd592e639edc Thomas Zimmermann 2023-01-02  479  		2,
10cd592e639edc Thomas Zimmermann 2023-01-02  480  	};
10cd592e639edc Thomas Zimmermann 2023-01-02  481  
10cd592e639edc Thomas Zimmermann 2023-01-02  482  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
10cd592e639edc Thomas Zimmermann 2023-01-02  483  		    drm_fb_xrgb8888_to_xrgb1555_line);
10cd592e639edc Thomas Zimmermann 2023-01-02  484  }
10cd592e639edc Thomas Zimmermann 2023-01-02  485  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
10cd592e639edc Thomas Zimmermann 2023-01-02  486  
ce913131bdeb03 Jocelyn Falempe   2023-10-03  487  /**
ce913131bdeb03 Jocelyn Falempe   2023-10-03  488   * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to ARGB1555
ce913131bdeb03 Jocelyn Falempe   2023-10-03  489   * @dbuf: Pointer to the destination line (in ARGB1555)
ce913131bdeb03 Jocelyn Falempe   2023-10-03  490   * @sbuf: Pointer to the source line (in XRGB8888)
ce913131bdeb03 Jocelyn Falempe   2023-10-03  491   * @pixels: Number of pixels to convert.
ce913131bdeb03 Jocelyn Falempe   2023-10-03  492   */
ce913131bdeb03 Jocelyn Falempe   2023-10-03  493  void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
10cd592e639edc Thomas Zimmermann 2023-01-02 @494  {
10cd592e639edc Thomas Zimmermann 2023-01-02  495  	__le16 *dbuf16 = dbuf;
10cd592e639edc Thomas Zimmermann 2023-01-02  496  	const __le32 *sbuf32 = sbuf;
10cd592e639edc Thomas Zimmermann 2023-01-02  497  	unsigned int x;
10cd592e639edc Thomas Zimmermann 2023-01-02  498  	u16 val16;
10cd592e639edc Thomas Zimmermann 2023-01-02  499  	u32 pix;
10cd592e639edc Thomas Zimmermann 2023-01-02  500  
10cd592e639edc Thomas Zimmermann 2023-01-02  501  	for (x = 0; x < pixels; x++) {
10cd592e639edc Thomas Zimmermann 2023-01-02  502  		pix = le32_to_cpu(sbuf32[x]);
10cd592e639edc Thomas Zimmermann 2023-01-02  503  		val16 = BIT(15) | /* set alpha bit */
10cd592e639edc Thomas Zimmermann 2023-01-02  504  			((pix & 0x00f80000) >> 9) |
10cd592e639edc Thomas Zimmermann 2023-01-02  505  			((pix & 0x0000f800) >> 6) |
10cd592e639edc Thomas Zimmermann 2023-01-02  506  			((pix & 0x000000f8) >> 3);
10cd592e639edc Thomas Zimmermann 2023-01-02  507  		dbuf16[x] = cpu_to_le16(val16);
10cd592e639edc Thomas Zimmermann 2023-01-02  508  	}
10cd592e639edc Thomas Zimmermann 2023-01-02  509  }
ce913131bdeb03 Jocelyn Falempe   2023-10-03  510  EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555_line);
10cd592e639edc Thomas Zimmermann 2023-01-02  511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
