Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8DFC08C4C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 08:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE9C10E029;
	Sat, 25 Oct 2025 06:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhY4Z2QQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705C10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761374636; x=1792910636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Xd2T2aNTl8c9Ga1fQDjXYNrqheu8xPazvqz7CR1xeE=;
 b=fhY4Z2QQ+OTMBrkdcP91zEF9RU2+fSNE2Z1fnYZgCuaN6ISU5WNRCCrX
 6nqMek41uyzi7toJ7Qokt3cCrWqvk8DwzsBFLB0+ZrvQWBmuv1ql811RD
 gox52+XHbjDaBAYbVdL2WIfzsFjCaj78p+do+QfWAqLEnhpLIonux6ogE
 jWY0sAyZ15z7QTQgK1vvX5pi9AB7QpXBsfanpuw72e3jk5oCM6+ZySRRr
 4MMTT41yGSo8cE9JVuU1Df7ltKHEjUU2wMPinqb0HGiYpd8u115MtZJza
 MzCyyoDa57V8ked2YoLoLYDXEIW/76nxlS6fEWJVDGsbV38mjQfqZLGcs A==;
X-CSE-ConnectionGUID: +D8i5j2ORcKgaoHkMXb66w==
X-CSE-MsgGUID: H9IVBNXgT7eLQtPqCRcHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63450691"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63450691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 23:43:56 -0700
X-CSE-ConnectionGUID: GPcfqCRKSqWteCHwySs0PA==
X-CSE-MsgGUID: y5IAKaXKSUOW6cbBl86z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="184671266"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 24 Oct 2025 23:43:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vCY0F-000F9d-1c;
 Sat, 25 Oct 2025 06:43:51 +0000
Date: Sat, 25 Oct 2025 14:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
Message-ID: <202510251430.rl42LCVH-lkp@intel.com>
References: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>
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

[auto build test WARNING on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-6-d3092b98130f%40gmail.com
patch subject: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
config: x86_64-randconfig-005-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251430.rl42LCVH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251430.rl42LCVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251430.rl42LCVH-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module st7571-i2c uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
WARNING: modpost: module st7571-i2c uses symbol st7571_config from namespace DRM_ST7571, but does not import it.
>> WARNING: modpost: module st7571-spi uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
>> WARNING: modpost: module st7571-spi uses symbol st7571_config from namespace DRM_ST7571, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
