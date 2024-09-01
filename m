Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE296756D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEF610E02A;
	Sun,  1 Sep 2024 07:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCbWuZzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C96110E02A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725175782; x=1756711782;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SQt4JagV+lhS329kwX26vxDV+oV+80PNCFXXzVPsA2s=;
 b=RCbWuZztKFRlRF2GNb5W8bSDNS4E00sJC96AGUfR7ZyBEijc6gYX6Q1M
 TuURg3m9qTzVflgIzT8fox2q2yJN33pz9xvaBNKs5cD8wu/ZkHjDGZ2Fb
 mtcnSEBR6u1hl6yzcWnod4kdrq4OVTGwLLlk7fqJ4kFvBWGRSDA99Tqt8
 FeBXj4RzRHGiMg8pfE9OO8pztZsZ+Jb3ZeQyuAlNpG4ovJPf/ZHLZ6lRN
 bufJU3D1xhtyD2/LOptfmWjHTvKC1ctsVCJQMx8me0Mgq/Tz5f1MABHIE
 e17mzerd2SoPSH9HliByYHjy7euuNWe/ZF2waNakLGFB8FHxe5S4SkYaf w==;
X-CSE-ConnectionGUID: DbLf417bRwCwHJLOm4djpA==
X-CSE-MsgGUID: WOaqx8kDQdG1FfXYTchYww==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23638528"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; d="scan'208";a="23638528"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2024 00:29:41 -0700
X-CSE-ConnectionGUID: Aj8pqp2PS3yVenm/GXAe2w==
X-CSE-MsgGUID: cW04QgowQM6PP7wDj0yJqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; d="scan'208";a="64644994"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 01 Sep 2024 00:29:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1skf1j-0003W6-00;
 Sun, 01 Sep 2024 07:29:35 +0000
Date: Sun, 1 Sep 2024 15:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, manikandan.m@microchip.com,
 dharma.b@microchip.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 2/3] drm/bridge: microchip-lvds: Drop unused headers
Message-ID: <202409011412.DQVmnHIW-lkp@intel.com>
References: <20240827161223.4152195-3-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827161223.4152195-3-claudiu.beznea@tuxon.dev>
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

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu-Beznea/drm-bridge-microchip-lvds-Revert-clk_prepare_enable-in-case-of-failure/20240828-001456
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240827161223.4152195-3-claudiu.beznea%40tuxon.dev
patch subject: [PATCH 2/3] drm/bridge: microchip-lvds: Drop unused headers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240901/202409011412.DQVmnHIW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011412.DQVmnHIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011412.DQVmnHIW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/microchip-lvds.c:62:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         return readl_relaxed(lvds->regs + offset);
         |                ^
>> drivers/gpu/drm/bridge/microchip-lvds.c:67:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         writel_relaxed(val, lvds->regs + offset);
         |         ^
   2 errors generated.


vim +/readl_relaxed +62 drivers/gpu/drm/bridge/microchip-lvds.c

179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  59  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  60  static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  61  {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21 @62  	return readl_relaxed(lvds->regs + offset);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  63  }
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  64  
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  65  static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  66  {
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21 @67  	writel_relaxed(val, lvds->regs + offset);
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  68  }
179b0769fc5fc19 Dharma Balasubiramani 2024-04-21  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
