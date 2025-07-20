Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACBB0B388
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 06:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718010E011;
	Sun, 20 Jul 2025 04:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmAhrTkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7A710E011
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752985778; x=1784521778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3I9gdZQ5iPvFTpSVb266soPkOnEt+lW7WCaPEwb0acU=;
 b=FmAhrTkAA9v/IdO1uQkY1aqOkVM7NtXfUUchJH1vrFgyYMHcPHLIu/rl
 5nivHisHJxR/LKPdoxrHySGL7RsDVGjHWKfKCTQMD3sl9xh3jXBlyjWI4
 V00zZcbKQj/fxIAz0l7KEoJjEkaKSJnRB4MlF2Mg8HZEd3qlbaJ1ADtrZ
 kTXzNvGTB1GMAP79VqhwXf4JA32cq3VoLYuv4R4xnzTqSrEtmzozyqN+q
 DIn0DUR8cuHkelWrFNs7zu8esSqefvf51FaVWtuPBSlrR9i4vJmfLGv8u
 frjVqG555HRoNrOlxvKQyeWGhH08W7tdi5U4cr0jalu6nOEm7oX60C8pt A==;
X-CSE-ConnectionGUID: UdpHPxmzTNyA57Dgx28M1w==
X-CSE-MsgGUID: RuUBsXeFT4S4cj1rqpG+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="54335867"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="54335867"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 21:29:37 -0700
X-CSE-ConnectionGUID: Lir+THrUS0ikhY65CpnbCg==
X-CSE-MsgGUID: Ng+Y7oqpQgawuPrkWjMnMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="162841663"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 19 Jul 2025 21:29:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1udLg3-000Fvl-1b;
 Sun, 20 Jul 2025 04:29:31 +0000
Date: Sun, 20 Jul 2025 12:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Chia-I Wu <olvaffe@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/9] drm/panthor: capture GPU state for devcoredump
Message-ID: <202507201259.fG0O42j1-lkp@intel.com>
References: <20250720000146.1405060-3-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720000146.1405060-3-olvaffe@gmail.com>
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

Hi Chia-I,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20250718]
[cannot apply to linus/master v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-I-Wu/drm-panthor-add-devcoredump-support/20250720-080312
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250720000146.1405060-3-olvaffe%40gmail.com
patch subject: [PATCH 2/9] drm/panthor: capture GPU state for devcoredump
config: x86_64-buildonly-randconfig-004-20250720 (https://download.01.org/0day-ci/archive/20250720/202507201259.fG0O42j1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507201259.fG0O42j1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201259.fG0O42j1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:24 Enum value 'PANTHOR_COREDUMP_GROUP' not described in enum 'panthor_coredump_mask'
>> Warning: drivers/gpu/drm/panthor/panthor_coredump.c:24 Enum value 'PANTHOR_COREDUMP_GPU' not described in enum 'panthor_coredump_mask'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:32 struct member 'reason' not described in 'panthor_coredump_header'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:32 struct member 'timestamp' not described in 'panthor_coredump_header'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'group' not described in 'panthor_coredump'
>> Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'gpu' not described in 'panthor_coredump'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'data' not described in 'panthor_coredump'
   Warning: drivers/gpu/drm/panthor/panthor_coredump.c:58 struct member 'size' not described in 'panthor_coredump'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
