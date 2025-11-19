Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E1C710A2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 21:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122210E672;
	Wed, 19 Nov 2025 20:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8IhV5Yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EBE10E672
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763584481; x=1795120481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qewXocdKo9cLRXB0u7E4iV5rncB/pe/qAOBWdTkGlpM=;
 b=V8IhV5Yz3TAgQjv/8wB8ep17gegepkRiASEsXc82AhQIKZybcJKLg+Zz
 HaEbZBcyR9m9RL0pfxlwCOke569Bour6Gywoi/lMPZexBfMBzuMrVjhhW
 0LhDJ/xepUnJR/eS/RzhIFXqWgLDf/MHRlu5z5xZ2Fb7DLKacEEBnUrJZ
 XZ/mWcFeSC38MItDApLX4fAO1V9GLnpk6+GbGED+vlwacQQtkIRptb3B5
 62dDl/4PT7nXy+Jz1snYnzvxfPBCWuUcYzuYpOVm44sKwVZg0JMVe2Fxu
 FO42kHw9AV5D/ifYnAKkmuicXqhZCzj/4xbWVoeBWmy8WdktAv8VPzNz7 Q==;
X-CSE-ConnectionGUID: kfERTIYdQEqdwtl5V+HQKQ==
X-CSE-MsgGUID: Umu3toOyS8iWv59dOXIFYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65798448"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="65798448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:34:41 -0800
X-CSE-ConnectionGUID: CN8Juv0BSfO7B4DVJs2Nww==
X-CSE-MsgGUID: 243fnx0sSK+yPpa3iYBPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="195273752"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 19 Nov 2025 12:34:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vLosr-0003IB-36;
 Wed, 19 Nov 2025 20:34:33 +0000
Date: Thu, 20 Nov 2025 04:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Brandt <chris.brandt@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>,
 Hugo Villeneuve <hugo@hugovil.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Brandt <chris.brandt@renesas.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Message-ID: <202511200435.SrjxVc9k-lkp@intel.com>
References: <20251119022744.1599235-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119022744.1599235-2-chris.brandt@renesas.com>
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

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd30a345f284e0d9b1755e3538f8257cf4deb79f]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Brandt/clk-renesas-rzg2l-Remove-DSI-clock-rate-restrictions/20251119-103032
base:   dd30a345f284e0d9b1755e3538f8257cf4deb79f
patch link:    https://lore.kernel.org/r/20251119022744.1599235-2-chris.brandt%40renesas.com
patch subject: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
config: loongarch-randconfig-001-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200435.SrjxVc9k-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200435.SrjxVc9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200435.SrjxVc9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pmdomain/renesas/rcar-gen4-sysc.c:9:
>> include/linux/clk/renesas.h:44:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      44 | static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
         |                                                    ^
   1 warning generated.


vim +44 include/linux/clk/renesas.h

    40	
    41	#ifdef CONFIG_CLK_RZG2L
    42	void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
    43	#else
  > 44	static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
    45	#endif
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
