Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE80A915F8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DFA10E18C;
	Thu, 17 Apr 2025 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyqFM676";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A507D10E18A;
 Thu, 17 Apr 2025 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744876775; x=1776412775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xNxT5Re1oftjzyxR5Ank9LUV80Pp7dElP2hd70zAJT8=;
 b=DyqFM676w5aXW51tR+z48smXpg837oMVLamEUb8OoFQWebPhwktu9lJZ
 b1s20xzfZW3AtUUqImQ2vkgGTCwMrV+X+RdEFjhc6Bor4y/pXbDLFZA9t
 r9X/KTEqoOAFg3e/kroIHP9DteiCtojNYe7F5RKhG2iE1RJ0vF4T8OH5z
 DgHAdGTqsZSMoS2sPWHg2qVPcV2MX9OhLLFEOAp/hE7QTgnPuyo2Czygt
 kjcLQFPxQTZhbdndNYwGQvCaO2jhpeDPAQMRo1zjHPAftAOmF8QwWM7pM
 kr/dOrAzBu1I/oohUCi/WqTpx7hNa7d75l+nVt924ve4ss2vDnwuKtOug g==;
X-CSE-ConnectionGUID: WNTBq/tGR5q/+ABA83jmfg==
X-CSE-MsgGUID: P3eHggj9SXuACoiRC4DdRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68944178"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="68944178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:59:35 -0700
X-CSE-ConnectionGUID: 8VKL1ubsSFSs14j6RVHMcw==
X-CSE-MsgGUID: mYT5ZLBjQ8iTNwGWZY/5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="134825813"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 17 Apr 2025 00:59:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u5K9f-000LsM-0P;
 Thu, 17 Apr 2025 07:59:27 +0000
Date: Thu, 17 Apr 2025 15:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <202504171512.FiYw2rGC-lkp@intel.com>
References: <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
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

Hi Mauro,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15-rc2 next-20250416]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-py-don-t-create-pyc-files/20250416-155336
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
config: csky-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171512.FiYw2rGC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171512.FiYw2rGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171512.FiYw2rGC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: -none: not found
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 127 shuffle=2754938148
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1276: prepare0] Error 2 shuffle=2754938148
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2754938148
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2754938148
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
