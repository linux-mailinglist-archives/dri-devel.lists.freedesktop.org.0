Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026A7B3E75
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 07:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81E10E1BD;
	Sat, 30 Sep 2023 05:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72310E1BC;
 Sat, 30 Sep 2023 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696052586; x=1727588586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oWyORT5Thd4eslIduoEG3CNDDqDcBtJrnS7bLsC+/Wk=;
 b=PRiKhKnv/i+IZIMAGccnY8+VRhP072G0+OnyLZVxZJw29A2NPrg4B5KA
 9/DpTrIcH1liZvGLuEcIeJtJy6SEcTLN0DUa0nmL4/MO3Zptv6mvUPIxz
 4Cz/druS6eMus5hlXSNi4NT4z96vGUS2DjT6VyOl/L0KjoFEF3pqP2AA8
 iQrqMWGa9Qm3r0dtsSldEqnafPWC4fJJgFh1+fphPYheY5vd3pazq525A
 /Yj9cL658DFNUWVS2vnPXfd8x06gUNnRWW+suxDv4+r1G34XHUpc4YKd0
 yoLPQWu4MEio57bY8RMJOfwp/TGzHjT4hA2CB5LSPn6HqoVTsccyLLUTD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386293287"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="386293287"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865938604"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="865938604"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2023 22:43:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qmSkO-0003kn-0p;
 Sat, 30 Sep 2023 05:42:43 +0000
Date: Sat, 30 Sep 2023 13:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
Message-ID: <202309301303.ujZmUWZH-lkp@intel.com>
References: <20230929071322.945521-3-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929071322.945521-3-mitulkumar.ajitkumar.golani@intel.com>
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
Cc: suraj.kandpal@intel.com, suijingfeng@loongson.cn, jani.nikula@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, swati2.sharma@intel.com,
 mripard@kernel.org, oe-kbuild-all@lists.linux.dev, ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-display-dp-Add-helper-function-to-get-DSC-bpp-precision/20230929-162949
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230929071322.945521-3-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH 2/8] drm/i915/display: Store compressed bpp in U6.4 format
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230930/202309301303.ujZmUWZH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301303.ujZmUWZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301303.ujZmUWZH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_link_bw.c: In function 'intel_link_bw_reduce_bpp':
>> drivers/gpu/drm/i915/display/intel_link_bw.c:71:52: error: 'struct <anonymous>' has no member named 'compressed_bpp'; did you mean 'compressed_bpp_x16'?
      71 |                         link_bpp = crtc_state->dsc.compressed_bpp;
         |                                                    ^~~~~~~~~~~~~~
         |                                                    compressed_bpp_x16


vim +71 drivers/gpu/drm/i915/display/intel_link_bw.c

