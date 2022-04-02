Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A6D4EFF13
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 07:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1A10E4CC;
	Sat,  2 Apr 2022 05:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970A310E4CB
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 05:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648878582; x=1680414582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TZGP2yFhIfg8kh6ZCxxoGQgrQRnyKJ7mHLD5XwA3Q/M=;
 b=H1Du/UTbNFFVYjR12np0e6NM1Jwm55j/mrRn2rTXTBjZCVra0VTe5UKe
 x9oY/EHBD8tibiRZ19KXjYh7RK9h/QtdmJ4jYtmkkgcHHGvsMw6kOjFbe
 ZQ5u1A+7SvUKX0YXMla6JrfgUm/kTU1Vac03LexGAryOwdjGaDBq6NjfS
 IHDm1swvFWohmFKOjfiwmCVuXz4a+SuOug+nZk85K0oqFUEmv5+19HsW4
 OGg/uqshST+OR89yv5D2xYtG4gX0Ejs4juojWN6Opobmk2L+zjFCXsAOq
 ZLFX3Q9cciN12kIEYUTBY5EORz8Lvts4seEt/8i52XS/szL5/RggLyAEO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257859977"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="257859977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 22:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="696111634"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2022 22:49:35 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naWdj-0001m0-A8;
 Sat, 02 Apr 2022 05:49:35 +0000
Date: Sat, 2 Apr 2022 13:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <error27@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v14 5/6] drm/loongson: add drm driver for loongson
 display controller
Message-ID: <202204021321.5sYDUPbx-lkp@intel.com>
References: <20220401162251.1665081-6-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401162251.1665081-6-15330273260@189.cn>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on robh/for-next linus/master v5.17 next-20220401]
[cannot apply to mripard/sunxi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-add-drm-driver-for-loongson-display-controller/20220402-003557
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: sparc-randconfig-r012-20220402 (https://download.01.org/0day-ci/archive/20220402/202204021321.5sYDUPbx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b52cc469ed1a99a0803faef886f81607b1f7f5c0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-loongson-add-drm-driver-for-loongson-display-controller/20220402-003557
        git checkout b52cc469ed1a99a0803faef886f81607b1f7f5c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/loongson/lsdc_i2c.c: In function 'ls7a_gpio_i2c_set':
>> drivers/gpu/drm/loongson/lsdc_i2c.c:37:23: error: implicit declaration of function 'readb' [-Werror=implicit-function-declaration]
      37 |                 val = readb(li2c->dir_reg);
         |                       ^~~~~
>> drivers/gpu/drm/loongson/lsdc_i2c.c:39:17: error: implicit declaration of function 'writeb' [-Werror=implicit-function-declaration]
      39 |                 writeb(val, li2c->dir_reg);
         |                 ^~~~~~
   cc1: some warnings being treated as errors


vim +/readb +37 drivers/gpu/drm/loongson/lsdc_i2c.c

    19	
    20	/*
    21	 * ls7a_gpio_i2c_set - set the state of a gpio pin, either high or low.
    22	 * @mask: gpio pin mask indicate which pin to set
    23	 */
    24	static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
    25	{
    26		unsigned long flags;
    27		u8 val;
    28	
    29		spin_lock_irqsave(&li2c->reglock, flags);
    30	
    31		if (state) {
    32			/*
    33			 * The high state is achieved by setting the direction as
    34			 * input, because the GPIO is open drained with external
    35			 * pull up resistance.
    36			 */
  > 37			val = readb(li2c->dir_reg);
    38			val |= mask;
  > 39			writeb(val, li2c->dir_reg);
    40		} else {
    41			/* First, set this pin as output */
    42			val = readb(li2c->dir_reg);
    43			val &= ~mask;
    44			writeb(val, li2c->dir_reg);
    45	
    46			/* Then, set the state to it */
    47			val = readb(li2c->dat_reg);
    48			val &= ~mask;
    49			writeb(val, li2c->dat_reg);
    50		}
    51	
    52		spin_unlock_irqrestore(&li2c->reglock, flags);
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
