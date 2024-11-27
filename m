Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19079DAE21
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 20:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601EA10EB56;
	Wed, 27 Nov 2024 19:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDSjn6kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE2A10EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 19:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737060; x=1764273060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vrJO1wkuzgJfCDUQLlADHpSFcf//iN63EqgubUkiMWs=;
 b=MDSjn6kRnAUudtM8BuXsFM6aeiXaUm70D2l9Mn4kqYOBg7fX1P4UNGKi
 S5xpMmKZQA1KJAPLRXl73JXjtvAZ3NYwf/7GqBqOUL3AcniGquQG4n57p
 YtVGSxsS18CrKY8G+0ApkCe4YjLUpmprswcJqcCcxdYJzmocb6Ux+tho2
 TmyfYuNTWPiSWLQfIdIVbqMcIX2oeUe+3lqz4ryUESTXwxSVwlHrLzxnn
 S2E5yMBFxo/8teCCNpDMOtRUOo1XSZcgCCOTwMJUoVF83WJPmTjTA2iTm
 hdqOGlRqgoK5Vp17rccFftF7UoaidXAC15iEYHpTGiWUOEWEi3ka41zYT g==;
X-CSE-ConnectionGUID: +mvm4HEyTx2C/5LBcRl8Cw==
X-CSE-MsgGUID: AZcGl4F/SLW02OhS6J0ZEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32702975"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="32702975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 11:51:00 -0800
X-CSE-ConnectionGUID: cAEn0AVZSQK2zP8zuWj0eA==
X-CSE-MsgGUID: GM4gzX/bQ3KnKhk2BY1dZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="122994830"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2024 11:50:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tGO3l-0008Jj-1U;
 Wed, 27 Nov 2024 19:50:49 +0000
Date: Thu, 28 Nov 2024 03:50:01 +0800
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
Message-ID: <202411280334.CDiErngI-lkp@intel.com>
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
[also build test WARNING on v6.12 next-20241127]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/keith-zhao/dt-bindings-display-bindings-for-starfive-JH7110-display-pipeline/20241121-145710
base:   linus/master
patch link:    https://lore.kernel.org/r/20241120061848.196754-5-keith.zhao%40starfivetech.com
patch subject: [PATCH v5 4/9] drm/vs: Add Hardware Functions for VS DC8200
config: xtensa-kismet-CONFIG_CMA-CONFIG_DRM_VERISILICON_DC8200-0-0 (https://download.01.org/0day-ci/archive/20241128/202411280334.CDiErngI-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241128/202411280334.CDiErngI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280334.CDiErngI-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CMA when selected by DRM_VERISILICON_DC8200
   WARNING: unmet direct dependencies detected for CMA
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_VERISILICON_DC8200 [=y] && HAS_IOMEM [=y] && DRM [=y] && HAVE_DMA_CONTIGUOUS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
