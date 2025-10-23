Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5EC02EB7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 20:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9210E051;
	Thu, 23 Oct 2025 18:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxV76gZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789210E051
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 18:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761243961; x=1792779961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5A9cwCpLAbmcwcGzmIT4SS7c97Xcvoz/XAGBdnOPplc=;
 b=CxV76gZvJPbRU4sQc26iQ07EFLjtUg2LJw5/EH3hdQDaJviZH6jJj20i
 Sf2ueDic/Ek7p61SnjXoPR+tzm3eHpRL3sQya3E6FfufW3dA8goXAKg2e
 bqsAKAASdWlmPrxhxg5eD/PmAvRzTqdvcaiEZkn78/GcdgLIRzvYFqAK+
 VBvlG+tnkPJcLykiaG/nyLePmTgbymlEnZraagY4LVbwIQJs2BVRMOmzv
 38fX7BbO8oQKtpwnQIeWXNtnUAJXwoYRsEMQ/oEgY0CmPPWp4tq4CZBDg
 C7g948PEHKoMb2LZPZwTAn4Lsb04m+Ml1aoLDHpgWaWUOnhMqECaBpH3k w==;
X-CSE-ConnectionGUID: 783v9F0qRbada2qaaEEmuQ==
X-CSE-MsgGUID: H7MjixulRv2dSJWdwIuu2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74028043"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74028043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:26:01 -0700
X-CSE-ConnectionGUID: rclUnAjKRYShC6bZ9aDLXA==
X-CSE-MsgGUID: Wq2RVmZXT3eVlTvwxMbwBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="183406331"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 23 Oct 2025 11:25:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vC00Y-000DmZ-1N;
 Thu, 23 Oct 2025 18:25:54 +0000
Date: Fri, 24 Oct 2025 02:25:06 +0800
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
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Message-ID: <202510240100.fpturxgp-lkp@intel.com>
References: <20251022235903.1091453-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022235903.1091453-2-chris.brandt@renesas.com>
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

[auto build test WARNING on clk/clk-next]
[also build test WARNING on geert-renesas-drivers/renesas-clk sunxi/sunxi/for-next linus/master v6.18-rc2 next-20251023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Brandt/clk-renesas-rzg2l-Remove-DSI-clock-rate-restrictions/20251023-080220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251022235903.1091453-2-chris.brandt%40renesas.com
patch subject: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
config: loongarch-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251024/202510240100.fpturxgp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240100.fpturxgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240100.fpturxgp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/renesas/rzg2l-cpg.c:636:27: warning: result of comparison of constant 319 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
     636 |                                     params->pl5_intin > PLL5_INTIN_MAX - 1)
         |                                     ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +636 drivers/clk/renesas/rzg2l-cpg.c

   577	
   578	static unsigned long
   579	rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
   580				       struct rzg2l_pll5_param *params,
   581				       unsigned long rate)
   582	{
   583		unsigned long foutpostdiv_rate, foutvco_rate;
   584		u8 div = 1;
   585		unsigned int a, b;
   586	
   587		if (priv->mux_dsi_div_params.clksrc)
   588			div = 2;
   589	
   590		/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
   591		for (a = 0; a < 4; a++) {
   592			if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
   593				continue;	/* 1/1 div not supported for DIV_DSI_A for DPI */
   594	
   595			for (b = 0; b < 16; b++) {
   596				if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
   597					continue;	/* Only 1/1 div supported for DIV_DSI_B in DPI */
   598	
   599				if ((b + 1) << a == dsi_div_ab) {
   600					priv->mux_dsi_div_params.dsi_div_a = a;
   601					priv->mux_dsi_div_params.dsi_div_b = b;
   602	
   603					goto calc_pll_clk;
   604				}
   605			}
   606		}
   607	
   608	calc_pll_clk:
   609		/*
   610		 * Below conditions must be set for PLL5 parameters:
   611		 * - REFDIV must be between 1 and 2.
   612		 * - POSTDIV1/2 must be between 1 and 7.
   613		 * - INTIN must be between 20 and 320.
   614		 * - FOUTVCO must be between 800MHz and 3000MHz.
   615		 */
   616		for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
   617		     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
   618		     params->pl5_postdiv1++) {
   619			for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
   620			     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
   621			     params->pl5_postdiv2++) {
   622				foutvco_rate = rate * (priv->mux_dsi_div_params.dsi_div_b + 1) * div *
   623					       params->pl5_postdiv1 * params->pl5_postdiv2 <<
   624					       priv->mux_dsi_div_params.dsi_div_a;
   625	
   626				if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
   627				    foutvco_rate > PLL5_FOUTVCO_MAX - 1)
   628					continue;
   629	
   630				for (params->pl5_refdiv = PLL5_REFDIV_MIN;
   631				     params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
   632				     params->pl5_refdiv++) {
   633					params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
   634							    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
   635					if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
 > 636					    params->pl5_intin > PLL5_INTIN_MAX - 1)
   637						continue;
   638					params->pl5_fracin = div_u64(((u64)
   639							     (foutvco_rate * params->pl5_refdiv) %
   640							     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
   641							     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
   642	
   643					params->pl5_fracin = div_u64((u64)
   644							     ((foutvco_rate * params->pl5_refdiv) %
   645							     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
   646							     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
   647	
   648					goto clk_valid;
   649				}
   650			}
   651		}
   652	
   653		/* Set defaults since valid clock was not found */
   654		params->pl5_intin = PLL5_INTIN_DEF;
   655		params->pl5_fracin = PLL5_FRACIN_DEF;
   656		params->pl5_refdiv = PLL5_REFDIV_DEF;
   657		params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
   658		params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
   659	
   660	clk_valid:
   661		params->pl5_spread = 0x16;
   662	
   663		foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
   664						   (params->pl5_intin << 24) + params->pl5_fracin),
   665				       params->pl5_refdiv) >> 24;
   666	
   667		/* If foutvco is above 1.5GHz, change parent and recalculate */
   668		if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
   669			priv->mux_dsi_div_params.clksrc = 0;
   670			dsi_div_ab *= 2;
   671			dsi_div_target = PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
   672			return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
   673		}
   674	
   675		foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
   676						     params->pl5_postdiv1 * params->pl5_postdiv2);
   677	
   678		return foutpostdiv_rate;
   679	}
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
