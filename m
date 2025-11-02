Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C45C29320
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 18:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2BC10E11E;
	Sun,  2 Nov 2025 17:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGu/5isI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D598610E11E
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762103120; x=1793639120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QNBa3Nxs4amYOkNF63vxcYItGKzAfFD2qH5ijbBlKxg=;
 b=eGu/5isIX+rs3cGSJV72Wo9rsdhDl2OW1iNwcslnx8xkVCZVfQLolg6x
 S8vaNeFeRZY6edGZ6u2JuK8hi8CFo66hSA3F/uAPoa2TTWGIImFUCiYPv
 fvpv1blJ7PYUNYF5DicwS+3ZjBJD8eJxKGhhwf/8eafPJLbuHGAsNsVt4
 p96mhDTke96xTlHh/MQloQ20l9ou2NYnvSH5QYiXzeo1HP/RghPfqYJ+o
 Y2OZBR8i2craGoNVGXjVieaDuoE4dxdy3A7WHPX0RUiJG14RnzfvpbsJc
 LKfShDGMuYMfoL8u9oRb+h4fnIsS4PSA6iULbQJzprGb5q2Wjf+fLWFys Q==;
X-CSE-ConnectionGUID: sXQIlD0lTAO6zacm00nG2Q==
X-CSE-MsgGUID: AAm6hZ+6ToOS9xoD/wDSbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="86817475"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="86817475"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 09:05:19 -0800
X-CSE-ConnectionGUID: wvh7ORnySqujkXE1EoAYqg==
X-CSE-MsgGUID: 0IrIttudS9+ELI6ZydVArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="186826615"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 02 Nov 2025 09:05:17 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vFbUq-000PRM-0f;
 Sun, 02 Nov 2025 17:04:24 +0000
