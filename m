Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20383AFECF8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 17:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1A10E80C;
	Wed,  9 Jul 2025 15:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xti7dCmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7810E80A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752073370; x=1783609370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UmvOJsqQeOZo6uv2hXfptlbOgxzKjfEBeTjZ5Q0Wrbk=;
 b=Xti7dCmRGe/emyFj6larF/be3LQjGY35LjBdjMpDuAlOdvf5lW92+ABy
 soEDeBOYHVetFACzR39o/73BMh7GIJXHG3mnmFcedfuO6HrrWp0D//LWS
 z5kGe3U/8tm3DotRxBzqN6bIfovDY3YMoR9PuUtqmBxvq8TN43zYYPfnb
 P98rpBZACIm4RqDOwulC7Sc2I8XE2iN0aDNb+VU9gQ2hfJrZBlgFMHv7Q
 AZ/wyLA8CUMHUF8Brho6DIEFmX98JpOo/VAVTmoIH5K2tWJqlN7PCMtYK
 b8Wwt0zleFpID3llvv/+QkrqCldYbRQd0ziBWrCK2Y36EFC1As+3RtKBD A==;
X-CSE-ConnectionGUID: i7ashGmEQiOzGhBMBmutWA==
X-CSE-MsgGUID: DKvbiIbTSR+5MsakzbmkDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65035760"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65035760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:02:49 -0700
X-CSE-ConnectionGUID: jQGMFmdxT2arjTPo/Z/l4A==
X-CSE-MsgGUID: m/zVlW8/THqyehHj9WGIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155431612"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2025 08:02:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZWJh-0003eF-2o;
 Wed, 09 Jul 2025 15:02:37 +0000
Date: Wed, 9 Jul 2025 23:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Wig Cheng <onlywig@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH 2/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink
 panel
Message-ID: <202507092231.FtZkMync-lkp@intel.com>
References: <20250708-drm-v1-2-45055fdadc8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-drm-v1-2-45055fdadc8a@gmail.com>
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

Hi LiangCheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/LiangCheng-Wang/dt-bindings-vendor-prefixes-Add-Mayqueen-name/20250708-180933
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250708-drm-v1-2-45055fdadc8a%40gmail.com
patch subject: [PATCH 2/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
config: sparc-randconfig-r112-20250709 (https://download.01.org/0day-ci/archive/20250709/202507092231.FtZkMync-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507092231.FtZkMync-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092231.FtZkMync-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tiny/pixpaper.c:85:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/tiny/pixpaper.c:86:9: sparse:   also defined here
   drivers/gpu/drm/tiny/pixpaper.c:601:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/tiny/pixpaper.c:606:10: sparse:   also defined here

vim +85 drivers/gpu/drm/tiny/pixpaper.c

    80	
    81	static const struct drm_plane_funcs pixpaper_plane_funcs = {
    82		.update_plane = drm_atomic_helper_update_plane,
    83		.disable_plane = drm_atomic_helper_disable_plane,
    84		.destroy = drm_plane_cleanup,
  > 85		.reset = drm_atomic_helper_plane_reset,
    86		DRM_GEM_SHADOW_PLANE_FUNCS,
    87	};
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
