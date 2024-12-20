Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC859F98C0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 18:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CF510F01A;
	Fri, 20 Dec 2024 17:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sr/mdRN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DFC10E2BC;
 Fri, 20 Dec 2024 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734717299; x=1766253299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=COrGDsE+6FkDk0qtw/IOAao0v3/zpzZi8FytxHNo6/0=;
 b=Sr/mdRN9zFq4QOkFlCCh5XpvjDYEJ8u1A8/nK0rm1CRIRtmkSXJwWWsa
 5aNruvVxJnKd39yU3I6bYDkZLMhrNuOWzmHNv6zLTykWwF0unsKteYb+H
 aQ7svttu2VoI+9KCqD9ANgy8Q465vj3m9c86SDbaSYYfZK6uCyhbag98A
 PWhNV+vcOzTdegfOLeh4Kf+FH+HmGepJ/H9v6PRSgC3LjUrHpjjy/ZT8h
 GlQ9gNymLOLnEJh9NORlatxtdW8dz6NFOuoGSIYOJR/AIjjo27Kmg4lKd
 QDNb1KWxpaHiU/2QrKlY2yxuWlFikQdGYwXmpweBkLumGLttFkHy+7xcP A==;
X-CSE-ConnectionGUID: REfH9vbVRdO+2P6ZIsPkGQ==
X-CSE-MsgGUID: TjPBtM74Q6S+1AKp7yj0aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57745177"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="57745177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 09:54:59 -0800
X-CSE-ConnectionGUID: od/mu5MRQXeBPBYQouT32A==
X-CSE-MsgGUID: AInTPUSBQjuyz7QlwXBi4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98392206"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 09:54:56 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOhDC-0001VH-0A;
 Fri, 20 Dec 2024 17:54:54 +0000
Date: Sat, 21 Dec 2024 01:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, uma.shankar@intel.com,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Message-ID: <202412210137.vRBJlttZ-lkp@intel.com>
References: <20241213060317.2674290-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213060317.2674290-3-suraj.kandpal@intel.com>
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

[auto build test ERROR on linus/master]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-dp-Add-the-DPCD-register-required-for-Extended-wake-timeout/20241213-140525
base:   linus/master
patch link:    https://lore.kernel.org/r/20241213060317.2674290-3-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
config: i386-randconfig-013-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210137.vRBJlttZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210137.vRBJlttZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210137.vRBJlttZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dp_link_training.c: In function 'intel_dp_lttpr_wake_timeout_setup':
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:148:69: error: initialized field overwritten [-Werror=override-init]
     148 |                         [DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
         |                                                                     ^~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:148:69: note: (near initialization for 'timeout_mapping[1]')
   cc1: all warnings being treated as errors


vim +148 drivers/gpu/drm/i915/display/intel_dp_link_training.c

   136	
   137	void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp)
   138	{
   139		struct intel_display *display = to_intel_display(intel_dp);
   140		u8 val = 1;
   141		int ret;
   142	
   143		if (intel_dp_lttpr_transparent_mode_enabled(intel_dp)) {
   144			static const u8 timeout_mapping[] = {
   145				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] = 1,
   146				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
   147				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
 > 148				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
   149				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS] = 80,
   150				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS] = 100,
   151			};
   152	
   153			ret = drm_dp_dpcd_readb(&intel_dp->aux,
   154						DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
   155			if (ret != 1) {
   156				drm_dbg_kms(display->drm,
   157					    "Failed to read Extended sleep wake timeout request\n");
   158				return;
   159			}
   160	
   161			val = (val < sizeof(timeout_mapping) && timeout_mapping[val]) ?
   162				timeout_mapping[val] : 1;
   163	
   164			drm_dp_dpcd_writeb(&intel_dp->aux, DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
   165					   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
   166		} else {
   167			ret = drm_dp_dpcd_readb(&intel_dp->aux,
   168						DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
   169			if (ret != 1) {
   170				drm_dbg_kms(display->drm,
   171					    "Failed to read Extended sleep wake timeout request\n");
   172				return;
   173			}
   174	
   175			val = (val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
   176				(val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
   177	
   178			drm_dp_dpcd_writeb(&intel_dp->aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
   179					   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
   180		}
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
