Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF437EC331
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 14:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B5710E076;
	Wed, 15 Nov 2023 13:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A08510E076
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700053388; x=1731589388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jR+SpxGigGkqu3uYug9c7aEwbnN0ADFZM5RPGfNymac=;
 b=MGVnREpYEHqAi71wgaoK0fTTPj0JqrrH5dUeL8V+y0WWCn4x/EMB/cZ9
 FVZZROGR+EcNBWl1jXzzipsY4VRlTs6OioeVc7+mg4AiCPC8IYX0XO7mI
 3IZLLb5nd2UwChkME1efD1I3avZe9VD8XGCJ8wK1RQ7tl56fSG/pDbX/P
 WduvzIw3O5iJf1YCnUdFdl7ma1Vax7dVMd4wO4p5exO6VGKfya4Npq0fi
 9O1D4k6Oy9I4N3FguB8NXip/l3quOOiPf3+pvHfOC8ceL8cLKwojOwCgY
 OcUtJryf8/AQ6t4QuT1sgVln1M/m99jfnPq5SZbfqcKTiIyGkFYxGtwLT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393727963"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="393727963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 05:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938480422"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="938480422"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 05:03:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r3FXp-0000L7-0h;
 Wed, 15 Nov 2023 13:03:01 +0000
Date: Wed, 15 Nov 2023 21:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <202311152059.KuAZPGVE-lkp@intel.com>
References: <20231114150130.497915-9-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114150130.497915-9-sui.jingfeng@linux.dev>
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-bridge-it66121-Use-dev-replace-ctx-dev-in-the-it66121_probe/20231114-231203
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231114150130.497915-9-sui.jingfeng%40linux.dev
patch subject: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
config: x86_64-randconfig-005-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152059.KuAZPGVE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152059.KuAZPGVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152059.KuAZPGVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ite-it66121.c:1654:5: warning: no previous prototype for 'it66121_create_bridge' [-Wmissing-prototypes]
    1654 | int it66121_create_bridge(struct i2c_client *client, bool of_support,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/ite-it66121.c:1752:6: warning: no previous prototype for 'it66121_destroy_bridge' [-Wmissing-prototypes]
    1752 | void it66121_destroy_bridge(struct drm_bridge *bridge)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/it66121_create_bridge +1654 drivers/gpu/drm/bridge/ite-it66121.c

  1653	
> 1654	int it66121_create_bridge(struct i2c_client *client, bool of_support,
  1655				  bool hpd_support, bool audio_support,
  1656				  struct drm_bridge **bridge)
  1657	{
  1658		struct device *dev = &client->dev;
  1659		int ret;
  1660		struct it66121_ctx *ctx;
  1661	
  1662		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
  1663		if (!ctx)
  1664			return -ENOMEM;
  1665	
  1666		ctx->dev = dev;
  1667		ctx->client = client;
  1668		mutex_init(&ctx->lock);
  1669	
  1670		if (of_support) {
  1671			ret = it66121_of_read_bus_width(dev, &ctx->bus_width);
  1672			if (ret)
  1673				return ret;
  1674	
  1675			ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
  1676			if (ret)
  1677				return ret;
  1678		} else {
  1679			ctx->bus_width = 24;
  1680			ctx->next_bridge = NULL;
  1681		}
  1682	
  1683		it66121_hw_reset(ctx);
  1684	
  1685		ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
  1686		if (IS_ERR(ctx->regmap))
  1687			return PTR_ERR(ctx->regmap);
  1688	
  1689		ret = it66121_read_chip_id(ctx, false);
  1690		if (ret)
  1691			return ret;
  1692	
  1693		ctx->info = it66121_get_match_data(ctx->vender_id, ctx->device_id);
  1694		if (!ctx->info)
  1695			return -ENODEV;
  1696	
  1697		if (hpd_support) {
  1698			ret = devm_request_threaded_irq(dev, client->irq, NULL,
  1699							it66121_irq_threaded_handler,
  1700							IRQF_ONESHOT, dev_name(dev),
  1701							ctx);
  1702			if (ret < 0) {
  1703				dev_err(dev, "Failed to request irq: %d\n", ret);
  1704				return ret;
  1705			}
  1706		}
  1707	
  1708		it66121_bridge_init_base(&ctx->bridge, dev->of_node, true);
  1709	
  1710		if (audio_support)
  1711			it66121_audio_codec_init(ctx, dev);
  1712	
  1713		*bridge = &ctx->bridge;
  1714	
  1715		dev_info(dev, "IT66121 probed, chip id: 0x%x:0x%x, revision: %u\n",
  1716			 ctx->vender_id, ctx->device_id, ctx->revision);
  1717	
  1718		return 0;
  1719	}
  1720	EXPORT_SYMBOL_GPL(it66121_create_bridge);
  1721	
  1722	static int it66121_probe(struct i2c_client *client)
  1723	{
  1724		struct device *dev = &client->dev;
  1725		struct it66121_ctx *ctx;
  1726		struct drm_bridge *bridge;
  1727		int ret;
  1728	
  1729		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
  1730			dev_err(dev, "I2C check functionality failed.\n");
  1731			return -ENXIO;
  1732		}
  1733	
  1734		ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it66121_supplies),
  1735						     it66121_supplies);
  1736		if (ret) {
  1737			dev_err(dev, "Failed to enable power supplies\n");
  1738			return ret;
  1739		}
  1740	
  1741		ret = it66121_create_bridge(client, true, true, true, &bridge);
  1742		if (ret)
  1743			return ret;
  1744	
  1745		ctx = bridge_to_it66121(bridge);
  1746	
  1747		i2c_set_clientdata(client, ctx);
  1748	
  1749		return 0;
  1750	}
  1751	
> 1752	void it66121_destroy_bridge(struct drm_bridge *bridge)
  1753	{
  1754		struct it66121_ctx *ctx = bridge_to_it66121(bridge);
  1755	
  1756		drm_bridge_remove(bridge);
  1757	
  1758		mutex_destroy(&ctx->lock);
  1759	}
  1760	EXPORT_SYMBOL_GPL(it66121_destroy_bridge);
  1761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
