Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465675B622
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 20:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF9C10E5FA;
	Thu, 20 Jul 2023 18:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49B310E5FA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689876480; x=1721412480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7dMx1vxlj/xh0eN5dm79YGMH5t91q+NabCzXn9iJnnM=;
 b=JRAxraO84Pegi/d6WFgPr7hLBxVP9c6R0F6ZwrYJybDBKquuyTTxIAjM
 UGF3GoWn2Iaq4GVnquB7F1eUdjsQIZ+SWNj8ACabnSFGykuhCobl+5SSE
 SYxRgsRjDoKDrJQc5M9ubbwSqTKlHxfZ0+8YfsfhfOAU7HrwDdbneHYjo
 3k9sjZotQCjQ2Po69Z012q7RdED2spwkxkRjW10l+jUIbaZZ/nFQOtYYs
 xy23YwhRq+TmDnn9S0qz4mtlyqYS9JDsPwTVdjAf38/o2ZrtBTcQH+t5Q
 tbDvt0k4PTfMLZjJwtlBEvCAvYVd08a9odCOIeu5hQdhWH1dc9G900jTC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370419706"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="370419706"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 11:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848532395"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="848532395"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 11:06:21 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMY2f-0006Ll-0K;
 Thu, 20 Jul 2023 18:06:21 +0000
Date: Fri, 21 Jul 2023 02:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH v2 06/11] drm/tests: helpers: Create a helper to allocate
 an atomic state
Message-ID: <202307210124.Ur3UNuxZ-lkp@intel.com>
References: <20230720-kms-kunit-actions-rework-v2-6-175017bd56ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-6-175017bd56ab@kernel.org>
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
Cc: David Gow <davidgow@google.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>, llvm@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>,
 Maxime Ripard <mripard@kernel.org>, linux-kselftest@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c58c49dd89324b18a812762a2bfa5a0458e4f252]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Switch-to-kunit-actions/20230720-191901
base:   c58c49dd89324b18a812762a2bfa5a0458e4f252
patch link:    https://lore.kernel.org/r/20230720-kms-kunit-actions-rework-v2-6-175017bd56ab%40kernel.org
patch subject: [PATCH v2 06/11] drm/tests: helpers: Create a helper to allocate an atomic state
config: arm64-randconfig-r022-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210124.Ur3UNuxZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210124.Ur3UNuxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210124.Ur3UNuxZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_kunit_helpers.c:54:6: warning: cast from 'void (*)(struct platform_driver *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      54 |                                         (kunit_action_t *)platform_driver_unregister,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_kunit_helpers.c:62:6: warning: cast from 'void (*)(struct platform_device *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      62 |                                         (kunit_action_t *)platform_device_put,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_kunit_helpers.c:70:6: warning: cast from 'void (*)(struct platform_device *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      70 |                                         (kunit_action_t *)platform_device_del,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_kunit_helpers.c:90:9: warning: cast from 'void (*)(struct platform_device *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      90 |                              (kunit_action_t *)platform_device_unregister,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_kunit_helpers.c:94:9: warning: cast from 'void (*)(struct platform_driver *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
      94 |                              (kunit_action_t *)platform_driver_unregister,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/tests/drm_kunit_helpers.c:192:6: warning: cast from 'void (*)(struct drm_atomic_state *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     192 |                                         (kunit_action_t *)drm_atomic_state_put,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +192 drivers/gpu/drm/tests/drm_kunit_helpers.c

   164	
   165	/**
   166	 * drm_kunit_helper_atomic_state_alloc - Allocates an atomic state
   167	 * @test: The test context object
   168	 * @drm: The device to alloc the state for
   169	 * @ctx: Locking context for that atomic update
   170	 *
   171	 * Allocates a empty atomic state.
   172	 *
   173	 * The state is tied to the kunit test context, so we must not call
   174	 * drm_atomic_state_put() on it, it will be done so automatically.
   175	 *
   176	 * Returns:
   177	 * An ERR_PTR on error, a pointer to the newly allocated state otherwise
   178	 */
   179	struct drm_atomic_state *
   180	drm_kunit_helper_atomic_state_alloc(struct kunit *test,
   181					    struct drm_device *drm,
   182					    struct drm_modeset_acquire_ctx *ctx)
   183	{
   184		struct drm_atomic_state *state;
   185		int ret;
   186	
   187		state = drm_atomic_state_alloc(drm);
   188		if (!state)
   189			return ERR_PTR(-ENOMEM);
   190	
   191		ret = kunit_add_action_or_reset(test,
 > 192						(kunit_action_t *)drm_atomic_state_put,
   193						state);
   194		if (ret)
   195			return ERR_PTR(ret);
   196	
   197		state->acquire_ctx = ctx;
   198	
   199		return state;
   200	}
   201	EXPORT_SYMBOL_GPL(drm_kunit_helper_atomic_state_alloc);
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
