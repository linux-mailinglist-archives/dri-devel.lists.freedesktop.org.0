Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E5B2D00C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 01:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179110E226;
	Tue, 19 Aug 2025 23:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOAI0QJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFC10E227
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755646543; x=1787182543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UoBG8PeGPJVyxd9JSmBx2cgQbXskosf2NHxww4keNsk=;
 b=iOAI0QJZHd+D5istroFyiOuNdl1snrORgcTH5KiMTmahg+aXO09SIFFu
 gdXTcwfOQ1mMI3Bnj7zMJhSUXKeUgjH7459xLfI+YbPtIrpCmMJR8QdJ5
 N/2NLmEac6+pg/Tlz8wig+MHL+XyhoPbNHnZhfKBbpYJAdGm5qBJsPTiN
 hzad8dbLgRij00j0/VTeaB89uyYVVtHM7C6LTC/QcFrkGWSAqx8tY6tr3
 tO3ZN2RpgpOicdUcUPIcqM8HFb5M8S1Obt2ScT8jzD6K1OAjeuZ/DO46z
 s++qyaJzd3yhuCdGWwab29AkmBR6d9P76HPcNNCj7oV9Bd7HzMYyYFFYX A==;
X-CSE-ConnectionGUID: SXvvF+ODSZ+ht54HG5abTA==
X-CSE-MsgGUID: gZ/c1NcYTv2sCk/mmRl04Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58003629"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58003629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 16:35:43 -0700
X-CSE-ConnectionGUID: 0O8j5+TvRxqPeA33zeo0Dw==
X-CSE-MsgGUID: uRAXroCVSIWG87Mbn+uHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168774587"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2025 16:35:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uoVrS-000Hm7-0K;
 Tue, 19 Aug 2025 23:35:30 +0000
