Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A5B5212C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E310E9C8;
	Wed, 10 Sep 2025 19:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BojGLvm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5E10E9CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532958; x=1789068958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=glGPFG+CIZ1HcAUwv3tEcuY/Pc94TIJeXpFprv7xWPY=;
 b=BojGLvm8etME5usnLszaH3bsVMjg0pvAzB5NMHZYpJTaNvXA3rOKjyCq
 9GNG73G3rt0wSjyF+CJwohgy5k8JX06aWQoMkAukJQO4YJvP0BwmgFfmF
 SU+t4nJ9siHISSZS/zN/DFT/paDbaoOnYXY4xaiKgO3sXQnquw9+FAX60
 KRTfLS0XrBLA13MXL1zS7bNG9zh3l/puiQAISpYyr5ekirNekYXUXsa63
 b5WKGQ0x5cGMYbLD/wg+WS4beHWV38Np1YMlFgG071QBTB1/Zi18KgEZA
 hUfLhWOEJE9/LOlStcpVGLmLaw5O0CFuTXJcyAjyUst+cvC+guI5jT7Xv w==;
X-CSE-ConnectionGUID: n22M0XaWR32vTjN+TR+Uag==
X-CSE-MsgGUID: YCGGJEYLSdWoYlGD1ULYDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47428388"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="47428388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:35:57 -0700
X-CSE-ConnectionGUID: Gotx55P7RVmJn72DnzWJFg==
X-CSE-MsgGUID: QAIlmXqkSd+dhIdGihFtug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="177783300"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 10 Sep 2025 12:35:54 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uwQbf-0006Eh-10;
 Wed, 10 Sep 2025 19:35:51 +0000
Date: Thu, 11 Sep 2025 03:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <202509110339.t9spKBAI-lkp@intel.com>
References: <20250908061605.76787-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908061605.76787-3-mike.looijmans@topic.nl>
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

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on 53e760d8949895390e256e723e7ee46618310361]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Looijmans/dt-bindings-drm-bridge-ti-tmds181-Add-TI-TMDS181-and-SN65DP159-bindings/20250908-141752
base:   53e760d8949895390e256e723e7ee46618310361
patch link:    https://lore.kernel.org/r/20250908061605.76787-3-mike.looijmans%40topic.nl
patch subject: [PATCH v5 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
config: i386-randconfig-013-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110339.t9spKBAI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110339.t9spKBAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110339.t9spKBAI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/ti-tmds181.o: in function `tmds181_mode_valid':
>> drivers/gpu/drm/bridge/ti-tmds181.c:118:(.text+0x2e): undefined reference to `drm_hdmi_compute_mode_clock'


vim +118 drivers/gpu/drm/bridge/ti-tmds181.c

   111	
   112	static enum drm_mode_status
   113	tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_info *info,
   114			   const struct drm_display_mode *mode)
   115	{
   116		unsigned long long rate;
   117	
 > 118		rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
   119	
   120		/* Minimum clock rate is 25MHz */
   121		if (rate < 25000000)
   122			return MODE_CLOCK_LOW;
   123	
   124		/*
   125		 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
   126		 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
   127		 */
   128		if (rate > 600000000)
   129			return MODE_CLOCK_HIGH;
   130	
   131		return MODE_OK;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
