Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4811E8486AB
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 15:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD65810F4FF;
	Sat,  3 Feb 2024 14:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJ/Lp2fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF92D10F4FF
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706970100; x=1738506100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iKJsA8qrv4b0XlTNT8h8NVU8w8Bmbd2G3WGljcs7ppQ=;
 b=PJ/Lp2finIzWX0SeImv3LRgzMHVndLSO/4Y4qPA2Md6YR1OGuIOfoG+Q
 agXPtnAmp4M+RXkmPVnRmS0HO9PNiL7tZs1kg1YICVBC58wiU8AQ4vvfm
 8bVP9hmGWD0T0DnlDGPV3bPl3nSaSMsA0ihrbwWpy9+V3Q/oqpKY/AoTJ
 0+h/7LUFNDMv/i4qEI88Sh3E61xRV8WgZ6zJ1xj8MRivQ81tHEOBS7att
 DcUIub6jce2TtSYt6tZ1/RpobIP7bjER8xcTheQ15gtioRxSV7ZmecNBR
 9OCtjCXT5C5S25tuekydlZ5cA0TDmC7gquMoQy5a5zvmn6qftS1uKVcmz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="474804"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="474804"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 06:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="932751511"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; d="scan'208";a="932751511"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2024 06:21:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWGtd-00059K-24;
 Sat, 03 Feb 2024 14:21:29 +0000
Date: Sat, 3 Feb 2024 22:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 manikandan.m@microchip.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux4microchip@microchip.com
Subject: Re: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
Message-ID: <202402032248.6puqAuzM-lkp@intel.com>
References: <20240122082947.21645-3-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122082947.21645-3-dharma.b@microchip.com>
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

Hi Dharma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dharma-Balasubiramani/dt-bindings-display-bridge-add-sam9x7-lvds-compatible/20240122-163209
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240122082947.21645-3-dharma.b%40microchip.com
patch subject: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
config: arm-randconfig-r112-20240203 (https://download.01.org/0day-ci/archive/20240203/202402032248.6puqAuzM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402032248.6puqAuzM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032248.6puqAuzM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/microchip-lvds.c:236:24: sparse: sparse: symbol 'mchp_lvds_driver' was not declared. Should it be static?

vim +/mchp_lvds_driver +236 drivers/gpu/drm/bridge/microchip-lvds.c

   235	
 > 236	struct platform_driver mchp_lvds_driver = {
   237		.probe = mchp_lvds_probe,
   238		.remove = mchp_lvds_remove,
   239		.driver = {
   240			   .name = "microchip-lvds",
   241			   .of_match_table = mchp_lvds_dt_ids,
   242		},
   243	};
   244	module_platform_driver(mchp_lvds_driver);
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
