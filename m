Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A505A93C9B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A7F10E245;
	Fri, 18 Apr 2025 18:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePEFyP2g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730B810E23F;
 Fri, 18 Apr 2025 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744999984; x=1776535984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QmVNNm0yCXUzgegJjSuzQSEat+pAuOJqxBaJs9whs1k=;
 b=ePEFyP2gVbIzrwgCfKg/eppAeRk42OM86JRHYLesaMHnM7NjsqKJJhGT
 floRlfeRo2JOsyDHDAgOro0P/Yx1OC9x86hvSwzNubm+fZFT+03YRnokv
 pdOnGmXohZWkQGNzXe/rc6QmAq/cPOWG/lZxizoyEByPMYpmaP9Olt/nv
 r8J949eGsf59Th4ZZIgw1V5mwNa4a2+fSCCv/SFOPZtd+oGHgfqe9HuDU
 lCJ6/Lxu3Iq/abdKAXJv31ayeRd8myO4UwlTEza3L1/TzMaze64sVflfq
 mARQQhFeo28YnA74DFJRY309u/+dPc7D2afF9vfd89FMun97ibNiWIe6D g==;
X-CSE-ConnectionGUID: ceyWP6orRM+4YijHaBoqFQ==
X-CSE-MsgGUID: BkCOSy/FQeSxA7gR9YicDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57296080"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="57296080"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 11:13:02 -0700
X-CSE-ConnectionGUID: /IqsmET/QzyMnsLY4JUGdg==
X-CSE-MsgGUID: i6LVBPnvQBGrpL7TnOsFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="131041341"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2025 11:12:57 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u5qCt-0003Ax-12;
 Fri, 18 Apr 2025 18:12:55 +0000
Date: Sat, 19 Apr 2025 02:12:44 +0800
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
Message-ID: <202504190154.lSj16P1a-lkp@intel.com>
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
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15-rc2 next-20250417]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-py-don-t-create-pyc-files/20250416-155336
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250419/202504190154.lSj16P1a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190154.lSj16P1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190154.lSj16P1a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: -none: command not found

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
