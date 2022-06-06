Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7B53E511
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DB210E761;
	Mon,  6 Jun 2022 14:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F2210E761
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654525766; x=1686061766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6gFuK9m/CegkpD/g+gX8hVz/ChSurSOe3kM0kYWm6aE=;
 b=eMC426nikFbLleMpcDTh7f0evVLQFOc0EOD+mur79kxbvG6TELXmV8Aj
 nKCCefZWHVfjqCAiqyuxa6AoT7ForInPA8yVKBMPw0N5veqmcsRD0MHpG
 WfnXh0EIX4qO/xF58JQ14SySJcla3/QhtBM00+2CbGX7MYqJ01fHG4pCM
 OmHgeLZTj9y3aiEgmKrcwqGTCAd27vIFsy+QS7RkB6xTPSlM/eYjbTEvY
 jIYL5BuSi5oE4+2LfaM97VvzDcnwrsHa0onSb5vU/EInWkCdLieVMka/T
 D5FyRsO5GakZz4AcB75dugRKVfr3X7rX7Hio/NQkBb6988DLPTnDDPa6P w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="363002551"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="363002551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 07:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="554471422"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 06 Jun 2022 07:29:19 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyDjK-000Cnd-JV;
 Mon, 06 Jun 2022 14:29:18 +0000
Date: Mon, 6 Jun 2022 22:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: Re: [RESEND 12/14] leds: mt6370: Add Mediatek MT6370 Indicator support
Message-ID: <202206062207.q0S8wxpj-lkp@intel.com>
References: <20220531111900.19422-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531111900.19422-13-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, alice_chen@richtek.com,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi ChiaEn,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on pavel-leds/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-backlight/for-backlight-next v5.19-rc1 next-20220606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20220606/202206062207.q0S8wxpj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4de9e5ff11aeade155aa744bcaf9efca82b3d4ee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ChiaEn-Wu/Add-Mediatek-MT6370-PMIC-support/20220531-211432
        git checkout 4de9e5ff11aeade155aa744bcaf9efca82b3d4ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/leds/leds-mt6370.c: In function 'mt6370_check_vendor_info':
>> drivers/leds/leds-mt6370.c:873:15: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     873 |         vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
         |               ^~~~~~~~~
         |               FOLL_GET
   cc1: some warnings being treated as errors


vim +873 drivers/leds/leds-mt6370.c

   863	
   864	static int mt6370_check_vendor_info(struct mt6370_priv *priv)
   865	{
   866		unsigned int devinfo, vid;
   867		int ret;
   868	
   869		ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
   870		if (ret)
   871			return ret;
   872	
 > 873		vid = FIELD_GET(MT6370_VENID_MASK, devinfo);
   874		if (vid == 0x9 || vid == 0xb) {
   875			priv->reg_fields = mt6372_reg_fields;
   876			priv->ranges = mt6372_led_ranges;
   877			priv->is_mt6372 = true;
   878		} else {
   879			priv->reg_fields = common_reg_fields;
   880			priv->ranges = common_led_ranges;
   881		}
   882	
   883		return 0;
   884	}
   885	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
