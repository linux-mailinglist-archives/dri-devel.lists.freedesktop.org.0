Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C6B12B5A
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78F10E291;
	Sat, 26 Jul 2025 16:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aT5RNRpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D0F10E28C;
 Sat, 26 Jul 2025 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753546019; x=1785082019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=97n7TGLjg/+mTPjK/3JeoW9Y0kyNUgwCatu2/1JDmYM=;
 b=aT5RNRpV4dd5kKapu+VvP8LFYq54HR6GXKsln7si2Puoq797YFmen5kN
 /tjZzAC1JAsDJOcF8ja+bZlawZrmsQT30QVo76dW+rwwCFqxZj65MxGQb
 /dnUeOIS7/fLw5BP7eOZjCbHYE6Tf87kqaul3X+i2ysIigw0tCGiFYtsk
 y/sX95YwNkZriPYPJrw3jvLM5tMrdj+9dw7cQPH/2YPoPWCC8iOZnfEnB
 0CfDqUlgZ+/pPM1s1B/dx04c9nH8+LlCvERl/Aq9sJFcKCgCYS9+20Kbc
 wnnaLZWa5pMhfVgjarYnexfLIN+GQnYqUd1ea76qCa9+OaaSXCzzCvO9j Q==;
X-CSE-ConnectionGUID: 4YgvyfluS4CVPudH2upFhg==
X-CSE-MsgGUID: PTbi/IIhSCipPEDvM3h5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55938555"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55938555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 09:06:59 -0700
X-CSE-ConnectionGUID: 9he2HELvTgKI8xLuQ6s9cQ==
X-CSE-MsgGUID: IohRdLb2STuEB34Px0zTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="198783985"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 26 Jul 2025 09:06:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufhQE-000M5D-0l;
 Sat, 26 Jul 2025 16:06:54 +0000
Date: Sun, 27 Jul 2025 00:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 27/28] drm/i915/writeback: Make exception for writeback
 connector
Message-ID: <202507262326.1J1VnzbD-lkp@intel.com>
References: <20250725050409.2687242-28-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-28-suraj.kandpal@intel.com>
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

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20250725]
[cannot apply to linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250725-133017
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250725050409.2687242-28-suraj.kandpal%40intel.com
patch subject: [PATCH 27/28] drm/i915/writeback: Make exception for writeback connector
config: i386-buildonly-randconfig-006-20250725 (https://download.01.org/0day-ci/archive/20250726/202507262326.1J1VnzbD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507262326.1J1VnzbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507262326.1J1VnzbD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.c:3785:4: warning: variable 'trans_pipe' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    3785 |                         default:
         |                         ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3819:7: note: uninitialized use occurs here
    3819 |                 if (trans_pipe == crtc->pipe)
         |                     ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:3760:3: note: variable 'trans_pipe' is declared here
    3760 |                 enum pipe trans_pipe;
         |                 ^
   1 warning generated.


vim +/trans_pipe +3785 drivers/gpu/drm/i915/display/intel_display.c

  3743	
  3744	static u8 hsw_enabled_transcoders(struct intel_crtc *crtc)
  3745	{
  3746		struct intel_display *display = to_intel_display(crtc);
  3747		u8 panel_transcoder_mask = hsw_panel_transcoders(display);
  3748		enum transcoder cpu_transcoder;
  3749		u8 primary_pipe, secondary_pipes;
  3750		u8 enabled_transcoders = 0;
  3751	
  3752		/*
  3753		 * XXX: Do intel_display_power_get_if_enabled before reading this (for
  3754		 * consistency and less surprising code; it's in always on power).
  3755		 */
  3756		for_each_cpu_transcoder_masked(display, cpu_transcoder,
  3757					       panel_transcoder_mask) {
  3758			enum intel_display_power_domain power_domain;
  3759			intel_wakeref_t wakeref;
  3760			enum pipe trans_pipe;
  3761			u32 tmp = 0;
  3762	
  3763			power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
  3764			if (cpu_transcoder == TRANSCODER_WD_0 ||
  3765			    cpu_transcoder == TRANSCODER_WD_1) {
  3766				with_intel_display_power_if_enabled(display, power_domain, wakeref)
  3767					tmp = intel_de_read(display,
  3768							    WD_TRANS_FUNC_CTL(cpu_transcoder));
  3769				if (!(tmp & TRANS_WD_FUNC_ENABLE))
  3770					continue;
  3771	
  3772				switch (tmp & WD_INPUT_SELECT_MASK) {
  3773				case WD_INPUT_PIPE_A:
  3774					trans_pipe = PIPE_A;
  3775					break;
  3776				case WD_INPUT_PIPE_B:
  3777					trans_pipe = PIPE_B;
  3778					break;
  3779				case WD_INPUT_PIPE_C:
  3780					trans_pipe = PIPE_C;
  3781					break;
  3782				case WD_INPUT_PIPE_D:
  3783					trans_pipe = PIPE_D;
  3784					break;
> 3785				default:
  3786					MISSING_CASE(tmp & WD_INPUT_SELECT_MASK);
  3787					break;
  3788				}
  3789			} else {
  3790				with_intel_display_power_if_enabled(display, power_domain, wakeref)
  3791					tmp = intel_de_read(display,
  3792							    TRANS_DDI_FUNC_CTL(display, cpu_transcoder));
  3793	
  3794				if (!(tmp & TRANS_DDI_FUNC_ENABLE))
  3795					continue;
  3796	
  3797				switch (tmp & TRANS_DDI_EDP_INPUT_MASK) {
  3798				default:
  3799					drm_WARN(display->drm, 1,
  3800						 "unknown pipe linked to transcoder %s\n",
  3801						 transcoder_name(cpu_transcoder));
  3802					fallthrough;
  3803				case TRANS_DDI_EDP_INPUT_A_ONOFF:
  3804				case TRANS_DDI_EDP_INPUT_A_ON:
  3805					trans_pipe = PIPE_A;
  3806					break;
  3807				case TRANS_DDI_EDP_INPUT_B_ONOFF:
  3808					trans_pipe = PIPE_B;
  3809					break;
  3810				case TRANS_DDI_EDP_INPUT_C_ONOFF:
  3811					trans_pipe = PIPE_C;
  3812					break;
  3813				case TRANS_DDI_EDP_INPUT_D_ONOFF:
  3814					trans_pipe = PIPE_D;
  3815					break;
  3816				}
  3817			}
  3818	
  3819			if (trans_pipe == crtc->pipe)
  3820				enabled_transcoders |= BIT(cpu_transcoder);
  3821		}
  3822	
  3823		/* single pipe or joiner primary */
  3824		cpu_transcoder = (enum transcoder) crtc->pipe;
  3825		if (transcoder_ddi_func_is_enabled(display, cpu_transcoder))
  3826			enabled_transcoders |= BIT(cpu_transcoder);
  3827	
  3828		/* joiner secondary -> consider the primary pipe's transcoder as well */
  3829		enabled_joiner_pipes(display, crtc->pipe, &primary_pipe, &secondary_pipes);
  3830		if (secondary_pipes & BIT(crtc->pipe)) {
  3831			cpu_transcoder = (enum transcoder)ffs(primary_pipe) - 1;
  3832			if (transcoder_ddi_func_is_enabled(display, cpu_transcoder))
  3833				enabled_transcoders |= BIT(cpu_transcoder);
  3834		}
  3835	
  3836		return enabled_transcoders;
  3837	}
  3838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
