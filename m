Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55CC98DA2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FD610E46A;
	Mon,  1 Dec 2025 19:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLvTlYd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEB010E46A;
 Mon,  1 Dec 2025 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764617377; x=1796153377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wEeWshUELrWCpy2AXbFvY00dfhEnEVOWjGjYTP/rV/c=;
 b=nLvTlYd0FF7NL7GLSd/C1wmOXPdLi6L6jSylztWKMBbRFng+YuzP7Xe+
 aFxvov/1BxgOWYVMj2uFheTLIeTNb9lEYSdoB1RCHwt8xnIXaTY1aD+h0
 QEpPE4BHbD9jlhp+yKCEGWtXsbq3DVTeVqu4pCwDyeM7twtgrY66+j9FP
 aQS0PUQ562bnIUQ76MfIneBVtt9lDdC50ERa70vufZF9bjYS1Th++WDwP
 VPLNuJl+PNT39N9NJ8mpbIBQkQ5lqNZ/Helzr+uSrzOo1HN5NE3YXsH4c
 sh6gAwW/qbaKH6tFAaGvhHPSGR65iL1Ik/X0Lss0xs2+VA3E5IGsYOJQR Q==;
X-CSE-ConnectionGUID: IoOfgbd6ROipmuG5OjO6IQ==
X-CSE-MsgGUID: f7ZkoVLgQIO11fA+DqJKUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69165041"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="69165041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:29:36 -0800
X-CSE-ConnectionGUID: KbOCuOgSS22isMzUzTjzJA==
X-CSE-MsgGUID: a1MhPLfiS9C5qU6Ry/9q2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199093475"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 11:29:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQ9aT-0000000095V-498Z;
 Mon, 01 Dec 2025 19:29:29 +0000
Date: Tue, 2 Dec 2025 03:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, chaitanya.kumar.borah@intel.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Message-ID: <202512020343.7KKu4M4I-lkp@intel.com>
References: <20251201064655.3579280-12-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201064655.3579280-12-uma.shankar@intel.com>
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
patch link:    https://lore.kernel.org/r/20251201064655.3579280-12-uma.shankar%40intel.com
patch subject: [v7 11/15] drm/i915/color: Program Pre-CSC registers
config: i386-buildonly-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251202/202512020343.7KKu4M4I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020343.7KKu4M4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020343.7KKu4M4I-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
   drivers/gpu/drm/i915/display/intel_color.c:3869:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3869 |         input = ctm->matrix;
         |                    ^~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_program_plane_pre_csc_lut':
>> drivers/gpu/drm/i915/display/intel_color.c:3966:47: error: implicit declaration of function 'drm_color_lut32_extract'; did you mean 'drm_color_lut_extract'? [-Wimplicit-function-declaration]
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~
         |                                               drm_color_lut_extract
>> drivers/gpu/drm/i915/display/intel_color.c:3966:82: error: invalid use of undefined type 'struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                  ^
>> drivers/gpu/drm/i915/display/intel_color.c:3966:85: error: invalid use of undefined type 'const struct drm_color_lut32'
    3966 |                                 u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
         |                                                                                     ^


