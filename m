Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB676C42676
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 05:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12B710E078;
	Sat,  8 Nov 2025 04:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/0mtTEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1910E078
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 04:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762575193; x=1794111193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Chbc1OyTI8Ct9a3uY+DcWiIf+X6KyQ9qPPr/UEG1dxo=;
 b=P/0mtTEn13TXQ4DUdKydDqY9jriUDwHuAX1NDjpr4jJFkr8eotTS4A0y
 Zqiiss7PSRChbX4VOSduwqNXC3/Vu9rWgpDOr51MC2Np9WeuhI721o/yu
 TkF8CQ0IehAU8nwll3y7bxCbu52KhoY4KWnE3W5exgRHpDSDmei+CbGIp
 Gm6+/GlZyydcOR/WglOFujYeyvnt5uG2KmGsd8fhSILQzI/9gr7MKNQ84
 5SpFDaPRsf2/zC9hCCwPvtgsLCRFqpnTlV54FbWYsvsX3LTzTzh9lyA6X
 uKZJ/tV4qxJbB8OjdGkNjhE/AqcZYYUOYWU7W9jzEejZ8TldMEq36aB0r Q==;
X-CSE-ConnectionGUID: EKAhmriXSduUw2X2cgCEwQ==
X-CSE-MsgGUID: JflvEilSRyO9KWUd2gKjpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75333632"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="75333632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 20:13:13 -0800
X-CSE-ConnectionGUID: a/SCoH5pTGazUgKz1IUMmQ==
X-CSE-MsgGUID: yvD98d3LTP+rGCENt+8esw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="187454883"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 07 Nov 2025 20:13:07 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vHaK1-0000id-0U;
 Sat, 08 Nov 2025 04:13:05 +0000
Date: Sat, 8 Nov 2025 12:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <202511081122.TMw7Wy9r-lkp@intel.com>
References: <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
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

Hi Nilesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on f50b969bafafb2810a07f376387350c4c0d72a21]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilesh-Laad/dt-bindings-bridge-lt9211c-Add-bindings/20251107-210546
base:   f50b969bafafb2810a07f376387350c4c0d72a21
patch link:    https://lore.kernel.org/r/20251107-add-lt9211c-bridge-v2-2-b0616e23407c%40oss.qualcomm.com
patch subject: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511081122.TMw7Wy9r-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081122.TMw7Wy9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081122.TMw7Wy9r-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/lontium-lt9211c.c:207:48: warning: '&' within '|' [-Wbitwise-op-parentheses]
     207 |         ret = regmap_write(ctx->regmap, 0x8180, (pval & 0xfc | 0x03));
         |                                                  ~~~~~^~~~~~ ~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:207:48: note: place parentheses around the '&' expression to silence this warning
     207 |         ret = regmap_write(ctx->regmap, 0x8180, (pval & 0xfc | 0x03));
         |                                                       ^
         |                                                  (          )
   drivers/gpu/drm/bridge/lontium-lt9211c.c:227:48: warning: '&' within '|' [-Wbitwise-op-parentheses]
     227 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0xf8 | 0x11));
         |                                                  ~~~~~^~~~~~ ~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:227:48: note: place parentheses around the '&' expression to silence this warning
     227 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0xf8 | 0x11));
         |                                                       ^
         |                                                  (          )
   drivers/gpu/drm/bridge/lontium-lt9211c.c:253:5: warning: unused variable 'bc' [-Wunused-variable]
     253 |         u8 bc[3];
         |            ^~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:619:48: warning: '&' within '|' [-Wbitwise-op-parentheses]
     619 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0x3f | 0x40));
         |                                                  ~~~~~^~~~~~ ~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:619:48: note: place parentheses around the '&' expression to silence this warning
     619 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0x3f | 0x40));
         |                                                       ^
         |                                                  (          )
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:918:14: error: incompatible function pointer types initializing 'int (*)(struct drm_bridge *, struct drm_encoder *, enum drm_bridge_attach_flags)' with an expression of type 'int (struct drm_bridge *, enum drm_bridge_attach_flags)' [-Wincompatible-function-pointer-types]
     918 |         .attach                 = lt9211c_attach,
         |                                   ^~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:920:20: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' with an expression of type 'void (struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-function-pointer-types]
     920 |         .atomic_enable          = lt9211c_atomic_enable,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:921:21: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' with an expression of type 'void (struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-function-pointer-types]
     921 |         .atomic_disable         = lt9211c_atomic_disable,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 3 errors generated.


vim +918 drivers/gpu/drm/bridge/lontium-lt9211c.c

   916	
   917	static const struct drm_bridge_funcs lt9211c_funcs = {
 > 918		.attach			= lt9211c_attach,
   919		.mode_valid		= lt9211c_mode_valid,
 > 920		.atomic_enable		= lt9211c_atomic_enable,
   921		.atomic_disable		= lt9211c_atomic_disable,
   922		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
   923		.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
   924		.atomic_get_input_bus_fmts = lt9211c_atomic_get_input_bus_fmts,
   925		.atomic_reset		= drm_atomic_helper_bridge_reset,
   926	};
   927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
