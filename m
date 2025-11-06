Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D46C3B23A
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FE010E8B5;
	Thu,  6 Nov 2025 13:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKoK1acL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32BF10E2E3;
 Thu,  6 Nov 2025 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762434971; x=1793970971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fWIzYkeyLR0zM1nmLNN94zCZ4jX0OH0Y8wuA0ODbkxw=;
 b=IKoK1acLZVZpJjTR0ROodTkW5WBmoY389A28uwIOmf6+o+efLlL0XEmk
 4QnAfimAw8RpDQgW6xjyoTnFZRef6GWR0WE+b8aUN3gzzIBgTfOIBXh/u
 Nlj+rTE91a6US771Dw8cw/sMar3VC6cX3Y9liNk2OGXOmPXlGUqFynr5E
 pISgAg+gjQ4G12D8s5clstvOLCk8mYL6ldnki8L7Tvv3dPWul8FMxEOKk
 JD6dewF4txo4qRe+x/qxflwpvzOEcauFYlNfUo41LhxCrU/wMSTLC6cxB
 Lm+oIwkde7JigrIR+/J8/oyW+2mFFnyGvw8yePwfOidhCS2m3S0u+OkjC g==;
X-CSE-ConnectionGUID: dKmOD9HdRs6Kb+KA/CZOwQ==
X-CSE-MsgGUID: mYB/WIVAT/+hZppDLB4S0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74859617"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="74859617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 05:16:10 -0800
X-CSE-ConnectionGUID: aeqL+VAlRRWd2b+1r3alkg==
X-CSE-MsgGUID: PvnjBAKaRSe2LKdR0ffM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="211215979"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 05:16:06 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vGzqO-000TxI-01;
 Thu, 06 Nov 2025 13:16:04 +0000
Date: Thu, 6 Nov 2025 21:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr,
 harry.wentland@amd.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v6 13/16] drm/i915/xelpd: Program Plane Post CSC Registers
Message-ID: <202511062120.wwoYUHAR-lkp@intel.com>
References: <20251105123413.2671075-14-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105123413.2671075-14-uma.shankar@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251105]
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-AMD-series-squashed/20251105-202623
base:   next-20251105
patch link:    https://lore.kernel.org/r/20251105123413.2671075-14-uma.shankar%40intel.com
patch subject: [v6 13/16] drm/i915/xelpd: Program Plane Post CSC Registers
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251106/202511062120.wwoYUHAR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062120.wwoYUHAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062120.wwoYUHAR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_color.c:4018:52: warning: variable 'j' is uninitialized when used here [-Wuninitialized]
    4018 |                                 lut_val = drm_color_lut32_extract(post_csc_lut[j++].green, 24);
         |                                                                                ^
   drivers/gpu/drm/i915/display/intel_color.c:4007:10: note: initialize the variable 'j' to silence this warning
    4007 |         u32 i, j, lut_size, lut_val;
         |                 ^
         |                  = 0
   1 warning generated.


vim +/j +4018 drivers/gpu/drm/i915/display/intel_color.c

  3997	
  3998	static void
  3999	xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
  4000					 const struct intel_plane_state *plane_state)
  4001	{
  4002		struct intel_display *display = to_intel_display(plane_state);
  4003		const struct drm_plane_state *state = &plane_state->uapi;
  4004		enum pipe pipe = to_intel_plane(state->plane)->pipe;
  4005		enum plane_id plane = to_intel_plane(state->plane)->id;
  4006		const struct drm_color_lut32 *post_csc_lut = plane_state->hw.gamma_lut->data;
  4007		u32 i, j, lut_size, lut_val;
  4008	
  4009		if (icl_is_hdr_plane(display, plane)) {
  4010			intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
  4011					   PLANE_PAL_PREC_AUTO_INCREMENT);
  4012			/* TODO: Add macro */
  4013			intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
  4014					   PLANE_PAL_PREC_AUTO_INCREMENT);
  4015			if (post_csc_lut) {
  4016				lut_size = 32;
  4017				for (i = 0; i < lut_size; i++) {
> 4018					lut_val = drm_color_lut32_extract(post_csc_lut[j++].green, 24);
  4019	
  4020					intel_de_write_dsb(display, dsb,
  4021							   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  4022							   lut_val);
  4023				}
  4024	
  4025				/* Segment 2 */
  4026				do {
  4027					intel_de_write_dsb(display, dsb,
  4028							   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  4029							   (1 << 24));
  4030				} while (++j < 34);
  4031			} else {
  4032				/*TODO: Add for segment 0 */
  4033				lut_size = 32;
  4034				for (i = 0; i < lut_size; i++) {
  4035					u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
  4036	
  4037					intel_de_write_dsb(display, dsb,
  4038							   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
  4039				}
  4040	
  4041				do {
  4042					intel_de_write_dsb(display, dsb,
  4043							   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  4044							   1 << 24);
  4045				} while (i++ < 34);
  4046			}
  4047	
  4048			intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
  4049			intel_de_write_dsb(display, dsb,
  4050					   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
  4051		}
  4052	}
  4053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
