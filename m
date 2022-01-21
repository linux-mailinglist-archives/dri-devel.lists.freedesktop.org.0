Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F0495B9A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEC010E95A;
	Fri, 21 Jan 2022 08:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C2910E93D;
 Fri, 21 Jan 2022 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642752590; x=1674288590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9eCnnVoisnALK21LvOR79mW1JyjlHKslSklWwRtY65Q=;
 b=PQacX9RoA9kSLCF5VxjwdFFT87nfH8JKOW5rMWpqw3K5tc6DtVr5DWE2
 SoA/yhwB46/uKYl3rj/EOqR7IQYRQlkJ1Dm+Ff7N1+5TBmcCQux01xewp
 FK/RW6vn05W8Wpn6uZYs2iz0TqJ+Fjnj0cxyC1qGFkumIAoJX6Kk2VcvM
 hH2Xb3WP/yGfD0Ts+2ZWXR7SPC51zC7VYIxt1G/bZw4G2gAld+ICMruR1
 CNHzJc0wghxT9VXticFaARbz4ZH3CkMStpI0x+Ew5zkXSsHxvgG4n0h0U
 oXtYjdDY8+0DKsGwWWDCJyT/s9XtAAgtzj2GfOvUpA7pZ6UjLPmyABZGM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306319472"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="306319472"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 00:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="579529046"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2022 00:09:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAozK-000F5Y-8k; Fri, 21 Jan 2022 08:09:38 +0000
Date: Fri, 21 Jan 2022 16:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add needs_compact_pt flag
Message-ID: <202201211550.31D9jnOx-lkp@intel.com>
References: <20220120162102.10652-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120162102.10652-1-ramalingam.c@intel.com>
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
Cc: kbuild-all@lists.01.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ramalingam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next next-20220121]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ramalingam-C/drm-i915-Add-needs_compact_pt-flag/20220121-002256
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20220121/202201211550.31D9jnOx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/cf1a6660ac07b3b3618b35dccab57042d592ea2c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ramalingam-C/drm-i915-Add-needs_compact_pt-flag/20220121-002256
        git checkout cf1a6660ac07b3b3618b35dccab57042d592ea2c
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:11,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_engine.h:18,
                    from drivers/gpu/drm/i915/i915_drv.h:83,
                    from drivers/gpu/drm/i915/display/intel_cdclk.h:11,
                    from drivers/gpu/drm/i915/i915_driver.c:50:
>> drivers/gpu/drm/i915/intel_device_info.h:274: error: unterminated argument list invoking macro "DEFINE_FLAG"
     274 | #endif
         | 
