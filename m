Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B6A3684E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 23:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35A10E097;
	Fri, 14 Feb 2025 22:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igq5h3lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77510E097
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 22:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739572349; x=1771108349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nk7bnEGZRwy+ff89/jX3lLPn8RDrWyr/DAhAweHKzRM=;
 b=igq5h3lvQ9HJQKTjohymNFX3gtpmasxjICq2X3ZZXnrmRTqUCKJCBku7
 brWNoMQYpoc40FMBuWmlpiiXqqX3SGbiz3NMuDIBUwHHKKNXw6c/P0r+M
 8Vjy12QJjeraO/hRmWF7IT1bTlkAzHy/JLZ7AMLRFHwZ9ZCLUm0iL9dIV
 9zD4Ijj/ruL0iIKaFPbQUHEPK0NoYoUYjO4O9waej4UNrzqe9dCeRx3K3
 hkA2nVRPmmG/tcrvyq5AU+QopMeUrqwQ0U9b+28JmwW4QxKznKNGp9z9O
 4sK+Pv762kCPN5B/YP5zXNw36cfLZmxe5WgJB3dsd9STwIq1MidmUAzMw Q==;
X-CSE-ConnectionGUID: ZJ35kZkvTFOROEqTjEb3Eg==
X-CSE-MsgGUID: KYuxsY8NQVWZ1zTGhC7yvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39520371"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="39520371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:32:29 -0800
X-CSE-ConnectionGUID: Kl3HGhmZSrKQXer/YnofoA==
X-CSE-MsgGUID: dNftY3G2T026zXlJjOpmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118599209"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 14 Feb 2025 14:32:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tj4EQ-001AEp-0I;
 Fri, 14 Feb 2025 22:32:22 +0000
Date: Sat, 15 Feb 2025 06:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, bliang@analogixsemi.com,
 qwen@analogixsemi.com, treapking@google.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge:anx7625: Enable DSC feature
Message-ID: <202502150643.fDWGayDK-lkp@intel.com>
References: <20250213123331.3016824-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213123331.3016824-1-xji@analogixsemi.com>
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

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on drm-misc/drm-misc-next v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Ji/drm-bridge-anx7625-Enable-DSC-feature/20250213-203558
base:   linus/master
patch link:    https://lore.kernel.org/r/20250213123331.3016824-1-xji%40analogixsemi.com
patch subject: [PATCH] drm/bridge:anx7625: Enable DSC feature
config: i386-buildonly-randconfig-004-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150643.fDWGayDK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150643.fDWGayDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150643.fDWGayDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_bridge_mode_fixup':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2562: undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/bridge/analogix/anx7625.c:2472: undefined reference to `__udivdi3'