Date: Mon, 3 Nov 2025 01:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Message-ID: <202511030007.5ksWfboC-lkp@intel.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
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

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/drm-tegra-Enable-cmu-for-Tegra186-and-Tegra194/20251102-071726
base:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
patch link:    https://lore.kernel.org/r/20251101-tegra-drm-cmu-v1-1-211799755ab8%40gmail.com
patch subject: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
config: arm-randconfig-002-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030007.5ksWfboC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030007.5ksWfboC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030007.5ksWfboC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tegra/sor.c: In function 'tegra_sor_hdmi_enable':
>> drivers/gpu/drm/tegra/sor.c:2757:50: warning: right shift count >= width of type [-Wshift-count-overflow]
    2757 |   tegra_dc_writel(dc, (u32)(sor->cmu_output_phys >> 32),
         |                                                  ^~


vim +2757 drivers/gpu/drm/tegra/sor.c

  2590	
  2591		/* switch the SOR clock to the pad clock */
  2592		err = tegra_sor_set_parent_clock(sor, sor->clk_pad);
  2593		if (err < 0) {
  2594			dev_err(sor->dev, "failed to select SOR parent clock: %d\n",
  2595				err);
  2596			return;
  2597		}
  2598	
  2599		/* switch the output clock to the parent pixel clock */
  2600		err = clk_set_parent(sor->clk, sor->clk_parent);
  2601		if (err < 0) {
  2602			dev_err(sor->dev, "failed to select output parent clock: %d\n",
  2603				err);
  2604			return;
  2605		}
  2606	
  2607		/* adjust clock rate for HDMI 2.0 modes */
  2608		rate = clk_get_rate(sor->clk_parent);
  2609	
  2610		if (mode->clock >= 340000)
  2611			rate /= 2;
  2612	
  2613		DRM_DEBUG_KMS("setting clock to %lu Hz, mode: %lu Hz\n", rate, pclk);
  2614	
  2615		clk_set_rate(sor->clk, rate);
  2616	
  2617		if (!sor->soc->has_nvdisplay) {
  2618			value = SOR_INPUT_CONTROL_HDMI_SRC_SELECT(dc->pipe);
  2619	
  2620			/* XXX is this the proper check? */
  2621			if (mode->clock < 75000)
  2622				value |= SOR_INPUT_CONTROL_ARM_VIDEO_RANGE_LIMITED;
  2623	
  2624			tegra_sor_writel(sor, value, SOR_INPUT_CONTROL);
  2625		}
  2626	
  2627		max_ac = ((mode->htotal - mode->hdisplay) - SOR_REKEY - 18) / 32;
  2628	
  2629		value = SOR_HDMI_CTRL_ENABLE | SOR_HDMI_CTRL_MAX_AC_PACKET(max_ac) |
  2630			SOR_HDMI_CTRL_AUDIO_LAYOUT | SOR_HDMI_CTRL_REKEY(SOR_REKEY);
  2631		tegra_sor_writel(sor, value, SOR_HDMI_CTRL);
  2632	
  2633		if (!dc->soc->has_nvdisplay) {
  2634			/* H_PULSE2 setup */
  2635			pulse_start = h_ref_to_sync +
  2636				      (mode->hsync_end - mode->hsync_start) +
  2637				      (mode->htotal - mode->hsync_end) - 10;
  2638	
  2639			value = PULSE_LAST_END_A | PULSE_QUAL_VACTIVE |
  2640				PULSE_POLARITY_HIGH | PULSE_MODE_NORMAL;
  2641			tegra_dc_writel(dc, value, DC_DISP_H_PULSE2_CONTROL);
  2642	
  2643			value = PULSE_END(pulse_start + 8) | PULSE_START(pulse_start);
  2644			tegra_dc_writel(dc, value, DC_DISP_H_PULSE2_POSITION_A);
  2645	
  2646			value = tegra_dc_readl(dc, DC_DISP_DISP_SIGNAL_OPTIONS0);
  2647			value |= H_PULSE2_ENABLE;
  2648			tegra_dc_writel(dc, value, DC_DISP_DISP_SIGNAL_OPTIONS0);
  2649		}
  2650	
  2651		/* infoframe setup */
  2652		err = tegra_sor_hdmi_setup_avi_infoframe(sor, mode);
  2653		if (err < 0)
  2654			dev_err(sor->dev, "failed to setup AVI infoframe: %d\n", err);
  2655	
  2656		/* XXX HDMI audio support not implemented yet */
  2657		tegra_sor_hdmi_disable_audio_infoframe(sor);
  2658	
  2659		/* use single TMDS protocol */
  2660		value = tegra_sor_readl(sor, SOR_STATE1);
  2661		value &= ~SOR_STATE_ASY_PROTOCOL_MASK;
  2662		value |= SOR_STATE_ASY_PROTOCOL_SINGLE_TMDS_A;
  2663		tegra_sor_writel(sor, value, SOR_STATE1);
  2664	
  2665		/* power up pad calibration */
  2666		value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
  2667		value &= ~SOR_DP_PADCTL_PAD_CAL_PD;
  2668		tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
  2669	
  2670		/* production settings */
  2671		settings = tegra_sor_hdmi_find_settings(sor, mode->clock * 1000);
  2672		if (!settings) {
  2673			dev_err(sor->dev, "no settings for pixel clock %d Hz\n",
  2674				mode->clock * 1000);
  2675			return;
  2676		}
  2677	
  2678		value = tegra_sor_readl(sor, sor->soc->regs->pll0);
  2679		value &= ~SOR_PLL0_ICHPMP_MASK;
  2680		value &= ~SOR_PLL0_FILTER_MASK;
  2681		value &= ~SOR_PLL0_VCOCAP_MASK;
  2682		value |= SOR_PLL0_ICHPMP(settings->ichpmp);
  2683		value |= SOR_PLL0_FILTER(settings->filter);
  2684		value |= SOR_PLL0_VCOCAP(settings->vcocap);
  2685		tegra_sor_writel(sor, value, sor->soc->regs->pll0);
  2686	
  2687		/* XXX not in TRM */
  2688		value = tegra_sor_readl(sor, sor->soc->regs->pll1);
  2689		value &= ~SOR_PLL1_LOADADJ_MASK;
  2690		value &= ~SOR_PLL1_TMDS_TERMADJ_MASK;
  2691		value |= SOR_PLL1_LOADADJ(settings->loadadj);
  2692		value |= SOR_PLL1_TMDS_TERMADJ(settings->tmds_termadj);
  2693		value |= SOR_PLL1_TMDS_TERM;
  2694		tegra_sor_writel(sor, value, sor->soc->regs->pll1);
  2695	
  2696		value = tegra_sor_readl(sor, sor->soc->regs->pll3);
  2697		value &= ~SOR_PLL3_BG_TEMP_COEF_MASK;
  2698		value &= ~SOR_PLL3_BG_VREF_LEVEL_MASK;
  2699		value &= ~SOR_PLL3_AVDD10_LEVEL_MASK;
  2700		value &= ~SOR_PLL3_AVDD14_LEVEL_MASK;
  2701		value |= SOR_PLL3_BG_TEMP_COEF(settings->bg_temp_coef);
  2702		value |= SOR_PLL3_BG_VREF_LEVEL(settings->bg_vref_level);
  2703		value |= SOR_PLL3_AVDD10_LEVEL(settings->avdd10_level);
  2704		value |= SOR_PLL3_AVDD14_LEVEL(settings->avdd14_level);
  2705		tegra_sor_writel(sor, value, sor->soc->regs->pll3);
  2706	
  2707		value = settings->drive_current[3] << 24 |
  2708			settings->drive_current[2] << 16 |
  2709			settings->drive_current[1] <<  8 |
  2710			settings->drive_current[0] <<  0;
  2711		tegra_sor_writel(sor, value, SOR_LANE_DRIVE_CURRENT0);
  2712	
  2713		value = settings->preemphasis[3] << 24 |
  2714			settings->preemphasis[2] << 16 |
  2715			settings->preemphasis[1] <<  8 |
  2716			settings->preemphasis[0] <<  0;
  2717		tegra_sor_writel(sor, value, SOR_LANE_PREEMPHASIS0);
  2718	
  2719		value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
  2720		value &= ~SOR_DP_PADCTL_TX_PU_MASK;
  2721		value |= SOR_DP_PADCTL_TX_PU_ENABLE;
  2722		value |= SOR_DP_PADCTL_TX_PU(settings->tx_pu_value);
  2723		tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
  2724	
  2725		value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl2);
  2726		value &= ~SOR_DP_PADCTL_SPAREPLL_MASK;
  2727		value |= SOR_DP_PADCTL_SPAREPLL(settings->sparepll);
  2728		tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl2);
  2729	
  2730		/* power down pad calibration */
  2731		value = tegra_sor_readl(sor, sor->soc->regs->dp_padctl0);
  2732		value |= SOR_DP_PADCTL_PAD_CAL_PD;
  2733		tegra_sor_writel(sor, value, sor->soc->regs->dp_padctl0);
  2734	
  2735		if (!dc->soc->has_nvdisplay) {
  2736			/* miscellaneous display controller settings */
  2737			value = VSYNC_H_POSITION(1);
  2738			tegra_dc_writel(dc, value, DC_DISP_DISP_TIMING_OPTIONS);
  2739		}
  2740	
  2741		value = tegra_dc_readl(dc, DC_DISP_DISP_COLOR_CONTROL);
  2742		value &= ~DITHER_CONTROL_MASK;
  2743		value &= ~BASE_COLOR_SIZE_MASK;
  2744	
  2745		if (dc->soc->has_nvdisplay) {
  2746			sor->cmu_output_lut =
  2747				dma_alloc_coherent(dc->dev, ARRAY_SIZE(default_srgb_lut) * sizeof(u64),
  2748						   &sor->cmu_output_phys, GFP_KERNEL);
  2749	
  2750			for (i = 0; i < ARRAY_SIZE(default_srgb_lut); i++) {
  2751				r = default_srgb_lut[i];
  2752				sor->cmu_output_lut[i] = (r << 32) | (r << 16) | r;
  2753			}
  2754	
  2755			tegra_dc_writel(dc, (u32)(sor->cmu_output_phys & 0xffffffff),
  2756					DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE);
> 2757			tegra_dc_writel(dc, (u32)(sor->cmu_output_phys >> 32),
  2758					DC_DISP_COREPVT_HEAD_SET_OUTPUT_LUT_BASE_HI);
  2759	
  2760			tegra_dc_writel(dc, OUTPUT_LUT_MODE_INTERPOLATE | OUTPUT_LUT_SIZE_SIZE_1025,
  2761					DC_DISP_CORE_HEAD_SET_CONTROL_OUTPUT_LUT);
  2762	
  2763			value |= CMU_ENABLE_ENABLE;
  2764		}
  2765	
  2766		switch (state->bpc) {
  2767		case 6:
  2768			value |= BASE_COLOR_SIZE_666;
  2769			break;
  2770	
  2771		case 8:
  2772			value |= BASE_COLOR_SIZE_888;
  2773			break;
  2774	
  2775		case 10:
  2776			value |= BASE_COLOR_SIZE_101010;
  2777			break;
  2778	
  2779		case 12:
  2780			value |= BASE_COLOR_SIZE_121212;
  2781			break;
  2782	
  2783		default:
  2784			WARN(1, "%u bits-per-color not supported\n", state->bpc);
  2785			value |= BASE_COLOR_SIZE_888;
  2786			break;
  2787		}
  2788	
  2789		tegra_dc_writel(dc, value, DC_DISP_DISP_COLOR_CONTROL);
  2790	
  2791		/* XXX set display head owner */
  2792		value = tegra_sor_readl(sor, SOR_STATE1);
  2793		value &= ~SOR_STATE_ASY_OWNER_MASK;
  2794		value |= SOR_STATE_ASY_OWNER(1 + dc->pipe);
  2795		tegra_sor_writel(sor, value, SOR_STATE1);
  2796	
  2797		err = tegra_sor_power_up(sor, 250);
  2798		if (err < 0)
  2799			dev_err(sor->dev, "failed to power up SOR: %d\n", err);
  2800	
  2801		/* configure dynamic range of output */
  2802		value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
  2803		value &= ~SOR_HEAD_STATE_RANGECOMPRESS_MASK;
  2804		value &= ~SOR_HEAD_STATE_DYNRANGE_MASK;
  2805		tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
  2806	
  2807		/* configure colorspace */
  2808		value = tegra_sor_readl(sor, sor->soc->regs->head_state0 + dc->pipe);
  2809		value &= ~SOR_HEAD_STATE_COLORSPACE_MASK;
  2810		value |= SOR_HEAD_STATE_COLORSPACE_RGB;
  2811		tegra_sor_writel(sor, value, sor->soc->regs->head_state0 + dc->pipe);
  2812	
  2813		tegra_sor_mode_set(sor, mode, state);
  2814	
  2815		tegra_sor_update(sor);
  2816	
  2817		/* program preamble timing in SOR (XXX) */
  2818		value = tegra_sor_readl(sor, SOR_DP_SPARE0);
  2819		value &= ~SOR_DP_SPARE_DISP_VIDEO_PREAMBLE;
  2820		tegra_sor_writel(sor, value, SOR_DP_SPARE0);
  2821	
  2822		err = tegra_sor_attach(sor);
  2823		if (err < 0)
  2824			dev_err(sor->dev, "failed to attach SOR: %d\n", err);
  2825	
  2826		/* enable display to SOR clock and generate HDMI preamble */
  2827		value = tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
  2828	
  2829		if (!sor->soc->has_nvdisplay)
  2830			value |= SOR1_TIMING_CYA;
  2831	
  2832		value |= SOR_ENABLE(sor->index);
  2833	
  2834		tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
  2835	
  2836		if (dc->soc->has_nvdisplay) {
  2837			value = tegra_dc_readl(dc, DC_DISP_CORE_SOR_SET_CONTROL(sor->index));
  2838			value &= ~PROTOCOL_MASK;
  2839			value |= PROTOCOL_SINGLE_TMDS_A;
  2840			tegra_dc_writel(dc, value, DC_DISP_CORE_SOR_SET_CONTROL(sor->index));
  2841		}
  2842	
  2843		tegra_dc_commit(dc);
  2844	
  2845		err = tegra_sor_wakeup(sor);
  2846		if (err < 0)
  2847			dev_err(sor->dev, "failed to wakeup SOR: %d\n", err);
  2848	
  2849		tegra_sor_hdmi_scdc_start(sor);
  2850		tegra_sor_audio_prepare(sor);
  2851	}
  2852	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
