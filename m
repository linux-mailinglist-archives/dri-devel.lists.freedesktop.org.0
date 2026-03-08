Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q5oAJryJrWna4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:37:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0762230B8D
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EF910E027;
	Sun,  8 Mar 2026 14:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUT20viC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8444210E027
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772980664; x=1804516664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=texYecOx1G6VAtPnt/oo5M8yOZE/OMC31g9BmuVmDjo=;
 b=hUT20viCv0sgYJP5n7/K8jlrYPdE6v1wLBnitActmEATZ1U+X5X+9282
 9y0zHCYj6Om0yCHnoU/hpfNn7ZVyQZS7KIFDypRqrsJuF4wa/e6AdQFz3
 q6vw72fyLA4r0H1XNZk15I94gVr9xWuEx0qkYAcEaCATy2VNkIUAa4pfO
 ctJlL8X2Laz4ueF2HBASqxz0oF9DPs15hGszI7wnAysMSNkPv4VrCh/9e
 vyKSzM4Q1tpm1SAmZnYmf1THgmrQ7JuBZMFCVVdu0HhYKsDM1THjiQffw
 OW9ovTz0z0zTmeq04Tn7gHA9MC3+su8ITYUxoXTuO8bt3PLaG3zQjm/OQ A==;
X-CSE-ConnectionGUID: mp77roeQRFSPJnvZxK5Wxg==
X-CSE-MsgGUID: jPh3GY0DToyA3kZKCgsPng==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77874578"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77874578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 07:37:42 -0700
X-CSE-ConnectionGUID: WQ/8v7cSQzGZqRBE+4dG4g==
X-CSE-MsgGUID: CT/JL0eFTuavVzxt61I/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="219455261"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 08 Mar 2026 07:37:37 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vzFGA-000000003Am-0sOb;
 Sun, 08 Mar 2026 14:37:34 +0000
Date: Sun, 8 Mar 2026 22:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Koskovich <AKoskovich@pm.me>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
Message-ID: <202603082223.61KVemAP-lkp@intel.com>
References: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-tianma-ta066vvhm03-v1-2-869fac443b20@pm.me>
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
X-Rspamd-Queue-Id: D0762230B8D
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:AKoskovich@pm.me,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk@kernel.org,m:conor+dt@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akoskovich@pm.me,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Koskovich/dt-bindings-display-panel-Document-Tianma-TA066VVHM03/20260308-140525
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260308-tianma-ta066vvhm03-v1-2-869fac443b20%40pm.me
patch subject: [PATCH 2/2] drm/panel: Add support for Tianma TA066VVHM03 panel
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603082223.61KVemAP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082223.61KVemAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082223.61KVemAP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c: In function 'tianma_ta066vvhm03_probe':
>> drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c:335:12: error: 'struct mipi_dsi_device' has no member named 'dsc_slice_per_pkt'
     335 |         dsi->dsc_slice_per_pkt = 2;
         |            ^~


vim +335 drivers/gpu/drm/panel/panel-tianma-ta066vvhm03.c

   286	
   287	static int tianma_ta066vvhm03_probe(struct mipi_dsi_device *dsi)
   288	{
   289		struct device *dev = &dsi->dev;
   290		struct tianma_ta066vvhm03 *ctx;
   291		int ret;
   292	
   293		ctx = devm_drm_panel_alloc(dev, struct tianma_ta066vvhm03, panel,
   294					   &tianma_ta066vvhm03_panel_funcs,
   295					   DRM_MODE_CONNECTOR_DSI);
   296		if (IS_ERR(ctx))
   297			return PTR_ERR(ctx);
   298	
   299		ret = devm_regulator_bulk_get_const(dev,
   300						    ARRAY_SIZE(tianma_ta066vvhm03_supplies),
   301						    tianma_ta066vvhm03_supplies,
   302						    &ctx->supplies);
   303		if (ret < 0)
   304			return ret;
   305	
   306		ctx->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
   307		if (IS_ERR(ctx->enable_gpio))
   308			return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
   309					     "Failed to get enable-gpios\n");
   310	
   311		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   312		if (IS_ERR(ctx->reset_gpio))
   313			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   314					     "Failed to get reset-gpios\n");
   315	
   316		ctx->dsi = dsi;
   317		mipi_dsi_set_drvdata(dsi, ctx);
   318	
   319		dsi->lanes = 4;
   320		dsi->format = MIPI_DSI_FMT_RGB888;
   321		dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
   322				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
   323	
   324		ctx->panel.prepare_prev_first = true;
   325	
   326		ctx->panel.backlight = tianma_ta066vvhm03_create_backlight(dsi);
   327		if (IS_ERR(ctx->panel.backlight))
   328			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   329					     "Failed to create backlight\n");
   330	
   331		drm_panel_add(&ctx->panel);
   332	
   333		/* This panel only supports DSC; unconditionally enable it */
   334		dsi->dsc = &ctx->dsc;
 > 335		dsi->dsc_slice_per_pkt = 2;
   336	
   337		ctx->dsc.dsc_version_major = 1;
   338		ctx->dsc.dsc_version_minor = 1;
   339	
   340		ctx->dsc.slice_height = 20;
   341		ctx->dsc.slice_width = 540;
   342		WARN_ON(1080 % ctx->dsc.slice_width);
   343		ctx->dsc.slice_count = 1080 / ctx->dsc.slice_width;
   344		ctx->dsc.bits_per_component = 10;
   345		ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
   346		ctx->dsc.block_pred_enable = true;
   347	
   348		ret = mipi_dsi_attach(dsi);
   349		if (ret < 0) {
   350			drm_panel_remove(&ctx->panel);
   351			return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   352		}
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