vim +3966 drivers/gpu/drm/i915/display/intel_color.c

  3850	
  3851	static void
  3852	xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
  3853				    const struct intel_plane_state *plane_state)
  3854	{
  3855		struct intel_display *display = to_intel_display(plane_state);
  3856		const struct drm_plane_state *state = &plane_state->uapi;
  3857		enum pipe pipe = to_intel_plane(state->plane)->pipe;
  3858		enum plane_id plane = to_intel_plane(state->plane)->id;
  3859		const struct drm_property_blob *blob = plane_state->hw.ctm;
  3860		struct drm_color_ctm_3x4 *ctm;
  3861		const u64 *input;
  3862		u16 coeffs[9] = {};
  3863		int i, j;
  3864	
  3865		if (!icl_is_hdr_plane(display, plane) || !blob)
  3866			return;
  3867	
  3868		ctm = blob->data;
> 3869		input = ctm->matrix;
  3870	
  3871		/*
  3872		 * Convert fixed point S31.32 input to format supported by the
  3873		 * hardware.
  3874		 */
  3875		for (i = 0, j = 0; i < ARRAY_SIZE(coeffs); i++) {
  3876			u64 abs_coeff = ((1ULL << 63) - 1) & input[j];
  3877	
  3878			/*
  3879			 * Clamp input value to min/max supported by
  3880			 * hardware.
  3881			 */
  3882			abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
  3883	
  3884			/* sign bit */
  3885			if (CTM_COEFF_NEGATIVE(input[j]))
  3886				coeffs[i] |= 1 << 15;
  3887	
  3888			if (abs_coeff < CTM_COEFF_0_125)
  3889				coeffs[i] |= (3 << 12) |
  3890					      ILK_CSC_COEFF_FP(abs_coeff, 12);
  3891			else if (abs_coeff < CTM_COEFF_0_25)
  3892				coeffs[i] |= (2 << 12) |
  3893					      ILK_CSC_COEFF_FP(abs_coeff, 11);
  3894			else if (abs_coeff < CTM_COEFF_0_5)
  3895				coeffs[i] |= (1 << 12) |
  3896					      ILK_CSC_COEFF_FP(abs_coeff, 10);
  3897			else if (abs_coeff < CTM_COEFF_1_0)
  3898				coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
  3899			else if (abs_coeff < CTM_COEFF_2_0)
  3900				coeffs[i] |= (7 << 12) |
  3901					      ILK_CSC_COEFF_FP(abs_coeff, 8);
  3902			else
  3903				coeffs[i] |= (6 << 12) |
  3904					      ILK_CSC_COEFF_FP(abs_coeff, 7);
  3905	
  3906			/* Skip postoffs */
  3907			if (!((j + 2) % 4))
  3908				j += 2;
  3909			else
  3910				j++;
  3911		}
  3912	
  3913		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
  3914				   coeffs[0] << 16 | coeffs[1]);
  3915		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
  3916				   coeffs[2] << 16);
  3917	
  3918		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
  3919				   coeffs[3] << 16 | coeffs[4]);
  3920		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
  3921				   coeffs[5] << 16);
  3922	
  3923		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
  3924				   coeffs[6] << 16 | coeffs[7]);
  3925		intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
  3926				   coeffs[8] << 16);
  3927	
  3928		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
  3929		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
  3930		intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
  3931	
  3932		/*
  3933		 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
  3934		 */
  3935		intel_de_write_dsb(display, dsb,
  3936				   PLANE_CSC_POSTOFF(pipe, plane, 0),
  3937				   ctm_to_twos_complement(input[3], 0, 12));
  3938		intel_de_write_dsb(display, dsb,
  3939				   PLANE_CSC_POSTOFF(pipe, plane, 1),
  3940				   ctm_to_twos_complement(input[7], 0, 12));
  3941		intel_de_write_dsb(display, dsb,
  3942				   PLANE_CSC_POSTOFF(pipe, plane, 2),
  3943				   ctm_to_twos_complement(input[11], 0, 12));
  3944	}
  3945	
  3946	static void
  3947	xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
  3948					const struct intel_plane_state *plane_state)
  3949	{
  3950		struct intel_display *display = to_intel_display(plane_state);
  3951		const struct drm_plane_state *state = &plane_state->uapi;
  3952		enum pipe pipe = to_intel_plane(state->plane)->pipe;
  3953		enum plane_id plane = to_intel_plane(state->plane)->id;
  3954		const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
  3955		u32 i, lut_size;
  3956	
  3957		if (icl_is_hdr_plane(display, plane)) {
  3958			lut_size = 128;
  3959	
  3960			intel_de_write_dsb(display, dsb,
  3961					   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
  3962					   PLANE_PAL_PREC_AUTO_INCREMENT);
  3963	
  3964			if (pre_csc_lut) {
  3965				for (i = 0; i < lut_size; i++) {
> 3966					u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
  3967	
  3968					intel_de_write_dsb(display, dsb,
  3969							   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  3970							   lut_val);
  3971				}
  3972	
  3973				/* Program the max register to clamp values > 1.0. */
  3974				/* TODO: Restrict to 0x7ffffff */
  3975				do {
  3976					intel_de_write_dsb(display, dsb,
  3977							   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  3978							   (1 << 24));
  3979				} while (i++ > 130);
  3980			} else {
  3981				for (i = 0; i < lut_size; i++) {
  3982					u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
  3983	
  3984					intel_de_write_dsb(display, dsb,
  3985							   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
  3986				}
  3987	
  3988				do {
  3989					intel_de_write_dsb(display, dsb,
  3990							   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
  3991							   1 << 24);
  3992				} while (i++ < 130);
  3993			}
  3994	
  3995			intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
  3996		}
  3997	}
  3998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
