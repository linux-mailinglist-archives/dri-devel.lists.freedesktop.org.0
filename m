Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421E67F0E91
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 10:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269BD10E25B;
	Mon, 20 Nov 2023 09:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7C510E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700471374; x=1732007374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2CTH71gUL8f+hX64gpw0KnmZN7mC9T3jKZ/oNiWW2p0=;
 b=hrqstafr8RXSZfi2p40fjJkZueakEYd1RG4RFjxtdwEuA15QbG4QCq5m
 7HLbvYP5VDkO2pKtfsEl9kPBLkLkCOj1Whui7x6+R3fLvI1r/6sH3wY72
 7fKMGHUxTKcl9lV+WgBk0GOyjXWQop4HZh30bkEjMT3FRNcypF+gYOspE
 KaPbjN0u9edAjw26efIPXdPMUfvGj1jcqFFvxTbKMe171hdBTxHTug8a+
 ZZpKb5l8dMrS0nFCNf4r4gyt3+lcyP7TjfHI1MEdkkWDkvOz/aTo1FtRe
 f1d0ZqcnFxn0yObWi3GSe0LVu6Typ7hI5RZ/fSdaK2QSaYePOzwGj9usV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="370926015"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="370926015"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 01:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="832209606"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="832209606"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 01:09:30 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r50HY-0006FK-0L;
 Mon, 20 Nov 2023 09:09:28 +0000
Date: Mon, 20 Nov 2023 17:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Message-ID: <202311201649.qjEbx5YL-lkp@intel.com>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-bridge-it66121-Use-dev-replace-ctx-dev-in-the-it66121_probe/20231114-231203
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231114150130.497915-9-sui.jingfeng%40linux.dev
patch subject: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
config: x86_64-buildonly-randconfig-004-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201649.qjEbx5YL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201649.qjEbx5YL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201649.qjEbx5YL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ite-it66121.c:1654:5: warning: no previous prototype for function 'it66121_create_bridge' [-Wmissing-prototypes]
   int it66121_create_bridge(struct i2c_client *client, bool of_support,
       ^
   drivers/gpu/drm/bridge/ite-it66121.c:1654:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int it66121_create_bridge(struct i2c_client *client, bool of_support,
   ^
   static 
>> drivers/gpu/drm/bridge/ite-it66121.c:1752:6: warning: no previous prototype for function 'it66121_destroy_bridge' [-Wmissing-prototypes]
   void it66121_destroy_bridge(struct drm_bridge *bridge)
        ^
   drivers/gpu/drm/bridge/ite-it66121.c:1752:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void it66121_destroy_bridge(struct drm_bridge *bridge)
   ^
   static 
   2 warnings generated.


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
