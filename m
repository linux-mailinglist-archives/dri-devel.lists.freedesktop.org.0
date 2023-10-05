Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA797B9CAE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D24710E1EC;
	Thu,  5 Oct 2023 11:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CE610E1D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696504131; x=1728040131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P7LR0DpIo5Vob0V5yKwN7V6Rn4NQx4Y7ngQH1zuqdP4=;
 b=n6ZsAqS8EbqHvY65DPF8rHdnx37lnDzQ7N1b2/91p3TF3/O+u4D78iBe
 dZ17UKOF/QBsbbAaIEAn2CH6/6fQ5ETByFpfBNObYUxNYdf/EWpa1ePg5
 ntTtd0Udw58ZKsmen5s2z0rxHGpYIK0PF5nsJAFFXpksCDAgddV/3+WU+
 MRlL5kbJ+cxVjCvaODVk9Z5Q9yCp2yJbZJdAKoN/Y1tIcxS1N24zPIyMg
 j8LnzBwM2p23Lmz2OAjX+Cfvir/kEmyjKy6f5ZIzujtSGsd3z3mOE3Thc
 s0HTudvVPwh35ajbJ34QDJURaK4RYb1dynGG2DEL87VE5Zhl9zu1ILcjZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469738481"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="469738481"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 04:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="745413908"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="745413908"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 05 Oct 2023 04:07:33 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qoMCZ-000LK2-0I;
 Thu, 05 Oct 2023 11:07:31 +0000
Date: Thu, 5 Oct 2023 19:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state
 to helpers
Message-ID: <202310051822.r1l9UoUq-lkp@intel.com>
References: <20231005090520.16511-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005090520.16511-4-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Lechner <david@lechnology.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 57d3b83a83c5527325efb5bcaf594da09fe4a41b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-format-helper-Cache-buffers-with-struct-drm_format_conv_state/20231005-170643
base:   57d3b83a83c5527325efb5bcaf594da09fe4a41b
patch link:    https://lore.kernel.org/r/20231005090520.16511-4-tzimmermann%40suse.de
patch subject: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state to helpers
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310051822.r1l9UoUq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051822.r1l9UoUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051822.r1l9UoUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_format_helper.c:344: warning: Function parameter or member 'state' not described in 'drm_fb_swab'
>> drivers/gpu/drm/drm_format_helper.c:344: warning: Excess function parameter 'xfrm' description in 'drm_fb_swab'
>> drivers/gpu/drm/drm_format_helper.c:405: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_rgb332'
>> drivers/gpu/drm/drm_format_helper.c:405: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_rgb332'
>> drivers/gpu/drm/drm_format_helper.c:477: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_rgb565'
>> drivers/gpu/drm/drm_format_helper.c:477: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_rgb565'
>> drivers/gpu/drm/drm_format_helper.c:535: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_xrgb1555'
>> drivers/gpu/drm/drm_format_helper.c:535: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_xrgb1555'
>> drivers/gpu/drm/drm_format_helper.c:588: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_argb1555'
>> drivers/gpu/drm/drm_format_helper.c:588: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_argb1555'
>> drivers/gpu/drm/drm_format_helper.c:641: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_rgba5551'
>> drivers/gpu/drm/drm_format_helper.c:641: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_rgba5551'
>> drivers/gpu/drm/drm_format_helper.c:692: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_rgb888'
>> drivers/gpu/drm/drm_format_helper.c:692: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_rgb888'
>> drivers/gpu/drm/drm_format_helper.c:741: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_argb8888'
>> drivers/gpu/drm/drm_format_helper.c:741: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_argb8888'
>> drivers/gpu/drm/drm_format_helper.c:857: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_xrgb2101010'
>> drivers/gpu/drm/drm_format_helper.c:857: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_xrgb2101010'
>> drivers/gpu/drm/drm_format_helper.c:912: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_argb2101010'
>> drivers/gpu/drm/drm_format_helper.c:912: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_argb2101010'
   drivers/gpu/drm/drm_format_helper.c:968: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_gray8'
   drivers/gpu/drm/drm_format_helper.c:968: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_gray8'
   drivers/gpu/drm/drm_format_helper.c:1007: warning: Function parameter or member 'state' not described in 'drm_fb_blit'
   drivers/gpu/drm/drm_format_helper.c:1007: warning: Excess function parameter 'xfrm' description in 'drm_fb_blit'
   drivers/gpu/drm/drm_format_helper.c:1114: warning: Function parameter or member 'state' not described in 'drm_fb_xrgb8888_to_mono'
   drivers/gpu/drm/drm_format_helper.c:1114: warning: Excess function parameter 'xfrm' description in 'drm_fb_xrgb8888_to_mono'


