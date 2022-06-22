Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FCB55459D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839EC10E28A;
	Wed, 22 Jun 2022 11:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB2F10EC4F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655896131; x=1687432131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=62cfgP3kD+3zmrJCo+9TueQv4qZrgvM/3pIBj12WJ60=;
 b=cYhhtlPGDYs0sKE/qf+Ecw3MAe6cRv3p59lb9UCpuLaDFOqdlUFSeKrJ
 p7LbsQslRma/tvsixGukrH5qbUd+ASNWxuCqh4W9/Gpu0hLzjW/4ONDyM
 /hIb0XavOBnzUn7NLcVnKnz2m8DneZ/rW6sxvMMVSOoEYgIBDCOnoNmS9
 0LsHpShA5C9LiQZKC78tDl+JfRNxMpiXrEEWPM6zB+2ipGVKlMdSApI3+
 sXnkInNi8wdJ3XpL2By9yKHznvKHVaTXDXaj/vA5x9YvP1gG6vv6yWvkN
 A+7VCo8/bgLUkTJbMqLfLdZbffaT1dOm2VMaDYRO/4028yKmJPztZcYMu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="279156027"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="279156027"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="834063772"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2022 04:08:44 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3yDz-0001B6-Nm;
 Wed, 22 Jun 2022 11:08:43 +0000
Date: Wed, 22 Jun 2022 19:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>,
 Daniel Latypov <dlatypov@google.com>, brendanhiggins@google.com
Subject: Re: [PATCH v2 4/9] drm: selftest: convert drm_format selftest to KUnit
Message-ID: <202206221827.Qd1tjlFl-lkp@intel.com>
References: <20220621200926.257002-5-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621200926.257002-5-maira.canal@usp.br>
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
Cc: kbuild-all@lists.01.org,
 =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Maíra,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-selftest-Convert-to-KUnit/20220622-041357
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220622/202206221827.Qd1tjlFl-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/169d2ec9315db8eac8466f00e3f30a341e958ef2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-selftest-Convert-to-KUnit/20220622-041357
        git checkout 169d2ec9315db8eac8466f00e3f30a341e958ef2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
>> drivers/gpu/drm/tests/drm_format_test.c:268:1: warning: the frame size of 2576 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     268 | }
         | ^


vim +268 drivers/gpu/drm/tests/drm_format_test.c

    90	
    91	static void igt_check_drm_format_min_pitch(struct kunit *test)
    92	{
    93		const struct drm_format_info *info = NULL;
    94	
    95		/* Test invalid arguments */
    96		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
    97		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
    98		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
    99	
   100		/* Test 1 plane 8 bits per pixel format */
   101		info = drm_format_info(DRM_FORMAT_RGB332);
   102		KUNIT_EXPECT_TRUE(test, info);
   103		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   104		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   105		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   106	
   107		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   108		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   109		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   110		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   111		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   112		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   113		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   114		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   115				(uint64_t)UINT_MAX);
   116		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   117				(uint64_t)(UINT_MAX - 1));
   118	
   119		/* Test 1 plane 16 bits per pixel format */
   120		info = drm_format_info(DRM_FORMAT_XRGB4444);
   121		KUNIT_EXPECT_TRUE(test, info);
   122		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   123		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   124		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   125	
   126		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
   127		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
   128		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
   129		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
   130		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
   131		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
   132		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
   133		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   134				(uint64_t)UINT_MAX * 2);
   135		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   136				(uint64_t)(UINT_MAX - 1) * 2);
   137	
   138		/* Test 1 plane 24 bits per pixel format */
   139		info = drm_format_info(DRM_FORMAT_RGB888);
   140		KUNIT_EXPECT_TRUE(test, info);
   141		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   142		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   143		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   144	
   145		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 3);
   146		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 6);
   147		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1920);
   148		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 3072);
   149		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 5760);
   150		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 12288);
   151		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
   152		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   153				(uint64_t)UINT_MAX * 3);
   154		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   155				(uint64_t)(UINT_MAX - 1) * 3);
   156	
   157		/* Test 1 plane 32 bits per pixel format */
   158		info = drm_format_info(DRM_FORMAT_ABGR8888);
   159		KUNIT_EXPECT_TRUE(test, info);
   160		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   161		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   162		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   163	
   164		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 4);
   165		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 8);
   166		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 2560);
   167		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 4096);
   168		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 7680);
   169		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 16384);
   170		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
   171		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   172				(uint64_t)UINT_MAX * 4);
   173		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   174				(uint64_t)(UINT_MAX - 1) * 4);
   175	
   176		/* Test 2 planes format */
   177		info = drm_format_info(DRM_FORMAT_NV12);
   178		KUNIT_EXPECT_TRUE(test, info);
   179		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   180		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   181		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   182		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
   183	
   184		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   185		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
   186		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   187		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
   188		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   189		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 640);
   190		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   191		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 1024);
   192		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   193		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 1920);
   194		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   195		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 4096);
   196		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   197		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 672);
   198		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   199				(uint64_t)UINT_MAX);
   200		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
   201				(uint64_t)UINT_MAX + 1);
   202		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   203				(uint64_t)(UINT_MAX - 1));
   204		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
   205				(uint64_t)(UINT_MAX - 1));
   206	
   207		/* Test 3 planes 8 bits per pixel format */
   208		info = drm_format_info(DRM_FORMAT_YUV422);
   209		KUNIT_EXPECT_TRUE(test, info);
   210		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   211		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   212		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
   213		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   214		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 3, 0));
   215	
   216		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   217		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 1);
   218		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 1), 1);
   219		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   220		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2), 2);
   221		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2), 2);
   222		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   223		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 320);
   224		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 320), 320);
   225		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   226		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 512);
   227		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 512), 512);
   228		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   229		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 960);
   230		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 960), 960);
   231		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   232		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 2048);
   233		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2048), 2048);
   234		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   235		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 336);
   236		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 336), 336);
   237		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   238				(uint64_t)UINT_MAX);
   239		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
   240				(uint64_t)UINT_MAX / 2 + 1);
   241		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, UINT_MAX / 2 + 1),
   242				(uint64_t)UINT_MAX / 2 + 1);
   243		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1) / 2),
   244				(uint64_t)(UINT_MAX - 1) / 2);
   245		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) / 2),
   246				(uint64_t)(UINT_MAX - 1) / 2);
   247		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, (UINT_MAX - 1) / 2),
   248				(uint64_t)(UINT_MAX - 1) / 2);
   249	
   250		/* Test tiled format */
   251		info = drm_format_info(DRM_FORMAT_X0L2);
   252		KUNIT_EXPECT_TRUE(test, info);
   253		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   254		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   255		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   256	
   257		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
   258		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
   259		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
   260		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
   261		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
   262		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
   263		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
   264		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   265				(uint64_t)UINT_MAX * 2);
   266		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
   267				(uint64_t)(UINT_MAX - 1) * 2);
 > 268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
