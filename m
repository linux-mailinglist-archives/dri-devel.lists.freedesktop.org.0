Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8599A5DC28
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 13:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1401F10E068;
	Wed, 12 Mar 2025 12:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7YP92dn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5916110E068
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741781008; x=1773317008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xaWsNN1cs0HzDj9R320RuBTYp1Ti2MBG4Pn6SIigU9E=;
 b=Y7YP92dnhJBbXk27q7/HCRDjIoisSmW3aCtLoctJW1CRC6L/mFSTeSYL
 UIpKRjq4feysE0c0ZTOHcvUo2dpcLXX4KZ6/IBfHkHkooSEx7YGz+MJfZ
 YkFdmhBxbzRBQqA64ZytROf3O1mWigNhNUdEi03FCuFLh7bwvSDN9KuSr
 mHcOtLcvXKlJPXqgSRMm6c8l8MAVyi0dSssUPVLl+e8mJKAiJPTL4SnY+
 AgiT82mRxZq55tuLJaR7eGYG6AoP725IELN4Vu+UlVggKdW0BUdX1pswt
 icubsD3PE0Yy6gfuyk00Ut1K+nJyuY2gOH6DPXpnrEJzXJrtAP+S0cNdc Q==;
X-CSE-ConnectionGUID: Qa15k8uZTjizHTUpn2thCQ==
X-CSE-MsgGUID: kfmTwEuYSZ6f1gg5jOg8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60256942"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="60256942"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 05:03:26 -0700
X-CSE-ConnectionGUID: EOLlO30hSXG4eXfejVwstw==
X-CSE-MsgGUID: c6hH1Cm/TvycB4FVprr3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="151428269"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 12 Mar 2025 05:03:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tsKnt-0008Vc-1Q;
 Wed, 12 Mar 2025 12:03:18 +0000
Date: Wed, 12 Mar 2025 20:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] drm/tests: hdmi: Add max TMDS rate fallback tests
 for YUV420 mode
Message-ID: <202503121909.5IeaFEUt-lkp@intel.com>
References: <20250311-hdmi-conn-yuv-v2-7-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-hdmi-conn-yuv-v2-7-fbdb94f02562@collabora.com>
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

Hi Cristian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4423e607ff50157aaf088854b145936cbab4d560]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Ciocaltea/drm-connector-hdmi-Evaluate-limited-range-after-computing-format/20250311-190150
base:   4423e607ff50157aaf088854b145936cbab4d560
patch link:    https://lore.kernel.org/r/20250311-hdmi-conn-yuv-v2-7-fbdb94f02562%40collabora.com
patch subject: [PATCH v2 7/7] drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode
config: x86_64-randconfig-004-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121909.5IeaFEUt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121909.5IeaFEUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121909.5IeaFEUt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_kunit_helpers.h:10,
                    from drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:14:
   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c: In function 'drm_test_check_max_tmds_rate_bpc_fallback_yuv420':
>> include/kunit/test.h:776:29: error: SSE register return with SSE disabled
     776 |         const typeof(right) __right = (right);                                 \
         |                             ^~~~~~~
   include/kunit/test.h:805:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     805 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:971:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     971 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:968:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     968 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c:1337:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1337 |         KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate,
         |         ^~~~~~~~~~~~~~~
--
   In file included from include/drm/drm_kunit_helpers.h:10,
                    from drm_hdmi_state_helper_test.c:14:
   drm_hdmi_state_helper_test.c: In function 'drm_test_check_max_tmds_rate_bpc_fallback_yuv420':
>> include/kunit/test.h:776:29: error: SSE register return with SSE disabled
     776 |         const typeof(right) __right = (right);                                 \
         |                             ^~~~~~~
   include/kunit/test.h:805:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     805 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:971:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     971 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:968:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     968 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drm_hdmi_state_helper_test.c:1337:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
    1337 |         KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate,
         |         ^~~~~~~~~~~~~~~


vim +776 include/kunit/test.h

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  734  
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  735  #define KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, fmt, ...)       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  736  	KUNIT_UNARY_ASSERTION(test,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  737  			      assert_type,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  738  			      condition,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  739  			      true,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  740  			      fmt,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  741  			      ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  742  
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  743  #define KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, fmt, ...)      \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  744  	KUNIT_UNARY_ASSERTION(test,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  745  			      assert_type,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  746  			      condition,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  747  			      false,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  748  			      fmt,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  749  			      ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  750  
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  751  /*
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  752   * A factory macro for defining the assertions and expectations for the basic
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  753   * comparisons defined for the built in types.
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  754   *
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  755   * Unfortunately, there is no common type that all types can be promoted to for
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  756   * which all the binary operators behave the same way as for the actual types
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  757   * (for example, there is no type that long long and unsigned long long can
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  758   * both be cast to where the comparison result is preserved for all values). So
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  759   * the best we can do is do the comparison in the original types and then coerce
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  760   * everything to long long for printing; this way, the comparison behaves
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  761   * correctly and the printed out value usually makes sense without
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  762   * interpretation, but can always be interpreted to figure out the actual
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  763   * value.
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  764   */
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  765  #define KUNIT_BASE_BINARY_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  766  				    assert_class,			       \
064ff292aca500d Daniel Latypov  2022-01-25  767  				    format_func,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  768  				    assert_type,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  769  				    left,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  770  				    op,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  771  				    right,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  772  				    fmt,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  773  				    ...)				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  774  do {									       \
c2741453478badf Daniel Latypov  2022-01-27  775  	const typeof(left) __left = (left);				       \
c2741453478badf Daniel Latypov  2022-01-27 @776  	const typeof(right) __right = (right);				       \
2b6861e2372bac6 Daniel Latypov  2022-01-25  777  	static const struct kunit_binary_assert_text __text = {		       \
2b6861e2372bac6 Daniel Latypov  2022-01-25  778  		.operation = #op,					       \
2b6861e2372bac6 Daniel Latypov  2022-01-25  779  		.left_text = #left,					       \
2b6861e2372bac6 Daniel Latypov  2022-01-25  780  		.right_text = #right,					       \
2b6861e2372bac6 Daniel Latypov  2022-01-25  781  	};								       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  782  									       \
8bd5d74babc9255 Mickaël Salaün  2024-04-08  783  	_KUNIT_SAVE_LOC(test);						       \
97d453bc4007d4a Daniel Latypov  2022-09-30  784  	if (likely(__left op __right))					       \
97d453bc4007d4a Daniel Latypov  2022-09-30  785  		break;							       \
97d453bc4007d4a Daniel Latypov  2022-09-30  786  									       \
97d453bc4007d4a Daniel Latypov  2022-09-30  787  	_KUNIT_FAILED(test,						       \
21957f90b28f6bc Daniel Latypov  2022-01-13  788  		      assert_type,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  789  		      assert_class,					       \
a8495ad8e973cb6 Daniel Latypov  2022-09-30  790  		      format_func,					       \
697365c08679137 Daniel Latypov  2022-09-30  791  		      KUNIT_INIT_ASSERT(.text = &__text,		       \
697365c08679137 Daniel Latypov  2022-09-30  792  					.left_value = __left,		       \
697365c08679137 Daniel Latypov  2022-09-30  793  					.right_value = __right),	       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  794  		      fmt,						       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  795  		      ##__VA_ARGS__);					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  796  } while (0)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  797  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
