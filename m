Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E545E44F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 03:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25D96E420;
	Fri, 26 Nov 2021 02:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594686E420
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 02:19:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="296397678"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="296397678"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 18:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="498244503"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 25 Nov 2021 18:19:01 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqQpJ-0007Ix-0b; Fri, 26 Nov 2021 02:19:01 +0000
Date: Fri, 26 Nov 2021 10:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Message-ID: <202111261033.hgimGK21-lkp@intel.com>
References: <20211117140900.313181-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211117140900.313181-3-maxime@cerno.tech>
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
Cc: kbuild-all@lists.01.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc2 next-20211125]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-Support-for-30-bits-YUV-formats/20211117-221106
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-buildonly-randconfig-r004-20211118 (https://download.01.org/0day-ci/archive/20211126/202111261033.hgimGK21-lkp@intel.com/config)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d4c05e7a5da7b65c5a37252cc9d2cac75f1f6d78
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Support-for-30-bits-YUV-formats/20211117-221106
        git checkout d4c05e7a5da7b65c5a37252cc9d2cac75f1f6d78
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_plane.c:811:4: warning: variable 'tile_w' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                           default:
                           ^~~~~~~
   drivers/gpu/drm/vc4/vc4_plane.c:814:19: note: uninitialized use occurs here
                           pix_per_tile = tile_w / fb->format->cpp[0];
                                          ^~~~~~
   drivers/gpu/drm/vc4/vc4_plane.c:777:13: note: initialize the variable 'tile_w' to silence this warning
                   u32 tile_w, tile, x_off, pix_per_tile;
                             ^
                              = 0
>> drivers/gpu/drm/vc4/vc4_plane.c:816:6: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
                                   (i ? h_subsample : 1) * fb->format->cpp[i];
                                    ^
   drivers/gpu/drm/vc4/vc4_plane.c:652:12: note: initialize the variable 'i' to silence this warning
           int ret, i;
                     ^
                      = 0
   2 warnings generated.


vim +/tile_w +811 drivers/gpu/drm/vc4/vc4_plane.c

0a038c1c29a7a3 Boris Brezillon   2018-11-30   630  
5c6799942003df Eric Anholt       2015-12-28   631  /* Writes out a full display list for an active plane to the plane's
5c6799942003df Eric Anholt       2015-12-28   632   * private dlist state.
5c6799942003df Eric Anholt       2015-12-28   633   */
5c6799942003df Eric Anholt       2015-12-28   634  static int vc4_plane_mode_set(struct drm_plane *plane,
5c6799942003df Eric Anholt       2015-12-28   635  			      struct drm_plane_state *state)
5c6799942003df Eric Anholt       2015-12-28   636  {
21af94cf1a4c2d Eric Anholt       2015-10-20   637  	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
5c6799942003df Eric Anholt       2015-12-28   638  	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
5c6799942003df Eric Anholt       2015-12-28   639  	struct drm_framebuffer *fb = state->fb;
5c6799942003df Eric Anholt       2015-12-28   640  	u32 ctl0_offset = vc4_state->dlist_count;
438b74a5497c36 Ville Syrjälä     2016-12-14   641  	const struct hvs_format *format = vc4_get_hvs_format(fb->format->format);
e065a8dd30af70 Dave Stevenson    2018-03-16   642  	u64 base_format_mod = fourcc_mod_broadcom_mod(fb->modifier);
05c452c115bffa Maxime Ripard     2019-05-16   643  	int num_planes = fb->format->num_planes;
f3e9632cb6241a Maxime Ripard     2019-05-16   644  	u32 h_subsample = fb->format->hsub;
f3e9632cb6241a Maxime Ripard     2019-05-16   645  	u32 v_subsample = fb->format->vsub;
22445f0316a253 Stefan Schake     2018-04-20   646  	bool mix_plane_alpha;
3d67b68a6a3c2d Stefan Schake     2018-03-09   647  	bool covers_screen;
98830d91da082b Eric Anholt       2017-06-07   648  	u32 scl0, scl1, pitch0;
7cd3cf3540a370 Boris Brezillon   2018-12-07   649  	u32 tiling, src_y;
e065a8dd30af70 Dave Stevenson    2018-03-16   650  	u32 hvs_format = format->hvs;
7cd3cf3540a370 Boris Brezillon   2018-12-07   651  	unsigned int rotation;
fc04023fafecf1 Eric Anholt       2015-12-30   652  	int ret, i;
5c6799942003df Eric Anholt       2015-12-28   653  
8d93844965c3d5 Boris Brezillon   2018-11-30   654  	if (vc4_state->dlist_initialized)
8d93844965c3d5 Boris Brezillon   2018-11-30   655  		return 0;
8d93844965c3d5 Boris Brezillon   2018-11-30   656  
5c6799942003df Eric Anholt       2015-12-28   657  	ret = vc4_plane_setup_clipping_and_scaling(state);
21af94cf1a4c2d Eric Anholt       2015-10-20   658  	if (ret)
21af94cf1a4c2d Eric Anholt       2015-10-20   659  		return ret;
21af94cf1a4c2d Eric Anholt       2015-10-20   660  
fc04023fafecf1 Eric Anholt       2015-12-30   661  	/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
fc04023fafecf1 Eric Anholt       2015-12-30   662  	 * and 4:4:4, scl1 should be set to scl0 so both channels of
fc04023fafecf1 Eric Anholt       2015-12-30   663  	 * the scaler do the same thing.  For YUV, the Y plane needs
fc04023fafecf1 Eric Anholt       2015-12-30   664  	 * to be put in channel 1 and Cb/Cr in channel 0, so we swap
fc04023fafecf1 Eric Anholt       2015-12-30   665  	 * the scl fields here.
fc04023fafecf1 Eric Anholt       2015-12-30   666  	 */
fc04023fafecf1 Eric Anholt       2015-12-30   667  	if (num_planes == 1) {
9a0e9802217291 Boris Brezillon   2018-05-07   668  		scl0 = vc4_get_scl_field(state, 0);
fc04023fafecf1 Eric Anholt       2015-12-30   669  		scl1 = scl0;
fc04023fafecf1 Eric Anholt       2015-12-30   670  	} else {
fc04023fafecf1 Eric Anholt       2015-12-30   671  		scl0 = vc4_get_scl_field(state, 1);
fc04023fafecf1 Eric Anholt       2015-12-30   672  		scl1 = vc4_get_scl_field(state, 0);
fc04023fafecf1 Eric Anholt       2015-12-30   673  	}
21af94cf1a4c2d Eric Anholt       2015-10-20   674  
7cd3cf3540a370 Boris Brezillon   2018-12-07   675  	rotation = drm_rotation_simplify(state->rotation,
7cd3cf3540a370 Boris Brezillon   2018-12-07   676  					 DRM_MODE_ROTATE_0 |
7cd3cf3540a370 Boris Brezillon   2018-12-07   677  					 DRM_MODE_REFLECT_X |
7cd3cf3540a370 Boris Brezillon   2018-12-07   678  					 DRM_MODE_REFLECT_Y);
7cd3cf3540a370 Boris Brezillon   2018-12-07   679  
7cd3cf3540a370 Boris Brezillon   2018-12-07   680  	/* We must point to the last line when Y reflection is enabled. */
7cd3cf3540a370 Boris Brezillon   2018-12-07   681  	src_y = vc4_state->src_y;
7cd3cf3540a370 Boris Brezillon   2018-12-07   682  	if (rotation & DRM_MODE_REFLECT_Y)
7cd3cf3540a370 Boris Brezillon   2018-12-07   683  		src_y += vc4_state->src_h[0] - 1;
7cd3cf3540a370 Boris Brezillon   2018-12-07   684  
e065a8dd30af70 Dave Stevenson    2018-03-16   685  	switch (base_format_mod) {
98830d91da082b Eric Anholt       2017-06-07   686  	case DRM_FORMAT_MOD_LINEAR:
98830d91da082b Eric Anholt       2017-06-07   687  		tiling = SCALER_CTL0_TILING_LINEAR;
98830d91da082b Eric Anholt       2017-06-07   688  		pitch0 = VC4_SET_FIELD(fb->pitches[0], SCALER_SRC_PITCH);
a65511b1cd78e0 Boris Brezillon   2018-08-03   689  
a65511b1cd78e0 Boris Brezillon   2018-08-03   690  		/* Adjust the base pointer to the first pixel to be scanned
a65511b1cd78e0 Boris Brezillon   2018-08-03   691  		 * out.
a65511b1cd78e0 Boris Brezillon   2018-08-03   692  		 */
a65511b1cd78e0 Boris Brezillon   2018-08-03   693  		for (i = 0; i < num_planes; i++) {
7cd3cf3540a370 Boris Brezillon   2018-12-07   694  			vc4_state->offsets[i] += src_y /
a65511b1cd78e0 Boris Brezillon   2018-08-03   695  						 (i ? v_subsample : 1) *
a65511b1cd78e0 Boris Brezillon   2018-08-03   696  						 fb->pitches[i];
7cd3cf3540a370 Boris Brezillon   2018-12-07   697  
a65511b1cd78e0 Boris Brezillon   2018-08-03   698  			vc4_state->offsets[i] += vc4_state->src_x /
a65511b1cd78e0 Boris Brezillon   2018-08-03   699  						 (i ? h_subsample : 1) *
a65511b1cd78e0 Boris Brezillon   2018-08-03   700  						 fb->format->cpp[i];
a65511b1cd78e0 Boris Brezillon   2018-08-03   701  		}
3e407417b1928e Boris Brezillon   2018-08-03   702  
98830d91da082b Eric Anholt       2017-06-07   703  		break;
652badb9458b41 Eric Anholt       2017-09-27   704  
652badb9458b41 Eric Anholt       2017-09-27   705  	case DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED: {
652badb9458b41 Eric Anholt       2017-09-27   706  		u32 tile_size_shift = 12; /* T tiles are 4kb */
3e407417b1928e Boris Brezillon   2018-08-03   707  		/* Whole-tile offsets, mostly for setting the pitch. */
3e407417b1928e Boris Brezillon   2018-08-03   708  		u32 tile_w_shift = fb->format->cpp[0] == 2 ? 6 : 5;
652badb9458b41 Eric Anholt       2017-09-27   709  		u32 tile_h_shift = 5; /* 16 and 32bpp are 32 pixels high */
3e407417b1928e Boris Brezillon   2018-08-03   710  		u32 tile_w_mask = (1 << tile_w_shift) - 1;
3e407417b1928e Boris Brezillon   2018-08-03   711  		/* The height mask on 32-bit-per-pixel tiles is 63, i.e. twice
3e407417b1928e Boris Brezillon   2018-08-03   712  		 * the height (in pixels) of a 4k tile.
3e407417b1928e Boris Brezillon   2018-08-03   713  		 */
3e407417b1928e Boris Brezillon   2018-08-03   714  		u32 tile_h_mask = (2 << tile_h_shift) - 1;
3e407417b1928e Boris Brezillon   2018-08-03   715  		/* For T-tiled, the FB pitch is "how many bytes from one row to
3e407417b1928e Boris Brezillon   2018-08-03   716  		 * the next, such that
3e407417b1928e Boris Brezillon   2018-08-03   717  		 *
3e407417b1928e Boris Brezillon   2018-08-03   718  		 *	pitch * tile_h == tile_size * tiles_per_row
3e407417b1928e Boris Brezillon   2018-08-03   719  		 */
652badb9458b41 Eric Anholt       2017-09-27   720  		u32 tiles_w = fb->pitches[0] >> (tile_size_shift - tile_h_shift);
3e407417b1928e Boris Brezillon   2018-08-03   721  		u32 tiles_l = vc4_state->src_x >> tile_w_shift;
3e407417b1928e Boris Brezillon   2018-08-03   722  		u32 tiles_r = tiles_w - tiles_l;
7cd3cf3540a370 Boris Brezillon   2018-12-07   723  		u32 tiles_t = src_y >> tile_h_shift;
3e407417b1928e Boris Brezillon   2018-08-03   724  		/* Intra-tile offsets, which modify the base address (the
3e407417b1928e Boris Brezillon   2018-08-03   725  		 * SCALER_PITCH0_TILE_Y_OFFSET tells HVS how to walk from that
3e407417b1928e Boris Brezillon   2018-08-03   726  		 * base address).
3e407417b1928e Boris Brezillon   2018-08-03   727  		 */
7cd3cf3540a370 Boris Brezillon   2018-12-07   728  		u32 tile_y = (src_y >> 4) & 1;
7cd3cf3540a370 Boris Brezillon   2018-12-07   729  		u32 subtile_y = (src_y >> 2) & 3;
7cd3cf3540a370 Boris Brezillon   2018-12-07   730  		u32 utile_y = src_y & 3;
3e407417b1928e Boris Brezillon   2018-08-03   731  		u32 x_off = vc4_state->src_x & tile_w_mask;
7cd3cf3540a370 Boris Brezillon   2018-12-07   732  		u32 y_off = src_y & tile_h_mask;
7cd3cf3540a370 Boris Brezillon   2018-12-07   733  
7cd3cf3540a370 Boris Brezillon   2018-12-07   734  		/* When Y reflection is requested we must set the
7cd3cf3540a370 Boris Brezillon   2018-12-07   735  		 * SCALER_PITCH0_TILE_LINE_DIR flag to tell HVS that all lines
7cd3cf3540a370 Boris Brezillon   2018-12-07   736  		 * after the initial one should be fetched in descending order,
7cd3cf3540a370 Boris Brezillon   2018-12-07   737  		 * which makes sense since we start from the last line and go
7cd3cf3540a370 Boris Brezillon   2018-12-07   738  		 * backward.
7cd3cf3540a370 Boris Brezillon   2018-12-07   739  		 * Don't know why we need y_off = max_y_off - y_off, but it's
7cd3cf3540a370 Boris Brezillon   2018-12-07   740  		 * definitely required (I guess it's also related to the "going
7cd3cf3540a370 Boris Brezillon   2018-12-07   741  		 * backward" situation).
7cd3cf3540a370 Boris Brezillon   2018-12-07   742  		 */
7cd3cf3540a370 Boris Brezillon   2018-12-07   743  		if (rotation & DRM_MODE_REFLECT_Y) {
7cd3cf3540a370 Boris Brezillon   2018-12-07   744  			y_off = tile_h_mask - y_off;
7cd3cf3540a370 Boris Brezillon   2018-12-07   745  			pitch0 = SCALER_PITCH0_TILE_LINE_DIR;
7cd3cf3540a370 Boris Brezillon   2018-12-07   746  		} else {
7cd3cf3540a370 Boris Brezillon   2018-12-07   747  			pitch0 = 0;
7cd3cf3540a370 Boris Brezillon   2018-12-07   748  		}
652badb9458b41 Eric Anholt       2017-09-27   749  
98830d91da082b Eric Anholt       2017-06-07   750  		tiling = SCALER_CTL0_TILING_256B_OR_T;
7cd3cf3540a370 Boris Brezillon   2018-12-07   751  		pitch0 |= (VC4_SET_FIELD(x_off, SCALER_PITCH0_SINK_PIX) |
3e407417b1928e Boris Brezillon   2018-08-03   752  			   VC4_SET_FIELD(y_off, SCALER_PITCH0_TILE_Y_OFFSET) |
3e407417b1928e Boris Brezillon   2018-08-03   753  			   VC4_SET_FIELD(tiles_l, SCALER_PITCH0_TILE_WIDTH_L) |
3e407417b1928e Boris Brezillon   2018-08-03   754  			   VC4_SET_FIELD(tiles_r, SCALER_PITCH0_TILE_WIDTH_R));
3e407417b1928e Boris Brezillon   2018-08-03   755  		vc4_state->offsets[0] += tiles_t * (tiles_w << tile_size_shift);
3e407417b1928e Boris Brezillon   2018-08-03   756  		vc4_state->offsets[0] += subtile_y << 8;
3e407417b1928e Boris Brezillon   2018-08-03   757  		vc4_state->offsets[0] += utile_y << 4;
3e407417b1928e Boris Brezillon   2018-08-03   758  
3e407417b1928e Boris Brezillon   2018-08-03   759  		/* Rows of tiles alternate left-to-right and right-to-left. */
3e407417b1928e Boris Brezillon   2018-08-03   760  		if (tiles_t & 1) {
3e407417b1928e Boris Brezillon   2018-08-03   761  			pitch0 |= SCALER_PITCH0_TILE_INITIAL_LINE_DIR;
3e407417b1928e Boris Brezillon   2018-08-03   762  			vc4_state->offsets[0] += (tiles_w - tiles_l) <<
3e407417b1928e Boris Brezillon   2018-08-03   763  						 tile_size_shift;
3e407417b1928e Boris Brezillon   2018-08-03   764  			vc4_state->offsets[0] -= (1 + !tile_y) << 10;
3e407417b1928e Boris Brezillon   2018-08-03   765  		} else {
3e407417b1928e Boris Brezillon   2018-08-03   766  			vc4_state->offsets[0] += tiles_l << tile_size_shift;
3e407417b1928e Boris Brezillon   2018-08-03   767  			vc4_state->offsets[0] += tile_y << 10;
3e407417b1928e Boris Brezillon   2018-08-03   768  		}
98830d91da082b Eric Anholt       2017-06-07   769  
98830d91da082b Eric Anholt       2017-06-07   770  		break;
652badb9458b41 Eric Anholt       2017-09-27   771  	}
652badb9458b41 Eric Anholt       2017-09-27   772  
e065a8dd30af70 Dave Stevenson    2018-03-16   773  	case DRM_FORMAT_MOD_BROADCOM_SAND64:
e065a8dd30af70 Dave Stevenson    2018-03-16   774  	case DRM_FORMAT_MOD_BROADCOM_SAND128:
e065a8dd30af70 Dave Stevenson    2018-03-16   775  	case DRM_FORMAT_MOD_BROADCOM_SAND256: {
e065a8dd30af70 Dave Stevenson    2018-03-16   776  		uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
8e75d582db02bc Boris Brezillon   2018-12-07   777  		u32 tile_w, tile, x_off, pix_per_tile;
e065a8dd30af70 Dave Stevenson    2018-03-16   778  
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   779  		if (fb->format->format == DRM_FORMAT_P030) {
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   780  			/*
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   781  			 * Spec says: bits [31:4] of the given address should point to
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   782  			 * the 128-bit word containing the desired starting pixel,
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   783  			 * and bits[3:0] should be between 0 and 11, indicating which
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   784  			 * of the 12-pixels in that 128-bit word is the first pixel to be used
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   785  			 */
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   786  	                u32 remaining_pixels = vc4_state->src_x % 96;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   787  			u32 aligned = remaining_pixels / 12;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   788  			u32 last_bits = remaining_pixels % 12;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   789  
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   790  			x_off = aligned * 16 + last_bits;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   791  			hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   792  			tiling = SCALER_CTL0_TILING_128B;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   793  			tile_w = 128;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   794  			pix_per_tile = 96;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   795  		} else {
e065a8dd30af70 Dave Stevenson    2018-03-16   796  			hvs_format = HVS_PIXEL_FORMAT_H264;
e065a8dd30af70 Dave Stevenson    2018-03-16   797  
e065a8dd30af70 Dave Stevenson    2018-03-16   798  			switch (base_format_mod) {
e065a8dd30af70 Dave Stevenson    2018-03-16   799  			case DRM_FORMAT_MOD_BROADCOM_SAND64:
e065a8dd30af70 Dave Stevenson    2018-03-16   800  				tiling = SCALER_CTL0_TILING_64B;
8e75d582db02bc Boris Brezillon   2018-12-07   801  				tile_w = 64;
e065a8dd30af70 Dave Stevenson    2018-03-16   802  				break;
e065a8dd30af70 Dave Stevenson    2018-03-16   803  			case DRM_FORMAT_MOD_BROADCOM_SAND128:
e065a8dd30af70 Dave Stevenson    2018-03-16   804  				tiling = SCALER_CTL0_TILING_128B;
8e75d582db02bc Boris Brezillon   2018-12-07   805  				tile_w = 128;
e065a8dd30af70 Dave Stevenson    2018-03-16   806  				break;
e065a8dd30af70 Dave Stevenson    2018-03-16   807  			case DRM_FORMAT_MOD_BROADCOM_SAND256:
e065a8dd30af70 Dave Stevenson    2018-03-16   808  				tiling = SCALER_CTL0_TILING_256B_OR_T;
8e75d582db02bc Boris Brezillon   2018-12-07   809  				tile_w = 256;
e065a8dd30af70 Dave Stevenson    2018-03-16   810  				break;
e065a8dd30af70 Dave Stevenson    2018-03-16  @811  			default:
e065a8dd30af70 Dave Stevenson    2018-03-16   812  				break;
e065a8dd30af70 Dave Stevenson    2018-03-16   813  			}
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   814  			pix_per_tile = tile_w / fb->format->cpp[0];
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   815  			x_off = (vc4_state->src_x % pix_per_tile) /
d4c05e7a5da7b6 Dave Stevenson    2021-11-17  @816  				(i ? h_subsample : 1) * fb->format->cpp[i];
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   817  		}
e065a8dd30af70 Dave Stevenson    2018-03-16   818  		if (param > SCALER_TILE_HEIGHT_MASK) {
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   819  			DRM_DEBUG_KMS("SAND height too large (%d)\n",
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   820  				      param);
e065a8dd30af70 Dave Stevenson    2018-03-16   821  			return -EINVAL;
e065a8dd30af70 Dave Stevenson    2018-03-16   822  		}
8e75d582db02bc Boris Brezillon   2018-12-07   823  		tile = vc4_state->src_x / pix_per_tile;
8e75d582db02bc Boris Brezillon   2018-12-07   824  		/* Adjust the base pointer to the first pixel to be scanned
8e75d582db02bc Boris Brezillon   2018-12-07   825  		 * out.
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   826  		 *
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   827  		 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   828  		 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   829  		 * word that should be taken as the first pixel.
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   830  		 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   831  		 * element within the 128bit word, eg for pixel 3 the value
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   832  		 * should be 6.
8e75d582db02bc Boris Brezillon   2018-12-07   833  		 */
8e75d582db02bc Boris Brezillon   2018-12-07   834  		for (i = 0; i < num_planes; i++) {
8e75d582db02bc Boris Brezillon   2018-12-07   835  			vc4_state->offsets[i] += param * tile_w * tile;
7cd3cf3540a370 Boris Brezillon   2018-12-07   836  			vc4_state->offsets[i] += src_y /
8e75d582db02bc Boris Brezillon   2018-12-07   837  						 (i ? v_subsample : 1) *
8e75d582db02bc Boris Brezillon   2018-12-07   838  						 tile_w;
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   839  			vc4_state->offsets[i] += x_off & ~(i ? 1 : 0);
8e75d582db02bc Boris Brezillon   2018-12-07   840  		}
8e75d582db02bc Boris Brezillon   2018-12-07   841  
e065a8dd30af70 Dave Stevenson    2018-03-16   842  		pitch0 = VC4_SET_FIELD(param, SCALER_TILE_HEIGHT);
e065a8dd30af70 Dave Stevenson    2018-03-16   843  		break;
e065a8dd30af70 Dave Stevenson    2018-03-16   844  	}
e065a8dd30af70 Dave Stevenson    2018-03-16   845  
98830d91da082b Eric Anholt       2017-06-07   846  	default:
98830d91da082b Eric Anholt       2017-06-07   847  		DRM_DEBUG_KMS("Unsupported FB tiling flag 0x%16llx",
98830d91da082b Eric Anholt       2017-06-07   848  			      (long long)fb->modifier);
98830d91da082b Eric Anholt       2017-06-07   849  		return -EINVAL;
98830d91da082b Eric Anholt       2017-06-07   850  	}
98830d91da082b Eric Anholt       2017-06-07   851  
c54619b0bfb35c Dave Stevenson    2020-09-03   852  	/* Don't waste cycles mixing with plane alpha if the set alpha
c54619b0bfb35c Dave Stevenson    2020-09-03   853  	 * is opaque or there is no per-pixel alpha information.
c54619b0bfb35c Dave Stevenson    2020-09-03   854  	 * In any case we use the alpha property value as the fixed alpha.
c54619b0bfb35c Dave Stevenson    2020-09-03   855  	 */
c54619b0bfb35c Dave Stevenson    2020-09-03   856  	mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
c54619b0bfb35c Dave Stevenson    2020-09-03   857  			  fb->format->has_alpha;
c54619b0bfb35c Dave Stevenson    2020-09-03   858  
c54619b0bfb35c Dave Stevenson    2020-09-03   859  	if (!vc4->hvs->hvs5) {
21af94cf1a4c2d Eric Anholt       2015-10-20   860  	/* Control word */
c8b75bca92cbf0 Eric Anholt       2015-03-02   861  		vc4_dlist_write(vc4_state,
c8b75bca92cbf0 Eric Anholt       2015-03-02   862  				SCALER_CTL0_VALID |
7cd3cf3540a370 Boris Brezillon   2018-12-07   863  				(rotation & DRM_MODE_REFLECT_X ? SCALER_CTL0_HFLIP : 0) |
7cd3cf3540a370 Boris Brezillon   2018-12-07   864  				(rotation & DRM_MODE_REFLECT_Y ? SCALER_CTL0_VFLIP : 0) |
3257ec797d3a8c Maxime Ripard     2018-05-17   865  				VC4_SET_FIELD(SCALER_CTL0_RGBA_EXPAND_ROUND, SCALER_CTL0_RGBA_EXPAND) |
c8b75bca92cbf0 Eric Anholt       2015-03-02   866  				(format->pixel_order << SCALER_CTL0_ORDER_SHIFT) |
e065a8dd30af70 Dave Stevenson    2018-03-16   867  				(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
98830d91da082b Eric Anholt       2017-06-07   868  				VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
21af94cf1a4c2d Eric Anholt       2015-10-20   869  				(vc4_state->is_unity ? SCALER_CTL0_UNITY : 0) |
fc04023fafecf1 Eric Anholt       2015-12-30   870  				VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
fc04023fafecf1 Eric Anholt       2015-12-30   871  				VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1));
c8b75bca92cbf0 Eric Anholt       2015-03-02   872  
c8b75bca92cbf0 Eric Anholt       2015-03-02   873  		/* Position Word 0: Image Positions and Alpha Value */
6674a904d68041 Eric Anholt       2015-12-30   874  		vc4_state->pos0_offset = vc4_state->dlist_count;
c8b75bca92cbf0 Eric Anholt       2015-03-02   875  		vc4_dlist_write(vc4_state,
22445f0316a253 Stefan Schake     2018-04-20   876  				VC4_SET_FIELD(state->alpha >> 8, SCALER_POS0_FIXED_ALPHA) |
5c6799942003df Eric Anholt       2015-12-28   877  				VC4_SET_FIELD(vc4_state->crtc_x, SCALER_POS0_START_X) |
5c6799942003df Eric Anholt       2015-12-28   878  				VC4_SET_FIELD(vc4_state->crtc_y, SCALER_POS0_START_Y));
c8b75bca92cbf0 Eric Anholt       2015-03-02   879  
21af94cf1a4c2d Eric Anholt       2015-10-20   880  		/* Position Word 1: Scaled Image Dimensions. */
21af94cf1a4c2d Eric Anholt       2015-10-20   881  		if (!vc4_state->is_unity) {
21af94cf1a4c2d Eric Anholt       2015-10-20   882  			vc4_dlist_write(vc4_state,
21af94cf1a4c2d Eric Anholt       2015-10-20   883  					VC4_SET_FIELD(vc4_state->crtc_w,
21af94cf1a4c2d Eric Anholt       2015-10-20   884  						      SCALER_POS1_SCL_WIDTH) |
21af94cf1a4c2d Eric Anholt       2015-10-20   885  					VC4_SET_FIELD(vc4_state->crtc_h,
21af94cf1a4c2d Eric Anholt       2015-10-20   886  						      SCALER_POS1_SCL_HEIGHT));
21af94cf1a4c2d Eric Anholt       2015-10-20   887  		}
c8b75bca92cbf0 Eric Anholt       2015-03-02   888  
05202c241f1476 Stefan Schake     2018-03-09   889  		/* Position Word 2: Source Image Size, Alpha */
6674a904d68041 Eric Anholt       2015-12-30   890  		vc4_state->pos2_offset = vc4_state->dlist_count;
c8b75bca92cbf0 Eric Anholt       2015-03-02   891  		vc4_dlist_write(vc4_state,
124e5dac9a596a Maxime Ripard     2017-12-22   892  				VC4_SET_FIELD(fb->format->has_alpha ?
c8b75bca92cbf0 Eric Anholt       2015-03-02   893  					      SCALER_POS2_ALPHA_MODE_PIPELINE :
c8b75bca92cbf0 Eric Anholt       2015-03-02   894  					      SCALER_POS2_ALPHA_MODE_FIXED,
c8b75bca92cbf0 Eric Anholt       2015-03-02   895  					      SCALER_POS2_ALPHA_MODE) |
22445f0316a253 Stefan Schake     2018-04-20   896  				(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   897  				(fb->format->has_alpha ?
c54619b0bfb35c Dave Stevenson    2020-09-03   898  						SCALER_POS2_ALPHA_PREMULT : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   899  				VC4_SET_FIELD(vc4_state->src_w[0],
c54619b0bfb35c Dave Stevenson    2020-09-03   900  					      SCALER_POS2_WIDTH) |
c54619b0bfb35c Dave Stevenson    2020-09-03   901  				VC4_SET_FIELD(vc4_state->src_h[0],
c54619b0bfb35c Dave Stevenson    2020-09-03   902  					      SCALER_POS2_HEIGHT));
c54619b0bfb35c Dave Stevenson    2020-09-03   903  
c54619b0bfb35c Dave Stevenson    2020-09-03   904  		/* Position Word 3: Context.  Written by the HVS. */
c54619b0bfb35c Dave Stevenson    2020-09-03   905  		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
c54619b0bfb35c Dave Stevenson    2020-09-03   906  
c54619b0bfb35c Dave Stevenson    2020-09-03   907  	} else {
c54619b0bfb35c Dave Stevenson    2020-09-03   908  		u32 hvs_pixel_order = format->pixel_order;
c54619b0bfb35c Dave Stevenson    2020-09-03   909  
c54619b0bfb35c Dave Stevenson    2020-09-03   910  		if (format->pixel_order_hvs5)
c54619b0bfb35c Dave Stevenson    2020-09-03   911  			hvs_pixel_order = format->pixel_order_hvs5;
c54619b0bfb35c Dave Stevenson    2020-09-03   912  
c54619b0bfb35c Dave Stevenson    2020-09-03   913  		/* Control word */
c54619b0bfb35c Dave Stevenson    2020-09-03   914  		vc4_dlist_write(vc4_state,
c54619b0bfb35c Dave Stevenson    2020-09-03   915  				SCALER_CTL0_VALID |
c54619b0bfb35c Dave Stevenson    2020-09-03   916  				(hvs_pixel_order << SCALER_CTL0_ORDER_SHIFT) |
c54619b0bfb35c Dave Stevenson    2020-09-03   917  				(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
c54619b0bfb35c Dave Stevenson    2020-09-03   918  				VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
c54619b0bfb35c Dave Stevenson    2020-09-03   919  				(vc4_state->is_unity ?
c54619b0bfb35c Dave Stevenson    2020-09-03   920  						SCALER5_CTL0_UNITY : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   921  				VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   922  				VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1) |
c54619b0bfb35c Dave Stevenson    2020-09-03   923  				SCALER5_CTL0_ALPHA_EXPAND |
c54619b0bfb35c Dave Stevenson    2020-09-03   924  				SCALER5_CTL0_RGB_EXPAND);
c54619b0bfb35c Dave Stevenson    2020-09-03   925  
c54619b0bfb35c Dave Stevenson    2020-09-03   926  		/* Position Word 0: Image Positions and Alpha Value */
c54619b0bfb35c Dave Stevenson    2020-09-03   927  		vc4_state->pos0_offset = vc4_state->dlist_count;
c54619b0bfb35c Dave Stevenson    2020-09-03   928  		vc4_dlist_write(vc4_state,
c54619b0bfb35c Dave Stevenson    2020-09-03   929  				(rotation & DRM_MODE_REFLECT_Y ?
c54619b0bfb35c Dave Stevenson    2020-09-03   930  						SCALER5_POS0_VFLIP : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   931  				VC4_SET_FIELD(vc4_state->crtc_x,
c54619b0bfb35c Dave Stevenson    2020-09-03   932  					      SCALER_POS0_START_X) |
c54619b0bfb35c Dave Stevenson    2020-09-03   933  				(rotation & DRM_MODE_REFLECT_X ?
c54619b0bfb35c Dave Stevenson    2020-09-03   934  					      SCALER5_POS0_HFLIP : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   935  				VC4_SET_FIELD(vc4_state->crtc_y,
c54619b0bfb35c Dave Stevenson    2020-09-03   936  					      SCALER5_POS0_START_Y)
c54619b0bfb35c Dave Stevenson    2020-09-03   937  			       );
c54619b0bfb35c Dave Stevenson    2020-09-03   938  
c54619b0bfb35c Dave Stevenson    2020-09-03   939  		/* Control Word 2 */
c54619b0bfb35c Dave Stevenson    2020-09-03   940  		vc4_dlist_write(vc4_state,
c54619b0bfb35c Dave Stevenson    2020-09-03   941  				VC4_SET_FIELD(state->alpha >> 4,
c54619b0bfb35c Dave Stevenson    2020-09-03   942  					      SCALER5_CTL2_ALPHA) |
4494346392204a Nathan Chancellor 2020-09-10   943  				(fb->format->has_alpha ?
4494346392204a Nathan Chancellor 2020-09-10   944  					SCALER5_CTL2_ALPHA_PREMULT : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   945  				(mix_plane_alpha ?
c54619b0bfb35c Dave Stevenson    2020-09-03   946  					SCALER5_CTL2_ALPHA_MIX : 0) |
c54619b0bfb35c Dave Stevenson    2020-09-03   947  				VC4_SET_FIELD(fb->format->has_alpha ?
c54619b0bfb35c Dave Stevenson    2020-09-03   948  				      SCALER5_CTL2_ALPHA_MODE_PIPELINE :
c54619b0bfb35c Dave Stevenson    2020-09-03   949  				      SCALER5_CTL2_ALPHA_MODE_FIXED,
c54619b0bfb35c Dave Stevenson    2020-09-03   950  				      SCALER5_CTL2_ALPHA_MODE)
c54619b0bfb35c Dave Stevenson    2020-09-03   951  			       );
c54619b0bfb35c Dave Stevenson    2020-09-03   952  
c54619b0bfb35c Dave Stevenson    2020-09-03   953  		/* Position Word 1: Scaled Image Dimensions. */
c54619b0bfb35c Dave Stevenson    2020-09-03   954  		if (!vc4_state->is_unity) {
c54619b0bfb35c Dave Stevenson    2020-09-03   955  			vc4_dlist_write(vc4_state,
c54619b0bfb35c Dave Stevenson    2020-09-03   956  					VC4_SET_FIELD(vc4_state->crtc_w,
f6b57101a6b312 Dom Cobley        2021-01-21   957  						      SCALER5_POS1_SCL_WIDTH) |
c54619b0bfb35c Dave Stevenson    2020-09-03   958  					VC4_SET_FIELD(vc4_state->crtc_h,
f6b57101a6b312 Dom Cobley        2021-01-21   959  						      SCALER5_POS1_SCL_HEIGHT));
c54619b0bfb35c Dave Stevenson    2020-09-03   960  		}
c54619b0bfb35c Dave Stevenson    2020-09-03   961  
c54619b0bfb35c Dave Stevenson    2020-09-03   962  		/* Position Word 2: Source Image Size */
c54619b0bfb35c Dave Stevenson    2020-09-03   963  		vc4_state->pos2_offset = vc4_state->dlist_count;
c54619b0bfb35c Dave Stevenson    2020-09-03   964  		vc4_dlist_write(vc4_state,
c54619b0bfb35c Dave Stevenson    2020-09-03   965  				VC4_SET_FIELD(vc4_state->src_w[0],
c54619b0bfb35c Dave Stevenson    2020-09-03   966  					      SCALER5_POS2_WIDTH) |
c54619b0bfb35c Dave Stevenson    2020-09-03   967  				VC4_SET_FIELD(vc4_state->src_h[0],
c54619b0bfb35c Dave Stevenson    2020-09-03   968  					      SCALER5_POS2_HEIGHT));
c8b75bca92cbf0 Eric Anholt       2015-03-02   969  
c8b75bca92cbf0 Eric Anholt       2015-03-02   970  		/* Position Word 3: Context.  Written by the HVS. */
c8b75bca92cbf0 Eric Anholt       2015-03-02   971  		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
c54619b0bfb35c Dave Stevenson    2020-09-03   972  	}
c8b75bca92cbf0 Eric Anholt       2015-03-02   973  
fc04023fafecf1 Eric Anholt       2015-12-30   974  
fc04023fafecf1 Eric Anholt       2015-12-30   975  	/* Pointer Word 0/1/2: RGB / Y / Cb / Cr Pointers
fc04023fafecf1 Eric Anholt       2015-12-30   976  	 *
fc04023fafecf1 Eric Anholt       2015-12-30   977  	 * The pointers may be any byte address.
fc04023fafecf1 Eric Anholt       2015-12-30   978  	 */
6674a904d68041 Eric Anholt       2015-12-30   979  	vc4_state->ptr0_offset = vc4_state->dlist_count;
fc04023fafecf1 Eric Anholt       2015-12-30   980  	for (i = 0; i < num_planes; i++)
fc04023fafecf1 Eric Anholt       2015-12-30   981  		vc4_dlist_write(vc4_state, vc4_state->offsets[i]);
c8b75bca92cbf0 Eric Anholt       2015-03-02   982  
fc04023fafecf1 Eric Anholt       2015-12-30   983  	/* Pointer Context Word 0/1/2: Written by the HVS */
fc04023fafecf1 Eric Anholt       2015-12-30   984  	for (i = 0; i < num_planes; i++)
c8b75bca92cbf0 Eric Anholt       2015-03-02   985  		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
c8b75bca92cbf0 Eric Anholt       2015-03-02   986  
98830d91da082b Eric Anholt       2017-06-07   987  	/* Pitch word 0 */
98830d91da082b Eric Anholt       2017-06-07   988  	vc4_dlist_write(vc4_state, pitch0);
98830d91da082b Eric Anholt       2017-06-07   989  
98830d91da082b Eric Anholt       2017-06-07   990  	/* Pitch word 1/2 */
98830d91da082b Eric Anholt       2017-06-07   991  	for (i = 1; i < num_planes; i++) {
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   992  		if (hvs_format != HVS_PIXEL_FORMAT_H264 &&
d4c05e7a5da7b6 Dave Stevenson    2021-11-17   993  		    hvs_format != HVS_PIXEL_FORMAT_YCBCR_10BIT) {
c8b75bca92cbf0 Eric Anholt       2015-03-02   994  			vc4_dlist_write(vc4_state,
e065a8dd30af70 Dave Stevenson    2018-03-16   995  					VC4_SET_FIELD(fb->pitches[i],
e065a8dd30af70 Dave Stevenson    2018-03-16   996  						      SCALER_SRC_PITCH));
e065a8dd30af70 Dave Stevenson    2018-03-16   997  		} else {
e065a8dd30af70 Dave Stevenson    2018-03-16   998  			vc4_dlist_write(vc4_state, pitch0);
e065a8dd30af70 Dave Stevenson    2018-03-16   999  		}
fc04023fafecf1 Eric Anholt       2015-12-30  1000  	}
fc04023fafecf1 Eric Anholt       2015-12-30  1001  
fc04023fafecf1 Eric Anholt       2015-12-30  1002  	/* Colorspace conversion words */
fc04023fafecf1 Eric Anholt       2015-12-30  1003  	if (vc4_state->is_yuv) {
fc04023fafecf1 Eric Anholt       2015-12-30  1004  		vc4_dlist_write(vc4_state, SCALER_CSC0_ITR_R_601_5);
fc04023fafecf1 Eric Anholt       2015-12-30  1005  		vc4_dlist_write(vc4_state, SCALER_CSC1_ITR_R_601_5);
fc04023fafecf1 Eric Anholt       2015-12-30  1006  		vc4_dlist_write(vc4_state, SCALER_CSC2_ITR_R_601_5);
fc04023fafecf1 Eric Anholt       2015-12-30  1007  	}
c8b75bca92cbf0 Eric Anholt       2015-03-02  1008  
0a038c1c29a7a3 Boris Brezillon   2018-11-30  1009  	vc4_state->lbm_offset = 0;
0a038c1c29a7a3 Boris Brezillon   2018-11-30  1010  
658d8cbd07dae2 Boris Brezillon   2018-07-25  1011  	if (vc4_state->x_scaling[0] != VC4_SCALING_NONE ||
658d8cbd07dae2 Boris Brezillon   2018-07-25  1012  	    vc4_state->x_scaling[1] != VC4_SCALING_NONE ||
658d8cbd07dae2 Boris Brezillon   2018-07-25  1013  	    vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
658d8cbd07dae2 Boris Brezillon   2018-07-25  1014  	    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
0a038c1c29a7a3 Boris Brezillon   2018-11-30  1015  		/* Reserve a slot for the LBM Base Address. The real value will
0a038c1c29a7a3 Boris Brezillon   2018-11-30  1016  		 * be set when calling vc4_plane_allocate_lbm().
0a038c1c29a7a3 Boris Brezillon   2018-11-30  1017  		 */
fc04023fafecf1 Eric Anholt       2015-12-30  1018  		if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
facd93f4285c40 Maxime Ripard     2021-01-29  1019  		    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
facd93f4285c40 Maxime Ripard     2021-01-29  1020  			vc4_state->lbm_offset = vc4_state->dlist_count;
facd93f4285c40 Maxime Ripard     2021-01-29  1021  			vc4_dlist_counter_increment(vc4_state);
facd93f4285c40 Maxime Ripard     2021-01-29  1022  		}
21af94cf1a4c2d Eric Anholt       2015-10-20  1023  
fc04023fafecf1 Eric Anholt       2015-12-30  1024  		if (num_planes > 1) {
fc04023fafecf1 Eric Anholt       2015-12-30  1025  			/* Emit Cb/Cr as channel 0 and Y as channel
fc04023fafecf1 Eric Anholt       2015-12-30  1026  			 * 1. This matches how we set up scl0/scl1
fc04023fafecf1 Eric Anholt       2015-12-30  1027  			 * above.
fc04023fafecf1 Eric Anholt       2015-12-30  1028  			 */
fc04023fafecf1 Eric Anholt       2015-12-30  1029  			vc4_write_scaling_parameters(state, 1);
fc04023fafecf1 Eric Anholt       2015-12-30  1030  		}
fc04023fafecf1 Eric Anholt       2015-12-30  1031  		vc4_write_scaling_parameters(state, 0);
21af94cf1a4c2d Eric Anholt       2015-10-20  1032  
21af94cf1a4c2d Eric Anholt       2015-10-20  1033  		/* If any PPF setup was done, then all the kernel
21af94cf1a4c2d Eric Anholt       2015-10-20  1034  		 * pointers get uploaded.
21af94cf1a4c2d Eric Anholt       2015-10-20  1035  		 */
fc04023fafecf1 Eric Anholt       2015-12-30  1036  		if (vc4_state->x_scaling[0] == VC4_SCALING_PPF ||
fc04023fafecf1 Eric Anholt       2015-12-30  1037  		    vc4_state->y_scaling[0] == VC4_SCALING_PPF ||
fc04023fafecf1 Eric Anholt       2015-12-30  1038  		    vc4_state->x_scaling[1] == VC4_SCALING_PPF ||
fc04023fafecf1 Eric Anholt       2015-12-30  1039  		    vc4_state->y_scaling[1] == VC4_SCALING_PPF) {
21af94cf1a4c2d Eric Anholt       2015-10-20  1040  			u32 kernel = VC4_SET_FIELD(vc4->hvs->mitchell_netravali_filter.start,
21af94cf1a4c2d Eric Anholt       2015-10-20  1041  						   SCALER_PPF_KERNEL_OFFSET);
21af94cf1a4c2d Eric Anholt       2015-10-20  1042  
21af94cf1a4c2d Eric Anholt       2015-10-20  1043  			/* HPPF plane 0 */
21af94cf1a4c2d Eric Anholt       2015-10-20  1044  			vc4_dlist_write(vc4_state, kernel);
21af94cf1a4c2d Eric Anholt       2015-10-20  1045  			/* VPPF plane 0 */
21af94cf1a4c2d Eric Anholt       2015-10-20  1046  			vc4_dlist_write(vc4_state, kernel);
21af94cf1a4c2d Eric Anholt       2015-10-20  1047  			/* HPPF plane 1 */
21af94cf1a4c2d Eric Anholt       2015-10-20  1048  			vc4_dlist_write(vc4_state, kernel);
21af94cf1a4c2d Eric Anholt       2015-10-20  1049  			/* VPPF plane 1 */
21af94cf1a4c2d Eric Anholt       2015-10-20  1050  			vc4_dlist_write(vc4_state, kernel);
21af94cf1a4c2d Eric Anholt       2015-10-20  1051  		}
21af94cf1a4c2d Eric Anholt       2015-10-20  1052  	}
21af94cf1a4c2d Eric Anholt       2015-10-20  1053  
c8b75bca92cbf0 Eric Anholt       2015-03-02  1054  	vc4_state->dlist[ctl0_offset] |=
c8b75bca92cbf0 Eric Anholt       2015-03-02  1055  		VC4_SET_FIELD(vc4_state->dlist_count, SCALER_CTL0_SIZE);
c8b75bca92cbf0 Eric Anholt       2015-03-02  1056  
3d67b68a6a3c2d Stefan Schake     2018-03-09  1057  	/* crtc_* are already clipped coordinates. */
3d67b68a6a3c2d Stefan Schake     2018-03-09  1058  	covers_screen = vc4_state->crtc_x == 0 && vc4_state->crtc_y == 0 &&
3d67b68a6a3c2d Stefan Schake     2018-03-09  1059  			vc4_state->crtc_w == state->crtc->mode.hdisplay &&
3d67b68a6a3c2d Stefan Schake     2018-03-09  1060  			vc4_state->crtc_h == state->crtc->mode.vdisplay;
3d67b68a6a3c2d Stefan Schake     2018-03-09  1061  	/* Background fill might be necessary when the plane has per-pixel
22445f0316a253 Stefan Schake     2018-04-20  1062  	 * alpha content or a non-opaque plane alpha and could blend from the
22445f0316a253 Stefan Schake     2018-04-20  1063  	 * background or does not cover the entire screen.
3d67b68a6a3c2d Stefan Schake     2018-03-09  1064  	 */
22445f0316a253 Stefan Schake     2018-04-20  1065  	vc4_state->needs_bg_fill = fb->format->has_alpha || !covers_screen ||
22445f0316a253 Stefan Schake     2018-04-20  1066  				   state->alpha != DRM_BLEND_ALPHA_OPAQUE;
3d67b68a6a3c2d Stefan Schake     2018-03-09  1067  
8d93844965c3d5 Boris Brezillon   2018-11-30  1068  	/* Flag the dlist as initialized to avoid checking it twice in case
8d93844965c3d5 Boris Brezillon   2018-11-30  1069  	 * the async update check already called vc4_plane_mode_set() and
8d93844965c3d5 Boris Brezillon   2018-11-30  1070  	 * decided to fallback to sync update because async update was not
8d93844965c3d5 Boris Brezillon   2018-11-30  1071  	 * possible.
8d93844965c3d5 Boris Brezillon   2018-11-30  1072  	 */
8d93844965c3d5 Boris Brezillon   2018-11-30  1073  	vc4_state->dlist_initialized = 1;
8d93844965c3d5 Boris Brezillon   2018-11-30  1074  
4686da83154d87 Boris Brezillon   2019-02-20  1075  	vc4_plane_calc_load(state);
4686da83154d87 Boris Brezillon   2019-02-20  1076  
c8b75bca92cbf0 Eric Anholt       2015-03-02  1077  	return 0;
c8b75bca92cbf0 Eric Anholt       2015-03-02  1078  }
c8b75bca92cbf0 Eric Anholt       2015-03-02  1079  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
