Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C341CBB1E0
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 18:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD84F10E1BE;
	Sat, 13 Dec 2025 17:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYtSeqpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F4E10E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765647253; x=1797183253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YSbuTBIlzPrLiem4wRujUcouD4hirFezUKyLBGx4aYE=;
 b=hYtSeqpIp46wVNMxiIefbdiu7o6iWZ+tFHzDdWKGbyJ22qpyG1+33yuh
 qqRmIMpAegGCq0H+4iJOWQvO/ligw8bT2SmwG2jWsUUItKr1GdogjW88x
 eLJk+Hgw+bOe3uIATftsTaScsFB6W9/+MCiM9dFSs+uWe3YLmBmxCkT6S
 OAiANzctwggkSkMQkgimQ9+tuMn362uNEe9Oqrf7R38R+siEiK/zQyFdL
 Gi2iIdc2LhEDldpM5spbKcs5uTPZzt8VHlF7qkzlH5liD8NlF08kNbkXT
 EwqKR0QsIuUQe9Crxwb+1E6V8gXqxJGGoMyuiLP0rDgjuCZeCtnZUh8iR g==;
X-CSE-ConnectionGUID: 1utX8CqhTd+FnQC7ETQxzw==
X-CSE-MsgGUID: g7UvmOh/TIiaLsaZ1Ey4Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71466840"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; d="scan'208";a="71466840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2025 09:34:13 -0800
X-CSE-ConnectionGUID: U2A9g5b+SUy+YPvqzYTSSw==
X-CSE-MsgGUID: qzQEF6zzTcyQTO3n73QR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; d="scan'208";a="197617095"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 09:34:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vUTVN-000000007zp-00v0;
 Sat, 13 Dec 2025 17:34:05 +0000
Date: Sun, 14 Dec 2025 01:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>,
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
 Hongzhi Wang <hongzhi.wang@advantech.com>,
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
 Thomas Kastner <thomas.kastner@advantech.com>,
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: Re: [PATCH 8/8] Add Advantech EIO Fan driver
Message-ID: <202512140153.dNgpAKJt-lkp@intel.com>
References: <20251212-upstream-v1-v1-8-d50d40ec8d8a@advantech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-8-d50d40ec8d8a@advantech.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ramiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9771d0dbe18dd643760431870a6abf9b0866bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
base:   d9771d0dbe18dd643760431870a6abf9b0866bb0
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-8-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 8/8] Add Advantech EIO Fan driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140153.dNgpAKJt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140153.dNgpAKJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140153.dNgpAKJt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/eio_fan.c: In function 'eio_fan_probe':
>> drivers/thermal/eio_fan.c:391:21: warning: variable 'temps_mc' set but not used [-Wunused-but-set-variable]
     391 |                 int temps_mc[TRIP_NUM];
         |                     ^~~~~~~~


vim +/temps_mc +391 drivers/thermal/eio_fan.c

   375	
   376	static int eio_fan_probe(struct platform_device *pdev)
   377	{
   378		struct device *dev = &pdev->dev;
   379		unsigned int fan_id;
   380		int ret;
   381	
   382		if (!dev_get_drvdata(dev->parent)) {
   383			dev_err(dev, "eio_core not present\n");
   384			return -ENODEV;
   385		}
   386	
   387		for (fan_id = 0; fan_id < FAN_MAX; fan_id++) {
   388			u8 state = 0, name = 0;
   389			int trip_hi = 0, trip_lo = 0, trip_stop = 0;
   390			int pwm_hi = 0, pwm_lo = 0;
 > 391			int temps_mc[TRIP_NUM];
   392			struct eio_fan_dev *fan;
   393			struct thermal_zone_device *tzd;
   394			struct thermal_cooling_device *cdev;
   395	
   396			if (pmc_read(dev->parent, CTRL_STATE, fan_id, &state) ||
   397			    pmc_read(dev->parent, CTRL_TYPE, fan_id, &name) ||
   398			    pmc_read(dev->parent, CTRL_THERM_HIGH, fan_id, &trip_hi) ||
   399			    pmc_read(dev->parent, CTRL_THERM_LOW, fan_id, &trip_lo) ||
   400			    pmc_read(dev->parent, CTRL_THERM_STOP, fan_id, &trip_stop) ||
   401			    pmc_read(dev->parent, CTRL_PWM_HIGH, fan_id, &pwm_hi) ||
   402			    pmc_read(dev->parent, CTRL_PWM_LOW, fan_id, &pwm_lo)) {
   403				dev_info(dev, "fan%u: pmc read error, skipping\n", fan_id);
   404				continue;
   405			}
   406	
   407			if (!(state & 0x1)) {
   408				dev_info(dev, "fan%u: firmware reports disabled\n", fan_id);
   409				continue;
   410			}
   411	
   412			if (!fan_name[name][0]) {
   413				dev_info(dev, "fan%u: unknown name index %u\n", fan_id, name);
   414				continue;
   415			}
   416	
   417			temps_mc[TRIP_HIGH] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi);
   418			temps_mc[TRIP_LOW]  = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo);
   419			temps_mc[TRIP_STOP] = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop);
   420	
   421			fan = devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
   422			if (!fan)
   423				return -ENOMEM;
   424	
   425			fan->mfd = dev->parent;
   426			fan->id  = (u8)fan_id;
   427	
   428			fan->trip_priv[TRIP_HIGH].trip_ctl = CTRL_THERM_HIGH;
   429			fan->trip_priv[TRIP_LOW].trip_ctl  = CTRL_THERM_LOW;
   430			fan->trip_priv[TRIP_STOP].trip_ctl = CTRL_THERM_STOP;
   431	
   432			struct thermal_trip trips[TRIP_NUM] = {
   433				[TRIP_HIGH] = {
   434					.type = THERMAL_TRIP_ACTIVE,
   435					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_hi),
   436					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   437					.priv = &fan->trip_priv[TRIP_HIGH],
   438				},
   439				[TRIP_LOW] = {
   440					.type = THERMAL_TRIP_ACTIVE,
   441					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_lo),
   442					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   443					.priv = &fan->trip_priv[TRIP_LOW],
   444				},
   445				[TRIP_STOP] = {
   446					.type = THERMAL_TRIP_ACTIVE,
   447					.temperature = DECI_KELVIN_TO_MILLI_CELSIUS(trip_stop),
   448					.flags = THERMAL_TRIP_FLAG_RW_TEMP,
   449					.priv = &fan->trip_priv[TRIP_STOP],
   450				},
   451			};
   452	
   453			tzd = thermal_zone_device_register_with_trips(fan_name[name],
   454								      trips, TRIP_NUM,
   455								      fan,
   456								      &zone_ops,
   457								      NULL,
   458								      0, 0);
   459			if (IS_ERR(tzd))
   460				return PTR_ERR(tzd);
   461	
   462			cdev = thermal_cooling_device_register(fan_name[name], fan, &cooling_ops);
   463			if (IS_ERR(cdev)) {
   464				thermal_zone_device_unregister(tzd);
   465				dev_err(dev, "fan%u: cdev register failed: %ld\n",
   466					fan_id, PTR_ERR(cdev));
   467				return PTR_ERR(cdev);
   468			}
   469	
   470			dev_set_drvdata(thermal_zone_device(tzd), tzd);
   471			ret = device_create_file(thermal_zone_device(tzd), &dev_attr_fan_mode);
   472			if (ret)
   473				dev_warn(dev, "Error create thermal zone fan_mode sysfs\n");
   474		}
   475		return 0;
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
