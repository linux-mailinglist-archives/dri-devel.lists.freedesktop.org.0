Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C04978D6A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 06:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E709410E0BE;
	Sat, 14 Sep 2024 04:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPuQqJbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC5610E0BE
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 04:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726289508; x=1757825508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d/8X4Idqvm5bT+suEtQZD2BhDw8gn9M8PvI/hQGY6LQ=;
 b=NPuQqJbL1UinnKL7GiUD7+uEIPbeU1hEIlLu3yRmnxlISYjW6gsxRdgE
 WSxwFK3sSm9iVV0l5tGH+Xkuuu+WQ77d1qYljuyPbrdBT3+PqfamUpadg
 ROipLNnxGVkt2jkgzMjWudzqH4xeHhp0yWUIaddK2gvG9cS083/M64lml
 Ol3C2Z+O11912d6qXjpK7ndGkwX2H7816b+RSuWWJnyWArhKMK7dKXU39
 wOaWf9EbCuNL6f6nXTWJGYArD6DBZiuCUVYyt3L4EO+B+fpe7g5oimds4
 1EmSVtAhPDTYJfdAgNZmw7yqcbov1CFti9ht9D/C/6OFXFrDWKgSuBMnv w==;
X-CSE-ConnectionGUID: tiuT4wwlRoi4QzEuw90V5Q==
X-CSE-MsgGUID: 4IiWa3DcR6uShZiH2qmpfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25323650"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; d="scan'208";a="25323650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 21:51:47 -0700
X-CSE-ConnectionGUID: cRIVJ7dhT1GeBL0U5a6Y6w==
X-CSE-MsgGUID: k+X960AwScmh1lLLeEIj5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; d="scan'208";a="73317504"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 13 Sep 2024 21:51:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1spKkz-0007NQ-2n;
 Sat, 14 Sep 2024 04:51:37 +0000
Date: Sat, 14 Sep 2024 12:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/27] gcc-sdm845: Add general purpose clock ops
Message-ID: <202409141246.H3882zgF-lkp@intel.com>
References: <20240913-starqltechn_integration_upstream-v4-3-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-3-2d2efd5c5877@gmail.com>
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

Hi Dzmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5acd9952f95fb4b7da6d09a3be39195a80845eb6]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/power-supply-add-undervoltage-health-status-property/20240913-231027
base:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
patch link:    https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-3-2d2efd5c5877%40gmail.com
patch subject: [PATCH v4 03/27] gcc-sdm845: Add general purpose clock ops
config: i386-buildonly-randconfig-004-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141246.H3882zgF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141246.H3882zgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141246.H3882zgF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sdm845.c:291:9: warning: braces around scalar initializer
     291 |         .freq_tbl = {},
         |         ^
   drivers/clk/qcom/gcc-sdm845.c:291:9: note: (near initialization for 'gcc_gp1_clk_src.<anonymous>.freq_tbl')
>> drivers/clk/qcom/gcc-sdm845.c:291:21: error: empty scalar initializer
     291 |         .freq_tbl = {},
         |                     ^
   drivers/clk/qcom/gcc-sdm845.c:291:21: note: (near initialization for 'gcc_gp1_clk_src.<anonymous>.freq_tbl')
   drivers/clk/qcom/gcc-sdm845.c:305:9: warning: braces around scalar initializer
     305 |         .freq_tbl = {},
         |         ^
   drivers/clk/qcom/gcc-sdm845.c:305:9: note: (near initialization for 'gcc_gp2_clk_src.<anonymous>.freq_tbl')
   drivers/clk/qcom/gcc-sdm845.c:305:21: error: empty scalar initializer
     305 |         .freq_tbl = {},
         |                     ^
   drivers/clk/qcom/gcc-sdm845.c:305:21: note: (near initialization for 'gcc_gp2_clk_src.<anonymous>.freq_tbl')
   drivers/clk/qcom/gcc-sdm845.c:319:9: warning: braces around scalar initializer
     319 |         .freq_tbl = {},
         |         ^
   drivers/clk/qcom/gcc-sdm845.c:319:9: note: (near initialization for 'gcc_gp3_clk_src.<anonymous>.freq_tbl')
   drivers/clk/qcom/gcc-sdm845.c:319:21: error: empty scalar initializer
     319 |         .freq_tbl = {},
         |                     ^
   drivers/clk/qcom/gcc-sdm845.c:319:21: note: (near initialization for 'gcc_gp3_clk_src.<anonymous>.freq_tbl')


vim +291 drivers/clk/qcom/gcc-sdm845.c

   285	
   286	static struct clk_rcg2 gcc_gp1_clk_src = {
   287		.cmd_rcgr = 0x64004,
   288		.mnd_width = 8,
   289		.hid_width = 5,
   290		.parent_map = gcc_parent_map_1,
 > 291		.freq_tbl = {},
   292		.clkr.hw.init = &(struct clk_init_data){
   293			.name = "gcc_gp1_clk_src",
   294			.parent_data = gcc_parent_data_1,
   295			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
   296			.ops = &clk_rcg2_gp_ops,
   297		},
   298	};
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
