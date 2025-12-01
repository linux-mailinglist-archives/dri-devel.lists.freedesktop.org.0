Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57274C98242
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F60A10E077;
	Mon,  1 Dec 2025 15:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIs7hGHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75910E425;
 Mon,  1 Dec 2025 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764604577; x=1796140577;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8CatreM/H388Bg/dh303kBgixcSKi5WU0xRXH7oS0t4=;
 b=QIs7hGHMMZU9BHrhFyTakmkpLDd8gyoC6rWrphBbPRB+MVR1Ev/iwu0s
 4spG3tlIN0L27hTb0Ylms3+U49NWePwgL9Tb0kDCLykYBRaXYHKOJ8IYm
 k9i4Do/CfweXZsak52laJzrrhPf7Ig5fgC3mNOPgS0ZcebAP02p/Hegey
 OIlFNhxtkQAvSoumaa2G83Uf6Y4xdn4N9/IijRszg64rH1kAoFfwgULKL
 ZLjN/9953xsk6c3t8JQTBE7dPV2q58dAMf6XXjIffLIB/EURvBJqGHiFm
 GBDlmv751qjdr06ObZNjOSaxNEmRVB3Q7I2jCL24Mgl1W0sHwGODHyi4u A==;
X-CSE-ConnectionGUID: CDqaDdlySUG5TEzwFTIY6Q==
X-CSE-MsgGUID: f6pg6ko5QxWbMKXSOJ7eSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70160483"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70160483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:56:12 -0800
X-CSE-ConnectionGUID: CX2Kz1p6Sy+4umqmhp2Ogg==
X-CSE-MsgGUID: 8YWDxro4St+V5obqHT2sGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193766495"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 07:56:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQ6Fz-000000008tD-2CkX;
 Mon, 01 Dec 2025 15:56:07 +0000
Date: Mon, 1 Dec 2025 23:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 04/15] drm/i915/color: Create a transfer function color
 pipeline
Message-ID: <202512012314.C2mdxzIy-lkp@intel.com>
References: <20251201064655.3579280-5-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-5-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251201]
[also build test ERROR on linus/master v6.18]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-5-uma.shankar%40intel.com
patch subject: [v7 04/15] drm/i915/color: Create a transfer function color pipeline
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012314.C2mdxzIy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012314.C2mdxzIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512012314.C2mdxzIy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_color_pipeline.c:5:
   drivers/gpu/drm/i915/display/intel_display_types.h:1989:28: error: field 'base' has incomplete type
    1989 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function '_intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:25:15: error: implicit declaration of function 'drm_plane_colorop_curve_1d_lut_init' [-Wimplicit-function-declaration]
      25 |         ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: error: 'DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR' undeclared (first use in this function)
      27 |                                                   DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_color_pipeline.c:27:51: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:28:51: error: 'DRM_COLOROP_FLAG_ALLOW_BYPASS' undeclared (first use in this function)
      28 |                                                   DRM_COLOROP_FLAG_ALLOW_BYPASS);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:40:15: error: implicit declaration of function 'drm_plane_colorop_ctm_3x4_init' [-Wimplicit-function-declaration]
      40 |         ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:45:9: error: implicit declaration of function 'drm_colorop_set_next_property'; did you mean 'drm_connector_set_tile_property'? [-Wimplicit-function-declaration]
      45 |         drm_colorop_set_next_property(prev_op, &colorop->base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_connector_set_tile_property
   drivers/gpu/drm/i915/display/intel_color_pipeline.c: In function 'intel_color_pipeline_plane_init':
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c:92:16: error: 'struct drm_plane' has no member named 'color_pipeline_property'; did you mean 'color_encoding_property'?
      92 |         plane->color_pipeline_property = prop;
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                color_encoding_property


vim +/drm_plane_colorop_curve_1d_lut_init +25 drivers/gpu/drm/i915/display/intel_color_pipeline.c

   > 5	#include "intel_colorop.h"
     6	#include "intel_color_pipeline.h"
     7	#include "intel_de.h"
     8	#include "intel_display_types.h"
     9	#include "skl_universal_plane.h"
    10	
    11	#define MAX_COLOR_PIPELINES 2
    12	#define PLANE_DEGAMMA_SIZE 128
    13	#define PLANE_GAMMA_SIZE 32
    14	
    15	static
    16	int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
    17	{
    18		struct intel_colorop *colorop;
    19		struct drm_device *dev = plane->dev;
    20		int ret;
    21		struct drm_colorop *prev_op;
    22	
    23		colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
    24	
  > 25		ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
    26							  PLANE_DEGAMMA_SIZE,
  > 27							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
  > 28							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
    29	
    30		if (ret)
    31			return ret;
    32	
    33		list->type = colorop->base.base.id;
    34		list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
    35	
    36		/* TODO: handle failures and clean up */
    37		prev_op = &colorop->base;
    38	
    39		colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
  > 40		ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
    41						     DRM_COLOROP_FLAG_ALLOW_BYPASS);
    42		if (ret)
    43			return ret;
    44	
  > 45		drm_colorop_set_next_property(prev_op, &colorop->base);
    46		prev_op = &colorop->base;
    47	
    48		colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
    49		ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
    50							  PLANE_GAMMA_SIZE,
    51							  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
    52							  DRM_COLOROP_FLAG_ALLOW_BYPASS);
    53		if (ret)
    54			return ret;
    55	
    56		drm_colorop_set_next_property(prev_op, &colorop->base);
    57	
    58		return 0;
    59	}
    60	
    61	int intel_color_pipeline_plane_init(struct drm_plane *plane)
    62	{
    63		struct drm_device *dev = plane->dev;
    64		struct intel_display *display = to_intel_display(dev);
    65		struct drm_property *prop;
    66		struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
    67		int len = 0;
    68		int ret;
    69	
    70		/* Currently expose pipeline only for HDR planes */
    71		if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
    72			return 0;
    73	
    74		/* Add "Bypass" (i.e. NULL) pipeline */
    75		pipelines[len].type = 0;
    76		pipelines[len].name = "Bypass";
    77		len++;
    78	
    79		/* Add pipeline consisting of transfer functions */
    80		ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
    81		if (ret)
    82			return ret;
    83		len++;
    84	
    85		/* Create COLOR_PIPELINE property and attach */
    86		prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
    87						"COLOR_PIPELINE",
    88						pipelines, len);
    89		if (!prop)
    90			return -ENOMEM;
    91	
  > 92		plane->color_pipeline_property = prop;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
