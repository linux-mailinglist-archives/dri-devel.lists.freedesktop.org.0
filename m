Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85466C087FC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 03:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CB910EB46;
	Sat, 25 Oct 2025 01:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jif7B4+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166BC10EB46
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 01:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761355480; x=1792891480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fytU8tlszGgmAG+kPqj4fV0nEPzg/wdifyHqcSQID9E=;
 b=Jif7B4+xSDTOHhu/n5lWoj8etx+Ljqk1Rfx6Y8fjzBmQ0hPQ1usS5yF5
 5Pwpl8occz8CLw7DIjxmd8SQAqE4sf3MPrNv0wAq77N1jumiwEs/dYYlx
 dIka1qjOCOK69KTkacJKPJxC5/OIs1rbc28fjDfWSLdrk2PCnHNS8hnFN
 ftQIJHF2atKyB1kD1OE1y0Os07Dz58CdIr46tIPISZGEV+DeRypwCGuU8
 ZXh3bZsxRifGC/hRko9tXMBq5XevkDXZBl3OaCU5TnzIGL2W+eQArkAZP
 BW4bvA1wVqU3LN1ce0GpcFGrXRk4WABXZNpLyyjuH4Jegwek4USBzFU5I Q==;
X-CSE-ConnectionGUID: wE4BNJjpTMSL1i6hfgDs9w==
X-CSE-MsgGUID: W1XDYAPUSMytu/usa7S8AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63442847"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63442847"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 18:24:39 -0700
X-CSE-ConnectionGUID: ZlVDuy5LQby6ocrjtzJKMg==
X-CSE-MsgGUID: P9D4xzioRMKD5H2bURQLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="189690766"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 24 Oct 2025 18:24:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vCT1G-000F2L-2H;
 Sat, 25 Oct 2025 01:24:34 +0000
Date: Sat, 25 Oct 2025 09:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
Message-ID: <202510250945.hB9LcnfV-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-6-d3092b98130f%40gmail.com
patch subject: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
config: i386-randconfig-014-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250945.hB9LcnfV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250945.hB9LcnfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250945.hB9LcnfV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module st7571-spi uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
>> ERROR: modpost: module st7571-spi uses symbol st7571_config from namespace DRM_ST7571, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
