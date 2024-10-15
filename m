Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE899E38B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 12:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386B210E220;
	Tue, 15 Oct 2024 10:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfjL7TtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578710E220;
 Tue, 15 Oct 2024 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728987229; x=1760523229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jBNLiiDQztK8tDxklcBbYNKZ4i3UWrSzPxw5rOzncRg=;
 b=HfjL7TtXY+R1B+LoVwVId9KVtVtSyKcx5/aOP0Fc+yV0iY8GmibPhI4I
 8hnwzr5uWIZm4RON3HockQ05rvAf5mwhAbGa8SC9tVEfjJlkjfT9DxX1A
 5sGXBRDBHJEReqgQHLCq22YiReGFeHmOYyEeAPpA0Comud/3FMXdGcmr2
 qmr4FzmOdIESW9I+U43Ei7e6p/ZuONCjVQQVL5RL8by0yIrGg+Ndud9g/
 5R2OYmQf/uwrTQbJszw9BgQJvBw+k4+8M4fuvhQBemQBZ4OD21eZsgxzb
 H6uKK0+LEOtPTJ0kLmjWtiDZs5ejEpHghFjftbyZcmmOahdwlVubSjvcS g==;
X-CSE-ConnectionGUID: PMf7idySSc2AahkdCevE4Q==
X-CSE-MsgGUID: IfdHWJeTSEevk4yk2xgcug==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28158113"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28158113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 03:13:48 -0700
X-CSE-ConnectionGUID: USzd0He1RrSE+DO0OgbOWg==
X-CSE-MsgGUID: Iwu0yHTATwuaRIQb8BI1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="108574767"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 03:13:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t0eYg-000Hx3-0G;
 Tue, 15 Oct 2024 10:13:42 +0000
Date: Tue, 15 Oct 2024 18:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedriuswork@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: oe-kbuild-all@lists.linux.dev,
 Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedriuswork@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/lspcon: do not hardcode settle timeout
Message-ID: <202410151813.Hw9oCTae-lkp@intel.com>
References: <20241014093914.109162-1-giedriuswork@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014093914.109162-1-giedriuswork@gmail.com>
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

Hi Giedrius,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc3 next-20241015]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Giedrius-Statkevi-ius/drm-i915-lspcon-do-not-hardcode-settle-timeout/20241014-174131
base:   linus/master
patch link:    https://lore.kernel.org/r/20241014093914.109162-1-giedriuswork%40gmail.com
patch subject: [PATCH] drm/i915/lspcon: do not hardcode settle timeout
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241015/202410151813.Hw9oCTae-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151813.Hw9oCTae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151813.Hw9oCTae-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:495: warning: Function parameter or struct member 'time_out' not described in 'drm_lspcon_set_mode'


vim +495 drivers/gpu/drm/display/drm_dp_dual_mode_helper.c

056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  482  
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  483  /**
613a308159e5dd drivers/gpu/drm/drm_dp_dual_mode_helper.c         Jani Nikula           2016-10-19  484   * drm_lspcon_set_mode: Change LSPCON's mode of operation by
613a308159e5dd drivers/gpu/drm/drm_dp_dual_mode_helper.c         Jani Nikula           2016-10-19  485   * writing offset (0x80, 0x40)
318fbd7dfedd67 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Lyude Paul            2021-04-23  486   * @dev: &drm_device to use
613a308159e5dd drivers/gpu/drm/drm_dp_dual_mode_helper.c         Jani Nikula           2016-10-19  487   * @adapter: I2C-over-aux adapter
613a308159e5dd drivers/gpu/drm/drm_dp_dual_mode_helper.c         Jani Nikula           2016-10-19  488   * @mode: required mode of operation
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  489   *
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  490   * Returns:
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  491   * 0 on success, -error on failure/timeout
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17  492   */
318fbd7dfedd67 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Lyude Paul            2021-04-23  493  int drm_lspcon_set_mode(const struct drm_device *dev, struct i2c_adapter *adapter,
3d7a1094af9e7e drivers/gpu/drm/display/drm_dp_dual_mode_helper.c Giedrius Statkevičius 2024-10-14  494  			enum drm_lspcon_mode mode, int time_out)
056996b9568632 drivers/gpu/drm/drm_dp_dual_mode_helper.c         Shashank Sharma       2016-10-17 @495  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
