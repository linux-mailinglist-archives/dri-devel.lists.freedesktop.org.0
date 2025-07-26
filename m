Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA35B12A51
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 13:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0510E060;
	Sat, 26 Jul 2025 11:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hb6vRqWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B14110E038;
 Sat, 26 Jul 2025 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753530939; x=1785066939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5pqxTuYPmLKOmSbqWUEYtK79OJqpSrniCDOEY+BTw4c=;
 b=Hb6vRqWD+Y8FaOA7KYvBPeRUuT0KY6IVHmptfb1ByKZOvAud1M3TO+zi
 1QE4rO2fmLG4rR6GAoflcESFM0BFwfCkyUyokTq1eU4dxmAKDXSl4jrD4
 REe0FYkL1dz0eCbY8569CDLlSPNbl1Rqh3KqMp6YNXweOAVupvBVNhc+T
 vXlIhp/3biSCUeSKAOy8rak/5V32YOwJ7NnF2P+5vxlt/J+i7mZ9563A4
 dK6oEYkCE0zmij8HDQbLMNJ6Ewqz8kQjaEOuc5Mvxz+kJxRn7wxOTlFkY
 IM0IseUIeDTf4WgM8V4F8aBQHxlT2IQQsA8pDMb4lasUw2Czm+ZI5Xe6G g==;
X-CSE-ConnectionGUID: iO6hWaKcSdqX9bZKJBwK7w==
X-CSE-MsgGUID: UR9dGwZpRNC7xFYKE91O8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="81292958"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="81292958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 04:55:38 -0700
X-CSE-ConnectionGUID: KetqQ/i4RCu45sKY4PD9rQ==
X-CSE-MsgGUID: u5s0UBS8SWKZsYbSlxLcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165679470"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 26 Jul 2025 04:55:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufdUz-000LxD-2D;
 Sat, 26 Jul 2025 11:55:33 +0000
Date: Sat, 26 Jul 2025 19:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 11/28] drm/i915/writeback: Define encoder->get_hw_state
Message-ID: <202507261936.cnkpq7bw-lkp@intel.com>
References: <20250725050409.2687242-12-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-12-suraj.kandpal@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on v6.16-rc7 next-20250725]
[cannot apply to linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250725-133017
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250725050409.2687242-12-suraj.kandpal%40intel.com
patch subject: [PATCH 11/28] drm/i915/writeback: Define encoder->get_hw_state
config: i386-buildonly-randconfig-006-20250725 (https://download.01.org/0day-ci/archive/20250726/202507261936.cnkpq7bw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261936.cnkpq7bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261936.cnkpq7bw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_writeback.c:177:3: error: fallthrough annotation does not directly precede switch label
     177 |                 fallthrough;
         |                 ^
   include/linux/compiler_attributes.h:214:41: note: expanded from macro 'fallthrough'
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^
   1 error generated.


vim +177 drivers/gpu/drm/i915/display/intel_writeback.c

   141	
   142	static bool
   143	intel_writeback_get_hw_state(struct intel_encoder *encoder,
   144				     enum pipe *pipe)
   145	{
   146		struct intel_display *display = to_intel_display(encoder);
   147		u8 pipe_mask = 0;
   148		u32 tmp;
   149	
   150		/* TODO need to be done for both the wd transcoder */
   151		tmp = intel_de_read(display,
   152				    TRANSCONF_WD(TRANSCODER_WD_0));
   153		if (!(tmp & WD_TRANS_ENABLE))
   154			return false;
   155	
   156		tmp = intel_de_read(display,
   157				    WD_TRANS_FUNC_CTL(TRANSCODER_WD_0));
   158	
   159		if (!(tmp & TRANS_WD_FUNC_ENABLE))
   160			return false;
   161	
   162		switch (tmp & WD_INPUT_SELECT_MASK) {
   163		case WD_INPUT_PIPE_A:
   164			pipe_mask |= BIT(PIPE_A);
   165			break;
   166		case WD_INPUT_PIPE_B:
   167			pipe_mask |= BIT(PIPE_B);
   168			break;
   169		case WD_INPUT_PIPE_C:
   170			pipe_mask |= BIT(PIPE_C);
   171			break;
   172		case WD_INPUT_PIPE_D:
   173			pipe_mask |= BIT(PIPE_D);
   174			break;
   175		default:
   176			MISSING_CASE(tmp & WD_INPUT_SELECT_MASK);
 > 177			fallthrough;
   178		}
   179	
   180		if (pipe_mask == 0)
   181			return false;
   182	
   183		*pipe = ffs(pipe_mask) - 1;
   184	
   185		return true;
   186	}
   187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
