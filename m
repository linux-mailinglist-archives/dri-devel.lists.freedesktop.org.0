Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8354FD2DC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187E10E53B;
	Tue, 12 Apr 2022 08:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1A010E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649751491; x=1681287491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KttORuuzKa1gAej3+50sABpd4LK7JoBRCSwgJ4ZP7EM=;
 b=mD/Cyg7sXaAM1gTJLPYmL0Nw10WE2/41xDxAr4nWRAOg200Yw+EOmdDr
 B59uYmlwb2l3kZ/paodsIx8cWAwcjHc13z/Xgsa+jGxq8SA6ldyZ5pCRx
 VG5dYYFSTnbKaUYFWmE9r8LIYILmOlxr2y7lhGex0584oKKc1lSXgDpTX
 9HP0Y44lOp3v224TtjqbEIWtlF+fTr/ooVtW2TZzlQmFdCBZhaD5qBpNE
 95b5Cf333wJ+hv7sbS4u1MIlou7wtWHjkdBHq/T4nFHif1BE9D2MELhrY
 Vc87HBBPUTwMqPvTwPd03bhRisVi6ViGwoBvF1dMcHwONdgPFOgCuBFHp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242901564"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="242901564"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 01:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="572653613"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 12 Apr 2022 01:17:48 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neBid-0002f5-KO;
 Tue, 12 Apr 2022 08:17:47 +0000
Date: Tue, 12 Apr 2022 16:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/solomon: Add SSD130x OLED displays SPI support
Message-ID: <202204121654.38UTab7Q-lkp@intel.com>
References: <20220411211243.11121-6-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411211243.11121-6-javierm@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kbuild-all@lists.01.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220412]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master linux/master airlied/drm-next v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-solomon-Add-SSD130x-OLED-displays-SPI-support/20220412-051518
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220412/202204121654.38UTab7Q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46bbef7fc1afeb9bc8241fe7636e77b5096e3d22
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Martinez-Canillas/drm-solomon-Add-SSD130x-OLED-displays-SPI-support/20220412-051518
        git checkout 46bbef7fc1afeb9bc8241fe7636e77b5096e3d22
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/solomon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/solomon/ssd130x-spi.c:161:35: warning: unused variable 'ssd130x_spi_table' [-Wunused-const-variable]
   static const struct spi_device_id ssd130x_spi_table[] = {
                                     ^
   1 warning generated.


vim +/ssd130x_spi_table +161 drivers/gpu/drm/solomon/ssd130x-spi.c

   152	
   153	/*
   154	 * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
   155	 * if the device was registered via OF. This means that the module will not be
   156	 * auto loaded, unless it contains an alias that matches the MODALIAS reported.
   157	 *
   158	 * To workaround this issue, add a SPI device ID table. Even when this should
   159	 * not be needed for this driver to match the registered SPI devices.
   160	 */
 > 161	static const struct spi_device_id ssd130x_spi_table[] = {
   162		{ "sh1106",  SH1106_ID },
   163		{ "ssd1305", SSD1305_ID },
   164		{ "ssd1306", SSD1306_ID },
   165		{ "ssd1307", SSD1307_ID },
   166		{ "ssd1309", SSD1309_ID },
   167		{ /* sentinel */ }
   168	};
   169	MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
   170	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
