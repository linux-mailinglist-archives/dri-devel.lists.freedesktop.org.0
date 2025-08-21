Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DADB2EE89
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 08:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D1510E87E;
	Thu, 21 Aug 2025 06:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1uks7Iz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EED210E87E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 06:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755758814; x=1787294814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d7RhC2fsTWwVhobWw3PonU9nT5IyDG5yahvZlbUImeI=;
 b=K1uks7IzAyOtO6slu3nEgN7pe6Q5/sHGYBTBAfTFCzCHN+JmuQmvbMPA
 /MWL3ykHZN49n1s6Jj94p5nAhekjialcmcPNA02BqAp47ANbzcu6PeNyw
 4RgFx1/qB3K4u1DwgbGZErqZbI+rlGcJuTxONRX7KrpcCsWzoCA//76/V
 KOargSr39AGnzGzjqAjCnyhI++idASLrPzxiImGxUnH6odEzZN1W0m+hN
 FrG+bUbC8LOyHFZjTAD4Jrp8moFI8pxbjqyZhpVCab63oKfzzQ6u8ijOn
 G/M2uUNYjBhJnI+3BLeqy3P3XUHwBUX93Xh5uWiEA4JAKViu0x6grYanI w==;
X-CSE-ConnectionGUID: 2VCUhM1RQlGsiKFgT4/wbg==
X-CSE-MsgGUID: RTgAIqcYSB2de4e8jcZ0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68741542"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="68741542"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 23:46:53 -0700
X-CSE-ConnectionGUID: k1/lA4lDR/mP90NzjvyyuA==
X-CSE-MsgGUID: 1mSzPClsREmtMFAev7O/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="205500084"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 20 Aug 2025 23:46:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uoz48-000K1D-1V;
 Thu, 21 Aug 2025 06:46:42 +0000
Date: Thu, 21 Aug 2025 14:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <202508211421.aYwuLvvk-lkp@intel.com>
References: <20250820144128.17603-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820144128.17603-3-mike.looijmans@topic.nl>
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

