Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IBPAzL5k2m0+AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 06:14:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D964148C54
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 06:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D89210E1BF;
	Tue, 17 Feb 2026 05:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKAoAsU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984C410E1BF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771305260; x=1802841260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4AsbFdAWsCtcCPmpmwch4smnpgukaOnM/aovJKQ2Y5c=;
 b=DKAoAsU5R1+ObDCvlA9hQfDb+CR6n1AqutRSAAK2hngRp+yueWVzZwC4
 FdJlzIBTtP6TF8XJIfIxfn9Pk6CVrCUZVH0u8JW5Ej6rjRgXw7BTY8YGO
 ZIaZ0+D/W+RBBhLiT0BrekBAc6kER2MPMn1TL3CTnq/n9fdoI9FEFYMLK
 SzNqCYKuQJ84PX2ePMtjAh4S+isgh0G4LYSCqIdQUsGy7qREq5VeBSsFn
 jmCDSNB48wT63SDgfLixyvCLjMZYR6kXoXCfzby/gy3MUzDT7i5yQ/pK5
 +FGL1x86eOdlsEPN0Xy5HK8tyw7zps+Qts3TavhTXJRetQOWHtuEFcJVm w==;
X-CSE-ConnectionGUID: TZ4YSeeoTWq+iKzu2aN21A==
X-CSE-MsgGUID: 1m8GM1IVS/iyftiX4YFY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89785723"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="89785723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 21:14:19 -0800
X-CSE-ConnectionGUID: UvN4Fvm1TmanATuYUzlP+w==
X-CSE-MsgGUID: PmEu3jx7Rnivyu7Uk2ockw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="213061276"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 21:14:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vsDPY-000000010dA-086V;
 Tue, 17 Feb 2026 05:14:12 +0000
Date: Tue, 17 Feb 2026 13:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Oliver F. Brown" <oliver.brown@oss.nxp.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync
 timing
