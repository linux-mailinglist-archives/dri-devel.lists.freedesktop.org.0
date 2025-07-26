Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A8B12CC2
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 23:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C8E10E107;
	Sat, 26 Jul 2025 21:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRu/PbZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8732010E107
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 21:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753566635; x=1785102635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hSbqujNyJtfgoVzH7Vax+KT9pmAhM1E22Hv7yYf+bQ0=;
 b=kRu/PbZN9ATlJCM6RgFcm1KZXVu8/K1qDjSdStQA+7hQFj2vX853tDwQ
 b1Inm0JXVsImfUPmiYHU3wxJsYAC0JOst1ZcD0CVvTWPX9d6LLXoZVgET
 GShMDfaz9J75+4gtWoWs9qckDXsO0Sq152BE8NcklaOfy3M0kc21wTOYe
 O+iuDAlX+585YuLoL39yo65ynCI8q16Mz3st1sar76A/R0rd4WtbWBQLq
 ML2udDvaUKmbt8p15XHzBuyCpWYdjtWRfOnM4J1J94k+kXFUDkDo40Em0
 j/BZ7D9dhVm5r2+sfCjnU4SRiOHmvtX2HnU3kB5hZe3fZtAI7igWvzBh3 w==;
X-CSE-ConnectionGUID: RYVeWz7hQFetVKayx6oLyw==
X-CSE-MsgGUID: e/hHfJT4Ttmj0lVZK/2Bcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55721666"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55721666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 14:50:34 -0700
X-CSE-ConnectionGUID: YUbCUJRlSDSYtBKh9alZxQ==
X-CSE-MsgGUID: msO8MjvYQuO0CppyXIzicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="192644434"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 14:50:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufmmg-000MJH-2B;
 Sat, 26 Jul 2025 21:50:26 +0000
Date: Sun, 27 Jul 2025 05:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Maud Spierings <maudspierings@gocontroll.com>,
 MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
Message-ID: <202507270543.G0TT6f25-lkp@intel.com>
References: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
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

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-bindings/20250725-191221
base:   d7af19298454ed155f5cf67201a70f5cf836c842
patch link:    https://lore.kernel.org/r/20250725-max25014-v1-2-0e8cce92078e%40gocontroll.com
patch subject: [PATCH 2/4] backlight: add max25014atg backlight
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270543.G0TT6f25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270543.G0TT6f25-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/max25014.c:86:4: warning: variable 'res' is uninitialized when used here [-Wuninitialized]
      86 |                         res |= 1 << i;
         |                         ^~~
   drivers/video/backlight/max25014.c:82:13: note: initialize the variable 'res' to silence this warning
      82 |         uint8_t res, i;
         |                    ^
         |                     = '\0'
   1 warning generated.


vim +/res +86 drivers/video/backlight/max25014.c

    73	
    74	/**
    75	 * @brief get the bit mask for the DISABLE register.
    76	 *
    77	 * @param strings the led string configuration array.
    78	 * @return uint8_t bits to set in the register.
    79	 */
    80	static uint8_t strings_mask(struct max25014 *maxim)
    81	{
    82		uint8_t res, i;
    83	
    84		for (i = 0; i < 4; i++) {
    85			if (maxim->pdata->strings[i] == 0)
  > 86				res |= 1 << i;
    87		}
    88		return res;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
