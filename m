Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A110AB3CAB9
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 14:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B505910E24A;
	Sat, 30 Aug 2025 12:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCeHN1Pz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC6710E24A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756555776; x=1788091776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8P4WrA/SJEy/L79/DSQB7imWaic2ObRv8kUO/ujofXI=;
 b=RCeHN1PzFD25Q2pUhJVnUNPXTowML2pGksAOhwS/9cG6T5Nm0aoFnwou
 O7L8w3W82NlI1IL9/mKjGaLz7wbL92VbO1XmAwgovH4rbg/aBWcVFtTcN
 xj5SM0uMwVGLQ5Yh/eujbRepfziBk4eA6flnfj1+xH81bPrMkFpDffNls
 KH5TjKzuKbylNTRYSpfYQ4Q58xnCOmx8qOjGtARVsoxKs4Y1vxrEYkswe
 ZOxZzP+0iipPhD2r5e47eiM2pN5HkVXOADaWuScabA18EWaAHZ8+alBxj
 cs0GSPRPQKQ+k0OqB70FyjNAG/USG3EclR7eVDff0ksHwoc/HBobVkPGg w==;
X-CSE-ConnectionGUID: fCod/BR8TvCVdFyacwjN7A==
X-CSE-MsgGUID: 3b3wrVTlQE6uCGm2pW+qzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58020651"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58020651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2025 05:09:36 -0700
X-CSE-ConnectionGUID: cxMSSuYbTdiZoHRafIE+eQ==
X-CSE-MsgGUID: yliCIGqCQUeXg95YXH3hEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170151300"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 30 Aug 2025 05:09:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1usKON-000VLN-2J;
 Sat, 30 Aug 2025 12:09:13 +0000
Date: Sat, 30 Aug 2025 20:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/11] drm/rockchip: rk3066: declare supported
 infoframes
Message-ID: <202508301909.DvZIl8j0-lkp@intel.com>
References: <20250830-drm-limit-infoframes-v3-7-32fcbec4634e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-7-32fcbec4634e@oss.qualcomm.com>
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on f4028ef65dc4fe9010bcc017597fe0fea6479097]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-connector-let-drivers-declare-infoframes-as-unsupported/20250830-082533
base:   f4028ef65dc4fe9010bcc017597fe0fea6479097
patch link:    https://lore.kernel.org/r/20250830-drm-limit-infoframes-v3-7-32fcbec4634e%40oss.qualcomm.com
patch subject: [PATCH v3 07/11] drm/rockchip: rk3066: declare supported infoframes
config: i386-buildonly-randconfig-002-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301909.DvZIl8j0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301909.DvZIl8j0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301909.DvZIl8j0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:699:15: error: no member named 'supported_infoframes' in 'struct drm_bridge'; did you mean 'supported_formats'?
     699 |         hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
         |                      ^~~~~~~~~~~~~~~~~~~~
         |                      supported_formats
   include/drm/drm_bridge.h:1199:15: note: 'supported_formats' declared here
    1199 |         unsigned int supported_formats;
         |                      ^
   1 error generated.


vim +699 drivers/gpu/drm/rockchip/rk3066_hdmi.c

   666	
   667	static int
   668	rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
   669	{
   670		struct drm_encoder *encoder = &hdmi->encoder.encoder;
   671		struct device *dev = hdmi->dev;
   672		int ret;
   673	
   674		encoder->possible_crtcs =
   675			drm_of_find_possible_crtcs(drm, dev->of_node);
   676	
   677		/*
   678		 * If we failed to find the CRTC(s) which this encoder is
   679		 * supposed to be connected to, it's because the CRTC has
   680		 * not been registered yet.  Defer probing, and hope that
   681		 * the required CRTC is added later.
   682		 */
   683		if (encoder->possible_crtcs == 0)
   684			return -EPROBE_DEFER;
   685	
   686		drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
   687		drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
   688	
   689		hdmi->bridge.driver_private = hdmi;
   690		hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
   691		hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
   692				   DRM_BRIDGE_OP_EDID |
   693				   DRM_BRIDGE_OP_HDMI |
   694				   DRM_BRIDGE_OP_HPD;
   695		hdmi->bridge.of_node = hdmi->dev->of_node;
   696		hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
   697		hdmi->bridge.vendor = "Rockchip";
   698		hdmi->bridge.product = "RK3066 HDMI";
 > 699		hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
   700	
   701		hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
   702		if (IS_ERR(hdmi->bridge.ddc))
   703			return PTR_ERR(hdmi->bridge.ddc);
   704	
   705		if (IS_ERR(hdmi->bridge.ddc))
   706			return PTR_ERR(hdmi->bridge.ddc);
   707	
   708		ret = devm_drm_bridge_add(dev, &hdmi->bridge);
   709		if (ret)
   710			return ret;
   711	
   712		ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
   713		if (ret)
   714			return ret;
   715	
   716		hdmi->connector = drm_bridge_connector_init(drm, encoder);
   717		if (IS_ERR(hdmi->connector)) {
   718			ret = PTR_ERR(hdmi->connector);
   719			dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
   720			return ret;
   721		}
   722	
   723		drm_connector_attach_encoder(hdmi->connector, encoder);
   724	
   725		return 0;
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
