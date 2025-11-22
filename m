Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946F2C7D5A7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 19:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767D910E04F;
	Sat, 22 Nov 2025 18:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doKBJKeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865DF10E04F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763836877; x=1795372877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uh6fba18pbvtcVMxyxzgPBWrZ9i8/1sGN1sD1sLq4co=;
 b=doKBJKeYivAY6e9PMOe8PjitnkFTgFeVZLUWoEp4vnT4eMUabXwelSZ5
 XWNYDD5X9qwY8SlwZ5U1gbXqNFIkQItsLTPipvxTL53fNw+k7obDVS+CD
 80l2HKAlnsByuOZhPAUwue9kHoZiFq+m4OVfg4aNF3jZOfQBemCKxGiOJ
 7JyfDjDIGLFOlvklKfIBMn9//Zz+nY1TtIWjEykdtiduFwCE6uOOXn5uL
 mdslEu8qBjrAn5hqFE0hKgD39lhbup1s8Rq7nJ1cJ0PYVX039Jowjzy8x
 jrnZ66U5JaR5fd0vRX+UC4yS/EegISX3JDJaRgeHSkZwEXJC8IDGx6VPn A==;
X-CSE-ConnectionGUID: JdZ6TFpOS46sZlLwrtA+XQ==
X-CSE-MsgGUID: qKudnM0TTOS8TK2v8h6G+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="53469231"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="53469231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 10:41:17 -0800
X-CSE-ConnectionGUID: GX2RLIrLT5qBDBNYgcnDaQ==
X-CSE-MsgGUID: IZMZCRR/Q2yDT+wCNFSm3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191637140"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2025 10:41:13 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vMsXn-0007l7-1R;
 Sat, 22 Nov 2025 18:41:11 +0000
Date: Sun, 23 Nov 2025 02:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
Message-ID: <202511230240.NYBAiUV4-lkp@intel.com>
References: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67@microchip.com>
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

Hi Ludovic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Ludovic-Desroches/drm-atmel-hlcdc-use-managed-device-resources-for-the-display-controller/20251121-231107
base:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
patch link:    https://lore.kernel.org/r/20251121-lcd_cleanup_mainline-v1-5-2587e6fe4d67%40microchip.com
patch subject: [PATCH 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
config: arm-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230240.NYBAiUV4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230240.NYBAiUV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230240.NYBAiUV4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:100:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     100 |         if (bridge) {
         |             ^~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:106:9: note: uninitialized use occurs here
     106 |         return ret;
         |                ^~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:100:2: note: remove the 'if' if its condition is always true
     100 |         if (bridge) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c:75:9: note: initialize the variable 'ret' to silence this warning
      75 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +100 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c

b6e075c3cb6e57d Peter Rosin       2018-08-25   67  
6bee9b78a7a5ea2 Boris Brezillon   2017-05-18   68  static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
17a8e03e7e97d34 Boris Brezillon   2016-01-06   69  {
b6e075c3cb6e57d Peter Rosin       2018-08-25   70  	struct atmel_hlcdc_rgb_output *output;
b6e075c3cb6e57d Peter Rosin       2018-08-25   71  	struct device_node *ep;
17a8e03e7e97d34 Boris Brezillon   2016-01-06   72  	struct drm_bridge *bridge;
ec29c94011469e7 Ludovic Desroches 2025-11-21   73  	struct atmel_hlcdc_dc *dc = dev->dev_private;
ec29c94011469e7 Ludovic Desroches 2025-11-21   74  	struct drm_crtc *crtc = dc->crtc;
17a8e03e7e97d34 Boris Brezillon   2016-01-06   75  	int ret;
1a396789f65a227 Boris Brezillon   2015-01-06   76  
524bfe4ade6dbed Ludovic Desroches 2025-11-21   77  	bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, endpoint);
524bfe4ade6dbed Ludovic Desroches 2025-11-21   78  	if (IS_ERR(bridge))
524bfe4ade6dbed Ludovic Desroches 2025-11-21   79  		return PTR_ERR(bridge);
6bee9b78a7a5ea2 Boris Brezillon   2017-05-18   80  
e38758ed5aece5d Ludovic Desroches 2025-11-21   81  	output = drmm_simple_encoder_alloc(dev, struct atmel_hlcdc_rgb_output,
e38758ed5aece5d Ludovic Desroches 2025-11-21   82  					   encoder, DRM_MODE_ENCODER_NONE);
e38758ed5aece5d Ludovic Desroches 2025-11-21   83  	if (IS_ERR(output))
e38758ed5aece5d Ludovic Desroches 2025-11-21   84  		return PTR_ERR(output);
e38758ed5aece5d Ludovic Desroches 2025-11-21   85  
e38758ed5aece5d Ludovic Desroches 2025-11-21   86  	ep = of_graph_get_endpoint_by_regs(dev->dev->of_node, 0, endpoint);
e38758ed5aece5d Ludovic Desroches 2025-11-21   87  	if (!ep)
e38758ed5aece5d Ludovic Desroches 2025-11-21   88  		return -ENODEV;
b6e075c3cb6e57d Peter Rosin       2018-08-25   89  
b6e075c3cb6e57d Peter Rosin       2018-08-25   90  	output->bus_fmt = atmel_hlcdc_of_bus_fmt(ep);
b6e075c3cb6e57d Peter Rosin       2018-08-25   91  	of_node_put(ep);
b6e075c3cb6e57d Peter Rosin       2018-08-25   92  	if (output->bus_fmt < 0) {
3379655524e613e Eslam Khafagy     2025-08-14   93  		drm_err(dev, "endpoint %d: invalid bus width\n", endpoint);
17a8e03e7e97d34 Boris Brezillon   2016-01-06   94  		return -EINVAL;
b6e075c3cb6e57d Peter Rosin       2018-08-25   95  	}
1a396789f65a227 Boris Brezillon   2015-01-06   96  
1a396789f65a227 Boris Brezillon   2015-01-06   97  
ec29c94011469e7 Ludovic Desroches 2025-11-21   98  	output->encoder.possible_crtcs = drm_crtc_mask(crtc);
17a8e03e7e97d34 Boris Brezillon   2016-01-06   99  
17a8e03e7e97d34 Boris Brezillon   2016-01-06 @100  	if (bridge) {
a25b988ff83f3ca Laurent Pinchart  2020-02-26  101  		ret = drm_bridge_attach(&output->encoder, bridge, NULL, 0);
17a8e03e7e97d34 Boris Brezillon   2016-01-06  102  		if (!ret)
17a8e03e7e97d34 Boris Brezillon   2016-01-06  103  			return 0;
17a8e03e7e97d34 Boris Brezillon   2016-01-06  104  	}
1a396789f65a227 Boris Brezillon   2015-01-06  105  
1a396789f65a227 Boris Brezillon   2015-01-06  106  	return ret;
1a396789f65a227 Boris Brezillon   2015-01-06  107  }
1a396789f65a227 Boris Brezillon   2015-01-06  108  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
