Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A7C0B4FA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 23:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DD310E039;
	Sun, 26 Oct 2025 22:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oECiaYJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672BA10E039;
 Sun, 26 Oct 2025 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761516192; x=1793052192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h67yTNf38kMIXX7w3vfQFFDc72JfJPyGmsqEuWrQb58=;
 b=oECiaYJLF8kdYnn1nZ9MIXqHpyoXbZWlC0I2pmxhAoe9f9mjrN6TF11D
 g5rmWmJCH+hNfvgQAQwsLR/+/4ZfOJCEo/9wXSjFOEUbXtqdIz8+LM0e+
 oCw3rf0ejU9YwGcZVIfBzvwmW1MYaT4+bv+MobcH9Nl7KeMuAm5zLWgsy
 jdUw6w0WJfBUglCIFLC3jNyXIIF2JUX6/8odvVB+erGt2lLj/VGs1PT9m
 l7dQfiW1h1SssWmyeu9MehUOmQ4QfMwUpll48mAN+GZwG4gPwJ4QjS5WM
 y/9xiwGnOd6/inXMRib7LWY9GLCRF6ODU6jwsq0OesP5PX7MhR/MQBlpm g==;
X-CSE-ConnectionGUID: 4E4X8A2iTxmJBL5XtZTUxA==
X-CSE-MsgGUID: VlFUHXVVRAuX/G/8ZVqFyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67244529"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="67244529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 15:03:11 -0700
X-CSE-ConnectionGUID: MuGU6tBUSNyOslJojnBOrw==
X-CSE-MsgGUID: psnqr00PSMCEcf5dNR+PMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="185247592"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2025 15:03:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vD8pP-000GMT-0J;
 Sun, 26 Oct 2025 22:03:07 +0000
Date: Mon, 27 Oct 2025 06:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v3 03/27] drm/sched: Add some scheduling quality unit tests
Message-ID: <202510270517.T5yR8FOv-lkp@intel.com>
References: <20251024160800.79836-4-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024160800.79836-4-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251024]
[also build test ERROR on v6.18-rc2]
[cannot apply to drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc2 v6.18-rc1 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Consolidate-entity-run-queue-management/20251025-001017
base:   next-20251024
patch link:    https://lore.kernel.org/r/20251024160800.79836-4-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v3 03/27] drm/sched: Add some scheduling quality unit tests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251027/202510270517.T5yR8FOv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270517.T5yR8FOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270517.T5yR8FOv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:676:10: error: initializer element is not a compile-time constant
                                 drm_sched_scheduler_two_clients_attr),
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:224:13: note: expanded from macro 'KUNIT_CASE_PARAM_ATTR'
                     .attr = attributes, .module_name = KBUILD_MODNAME}
                             ^~~~~~~~~~
   1 error generated.


vim +676 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

   672	
   673	static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
   674		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
   675				      drm_sched_scheduler_two_clients_gen_params,
 > 676				      drm_sched_scheduler_two_clients_attr),
   677		{}
   678	};
   679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
