Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD2CD3F98
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 12:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7210E153;
	Sun, 21 Dec 2025 11:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eb6yIGPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F4D10E148;
 Sun, 21 Dec 2025 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766317562; x=1797853562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hNticeYrhbgedCpyivCwr1JOQvHRGT9VvwItlx4KQic=;
 b=Eb6yIGPTR+x52ODDw774s5wYJrw17v1QGmNi0emuSC3JeqyWkIhGl5cw
 6qUle7ehOWZX6ebXVnvS+c0achvd1h3OnV9xabS7slXCePOcjOZ2xL76O
 qelQ7d80h5/WasF9DucAQ/SMvLBel7jhG7ayhIuIerkf7yUp52J4+ngPf
 PX5o/VRvqsywYcdsmOfVSiPeukYy3MGDvax919NhNpqbkZdk07JN85MHh
 CCBN5pNQ4G6jQilf/W6xQnstJpBQ/eIJb2VXCTXfNz/nzgNbjWuWk8hbl
 2lAhM7fJjnaYjyCOEcmiJLqqg6yIDUO/+v4ggutG6AdF7vFyxQ/634m9T w==;
X-CSE-ConnectionGUID: FT660tBKQimK5/5PxS5hsg==
X-CSE-MsgGUID: 6mlRFSJdTXCpRhUJya9S1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90866900"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="90866900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 03:46:01 -0800
X-CSE-ConnectionGUID: K4pXIB+VRIKuRpJOyRUefQ==
X-CSE-MsgGUID: BbMLTr1vTHqzA3g1v08j0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="203818005"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
 by orviesa004.jf.intel.com with ESMTP; 21 Dec 2025 03:45:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vXHsq-0000000051U-1Tcp;
 Sun, 21 Dec 2025 11:45:56 +0000
Date: Sun, 21 Dec 2025 12:45:01 +0100
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, Simon Ser <contact@emersion.fr>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH] drm/atomic: convert drm_atomic_get_{old,
 new}_colorop_state() into proper functions
Message-ID: <202512211205.IzU0HLpV-lkp@intel.com>
References: <20251218141527.405328-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218141527.405328-1-jani.nikula@intel.com>
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

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-atomic-convert-drm_atomic_get_-old-new-_colorop_state-into-proper-functions/20251218-221750
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251218141527.405328-1-jani.nikula%40intel.com
patch subject: [PATCH] drm/atomic: convert drm_atomic_get_{old, new}_colorop_state() into proper functions
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512211205.IzU0HLpV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211205.IzU0HLpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211205.IzU0HLpV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_drv.c: In function 'vkms_destroy':
>> drivers/gpu/drm/vkms/vkms_drv.c:261:9: error: implicit declaration of function 'drm_colorop_pipeline_destroy' [-Wimplicit-function-declaration]
     261 |         drm_colorop_pipeline_destroy(&config->dev->drm);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/vkms/vkms_composer.c: In function 'apply_colorop':
