Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44958A135
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 21:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AA9A1ECF;
	Thu,  4 Aug 2022 19:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99339A1C43
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659641195; x=1691177195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FFkh05D0laBSIIuyMx/AMAlaJ44ZLXKgW5JbzHu3SPQ=;
 b=MykhBgj0An78LIqimtT2o9hXU8u2gZxJ+itcuIOOR3e1tu+uYRO76o9Z
 inDNxtNjytmEh83oZ7tVNM7kHx8B5TunbKeYvPRKcITMNSh6MzJ7rt3kR
 mh79KPBCxWC6EadhBf4WSQUZsehAchEqdlfLSfFjoY357T3jSrjxb2cFp
 cFRmJRPjag2IITSDK4gv1bU3GH6Igdi/BEStzP0GZPqkSmjlm1wFDdUU/
 Q6YRw2rVI0L6uqX/TtWaLVh+mx43wgd0gblL1Ms0AzdQXeQJC0it4PIyS
 4I3ltQ+FamwalOfZm04KiNCyWLC1mC5DdDhUS/m654xX9cKMccL2jCKtq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="315910362"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="315910362"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 12:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="692750863"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2022 12:26:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oJgUJ-000IlM-2J;
 Thu, 04 Aug 2022 19:26:31 +0000
Date: Fri, 5 Aug 2022 03:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/cmdline-parser: Use assert when needed
Message-ID: <202208050307.u6Yo3hhR-lkp@intel.com>
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
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Michał,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next linus/master v5.19 next-20220804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/drm-cmdline-parser-Merge-negative-tests/20220804-212019
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: csky-buildonly-randconfig-r001-20220804 (https://download.01.org/0day-ci/archive/20220805/202208050307.u6Yo3hhR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8a21a5872b4bbe7bcfec5bc990d182a5c32416a2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Micha-Winiarski/drm-cmdline-parser-Merge-negative-tests/20220804-212019
        git checkout 8a21a5872b4bbe7bcfec5bc990d182a5c32416a2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_cmdline_parser_test.c: In function 'drm_cmdline_test_res_bpp_refresh_force_on_digital':
>> drivers/gpu/drm/tests/drm_cmdline_parser_test.c:414:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     414 | }
         | ^
   drivers/gpu/drm/tests/drm_cmdline_parser_test.c: In function 'drm_cmdline_test_force_D_only_hdmi':
   drivers/gpu/drm/tests/drm_cmdline_parser_test.c:70:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      70 | }
         | ^
   drivers/gpu/drm/tests/drm_cmdline_parser_test.c: In function 'drm_cmdline_test_force_D_only_dvi':
   drivers/gpu/drm/tests/drm_cmdline_parser_test.c:91:1: warning: the frame size of 1124 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      91 | }
         | ^


vim +414 drivers/gpu/drm/tests/drm_cmdline_parser_test.c

9f0527d22a52ff Maíra Canal      2022-07-08  388  
9f0527d22a52ff Maíra Canal      2022-07-08  389  static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test)
9f0527d22a52ff Maíra Canal      2022-07-08  390  {
9f0527d22a52ff Maíra Canal      2022-07-08  391  	struct drm_cmdline_mode mode = { };
8a21a5872b4bbe Michał Winiarski 2022-08-04  392  	const struct drm_connector connector = {
9f0527d22a52ff Maíra Canal      2022-07-08  393  		.connector_type = DRM_MODE_CONNECTOR_DVII,
9f0527d22a52ff Maíra Canal      2022-07-08  394  	};
9f0527d22a52ff Maíra Canal      2022-07-08  395  	const char *cmdline = "720x480-24@60D";
9f0527d22a52ff Maíra Canal      2022-07-08  396  
8a21a5872b4bbe Michał Winiarski 2022-08-04  397  	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
9f0527d22a52ff Maíra Canal      2022-07-08  398  									  &connector, &mode));
9f0527d22a52ff Maíra Canal      2022-07-08  399  	KUNIT_EXPECT_TRUE(test, mode.specified);
9f0527d22a52ff Maíra Canal      2022-07-08  400  	KUNIT_EXPECT_EQ(test, mode.xres, 720);
9f0527d22a52ff Maíra Canal      2022-07-08  401  	KUNIT_EXPECT_EQ(test, mode.yres, 480);
9f0527d22a52ff Maíra Canal      2022-07-08  402  
9f0527d22a52ff Maíra Canal      2022-07-08  403  	KUNIT_EXPECT_TRUE(test, mode.refresh_specified);
9f0527d22a52ff Maíra Canal      2022-07-08  404  	KUNIT_EXPECT_EQ(test, mode.refresh, 60);
9f0527d22a52ff Maíra Canal      2022-07-08  405  
9f0527d22a52ff Maíra Canal      2022-07-08  406  	KUNIT_EXPECT_TRUE(test, mode.bpp_specified);
9f0527d22a52ff Maíra Canal      2022-07-08  407  	KUNIT_EXPECT_EQ(test, mode.bpp, 24);
9f0527d22a52ff Maíra Canal      2022-07-08  408  
9f0527d22a52ff Maíra Canal      2022-07-08  409  	KUNIT_EXPECT_FALSE(test, mode.rb);
9f0527d22a52ff Maíra Canal      2022-07-08  410  	KUNIT_EXPECT_FALSE(test, mode.cvt);
9f0527d22a52ff Maíra Canal      2022-07-08  411  	KUNIT_EXPECT_FALSE(test, mode.interlace);
9f0527d22a52ff Maíra Canal      2022-07-08  412  	KUNIT_EXPECT_FALSE(test, mode.margins);
9f0527d22a52ff Maíra Canal      2022-07-08  413  	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_ON_DIGITAL);
9f0527d22a52ff Maíra Canal      2022-07-08 @414  }
9f0527d22a52ff Maíra Canal      2022-07-08  415  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
