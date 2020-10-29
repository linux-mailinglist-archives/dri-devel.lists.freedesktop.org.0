Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3729EC14
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 13:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366026ECBF;
	Thu, 29 Oct 2020 12:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE53D6E8AB;
 Thu, 29 Oct 2020 12:42:42 +0000 (UTC)
IronPort-SDR: bfUL1fy4JsPXkgpBojfYSemNbLqr8LE2IiOZfKwyoNwMLp4zKwPBbtkCpglgPjJ8WZMh9wLPUj
 j/lZco1igeEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="232605176"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
 d="gz'50?scan'50,208,50";a="232605176"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 05:42:41 -0700
IronPort-SDR: t2ImNopetK0Sitclt6i4oKyo9jr5LUNTuGZE+dOmbTUFI7p2ggPaDienTATjsuNs9CXNZGTn6b
 zLMNaiL8q1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
 d="gz'50?scan'50,208,50";a="526719191"
Received: from lkp-server01.sh.intel.com (HELO c01187be935a) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2020 05:42:38 -0700
Received: from kbuild by c01187be935a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kY7GH-00005U-BV; Thu, 29 Oct 2020 12:42:37 +0000
Date: Thu, 29 Oct 2020 20:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] fbcon: Disable accelerated scrolling
Message-ID: <202010292041.qMkMzT2E-lkp@intel.com>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next linus/master drm/drm-next v5.10-rc1 next-20201028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/fbcon-Disable-accelerated-scrolling/20201029-181618
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: sparc64-randconfig-r005-20201029 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b457f0ea024ca7202fa63f5a94f9d5abf65529f8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Vetter/fbcon-Disable-accelerated-scrolling/20201029-181618
        git checkout b457f0ea024ca7202fa63f5a94f9d5abf65529f8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sparc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
>> drivers/video/fbdev/core/fbcon.c:1089:6: warning: variable 'cap' set but not used [-Wunused-but-set-variable]
    1089 |  int cap, ret;
         |      ^~~
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
   drivers/video/fbdev/core/fbcon.c:3646:7: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
    3646 |   int pending = 0;
         |       ^~~~~~~

