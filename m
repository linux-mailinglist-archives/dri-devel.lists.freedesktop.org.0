Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AA912E96
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 22:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE0C10E105;
	Fri, 21 Jun 2024 20:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SD438gxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1B610E105
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 20:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719002069; x=1750538069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g+pouUiiT7AeZC4HcBnx+iVl1hBdooJPKlXz8f+L6E4=;
 b=SD438gxjfaW0H6Ot29Y7gVWTQfsjT7ugHgQL5YNXNfYpGc4GF5TqneXN
 q+PV3Dubj5Ses4G05Iod2ROHaONSjMu/fuvcAjk6nWpVJ0ViXbhtEXViW
 uSOZdRIJUkzodAC2Ezcqt9twg1Wk63Zy0IRVOWxa892rRi6beYh+p3u4i
 zFYpTzhJgMl9eBzzZzuc4eg9nsf5t7dkwTE6g2hpf9jhgeNEomolpniip
 quXHH/PlFiY4u6tZLM2TprIxymZxLaJogiS2FkOTl/J5kH3QHg2PNtVS9
 Li5xAiJV7G0VS5gJIQJA8b7M5LZCbqe+FWAvmjGimrnS1YZoxiULTlX7p g==;
X-CSE-ConnectionGUID: kYXjmC+oRzqZClyDlNgySg==
X-CSE-MsgGUID: 5ZhiPvKqRe+PhbmFDmPlog==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16285633"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16285633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 13:34:28 -0700
X-CSE-ConnectionGUID: vjURhEvVTDqAJ4kaNuOtEg==
X-CSE-MsgGUID: LfHac5txTsiEbj3rI22Gnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="73910113"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2024 13:34:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sKkxf-0008za-1z;
 Fri, 21 Jun 2024 20:34:19 +0000
Date: Sat, 22 Jun 2024 04:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 17/23] mfd: add s2dos series core driver
Message-ID: <202406220455.UpxNyPhg-lkp@intel.com>
References: <20240618-starqltechn_integration_upstream-v3-17-e3f6662017ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-17-e3f6662017ac@gmail.com>
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

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6906a84c482f098d31486df8dc98cead21cce2d0]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/power-supply-add-undervoltage-health-status-property/20240618-222456
base:   6906a84c482f098d31486df8dc98cead21cce2d0
patch link:    https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-17-e3f6662017ac%40gmail.com
patch subject: [PATCH v3 17/23] mfd: add s2dos series core driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240622/202406220455.UpxNyPhg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220455.UpxNyPhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220455.UpxNyPhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/s2dos-core.c: In function 's2dos05_i2c_probe':
>> drivers/mfd/s2dos-core.c:88:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      88 |         int ret = 0;
         |             ^~~


vim +/ret +88 drivers/mfd/s2dos-core.c

    79	
    80	
    81	static int s2dos05_i2c_probe(struct i2c_client *i2c)
    82	{
    83		struct s2dos_core *s2dos05;
    84		struct regmap *regmap;
    85		struct device *dev = &i2c->dev;
    86	
    87		unsigned int reg_data;
  > 88		int ret = 0;
    89	
    90		s2dos05 = kzalloc(sizeof(struct s2dos_core), GFP_KERNEL);
    91		if (!s2dos05)
    92			return -ENOMEM;
    93	
    94		regmap = devm_regmap_init_i2c(i2c, &s2dos05_regmap_config);
    95		if (IS_ERR(regmap)) {
    96			dev_err(dev, "Unable to initialise I2C Regmap\n");
    97			return PTR_ERR(regmap);
    98		}
    99		s2dos05->regmap = regmap;
   100	
   101		if (regmap_read(regmap, S2DOS05_REG_DEV_ID, &reg_data) < 0) {
   102			dev_err(dev,
   103				"device not found on this channel (this is not an error)\n");
   104			ret = -ENODEV;
   105		} else {
   106			dev_info(dev, "%s device found with id: .0x%x\n",
   107					__func__, reg_data);
   108		}
   109	
   110		i2c_set_clientdata(i2c, s2dos05);
   111	
   112		debugfs_file = debugfs_create_file("s2dos05-regs",
   113					0664, NULL, (void *)s2dos05,
   114					  &s2dos05_debugfs_fops);
   115		if (!debugfs_file)
   116			dev_err(dev, "Failed to create debugfs file\n");
   117	
   118		return mfd_add_devices(dev, -1, s2dos05_devs,
   119				ARRAY_SIZE(s2dos05_devs), NULL, 0, NULL);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
