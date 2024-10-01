Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04698B309
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 06:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5306A10E5CB;
	Tue,  1 Oct 2024 04:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cs/+W0M6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A57210E5CB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 04:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727756937; x=1759292937;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SHJu6JkJy+sC4voXU/6ZBpQ9ICttzKY9O2x0/+V4MhM=;
 b=cs/+W0M6YFwao9Iy0rDYewGH/bc/Gy0j31zVrTiknHNLCUDbOO462h5W
 NyVdntNLQkj35Pu3sa3zvbJJBlVOjgG3rXdv4ZztY37nJ17rfSWBdtW1O
 T/7Ci2RRobLaDVpLZ9MPlLKo63rI6agF8M5IOigDkOdY53qVhnbrb9kr1
 8bZZFDg8prFeDb83U+gwD+TNBaKTFgDa4OFUbKX3QpN6HKBGlfM5TDqGG
 1td4ZcRKqygAbGGr4RSNFW836D9XcSg9paMf/iE4vUmtWD42twoRlp012
 V7H826hrLMiohTMb9TpnaEC3kXToxOm9IpY7hTzG+k0wi7GAoAhX3tCUf A==;
X-CSE-ConnectionGUID: ZvVBxVRqSjm3b7jVmaakdg==
X-CSE-MsgGUID: NAVfz1RFQ4OkbQKxR1SOgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26966095"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26966095"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 21:28:57 -0700
X-CSE-ConnectionGUID: HwnQEFVlR3K4MvQHkJI6Yg==
X-CSE-MsgGUID: vm3x0LTdQjW3AuEXtqF9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104347815"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 30 Sep 2024 21:28:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1svUVG-000QEb-20;
 Tue, 01 Oct 2024 04:28:50 +0000
Date: Tue, 1 Oct 2024 12:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anastasia Belova <abelova@astralinux.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Anastasia Belova <abelova@astralinux.ru>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/meson: switch to a managed drm device
Message-ID: <202410011034.NTOKwoXq-lkp@intel.com>
References: <20240930082640.129543-1-abelova@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930082640.129543-1-abelova@astralinux.ru>
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

Hi Anastasia,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc1 next-20240930]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anastasia-Belova/drm-meson-switch-to-a-managed-drm-device/20240930-162755
base:   linus/master
patch link:    https://lore.kernel.org/r/20240930082640.129543-1-abelova%40astralinux.ru
patch subject: [PATCH v3] drm/meson: switch to a managed drm device
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241001/202410011034.NTOKwoXq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011034.NTOKwoXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011034.NTOKwoXq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/meson/meson_viu.c:14:
>> drivers/gpu/drm/meson/meson_drv.h:56:27: error: field 'drm' has incomplete type
      56 |         struct drm_device drm;
         |                           ^~~
