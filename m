Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44451C9B063
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 11:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5400B10E556;
	Tue,  2 Dec 2025 10:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3U7LOTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE75910E556
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764669982; x=1796205982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oQlaqUeREC8Pc2NqxB4xgOj6FQuw9eUxeGBxZjH6Sgc=;
 b=m3U7LOTmSu7DKVjWXzAeDHIribeVglwLZPGs8+l0g8suR6OCr3dsW3QK
 uE90RNV87hSZdo22PUhR/L7zOzZY2xFCc/HsIcH+2S8GAXJxQ1yGrMC+9
 6SMyha50zdKrYJSW24PdITRPpkYQxznj+JGvh6+ozzJA2fhml9ldIMXTn
 sFbrofEsoA1fn23b5fkkzXXJ9blzRhogEZryYETdyiasUVh1q8ycEWEfr
 tT3xJCgtSGItJyCwif9cagNkzxiqgsut1ZniNmecuMIQfhfGUkGHl8Zdl
 Oj8bjv/W6GCKFYue/kNmJ0rzHUVFbiYj6v9R2hXfgtfYVFNYSM1b12Kq+ g==;
X-CSE-ConnectionGUID: KbTBu3eST+qf9kEvZ5a9Sw==
X-CSE-MsgGUID: 2/M0CQYYSv++//5HmtWFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69223298"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="69223298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 02:06:21 -0800
X-CSE-ConnectionGUID: PITpErWwRNmDgKnxiyeQcw==
X-CSE-MsgGUID: 4OdsEXdETKmHXxBiAj8Kiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="217680052"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 02:06:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vQNGv-000000009fR-1YFs;
 Tue, 02 Dec 2025 10:06:13 +0000
Date: Tue, 2 Dec 2025 18:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <202512021733.cIbkorvY-lkp@intel.com>
References: <20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e@pengutronix.de>
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

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/dt-bindings-soc-imx93-media-blk-ctrl-Add-PDFC-subnode-to-schema-and-example/20251202-011707
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-2-7b056e1e5b1e%40pengutronix.de
patch subject: [PATCH v6 2/3] drm/bridge: imx: Add i.MX93 parallel display format configuration support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021733.cIbkorvY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021733.cIbkorvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021733.cIbkorvY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/imx/imx93-pdfc.c:55:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |                 val = FORMAT_RGB888_TO_RGB888;
         |                       ^
   drivers/gpu/drm/bridge/imx/imx93-pdfc.c:21:34: note: expanded from macro 'FORMAT_RGB888_TO_RGB888'
      21 | #define FORMAT_RGB888_TO_RGB888         FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
         |                                         ^
   1 error generated.


vim +/FIELD_PREP +55 drivers/gpu/drm/bridge/imx/imx93-pdfc.c

    42	
    43	static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
    44						    struct drm_atomic_state *state)
    45	{
    46		struct imx93_pdfc *pdfc = bridge->driver_private;
    47		const struct drm_bridge_state *bridge_state;
    48		unsigned int mask = PARALLEL_DISP_FORMAT;
    49		unsigned int val;
    50	
    51		bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
    52	
    53		switch (bridge_state->output_bus_cfg.format) {
    54		case MEDIA_BUS_FMT_RGB888_1X24:
  > 55			val = FORMAT_RGB888_TO_RGB888;
    56			if (pdfc->phy_bus_width == 18) {
    57				/*
    58				 * Can be valid if physical bus limitation exist,
    59				 * therefore use dev_dbg().
    60				 */
    61				dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
    62				val = FORMAT_RGB888_TO_RGB666;
    63			}
    64			break;
    65		case MEDIA_BUS_FMT_RGB666_1X18:
    66			val = FORMAT_RGB888_TO_RGB666;
    67			break;
    68		case MEDIA_BUS_FMT_RGB565_1X16:
    69			val = FORMAT_RGB565_TO_RGB565;
    70			break;
    71		}
    72	
    73		regmap_update_bits(pdfc->regmap, pdfc->disp_mux_reg_off, mask, val);
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