vim +/cap +1089 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1080  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1081  static void fbcon_init(struct vc_data *vc, int init)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1082  {
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1083  	struct fb_info *info;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1084  	struct fbcon_ops *ops;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1085  	struct vc_data **default_mode = vc->vc_display_fg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1086  	struct vc_data *svc = *default_mode;
50233393f0cf9b drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1087  	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1088  	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22 @1089  	int cap, ret;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1090  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1091  	if (WARN_ON(info_idx == -1))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1092  	    return;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2005-05-01  1093  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1094  	if (con2fb_map[vc->vc_num] == -1)
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1095  		con2fb_map[vc->vc_num] = info_idx;
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1096  
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2019-05-28  1097  	info = registered_fb[con2fb_map[vc->vc_num]];
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2005-05-01  1098  	cap = info->flags;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2005-05-01  1099  
3c5a1b111373e6 drivers/video/fbdev/core/fbcon.c Andreas Schwab            2019-05-06  1100  	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2019-02-08  1101  		logo_shown = FBCON_LOGO_DONTSHOW;
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2019-02-08  1102  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1103  	if (vc != svc || logo_shown == FBCON_LOGO_DONTSHOW ||
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1104  	    (info->fix.type == FB_TYPE_TEXT))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1105  		logo = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1106  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1107  	if (var_to_display(p, &info->var, info))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1108  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1109  
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1110  	if (!info->fbcon_par)
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1111  		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2007-07-17  1112  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1113  	/* If we are not the first console on this
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1114  	   fb, copy the font from that console */
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1115  	t = &fb_display[fg_console];
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1116  	if (!p->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1117  		if (t->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1118  			struct vc_data *fvc = vc_cons[fg_console].d;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1119  
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1120  			vc->vc_font.data = (void *)(p->fontdata =
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1121  						    fvc->vc_font.data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1122  			vc->vc_font.width = fvc->vc_font.width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1123  			vc->vc_font.height = fvc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1124  			p->userfont = t->userfont;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1125  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1126  			if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1127  				REFCOUNT(p->fontdata)++;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1128  		} else {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1129  			const struct font_desc *font = NULL;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1130  
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1131  			if (!fontname[0] || !(font = find_font(fontname)))
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1132  				font = get_default_font(info->var.xres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1133  							info->var.yres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1134  							info->pixmap.blit_x,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2007-05-08  1135  							info->pixmap.blit_y);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1136  			vc->vc_font.width = font->width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1137  			vc->vc_font.height = font->height;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1138  			vc->vc_font.data = (void *)(p->fontdata = font->data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1139  			vc->vc_font.charcount = 256; /* FIXME  Need to
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1140  							support more fonts */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1141  		}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1142  	}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1143  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1144  	if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1145  		charcnt = FNTCHARCNT(p->fontdata);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-06-26  1146  
b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas        2005-09-09  1147  	vc->vc_can_do_color = (fb_get_color_depth(&info->var, &info->fix)!=1);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1148  	vc->vc_complement_mask = vc->vc_can_do_color ? 0x7700 : 0x0800;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1149  	if (charcnt == 256) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1150  		vc->vc_hi_font_mask = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1151  	} else {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1152  		vc->vc_hi_font_mask = 0x100;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1153  		if (vc->vc_can_do_color)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1154  			vc->vc_complement_mask <<= 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1155  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1156  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1157  	if (!*svc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1158  		con_set_default_unimap(svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1159  	if (!*vc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1160  		con_copy_unimap(vc, svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1161  
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1162  	ops = info->fbcon_par;
f235f664a8afab drivers/video/console/fbcon.c    Scot Doyle                2015-10-09  1163  	ops->cur_blink_jiffies = msecs_to_jiffies(vc->vc_cur_blink_ms);
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1164  
2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz            2008-02-06  1165  	p->con_rotate = initial_rotation;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1166  	if (p->con_rotate == -1)
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1167  		p->con_rotate = info->fbcon_rotate_hint;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1168  	if (p->con_rotate == -1)
f2f4946b0adfd6 drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1169  		p->con_rotate = FB_ROTATE_UR;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2017-11-25  1170  
b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-01-09  1171  	set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1172  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1173  	cols = vc->vc_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1174  	rows = vc->vc_rows;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1175  	new_cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1176  	new_rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1177  	new_cols /= vc->vc_font.width;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1178  	new_rows /= vc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1179  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1180  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1181  	 * We must always set the mode. The mode of the previous console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1182  	 * driver could be in the same resolution but we are using different
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1183  	 * hardware so we have to initialize the hardware.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1184  	 *
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1185  	 * We need to do it in fbcon_init() to prevent screen corruption.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1186  	 */
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby                2016-06-23  1187  	if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1188  		if (info->fbops->fb_set_par &&
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1189  		    !(ops->flags & FBCON_FLAGS_INIT)) {
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1190  			ret = info->fbops->fb_set_par(info);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1191  
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1192  			if (ret)
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1193  				printk(KERN_ERR "fbcon_init: detected "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1194  					"unhandled fb_set_par error, "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1195  					"error code %d\n", ret);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1196  		}
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2009-09-22  1197  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1198  		ops->flags |= FBCON_FLAGS_INIT;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1199  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1200  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1201  	ops->graphics = 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1202  
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1203  	/*
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1204  	 * No more hw acceleration for fbcon.
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1205  	 *
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1206  	 * FIXME: Garbage collect all the now dead code after sufficient time
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1207  	 * has passed.
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2020-10-29  1208  	 */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1209  	p->scrollmode = SCROLL_REDRAW;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1210  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1211  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1212  	 *  ++guenther: console.c:vc_allocate() relies on initializing
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1213  	 *  vc_{cols,rows}, but we must not set those if we are only
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1214  	 *  resizing the console.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1215  	 */
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2009-08-06  1216  	if (init) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1217  		vc->vc_cols = new_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1218  		vc->vc_rows = new_rows;
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2009-08-06  1219  	} else
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2009-08-06  1220  		vc_resize(vc, new_cols, new_rows);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1221  
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1222  	if (logo)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1223  		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_rows);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1224  
4d9c5b6eb42d9e drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-07  1225  	if (vc == svc && softback_buf)
4d9c5b6eb42d9e drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-07  1226  		fbcon_update_softback(vc);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1227  
b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-01-09  1228  	if (ops->rotate_font && ops->rotate_font(info, vc)) {
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1229  		ops->rotate = FB_ROTATE_UR;
b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-01-09  1230  		set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1231  	}
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2005-11-08  1232  
1a37d5f51020b9 drivers/video/console/fbcon.c    Antonino A. Daplas        2006-03-31  1233  	ops->p = &fb_display[fg_console];
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1234  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2005-04-16  1235  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--HlL+5n6rz5pIUxbD
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
CBjftD+7PU1CmdjS/y8ILcvHPfQBAA==

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--HlL+5n6rz5pIUxbD--
