Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7588991644
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 13:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D67210E094;
	Sat,  5 Oct 2024 11:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+Wf7GbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80DD10E094;
 Sat,  5 Oct 2024 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728126189; x=1759662189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LztOZBa62z/JZAIFn1dNVbjpK8iT7Wh/st5qpGDrZSU=;
 b=K+Wf7GbZKjQfPLSGhe/sQALF2ad/1tFPIDrAiBvOyQrQZmgeJtWuUvDA
 +ol83jWTzwome2xtx8dtUDc9gRdLMfTTlFVlIF4H+desQkbz551WOB77P
 bAz2xsh09VTqUkRkJM23E4wOU1L6GBa8x7ht7puKm8D01nEJM3gNqWBw9
 StLyZU3oshC/YoJ3RY1BwyRkHPU6TXd0yy9H2/RE0QyPE9uTGkhy0I0Y6
 ExSxKBY8D0gbpmT6fmSyniIYzVEKS2DJZ6+dBKDUAeSYFXbX4Q89HcK6e
 8nxR+9FVfF6swUEl7ybO4x3BgjdqPiTvHlqa5y+7PFYVTlKKelDFSwJVM g==;
X-CSE-ConnectionGUID: 73Iq1n9zSyW8uVyCfwKodw==
X-CSE-MsgGUID: CtTWPfsNThSSl55UyRdcpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37940805"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="37940805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 04:03:07 -0700
X-CSE-ConnectionGUID: 57iTqoHXTgGMxujyYs6uZw==
X-CSE-MsgGUID: KSB+9HbXQH+xnT9VY4uxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="75086972"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2024 04:03:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sx2Yy-0002sY-1A;
 Sat, 05 Oct 2024 11:03:04 +0000
Date: Sat, 5 Oct 2024 19:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v6 21/44] drm/vkms: Add tests for CTM handling
Message-ID: <202410051850.cGJoBKkg-lkp@intel.com>
References: <20241003200129.1732122-22-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-22-harry.wentland@amd.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-22-harry.wentland%40amd.com
patch subject: [PATCH v6 21/44] drm/vkms: Add tests for CTM handling
config: csky-randconfig-r112-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051850.cGJoBKkg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410051850.cGJoBKkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051850.cGJoBKkg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/vkms/tests/vkms_color_test.c:34:29: sparse: sparse: symbol 'test_linear_lut' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_test.c:193:32: sparse: sparse: symbol 'test_matrix_3x4_50_desat' was not declared. Should it be static?
>> drivers/gpu/drm/vkms/tests/vkms_color_test.c:259:32: sparse: sparse: symbol 'test_matrix_3x4_bt709_enc' was not declared. Should it be static?

vim +/test_matrix_3x4_50_desat +193 drivers/gpu/drm/vkms/tests/vkms_color_test.c

   192	
 > 193	const struct drm_color_ctm_3x4 test_matrix_3x4_50_desat = { {
   194		FIXPT_HALF, FIXPT_QUARTER, FIXPT_QUARTER, 0,
   195		FIXPT_QUARTER, FIXPT_HALF, FIXPT_QUARTER, 0,
   196		FIXPT_QUARTER, FIXPT_QUARTER, FIXPT_HALF, 0
   197	} };
   198	
   199	static void vkms_color_ctm_3x4_50_desat(struct kunit *test)
   200	{
   201		struct pixel_argb_s32 ref, out;
   202	
   203		/* full white */
   204		ref.a = 0xffff;
   205		ref.r = 0xffff;
   206		ref.g = 0xffff;
   207		ref.b = 0xffff;
   208	
   209		memcpy(&out, &ref, sizeof(out));
   210		apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
   211	
   212		KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
   213	
   214		/* full black */
   215		ref.a = 0xffff;
   216		ref.r = 0x0;
   217		ref.g = 0x0;
   218		ref.b = 0x0;
   219	
   220		memcpy(&out, &ref, sizeof(out));
   221		apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
   222	
   223		KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
   224	
   225		/* 50% grey */
   226		ref.a = 0xffff;
   227		ref.r = 0x8000;
   228		ref.g = 0x8000;
   229		ref.b = 0x8000;
   230	
   231		memcpy(&out, &ref, sizeof(out));
   232		apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
   233	
   234		KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
   235	
   236		/* full red to 50% desat */
   237		ref.a = 0xffff;
   238		ref.r = 0x8000;
   239		ref.g = 0x4000;
   240		ref.b = 0x4000;
   241	
   242		out.a = 0xffff;
   243		out.r = 0xffff;
   244		out.g = 0x0;
   245		out.b = 0x0;
   246	
   247		apply_3x4_matrix(&out, &test_matrix_3x4_50_desat);
   248	
   249		KUNIT_EXPECT_MEMEQ(test, &ref, &out, sizeof(out));
   250	}
   251	
   252	/*
   253	 * BT.709 encoding matrix
   254	 *
   255	 * Values printed from within IGT when converting
   256	 * igt_matrix_3x4_bt709_enc to the fixed-point format expected
   257	 * by DRM/KMS.
   258	 */
 > 259	const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_enc = { {
   260		0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
   261		0x800000001993b3a0ull, 0x800000005609fe80ull, 0x000000006f9db200ull, 0,
   262		0x000000009d70a400ull, 0x800000008f011100ull, 0x800000000e6f9330ull, 0
   263	} };
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
