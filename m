Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F1732283
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A664010E557;
	Thu, 15 Jun 2023 22:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3A10E557
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 22:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686867058; x=1718403058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i0FZYmK7JQiNiwfBTor0G0QvLv81S1GzzEFM2X655Vg=;
 b=Y0YnJLDRfaXisijVnar8lI1/U+FNSoVrMTeqHXgQN09e7+pXDVwlHFhE
 uT7Y9uL03brjn28Mq+frH1s7gEV8Y3zMpCualpyyMS/J7E/stSngCBkxk
 1St0flRq7PkshgGcGnqtoMWCpgVulEn3pi8TJlhRFC32dtQts+De/jF0h
 YD7NEUXY+r3Kvwal1yCf/EebvX3IdhslhFb3L9bg8hHb21utOun9MspEj
 soqJCNQllt6Ay9JLB3vg2dv72e9qK53UfkB8Z5pqgVcUcEGbuj+V9WHHU
 J4EoWUTcFJ3xyvwrWaZKIPEOZBPHcFaWZILnYpk7jakC8FtkMa4Q0hTUR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343792775"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343792775"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 15:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662930662"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="662930662"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 15:10:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9vB5-0000RZ-2t;
 Thu, 15 Jun 2023 22:10:51 +0000
Date: Fri, 16 Jun 2023 06:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Stephen Boyd <swboyd@chromium.org>,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm/panel: boe-tv101wum-nl6: Drop macros and open
 code sequences
Message-ID: <202306160538.B7HKWlKo-lkp@intel.com>
References: <20230615-fix-boe-tv101wum-nl6-v1-1-8ac378405fb7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615-fix-boe-tv101wum-nl6-v1-1-8ac378405fb7@linaro.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/drm-panel-boe-tv101wum-nl6-Drop-macros-and-open-code-sequences/20230616-042312
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-1-8ac378405fb7%40linaro.org
patch subject: [PATCH 1/2] drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230616/202306160538.B7HKWlKo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout ac9a78681b921877518763ba0e89202254349d1b
        b4 shazam https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-1-8ac378405fb7@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160538.B7HKWlKo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c:776:5: warning: no previous prototype for 'boe_init' [-Wmissing-prototypes]
     776 | int boe_init(struct mipi_dsi_device *dsi)
         |     ^~~~~~~~


