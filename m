Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILMxN0JLrWld1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 11:11:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F122F4A6
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 11:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7610E0FE;
	Sun,  8 Mar 2026 10:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jm+8Zf+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50410E0FE;
 Sun,  8 Mar 2026 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772964668; x=1804500668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e7VQSTQMtLAY116kGpVCvwpkviv2oXrPqJ9NjU7r+sg=;
 b=jm+8Zf+/baPy7ft2F0Vo7D06JypLZ5IpwN5V8nDQpAxMR1ON9bKq+GAK
 vAwVhH13tYv5ntrqKlEhQeceGhQWi45yiIWb7G2MV4eILB4IWbUv/P6zw
 J9bX/e6bqcnX74j/HEK4hbFOLsQS9YHBFElnzRiH9M/lp2MAK0vT+bA82
 ccHJz0Z/fMrCZXnAzN0MP7tCxyYj1448zJ9VwpZJhfCnoPW3qWNOWKG6u
 WezK14vaeFq6uMkmumKmHYdPocD2Qys2dRk5krweU6ICpBuVkOnnZ9LRu
 8tY2TuOxeSHpcmfcZVyWKU+dBX2wih7ba854z6g+04iMQ6abSkbUuJDKy g==;
X-CSE-ConnectionGUID: g5oCWI0dSXaN3kPb7DAc9A==
X-CSE-MsgGUID: O9kJm/vTQ4etIBcG8YAAbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74086084"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="74086084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 03:11:05 -0700
X-CSE-ConnectionGUID: KcTc1s/DREKLcWZRphkk/A==
X-CSE-MsgGUID: poFTVjzPQcyjufj83ZmODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="223572702"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 08 Mar 2026 03:11:02 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vzB6A-0000000031R-3zWf;
 Sun, 08 Mar 2026 10:10:58 +0000
Date: Sun, 8 Mar 2026 18:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit tests
Message-ID: <202603081744.gNhsEN20-lkp@intel.com>
References: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: 912F122F4A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.936];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,01.org:url,git-scm.com:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Disallow-initializing-entities-with-no-schedulers/20260307-012142
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306163445.97243-5-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit tests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603081744.gNhsEN20-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081744.gNhsEN20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081744.gNhsEN20-lkp@intel.com/

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
