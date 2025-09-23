Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1AB952AB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7D010E5BA;
	Tue, 23 Sep 2025 09:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip4XHhE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365B610E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758618680; x=1790154680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZQg/n4QuSVqTG+gJrm/yoGwRH75oAVzZYBsWOcot38w=;
 b=ip4XHhE/lzZi47kjz1Qb9rt/T3Y7qPho3YE4aO6z9ktl1nc1419cOffH
 adkeK+MRre2+ow3xqmSDyu6DqksigsyojR+ulj0QvhWrtW064tB8Q3k22
 ceOTDb25psRLj4XkiK5pFHOwmXg/nWsNRwvSnO1NTKB970JMurCK7RDma
 C5UKGqF2kpY4ijQIzT3JuA9lbTQ9Kr6iKLj/jpEwZBnXiMGnoO2rGCzrH
 ADbfpVZZ6OTUSgkw5i5yeAHW3xIgfc73Z+Gjo6FJxMoa3j8BA21q+3Cit
 34bXiIP5B64OKSvbo9HFj434VQKfHgVaglsvvZL3NP6IpJnXcyLYCJqQj g==;
X-CSE-ConnectionGUID: pJ3vgN4TSv6eoE32uhJpXQ==
X-CSE-MsgGUID: GXgT7RjFRNCYaQNKlv3umg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72000098"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="72000098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:11:20 -0700
X-CSE-ConnectionGUID: cfHJXyLcSu+opzhYCNx77g==
X-CSE-MsgGUID: KG5HTZSYRKSGhUcpw06/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176007455"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 23 Sep 2025 02:11:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v0z3J-0002x7-2l;
 Tue, 23 Sep 2025 09:11:13 +0000
Date: Tue, 23 Sep 2025 17:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
Message-ID: <202509231609.HYEkeR1s-lkp@intel.com>
References: <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
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

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-tip/drm-tip next-20250922]
[cannot apply to linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-rcar-du-dsi-Fix-missing-parameter-in-RXSETR_-EN-macros/20250923-025951
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250922185740.153759-4-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250923/202509231609.HYEkeR1s-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231609.HYEkeR1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231609.HYEkeR1s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup':
>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:626:28: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     626 |                 vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_24);
         |                            ^~~~~~~~~~


vim +/FIELD_PREP +626 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c

   503	
   504	static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
   505					 const struct drm_display_mode *mode)
   506	{
   507		struct dsi_setup_info setup_info = {};
   508		unsigned int timeout;
   509		int ret;
   510		int dsi_format;
   511		u32 phy_setup;
   512		u32 clockset2, clockset3;
   513		u32 ppisetr;
   514		u32 vclkset;
   515	
   516		/* Checking valid format */
   517		dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
   518		if (dsi_format < 0) {
   519			dev_warn(dsi->dev, "invalid format");
   520			return -EINVAL;
   521		}
   522	
   523		/* Parameters Calculation */
   524		rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
   525					      mode->clock * 1000, &setup_info);
   526	
   527		/* LPCLK enable */
   528		rcar_mipi_dsi_set(dsi, LPCLKSET, LPCLKSET_CKEN);
   529	
   530		/* CFGCLK enabled */
   531		rcar_mipi_dsi_set(dsi, CFGCLKSET, CFGCLKSET_CKEN);
   532	
   533		rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
   534		rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
   535	
   536		rcar_mipi_dsi_set(dsi, PHTC, PHTC_TESTCLR);
   537		rcar_mipi_dsi_clr(dsi, PHTC, PHTC_TESTCLR);
   538	
   539		/* PHY setting */
   540		phy_setup = rcar_mipi_dsi_read(dsi, PHYSETUP);
   541		phy_setup &= ~PHYSETUP_HSFREQRANGE_MASK;
   542		phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
   543		rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
   544	
   545		switch (dsi->info->model) {
   546		case RCAR_DSI_V3U:
   547		default:
   548			ret = rcar_mipi_dsi_init_phtw_v3u(dsi);
   549			if (ret < 0)
   550				return ret;
   551			break;
   552	
   553		case RCAR_DSI_V4H:
   554			ret = rcar_mipi_dsi_init_phtw_v4h(dsi, &setup_info);
   555			if (ret < 0)
   556				return ret;
   557			break;
   558		}
   559	
   560		/* PLL Clock Setting */
   561		rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
   562		rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
   563		rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
   564	
   565		clockset2 = CLOCKSET2_M(setup_info.m - dsi->info->clockset2_m_offset)
   566			  | CLOCKSET2_N(setup_info.n - 1)
   567			  | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
   568		clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.clkset->prop_cntrl)
   569			  | CLOCKSET3_INT_CNTRL(setup_info.clkset->int_cntrl)
   570			  | CLOCKSET3_CPBIAS_CNTRL(setup_info.clkset->cpbias_cntrl)
   571			  | CLOCKSET3_GMP_CNTRL(setup_info.clkset->gmp_cntrl);
   572		rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
   573		rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
   574	
   575		rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
   576		rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
   577		udelay(10);
   578		rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
   579	
   580		rcar_mipi_dsi_clr(dsi, TXSETR, TXSETR_LANECNT_MASK);
   581		rcar_mipi_dsi_set(dsi, TXSETR, dsi->lanes - 1);
   582	
   583		ppisetr = ((BIT(dsi->lanes) - 1) & PPISETR_DLEN_MASK) | PPISETR_CLEN;
   584		rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
   585	
   586		rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
   587		rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_RSTZ);
   588		usleep_range(400, 500);
   589	
   590		/* Checking PPI clock status register */
   591		for (timeout = 10; timeout > 0; --timeout) {
   592			if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
   593			    (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
   594			    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK_PHY))
   595				break;
   596	
   597			usleep_range(1000, 2000);
   598		}
   599	
   600		if (!timeout) {
   601			dev_err(dsi->dev, "failed to enable PPI clock\n");
   602			return -ETIMEDOUT;
   603		}
   604	
   605		switch (dsi->info->model) {
   606		case RCAR_DSI_V3U:
   607		default:
   608			ret = rcar_mipi_dsi_post_init_phtw_v3u(dsi);
   609			if (ret < 0)
   610				return ret;
   611			break;
   612	
   613		case RCAR_DSI_V4H:
   614			ret = rcar_mipi_dsi_post_init_phtw_v4h(dsi, &setup_info);
   615			if (ret < 0)
   616				return ret;
   617			break;
   618		}
   619	
   620		/* Enable DOT clock */
   621		vclkset = VCLKSET_CKEN;
   622		rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
   623	
   624		/* Output is always RGB, never YCbCr */
   625		if (dsi_format == 24)
 > 626			vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_24);
   627		else if (dsi_format == 18)
   628			vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_18);
   629		else if (dsi_format == 16)
   630			vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_16);
   631		else {
   632			dev_warn(dsi->dev, "unsupported format");
   633			return -EINVAL;
   634		}
   635	
   636		vclkset |= VCLKSET_LANE(dsi->lanes - 1);
   637	
   638		switch (dsi->info->model) {
   639		case RCAR_DSI_V3U:
   640		default:
   641			vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
   642			break;
   643	
   644		case RCAR_DSI_V4H:
   645			vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
   646			break;
   647		}
   648	
   649		rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
   650	
   651		/* After setting VCLKSET register, enable VCLKEN */
   652		rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
   653	
   654		dev_dbg(dsi->dev, "DSI device is started\n");
   655	
   656		return 0;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