--
   drivers/gpu/drm/meson/meson_encoder_hdmi.c: In function 'meson_encoder_hdmi_probe':
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c:405:43: error: incompatible type for argument 1 of 'drm_simple_encoder_init'
     405 |         ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
         |                                       ~~~~^~~~~
         |                                           |
         |                                           struct drm_device
   In file included from drivers/gpu/drm/meson/meson_encoder_hdmi.c:27:
   include/drm/drm_simple_kms_helper.h:261:48: note: expected 'struct drm_device *' but argument is of type 'struct drm_device'
     261 | int drm_simple_encoder_init(struct drm_device *dev,
         |                             ~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/meson/meson_encoder_hdmi.c:423:71: error: incompatible type for argument 1 of 'drm_bridge_connector_init'
     423 |         meson_encoder_hdmi->connector = drm_bridge_connector_init(priv->drm,
         |                                                                   ~~~~^~~~~
         |                                                                       |
         |                                                                       struct drm_device
   In file included from drivers/gpu/drm/meson/meson_encoder_hdmi.c:23:
   include/drm/drm_bridge_connector.h:13:68: note: expected 'struct drm_device *' but argument is of type 'struct drm_device'
      13 | struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
         |                                                 ~~~~~~~~~~~~~~~~~~~^~~
--
   drivers/gpu/drm/meson/meson_encoder_dsi.c: In function 'meson_encoder_dsi_probe':
>> drivers/gpu/drm/meson/meson_encoder_dsi.c:135:43: error: incompatible type for argument 1 of 'drm_simple_encoder_init'
     135 |         ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
         |                                       ~~~~^~~~~
         |                                           |
         |                                           struct drm_device
   In file included from drivers/gpu/drm/meson/meson_encoder_dsi.c:13:
   include/drm/drm_simple_kms_helper.h:261:48: note: expected 'struct drm_device *' but argument is of type 'struct drm_device'
     261 | int drm_simple_encoder_init(struct drm_device *dev,
         |                             ~~~~~~~~~~~~~~~~~~~^~~


vim +/drm +56 drivers/gpu/drm/meson/meson_drv.h

    42	
    43	struct meson_drm {
    44		struct device *dev;
    45		enum vpu_compatible compat;
    46		void __iomem *io_base;
    47		struct regmap *hhi;
    48		int vsync_irq;
    49	
    50		struct meson_canvas *canvas;
    51		u8 canvas_id_osd1;
    52		u8 canvas_id_vd1_0;
    53		u8 canvas_id_vd1_1;
    54		u8 canvas_id_vd1_2;
    55	
  > 56		struct drm_device drm;
    57		struct drm_crtc *crtc;
    58		struct drm_plane *primary_plane;
    59		struct drm_plane *overlay_plane;
    60		void *encoders[MESON_ENC_LAST];
    61	
    62		const struct meson_drm_soc_limits *limits;
    63	
    64		/* Components Data */
    65		struct {
    66			bool osd1_enabled;
    67			bool osd1_interlace;
    68			bool osd1_commit;
    69			bool osd1_afbcd;
    70			uint32_t osd1_ctrl_stat;
    71			uint32_t osd1_ctrl_stat2;
    72			uint32_t osd1_blk0_cfg[5];
    73			uint32_t osd1_blk1_cfg4;
    74			uint32_t osd1_blk2_cfg4;
    75			uint32_t osd1_addr;
    76			uint32_t osd1_stride;
    77			uint32_t osd1_height;
    78			uint32_t osd1_width;
    79			uint32_t osd_sc_ctrl0;
    80			uint32_t osd_sc_i_wh_m1;
    81			uint32_t osd_sc_o_h_start_end;
    82			uint32_t osd_sc_o_v_start_end;
    83			uint32_t osd_sc_v_ini_phase;
    84			uint32_t osd_sc_v_phase_step;
    85			uint32_t osd_sc_h_ini_phase;
    86			uint32_t osd_sc_h_phase_step;
    87			uint32_t osd_sc_h_ctrl0;
    88			uint32_t osd_sc_v_ctrl0;
    89			uint32_t osd_blend_din0_scope_h;
    90			uint32_t osd_blend_din0_scope_v;
    91			uint32_t osb_blend0_size;
    92			uint32_t osb_blend1_size;
    93	
    94			bool vd1_enabled;
    95			bool vd1_commit;
    96			bool vd1_afbc;
    97			unsigned int vd1_planes;
    98			uint32_t vd1_if0_gen_reg;
    99			uint32_t vd1_if0_luma_x0;
   100			uint32_t vd1_if0_luma_y0;
   101			uint32_t vd1_if0_chroma_x0;
   102			uint32_t vd1_if0_chroma_y0;
   103			uint32_t vd1_if0_repeat_loop;
   104			uint32_t vd1_if0_luma0_rpt_pat;
   105			uint32_t vd1_if0_chroma0_rpt_pat;
   106			uint32_t vd1_range_map_y;
   107			uint32_t vd1_range_map_cb;
   108			uint32_t vd1_range_map_cr;
   109			uint32_t viu_vd1_fmt_w;
   110			uint32_t vd1_if0_canvas0;
   111			uint32_t vd1_if0_gen_reg2;
   112			uint32_t viu_vd1_fmt_ctrl;
   113			uint32_t vd1_addr0;
   114			uint32_t vd1_addr1;
   115			uint32_t vd1_addr2;
   116			uint32_t vd1_stride0;
   117			uint32_t vd1_stride1;
   118			uint32_t vd1_stride2;
   119			uint32_t vd1_height0;
   120			uint32_t vd1_height1;
   121			uint32_t vd1_height2;
   122			uint32_t vd1_afbc_mode;
   123			uint32_t vd1_afbc_en;
   124			uint32_t vd1_afbc_head_addr;
   125			uint32_t vd1_afbc_body_addr;
   126			uint32_t vd1_afbc_conv_ctrl;
   127			uint32_t vd1_afbc_dec_def_color;
   128			uint32_t vd1_afbc_vd_cfmt_ctrl;
   129			uint32_t vd1_afbc_vd_cfmt_w;
   130			uint32_t vd1_afbc_vd_cfmt_h;
   131			uint32_t vd1_afbc_mif_hor_scope;
   132			uint32_t vd1_afbc_mif_ver_scope;
   133			uint32_t vd1_afbc_size_out;
   134			uint32_t vd1_afbc_pixel_hor_scope;
   135			uint32_t vd1_afbc_pixel_ver_scope;
   136			uint32_t vd1_afbc_size_in;
   137			uint32_t vpp_pic_in_height;
   138			uint32_t vpp_postblend_vd1_h_start_end;
   139			uint32_t vpp_postblend_vd1_v_start_end;
   140			uint32_t vpp_hsc_region12_startp;
   141			uint32_t vpp_hsc_region34_startp;
   142			uint32_t vpp_hsc_region4_endp;
   143			uint32_t vpp_hsc_start_phase_step;
   144			uint32_t vpp_hsc_region1_phase_slope;
   145			uint32_t vpp_hsc_region3_phase_slope;
   146			uint32_t vpp_line_in_length;
   147			uint32_t vpp_preblend_h_size;
   148			uint32_t vpp_vsc_region12_startp;
   149			uint32_t vpp_vsc_region34_startp;
   150			uint32_t vpp_vsc_region4_endp;
   151			uint32_t vpp_vsc_start_phase_step;
   152			uint32_t vpp_vsc_ini_phase;
   153			uint32_t vpp_vsc_phase_ctrl;
   154			uint32_t vpp_hsc_phase_ctrl;
   155			uint32_t vpp_blend_vd2_h_start_end;
   156			uint32_t vpp_blend_vd2_v_start_end;
   157		} viu;
   158	
   159		struct {
   160			unsigned int current_mode;
   161			bool hdmi_repeat;
   162			bool venc_repeat;
   163			bool hdmi_use_enci;
   164		} venc;
   165	
   166		struct {
   167			dma_addr_t addr_dma;
   168			uint32_t *addr;
   169			unsigned int offset;
   170		} rdma;
   171	
   172		struct {
   173			struct meson_afbcd_ops *ops;
   174			u64 modifier;
   175			u32 format;
   176		} afbcd;
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
