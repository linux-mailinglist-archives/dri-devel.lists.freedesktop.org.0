Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A33473AC4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 03:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF7B10E6FA;
	Tue, 14 Dec 2021 02:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0BD10E72B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639449314; x=1670985314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jcVdZxCgDLDKOpXN5dqciJUwwK0iXG/B4hhPT3FOqjw=;
 b=P9Z8OowLgcuh3ovWwlNbFDTCLZe9XRZsiyWiwKdCdp2b207zvZMlcc0D
 dluykHw5SeOU/ze4wcqGEttklrBbEh/mbTa/KaAFcHnEunvnLydZKKkqv
 YPQpM8+t33yJtpmk4fqlxKsBh1JW7xCFN27Yr98/7UAqAzXZeQUOREhhv
 +NXt8H/WEgIRLj+q5ABDags2hfLXRJ2on4dYlp/A8i38T5uO4Q9UdU5+c
 s2NPc5LnfiyDErHRtM2NeipeE6+DeLa4C47AdllwBh00BkfNXMdxskthN
 fGSZ3ZoGZgAX+VuNpC29lEibtISlDrH/0/5TLXYuL4XsTX38LDrBQFaDG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325153758"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="325153758"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 18:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="604078468"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Dec 2021 18:35:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwxef-0007K7-VN; Tue, 14 Dec 2021 02:35:01 +0000
Date: Tue, 14 Dec 2021 10:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v3 2/3] drm/vc4: plane: Add support for DRM_FORMAT_P030
Message-ID: <202112141058.EBPlKMSk-lkp@intel.com>
References: <20211213165632.255283-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213165632.255283-3-maxime@cerno.tech>
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
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.16-rc5]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-Support-for-30-bits-YUV-formats/20211214-005817
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-r031-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141058.EBPlKMSk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/58b0d045769ea7e075fd1968a0da080b14b9ab70
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-vc4-Support-for-30-bits-YUV-formats/20211214-005817
        git checkout 58b0d045769ea7e075fd1968a0da080b14b9ab70
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_plane.c:841:5: warning: variable 'tile_w' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                                   default:
                                   ^~~~~~~
   drivers/gpu/drm/vc4/vc4_plane.c:844:20: note: uninitialized use occurs here
                                   pix_per_tile = tile_w / fb->format->cpp[0];
                                                  ^~~~~~
   drivers/gpu/drm/vc4/vc4_plane.c:812:14: note: initialize the variable 'tile_w' to silence this warning
                           u32 tile_w, tile, x_off, pix_per_tile;
                                     ^
                                      = 0
   1 warning generated.


