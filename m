Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34195B91F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA4210EB11;
	Thu, 22 Aug 2024 14:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lr+NscV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4859B10EB07;
 Thu, 22 Aug 2024 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724338576; x=1755874576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aQAsWU9NxMQHRs2YdiTiuQj5Kzr1wzJycOtT8kSih84=;
 b=lr+NscV01YFf59Zx1sRcexJPXywXQfhRP3zVaMf9EBOL6ksL8rIDodjX
 VGpykuQbISWY8s8Z/DprdNJBiiQJBx9oNMWWS6bZZVEwtm+MCYCE7+r2z
 AbJc2hUCQOjYWx6DXih4NQoCa4bupxLn2GlI49qh2i1GJ2bRnI2KqQWoS
 rVnzoopJL08WWrjcxZTLmavMwdMJhTicHZ7uuUi5LzkC1eZfe+jyfVVJi
 N2y8KbLeVEXUBfuVhEHkhCwXS326zGXaCW7qYjg33N9lEvXn9giHLx8o4
 oayi1nxSlHH7LS0SJK67jONh8nf2um7QqQ0llId/otCk0Gu7gVK852b3Q w==;
X-CSE-ConnectionGUID: HjKbvrWzS6On2ldDYgpkzg==
X-CSE-MsgGUID: a5W6Vc+hTaiD8rHu6dAOhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22913560"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22913560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 07:56:16 -0700
X-CSE-ConnectionGUID: EtCmNJcOQOW3X9AMbWZ34w==
X-CSE-MsgGUID: OgIXeNpATfqEZw1zPgEwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65668774"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2024 07:56:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sh9ES-000Csq-10;
 Thu, 22 Aug 2024 14:56:12 +0000
Date: Thu, 22 Aug 2024 22:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
Message-ID: <202408222209.vpdzQng3-lkp@intel.com>
References: <20240819205714.316380-21-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819205714.316380-21-harry.wentland@amd.com>
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

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-21-harry.wentland%40amd.com
patch subject: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
config: um-randconfig-r123-20240821 (https://download.01.org/0day-ci/archive/20240822/202408222209.vpdzQng3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222209.vpdzQng3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222209.vpdzQng3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_fixp_test.c:11:59: error: overflow in expression; result is 9'223'372'036'854'775'807 with type 'long long' [-Werror,-Winteger-overflow]
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |                                                      ~~~~~~~~~~~~^~~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                               ^~~~~
   include/kunit/test.h:725:33: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   1 error generated.


vim +11 drivers/gpu/drm/tests/drm_fixp_test.c

     8	
     9	static void drm_test_sm2fixp(struct kunit *test)
    10	{
  > 11		KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
    12	
    13		/* 1 */
    14		KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
    15	
    16		/* -1 */
    17		KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
    18	
    19		/* 0.5 */
    20		KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
    21	
    22		/* -0.5 */
    23		KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
