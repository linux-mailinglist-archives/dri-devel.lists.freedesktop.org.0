Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8CB242E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 09:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06E310E1C8;
	Wed, 13 Aug 2025 07:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdemnEjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69910E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755070821; x=1786606821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WKYPMchJPeoCGBpYS0+31pC4PeqRcgJxD/lMF5bIcDQ=;
 b=GdemnEjYa/c//hdnaJnk5f+Iur22FlW+Q3/8kAhdR43WTNC7BrJp2zxA
 deThvpofYuCikzDFuAV/zLUTZT5O0OOI3MetCkR0E/qL2brb4oYrPgFG1
 Mjr0Hz63K0zvFrxeb6PTVYl2kureDzaOMKwJjJcXsmwZhXez3T+3hW0Ws
 GZRF24lnQjm3Qd+1nN7c7BVh1T9EXTp8AT0ovzX+s+yeE8TDq2W9mArrl
 xBhczMz/YKnCrwJWtdkdiYWvuZ/loW/vO3fM34hGvFs6IVT+yL/VcOLFc
 X77MR6kOeopwzG+5qTWOwX0u4o+Jizpr2f77iEPe4V94ogRRLXnKM+Akq A==;
X-CSE-ConnectionGUID: Ka4HyxFjT76rA+FbDLDqJA==
X-CSE-MsgGUID: yQBcdFS5QdWhwEEr9b7cDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74934944"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="74934944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 00:40:21 -0700
X-CSE-ConnectionGUID: a9L3jeQlQIyyqEIAKPsWQQ==
X-CSE-MsgGUID: Ip2e9YrPR3mWL1IxZlg4ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="170540055"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2025 00:40:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1um65n-0009fw-1C;
 Wed, 13 Aug 2025 07:40:15 +0000
Date: Wed, 13 Aug 2025 15:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <202508131549.DaogZRF9-lkp@intel.com>
References: <20250812145256.135645-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812145256.135645-3-mike.looijmans@topic.nl>
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

Hi Mike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 53e760d8949895390e256e723e7ee46618310361]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Looijmans/dt-bindings-drm-bridge-ti-tmds181-Add-TI-TMDS181-and-SN65DP159-bindings/20250812-225413
base:   53e760d8949895390e256e723e7ee46618310361
patch link:    https://lore.kernel.org/r/20250812145256.135645-3-mike.looijmans%40topic.nl
patch subject: [PATCH 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250813/202508131549.DaogZRF9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131549.DaogZRF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131549.DaogZRF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ti-tmds181.c:273:41: warning: initializer-string for character array is too long, array size is 8 but initializer has size 9 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     273 | static const u8 tmds181_id_tmds181[8] = "TMDS181 ";
         |                                         ^~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:274:41: warning: initializer-string for character array is too long, array size is 8 but initializer has size 9 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     274 | static const u8 tmds181_id_dp159[8]   = "DP159   ";
         |                                         ^~~~~~~~~~
   2 warnings generated.


vim +/nonstring +273 drivers/gpu/drm/bridge/ti-tmds181.c

   272	
 > 273	static const u8 tmds181_id_tmds181[8] = "TMDS181 ";
   274	static const u8 tmds181_id_dp159[8]   = "DP159   ";
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
