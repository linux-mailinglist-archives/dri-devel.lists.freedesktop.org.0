Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6485419E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 03:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F66010E20D;
	Wed, 14 Feb 2024 02:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nF3bsTtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B639D10E1F7;
 Wed, 14 Feb 2024 02:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707878825; x=1739414825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xaoRT3hyyhCIw73e6wBC1dBj93aQsZiOCh3esJJmyS0=;
 b=nF3bsTtjaRUhFQjjnpYJ0EUYtXR7f28RLhNcRRxfA16AVbYDyb/mGR/X
 bSj3O5AfGgk6Kml338PzmSvtGgYcYinRHqhEY3oX0Pta03+immzd7sHBB
 ltBaRzt9uIkIyZeIkGj4AUmhT3LODDsIRzPmeNZIZJMKYvEjlISdeRU7s
 giJjKpqYwjXfCr/T5Z9N1gpj+dpuK1DOzVJXHyapC/nPSTdbZ1TAH92mD
 we5b30gZAiXj9pRbtIIsWjhkW0O8R0tkuUw+firJaIlXQnv/yWxFE8CaV
 ECFrAi1hrJC21M7/c1rS7h8UT5dMy4bdaYlvh/kRtppiIe8pNRtSfaZoq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27360968"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="27360968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 18:47:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="26233177"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2024 18:46:58 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ra5IV-0008Ek-0v;
 Wed, 14 Feb 2024 02:46:55 +0000
Date: Wed, 14 Feb 2024 10:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 arthurgrillo@riseup.net, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: Re: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
Message-ID: <202402141056.LzCSLaOT-lkp@intel.com>
References: <20240213064835.139464-2-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213064835.139464-2-uma.shankar@intel.com>
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

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next next-20240213]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-2-uma.shankar%40intel.com
patch subject: [PATCH 01/28] [NOT FOR REVIEW] drm: color pipeline base work
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240214/202402141056.LzCSLaOT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141056.LzCSLaOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141056.LzCSLaOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_fixp_test.c:11:59: warning: overflow in expression; result is 9223372036854775807 with type 'long long' [-Winteger-overflow]
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |                                                                  ^
   1 warning generated.
--
>> drivers/gpu/drm/vkms/vkms_composer.c:95:5: warning: no previous prototype for function 'lerp_u16' [-Wmissing-prototypes]
      95 | u16 lerp_u16(u16 a, u16 b, s64 t)
         |     ^
   drivers/gpu/drm/vkms/vkms_composer.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | u16 lerp_u16(u16 a, u16 b, s64 t)
         | ^
         | static 
>> drivers/gpu/drm/vkms/vkms_composer.c:105:5: warning: no previous prototype for function 'get_lut_index' [-Wmissing-prototypes]
     105 | s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
         |     ^
   drivers/gpu/drm/vkms/vkms_composer.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
         | ^
         | static 
>> drivers/gpu/drm/vkms/vkms_composer.c:167:6: warning: no previous prototype for function 'apply_3x4_matrix' [-Wmissing-prototypes]
     167 | void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
         |      ^
   drivers/gpu/drm/vkms/vkms_composer.c:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     167 | void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/gpu/drm/vkms/vkms_colorop.c:11:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      11 | const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
         | ^~~~~
>> drivers/gpu/drm/vkms/vkms_colorop.c:11:11: warning: no previous prototype for function 'vkms_initialize_tf_pipeline' [-Wmissing-prototypes]
      11 | const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
         |           ^
   drivers/gpu/drm/vkms/vkms_colorop.c:11:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
      11 | const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
         |       ^
         | static 
>> drivers/gpu/drm/vkms/vkms_colorop.c:80:5: warning: no previous prototype for function 'vkms_initialize_colorops' [-Wmissing-prototypes]
      80 | int vkms_initialize_colorops(struct drm_plane *plane)
         |     ^
   drivers/gpu/drm/vkms/vkms_colorop.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | int vkms_initialize_colorops(struct drm_plane *plane)
         | ^
         | static 
   3 warnings generated.


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
