Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA88CB536
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 23:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98410E453;
	Tue, 21 May 2024 21:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S534v9LZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CF110E453
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 21:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716326007; x=1747862007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jU/KIs1yxidfflnv5CSKB5RJvZIBfuN7UKBuEXcylFc=;
 b=S534v9LZzdI19LJcuaOFlOJZbcIp/etuytwRQJuM89JomXgy8tYYPvQU
 /QphiIAR9ZS2kAOQ/rEquznZqY9a0Euieo/4zWpJZpVHbafwzG+l4KvyZ
 K6CcND5PIUvgizBNKCcecnGV4Pbise0ce0izAPrWlW7ZW/ekrpftwFT1L
 4alWQsl5TaZDq5JgtxdBPydC3FwGrsrn2XNTzyk52E1hzRg3LatHpus/+
 /Hu57oyhIQja7xgFiQ4yrkSqBmLbl46UupNbw5jyZQMjc26wm3Fae4IPL
 /Qteh9JUXgTyuPz8ipMqFL6UmppiC44ngmCFsKa8Eiagn8Rzz2krrtuYM g==;
X-CSE-ConnectionGUID: l3M+AdhNRaOjTfN5nBCHdQ==
X-CSE-MsgGUID: 409BvGHqS6eWXgC4KFu9Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12386865"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12386865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 14:13:26 -0700
X-CSE-ConnectionGUID: T+/OAt9fSpiQPz7u2tDMSA==
X-CSE-MsgGUID: cFVMG8jZRSib6lotqrC9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="32971104"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 21 May 2024 14:13:22 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s9Wmo-0000kX-2V;
 Tue, 21 May 2024 21:13:06 +0000
Date: Wed, 22 May 2024 05:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dmitry.baryshkov@linaro.org, ictor.liu@nxp.com,
 sui.jingfeng@linux.dev, aford@beaconembedded.com,
 Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
Message-ID: <202405220445.DW2U7DXR-lkp@intel.com>
References: <20240521011614.496421-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521011614.496421-1-aford173@gmail.com>
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

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master drm-intel/for-linux-next-fixes v6.9 next-20240521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Ford/drm-bridge-adv7511-Fix-Intermittent-EDID-failures/20240521-091841
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240521011614.496421-1-aford173%40gmail.com
patch subject: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
config: i386-buildonly-randconfig-002-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220445.DW2U7DXR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220445.DW2U7DXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220445.DW2U7DXR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:507:35: warning: variable 'cec_status' is uninitialized when used here [-Wuninitialized]
     507 |         if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
         |                                          ^~~~~~~~~~
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:472:16: note: initialize the variable 'cec_status' to silence this warning
     472 |         int cec_status;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/cec_status +507 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c

   505	
   506		/* If there is no IRQ to handle, exit indicating no IRQ data */
 > 507		if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
   508			return IRQ_HANDLED;
   509	
   510		return IRQ_NONE;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
