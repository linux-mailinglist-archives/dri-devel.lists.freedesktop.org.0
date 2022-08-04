Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205158A113
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 21:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B64A15D2;
	Thu,  4 Aug 2022 19:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59942A4BBA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659639995; x=1691175995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z3ModJQjyygOq1bSG2iFU9qdViHIVqHSF09UvYLzNY8=;
 b=FNOhw3FLjfvlK8ioG/9dvjiAw/hP25+fsBZ3hYKsjdpqdOnoIHx3cnvV
 oBINmb8yFNRuM1M6Mek+9WYRH3iGDm8qMOEpCfrwnEqQzKC54wJTdlYPL
 5mSSZ6jkgW+7om3WjX9z2ex1FuIeGt9R3DbF56QYVHhvEPjFUIPwzGLR/
 b7WBB8OG6RzSXG2sBpzHBhHlq8n8+ZD4zU8iJfz8dHSyEUl5qV8MW0IhZ
 0fDhjfGijOTuULehDiadri31cAfz2+D4JhM0Hz5Wyh5wUu1bA+T9GrwYp
 giN4xASysgX+KMMk5NSoTiG3TE7gzQeEQOrGqgFb6ro2hCO4oy+J0mKWa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="290034423"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="290034423"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 12:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="745585743"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2022 12:06:31 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oJgAx-000IkF-0p;
 Thu, 04 Aug 2022 19:06:31 +0000
Date: Fri, 5 Aug 2022 03:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/cmdline-parser: Use assert when needed
Message-ID: <202208050217.VHlt1uDZ-lkp@intel.com>
References: <20220804131704.97083-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804131704.97083-2-michal.winiarski@intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Arthur Grillo <arthur.grillo@usp.br>, David Airlie <airlied@linux.ie>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>, llvm@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Michał,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next linus/master v5.19 next-20220803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/drm-cmdline-parser-Merge-negative-tests/20220804-212019
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: hexagon-randconfig-r001-20220804 (https://download.01.org/0day-ci/archive/20220805/202208050217.VHlt1uDZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8a21a5872b4bbe7bcfec5bc990d182a5c32416a2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Micha-Winiarski/drm-cmdline-parser-Merge-negative-tests/20220804-212019
        git checkout 8a21a5872b4bbe7bcfec5bc990d182a5c32416a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_cmdline_parser_test.c:72:13: warning: stack frame size (1152) exceeds limit (1024) in 'drm_cmdline_test_force_D_only_dvi' [-Wframe-larger-than]
   static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
               ^
>> drivers/gpu/drm/tests/drm_cmdline_parser_test.c:51:13: warning: stack frame size (1152) exceeds limit (1024) in 'drm_cmdline_test_force_D_only_hdmi' [-Wframe-larger-than]
   static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
               ^
>> drivers/gpu/drm/tests/drm_cmdline_parser_test.c:389:13: warning: stack frame size (1152) exceeds limit (1024) in 'drm_cmdline_test_res_bpp_refresh_force_on_digital' [-Wframe-larger-than]
   static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test)
               ^
   3 warnings generated.


vim +/drm_cmdline_test_force_D_only_dvi +72 drivers/gpu/drm/tests/drm_cmdline_parser_test.c

9f0527d22a52ff34 Maíra Canal      2022-07-08  49  
9f0527d22a52ff34 Maíra Canal      2022-07-08  50  
9f0527d22a52ff34 Maíra Canal      2022-07-08 @51  static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
9f0527d22a52ff34 Maíra Canal      2022-07-08  52  {
9f0527d22a52ff34 Maíra Canal      2022-07-08  53  	struct drm_cmdline_mode mode = { };
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  54  	const struct drm_connector connector_hdmi = {
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  55  		.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  56  	};
9f0527d22a52ff34 Maíra Canal      2022-07-08  57  	const char *cmdline = "D";
9f0527d22a52ff34 Maíra Canal      2022-07-08  58  
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  59  	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
9f0527d22a52ff34 Maíra Canal      2022-07-08  60  									  &connector_hdmi, &mode));
9f0527d22a52ff34 Maíra Canal      2022-07-08  61  	KUNIT_EXPECT_FALSE(test, mode.specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  62  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  63  	KUNIT_EXPECT_FALSE(test, mode.bpp_specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  64  
9f0527d22a52ff34 Maíra Canal      2022-07-08  65  	KUNIT_EXPECT_FALSE(test, mode.rb);
9f0527d22a52ff34 Maíra Canal      2022-07-08  66  	KUNIT_EXPECT_FALSE(test, mode.cvt);
9f0527d22a52ff34 Maíra Canal      2022-07-08  67  	KUNIT_EXPECT_FALSE(test, mode.interlace);
9f0527d22a52ff34 Maíra Canal      2022-07-08  68  	KUNIT_EXPECT_FALSE(test, mode.margins);
9f0527d22a52ff34 Maíra Canal      2022-07-08  69  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON_DIGITAL);
9f0527d22a52ff34 Maíra Canal      2022-07-08  70  }
9f0527d22a52ff34 Maíra Canal      2022-07-08  71  
9f0527d22a52ff34 Maíra Canal      2022-07-08 @72  static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
9f0527d22a52ff34 Maíra Canal      2022-07-08  73  {
9f0527d22a52ff34 Maíra Canal      2022-07-08  74  	struct drm_cmdline_mode mode = { };
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  75  	const struct drm_connector connector_dvi = {
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  76  		.connector_type = DRM_MODE_CONNECTOR_DVII,
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  77  	};
9f0527d22a52ff34 Maíra Canal      2022-07-08  78  	const char *cmdline = "D";
9f0527d22a52ff34 Maíra Canal      2022-07-08  79  
8a21a5872b4bbe7b Michał Winiarski 2022-08-04  80  	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
9f0527d22a52ff34 Maíra Canal      2022-07-08  81  									  &connector_dvi, &mode));
9f0527d22a52ff34 Maíra Canal      2022-07-08  82  	KUNIT_EXPECT_FALSE(test, mode.specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  83  	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  84  	KUNIT_EXPECT_FALSE(test, mode.bpp_specified);
9f0527d22a52ff34 Maíra Canal      2022-07-08  85  
9f0527d22a52ff34 Maíra Canal      2022-07-08  86  	KUNIT_EXPECT_FALSE(test, mode.rb);
9f0527d22a52ff34 Maíra Canal      2022-07-08  87  	KUNIT_EXPECT_FALSE(test, mode.cvt);
9f0527d22a52ff34 Maíra Canal      2022-07-08  88  	KUNIT_EXPECT_FALSE(test, mode.interlace);
9f0527d22a52ff34 Maíra Canal      2022-07-08  89  	KUNIT_EXPECT_FALSE(test, mode.margins);
9f0527d22a52ff34 Maíra Canal      2022-07-08  90  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON_DIGITAL);
9f0527d22a52ff34 Maíra Canal      2022-07-08  91  }
9f0527d22a52ff34 Maíra Canal      2022-07-08  92  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
