Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF5B161C8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8010E09A;
	Wed, 30 Jul 2025 13:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dojVBOLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E985010E09A;
 Wed, 30 Jul 2025 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753883437; x=1785419437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ifIMrBtF5ufMRPUqGdpwMP/SvTYeKCCpB+qZwdbtgxQ=;
 b=dojVBOLN5/xnGiB2oZ83vHjPna6fuWkhVI2hu0wbbeqSbVM8mBD1iME5
 2IvaUiWv0a1XMsY/R0NfSD6YyeJRgSgudhrulHsUAmSwuaunfCEru0Bny
 5HEzu5efzveewbaFZmNZ8YtA6QvpXo3YjNap4ex57gil97d7o96JgZBA1
 e4gwl9alze4RECRqJc1ytiNnkW7tK4DzJdM7fx+AyGsnWr/c6V6pe8+Nu
 gzYtLo3Zu2pSQLxd5JtvA/XK/+kUcaGBvBvze2cOh9VNjuxNETAAOyQqj
 Ou4fyiRPQzZlNwJPfXXFfw+8OyJPWUIWttu1Mnj2d8KpjvzQ2uyqFJz3K w==;
X-CSE-ConnectionGUID: jh+BHyUIQNiJXKPfLxOE4Q==
X-CSE-MsgGUID: JERj0lPgRROsiPoLb/kO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56331426"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56331426"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:50:32 -0700
X-CSE-ConnectionGUID: 43tHoqJqSGyDw3huzPrupQ==
X-CSE-MsgGUID: 4qJf4K0QTxGvRBFc0JAQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193978560"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 30 Jul 2025 06:50:28 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uh7CL-0002nY-2G;
 Wed, 30 Jul 2025 13:50:25 +0000
Date: Wed, 30 Jul 2025 21:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Marie Zhussupova <marievic@google.com>, rmoar@google.com,
 davidgow@google.com, shuah@kernel.org, brendan.higgins@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, elver@google.com,
 dvyukov@google.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marie Zhussupova <marievic@google.com>
Subject: Re: [PATCH 2/9] kunit: Introduce param_init/exit for parameterized
 test shared context management
Message-ID: <202507302114.xQU4zmX5-lkp@intel.com>
References: <20250729193647.3410634-3-marievic@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729193647.3410634-3-marievic@google.com>
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

Hi Marie,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/kunit]
[also build test ERROR on shuah-kselftest/kunit-fixes drm-xe/drm-xe-next linus/master v6.16 next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250729193647.3410634-3-marievic%40google.com
patch subject: [PATCH 2/9] kunit: Introduce param_init/exit for parameterized test shared context management
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250730/202507302114.xQU4zmX5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507302114.xQU4zmX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507302114.xQU4zmX5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing fields `param_exit` and `param_init` in initializer of `kunit_case`
   --> rust/kernel/kunit.rs:200:5
   |
   200 |     kernel::bindings::kunit_case {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `param_exit` and `param_init`
--
>> error[E0063]: missing fields `param_exit` and `param_init` in initializer of `kunit_case`
   --> rust/kernel/kunit.rs:219:5
   |
   219 |     kernel::bindings::kunit_case {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `param_exit` and `param_init`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
