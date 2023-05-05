Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990D6F803B
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 11:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0596110E009;
	Fri,  5 May 2023 09:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653E310E009
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683279677; x=1714815677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D7UA2lx+EkPLMAJoV5cMenjK7P7GwwqdLMhdFNpcpUw=;
 b=hD7AaMVF9YQEzaDPD6O1eGX+XfLefL1oLqe/wwRWqv/6P2pI8Vnp9p5h
 mccEZX0xGx6kpND4z/pE6TRABU2d4VQHuqbKf2eAFZ1rHRxBZhPKbM3uF
 eojTeuvCWjYX9aKBbM5KiubWGk6GCE8UaauqXivzmmW1eD6nPlrffhBJA
 dt8KhfCS34d8hQ1eBb3Ky7Ofl8pGH/PwFpAz+HXfQdmJyZWHio5lzyVbI
 l0T6otj5PPZ7HQIuibSjCJau9UF/yAsSoTuWhnPOatL9fCd9+ziqR1Hxk
 g92YhUt8snGR5+nh19DuVDsWQv+SKZsIzB2Vdu0NFGZGPhxMcNtclh1KW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328794862"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328794862"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 02:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943777751"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943777751"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 02:41:11 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1purw6-0000TB-1W;
 Fri, 05 May 2023 09:41:10 +0000
Date: Fri, 5 May 2023 17:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Helge Deller <deller@gmx.de>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/3] Input: ads7846 - Convert to use software nodes
Message-ID: <202305051726.wOn3I3W1-lkp@intel.com>
References: <20230430-nokia770-regression-v2-1-984ed3ca5444@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430-nokia770-regression-v2-1-984ed3ca5444@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 348551ddaf311c76b01cdcbaf61b6fef06a49144]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/Input-ads7846-Convert-to-use-software-nodes/20230505-162601
base:   348551ddaf311c76b01cdcbaf61b6fef06a49144
patch link:    https://lore.kernel.org/r/20230430-nokia770-regression-v2-1-984ed3ca5444%40linaro.org
patch subject: [PATCH v2 1/3] Input: ads7846 - Convert to use software nodes
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230505/202305051726.wOn3I3W1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9708c9277cc820e52916ddf795926d3254bb5eed
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/Input-ads7846-Convert-to-use-software-nodes/20230505-162601
        git checkout 9708c9277cc820e52916ddf795926d3254bb5eed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051726.wOn3I3W1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/touchscreen/ads7846.c:1406:35: error: 'ads7846_dt_ids' undeclared here (not in a function); did you mean 'ads7846_cmds'?
    1406 |                 .of_match_table = ads7846_dt_ids,
         |                                   ^~~~~~~~~~~~~~
         |                                   ads7846_cmds


vim +1406 drivers/input/touchscreen/ads7846.c

  1401	
  1402	static struct spi_driver ads7846_driver = {
  1403		.driver = {
  1404			.name	= "ads7846",
  1405			.pm	= pm_sleep_ptr(&ads7846_pm),
> 1406			.of_match_table = ads7846_dt_ids,
  1407		},
  1408		.probe		= ads7846_probe,
  1409		.remove		= ads7846_remove,
  1410	};
  1411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
