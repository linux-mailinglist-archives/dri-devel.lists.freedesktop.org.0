Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F36B54E1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 23:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F1210E067;
	Fri, 10 Mar 2023 22:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAED10E067
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678488874; x=1710024874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+W4DuBWQIq4k0ColtBYtZ4C7iV9+YoQzGUCq+g22nFg=;
 b=AKcFi0w0KtutDatQfhflFe+tY3SIwJ2J49NrxiaUU0GV7HBoBFot2cg7
 Q9+4f0nsaQWv7Hmk6PPtGZt6LFykckFAF+AaA7ywqpUeK8CZIG3rCddHN
 b/xTN9s58f5/97xSE5MdHrRCCqM6g92CmpxWF+pAz46YaB4NYAh0cNVXv
 lsEOnV8Eo3WCRbI0pMdPKl3f/qlTNVLMpIgOeIdJbpMVjSmYdKw2Kli0b
 SmtkHXsqSt+Ahj/mpbg3L9dHyb0iw6ZhCrkBtDC9gH/yLkKe3oy4z31bv
 rjyhFNc/CR0wlFyp+1FqrX0D3MbVRylMMrVRzwu1Ip+2CMi7YNewzE8BV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335542890"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="335542890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788205771"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="788205771"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 14:54:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pald8-000495-20;
 Fri, 10 Mar 2023 22:54:30 +0000
Date: Sat, 11 Mar 2023 06:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/format-helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Message-ID: <202303110624.afo4lQ9b-lkp@intel.com>
References: <20230310200901.216971-2-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310200901.216971-2-arthurgrillo@riseup.net>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, tzimmermann@suse.de, oe-kbuild-all@lists.linux.dev,
 jose.exposito89@gmail.com, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Grillo/drm-format-helper-Add-Kunit-tests-for-drm_fb_xrgb8888_to_mono/20230311-041101
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230310200901.216971-2-arthurgrillo%40riseup.net
patch subject: [PATCH v2 1/2] drm/format-helper: Add Kunit tests for drm_fb_xrgb8888_to_mono()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230311/202303110624.afo4lQ9b-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/efeeef1f599ecbb4a8c2ab1b4a4dd77d77ab63f4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arthur-Grillo/drm-format-helper-Add-Kunit-tests-for-drm_fb_xrgb8888_to_mono/20230311-041101
        git checkout efeeef1f599ecbb4a8c2ab1b4a4dd77d77ab63f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110624.afo4lQ9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_format_helper_test.c:314:41: warning: suggest parentheses around operand of '!' or change '|' to '||' or '!' to '~' [-Wparentheses]
     314 |                                 !BIT(0) | BIT(1),
         |                                         ^


