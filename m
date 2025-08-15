Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDAB285FD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 20:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B92610E278;
	Fri, 15 Aug 2025 18:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SB2Eg6K7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996A010E031;
 Fri, 15 Aug 2025 18:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755283775; x=1786819775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DlE/fj8sPL0XMQlCBdjMpSx6Fc4oW5PoWJ6kRKHY17Y=;
 b=SB2Eg6K7RHG6NSm7sG9kpcadFvGKLLmohVbIC80lHw8kkFXnnuQwxOIK
 wdQbjd0lO87a5nFZvt6A4jO++F5vMRwaUVNzz4gLE6T4moLMOlYgpO8Qs
 URtwD3qhnf0k4uwRNiA6iMblC3Xza7brojuKIFMVR3wmzuftdbjtICw/8
 IZ9EppBwEyKzJ2h6IxhJr/tufj4XvZPHnPSg7hPwgQl0RxcvPwT/QUXoG
 TLn0YslsVplm0wkDn+zWj8jKLflPGAlWNTSuosHwmsJS1t9reXJz9cN7v
 zHEH6fMumYfd6vKYu80tAqc8nK455Bwg6uafWqtrcNJLqVv+MSp3ZZIDc Q==;
X-CSE-ConnectionGUID: nlj+vfNiRN6J+py/Dceebg==
X-CSE-MsgGUID: 61OoSm1cTAKryfV7l0Rr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68210778"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="68210778"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 11:49:34 -0700
X-CSE-ConnectionGUID: 2OcuY8pMR6u9WtT9jKZxmA==
X-CSE-MsgGUID: 2SB3rMFORvOw+ylIle5nHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166290707"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 15 Aug 2025 11:49:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1umzU8-000CFY-11;
 Fri, 15 Aug 2025 18:49:12 +0000
Date: Sat, 16 Aug 2025 02:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, alex.hung@amd.com, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com,
 aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com
Subject: Re: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <202508160245.qVEHX6YB-lkp@intel.com>
References: <20250815035047.3319284-3-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815035047.3319284-3-alex.hung@amd.com>
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

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20250815-120435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250815035047.3319284-3-alex.hung%40amd.com
patch subject: [PATCH V11 02/47] drm/vkms: Add kunit tests for VKMS LUT handling
config: arc-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160245.qVEHX6YB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160245.qVEHX6YB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160245.qVEHX6YB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
>> drivers/gpu/drm/vkms/vkms_composer.h:10:32: warning: 'struct vkms_color_lut' declared inside parameter list will not be visible outside of this definition or declaration
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
                                   ^~~~~~~~~~~~~~
>> drivers/gpu/drm/vkms/vkms_composer.c:76:22: error: conflicting types for 'get_lut_index'
    VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
                         ^~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:10:5: note: previous declaration of 'get_lut_index' was here
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
        ^~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/drm/drm_crtc.h:28,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/vkms/vkms_composer.c:5:
   drivers/gpu/drm/vkms/vkms_composer.c:82:24: error: conflicting types for 'get_lut_index'
    EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
                           ^~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^~~
   include/kunit/visibility.h:27:44: note: in expansion of macro 'EXPORT_SYMBOL_NS'
        #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, "EXPORTED_FOR_KUNIT_TESTING")
                                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/vkms/vkms_composer.c:82:1: note: in expansion of macro 'EXPORT_SYMBOL_IF_KUNIT'
    EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/vkms/vkms_composer.c:15:
   drivers/gpu/drm/vkms/vkms_composer.h:10:5: note: previous declaration of 'get_lut_index' was here
    s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
        ^~~~~~~~~~~~~


vim +/get_lut_index +76 drivers/gpu/drm/vkms/vkms_composer.c

    14	
  > 15	#include "vkms_composer.h"
    16	#include "vkms_drv.h"
    17	
    18	static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
    19	{
    20		u32 new_color;
    21	
    22		new_color = (src * 0xffff + dst * (0xffff - alpha));
    23	
    24		return DIV_ROUND_CLOSEST(new_color, 0xffff);
    25	}
    26	
    27	/**
    28	 * pre_mul_alpha_blend - alpha blending equation
    29	 * @stage_buffer: The line with the pixels from src_plane
    30	 * @output_buffer: A line buffer that receives all the blends output
    31	 * @x_start: The start offset
    32	 * @pixel_count: The number of pixels to blend
    33	 *
    34	 * The pixels [@x_start;@x_start+@pixel_count) in stage_buffer are blended at
    35	 * [@x_start;@x_start+@pixel_count) in output_buffer.
    36	 *
    37	 * The current DRM assumption is that pixel color values have been already
    38	 * pre-multiplied with the alpha channel values. See more
    39	 * drm_plane_create_blend_mode_property(). Also, this formula assumes a
    40	 * completely opaque background.
    41	 */
    42	static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
    43					struct line_buffer *output_buffer, int x_start, int pixel_count)
    44	{
    45		struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
    46		const struct pixel_argb_u16 *in = &stage_buffer->pixels[x_start];
    47	
    48		for (int i = 0; i < pixel_count; i++) {
    49			out[i].a = (u16)0xffff;
    50			out[i].r = pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
    51			out[i].g = pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
    52			out[i].b = pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
    53		}
    54	}
    55	
    56	
    57	static void fill_background(const struct pixel_argb_u16 *background_color,
    58				    struct line_buffer *output_buffer)
    59	{
    60		for (size_t i = 0; i < output_buffer->n_pixels; i++)
    61			output_buffer->pixels[i] = *background_color;
    62	}
    63	
    64	// lerp(a, b, t) = a + (b - a) * t
    65	VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
    66	{
    67		s64 a_fp = drm_int2fixp(a);
    68		s64 b_fp = drm_int2fixp(b);
    69	
    70		s64 delta = drm_fixp_mul(b_fp - a_fp, t);
    71	
    72		return drm_fixp2int_round(a_fp + delta);
    73	}
    74	EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
    75	
  > 76	VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
    77	{
    78		s64 color_channel_fp = drm_int2fixp(channel_value);
    79	
    80		return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
    81	}
    82	EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