>> drivers/gpu/drm/i915/intel_device_info.h:201:25: error: expected specifier-qualifier-list before 'DEFINE_FLAG'
     201 |  DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
         |                         ^~~~~~~~~~~
   drivers/gpu/drm/i915/intel_device_info.h:130:2: note: in definition of macro 'DEV_INFO_FOR_EACH_FLAG'
     130 |  func(needs_compact_pt; \
         |  ^~~~
--
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:11,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19,
                    from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9,
                    from drivers/gpu/drm/i915/gt/intel_gt_types.h:18,
                    from drivers/gpu/drm/i915/gt/intel_engine.h:18,
                    from drivers/gpu/drm/i915/i915_drv.h:83,
                    from drivers/gpu/drm/i915/display/intel_cdclk.h:11,
                    from drivers/gpu/drm/i915/intel_device_info.c:28:
>> drivers/gpu/drm/i915/intel_device_info.h:274: error: unterminated argument list invoking macro "DEFINE_FLAG"
     274 | #endif
         | 
>> drivers/gpu/drm/i915/intel_device_info.h:201:25: error: expected specifier-qualifier-list before 'DEFINE_FLAG'
     201 |  DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
         |                         ^~~~~~~~~~~
   drivers/gpu/drm/i915/intel_device_info.h:130:2: note: in definition of macro 'DEV_INFO_FOR_EACH_FLAG'
     130 |  func(needs_compact_pt; \
         |  ^~~~
>> drivers/gpu/drm/i915/intel_device_info.c:396: error: unterminated argument list invoking macro "PRINT_FLAG"
     396 | }
         | 


vim +/DEFINE_FLAG +274 drivers/gpu/drm/i915/intel_device_info.h

a5b7ef27da60c9 José Roberto de Souza  2021-10-19  178  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  179  struct intel_device_info {
a5b7ef27da60c9 José Roberto de Souza  2021-10-19  180  	struct ip_version graphics;
a5b7ef27da60c9 José Roberto de Souza  2021-10-19  181  	struct ip_version media;
93babb061e2ab5 Lucas De Marchi        2021-04-12  182  
792592e72aba41 Daniele Ceraolo Spurio 2020-07-07  183  	intel_engine_mask_t platform_engine_mask; /* Engines supported by the HW */
b978520d1e35b9 Michal Wajdeczko       2017-12-21  184  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  185  	enum intel_platform platform;
b978520d1e35b9 Michal Wajdeczko       2017-12-21  186  
31a02eb70b8d9e Michael J. Ruhl        2020-04-17  187  	unsigned int dma_mask_size; /* available DMA address bits */
31a02eb70b8d9e Michael J. Ruhl        2020-04-17  188  
cbecbccaa120fd Chris Wilson           2019-03-14  189  	enum intel_ppgtt_type ppgtt_type;
cbecbccaa120fd Chris Wilson           2019-03-14  190  	unsigned int ppgtt_size; /* log2, e.g. 31/32/48 bits */
cbecbccaa120fd Chris Wilson           2019-03-14  191  
4552f50a439c36 Tvrtko Ursulin         2018-02-22  192  	unsigned int page_sizes; /* page sizes supported by the HW */
3aae9d08532c8e Abdiel Janulgue        2019-10-18  193  
3aae9d08532c8e Abdiel Janulgue        2019-10-18  194  	u32 memory_regions; /* regions supported by the HW */
4552f50a439c36 Tvrtko Ursulin         2018-02-22  195  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  196  	u32 display_mmio_offset;
b978520d1e35b9 Michal Wajdeczko       2017-12-21  197  
938c778f6a22fa John Harrison          2021-07-23  198  	u8 gt; /* GT number, 0 if undefined */
938c778f6a22fa John Harrison          2021-07-23  199  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  200  #define DEFINE_FLAG(name) u8 name:1
b978520d1e35b9 Michal Wajdeczko       2017-12-21 @201  	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
b978520d1e35b9 Michal Wajdeczko       2017-12-21  202  #undef DEFINE_FLAG
d53db442db36fd José Roberto de Souza  2018-11-30  203  
d53db442db36fd José Roberto de Souza  2018-11-30  204  	struct {
4df9c1ae7a4bb9 Lucas De Marchi        2021-04-12  205  		u8 ver;
a5b7ef27da60c9 José Roberto de Souza  2021-10-19  206  		u8 rel;
01eb15c9165e41 Matt Roper             2021-03-19  207  
6678916dfa0125 Ville Syrjälä          2021-12-10  208  		u8 pipe_mask;
6678916dfa0125 Ville Syrjälä          2021-12-10  209  		u8 cpu_transcoder_mask;
6678916dfa0125 Ville Syrjälä          2021-12-10  210  		u8 abox_mask;
6678916dfa0125 Ville Syrjälä          2021-12-10  211  
d53db442db36fd José Roberto de Souza  2018-11-30  212  #define DEFINE_FLAG(name) u8 name:1
d53db442db36fd José Roberto de Souza  2018-11-30  213  		DEV_INFO_DISPLAY_FOR_EACH_FLAG(DEFINE_FLAG);
d53db442db36fd José Roberto de Souza  2018-11-30  214  #undef DEFINE_FLAG
d53db442db36fd José Roberto de Souza  2018-11-30  215  	} display;
d53db442db36fd José Roberto de Souza  2018-11-30  216  
708de86e10e593 Ville Syrjälä          2021-04-16  217  	struct {
708de86e10e593 Ville Syrjälä          2021-04-16  218  		u16 size; /* in blocks */
578e6edec45cf8 Ville Syrjälä          2021-04-16  219  		u8 slice_mask;
708de86e10e593 Ville Syrjälä          2021-04-16  220  	} dbuf;
b978520d1e35b9 Michal Wajdeczko       2017-12-21  221  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  222  	/* Register offsets for the various display pipes and transcoders */
b978520d1e35b9 Michal Wajdeczko       2017-12-21  223  	int pipe_offsets[I915_MAX_TRANSCODERS];
b978520d1e35b9 Michal Wajdeczko       2017-12-21  224  	int trans_offsets[I915_MAX_TRANSCODERS];
b978520d1e35b9 Michal Wajdeczko       2017-12-21  225  	int cursor_offsets[I915_MAX_PIPES];
b978520d1e35b9 Michal Wajdeczko       2017-12-21  226  
0258404f9d3859 Jani Nikula            2018-12-31  227  	struct color_luts {
89a72304f2f3d4 Shashank Sharma        2019-06-12  228  		u32 degamma_lut_size;
89a72304f2f3d4 Shashank Sharma        2019-06-12  229  		u32 gamma_lut_size;
e4c0d5314dede3 Matt Roper             2019-01-30  230  		u32 degamma_lut_tests;
e4c0d5314dede3 Matt Roper             2019-01-30  231  		u32 gamma_lut_tests;
0258404f9d3859 Jani Nikula            2018-12-31  232  	} color;
0258404f9d3859 Jani Nikula            2018-12-31  233  };
0258404f9d3859 Jani Nikula            2018-12-31  234  
0258404f9d3859 Jani Nikula            2018-12-31  235  struct intel_runtime_info {
805446c8347c9e Tvrtko Ursulin         2019-03-27  236  	/*
805446c8347c9e Tvrtko Ursulin         2019-03-27  237  	 * Platform mask is used for optimizing or-ed IS_PLATFORM calls into
805446c8347c9e Tvrtko Ursulin         2019-03-27  238  	 * into single runtime conditionals, and also to provide groundwork
805446c8347c9e Tvrtko Ursulin         2019-03-27  239  	 * for future per platform, or per SKU build optimizations.
805446c8347c9e Tvrtko Ursulin         2019-03-27  240  	 *
805446c8347c9e Tvrtko Ursulin         2019-03-27  241  	 * Array can be extended when necessary if the corresponding
805446c8347c9e Tvrtko Ursulin         2019-03-27  242  	 * BUILD_BUG_ON is hit.
805446c8347c9e Tvrtko Ursulin         2019-03-27  243  	 */
805446c8347c9e Tvrtko Ursulin         2019-03-27  244  	u32 platform_mask[2];
805446c8347c9e Tvrtko Ursulin         2019-03-27  245  
0258404f9d3859 Jani Nikula            2018-12-31  246  	u16 device_id;
0258404f9d3859 Jani Nikula            2018-12-31  247  
0258404f9d3859 Jani Nikula            2018-12-31  248  	u8 num_sprites[I915_MAX_PIPES];
0258404f9d3859 Jani Nikula            2018-12-31  249  	u8 num_scalers[I915_MAX_PIPES];
0258404f9d3859 Jani Nikula            2018-12-31  250  
b04002f4dbee03 Chris Wilson           2020-02-16  251  	u32 rawclk_freq;
439c8dccb6a7f7 Jani Nikula            2021-03-26  252  
5644dc0a75674d Jani Nikula            2021-03-26  253  	struct intel_step_info step;
b978520d1e35b9 Michal Wajdeczko       2017-12-21  254  };
b978520d1e35b9 Michal Wajdeczko       2017-12-21  255  
3fed180812edeb Chris Wilson           2018-02-07  256  struct intel_driver_caps {
3fed180812edeb Chris Wilson           2018-02-07  257  	unsigned int scheduler;
481827b441674b Chris Wilson           2018-07-06  258  	bool has_logical_contexts:1;
3fed180812edeb Chris Wilson           2018-02-07  259  };
3fed180812edeb Chris Wilson           2018-02-07  260  
b978520d1e35b9 Michal Wajdeczko       2017-12-21  261  const char *intel_platform_name(enum intel_platform platform);
b978520d1e35b9 Michal Wajdeczko       2017-12-21  262  
805446c8347c9e Tvrtko Ursulin         2019-03-27  263  void intel_device_info_subplatform_init(struct drm_i915_private *dev_priv);
1400cc7e0dcdf1 Jani Nikula            2018-12-31  264  void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
7240497850f76e Chris Wilson           2019-12-07  265  
7240497850f76e Chris Wilson           2019-12-07  266  void intel_device_info_print_static(const struct intel_device_info *info,
b978520d1e35b9 Michal Wajdeczko       2017-12-21  267  				    struct drm_printer *p);
7240497850f76e Chris Wilson           2019-12-07  268  void intel_device_info_print_runtime(const struct intel_runtime_info *info,
5fbbe8d4e10235 Michal Wajdeczko       2017-12-21  269  				     struct drm_printer *p);
b978520d1e35b9 Michal Wajdeczko       2017-12-21  270  
3fed180812edeb Chris Wilson           2018-02-07  271  void intel_driver_caps_print(const struct intel_driver_caps *caps,
3fed180812edeb Chris Wilson           2018-02-07  272  			     struct drm_printer *p);
3fed180812edeb Chris Wilson           2018-02-07  273  
b978520d1e35b9 Michal Wajdeczko       2017-12-21 @274  #endif

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
