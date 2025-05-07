Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9ACAAD8A4
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 09:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67210E163;
	Wed,  7 May 2025 07:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6y4niVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF87B10E163
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746603903; x=1778139903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iu1EOTLAhb020bpCSuvHHrgL15BOnipScV+aaqIQksM=;
 b=W6y4niVWsDPISM1qMWqgbLNusPqGfYEWogo1MTjlkou7f9JiHZByrKE2
 9I3TCJlk3zVBr0LnbVs/v9ubrl+0rwp1O2ICsDfVKEQ5oXexhXdpdVxCs
 BVO7SpujnM2MyjZRmN5bsRxdMkH+TEsGnrCzVxtXN6yuGVRHz458YksWG
 i53M7s0KYlIcJZBPE710P+tCZNInw5JPsteipGcz/cMMc0U2EhkpTt7yl
 rPUWnkevr2XXmrtfZMo3nXMYRXNo4occRza5VLKQZZlYsW7o1DcPH1WW4
 S3PlJ3TakVEdyduFzDAxfEUAW+9nhF5ls37R2Sq3hiHyjG2nW9YkSBfQu w==;
X-CSE-ConnectionGUID: lpX/GN5fRhe6wdgFpz00Rw==
X-CSE-MsgGUID: FeNQeGzoSYa0LaumVt+ihg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52133186"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="52133186"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 00:45:02 -0700
X-CSE-ConnectionGUID: k/FupIOJSfuvz0pC7u2qRw==
X-CSE-MsgGUID: nVYJ+ab8SVqxndgaV2iasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="135875085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCZSU-0007LR-02;
 Wed, 07 May 2025 07:44:50 +0000
Date: Wed, 7 May 2025 15:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 David Lechner <david@lechnology.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own
 subdir
Message-ID: <202505071503.faytuvgs-lkp@intel.com>
References: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
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

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ef6517ac5cf971cfeaccea4238d9da7e2425b8b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-move-tiny-Sitronix-drivers-to-their-own-subdir/20250428-144721
base:   ef6517ac5cf971cfeaccea4238d9da7e2425b8b1
patch link:    https://lore.kernel.org/r/20250428-sitronix-v1-1-4e7cc0a8195a%40gmail.com
patch subject: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own subdir
config: m68k-randconfig-r121-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071503.faytuvgs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071503.faytuvgs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071503.faytuvgs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571-i2c.c:965:26: sparse: sparse: symbol 'st7571_config' was not declared. Should it be static?

vim +/st7571_config +965 drivers/gpu/drm/sitronix/st7571-i2c.c

4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  964  
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23 @965  struct st7571_panel_data st7571_config = {
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  966  	.init = st7571_lcd_init,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  967  	.constraints = {
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  968  		.min_nlines = 1,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  969  		.max_nlines = 128,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  970  		.min_ncols = 128,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  971  		.max_ncols = 128,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  972  		.support_grayscale = true,
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  973  	},
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  974  };
4b35f0f41ee2950 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  975  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