vim +2562 drivers/gpu/drm/bridge/analogix/anx7625.c

  2440	
  2441	static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
  2442					      const struct drm_display_mode *mode,
  2443					      struct drm_display_mode *adj)
  2444	{
  2445		struct anx7625_data *ctx = bridge_to_anx7625(bridge);
  2446		struct device *dev = ctx->dev;
  2447		u32 hsync, hfp, hbp, hblanking;
  2448		u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
  2449		u32 vref, adj_clock;
  2450	
  2451		DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
  2452	
  2453		hsync = mode->hsync_end - mode->hsync_start;
  2454		hfp = mode->hsync_start - mode->hdisplay;
  2455		hbp = mode->htotal - mode->hsync_end;
  2456		hblanking = mode->htotal - mode->hdisplay;
  2457	
  2458		dev_dbg(dev, "before mode fixup\n");
  2459		dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
  2460			hsync, hfp, hbp, adj->clock);
  2461		dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d)\n",
  2462			adj->hsync_start, adj->hsync_end, adj->htotal);
  2463		adj_hfp = hfp;
  2464		adj_hsync = hsync;
  2465		adj_hbp = hbp;
  2466		adj_hblanking = hblanking;
  2467	
  2468		if (mode->clock > DSC_PIXEL_CLOCK) {
  2469			adj_hsync = DSC_HSYNC_LEN;
  2470			adj_hfp = DSC_HFP_LEN;
  2471			adj_hbp = DSC_HBP_LEN;
> 2472			vref = (u64)adj->clock * 1000 * 1000 / (adj->htotal * adj->vtotal);
  2473			goto calculate_timing;
  2474		}
  2475	
  2476		/* No need fixup for external monitor */
  2477		if (!ctx->pdata.panel_bridge)
  2478			return true;
  2479	
  2480		/* HFP needs to be even */
  2481		if (hfp & 0x1) {
  2482			adj_hfp += 1;
  2483			adj_hblanking += 1;
  2484		}
  2485	
  2486		/* HBP needs to be even */
  2487		if (hbp & 0x1) {
  2488			adj_hbp -= 1;
  2489			adj_hblanking -= 1;
  2490		}
  2491	
  2492		/* HSYNC needs to be even */
  2493		if (hsync & 0x1) {
  2494			if (adj_hblanking < hblanking)
  2495				adj_hsync += 1;
  2496			else
  2497				adj_hsync -= 1;
  2498		}
  2499	
  2500		/*
  2501		 * Once illegal timing detected, use default HFP, HSYNC, HBP
  2502		 * This adjusting made for built-in eDP panel, for the externel
  2503		 * DP monitor, may need return false.
  2504		 */
  2505		if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {
  2506			adj_hsync = SYNC_LEN_DEF;
  2507			adj_hfp = HFP_HBP_DEF;
  2508			adj_hbp = HFP_HBP_DEF;
  2509			vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
  2510			if (hblanking < HBLANKING_MIN) {
  2511				delta_adj = HBLANKING_MIN - hblanking;
  2512				adj_clock = vref * delta_adj * adj->vtotal;
  2513				adj->clock += DIV_ROUND_UP(adj_clock, 1000);
  2514			} else {
  2515				delta_adj = hblanking - HBLANKING_MIN;
  2516				adj_clock = vref * delta_adj * adj->vtotal;
  2517				adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
  2518			}
  2519	
  2520			DRM_WARN("illegal hblanking timing, use default.\n");
  2521			DRM_WARN("hfp(%d), hbp(%d), hsync(%d).\n", hfp, hbp, hsync);
  2522		} else if (adj_hfp < HP_MIN) {
  2523			/* Adjust hfp if hfp less than HP_MIN */
  2524			delta_adj = HP_MIN - adj_hfp;
  2525			adj_hfp = HP_MIN;
  2526	
  2527			/*
  2528			 * Balance total HBlanking pixel, if HBP does not have enough
  2529			 * space, adjust HSYNC length, otherwise adjust HBP
  2530			 */
  2531			if ((adj_hbp - delta_adj) < HP_MIN)
  2532				/* HBP not enough space */
  2533				adj_hsync -= delta_adj;
  2534			else
  2535				adj_hbp -= delta_adj;
  2536		} else if (adj_hbp < HP_MIN) {
  2537			delta_adj = HP_MIN - adj_hbp;
  2538			adj_hbp = HP_MIN;
  2539	
  2540			/*
  2541			 * Balance total HBlanking pixel, if HBP hasn't enough space,
  2542			 * adjust HSYNC length, otherwize adjust HBP
  2543			 */
  2544			if ((adj_hfp - delta_adj) < HP_MIN)
  2545				/* HFP not enough space */
  2546				adj_hsync -= delta_adj;
  2547			else
  2548				adj_hfp -= delta_adj;
  2549		}
  2550	
  2551	calculate_timing:
  2552	
  2553		dev_dbg(dev, "after mode fixup\n");
  2554		dev_dbg(dev, "hsync(%d), hfp(%d), hbp(%d), clock(%d)\n",
  2555			adj_hsync, adj_hfp, adj_hbp, adj->clock);
  2556	
  2557		/* Reconstruct timing */
  2558		adj->hsync_start = adj->hdisplay + adj_hfp;
  2559		adj->hsync_end = adj->hsync_start + adj_hsync;
  2560		adj->htotal = adj->hsync_end + adj_hbp;
  2561		if (mode->clock > DSC_PIXEL_CLOCK)
> 2562			adj->clock = (u64)vref * adj->htotal * adj->vtotal / 1000 / 1000;
  2563	
  2564		dev_dbg(dev, "hsync_start(%d), hsync_end(%d), htot(%d), clock(%d)\n",
  2565			adj->hsync_start, adj->hsync_end, adj->htotal, adj->clock);
  2566	
  2567		return true;
  2568	}
  2569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