vim +/tile_w +841 drivers/gpu/drm/vc4/vc4_plane.c

   625	
   626	/* Writes out a full display list for an active plane to the plane's
   627	 * private dlist state.
   628	 */
   629	static int vc4_plane_mode_set(struct drm_plane *plane,
   630				      struct drm_plane_state *state)
   631	{
   632		struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
   633		struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
   634		struct drm_framebuffer *fb = state->fb;
   635		u32 ctl0_offset = vc4_state->dlist_count;
   636		const struct hvs_format *format = vc4_get_hvs_format(fb->format->format);
   637		u64 base_format_mod = fourcc_mod_broadcom_mod(fb->modifier);
   638		int num_planes = fb->format->num_planes;
   639		u32 h_subsample = fb->format->hsub;
   640		u32 v_subsample = fb->format->vsub;
   641		bool mix_plane_alpha;
   642		bool covers_screen;
   643		u32 scl0, scl1, pitch0;
   644		u32 tiling, src_y;
   645		u32 hvs_format = format->hvs;
   646		unsigned int rotation;
   647		int ret, i;
   648	
   649		if (vc4_state->dlist_initialized)
   650			return 0;
   651	
   652		ret = vc4_plane_setup_clipping_and_scaling(state);
   653		if (ret)
   654			return ret;
   655	
   656		/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
   657		 * and 4:4:4, scl1 should be set to scl0 so both channels of
   658		 * the scaler do the same thing.  For YUV, the Y plane needs
   659		 * to be put in channel 1 and Cb/Cr in channel 0, so we swap
   660		 * the scl fields here.
   661		 */
   662		if (num_planes == 1) {
   663			scl0 = vc4_get_scl_field(state, 0);
   664			scl1 = scl0;
   665		} else {
   666			scl0 = vc4_get_scl_field(state, 1);
   667			scl1 = vc4_get_scl_field(state, 0);
   668		}
   669	
   670		rotation = drm_rotation_simplify(state->rotation,
   671						 DRM_MODE_ROTATE_0 |
   672						 DRM_MODE_REFLECT_X |
   673						 DRM_MODE_REFLECT_Y);
   674	
   675		/* We must point to the last line when Y reflection is enabled. */
   676		src_y = vc4_state->src_y;
   677		if (rotation & DRM_MODE_REFLECT_Y)
   678			src_y += vc4_state->src_h[0] - 1;
   679	
   680		switch (base_format_mod) {
   681		case DRM_FORMAT_MOD_LINEAR:
   682			tiling = SCALER_CTL0_TILING_LINEAR;
   683			pitch0 = VC4_SET_FIELD(fb->pitches[0], SCALER_SRC_PITCH);
   684	
   685			/* Adjust the base pointer to the first pixel to be scanned
   686			 * out.
   687			 */
   688			for (i = 0; i < num_planes; i++) {
   689				vc4_state->offsets[i] += src_y /
   690							 (i ? v_subsample : 1) *
   691							 fb->pitches[i];
   692	
   693				vc4_state->offsets[i] += vc4_state->src_x /
   694							 (i ? h_subsample : 1) *
   695							 fb->format->cpp[i];
   696			}
   697	
   698			break;
   699	
   700		case DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED: {
   701			u32 tile_size_shift = 12; /* T tiles are 4kb */
   702			/* Whole-tile offsets, mostly for setting the pitch. */
   703			u32 tile_w_shift = fb->format->cpp[0] == 2 ? 6 : 5;
   704			u32 tile_h_shift = 5; /* 16 and 32bpp are 32 pixels high */
   705			u32 tile_w_mask = (1 << tile_w_shift) - 1;
   706			/* The height mask on 32-bit-per-pixel tiles is 63, i.e. twice
   707			 * the height (in pixels) of a 4k tile.
   708			 */
   709			u32 tile_h_mask = (2 << tile_h_shift) - 1;
   710			/* For T-tiled, the FB pitch is "how many bytes from one row to
   711			 * the next, such that
   712			 *
   713			 *	pitch * tile_h == tile_size * tiles_per_row
   714			 */
   715			u32 tiles_w = fb->pitches[0] >> (tile_size_shift - tile_h_shift);
   716			u32 tiles_l = vc4_state->src_x >> tile_w_shift;
   717			u32 tiles_r = tiles_w - tiles_l;
   718			u32 tiles_t = src_y >> tile_h_shift;
   719			/* Intra-tile offsets, which modify the base address (the
   720			 * SCALER_PITCH0_TILE_Y_OFFSET tells HVS how to walk from that
   721			 * base address).
   722			 */
   723			u32 tile_y = (src_y >> 4) & 1;
   724			u32 subtile_y = (src_y >> 2) & 3;
   725			u32 utile_y = src_y & 3;
   726			u32 x_off = vc4_state->src_x & tile_w_mask;
   727			u32 y_off = src_y & tile_h_mask;
   728	
   729			/* When Y reflection is requested we must set the
   730			 * SCALER_PITCH0_TILE_LINE_DIR flag to tell HVS that all lines
   731			 * after the initial one should be fetched in descending order,
   732			 * which makes sense since we start from the last line and go
   733			 * backward.
   734			 * Don't know why we need y_off = max_y_off - y_off, but it's
   735			 * definitely required (I guess it's also related to the "going
   736			 * backward" situation).
   737			 */
   738			if (rotation & DRM_MODE_REFLECT_Y) {
   739				y_off = tile_h_mask - y_off;
   740				pitch0 = SCALER_PITCH0_TILE_LINE_DIR;
   741			} else {
   742				pitch0 = 0;
   743			}
   744	
   745			tiling = SCALER_CTL0_TILING_256B_OR_T;
   746			pitch0 |= (VC4_SET_FIELD(x_off, SCALER_PITCH0_SINK_PIX) |
   747				   VC4_SET_FIELD(y_off, SCALER_PITCH0_TILE_Y_OFFSET) |
   748				   VC4_SET_FIELD(tiles_l, SCALER_PITCH0_TILE_WIDTH_L) |
   749				   VC4_SET_FIELD(tiles_r, SCALER_PITCH0_TILE_WIDTH_R));
   750			vc4_state->offsets[0] += tiles_t * (tiles_w << tile_size_shift);
   751			vc4_state->offsets[0] += subtile_y << 8;
   752			vc4_state->offsets[0] += utile_y << 4;
   753	
   754			/* Rows of tiles alternate left-to-right and right-to-left. */
   755			if (tiles_t & 1) {
   756				pitch0 |= SCALER_PITCH0_TILE_INITIAL_LINE_DIR;
   757				vc4_state->offsets[0] += (tiles_w - tiles_l) <<
   758							 tile_size_shift;
   759				vc4_state->offsets[0] -= (1 + !tile_y) << 10;
   760			} else {
   761				vc4_state->offsets[0] += tiles_l << tile_size_shift;
   762				vc4_state->offsets[0] += tile_y << 10;
   763			}
   764	
   765			break;
   766		}
   767	
   768		case DRM_FORMAT_MOD_BROADCOM_SAND64:
   769		case DRM_FORMAT_MOD_BROADCOM_SAND128:
   770		case DRM_FORMAT_MOD_BROADCOM_SAND256: {
   771			uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
   772	
   773			if (param > SCALER_TILE_HEIGHT_MASK) {
   774				DRM_DEBUG_KMS("SAND height too large (%d)\n",
   775					      param);
   776				return -EINVAL;
   777			}
   778	
   779			if (fb->format->format == DRM_FORMAT_P030) {
   780				hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
   781				tiling = SCALER_CTL0_TILING_128B;
   782			} else {
   783				hvs_format = HVS_PIXEL_FORMAT_H264;
   784	
   785				switch (base_format_mod) {
   786				case DRM_FORMAT_MOD_BROADCOM_SAND64:
   787					tiling = SCALER_CTL0_TILING_64B;
   788					break;
   789				case DRM_FORMAT_MOD_BROADCOM_SAND128:
   790					tiling = SCALER_CTL0_TILING_128B;
   791					break;
   792				case DRM_FORMAT_MOD_BROADCOM_SAND256:
   793					tiling = SCALER_CTL0_TILING_256B_OR_T;
   794					break;
   795				default:
   796					return -EINVAL;
   797					break;
   798				}
   799			}
   800	
   801			/* Adjust the base pointer to the first pixel to be scanned
   802			 * out.
   803			 *
   804			 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
   805			 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
   806			 * word that should be taken as the first pixel.
   807			 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
   808			 * element within the 128bit word, eg for pixel 3 the value
   809			 * should be 6.
   810			 */
   811			for (i = 0; i < num_planes; i++) {
   812				u32 tile_w, tile, x_off, pix_per_tile;
   813	
   814				if (fb->format->format == DRM_FORMAT_P030) {
   815					/*
   816					 * Spec says: bits [31:4] of the given address
   817					 * should point to the 128-bit word containing
   818					 * the desired starting pixel, and bits[3:0]
   819					 * should be between 0 and 11, indicating which
   820					 * of the 12-pixels in that 128-bit word is the
   821					 * first pixel to be used
   822					 */
   823					u32 remaining_pixels = vc4_state->src_x % 96;
   824					u32 aligned = remaining_pixels / 12;
   825					u32 last_bits = remaining_pixels % 12;
   826	
   827					x_off = aligned * 16 + last_bits;
   828					tile_w = 128;
   829					pix_per_tile = 96;
   830				} else {
   831					switch (base_format_mod) {
   832					case DRM_FORMAT_MOD_BROADCOM_SAND64:
   833						tile_w = 64;
   834						break;
   835					case DRM_FORMAT_MOD_BROADCOM_SAND128:
   836						tile_w = 128;
   837						break;
   838					case DRM_FORMAT_MOD_BROADCOM_SAND256:
   839						tile_w = 256;
   840						break;
 > 841					default:
   842						break;
   843					}
   844					pix_per_tile = tile_w / fb->format->cpp[0];
   845					x_off = (vc4_state->src_x % pix_per_tile) /
   846						(i ? h_subsample : 1) *
   847						fb->format->cpp[i];
   848				}
   849	
   850				tile = vc4_state->src_x / pix_per_tile;
   851	
   852				vc4_state->offsets[i] += param * tile_w * tile;
   853				vc4_state->offsets[i] += src_y /
   854							 (i ? v_subsample : 1) *
   855							 tile_w;
   856				vc4_state->offsets[i] += x_off & ~(i ? 1 : 0);
   857			}
   858	
   859			pitch0 = VC4_SET_FIELD(param, SCALER_TILE_HEIGHT);
   860			break;
   861		}
   862	
   863		default:
   864			DRM_DEBUG_KMS("Unsupported FB tiling flag 0x%16llx",
   865				      (long long)fb->modifier);
   866			return -EINVAL;
   867		}
   868	
   869		/* Don't waste cycles mixing with plane alpha if the set alpha
   870		 * is opaque or there is no per-pixel alpha information.
   871		 * In any case we use the alpha property value as the fixed alpha.
   872		 */
   873		mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
   874				  fb->format->has_alpha;
   875	
   876		if (!vc4->hvs->hvs5) {
   877		/* Control word */
   878			vc4_dlist_write(vc4_state,
   879					SCALER_CTL0_VALID |
   880					(rotation & DRM_MODE_REFLECT_X ? SCALER_CTL0_HFLIP : 0) |
   881					(rotation & DRM_MODE_REFLECT_Y ? SCALER_CTL0_VFLIP : 0) |
   882					VC4_SET_FIELD(SCALER_CTL0_RGBA_EXPAND_ROUND, SCALER_CTL0_RGBA_EXPAND) |
   883					(format->pixel_order << SCALER_CTL0_ORDER_SHIFT) |
   884					(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
   885					VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
   886					(vc4_state->is_unity ? SCALER_CTL0_UNITY : 0) |
   887					VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
   888					VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1));
   889	
   890			/* Position Word 0: Image Positions and Alpha Value */
   891			vc4_state->pos0_offset = vc4_state->dlist_count;
   892			vc4_dlist_write(vc4_state,
   893					VC4_SET_FIELD(state->alpha >> 8, SCALER_POS0_FIXED_ALPHA) |
   894					VC4_SET_FIELD(vc4_state->crtc_x, SCALER_POS0_START_X) |
   895					VC4_SET_FIELD(vc4_state->crtc_y, SCALER_POS0_START_Y));
   896	
   897			/* Position Word 1: Scaled Image Dimensions. */
   898			if (!vc4_state->is_unity) {
   899				vc4_dlist_write(vc4_state,
   900						VC4_SET_FIELD(vc4_state->crtc_w,
   901							      SCALER_POS1_SCL_WIDTH) |
   902						VC4_SET_FIELD(vc4_state->crtc_h,
   903							      SCALER_POS1_SCL_HEIGHT));
   904			}
   905	
   906			/* Position Word 2: Source Image Size, Alpha */
   907			vc4_state->pos2_offset = vc4_state->dlist_count;
   908			vc4_dlist_write(vc4_state,
   909					VC4_SET_FIELD(fb->format->has_alpha ?
   910						      SCALER_POS2_ALPHA_MODE_PIPELINE :
   911						      SCALER_POS2_ALPHA_MODE_FIXED,
   912						      SCALER_POS2_ALPHA_MODE) |
   913					(mix_plane_alpha ? SCALER_POS2_ALPHA_MIX : 0) |
   914					(fb->format->has_alpha ?
   915							SCALER_POS2_ALPHA_PREMULT : 0) |
   916					VC4_SET_FIELD(vc4_state->src_w[0],
   917						      SCALER_POS2_WIDTH) |
   918					VC4_SET_FIELD(vc4_state->src_h[0],
   919						      SCALER_POS2_HEIGHT));
   920	
   921			/* Position Word 3: Context.  Written by the HVS. */
   922			vc4_dlist_write(vc4_state, 0xc0c0c0c0);
   923	
   924		} else {
   925			u32 hvs_pixel_order = format->pixel_order;
   926	
   927			if (format->pixel_order_hvs5)
   928				hvs_pixel_order = format->pixel_order_hvs5;
   929	
   930			/* Control word */
   931			vc4_dlist_write(vc4_state,
   932					SCALER_CTL0_VALID |
   933					(hvs_pixel_order << SCALER_CTL0_ORDER_SHIFT) |
   934					(hvs_format << SCALER_CTL0_PIXEL_FORMAT_SHIFT) |
   935					VC4_SET_FIELD(tiling, SCALER_CTL0_TILING) |
   936					(vc4_state->is_unity ?
   937							SCALER5_CTL0_UNITY : 0) |
   938					VC4_SET_FIELD(scl0, SCALER_CTL0_SCL0) |
   939					VC4_SET_FIELD(scl1, SCALER_CTL0_SCL1) |
   940					SCALER5_CTL0_ALPHA_EXPAND |
   941					SCALER5_CTL0_RGB_EXPAND);
   942	
   943			/* Position Word 0: Image Positions and Alpha Value */
   944			vc4_state->pos0_offset = vc4_state->dlist_count;
   945			vc4_dlist_write(vc4_state,
   946					(rotation & DRM_MODE_REFLECT_Y ?
   947							SCALER5_POS0_VFLIP : 0) |
   948					VC4_SET_FIELD(vc4_state->crtc_x,
   949						      SCALER_POS0_START_X) |
   950					(rotation & DRM_MODE_REFLECT_X ?
   951						      SCALER5_POS0_HFLIP : 0) |
   952					VC4_SET_FIELD(vc4_state->crtc_y,
   953						      SCALER5_POS0_START_Y)
   954				       );
   955	
   956			/* Control Word 2 */
   957			vc4_dlist_write(vc4_state,
   958					VC4_SET_FIELD(state->alpha >> 4,
   959						      SCALER5_CTL2_ALPHA) |
   960					(fb->format->has_alpha ?
   961						SCALER5_CTL2_ALPHA_PREMULT : 0) |
   962					(mix_plane_alpha ?
   963						SCALER5_CTL2_ALPHA_MIX : 0) |
   964					VC4_SET_FIELD(fb->format->has_alpha ?
   965					      SCALER5_CTL2_ALPHA_MODE_PIPELINE :
   966					      SCALER5_CTL2_ALPHA_MODE_FIXED,
   967					      SCALER5_CTL2_ALPHA_MODE)
   968				       );
   969	
   970			/* Position Word 1: Scaled Image Dimensions. */
   971			if (!vc4_state->is_unity) {
   972				vc4_dlist_write(vc4_state,
   973						VC4_SET_FIELD(vc4_state->crtc_w,
   974							      SCALER5_POS1_SCL_WIDTH) |
   975						VC4_SET_FIELD(vc4_state->crtc_h,
   976							      SCALER5_POS1_SCL_HEIGHT));
   977			}
   978	
   979			/* Position Word 2: Source Image Size */
   980			vc4_state->pos2_offset = vc4_state->dlist_count;
   981			vc4_dlist_write(vc4_state,
   982					VC4_SET_FIELD(vc4_state->src_w[0],
   983						      SCALER5_POS2_WIDTH) |
   984					VC4_SET_FIELD(vc4_state->src_h[0],
   985						      SCALER5_POS2_HEIGHT));
   986	
   987			/* Position Word 3: Context.  Written by the HVS. */
   988			vc4_dlist_write(vc4_state, 0xc0c0c0c0);
   989		}
   990	
   991	
   992		/* Pointer Word 0/1/2: RGB / Y / Cb / Cr Pointers
   993		 *
   994		 * The pointers may be any byte address.
   995		 */
   996		vc4_state->ptr0_offset = vc4_state->dlist_count;
   997		for (i = 0; i < num_planes; i++)
   998			vc4_dlist_write(vc4_state, vc4_state->offsets[i]);
   999	
  1000		/* Pointer Context Word 0/1/2: Written by the HVS */
  1001		for (i = 0; i < num_planes; i++)
  1002			vc4_dlist_write(vc4_state, 0xc0c0c0c0);
  1003	
  1004		/* Pitch word 0 */
  1005		vc4_dlist_write(vc4_state, pitch0);
  1006	
  1007		/* Pitch word 1/2 */
  1008		for (i = 1; i < num_planes; i++) {
  1009			if (hvs_format != HVS_PIXEL_FORMAT_H264 &&
  1010			    hvs_format != HVS_PIXEL_FORMAT_YCBCR_10BIT) {
  1011				vc4_dlist_write(vc4_state,
  1012						VC4_SET_FIELD(fb->pitches[i],
  1013							      SCALER_SRC_PITCH));
  1014			} else {
  1015				vc4_dlist_write(vc4_state, pitch0);
  1016			}
  1017		}
  1018	
  1019		/* Colorspace conversion words */
  1020		if (vc4_state->is_yuv) {
  1021			vc4_dlist_write(vc4_state, SCALER_CSC0_ITR_R_601_5);
  1022			vc4_dlist_write(vc4_state, SCALER_CSC1_ITR_R_601_5);
  1023			vc4_dlist_write(vc4_state, SCALER_CSC2_ITR_R_601_5);
  1024		}
  1025	
  1026		vc4_state->lbm_offset = 0;
  1027	
  1028		if (vc4_state->x_scaling[0] != VC4_SCALING_NONE ||
  1029		    vc4_state->x_scaling[1] != VC4_SCALING_NONE ||
  1030		    vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
  1031		    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
  1032			/* Reserve a slot for the LBM Base Address. The real value will
  1033			 * be set when calling vc4_plane_allocate_lbm().
  1034			 */
  1035			if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
  1036			    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
  1037				vc4_state->lbm_offset = vc4_state->dlist_count;
  1038				vc4_dlist_counter_increment(vc4_state);
  1039			}
  1040	
  1041			if (num_planes > 1) {
  1042				/* Emit Cb/Cr as channel 0 and Y as channel
  1043				 * 1. This matches how we set up scl0/scl1
  1044				 * above.
  1045				 */
  1046				vc4_write_scaling_parameters(state, 1);
  1047			}
  1048			vc4_write_scaling_parameters(state, 0);
  1049	
  1050			/* If any PPF setup was done, then all the kernel
  1051			 * pointers get uploaded.
  1052			 */
  1053			if (vc4_state->x_scaling[0] == VC4_SCALING_PPF ||
  1054			    vc4_state->y_scaling[0] == VC4_SCALING_PPF ||
  1055			    vc4_state->x_scaling[1] == VC4_SCALING_PPF ||
  1056			    vc4_state->y_scaling[1] == VC4_SCALING_PPF) {
  1057				u32 kernel = VC4_SET_FIELD(vc4->hvs->mitchell_netravali_filter.start,
  1058							   SCALER_PPF_KERNEL_OFFSET);
  1059	
  1060				/* HPPF plane 0 */
  1061				vc4_dlist_write(vc4_state, kernel);
  1062				/* VPPF plane 0 */
  1063				vc4_dlist_write(vc4_state, kernel);
  1064				/* HPPF plane 1 */
  1065				vc4_dlist_write(vc4_state, kernel);
  1066				/* VPPF plane 1 */
  1067				vc4_dlist_write(vc4_state, kernel);
  1068			}
  1069		}
  1070	
  1071		vc4_state->dlist[ctl0_offset] |=
  1072			VC4_SET_FIELD(vc4_state->dlist_count, SCALER_CTL0_SIZE);
  1073	
  1074		/* crtc_* are already clipped coordinates. */
  1075		covers_screen = vc4_state->crtc_x == 0 && vc4_state->crtc_y == 0 &&
  1076				vc4_state->crtc_w == state->crtc->mode.hdisplay &&
  1077				vc4_state->crtc_h == state->crtc->mode.vdisplay;
  1078		/* Background fill might be necessary when the plane has per-pixel
  1079		 * alpha content or a non-opaque plane alpha and could blend from the
  1080		 * background or does not cover the entire screen.
  1081		 */
  1082		vc4_state->needs_bg_fill = fb->format->has_alpha || !covers_screen ||
  1083					   state->alpha != DRM_BLEND_ALPHA_OPAQUE;
  1084	
  1085		/* Flag the dlist as initialized to avoid checking it twice in case
  1086		 * the async update check already called vc4_plane_mode_set() and
  1087		 * decided to fallback to sync update because async update was not
  1088		 * possible.
  1089		 */
  1090		vc4_state->dlist_initialized = 1;
  1091	
  1092		vc4_plane_calc_load(state);
  1093	
  1094		return 0;
  1095	}
  1096	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
