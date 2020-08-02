Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A73C235756
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 16:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6E189F0B;
	Sun,  2 Aug 2020 14:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2EC89F0B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 14:06:06 +0000 (UTC)
IronPort-SDR: SwEy4I92aTXpVf/ID7noXnnoj4AvVljeRRPB0L3pMt1Qua4ULt6X2dCKhy5T4Oqch9QuypFBDJ
 VnpGPNZNuxBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="139572345"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; 
 d="gz'50?scan'50,208,50";a="139572345"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 07:06:06 -0700
IronPort-SDR: Q3u2Tz2985X/i+mH7koe0t4rcwHxdQW7BJD0B80MCsF1/lZO0q3FzcZru1SlOpwFZDSZQWT7Wb
 nUzCxTbqSTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; 
 d="gz'50?scan'50,208,50";a="305546227"
Received: from lkp-server01.sh.intel.com (HELO e21119890065) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 Aug 2020 07:06:01 -0700
Received: from kbuild by e21119890065 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k2Ecj-0001cG-7S; Sun, 02 Aug 2020 14:06:01 +0000
Date: Sun, 2 Aug 2020 22:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 16/22] drm/bridge: parade-ps8622: Backlight update
Message-ID: <202008022254.9UWPo5f5%lkp@intel.com>
References: <20200802110636.1018743-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20200802110636.1018743-17-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild-all@lists.01.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, clang-built-linux@googlegroups.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on backlight/for-backlight-next]
[also build test ERROR on next-20200731]
[cannot apply to drm-intel/for-linux-next drm-tip/drm-tip linus/master drm/drm-next v5.8-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sam-Ravnborg/backlight-add-init-macros-and-accessors/20200802-190940
base:    for-backlight-next
config: x86_64-randconfig-a011-20200802 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 25af353b0e74907d5d50c8616b885bd1f73a68b3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/parade-ps8622.c:337:48: error: implicit declaration of function 'blacklight_get_brightness' [-Werror,-Wimplicit-function-declaration]
           return ps8622_set(ps8622->client, 0x01, 0xa7, blacklight_get_brightness(bl));
                                                         ^
   drivers/gpu/drm/bridge/parade-ps8622.c:337:48: note: did you mean 'backlight_get_brightness'?
   include/linux/backlight.h:469:19: note: 'backlight_get_brightness' declared here
   static inline int backlight_get_brightness(const struct backlight_device *bd)
                     ^
>> drivers/gpu/drm/bridge/parade-ps8622.c:519:2: error: must use 'struct' tag to refer to type 'backlight_device'
           backlight_device *bl;
           ^
           struct 
>> drivers/gpu/drm/bridge/parade-ps8622.c:521:52: error: use of undeclared identifier 'dev'
           bl = devm_backlight_device_register(dev, dev_name(dev), dev,
                                                             ^
   drivers/gpu/drm/bridge/parade-ps8622.c:521:38: error: use of undeclared identifier 'dev'
           bl = devm_backlight_device_register(dev, dev_name(dev), dev,
                                               ^
   drivers/gpu/drm/bridge/parade-ps8622.c:521:58: error: use of undeclared identifier 'dev'
           bl = devm_backlight_device_register(dev, dev_name(dev), dev,
                                                                   ^
   5 errors generated.

vim +/blacklight_get_brightness +337 drivers/gpu/drm/bridge/parade-ps8622.c

   329	
   330	static int ps8622_backlight_update(struct backlight_device *bl)
   331	{
   332		struct ps8622_bridge *ps8622 = dev_get_drvdata(&bl->dev);
   333	
   334		if (!ps8622->enabled)
   335			return -EINVAL;
   336	
 > 337		return ps8622_set(ps8622->client, 0x01, 0xa7, blacklight_get_brightness(bl));
   338	}
   339	
   340	static const struct backlight_ops ps8622_backlight_ops = {
   341		.update_status	= ps8622_backlight_update,
   342	};
   343	
   344	static void ps8622_pre_enable(struct drm_bridge *bridge)
   345	{
   346		struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
   347		int ret;
   348	
   349		if (ps8622->enabled)
   350			return;
   351	
   352		gpiod_set_value(ps8622->gpio_rst, 0);
   353	
   354		if (ps8622->v12) {
   355			ret = regulator_enable(ps8622->v12);
   356			if (ret)
   357				DRM_ERROR("fails to enable ps8622->v12");
   358		}
   359	
   360		if (drm_panel_prepare(ps8622->panel)) {
   361			DRM_ERROR("failed to prepare panel\n");
   362			return;
   363		}
   364	
   365		gpiod_set_value(ps8622->gpio_slp, 1);
   366	
   367		/*
   368		 * T1 is the range of time that it takes for the power to rise after we
   369		 * enable the lcd/ps8622 fet. T2 is the range of time in which the
   370		 * data sheet specifies we should deassert the reset pin.
   371		 *
   372		 * If it takes T1.max for the power to rise, we need to wait atleast
   373		 * T2.min before deasserting the reset pin. If it takes T1.min for the
   374		 * power to rise, we need to wait at most T2.max before deasserting the
   375		 * reset pin.
   376		 */
   377		usleep_range(PS8622_RST_HIGH_T2_MIN_US + PS8622_POWER_RISE_T1_MAX_US,
   378			     PS8622_RST_HIGH_T2_MAX_US + PS8622_POWER_RISE_T1_MIN_US);
   379	
   380		gpiod_set_value(ps8622->gpio_rst, 1);
   381	
   382		/* wait 20ms after RST high */
   383		usleep_range(20000, 30000);
   384	
   385		ret = ps8622_send_config(ps8622);
   386		if (ret) {
   387			DRM_ERROR("Failed to send config to bridge (%d)\n", ret);
   388			return;
   389		}
   390	
   391		ps8622->enabled = true;
   392	}
   393	
   394	static void ps8622_enable(struct drm_bridge *bridge)
   395	{
   396		struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
   397	
   398		if (drm_panel_enable(ps8622->panel)) {
   399			DRM_ERROR("failed to enable panel\n");
   400			return;
   401		}
   402	}
   403	
   404	static void ps8622_disable(struct drm_bridge *bridge)
   405	{
   406		struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
   407	
   408		if (drm_panel_disable(ps8622->panel)) {
   409			DRM_ERROR("failed to disable panel\n");
   410			return;
   411		}
   412		msleep(PS8622_PWMO_END_T12_MS);
   413	}
   414	
   415	static void ps8622_post_disable(struct drm_bridge *bridge)
   416	{
   417		struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
   418	
   419		if (!ps8622->enabled)
   420			return;
   421	
   422		ps8622->enabled = false;
   423	
   424		/*
   425		 * This doesn't matter if the regulators are turned off, but something
   426		 * else might keep them on. In that case, we want to assert the slp gpio
   427		 * to lower power.
   428		 */
   429		gpiod_set_value(ps8622->gpio_slp, 0);
   430	
   431		if (drm_panel_unprepare(ps8622->panel)) {
   432			DRM_ERROR("failed to unprepare panel\n");
   433			return;
   434		}
   435	
   436		if (ps8622->v12)
   437			regulator_disable(ps8622->v12);
   438	
   439		/*
   440		 * Sleep for at least the amount of time that it takes the power rail to
   441		 * fall to prevent asserting the rst gpio from doing anything.
   442		 */
   443		usleep_range(PS8622_POWER_FALL_T16_MAX_US,
   444			     2 * PS8622_POWER_FALL_T16_MAX_US);
   445		gpiod_set_value(ps8622->gpio_rst, 0);
   446	
   447		msleep(PS8622_POWER_OFF_T17_MS);
   448	}
   449	
   450	static int ps8622_get_modes(struct drm_connector *connector)
   451	{
   452		struct ps8622_bridge *ps8622;
   453	
   454		ps8622 = connector_to_ps8622(connector);
   455	
   456		return drm_panel_get_modes(ps8622->panel, connector);
   457	}
   458	
   459	static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
   460		.get_modes = ps8622_get_modes,
   461	};
   462	
   463	static const struct drm_connector_funcs ps8622_connector_funcs = {
   464		.fill_modes = drm_helper_probe_single_connector_modes,
   465		.destroy = drm_connector_cleanup,
   466		.reset = drm_atomic_helper_connector_reset,
   467		.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
   468		.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
   469	};
   470	
   471	static int ps8622_attach(struct drm_bridge *bridge,
   472				 enum drm_bridge_attach_flags flags)
   473	{
   474		struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
   475		int ret;
   476	
   477		if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
   478			DRM_ERROR("Fix bridge driver to make connector optional!");
   479			return -EINVAL;
   480		}
   481	
   482		if (!bridge->encoder) {
   483			DRM_ERROR("Parent encoder object not found");
   484			return -ENODEV;
   485		}
   486	
   487		ps8622->connector.polled = DRM_CONNECTOR_POLL_HPD;
   488		ret = drm_connector_init(bridge->dev, &ps8622->connector,
   489				&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
   490		if (ret) {
   491			DRM_ERROR("Failed to initialize connector with drm\n");
   492			return ret;
   493		}
   494		drm_connector_helper_add(&ps8622->connector,
   495						&ps8622_connector_helper_funcs);
   496		drm_connector_register(&ps8622->connector);
   497		drm_connector_attach_encoder(&ps8622->connector,
   498								bridge->encoder);
   499	
   500		if (ps8622->panel)
   501			drm_panel_attach(ps8622->panel, &ps8622->connector);
   502	
   503		drm_helper_hpd_irq_event(ps8622->connector.dev);
   504	
   505		return ret;
   506	}
   507	
   508	static const struct drm_bridge_funcs ps8622_bridge_funcs = {
   509		.pre_enable = ps8622_pre_enable,
   510		.enable = ps8622_enable,
   511		.disable = ps8622_disable,
   512		.post_disable = ps8622_post_disable,
   513		.attach = ps8622_attach,
   514	};
   515	
   516	static int ps8622_register_blacklight(struct ps8622_bridge *ps8622)
   517	{
   518		DECLARE_BACKLIGHT_INIT_RAW(props, PS8622_MAX_BRIGHTNESS, PS8622_MAX_BRIGHTNESS);
 > 519		backlight_device *bl;
   520	
 > 521		bl = devm_backlight_device_register(dev, dev_name(dev), dev,
   522						    ps8622, &ps8622_backlight_ops, &props);
   523		if (IS_ERR(bl)) {
   524			DRM_ERROR("failed to register backlight\n");
   525			return PTR_ERR(bl);
   526		}
   527	
   528		ps8622->bl = bl;
   529		return 0;
   530	}
   531	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--yrj/dFKFPuw6o+aM
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
x/EfnZUjj4ZmAgA=

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--yrj/dFKFPuw6o+aM--