Message-ID: <202602171326.PoWR3Iye-lkp@intel.com>
References: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[puri.sm,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,sigxcpu.org,nxp.com];
	FORGED_RECIPIENTS(0.00)[m:sebastian.krzyszkowiak@puri.sm,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:agx@sigxcpu.org,m:robert.chiras@nxp.com,m:festevam@gmail.com,m:oe-kbuild-all@lists.linux.dev,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:oliver.brown@oss.nxp.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 2D964148C54
X-Rspamd-Action: no action

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Krzyszkowiak/drm-bridge-nwl-dsi-Correct-MIPI-DSI-horizontal-sync-timing/20260217-015316
base:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
patch link:    https://lore.kernel.org/r/20260216-nwl-sync-timing-v1-1-b0ff6ecf204a%40puri.sm
patch subject: [PATCH] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
config: i386-randconfig-006-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171326.PoWR3Iye-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171326.PoWR3Iye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171326.PoWR3Iye-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/nwl-dsi.o: in function `nwl_dsi_config_dpi':
>> drivers/gpu/drm/bridge/nwl-dsi.c:338:(.text+0x1dcb): undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/bridge/nwl-dsi.c:339:(.text+0x1e2e): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/bridge/nwl-dsi.c:340:(.text+0x1e8f): undefined reference to `__udivdi3'


vim +338 drivers/gpu/drm/bridge/nwl-dsi.c

   255	
   256	static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
   257	{
   258		u32 mode;
   259		int color_format;
   260		bool burst_mode;
   261		int hfront_porch, hback_porch, vfront_porch, vback_porch;
   262		int hsync_len, vsync_len;
   263		int hfp, hbp, hsa;
   264		unsigned long long pclk_period;
   265		unsigned long long hs_period;
   266		int h_blank, pkt_hdr_len, pkt_len;
   267	
   268		hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
   269		hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
   270		hback_porch = dsi->mode.htotal - dsi->mode.hsync_end;
   271	
   272		vfront_porch = dsi->mode.vsync_start - dsi->mode.vdisplay;
   273		vsync_len = dsi->mode.vsync_end - dsi->mode.vsync_start;
   274		vback_porch = dsi->mode.vtotal - dsi->mode.vsync_end;
   275	
   276		DRM_DEV_DEBUG_DRIVER(dsi->dev, "hfront_porch = %d\n", hfront_porch);
   277		DRM_DEV_DEBUG_DRIVER(dsi->dev, "hback_porch = %d\n", hback_porch);
   278		DRM_DEV_DEBUG_DRIVER(dsi->dev, "hsync_len = %d\n", hsync_len);
   279		DRM_DEV_DEBUG_DRIVER(dsi->dev, "hdisplay = %d\n", dsi->mode.hdisplay);
   280		DRM_DEV_DEBUG_DRIVER(dsi->dev, "vfront_porch = %d\n", vfront_porch);
   281		DRM_DEV_DEBUG_DRIVER(dsi->dev, "vback_porch = %d\n", vback_porch);
   282		DRM_DEV_DEBUG_DRIVER(dsi->dev, "vsync_len = %d\n", vsync_len);
   283		DRM_DEV_DEBUG_DRIVER(dsi->dev, "vactive = %d\n", dsi->mode.vdisplay);
   284		DRM_DEV_DEBUG_DRIVER(dsi->dev, "clock = %d kHz\n", dsi->mode.clock);
   285	
   286		color_format = nwl_dsi_get_dpi_pixel_format(dsi->format);
   287		if (color_format < 0) {
   288			DRM_DEV_ERROR(dsi->dev, "Invalid color format 0x%x\n",
   289				      dsi->format);
   290			return color_format;
   291		}
   292		DRM_DEV_DEBUG_DRIVER(dsi->dev, "pixel fmt = %d\n", dsi->format);
   293	
   294		nwl_dsi_write(dsi, NWL_DSI_INTERFACE_COLOR_CODING, NWL_DSI_DPI_24_BIT);
   295		nwl_dsi_write(dsi, NWL_DSI_PIXEL_FORMAT, color_format);
   296		nwl_dsi_write(dsi, NWL_DSI_VSYNC_POLARITY,
   297			      dsi->mode.flags & DRM_MODE_FLAG_PVSYNC ?
   298			      NWL_DSI_VSYNC_POLARITY_ACTIVE_HIGH :
   299			      NWL_DSI_VSYNC_POLARITY_ACTIVE_LOW);
   300		nwl_dsi_write(dsi, NWL_DSI_HSYNC_POLARITY,
   301			      dsi->mode.flags & DRM_MODE_FLAG_PHSYNC ?
   302			      NWL_DSI_HSYNC_POLARITY_ACTIVE_HIGH :
   303			      NWL_DSI_HSYNC_POLARITY_ACTIVE_LOW);
   304	
   305		burst_mode = (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_BURST) &&
   306			     !(dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE);
   307	
   308		if (burst_mode) {
   309			nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, NWL_DSI_VM_BURST_MODE);
   310			nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL, 256);
   311		} else {
   312			mode = ((dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) ?
   313					NWL_DSI_VM_BURST_MODE_WITH_SYNC_PULSES :
   314					NWL_DSI_VM_NON_BURST_MODE_WITH_SYNC_EVENTS);
   315			nwl_dsi_write(dsi, NWL_DSI_VIDEO_MODE, mode);
   316			nwl_dsi_write(dsi, NWL_DSI_PIXEL_FIFO_SEND_LEVEL,
   317				      dsi->mode.hdisplay);
   318		}
   319	
   320		pclk_period = ALIGN(PSEC_PER_SEC, dsi->mode.clock * 1000);
   321		do_div(pclk_period, dsi->mode.clock * 1000);
   322		DRM_DEV_DEBUG_DRIVER(dsi->dev, "pclk_period: %llu\n", pclk_period);
   323	
   324		hs_period = ALIGN(PSEC_PER_SEC, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
   325		do_div(hs_period, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
   326		DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_period: %llu\n", hs_period);
   327	
   328		/*
   329		 * Calculate the bytes needed, according to the RM formula:
   330		 * Time of DPI event = time to transmit x number of bytes on the DSI
   331		 * interface
   332		 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period /
   333		 * num_lanes
   334		 * ===>
   335		 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes /
   336		 * (8 * hs_bit_period)
   337		 */
 > 338		hfp = hfront_porch * pclk_period * dsi->lanes / (8 * hs_period);
 > 339		hbp = hback_porch * pclk_period * dsi->lanes / (8 * hs_period);
   340		hsa = hsync_len * pclk_period * dsi->lanes / (8 * hs_period);
   341	
   342		/* Make sure horizontal blankins are even numbers */
   343		hfp = roundup(hfp, 2);
   344		hbp = roundup(hbp, 2);
   345		hsa = roundup(hsa, 2);
   346	
   347		/*
   348		 * We need to subtract the packet header length: 32
   349		 * In order to make sure we don't get negative values,
   350		 * subtract a proportional value to the total length of the
   351		 * horizontal blanking duration.
   352		 */
   353		h_blank = hfp + hbp + hsa;
   354	
   355		pkt_len = roundup(((hfp * 100 / h_blank) * 32) / 100, 2);
   356		pkt_hdr_len = pkt_len;
   357		hfp -= pkt_len;
   358	
   359		pkt_len = roundup(((hbp * 100 / h_blank) * 32) / 100, 2);
   360		pkt_hdr_len += pkt_len;
   361		hbp -= pkt_len;
   362	
   363		hsa -= (32 - pkt_hdr_len);
   364	
   365		if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
   366			hfp = hfront_porch;
   367		if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
   368			hbp = hback_porch;
   369		if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
   370			hsa = hsync_len;
   371	
   372		DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hfp: %d\n", hfp);
   373		DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hbp: %d\n", hbp);
   374		DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hsa: %d\n", hsa);
   375	
   376		nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
   377		nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
   378		nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
   379	
   380		nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
   381		nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);
   382		nwl_dsi_write(dsi, NWL_DSI_USE_NULL_PKT_BLLP, 0x0);
   383		nwl_dsi_write(dsi, NWL_DSI_VC, 0x0);
   384	
   385		nwl_dsi_write(dsi, NWL_DSI_PIXEL_PAYLOAD_SIZE, dsi->mode.hdisplay);
   386		nwl_dsi_write(dsi, NWL_DSI_VACTIVE, dsi->mode.vdisplay - 1);
   387		nwl_dsi_write(dsi, NWL_DSI_VBP, vback_porch);
   388		nwl_dsi_write(dsi, NWL_DSI_VFP, vfront_porch);
   389	
   390		return nwl_dsi_clear_error(dsi);
   391	}
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
