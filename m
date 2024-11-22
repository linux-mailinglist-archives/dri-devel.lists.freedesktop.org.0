Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BE9D584B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77E910E174;
	Fri, 22 Nov 2024 02:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrRCKMV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346B10E174
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732242578; x=1763778578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ygXdHoYgdDV8uhUQRvreb/w1Nsb+bH9PmhGFMqtau+E=;
 b=UrRCKMV8jUPMeXubaIEylYY4hXPkAkGHgKBB6LzQU3USYVr8pnzf8XaJ
 14cBicBDQx+FJp1XHcY6MJOh7GWNcqLD5yuZx6Js44axQc5l0kCAellfL
 gCdLAdEZ/bync3Ay+aHH+u2CDgPiDNq8NiIWe2JqSIgey0EuRmG0rvKSN
 Hl42xf+ljZQulkOrtuMoamwFFFLRda+fHgSvYPM0cM/Tj7/qeN667nNwX
 NN3rNNyZOOAnMN54MIUUDx9b6WCYWwRez5fRHG2cobtP1ZLKhYeZcN4G/
 5SWiF3X+947J1REspuS8GG6PXMK5Oq5BrAdaEBeWhNBtXRSLOTIyowqzy w==;
X-CSE-ConnectionGUID: HQlTxdtTR0+UdZBBlxpMVA==
X-CSE-MsgGUID: 0WbxF+34RiO/pp8W+c+cXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43764571"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43764571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 18:29:37 -0800
X-CSE-ConnectionGUID: h0ffBcEBS0CwwylnBUecLg==
X-CSE-MsgGUID: TZLT3qEHTNWFslZClvwikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90601994"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2024 18:29:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tEJQG-0003av-0G;
 Fri, 22 Nov 2024 02:29:28 +0000
Date: Fri, 22 Nov 2024 10:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: keith zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, william.qiu@starfivetech.com,
 xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
Message-ID: <202411221030.71tSpXt2-lkp@intel.com>
References: <20241120061848.196754-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-5-keith.zhao@starfivetech.com>
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

Hi keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12 next-20241121]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith-zhao/dt-bindings-display-bindings-for-starfive-JH7110-display-pipeline/20241121-145710
base:   linus/master
patch link:    https://lore.kernel.org/r/20241120061848.196754-5-keith.zhao%40starfivetech.com
patch subject: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
config: xtensa-kismet-CONFIG_CMA-CONFIG_DRM_VERISILICON_DC8200-0-0 (https://download.01.org/0day-ci/archive/20241122/202411221030.71tSpXt2-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241122/202411221030.71tSpXt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221030.71tSpXt2-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CMA when selected by DRM_VERISILICON_DC8200
   WARNING: unmet direct dependencies detected for CMA
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y] && HAVE_DMA_CONTIGUOUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
