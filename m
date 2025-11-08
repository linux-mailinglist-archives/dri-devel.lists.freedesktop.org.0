Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCEC4244C
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 02:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770BB10E1EE;
	Sat,  8 Nov 2025 01:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiK1mj9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49210E1EE
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762567080; x=1794103080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CEDFMxYfpWpKEeZvHuIY1GU1d5cVnE9BuUKvjY0Shbg=;
 b=SiK1mj9ZhG9zauQQAv7tyEEB9No7AATIlSOB+SVGx8PSlcKfN+tTt8tD
 8uktKW1oWiXidugO6ooB5Yxf3sUBan3paquQ/gIWkIOfSKQ72ZtDZ94Ev
 d8m/V2HftiRm5lkQWxkfsQIwABslEd1/0NLzQYHq43Z3ZaiRqwvV8duqs
 KJ/3us+yOJT5F9XHaTPqD24GikdvPy1s+zo7kLKfaZohZEU70suDAU0hm
 AWtiEgjeJ9xVC4FBbRE0DrxeRM6jJje68xZcIyUH0jtJhAT2HWtnUAxMo
 pqbg6y68WidzYUdGy1yjKEyROLwv4oA+fFY4GzGdaRujoK9ZAgHKajCvC Q==;
X-CSE-ConnectionGUID: dhQSn9CSRNO0GFEfYQjYtw==
X-CSE-MsgGUID: foTWUxLRSgOsFIx86wwI6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75329799"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="75329799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 17:57:59 -0800
X-CSE-ConnectionGUID: fhd5po3kQQqI3uYkg2qquQ==
X-CSE-MsgGUID: P0egOIl5Q4SssJqGD/40Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="192290071"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2025 17:57:54 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vHYDA-0000bT-0D;
 Sat, 08 Nov 2025 01:57:52 +0000
Date: Sat, 8 Nov 2025 09:57:40 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
Message-ID: <202511080928.8r4OmyWW-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511080928.8r4OmyWW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080928.8r4OmyWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080928.8r4OmyWW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/lontium-lt9211c.c: In function 'lt9211c_configure_rx':
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:207:55: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     207 |         ret = regmap_write(ctx->regmap, 0x8180, (pval & 0xfc | 0x03));
         |                                                  ~~~~~^~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:227:55: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     227 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0xf8 | 0x11));
         |                                                  ~~~~~^~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c: In function 'lt9211c_autodetect_rx':
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:253:12: warning: unused variable 'bc' [-Wunused-variable]
     253 |         u8 bc[3];
         |            ^~
   drivers/gpu/drm/bridge/lontium-lt9211c.c: In function 'lt9211c_configure_tx':
   drivers/gpu/drm/bridge/lontium-lt9211c.c:619:55: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     619 |         ret = regmap_write(ctx->regmap, 0x8530, (pval & 0x3f | 0x40));
         |                                                  ~~~~~^~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c: At top level:
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:918:35: error: initialization of 'int (*)(struct drm_bridge *, struct drm_encoder *, enum drm_bridge_attach_flags)' from incompatible pointer type 'int (*)(struct drm_bridge *, enum drm_bridge_attach_flags)' [-Wincompatible-pointer-types]
     918 |         .attach                 = lt9211c_attach,
         |                                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:918:35: note: (near initialization for 'lt9211c_funcs.attach')
   drivers/gpu/drm/bridge/lontium-lt9211c.c:99:12: note: 'lt9211c_attach' declared here
      99 | static int lt9211c_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/lontium-lt9211c.c:920:35: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-pointer-types]
     920 |         .atomic_enable          = lt9211c_atomic_enable,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:920:35: note: (near initialization for 'lt9211c_funcs.atomic_enable')
   drivers/gpu/drm/bridge/lontium-lt9211c.c:777:13: note: 'lt9211c_atomic_enable' declared here
     777 | static void lt9211c_atomic_enable(struct drm_bridge *bridge,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:921:35: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-pointer-types]
     921 |         .atomic_disable         = lt9211c_atomic_disable,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/lontium-lt9211c.c:921:35: note: (near initialization for 'lt9211c_funcs.atomic_disable')
   drivers/gpu/drm/bridge/lontium-lt9211c.c:857:13: note: 'lt9211c_atomic_disable' declared here
     857 | static void lt9211c_atomic_disable(struct drm_bridge *bridge,
         |             ^~~~~~~~~~~~~~~~~~~~~~


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
