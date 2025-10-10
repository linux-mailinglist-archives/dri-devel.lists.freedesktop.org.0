Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A619BCC6D4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E1B10EBAC;
	Fri, 10 Oct 2025 09:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVJQ2kas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486DA10EBA4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760089640; x=1791625640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cmth7AsQ5hYd+/trQ/YE/rNwKfYfvIoCEgHLGdJc4QY=;
 b=jVJQ2kasY6G3TlWSC3rl8AlwAgMQaM/5aRtt5wJeFazX+PNVOueRc0xc
 U2pSPlqXOX5M/hQZV/GBHfEben2ONrTL6iJG0kWJDvw3S3OTomQfVe6Km
 cWSJwpz4SQwaULe5yyKwt02QuDqu5wqXPg5Yz+bFm77QzS2k5AqkEdgT4
 vhUOMjv6LTPiM24gd7bcM5a2P6qblUVe2ymM5SGrsXVibpabkRAj3CljG
 BGjpNE4idyNmt+dls6xletuq2/3J3ZPtfgC7JgENEsl2LXrOE52gTSo/i
 vq9VZLRFaU3XulgQoI3KalgrkKie2O0A8neQy3hsL5EUJNGmmQ39xLTtT g==;
X-CSE-ConnectionGUID: xlLEz+cYQA2wVlnyOVlXxQ==
X-CSE-MsgGUID: 0ZLIpRMxRXuK4h16ortKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62336433"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62336433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:47:20 -0700
X-CSE-ConnectionGUID: tkWsKG3wSdODMtCjbk8BYw==
X-CSE-MsgGUID: TNnBExx5QX+OrGMKT2yvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180626648"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 02:47:17 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v79iU-0002WZ-2y;
 Fri, 10 Oct 2025 09:47:14 +0000
Date: Fri, 10 Oct 2025 17:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 04/16] drm/bridge: Switch private_obj initialization to
 reset
Message-ID: <202510101750.mdgz7wUC-lkp@intel.com>
References: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-4-805ab43ae65a@kernel.org>
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

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-atomic-Add-dev-pointer-to-drm_private_obj/20251009-195815
base:   aa1c2b073ad23847dd2e7bdc7d30009f34ed7f59
patch link:    https://lore.kernel.org/r/20251008-drm-private-obj-reset-v1-4-805ab43ae65a%40kernel.org
patch subject: [PATCH 04/16] drm/bridge: Switch private_obj initialization to reset
config: i386-randconfig-011-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101750.mdgz7wUC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101750.mdgz7wUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101750.mdgz7wUC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1 shuffle=982479975
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1917: modules_install] Error 2 shuffle=982479975
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=982479975
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=982479975
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