8ca0b875c08258 Imre Deak 2023-09-21  28  
8ca0b875c08258 Imre Deak 2023-09-21  29  /**
8ca0b875c08258 Imre Deak 2023-09-21  30   * intel_link_bw_reduce_bpp - reduce maximum link bpp for a selected pipe
8ca0b875c08258 Imre Deak 2023-09-21  31   * @state: atomic state
8ca0b875c08258 Imre Deak 2023-09-21  32   * @limits: link BW limits
8ca0b875c08258 Imre Deak 2023-09-21  33   * @pipe_mask: mask of pipes to select from
8ca0b875c08258 Imre Deak 2023-09-21  34   * @reason: explanation of why bpp reduction is needed
8ca0b875c08258 Imre Deak 2023-09-21  35   *
8ca0b875c08258 Imre Deak 2023-09-21  36   * Select the pipe from @pipe_mask with the biggest link bpp value and set the
8ca0b875c08258 Imre Deak 2023-09-21  37   * maximum of link bpp in @limits below this value. Modeset the selected pipe,
8ca0b875c08258 Imre Deak 2023-09-21  38   * so that its state will get recomputed.
8ca0b875c08258 Imre Deak 2023-09-21  39   *
8ca0b875c08258 Imre Deak 2023-09-21  40   * This function can be called to resolve a link's BW overallocation by reducing
8ca0b875c08258 Imre Deak 2023-09-21  41   * the link bpp of one pipe on the link and hence reducing the total link BW.
8ca0b875c08258 Imre Deak 2023-09-21  42   *
8ca0b875c08258 Imre Deak 2023-09-21  43   * Returns
8ca0b875c08258 Imre Deak 2023-09-21  44   *   - 0 in case of success
8ca0b875c08258 Imre Deak 2023-09-21  45   *   - %-ENOSPC if no pipe can further reduce its link bpp
8ca0b875c08258 Imre Deak 2023-09-21  46   *   - Other negative error, if modesetting the selected pipe failed
8ca0b875c08258 Imre Deak 2023-09-21  47   */
8ca0b875c08258 Imre Deak 2023-09-21  48  int intel_link_bw_reduce_bpp(struct intel_atomic_state *state,
8ca0b875c08258 Imre Deak 2023-09-21  49  			     struct intel_link_bw_limits *limits,
8ca0b875c08258 Imre Deak 2023-09-21  50  			     u8 pipe_mask,
8ca0b875c08258 Imre Deak 2023-09-21  51  			     const char *reason)
8ca0b875c08258 Imre Deak 2023-09-21  52  {
8ca0b875c08258 Imre Deak 2023-09-21  53  	struct drm_i915_private *i915 = to_i915(state->base.dev);
8ca0b875c08258 Imre Deak 2023-09-21  54  	enum pipe max_bpp_pipe = INVALID_PIPE;
8ca0b875c08258 Imre Deak 2023-09-21  55  	struct intel_crtc *crtc;
8ca0b875c08258 Imre Deak 2023-09-21  56  	int max_bpp = 0;
8ca0b875c08258 Imre Deak 2023-09-21  57  
8ca0b875c08258 Imre Deak 2023-09-21  58  	for_each_intel_crtc_in_pipe_mask(&i915->drm, crtc, pipe_mask) {
8ca0b875c08258 Imre Deak 2023-09-21  59  		struct intel_crtc_state *crtc_state;
8ca0b875c08258 Imre Deak 2023-09-21  60  		int link_bpp;
8ca0b875c08258 Imre Deak 2023-09-21  61  
8ca0b875c08258 Imre Deak 2023-09-21  62  		if (limits->bpp_limit_reached_pipes & BIT(crtc->pipe))
8ca0b875c08258 Imre Deak 2023-09-21  63  			continue;
8ca0b875c08258 Imre Deak 2023-09-21  64  
8ca0b875c08258 Imre Deak 2023-09-21  65  		crtc_state = intel_atomic_get_crtc_state(&state->base,
8ca0b875c08258 Imre Deak 2023-09-21  66  							 crtc);
8ca0b875c08258 Imre Deak 2023-09-21  67  		if (IS_ERR(crtc_state))
8ca0b875c08258 Imre Deak 2023-09-21  68  			return PTR_ERR(crtc_state);
8ca0b875c08258 Imre Deak 2023-09-21  69  
8ca0b875c08258 Imre Deak 2023-09-21  70  		if (crtc_state->dsc.compression_enable)
8ca0b875c08258 Imre Deak 2023-09-21 @71  			link_bpp = crtc_state->dsc.compressed_bpp;
8ca0b875c08258 Imre Deak 2023-09-21  72  		else
8ca0b875c08258 Imre Deak 2023-09-21  73  			/*
8ca0b875c08258 Imre Deak 2023-09-21  74  			 * TODO: for YUV420 the actual link bpp is only half
8ca0b875c08258 Imre Deak 2023-09-21  75  			 * of the pipe bpp value. The MST encoder's BW allocation
8ca0b875c08258 Imre Deak 2023-09-21  76  			 * is based on the pipe bpp value, set the actual link bpp
8ca0b875c08258 Imre Deak 2023-09-21  77  			 * limit here once the MST BW allocation is fixed.
8ca0b875c08258 Imre Deak 2023-09-21  78  			 */
8ca0b875c08258 Imre Deak 2023-09-21  79  			link_bpp = crtc_state->pipe_bpp;
8ca0b875c08258 Imre Deak 2023-09-21  80  
8ca0b875c08258 Imre Deak 2023-09-21  81  		if (link_bpp > max_bpp) {
8ca0b875c08258 Imre Deak 2023-09-21  82  			max_bpp = link_bpp;
8ca0b875c08258 Imre Deak 2023-09-21  83  			max_bpp_pipe = crtc->pipe;
8ca0b875c08258 Imre Deak 2023-09-21  84  		}
8ca0b875c08258 Imre Deak 2023-09-21  85  	}
8ca0b875c08258 Imre Deak 2023-09-21  86  
8ca0b875c08258 Imre Deak 2023-09-21  87  	if (max_bpp_pipe == INVALID_PIPE)
8ca0b875c08258 Imre Deak 2023-09-21  88  		return -ENOSPC;
8ca0b875c08258 Imre Deak 2023-09-21  89  
8ca0b875c08258 Imre Deak 2023-09-21  90  	limits->max_bpp_x16[max_bpp_pipe] = to_bpp_x16(max_bpp) - 1;
8ca0b875c08258 Imre Deak 2023-09-21  91  
8ca0b875c08258 Imre Deak 2023-09-21  92  	return intel_modeset_pipes_in_mask_early(state, reason,
8ca0b875c08258 Imre Deak 2023-09-21  93  						 BIT(max_bpp_pipe));
8ca0b875c08258 Imre Deak 2023-09-21  94  }
8ca0b875c08258 Imre Deak 2023-09-21  95  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