Date: Wed, 20 Aug 2025 07:35:18 +0800
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
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <202508200712.FUHg7vmw-lkp@intel.com>
References: <20250819053205.9976-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819053205.9976-3-mike.looijmans@topic.nl>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 53e760d8949895390e256e723e7ee46618310361]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Looijmans/dt-bindings-drm-bridge-ti-tmds181-Add-TI-TMDS181-and-SN65DP159-bindings/20250819-133458
base:   53e760d8949895390e256e723e7ee46618310361
patch link:    https://lore.kernel.org/r/20250819053205.9976-3-mike.looijmans%40topic.nl
patch subject: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250820/202508200712.FUHg7vmw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200712.FUHg7vmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200712.FUHg7vmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/ti-tmds181.c: In function 'tmds181_enable':
>> drivers/gpu/drm/bridge/ti-tmds181.c:165:28: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     165 |                            FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
         |                            ^~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:137:40: warning: unused variable 'bridge_state' [-Wunused-variable]
     137 |         const struct drm_bridge_state *bridge_state;
         |                                        ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c: At top level:
   drivers/gpu/drm/bridge/ti-tmds181.c:181:27: error: initialization of 'int (*)(struct drm_bridge *, struct drm_encoder *, enum drm_bridge_attach_flags)' from incompatible pointer type 'int (*)(struct drm_bridge *, enum drm_bridge_attach_flags)' [-Wincompatible-pointer-types]
     181 |         .attach         = tmds181_attach,
         |                           ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:181:27: note: (near initialization for 'tmds181_bridge_funcs.attach')
   drivers/gpu/drm/bridge/ti-tmds181.c:102:12: note: 'tmds181_attach' declared here
     102 | static int tmds181_attach(struct drm_bridge *bridge,
         |            ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:183:27: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-pointer-types]
     183 |         .atomic_enable  = tmds181_enable,
         |                           ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:183:27: note: (near initialization for 'tmds181_bridge_funcs.atomic_enable')
   drivers/gpu/drm/bridge/ti-tmds181.c:133:13: note: 'tmds181_enable' declared here
     133 | static void tmds181_enable(struct drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
         |             ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:184:27: error: initialization of 'void (*)(struct drm_bridge *, struct drm_atomic_state *)' from incompatible pointer type 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' [-Wincompatible-pointer-types]
     184 |         .atomic_disable = tmds181_disable,
         |                           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c:184:27: note: (near initialization for 'tmds181_bridge_funcs.atomic_disable')
   drivers/gpu/drm/bridge/ti-tmds181.c:171:13: note: 'tmds181_disable' declared here
     171 | static void tmds181_disable(struct drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
         |             ^~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c: In function 'termination_show':
>> drivers/gpu/drm/bridge/ti-tmds181.c:297:26: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     297 |                          FIELD_GET(TMDS181_CTRLB_TX_TERM_CTL, val));
         |                          ^~~~~~~~~
   drivers/gpu/drm/bridge/ti-tmds181.c: At top level:
   drivers/gpu/drm/bridge/ti-tmds181.c:96:12: warning: 'tmds181_apply_changes' defined but not used [-Wunused-function]
      96 | static int tmds181_apply_changes(struct tmds181_data *data)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +165 drivers/gpu/drm/bridge/ti-tmds181.c

   132	
   133	static void tmds181_enable(struct drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
   134	{
   135		struct tmds181_data *data = drm_bridge_to_tmds181_data(bridge);
   136		struct drm_atomic_state *state = old_bridge_state->base.state;
   137		const struct drm_bridge_state *bridge_state;
   138		const struct drm_crtc_state *crtc_state;
   139		const struct drm_display_mode *mode;
   140		struct drm_connector *connector;
   141		struct drm_crtc *crtc;
   142		unsigned int val;
   143	
   144		/*
   145		 * Retrieve the CRTC adjusted mode. This requires a little dance to go
   146		 * from the bridge to the encoder, to the connector and to the CRTC.
   147		 */
   148		connector = drm_atomic_get_new_connector_for_encoder(state,
   149								     bridge->encoder);
   150		crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
   151		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
   152		mode = &crtc_state->adjusted_mode;
   153	
   154		/* Set retimer/redriver mode based on pixel clock */
   155		val = mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_FUNC_MODE : 0;
   156		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
   157				   TMDS181_CTRLA_DEV_FUNC_MODE, val);
   158	
   159		/* Configure TX termination based on pixel clock */
   160		val = mode->clock > HDMI2_PIXEL_RATE_KHZ ?
   161					TMDS181_CTRLB_TX_TERM_75_150_OHMS :
   162					TMDS181_CTRLB_TX_TERM_150_300_OHMS;
   163		regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
   164				   TMDS181_CTRLB_TX_TERM_CTL,
 > 165				   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
   166	
   167		regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
   168				   TMDS181_CTRL9_PD_EN, 0);
   169	}
   170	
   171	static void tmds181_disable(struct drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
   172	{
   173		struct tmds181_data *data = drm_bridge_to_tmds181_data(bridge);
   174	
   175		/* Set the PD_EN bit */
   176		regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
   177				   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
   178	}
   179	
   180	static const struct drm_bridge_funcs tmds181_bridge_funcs = {
   181		.attach		= tmds181_attach,
   182		.mode_valid	= tmds181_mode_valid,
   183		.atomic_enable	= tmds181_enable,
   184		.atomic_disable	= tmds181_disable,
   185	
   186		.atomic_reset = drm_atomic_helper_bridge_reset,
   187		.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
   188		.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
   189	};
   190	
   191	static const char * const tmds181_modes[] = {
   192		"redriver",
   193		"auto1",
   194		"auto2",
   195		"retimer",
   196	};
   197	
   198	static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
   199				 char *buf)
   200	{
   201		struct tmds181_data *data = dev_get_drvdata(dev);
   202		const char *equalizer;
   203		u32 val;
   204		int ret;
   205	
   206		ret = regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
   207		if (ret < 0)
   208			return ret;
   209	
   210		if (val & BIT(4)) {
   211			if (val & BIT(5))
   212				equalizer = "eq-adaptive";
   213			else
   214				equalizer = "eq-fixed";
   215		} else {
   216			equalizer = "eq-disabled";
   217		}
   218	
   219		return scnprintf(buf, PAGE_SIZE, "%6s %s %s\n",
   220				(val & BIT(7)) ? "sink" : "source",
   221				tmds181_modes[val & 0x03],
   222				equalizer);
   223	}
   224	
   225	static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
   226				  const char *buf, size_t len)
   227	{
   228		struct tmds181_data *data = dev_get_drvdata(dev);
   229		u32 val;
   230		int ret;
   231		int i;
   232	
   233		/* Strip trailing newline(s) for being user friendly */
   234		while (len && buf[len] == '\n')
   235			--len;
   236	
   237		/* Need at least 4 actual characters */
   238		if (len < 4)
   239			return -EINVAL;
   240	
   241		ret = regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
   242		if (ret < 0)
   243			return ret;
   244	
   245		for (i = 0; i < ARRAY_SIZE(tmds181_modes); ++i) {
   246			if (strncmp(tmds181_modes[i], buf, len) == 0) {
   247				val &= ~TMDS181_CTRLA_DEV_FUNC_MODE;
   248				val |= FIELD_PREP(TMDS181_CTRLA_DEV_FUNC_MODE, i);
   249				break;
   250			}
   251		}
   252	
   253		if (strncmp("sink", buf, len) == 0)
   254			val |= TMDS181_CTRLA_MODE_SINK;
   255	
   256		if (strncmp("source", buf, len) == 0)
   257			val &= ~TMDS181_CTRLA_MODE_SINK;
   258	
   259		if (strncmp("eq-", buf, 3) == 0) {
   260			switch (buf[3]) {
   261			case 'a': /* adaptive */
   262				val |= TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN;
   263				break;
   264			case 'f': /* fixed */
   265				val |= TMDS181_CTRLA_EQ_EN;
   266				val &= ~TMDS181_CTRLA_EQ_ADA_EN;
   267				break;
   268			case 'd': /* disable */
   269				val &= ~(TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN);
   270				break;
   271			}
   272		}
   273	
   274		/* Always set the "apply changes" bit */
   275		val |= TMDS181_CTRLA_APPLY;
   276	
   277		ret = regmap_write(data->regmap, TMDS181_REG_CTRLA, val);
   278		if (ret < 0)
   279			return ret;
   280	
   281		return len;
   282	}
   283	
   284	/* termination for HDMI TX: 0=off, 1=150..300, 3=75..150 ohms */
   285	static ssize_t termination_show(struct device *dev,
   286			struct device_attribute *attr, char *buf)
   287	{
   288		struct tmds181_data *data = dev_get_drvdata(dev);
   289		u32 val;
   290		int ret;
   291	
   292		ret = regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
   293		if (ret < 0)
   294			return ret;
   295	
   296		return scnprintf(buf, PAGE_SIZE, "%u\n",
 > 297				 FIELD_GET(TMDS181_CTRLB_TX_TERM_CTL, val));
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
