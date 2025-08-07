Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB70B1D3AB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC2410E0D6;
	Thu,  7 Aug 2025 07:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0ovFJNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6410E0D6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754552965; x=1786088965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zuI1C1HRVJfMkiRebwbzbuKkjROv+QYbG6sOYJiM1KQ=;
 b=N0ovFJNBgoSzqXoX4HOtEwcHsgDJTmPjVpttldlqqop81ndVoIc5g87x
 WScfFy+lzopXU+Oth4olTax0TTbxsUwz3EiA/cM+XhPYdPwrR8kBH19WL
 BFaDmJ35cJWNSBKXaeuTRAEKmKwdSaERZpoD9VhQ8uR8GGENzYQXbYMHo
 TILGvHmKQazV5pr+1MluMl4b0rFjq8XVpatu/jU+xa/hQrzVUOZe0G3Wi
 ROOgdoKC3k/h6Me0fWheaZn91WHw6KdyOUkLHltCBvqYaxmaQI97gNcCm
 5tmV7T3o5sLSCumCbKXItE0DYPU7e4iurfq7qPGEywBwR+Z/r7kVPhg8M g==;
X-CSE-ConnectionGUID: HrSjIYBEThqDonnoChK3Vw==
X-CSE-MsgGUID: 6i7qo4iXQ6Gc7gi2GIfQLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56797709"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56797709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 00:49:24 -0700
X-CSE-ConnectionGUID: zFWSQLVWRp6rIWqOCSweeQ==
X-CSE-MsgGUID: 468e9o/TT3K9ahfZKP6BQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165355844"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 00:49:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ujvMn-0002X4-0C;
 Thu, 07 Aug 2025 07:49:01 +0000
Date: Thu, 7 Aug 2025 15:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 1/3] drm: Add driver for Sitronix ST7920 LCD displays
Message-ID: <202508071554.hJ1Avou0-lkp@intel.com>
References: <20250806-st7920-v1-1-64ab5a34f9a0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-st7920-v1-1-64ab5a34f9a0@gmail.com>
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

Hi Iker,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c571cb70e1ed43ee543c70151e61a001ab2eefa2]

url:    https://github.com/intel-lab-lkp/linux/commits/Iker-Pedrosa/drm-Add-driver-for-Sitronix-ST7920-LCD-displays/20250806-205210
base:   c571cb70e1ed43ee543c70151e61a001ab2eefa2
patch link:    https://lore.kernel.org/r/20250806-st7920-v1-1-64ab5a34f9a0%40gmail.com
patch subject: [PATCH 1/3] drm: Add driver for Sitronix ST7920 LCD displays
config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_ST7920-0-0 (https://download.01.org/0day-ci/archive/20250807/202508071554.hJ1Avou0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071554.hJ1Avou0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071554.hJ1Avou0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_ST7920
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_ST7920 [=y] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