vim +344 drivers/gpu/drm/drm_format_helper.c

41fd6f0a6dd62d Thomas Zimmermann  2022-04-27  317  
7415287e1f3675 Gerd Hoffmann      2019-04-05  318  /**
bd34cea2a0e4b0 Noralf Trønnes     2020-05-09  319   * drm_fb_swab - Swap bytes into clip buffer
ce582859ca7b33 Thomas Zimmermann  2022-08-08  320   * @dst: Array of destination buffers
ce582859ca7b33 Thomas Zimmermann  2022-08-08  321   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
ce582859ca7b33 Thomas Zimmermann  2022-08-08  322   *             within @dst; can be NULL if scanlines are stored next to each other.
504a51d70f86e3 Thomas Zimmermann  2022-08-08  323   * @src: Array of source buffers
7415287e1f3675 Gerd Hoffmann      2019-04-05  324   * @fb: DRM framebuffer
7415287e1f3675 Gerd Hoffmann      2019-04-05  325   * @clip: Clip rectangle area to copy
bd34cea2a0e4b0 Noralf Trønnes     2020-05-09  326   * @cached: Source buffer is mapped cached (eg. not write-combined)
05864d296c0bfc Thomas Zimmermann  2023-10-05  327   * @xfrm: Transform and conversion state
bd34cea2a0e4b0 Noralf Trønnes     2020-05-09  328   *
ce582859ca7b33 Thomas Zimmermann  2022-08-08  329   * This function copies parts of a framebuffer to display memory and swaps per-pixel
ce582859ca7b33 Thomas Zimmermann  2022-08-08  330   * bytes during the process. Destination and framebuffer formats must match. The
504a51d70f86e3 Thomas Zimmermann  2022-08-08  331   * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
ce582859ca7b33 Thomas Zimmermann  2022-08-08  332   * least as many entries as there are planes in @fb's format. Each entry stores the
ce582859ca7b33 Thomas Zimmermann  2022-08-08  333   * value for the format's respective color plane at the same index. If @cached is
ce582859ca7b33 Thomas Zimmermann  2022-08-08  334   * false a temporary buffer is used to cache one pixel line at a time to speed up
ce582859ca7b33 Thomas Zimmermann  2022-08-08  335   * slow uncached reads.
bd34cea2a0e4b0 Noralf Trønnes     2020-05-09  336   *
ce582859ca7b33 Thomas Zimmermann  2022-08-08  337   * This function does not apply clipping on @dst (i.e. the destination is at the
ce582859ca7b33 Thomas Zimmermann  2022-08-08  338   * top-left corner).
7415287e1f3675 Gerd Hoffmann      2019-04-05  339   */
ce582859ca7b33 Thomas Zimmermann  2022-08-08  340  void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
504a51d70f86e3 Thomas Zimmermann  2022-08-08  341  		 const struct iosys_map *src, const struct drm_framebuffer *fb,
05864d296c0bfc Thomas Zimmermann  2023-10-05  342  		 const struct drm_rect *clip, bool cached,
05864d296c0bfc Thomas Zimmermann  2023-10-05  343  		 struct drm_format_conv_state *state)
7415287e1f3675 Gerd Hoffmann      2019-04-05 @344  {
ce582859ca7b33 Thomas Zimmermann  2022-08-08  345  	const struct drm_format_info *format = fb->format;
ce582859ca7b33 Thomas Zimmermann  2022-08-08  346  	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
ce582859ca7b33 Thomas Zimmermann  2022-08-08  347  	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
3e3543c8a19cad Thomas Zimmermann  2021-11-10  348  
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  349  	switch (cpp) {
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  350  	case 4:
ce582859ca7b33 Thomas Zimmermann  2022-08-08  351  		swab_line = drm_fb_swab32_line;
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  352  		break;
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  353  	case 2:
ce582859ca7b33 Thomas Zimmermann  2022-08-08  354  		swab_line = drm_fb_swab16_line;
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  355  		break;
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  356  	default:
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  357  		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
ce582859ca7b33 Thomas Zimmermann  2022-08-08  358  			      &format->format);
ce582859ca7b33 Thomas Zimmermann  2022-08-08  359  		return;
f241b064426943 Thomas Zimmermann  2022-08-08  360  	}
ce582859ca7b33 Thomas Zimmermann  2022-08-08  361  
05864d296c0bfc Thomas Zimmermann  2023-10-05  362  	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, state, swab_line);
7415287e1f3675 Gerd Hoffmann      2019-04-05  363  }
bd34cea2a0e4b0 Noralf Trønnes     2020-05-09  364  EXPORT_SYMBOL(drm_fb_swab);
7415287e1f3675 Gerd Hoffmann      2019-04-05  365  
cce6bedb38ed08 Thomas Zimmermann  2022-04-27  366  static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  367  {
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  368  	u8 *dbuf8 = dbuf;
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  369  	const __le32 *sbuf32 = sbuf;
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  370  	unsigned int x;
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  371  	u32 pix;
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  372  
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  373  	for (x = 0; x < pixels; x++) {
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  374  		pix = le32_to_cpu(sbuf32[x]);
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  375  		dbuf8[x] = ((pix & 0x00e00000) >> 16) |
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  376  			   ((pix & 0x0000e000) >> 11) |
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  377  			   ((pix & 0x000000c0) >> 6);
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  378  	}
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  379  }
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  380  
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  381  /**
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  382   * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
e13140a0628314 Thomas Zimmermann  2022-08-08  383   * @dst: Array of RGB332 destination buffers
e13140a0628314 Thomas Zimmermann  2022-08-08  384   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
e13140a0628314 Thomas Zimmermann  2022-08-08  385   *             within @dst; can be NULL if scanlines are stored next to each other.
504a51d70f86e3 Thomas Zimmermann  2022-08-08  386   * @src: Array of XRGB8888 source buffers
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  387   * @fb: DRM framebuffer
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  388   * @clip: Clip rectangle area to copy
05864d296c0bfc Thomas Zimmermann  2023-10-05  389   * @xfrm: Transform and conversion state
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  390   *
e13140a0628314 Thomas Zimmermann  2022-08-08  391   * This function copies parts of a framebuffer to display memory and converts the
e13140a0628314 Thomas Zimmermann  2022-08-08  392   * color format during the process. Destination and framebuffer formats must match. The
504a51d70f86e3 Thomas Zimmermann  2022-08-08  393   * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
e13140a0628314 Thomas Zimmermann  2022-08-08  394   * least as many entries as there are planes in @fb's format. Each entry stores the
e13140a0628314 Thomas Zimmermann  2022-08-08  395   * value for the format's respective color plane at the same index.
e13140a0628314 Thomas Zimmermann  2022-08-08  396   *
e13140a0628314 Thomas Zimmermann  2022-08-08  397   * This function does not apply clipping on @dst (i.e. the destination is at the
e13140a0628314 Thomas Zimmermann  2022-08-08  398   * top-left corner).
e13140a0628314 Thomas Zimmermann  2022-08-08  399   *
e13140a0628314 Thomas Zimmermann  2022-08-08  400   * Drivers can use this function for RGB332 devices that don't support XRGB8888 natively.
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  401   */
e13140a0628314 Thomas Zimmermann  2022-08-08  402  void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
504a51d70f86e3 Thomas Zimmermann  2022-08-08  403  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
05864d296c0bfc Thomas Zimmermann  2023-10-05  404  			       const struct drm_rect *clip, struct drm_format_conv_state *state)
cee0b7cbf1c02f Noralf Trønnes     2021-09-29 @405  {
f241b064426943 Thomas Zimmermann  2022-08-08  406  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
f241b064426943 Thomas Zimmermann  2022-08-08  407  		1,
e13140a0628314 Thomas Zimmermann  2022-08-08  408  	};
e13140a0628314 Thomas Zimmermann  2022-08-08  409  
05864d296c0bfc Thomas Zimmermann  2023-10-05  410  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
f241b064426943 Thomas Zimmermann  2022-08-08  411  		    drm_fb_xrgb8888_to_rgb332_line);
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  412  }
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  413  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
cee0b7cbf1c02f Noralf Trønnes     2021-09-29  414  
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  415  static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
bcc4442008aca0 Gerd Hoffmann      2019-04-05  416  {
f21d62c9ce3db2 Thomas Zimmermann  2023-01-02  417  	__le16 *dbuf16 = dbuf;
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  418  	const __le32 *sbuf32 = sbuf;
d653bd39482377 Gerd Hoffmann      2019-04-10  419  	unsigned int x;
d653bd39482377 Gerd Hoffmann      2019-04-10  420  	u16 val16;
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  421  	u32 pix;
bcc4442008aca0 Gerd Hoffmann      2019-04-05  422  
d653bd39482377 Gerd Hoffmann      2019-04-10  423  	for (x = 0; x < pixels; x++) {
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  424  		pix = le32_to_cpu(sbuf32[x]);
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  425  		val16 = ((pix & 0x00F80000) >> 8) |
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  426  			((pix & 0x0000FC00) >> 5) |
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  427  			((pix & 0x000000F8) >> 3);
f21d62c9ce3db2 Thomas Zimmermann  2023-01-02  428  		dbuf16[x] = cpu_to_le16(val16);
bcc4442008aca0 Gerd Hoffmann      2019-04-05  429  	}
bcc4442008aca0 Gerd Hoffmann      2019-04-05  430  }
bcc4442008aca0 Gerd Hoffmann      2019-04-05  431  
f21d62c9ce3db2 Thomas Zimmermann  2023-01-02  432  /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
a6fdb669bb6523 Thomas Zimmermann  2022-04-27  433  static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
69add027fd2bac Thomas Zimmermann  2022-04-27  434  						unsigned int pixels)
69add027fd2bac Thomas Zimmermann  2022-04-27  435  {
f21d62c9ce3db2 Thomas Zimmermann  2023-01-02  436  	__le16 *dbuf16 = dbuf;
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  437  	const __le32 *sbuf32 = sbuf;
69add027fd2bac Thomas Zimmermann  2022-04-27  438  	unsigned int x;
69add027fd2bac Thomas Zimmermann  2022-04-27  439  	u16 val16;
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  440  	u32 pix;
69add027fd2bac Thomas Zimmermann  2022-04-27  441  
69add027fd2bac Thomas Zimmermann  2022-04-27  442  	for (x = 0; x < pixels; x++) {
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  443  		pix = le32_to_cpu(sbuf32[x]);
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  444  		val16 = ((pix & 0x00F80000) >> 8) |
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  445  			((pix & 0x0000FC00) >> 5) |
4d9db10576ff51 Geert Uytterhoeven 2022-07-08  446  			((pix & 0x000000F8) >> 3);
f21d62c9ce3db2 Thomas Zimmermann  2023-01-02  447  		dbuf16[x] = cpu_to_le16(swab16(val16));
69add027fd2bac Thomas Zimmermann  2022-04-27  448  	}
69add027fd2bac Thomas Zimmermann  2022-04-27  449  }
69add027fd2bac Thomas Zimmermann  2022-04-27  450  
7415287e1f3675 Gerd Hoffmann      2019-04-05  451  /**
7415287e1f3675 Gerd Hoffmann      2019-04-05  452   * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
ab298c29d414a5 Thomas Zimmermann  2022-08-08  453   * @dst: Array of RGB565 destination buffers
ab298c29d414a5 Thomas Zimmermann  2022-08-08  454   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
ab298c29d414a5 Thomas Zimmermann  2022-08-08  455   *             within @dst; can be NULL if scanlines are stored next to each other.
504a51d70f86e3 Thomas Zimmermann  2022-08-08  456   * @src: Array of XRGB8888 source buffer
7415287e1f3675 Gerd Hoffmann      2019-04-05  457   * @fb: DRM framebuffer
7415287e1f3675 Gerd Hoffmann      2019-04-05  458   * @clip: Clip rectangle area to copy
05864d296c0bfc Thomas Zimmermann  2023-10-05  459   * @xfrm: Transform and conversion state
d653bd39482377 Gerd Hoffmann      2019-04-10  460   * @swab: Swap bytes
7415287e1f3675 Gerd Hoffmann      2019-04-05  461   *
ab298c29d414a5 Thomas Zimmermann  2022-08-08  462   * This function copies parts of a framebuffer to display memory and converts the
ab298c29d414a5 Thomas Zimmermann  2022-08-08  463   * color format during the process. Destination and framebuffer formats must match. The
504a51d70f86e3 Thomas Zimmermann  2022-08-08  464   * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
ab298c29d414a5 Thomas Zimmermann  2022-08-08  465   * least as many entries as there are planes in @fb's format. Each entry stores the
ab298c29d414a5 Thomas Zimmermann  2022-08-08  466   * value for the format's respective color plane at the same index.
bcc4442008aca0 Gerd Hoffmann      2019-04-05  467   *
ab298c29d414a5 Thomas Zimmermann  2022-08-08  468   * This function does not apply clipping on @dst (i.e. the destination is at the
ab298c29d414a5 Thomas Zimmermann  2022-08-08  469   * top-left corner).
ab298c29d414a5 Thomas Zimmermann  2022-08-08  470   *
ab298c29d414a5 Thomas Zimmermann  2022-08-08  471   * Drivers can use this function for RGB565 devices that don't support XRGB8888 natively.
bcc4442008aca0 Gerd Hoffmann      2019-04-05  472   */
ab298c29d414a5 Thomas Zimmermann  2022-08-08  473  void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
504a51d70f86e3 Thomas Zimmermann  2022-08-08  474  			       const struct iosys_map *src, const struct drm_framebuffer *fb,
05864d296c0bfc Thomas Zimmermann  2023-10-05  475  			       const struct drm_rect *clip, struct drm_format_conv_state *state,
05864d296c0bfc Thomas Zimmermann  2023-10-05  476  			       bool swab)
bcc4442008aca0 Gerd Hoffmann      2019-04-05 @477  {
f241b064426943 Thomas Zimmermann  2022-08-08  478  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
f241b064426943 Thomas Zimmermann  2022-08-08  479  		2,
ab298c29d414a5 Thomas Zimmermann  2022-08-08  480  	};
f241b064426943 Thomas Zimmermann  2022-08-08  481  
ab298c29d414a5 Thomas Zimmermann  2022-08-08  482  	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
ab298c29d414a5 Thomas Zimmermann  2022-08-08  483  
69add027fd2bac Thomas Zimmermann  2022-04-27  484  	if (swab)
ab298c29d414a5 Thomas Zimmermann  2022-08-08  485  		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
ab298c29d414a5 Thomas Zimmermann  2022-08-08  486  	else
ab298c29d414a5 Thomas Zimmermann  2022-08-08  487  		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
ab298c29d414a5 Thomas Zimmermann  2022-08-08  488  
05864d296c0bfc Thomas Zimmermann  2023-10-05  489  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state, xfrm_line);
7415287e1f3675 Gerd Hoffmann      2019-04-05  490  }
ab298c29d414a5 Thomas Zimmermann  2022-08-08  491  EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
7415287e1f3675 Gerd Hoffmann      2019-04-05  492  
10cd592e639edc Thomas Zimmermann  2023-01-02  493  static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
10cd592e639edc Thomas Zimmermann  2023-01-02  494  {
10cd592e639edc Thomas Zimmermann  2023-01-02  495  	__le16 *dbuf16 = dbuf;
10cd592e639edc Thomas Zimmermann  2023-01-02  496  	const __le32 *sbuf32 = sbuf;
10cd592e639edc Thomas Zimmermann  2023-01-02  497  	unsigned int x;
10cd592e639edc Thomas Zimmermann  2023-01-02  498  	u16 val16;
10cd592e639edc Thomas Zimmermann  2023-01-02  499  	u32 pix;
10cd592e639edc Thomas Zimmermann  2023-01-02  500  
10cd592e639edc Thomas Zimmermann  2023-01-02  501  	for (x = 0; x < pixels; x++) {
10cd592e639edc Thomas Zimmermann  2023-01-02  502  		pix = le32_to_cpu(sbuf32[x]);
10cd592e639edc Thomas Zimmermann  2023-01-02  503  		val16 = ((pix & 0x00f80000) >> 9) |
10cd592e639edc Thomas Zimmermann  2023-01-02  504  			((pix & 0x0000f800) >> 6) |
10cd592e639edc Thomas Zimmermann  2023-01-02  505  			((pix & 0x000000f8) >> 3);
10cd592e639edc Thomas Zimmermann  2023-01-02  506  		dbuf16[x] = cpu_to_le16(val16);
10cd592e639edc Thomas Zimmermann  2023-01-02  507  	}
10cd592e639edc Thomas Zimmermann  2023-01-02  508  }
10cd592e639edc Thomas Zimmermann  2023-01-02  509  
10cd592e639edc Thomas Zimmermann  2023-01-02  510  /**
10cd592e639edc Thomas Zimmermann  2023-01-02  511   * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
10cd592e639edc Thomas Zimmermann  2023-01-02  512   * @dst: Array of XRGB1555 destination buffers
10cd592e639edc Thomas Zimmermann  2023-01-02  513   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
10cd592e639edc Thomas Zimmermann  2023-01-02  514   *             within @dst; can be NULL if scanlines are stored next to each other.
10cd592e639edc Thomas Zimmermann  2023-01-02  515   * @src: Array of XRGB8888 source buffer
10cd592e639edc Thomas Zimmermann  2023-01-02  516   * @fb: DRM framebuffer
10cd592e639edc Thomas Zimmermann  2023-01-02  517   * @clip: Clip rectangle area to copy
05864d296c0bfc Thomas Zimmermann  2023-10-05  518   * @xfrm: Transform and conversion state
10cd592e639edc Thomas Zimmermann  2023-01-02  519   *
10cd592e639edc Thomas Zimmermann  2023-01-02  520   * This function copies parts of a framebuffer to display memory and converts
10cd592e639edc Thomas Zimmermann  2023-01-02  521   * the color format during the process. The parameters @dst, @dst_pitch and
10cd592e639edc Thomas Zimmermann  2023-01-02  522   * @src refer to arrays. Each array must have at least as many entries as
10cd592e639edc Thomas Zimmermann  2023-01-02  523   * there are planes in @fb's format. Each entry stores the value for the
10cd592e639edc Thomas Zimmermann  2023-01-02  524   * format's respective color plane at the same index.
10cd592e639edc Thomas Zimmermann  2023-01-02  525   *
10cd592e639edc Thomas Zimmermann  2023-01-02  526   * This function does not apply clipping on @dst (i.e. the destination is at the
10cd592e639edc Thomas Zimmermann  2023-01-02  527   * top-left corner).
10cd592e639edc Thomas Zimmermann  2023-01-02  528   *
10cd592e639edc Thomas Zimmermann  2023-01-02  529   * Drivers can use this function for XRGB1555 devices that don't support
10cd592e639edc Thomas Zimmermann  2023-01-02  530   * XRGB8888 natively.
10cd592e639edc Thomas Zimmermann  2023-01-02  531   */
10cd592e639edc Thomas Zimmermann  2023-01-02  532  void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
10cd592e639edc Thomas Zimmermann  2023-01-02  533  				 const struct iosys_map *src, const struct drm_framebuffer *fb,
05864d296c0bfc Thomas Zimmermann  2023-10-05  534  				 const struct drm_rect *clip, struct drm_format_conv_state *state)
10cd592e639edc Thomas Zimmermann  2023-01-02 @535  {
10cd592e639edc Thomas Zimmermann  2023-01-02  536  	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
10cd592e639edc Thomas Zimmermann  2023-01-02  537  		2,
10cd592e639edc Thomas Zimmermann  2023-01-02  538  	};
10cd592e639edc Thomas Zimmermann  2023-01-02  539  
05864d296c0bfc Thomas Zimmermann  2023-10-05  540  	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
10cd592e639edc Thomas Zimmermann  2023-01-02  541  		    drm_fb_xrgb8888_to_xrgb1555_line);
10cd592e639edc Thomas Zimmermann  2023-01-02  542  }
10cd592e639edc Thomas Zimmermann  2023-01-02  543  EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
10cd592e639edc Thomas Zimmermann  2023-01-02  544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