>> drivers/gpu/drm/vkms/vkms_composer.c:164:58: error: invalid use of undefined type 'struct drm_colorop'
     164 |         struct drm_colorop_state *colorop_state = colorop->state;
         |                                                          ^~
   drivers/gpu/drm/vkms/vkms_composer.c:165:41: error: invalid use of undefined type 'struct drm_colorop'
     165 |         struct drm_device *dev = colorop->dev;
         |                                         ^~
   drivers/gpu/drm/vkms/vkms_composer.c:167:20: error: invalid use of undefined type 'struct drm_colorop'
     167 |         if (colorop->type == DRM_COLOROP_1D_CURVE) {
         |                    ^~
>> drivers/gpu/drm/vkms/vkms_composer.c:168:38: error: invalid use of undefined type 'struct drm_colorop_state'
     168 |                 switch (colorop_state->curve_1d_type) {
         |                                      ^~
>> drivers/gpu/drm/vkms/vkms_composer.c:169:22: error: 'DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF' undeclared (first use in this function)
     169 |                 case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:169:22: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/vkms/vkms_composer.c:174:22: error: 'DRM_COLOROP_1D_CURVE_SRGB_EOTF' undeclared (first use in this function); did you mean 'DRM_COLOROP_1D_CURVE'?
     174 |                 case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      DRM_COLOROP_1D_CURVE
   In file included from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/nospec-branch.h:10,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/vkms/vkms_composer.c:5:
   drivers/gpu/drm/vkms/vkms_composer.c:182:52: error: invalid use of undefined type 'struct drm_colorop_state'
     182 |                                       colorop_state->curve_1d_type);
         |                                                    ^~
   arch/x86/include/asm/bug.h:175:74: note: in definition of macro '__WARN_print_arg'
     175 |         static_call_mod(WARN_trap)(__WARN_bug_entry(__flags, format), ## arg); \
         |                                                                          ^~~
   include/drm/drm_print.h:784:9: note: in expansion of macro 'WARN_ONCE'
     784 |         WARN_ONCE(condition, "%s %s: [drm] " format,                    \
         |         ^~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:180:25: note: in expansion of macro 'drm_WARN_ONCE'
     180 |                         drm_WARN_ONCE(dev, true,
         |                         ^~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:185:27: error: invalid use of undefined type 'struct drm_colorop'
     185 |         } else if (colorop->type == DRM_COLOROP_CTM_3X4) {
         |                           ^~
   drivers/gpu/drm/vkms/vkms_composer.c:186:34: error: invalid use of undefined type 'struct drm_colorop_state'
     186 |                 if (colorop_state->data)
         |                                  ^~
   drivers/gpu/drm/vkms/vkms_composer.c:188:83: error: invalid use of undefined type 'struct drm_colorop_state'
     188 |                                          (struct drm_color_ctm_3x4 *)colorop_state->data->data);
         |                                                                                   ^~
   drivers/gpu/drm/vkms/vkms_composer.c: In function 'pre_blend_color_transform':
   drivers/gpu/drm/vkms/vkms_composer.c:218:48: error: invalid use of undefined type 'struct drm_colorop'
     218 |                         colorop_state = colorop->state;
         |                                                ^~
   drivers/gpu/drm/vkms/vkms_composer.c:223:43: error: invalid use of undefined type 'struct drm_colorop_state'
     223 |                         if (!colorop_state->bypass)
         |                                           ^~
   drivers/gpu/drm/vkms/vkms_composer.c:226:42: error: invalid use of undefined type 'struct drm_colorop'
     226 |                         colorop = colorop->next;
         |                                          ^~


vim +164 drivers/gpu/drm/vkms/vkms_composer.c

ea3f6baf3196c3 Harry Wentland 2025-11-14  161  
bff4d3cd3c9fcd Harry Wentland 2025-11-14  162  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
c1e578bd08da79 Harry Wentland 2025-11-14  163  {
c1e578bd08da79 Harry Wentland 2025-11-14 @164  	struct drm_colorop_state *colorop_state = colorop->state;
c1e578bd08da79 Harry Wentland 2025-11-14  165  	struct drm_device *dev = colorop->dev;
c1e578bd08da79 Harry Wentland 2025-11-14  166  
c1e578bd08da79 Harry Wentland 2025-11-14  167  	if (colorop->type == DRM_COLOROP_1D_CURVE) {
c1e578bd08da79 Harry Wentland 2025-11-14 @168  		switch (colorop_state->curve_1d_type) {
c1e578bd08da79 Harry Wentland 2025-11-14 @169  		case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
c1e578bd08da79 Harry Wentland 2025-11-14  170  			pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
c1e578bd08da79 Harry Wentland 2025-11-14  171  			pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
c1e578bd08da79 Harry Wentland 2025-11-14  172  			pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
c1e578bd08da79 Harry Wentland 2025-11-14  173  			break;
c1e578bd08da79 Harry Wentland 2025-11-14 @174  		case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
c1e578bd08da79 Harry Wentland 2025-11-14  175  			pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
c1e578bd08da79 Harry Wentland 2025-11-14  176  			pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
c1e578bd08da79 Harry Wentland 2025-11-14  177  			pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
c1e578bd08da79 Harry Wentland 2025-11-14  178  			break;
c1e578bd08da79 Harry Wentland 2025-11-14  179  		default:
c1e578bd08da79 Harry Wentland 2025-11-14  180  			drm_WARN_ONCE(dev, true,
c1e578bd08da79 Harry Wentland 2025-11-14  181  				      "unknown colorop 1D curve type %d\n",
c1e578bd08da79 Harry Wentland 2025-11-14  182  				      colorop_state->curve_1d_type);
c1e578bd08da79 Harry Wentland 2025-11-14  183  			break;
c1e578bd08da79 Harry Wentland 2025-11-14  184  		}
ea3f6baf3196c3 Harry Wentland 2025-11-14  185  	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
ea3f6baf3196c3 Harry Wentland 2025-11-14  186  		if (colorop_state->data)
ea3f6baf3196c3 Harry Wentland 2025-11-14  187  			apply_3x4_matrix(pixel,
ea3f6baf3196c3 Harry Wentland 2025-11-14  188  					 (struct drm_color_ctm_3x4 *)colorop_state->data->data);
c1e578bd08da79 Harry Wentland 2025-11-14  189  	}
c1e578bd08da79 Harry Wentland 2025-11-14  190  }
c1e578bd08da79 Harry Wentland 2025-11-14  191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
