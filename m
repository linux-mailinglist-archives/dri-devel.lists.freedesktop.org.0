Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5FC98167
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34E10E40C;
	Mon,  1 Dec 2025 15:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0yH6fU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E7810E409;
 Mon,  1 Dec 2025 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764603915; x=1796139915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ihd+OynkBI3LvrViK4UW6HYIHLMlvRpHhZbmAdKbktE=;
 b=g0yH6fU/wsv3ye73sEcX5cWW0bmFJ41uuAAvL2RrZy3V0MtUn3kxdw85
 1c89BYMpZBoBwmGvMoIcEbgAQkgHkjtr8prbOalgXb+qYXHBJJ/lQwJWo
 rcZQVpWt/Gs9sXAMfnfANgSuoFT4974S3e6JZCoHzEtKiGHR1y4i4OIqS
 IyomeRPtZXla/AtFEDJZ98Nd7ivz+8UDHg0WRIOYatKPtTNxM0sQ11Ig6
 UOCfW5+d130pfASlwlQl+u83K7z/1aQAnWMhiKkQIQW73LTu4cLdIlL1o
 smhL+FvIFIsKrkoBBHSbM1bFP7prXhy1xYDtYvk4x+VVjnNfOrDhosrPh g==;
X-CSE-ConnectionGUID: C3rBnLdvSLyPq5fS+lWwkA==
X-CSE-MsgGUID: MbVUQyKZQ4SVAoppWOclpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66709461"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66709461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:45:15 -0800
X-CSE-ConnectionGUID: KL2GTH2XQcGFh5jbS6aywQ==
X-CSE-MsgGUID: l9FOx2pNThORGj2iPEE/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194096174"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 01 Dec 2025 07:45:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQ65L-000000008sv-0xtH;
 Mon, 01 Dec 2025 15:45:07 +0000
Date: Mon, 1 Dec 2025 23:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 05/15] drm/i915/color: Add framework to program CSC
Message-ID: <202512012301.V42g2qYb-lkp@intel.com>
References: <20251201064655.3579280-6-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-6-uma.shankar@intel.com>
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
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.18 v6.18-rc7 v6.18-rc6 linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
base:   next-20251201
patch link:    https://lore.kernel.org/r/20251201064655.3579280-6-uma.shankar%40intel.com
patch subject: [v7 05/15] drm/i915/color: Add framework to program CSC
config: x86_64-randconfig-012-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012301.V42g2qYb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012301.V42g2qYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512012301.V42g2qYb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_colorop.h:9,
                    from drivers/gpu/drm/i915/display/intel_plane.c:52:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_plane.c: In function 'intel_plane_color_copy_uapi_to_hw_state':
   drivers/gpu/drm/i915/display/intel_plane.c:367:41: error: 'struct drm_plane_state' has no member named 'color_pipeline'
     367 |         iter_colorop = plane_state->uapi.color_pipeline;
         |                                         ^
   drivers/gpu/drm/i915/display/intel_plane.c:370:17: error: implicit declaration of function 'for_each_new_colorop_in_state'; did you mean 'for_each_new_crtc_in_state'? [-Wimplicit-function-declaration]
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 for_each_new_crtc_in_state
   drivers/gpu/drm/i915/display/intel_plane.c:370:84: error: expected ';' before '{' token
     370 |                 for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
         |                                                                                    ^~
         |                                                                                    ;
>> drivers/gpu/drm/i915/display/intel_plane.c:360:35: error: unused variable 'blob' [-Werror=unused-variable]
     360 |         struct drm_property_blob *blob;
         |                                   ^~~~
>> drivers/gpu/drm/i915/display/intel_plane.c:359:31: error: unused variable 'intel_colorop' [-Werror=unused-variable]
     359 |         struct intel_colorop *intel_colorop;
         |                               ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_plane.c: At top level:
>> drivers/gpu/drm/i915/display/intel_plane.c:341:1: error: 'intel_plane_colorop_replace_blob' defined but not used [-Werror=unused-function]
     341 | intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/blob +360 drivers/gpu/drm/i915/display/intel_plane.c

   339	
   340	static bool
 > 341	intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
   342					 struct intel_colorop *intel_colorop,
   343					 struct drm_property_blob *blob)
   344	{
   345		if (intel_colorop->id == INTEL_PLANE_CB_CSC)
   346			return drm_property_replace_blob(&plane_state->hw.ctm, blob);
   347	
   348		return false;
   349	}
   350	
   351	static void
   352	intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
   353						const struct intel_plane_state *from_plane_state,
   354						struct intel_crtc *crtc)
   355	{
   356		struct drm_colorop *iter_colorop, *colorop;
   357		struct drm_colorop_state *new_colorop_state;
   358		struct drm_atomic_state *state = plane_state->uapi.state;
 > 359		struct intel_colorop *intel_colorop;
 > 360		struct drm_property_blob *blob;
   361		int i = 0;
   362		struct intel_atomic_state *intel_atomic_state = to_intel_atomic_state(state);
   363		struct intel_crtc_state *new_crtc_state = intel_atomic_state ?
   364			intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) : NULL;
   365		bool changed = false;
   366	
   367		iter_colorop = plane_state->uapi.color_pipeline;
   368	
   369		while (iter_colorop) {
 > 370			for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
   371				if (new_colorop_state->colorop == iter_colorop) {
   372					blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
   373					intel_colorop = to_intel_colorop(colorop);
   374					changed |= intel_plane_colorop_replace_blob(plane_state,
   375										    intel_colorop,
   376										    blob);
   377				}
   378			}
   379			iter_colorop = iter_colorop->next;
   380		}
   381	
   382		if (new_crtc_state && changed)
   383			new_crtc_state->plane_color_changed = true;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
