Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01FA67410F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 19:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78D710E0EB;
	Thu, 19 Jan 2023 18:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735010E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674153393; x=1705689393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zwVVjUESJIESReT22YjiSWRMur/H9GgTgPJMfoIT7L0=;
 b=KWphWsiCioYMECx6nzJITeyUJJQuDX/swYpZgLsElr+y+knr6YER8gWU
 2fExfoMTHUfJYfan5o1vdIw4nGW1hmvLejw61cF7l3Ks6Mc5dCG69qMHq
 mEgphmjDSbMuzJNX8SftxL40XMSwGF4Y2fLhVbL54UUzlHNijhPLl6EJs
 qv8SY0IqFQ+xa64hU1az9Fc/7jE8ZDM2H0P97+/KAVK77W4kH507EjBv5
 41DUvK41HuC3ZLPIA/dn8DaEBVBQ8OIzRlsgf1HmBSnFQnpThYh8N3OID
 5JLlT/+OcrEYeQMdZXlB80keCTAnDU8rEjEak6F/izI+ekTIM/eZrlV/z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389895171"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="389895171"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 10:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768345053"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="768345053"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 10:36:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIZld-0001jS-1k;
 Thu, 19 Jan 2023 18:36:05 +0000
Date: Fri, 20 Jan 2023 02:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v6 2/2] backlight: ktz8866: Add support for Kinetic
 KTZ8866 backlight
Message-ID: <202301200239.m4ZDprWz-lkp@intel.com>
References: <20230118131002.15453-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118131002.15453-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jianhua Lu <lujianhua000@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jianhua,

I love your patch! Perhaps something to improve:

[auto build test WARNING on lee-backlight/for-backlight-next]
[also build test WARNING on lee-backlight/for-backlight-fixes lee-leds/for-leds-next pavel-leds/for-next linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lu/backlight-ktz8866-Add-support-for-Kinetic-KTZ8866-backlight/20230118-214354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20230118131002.15453-2-lujianhua000%40gmail.com
patch subject: [PATCH v6 2/2] backlight: ktz8866: Add support for Kinetic KTZ8866 backlight
config: parisc-randconfig-r031-20230119 (https://download.01.org/0day-ci/archive/20230120/202301200239.m4ZDprWz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b862510e8bf9eb34db9d71a372b9de05682cb8ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianhua-Lu/backlight-ktz8866-Add-support-for-Kinetic-KTZ8866-backlight/20230118-214354
        git checkout b862510e8bf9eb34db9d71a372b9de05682cb8ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/video/backlight/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/backlight.h:12,
                    from drivers/video/backlight/ktz8866.c:8:
   include/vdso/bits.h: In function 'ktz8866_init':
>> include/vdso/bits.h:7:40: warning: 'val' is used uninitialized [-Wuninitialized]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/video/backlight/ktz8866.c:98:22: note: 'val' was declared here
      98 |         unsigned int val;
         |                      ^~~


vim +/val +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  8  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
