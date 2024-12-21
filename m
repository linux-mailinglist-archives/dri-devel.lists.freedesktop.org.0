Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 918389F9DCE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 02:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325D10E115;
	Sat, 21 Dec 2024 01:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHtqmXHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475FC10E115;
 Sat, 21 Dec 2024 01:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734745361; x=1766281361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rOF62tvgNxJt0RZQUuuhIIwdbooOIcozMkBWHvrKnYE=;
 b=mHtqmXHqkV7Ial9kD6j6YaHRl2HZ51nApwzYHuz/nAT/gAp/SWO1BhNR
 nJusKsK0ovV1sISluySKyicSiw8YJN0mn30SGI5LYrtu4CTe27kbS9RLZ
 d+pVnT6j+qpit4Gau1y7TeeP+SVCEPyNY5F7BEPCYpJ2zaTGmffe7IAG/
 YHXMBe3DjbKrmtt3fq0gG7YI2wp4qcQrWWe2FfZuutj0v7iNEAs7Y9qVB
 B1mSnk+bsEORNxkVEcJtEvZnnVDrag42em1Bmuiui2Rv7Yyzx3M7DbPWg
 rd37ifvNsaCWsYngI12Rq9CFTZxoeCZP3jBxAxjMOIXTUilGd7CZ4PRxD g==;
X-CSE-ConnectionGUID: n84HIw6KRZKIIg7joPUSAw==
X-CSE-MsgGUID: 0SRcZxZbTS+ZmunPSu9fgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45795453"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="45795453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:42:41 -0800
X-CSE-ConnectionGUID: NScS1WL1RGmYJBr6wZfphQ==
X-CSE-MsgGUID: GzUnLhp6R++7Yk0/NZEBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="129472011"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 20 Dec 2024 17:42:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tOoVo-0001qV-2w;
 Sat, 21 Dec 2024 01:42:36 +0000
Date: Sat, 21 Dec 2024 09:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, uma.shankar@intel.com,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Message-ID: <202412210956.FV7RWpOY-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-dp-Add-the-DPCD-register-required-for-Extended-wake-timeout/20241213-140525
base:   linus/master
patch link:    https://lore.kernel.org/r/20241213060317.2674290-3-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
config: x86_64-randconfig-r121-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210956.FV7RWpOY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210956.FV7RWpOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210956.FV7RWpOY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:146:26: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:148:26: sparse:   also defined here

vim +146 drivers/gpu/drm/i915/display/intel_dp_link_training.c

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
 > 146				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
   147				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
   148				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
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
