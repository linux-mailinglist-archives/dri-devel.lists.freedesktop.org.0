Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C9AF8E85
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDE710E9C0;
	Fri,  4 Jul 2025 09:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLDEqASb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EBB10E9C0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751621256; x=1783157256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xsewCoZTz13Afl0fYgBbzrqkR2165Vy3a+LpTEr+0cY=;
 b=SLDEqASbqKMNZa6w7zMX5jlOUiUJTLvlF/YD7oJSOMbN9n26HR8jW7S8
 n/+YdJbcymZxEAz0fTHMfLr9O0ql3QUOYalcAAg0/0rMXW/qniNjYiO5J
 RX+C4WOGjRRmELrsQeAiEoCu4nT796SL3eRhfXTqtRnoc4s93CV8D/2A4
 DW/PrZ5DGnbJ2OJYwFfPFvQqdhPmjM/yNH0v/z4wqRPPB3DF0C3S8sgKp
 uwQmhxvWDiiCwqUrCgFXYC0aFzsqM1qGj0YQZbnfr9AteaRPo7tcR/sWY
 dIJeczGTI370y3eR8OdDY+I9bVtKWOL8ZmvbxyZZHcgE4z1opdq8OsZ8F Q==;
X-CSE-ConnectionGUID: zvfypY33S6u0t5CGEHtjJA==
X-CSE-MsgGUID: 70Gurt6lQhiPKsKuG7HJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65406791"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="65406791"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:27:36 -0700
X-CSE-ConnectionGUID: oKzAvXfKRAWMOXa+tKIBkg==
X-CSE-MsgGUID: OZdC7sXeSnWJyAK76jyCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154013038"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 02:27:33 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uXche-0003Y9-1X;
 Fri, 04 Jul 2025 09:27:30 +0000
Date: Fri, 4 Jul 2025 17:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Caterina Shablia <caterina.shablia@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 Caterina Shablia <caterina.shablia@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] drm/panthor: Add support for repeated mappings
Message-ID: <202507041742.rHigXm3n-lkp@intel.com>
References: <20250703152908.16702-9-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703152908.16702-9-caterina.shablia@collabora.com>
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

Hi Caterina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250703]
[cannot apply to linus/master v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caterina-Shablia/drm-gpuvm-Kill-drm_gpuva_init/20250704-002914
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250703152908.16702-9-caterina.shablia%40collabora.com
patch subject: [PATCH v2 7/7] drm/panthor: Add support for repeated mappings
config: x86_64-buildonly-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041742.rHigXm3n-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041742.rHigXm3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041742.rHigXm3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/panthor/panthor_mmu.c:220 Excess struct member 'bo_repeat_range' description in 'panthor_vm_op_ctx'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