vim +314 drivers/gpu/drm/tests/drm_format_helper_test.c

    92	
    93	static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
    94		{
    95			.name = "single_pixel_source_buffer",
    96			.pitch = 1 * 4,
    97			.clip = DRM_RECT_INIT(0, 0, 1, 1),
    98			.xrgb8888 = { 0x01FF0000 },
    99			.gray8_result = {
   100				.dst_pitch = 0,
   101				.expected = { 0x4C },
   102			},
   103			.rgb332_result = {
   104				.dst_pitch = 0,
   105				.expected = { 0xE0 },
   106			},
   107			.rgb565_result = {
   108				.dst_pitch = 0,
   109				.expected = { 0xF800 },
   110				.expected_swab = { 0x00F8 },
   111			},
   112			.xrgb1555_result = {
   113				.dst_pitch = 0,
   114				.expected = { 0x7C00 },
   115			},
   116			.argb1555_result = {
   117				.dst_pitch = 0,
   118				.expected = { 0xFC00 },
   119			},
   120			.rgba5551_result = {
   121				.dst_pitch = 0,
   122				.expected = { 0xF801 },
   123			},
   124			.rgb888_result = {
   125				.dst_pitch = 0,
   126				.expected = { 0x00, 0x00, 0xFF },
   127			},
   128			.argb8888_result = {
   129				.dst_pitch = 0,
   130				.expected = { 0xFFFF0000 },
   131			},
   132			.xrgb2101010_result = {
   133				.dst_pitch = 0,
   134				.expected = { 0x3FF00000 },
   135			},
   136			.argb2101010_result = {
   137				.dst_pitch = 0,
   138				.expected = { 0xFFF00000 },
   139			},
   140			.mono_result = {
   141				.dst_pitch = 0,
   142				.expected = { !BIT(0) },
   143			},
   144		},
   145		{
   146			.name = "single_pixel_clip_rectangle",
   147			.pitch = 2 * 4,
   148			.clip = DRM_RECT_INIT(1, 1, 1, 1),
   149			.xrgb8888 = {
   150				0x00000000, 0x00000000,
   151				0x00000000, 0x10FF0000,
   152			},
   153			.gray8_result = {
   154				.dst_pitch = 0,
   155				.expected = { 0x4C },
   156			},
   157			.rgb332_result = {
   158				.dst_pitch = 0,
   159				.expected = { 0xE0 },
   160			},
   161			.rgb565_result = {
   162				.dst_pitch = 0,
   163				.expected = { 0xF800 },
   164				.expected_swab = { 0x00F8 },
   165			},
   166			.xrgb1555_result = {
   167				.dst_pitch = 0,
   168				.expected = { 0x7C00 },
   169			},
   170			.argb1555_result = {
   171				.dst_pitch = 0,
   172				.expected = { 0xFC00 },
   173			},
   174			.rgba5551_result = {
   175				.dst_pitch = 0,
   176				.expected = { 0xF801 },
   177			},
   178			.rgb888_result = {
   179				.dst_pitch = 0,
   180				.expected = { 0x00, 0x00, 0xFF },
   181			},
   182			.argb8888_result = {
   183				.dst_pitch = 0,
   184				.expected = { 0xFFFF0000 },
   185			},
   186			.xrgb2101010_result = {
   187				.dst_pitch = 0,
   188				.expected = { 0x3FF00000 },
   189			},
   190			.argb2101010_result = {
   191				.dst_pitch = 0,
   192				.expected = { 0xFFF00000 },
   193			},
   194			.mono_result = {
   195				.dst_pitch = 0,
   196				.expected = { !BIT(0) },
   197			},
   198		},
   199		{
   200			/* Well known colors: White, black, red, green, blue, magenta,
   201			 * yellow and cyan. Different values for the X in XRGB8888 to
   202			 * make sure it is ignored. Partial clip area.
   203			 */
   204			.name = "well_known_colors",
   205			.pitch = 4 * 4,
   206			.clip = DRM_RECT_INIT(1, 1, 2, 4),
   207			.xrgb8888 = {
   208				0x00000000, 0x00000000, 0x00000000, 0x00000000,
   209				0x00000000, 0x11FFFFFF, 0x22000000, 0x00000000,
   210				0x00000000, 0x33FF0000, 0x4400FF00, 0x00000000,
   211				0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
   212				0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
   213			},
   214			.gray8_result = {
   215				.dst_pitch = 0,
   216				.expected = {
   217					0xFF, 0x00,
   218					0x4C, 0x99,
   219					0x19, 0x66,
   220					0xE5, 0xB2,
   221				},
   222			},
   223			.rgb332_result = {
   224				.dst_pitch = 0,
   225				.expected = {
   226					0xFF, 0x00,
   227					0xE0, 0x1C,
   228					0x03, 0xE3,
   229					0xFC, 0x1F,
   230				},
   231			},
   232			.rgb565_result = {
   233				.dst_pitch = 0,
   234				.expected = {
   235					0xFFFF, 0x0000,
   236					0xF800, 0x07E0,
   237					0x001F, 0xF81F,
   238					0xFFE0, 0x07FF,
   239				},
   240				.expected_swab = {
   241					0xFFFF, 0x0000,
   242					0x00F8, 0xE007,
   243					0x1F00, 0x1FF8,
   244					0xE0FF, 0xFF07,
   245				},
   246			},
   247			.xrgb1555_result = {
   248				.dst_pitch = 0,
   249				.expected = {
   250					0x7FFF, 0x0000,
   251					0x7C00, 0x03E0,
   252					0x001F, 0x7C1F,
   253					0x7FE0, 0x03FF,
   254				},
   255			},
   256			.argb1555_result = {
   257				.dst_pitch = 0,
   258				.expected = {
   259					0xFFFF, 0x8000,
   260					0xFC00, 0x83E0,
   261					0x801F, 0xFC1F,
   262					0xFFE0, 0x83FF,
   263				},
   264			},
   265			.rgba5551_result = {
   266				.dst_pitch = 0,
   267				.expected = {
   268					0xFFFF, 0x0001,
   269					0xF801, 0x07C1,
   270					0x003F, 0xF83F,
   271					0xFFC1, 0x07FF,
   272				},
   273			},
   274			.rgb888_result = {
   275				.dst_pitch = 0,
   276				.expected = {
   277					0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
   278					0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00,
   279					0xFF, 0x00, 0x00, 0xFF, 0x00, 0xFF,
   280					0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
   281				},
   282			},
   283			.argb8888_result = {
   284				.dst_pitch = 0,
   285				.expected = {
   286					0xFFFFFFFF, 0xFF000000,
   287					0xFFFF0000, 0xFF00FF00,
   288					0xFF0000FF, 0xFFFF00FF,
   289					0xFFFFFF00, 0xFF00FFFF,
   290				},
   291			},
   292			.xrgb2101010_result = {
   293				.dst_pitch = 0,
   294				.expected = {
   295					0x3FFFFFFF, 0x00000000,
   296					0x3FF00000, 0x000FFC00,
   297					0x000003FF, 0x3FF003FF,
   298					0x3FFFFC00, 0x000FFFFF,
   299				},
   300			},
   301			.argb2101010_result = {
   302				.dst_pitch = 0,
   303				.expected = {
   304					0xFFFFFFFF, 0xC0000000,
   305					0xFFF00000, 0xC00FFC00,
   306					0xC00003FF, 0xFFF003FF,
   307					0xFFFFFC00, 0xC00FFFFF,
   308				},
   309			},
   310			.mono_result = {
   311				.dst_pitch = 0,
   312				.expected = {
   313					BIT(0) | !BIT(1),
 > 314					!BIT(0) | BIT(1),
   315					!BIT(0) | !BIT(1),
   316					BIT(0) | BIT(1),
   317				},
   318			},
   319		},
   320		{
   321			/* Randomly picked colors. Full buffer within the clip area. */
   322			.name = "destination_pitch",
   323			.pitch = 3 * 4,
   324			.clip = DRM_RECT_INIT(0, 0, 3, 3),
   325			.xrgb8888 = {
   326				0xA10E449C, 0xB1114D05, 0xC1A80303,
   327				0xD16C7073, 0xA20E449C, 0xB2114D05,
   328				0xC2A80303, 0xD26C7073, 0xA30E449C,
   329			},
   330			.gray8_result = {
   331				.dst_pitch = 5,
   332				.expected = {
   333					0x3C, 0x33, 0x34, 0x00, 0x00,
   334					0x6F, 0x3C, 0x33, 0x00, 0x00,
   335					0x34, 0x6F, 0x3C, 0x00, 0x00,
   336				},
   337			},
   338			.rgb332_result = {
   339				.dst_pitch = 5,
   340				.expected = {
   341					0x0A, 0x08, 0xA0, 0x00, 0x00,
   342					0x6D, 0x0A, 0x08, 0x00, 0x00,
   343					0xA0, 0x6D, 0x0A, 0x00, 0x00,
   344				},
   345			},
   346			.rgb565_result = {
   347				.dst_pitch = 10,
   348				.expected = {
   349					0x0A33, 0x1260, 0xA800, 0x0000, 0x0000,
   350					0x6B8E, 0x0A33, 0x1260, 0x0000, 0x0000,
   351					0xA800, 0x6B8E, 0x0A33, 0x0000, 0x0000,
   352				},
   353				.expected_swab = {
   354					0x330A, 0x6012, 0x00A8, 0x0000, 0x0000,
   355					0x8E6B, 0x330A, 0x6012, 0x0000, 0x0000,
   356					0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
   357				},
   358			},
   359			.xrgb1555_result = {
   360				.dst_pitch = 10,
   361				.expected = {
   362					0x0513, 0x0920, 0x5400, 0x0000, 0x0000,
   363					0x35CE, 0x0513, 0x0920, 0x0000, 0x0000,
   364					0x5400, 0x35CE, 0x0513, 0x0000, 0x0000,
   365				},
   366			},
   367			.argb1555_result = {
   368				.dst_pitch = 10,
   369				.expected = {
   370					0x8513, 0x8920, 0xD400, 0x0000, 0x0000,
   371					0xB5CE, 0x8513, 0x8920, 0x0000, 0x0000,
   372					0xD400, 0xB5CE, 0x8513, 0x0000, 0x0000,
   373				},
   374			},
   375			.rgba5551_result = {
   376				.dst_pitch = 10,
   377				.expected = {
   378					0x0A27, 0x1241, 0xA801, 0x0000, 0x0000,
   379					0x6B9D, 0x0A27, 0x1241, 0x0000, 0x0000,
   380					0xA801, 0x6B9D, 0x0A27, 0x0000, 0x0000,
   381				},
   382			},
   383			.rgb888_result = {
   384				.dst_pitch = 15,
   385				.expected = {
   386					0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11, 0x03, 0x03, 0xA8,
   387					0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   388					0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E, 0x05, 0x4D, 0x11,
   389					0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   390					0x03, 0x03, 0xA8, 0x73, 0x70, 0x6C, 0x9C, 0x44, 0x0E,
   391					0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   392				},
   393			},
   394			.argb8888_result = {
   395				.dst_pitch = 20,
   396				.expected = {
   397					0xFF0E449C, 0xFF114D05, 0xFFA80303, 0x00000000, 0x00000000,
   398					0xFF6C7073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
   399					0xFFA80303, 0xFF6C7073, 0xFF0E449C, 0x00000000, 0x00000000,
   400				},
   401			},
   402			.xrgb2101010_result = {
   403				.dst_pitch = 20,
   404				.expected = {
   405					0x03844672, 0x0444D414, 0x2A20300C, 0x00000000, 0x00000000,
   406					0x1B1705CD, 0x03844672, 0x0444D414, 0x00000000, 0x00000000,
   407					0x2A20300C, 0x1B1705CD, 0x03844672, 0x00000000, 0x00000000,
   408				},
   409			},
   410			.argb2101010_result = {
   411				.dst_pitch = 20,
   412				.expected = {
   413					0xC3844672, 0xC444D414, 0xEA20300C, 0x00000000, 0x00000000,
   414					0xDB1705CD, 0xC3844672, 0xC444D414, 0x00000000, 0x00000000,
   415					0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
   416				},
   417			},
   418			.mono_result = {
   419				.dst_pitch = 2,
   420				.expected = {
   421					!BIT(0) | !BIT(1) | !BIT(2), 0x00,
   422					!BIT(0) | !BIT(1) | !BIT(2), 0x00,
   423					!BIT(0) | !BIT(1) | !BIT(2), 0x00,
   424				},
   425			},
   426		},
   427	};
   428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
