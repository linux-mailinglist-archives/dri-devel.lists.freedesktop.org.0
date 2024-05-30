Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6238D519A
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 20:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E93110E49D;
	Thu, 30 May 2024 18:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEmKXiJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2110E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717092245; x=1748628245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BEIEhrG9qX9RIUaoual1xQdHFV9ZgAZNbmY16Qsocp4=;
 b=fEmKXiJ9a9KI3LhofMaAmYU2k8sEPfaU4GdHcnShcAfaj92M5ql6eyQz
 qYuHLiqLc2NopnOvRsmpXGECdwTY3ydpErSDRmmZYNV79Ke1i6YkLxTaE
 wtv1smQNGzQXt1So3L81lyo+f4N8AFlPI2NSfFZU9/99M4+ritZOvErL4
 /remByHzWARVQA1d7NqREm7RYQmo8RMmwLodlplc8cOWRx5maBK5I4ZAs
 5DynTB/V2Jm65MbCOTmEc1/PGyXo3w9hoxNcrdZ/1mBGBieqSzxVZy0Tg
 ilSFhqjQjHteY5LSWpauNhnP7PmZHpBnBbDRriqDqWmqdiUM3QittDvbO Q==;
X-CSE-ConnectionGUID: ZxkV8KlDSkCqug0quGNrCw==
X-CSE-MsgGUID: Rspw5rZpSnqUe5jb2GkjCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13828135"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13828135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 11:04:05 -0700
X-CSE-ConnectionGUID: zucVqWpJR0mBCJBFt7Bqzw==
X-CSE-MsgGUID: p3huy5JiRFKNX17xuU9R6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36389437"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 30 May 2024 11:04:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sCk85-000For-1p;
 Thu, 30 May 2024 18:03:57 +0000
Date: Fri, 31 May 2024 02:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <202405310123.KWoPspRr-lkp@intel.com>
References: <20240530083513.4135052-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-3-wenst@chromium.org>
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20240530-163739
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240530083513.4135052-3-wenst%40chromium.org
patch subject: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
config: x86_64-buildonly-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310123.KWoPspRr-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310123.KWoPspRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310123.KWoPspRr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:2965:34: warning: 'idle_state_match' defined but not used [-Wunused-const-variable=]
    2965 | static const struct of_device_id idle_state_match[] = {
         |                                  ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y]


vim +/idle_state_match +2965 drivers/pmdomain/core.c

5d6be70add65e3 drivers/base/power/domain.c Ulf Hansson 2018-06-29  2964  
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14 @2965  static const struct of_device_id idle_state_match[] = {
598da548ef7892 drivers/base/power/domain.c Lina Iyer   2016-11-03  2966  	{ .compatible = "domain-idle-state", },
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2967  	{ }
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2968  };
30f604283e05d3 drivers/base/power/domain.c Lina Iyer   2016-10-14  2969  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