vim +/boe_init +776 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

   775	
 > 776	int boe_init(struct mipi_dsi_device *dsi)
   777	{
   778		msleep(24);
   779		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x05);
   780		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0xE5);
   781		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x52);
   782		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00);
   783		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x88);
   784		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x04);
   785		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00);
   786		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00);
   787		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x03);
   788		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x8B);
   789		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x1A);
   790		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x0F);
   791		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x0C);
   792		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x02);
   793		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x0C);
   794		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x02);
   795		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x01);
   796		mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x26);
   797		mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x26);
   798		mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x00);
   799		mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x00);
   800		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0x26);
   801		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x26);
   802		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x00);
   803		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
   804		mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x03);
   805		mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x03);
   806		mipi_dsi_dcs_write_seq(dsi, 0xE6, 0x04);
   807		mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x04);
   808		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x09);
   809		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x09);
   810		mipi_dsi_dcs_write_seq(dsi, 0xD8, 0x0A);
   811		mipi_dsi_dcs_write_seq(dsi, 0xD9, 0x0A);
   812		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x0B);
   813		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x0B);
   814		mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x0C);
   815		mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x0C);
   816		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x05);
   817		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x05);
   818		mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x06);
   819		mipi_dsi_dcs_write_seq(dsi, 0xD5, 0x06);
   820		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x07);
   821		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x07);
   822		mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x08);
   823		mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x08);
   824		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x02);
   825		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x00);
   826		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x0D);
   827		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0x17);
   828		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x26);
   829		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0x31);
   830		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x1C);
   831		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0x2C);
   832		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0x33);
   833		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x31);
   834		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x37);
   835		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x37);
   836		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x37);
   837		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0x39);
   838		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0x2E);
   839		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0x2F);
   840		mipi_dsi_dcs_write_seq(dsi, 0xCF, 0x2F);
   841		mipi_dsi_dcs_write_seq(dsi, 0xD0, 0x07);
   842		mipi_dsi_dcs_write_seq(dsi, 0xD2, 0x00);
   843		mipi_dsi_dcs_write_seq(dsi, 0xD3, 0x0D);
   844		mipi_dsi_dcs_write_seq(dsi, 0xD4, 0x17);
   845		mipi_dsi_dcs_write_seq(dsi, 0xD5, 0x26);
   846		mipi_dsi_dcs_write_seq(dsi, 0xD6, 0x31);
   847		mipi_dsi_dcs_write_seq(dsi, 0xD7, 0x3F);
   848		mipi_dsi_dcs_write_seq(dsi, 0xD8, 0x3F);
   849		mipi_dsi_dcs_write_seq(dsi, 0xD9, 0x3F);
   850		mipi_dsi_dcs_write_seq(dsi, 0xDA, 0x3F);
   851		mipi_dsi_dcs_write_seq(dsi, 0xDB, 0x37);
   852		mipi_dsi_dcs_write_seq(dsi, 0xDC, 0x37);
   853		mipi_dsi_dcs_write_seq(dsi, 0xDD, 0x37);
   854		mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x39);
   855		mipi_dsi_dcs_write_seq(dsi, 0xDF, 0x2E);
   856		mipi_dsi_dcs_write_seq(dsi, 0xE0, 0x2F);
   857		mipi_dsi_dcs_write_seq(dsi, 0xE1, 0x2F);
   858		mipi_dsi_dcs_write_seq(dsi, 0xE2, 0x07);
   859		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x03);
   860		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0x0B);
   861		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x07);
   862		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0x00);
   863		mipi_dsi_dcs_write_seq(dsi, 0xE7, 0x00);
   864		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0x2A);
   865		mipi_dsi_dcs_write_seq(dsi, 0xDE, 0x2A);
   866		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x43);
   867		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x07);
   868		mipi_dsi_dcs_write_seq(dsi, 0xE4, 0xC0);
   869		mipi_dsi_dcs_write_seq(dsi, 0xE5, 0x0D);
   870		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x00);
   871		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x06);
   872		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0xA5);
   873		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0xA5);
   874		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0x0F);
   875		mipi_dsi_dcs_write_seq(dsi, 0xD5, 0x32);
   876		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x00);
   877		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x00);
   878		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x00);
   879		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x07);
   880		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00);
   881		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02);
   882		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x0F);
   883		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x25);
   884		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x39);
   885		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4E);
   886		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x72);
   887		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x97);
   888		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xDC);
   889		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x22);
   890		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xA4);
   891		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x2B);
   892		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x2F);
   893		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA9);
   894		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x25);
   895		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x61);
   896		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x97);
   897		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB2);
   898		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCD);
   899		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xD9);
   900		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE7);
   901		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF4);
   902		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
   903		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
   904		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
   905		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
   906		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
   907		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
   908		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
   909		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
   910		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x08);
   911		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x04);
   912		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x05);
   913		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x11);
   914		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x24);
   915		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x39);
   916		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4F);
   917		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x72);
   918		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x98);
   919		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xDC);
   920		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x23);
   921		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xA6);
   922		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x2C);
   923		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x30);
   924		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xAA);
   925		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x26);
   926		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x62);
   927		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x9B);
   928		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB5);
   929		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCF);
   930		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xDB);
   931		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE8);
   932		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF5);
   933		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
   934		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
   935		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
   936		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
   937		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
   938		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
   939		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
   940		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
   941		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x09);
   942		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x04);
   943		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02);
   944		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x16);
   945		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x24);
   946		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
   947		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4F);
   948		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x73);
   949		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x99);
   950		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xE0);
   951		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x26);
   952		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xAD);
   953		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x36);
   954		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x3A);
   955		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xAE);
   956		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x2A);
   957		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x66);
   958		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x9E);
   959		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB8);
   960		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xD1);
   961		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xDD);
   962		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE9);
   963		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF6);
   964		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
   965		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
   966		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
   967		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
   968		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
   969		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
   970		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
   971		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
   972		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x0A);
   973		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x00);
   974		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02);
   975		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x0F);
   976		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x25);
   977		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x39);
   978		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4E);
   979		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x72);
   980		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x97);
   981		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xDC);
   982		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x22);
   983		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xA4);
   984		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x2B);
   985		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x2F);
   986		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xA9);
   987		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x25);
   988		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x61);
   989		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x97);
   990		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB2);
   991		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCD);
   992		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xD9);
   993		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE7);
   994		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF4);
   995		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
   996		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
   997		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
   998		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
   999		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
  1000		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
  1001		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
  1002		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
  1003		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x0B);
  1004		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x04);
  1005		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x05);
  1006		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x11);
  1007		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x24);
  1008		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x39);
  1009		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4F);
  1010		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x72);
  1011		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x98);
  1012		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xDC);
  1013		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x23);
  1014		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xA6);
  1015		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x2C);
  1016		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x30);
  1017		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xAA);
  1018		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x26);
  1019		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x62);
  1020		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x9B);
  1021		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB5);
  1022		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xCF);
  1023		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xDB);
  1024		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE8);
  1025		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF5);
  1026		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
  1027		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
  1028		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
  1029		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
  1030		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
  1031		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
  1032		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
  1033		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
  1034		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x0C);
  1035		mipi_dsi_dcs_write_seq(dsi, 0xB1, 0x04);
  1036		mipi_dsi_dcs_write_seq(dsi, 0xB2, 0x02);
  1037		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x16);
  1038		mipi_dsi_dcs_write_seq(dsi, 0xB4, 0x24);
  1039		mipi_dsi_dcs_write_seq(dsi, 0xB5, 0x3B);
  1040		mipi_dsi_dcs_write_seq(dsi, 0xB6, 0x4F);
  1041		mipi_dsi_dcs_write_seq(dsi, 0xB7, 0x73);
  1042		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x99);
  1043		mipi_dsi_dcs_write_seq(dsi, 0xB9, 0xE0);
  1044		mipi_dsi_dcs_write_seq(dsi, 0xBA, 0x26);
  1045		mipi_dsi_dcs_write_seq(dsi, 0xBB, 0xAD);
  1046		mipi_dsi_dcs_write_seq(dsi, 0xBC, 0x36);
  1047		mipi_dsi_dcs_write_seq(dsi, 0xBD, 0x3A);
  1048		mipi_dsi_dcs_write_seq(dsi, 0xBE, 0xAE);
  1049		mipi_dsi_dcs_write_seq(dsi, 0xBF, 0x2A);
  1050		mipi_dsi_dcs_write_seq(dsi, 0xC0, 0x66);
  1051		mipi_dsi_dcs_write_seq(dsi, 0xC1, 0x9E);
  1052		mipi_dsi_dcs_write_seq(dsi, 0xC2, 0xB8);
  1053		mipi_dsi_dcs_write_seq(dsi, 0xC3, 0xD1);
  1054		mipi_dsi_dcs_write_seq(dsi, 0xC4, 0xDD);
  1055		mipi_dsi_dcs_write_seq(dsi, 0xC5, 0xE9);
  1056		mipi_dsi_dcs_write_seq(dsi, 0xC6, 0xF6);
  1057		mipi_dsi_dcs_write_seq(dsi, 0xC7, 0xFA);
  1058		mipi_dsi_dcs_write_seq(dsi, 0xC8, 0xFC);
  1059		mipi_dsi_dcs_write_seq(dsi, 0xC9, 0x00);
  1060		mipi_dsi_dcs_write_seq(dsi, 0xCA, 0x00);
  1061		mipi_dsi_dcs_write_seq(dsi, 0xCB, 0x16);
  1062		mipi_dsi_dcs_write_seq(dsi, 0xCC, 0xAF);
  1063		mipi_dsi_dcs_write_seq(dsi, 0xCD, 0xFF);
  1064		mipi_dsi_dcs_write_seq(dsi, 0xCE, 0xFF);
  1065		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x00);
  1066		mipi_dsi_dcs_write_seq(dsi, 0xB3, 0x08);
  1067		mipi_dsi_dcs_write_seq(dsi, 0xB0, 0x04);
  1068		mipi_dsi_dcs_write_seq(dsi, 0xB8, 0x68);
  1069		msleep(150);
  1070	
  1071		return 0;
  1072	}
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
