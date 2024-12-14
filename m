Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E109F2189
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 00:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3D10E362;
	Sat, 14 Dec 2024 23:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnziYlNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6702010E362;
 Sat, 14 Dec 2024 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734218979; x=1765754979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1+CFgeAd+oR6Q7/0GgOQkB/ji2r8yb3vByK9aFbF0Js=;
 b=LnziYlNjYFeVMcXnTiu3Z4kMBcOqt9ee0vkgxKP6v6aRIUQruTXz5km+
 ln7Y9rxwu8iuaHkg53iYNWtRHqlEnpfg3K3dJ2UNd0kVsJcTb7aK1RQA7
 tnpP9Dbg/J6soAT1bW0PNAZmdhoi3ven5pu+le6eOjwt/tJsnEuCBiSO+
 HDR/b0qJb/olshq/aiksKBTSqtAgCTCS7GKA9YlxzJMSbhkLaKCTuoVcB
 /es0D/gPE7JdUQArAs+mGfe3fLiUr454L2KIUjLdM6oBKUFAnCr2Tz7Ul
 w/dbwdeGauFrwcNdGjuLedz8EsPvwlGaqI/2mwRAoj4U0/O6LMqjBbpYy A==;
X-CSE-ConnectionGUID: 4WUgnV45Q8y0OEAwsKYxTg==
X-CSE-MsgGUID: m01VAFuyRZesTcD1R4Hjyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="52061460"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="52061460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2024 15:29:38 -0800
X-CSE-ConnectionGUID: SrouF0NVSG6mlDyZXA8t3A==
X-CSE-MsgGUID: Z2iN8U93RbKsgav5GjOCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; d="scan'208";a="97092677"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2024 15:29:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tMbZk-000DJi-0q;
 Sat, 14 Dec 2024 23:29:32 +0000
Date: Sun, 15 Dec 2024 07:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm/nouveau: incorporate I2C TV encoder drivers
Message-ID: <202412150729.LAunB5YO-lkp@intel.com>
References: <20241214-nouveau-encoder-slave-v1-1-beda767472e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241214-nouveau-encoder-slave-v1-1-beda767472e3@linaro.org>
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

[auto build test ERROR on 4176cf5c5651c33769de83bb61b0287f4ec7719f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-nouveau-incorporate-I2C-TV-encoder-drivers/20241214-233637
base:   4176cf5c5651c33769de83bb61b0287f4ec7719f
patch link:    https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-1-beda767472e3%40linaro.org
patch subject: [PATCH 1/2] drm/nouveau: incorporate I2C TV encoder drivers
reproduce: (https://download.01.org/0day-ci/archive/20241215/202412150729.LAunB5YO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150729.LAunB5YO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv04/Kbuild:14: drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild: No such file or directory
>> make[6]: *** No rule to make target 'drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild'.
   drivers/gpu/drm/nouveau/dispnv04/Kbuild:14: Failed to remake makefile 'drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild'.
   make[5]: *** [scripts/Makefile.clean:61: drivers/gpu/drm/nouveau] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/gpu/drm] Error 2
   make[4]: Target '__clean' not remade because of errors.


vim +14 drivers/gpu/drm/nouveau/dispnv04/Kbuild

    13	
  > 14	include $(src)/dispnv04/i2c/Kbuild

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