Hi Mike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 53e760d8949895390e256e723e7ee46618310361]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Looijmans/dt-bindings-drm-bridge-ti-tmds181-Add-TI-TMDS181-and-SN65DP159-bindings/20250820-224316
base:   53e760d8949895390e256e723e7ee46618310361
patch link:    https://lore.kernel.org/r/20250820144128.17603-3-mike.looijmans%40topic.nl
patch subject: [PATCH v3 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250821/202508211421.aYwuLvvk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211421.aYwuLvvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211421.aYwuLvvk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ti-tmds181.c:292:9: warning: cast to smaller integer type 'enum tmds181_chip' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     292 |         chip = (enum tmds181_chip)of_device_get_match_data(&client->dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +292 drivers/gpu/drm/bridge/ti-tmds181.c

   252	
   253	static int tmds181_probe(struct i2c_client *client)
   254	{
   255		struct tmds181_data *data;
   256		struct gpio_desc *oe_gpio;
   257		enum tmds181_chip chip;
   258		int ret;
   259		u32 param;
   260		u8 val;
   261	
   262		/* Check if the adapter supports the needed features */
   263		if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
   264			return -EIO;
   265	
   266		data = devm_drm_bridge_alloc(&client->dev, struct tmds181_data, bridge,
   267					     &tmds181_bridge_funcs);
   268		if (IS_ERR(data))
   269			return PTR_ERR(data);
   270	
   271		data->client = client;
   272		i2c_set_clientdata(client, data);
   273		data->regmap = devm_regmap_init_i2c(client, &tmds181_regmap_config);
   274		if (IS_ERR(data->regmap))
   275			return PTR_ERR(data->regmap);
   276	
   277		/* The "OE" pin acts as a reset */
   278		oe_gpio = devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW);
   279		if (IS_ERR(oe_gpio)) {
   280			ret = PTR_ERR(oe_gpio);
   281			if (ret != -EPROBE_DEFER)
   282				dev_err(&client->dev, "failed to acquire 'oe' gpio\n");
   283			return ret;
   284		}
   285		if (oe_gpio) {
   286			/* Need at least 100us reset pulse */
   287			usleep_range(100, 200);
   288			gpiod_set_value_cansleep(oe_gpio, 1);
   289		}
   290	
   291		/* Reading the ID also provides enough time for the reset */
 > 292		chip = (enum tmds181_chip)of_device_get_match_data(&client->dev);
   293		ret = tmds181_check_id(data, &chip);
   294		if (ret)
   295			return ret;
   296	
   297		/*
   298		 * We take care of power control, so disable the chips PM functions, and
   299		 * allow the DDC to run at 400kHz
   300		 */
   301		regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
   302				TMDS181_CTRL9_SIG_EN | TMDS181_CTRL9_PD_EN |
   303				TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
   304				TMDS181_CTRL9_I2C_DR_CTL,
   305				TMDS181_CTRL9_PD_EN |
   306				TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
   307				TMDS181_CTRL9_I2C_DR_CTL);
   308	
   309		/* Apply configuration changes */
   310		if (of_property_read_bool(client->dev.of_node, "ti,source-mode"))
   311			regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   312					   TMDS181_CTRLA_MODE_SINK, 0);
   313		if (of_property_read_bool(client->dev.of_node, "ti,sink-mode"))
   314			regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   315					   TMDS181_CTRLA_MODE_SINK, TMDS181_CTRLA_MODE_SINK);
   316	
   317		/*
   318		 * Using the automatic modes of the chip uses considerable power as it
   319		 * will keep the PLL running at all times. So instead, define our own
   320		 * threshold for the pixel rate. This also allows to use a sane default
   321		 * of 200MHz pixel rate for the redriver-retimer crossover point, as the
   322		 * modes below 3k don't show any benefit from the retimer.
   323		 */
   324		data->retimer_threshold_khz = 200000;
   325		if (!of_property_read_u32(client->dev.of_node,
   326					  "ti,retimer-threshold-hz", &param))
   327			data->retimer_threshold_khz = param / 1000;
   328	
   329		/* Default to low-power redriver mode */
   330		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   331				   TMDS181_CTRLA_DEV_FUNC_MODE, 0x00);
   332	
   333		if (of_property_read_bool(client->dev.of_node, "ti,adaptive-equalizer"))
   334			regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   335					   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
   336					   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN);
   337		if (of_property_read_bool(client->dev.of_node, "ti,disable-equalizer"))
   338			regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   339					   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
   340					   0);
   341	
   342		switch (chip) {
   343		case dp159:
   344			val = 0;
   345			if (!of_property_read_u32(client->dev.of_node,
   346						  "ti,slew-rate", &param)) {
   347				if (param > 3) {
   348					dev_err(&client->dev, "invalid slew-rate\n");
   349					return -EINVAL;
   350				}
   351				/* Implement 0 = slow, 3 = fast slew rate */
   352				val = FIELD_PREP(TMDS181_CTRLB_SLEW_CTL, (3 - param));
   353			}
   354			if (of_property_read_bool(client->dev.of_node, "ti,dvi-mode"))
   355				val |= TMDS181_CTRLB_HDMI_SEL_DVI;
   356			break;
   357		default:
   358			val = TMDS181_CTRLB_DDC_DR_SEL;
   359			break;
   360		}
   361	
   362		/* Default to low-speed termination */
   363		val |= FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, TMDS181_CTRLB_TX_TERM_150_300_OHMS);
   364	
   365		ret = regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
   366		if (ret < 0) {
   367			dev_err(&client->dev, "regmap_write(B) failed\n");
   368			return ret;
   369		}
   370	
   371		/* Find next bridge in chain */
   372		data->next_bridge = devm_drm_of_get_bridge(&client->dev, client->dev.of_node, 1, 0);
   373		if (IS_ERR(data->next_bridge))
   374			return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
   375					     "Failed to find next bridge\n");
   376	
   377		/* Register the bridge. */
   378		data->bridge.of_node = client->dev.of_node;
   379	
   380		return devm_drm_bridge_add(&client->dev, &data->bridge);
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
