Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01A4F091B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 13:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6310E492;
	Sun,  3 Apr 2022 11:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5620810E364
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648986275; x=1680522275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lrXU+HMPPEqckxHX2gkclbUBQj3uyp9ZlIOK+EDPYRc=;
 b=NfC8nrvKJqKPSStkOz8//BaYcEJJoQwRtVaqB0Dz2VxUbgKTEVu29WhP
 RjEF6r664YdgoCR9cMWzzKQg0eErkPmMbWQP2Gxsx5W9bayxYXIL8Tbin
 gQWiL3ACXL63JlRvHYtym8rv5wnotR//sIhMKXl+JMRgkRgbwGwavaoTT
 GPaxCS8r4dY6G8VmRs/Lc4dlUl6tVzybCbU06zyIztiuso8ufGbleKFCV
 Ty0WcFOxMCxEu2BWEoiU2VQI1qF8SlkYTVvfOWwjJeKBthSuVwZFnUnAd
 5lCS5rVTiuOL26QEFxf8vUSN3sK6TWISO/t2GaWD0dxkVK1LqoX11dshp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="247890374"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="247890374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2022 04:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; d="scan'208";a="640972370"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2022 04:44:29 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nayei-0000vl-BG;
 Sun, 03 Apr 2022 11:44:28 +0000
Date: Sun, 3 Apr 2022 19:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maxime Ripard <maxime@cerno.tech>, Lyude Paul <lyude@redhat.com>,
 Inki Dae <inki.dae@samsung.com>, Yakir Yang <kuankuan.y@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Fix error handling in analogix_dp_probe
Message-ID: <202204031935.5SkYsM2M-lkp@intel.com>
References: <20220403051714.21212-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220403051714.21212-1-linmq006@gmail.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.17 next-20220401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaoqian-Lin/drm-bridge-Fix-error-handling-in-analogix_dp_probe/20220403-131916
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220403/202204031935.5SkYsM2M-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

New smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1705 analogix_dp_probe() warn: inconsistent indenting
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1705 analogix_dp_probe() warn: passing zero to 'ERR_CAST'
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1707 analogix_dp_probe() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1846 analogix_dp_resume() warn: 'dp->clock' from clk_prepare_enable() not released on lines: 1842.

vim +1705 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

0d97ad03f4220c Tomeu Vizoso     2016-08-24  1638  
6b2d8fd98d051f Jeffy Chen       2018-01-10  1639  struct analogix_dp_device *
152cce0006abf7 Marek Szyprowski 2020-03-10  1640  analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
3424e3a4f844c0 Yakir Yang       2016-03-29  1641  {
3424e3a4f844c0 Yakir Yang       2016-03-29  1642  	struct platform_device *pdev = to_platform_device(dev);
3424e3a4f844c0 Yakir Yang       2016-03-29  1643  	struct analogix_dp_device *dp;
3424e3a4f844c0 Yakir Yang       2016-03-29  1644  	struct resource *res;
3424e3a4f844c0 Yakir Yang       2016-03-29  1645  	unsigned int irq_flags;
3424e3a4f844c0 Yakir Yang       2016-03-29  1646  	int ret;
3424e3a4f844c0 Yakir Yang       2016-03-29  1647  
3424e3a4f844c0 Yakir Yang       2016-03-29  1648  	if (!plat_data) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1649  		dev_err(dev, "Invalided input plat_data\n");
6b2d8fd98d051f Jeffy Chen       2018-01-10  1650  		return ERR_PTR(-EINVAL);
3424e3a4f844c0 Yakir Yang       2016-03-29  1651  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1652  
3424e3a4f844c0 Yakir Yang       2016-03-29  1653  	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
3424e3a4f844c0 Yakir Yang       2016-03-29  1654  	if (!dp)
6b2d8fd98d051f Jeffy Chen       2018-01-10  1655  		return ERR_PTR(-ENOMEM);
3424e3a4f844c0 Yakir Yang       2016-03-29  1656  
3424e3a4f844c0 Yakir Yang       2016-03-29  1657  	dp->dev = &pdev->dev;
3424e3a4f844c0 Yakir Yang       2016-03-29  1658  	dp->dpms_mode = DRM_MODE_DPMS_OFF;
3424e3a4f844c0 Yakir Yang       2016-03-29  1659  
0b8b059a75b08f Sean Paul        2016-08-08  1660  	mutex_init(&dp->panel_lock);
0b8b059a75b08f Sean Paul        2016-08-08  1661  	dp->panel_is_modeset = false;
0b8b059a75b08f Sean Paul        2016-08-08  1662  
3424e3a4f844c0 Yakir Yang       2016-03-29  1663  	/*
3424e3a4f844c0 Yakir Yang       2016-03-29  1664  	 * platform dp driver need containor_of the plat_data to get
3424e3a4f844c0 Yakir Yang       2016-03-29  1665  	 * the driver private data, so we need to store the point of
3424e3a4f844c0 Yakir Yang       2016-03-29  1666  	 * plat_data, not the context of plat_data.
3424e3a4f844c0 Yakir Yang       2016-03-29  1667  	 */
3424e3a4f844c0 Yakir Yang       2016-03-29  1668  	dp->plat_data = plat_data;
3424e3a4f844c0 Yakir Yang       2016-03-29  1669  
793ce4eb84ea2f Yakir Yang       2016-02-15  1670  	ret = analogix_dp_dt_parse_pdata(dp);
793ce4eb84ea2f Yakir Yang       2016-02-15  1671  	if (ret)
6b2d8fd98d051f Jeffy Chen       2018-01-10  1672  		return ERR_PTR(ret);
3424e3a4f844c0 Yakir Yang       2016-03-29  1673  
3424e3a4f844c0 Yakir Yang       2016-03-29  1674  	dp->phy = devm_phy_get(dp->dev, "dp");
3424e3a4f844c0 Yakir Yang       2016-03-29  1675  	if (IS_ERR(dp->phy)) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1676  		dev_err(dp->dev, "no DP phy configured\n");
3424e3a4f844c0 Yakir Yang       2016-03-29  1677  		ret = PTR_ERR(dp->phy);
3424e3a4f844c0 Yakir Yang       2016-03-29  1678  		if (ret) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1679  			/*
3424e3a4f844c0 Yakir Yang       2016-03-29  1680  			 * phy itself is not enabled, so we can move forward
3424e3a4f844c0 Yakir Yang       2016-03-29  1681  			 * assigning NULL to phy pointer.
3424e3a4f844c0 Yakir Yang       2016-03-29  1682  			 */
3424e3a4f844c0 Yakir Yang       2016-03-29  1683  			if (ret == -ENOSYS || ret == -ENODEV)
3424e3a4f844c0 Yakir Yang       2016-03-29  1684  				dp->phy = NULL;
3424e3a4f844c0 Yakir Yang       2016-03-29  1685  			else
6b2d8fd98d051f Jeffy Chen       2018-01-10  1686  				return ERR_PTR(ret);
3424e3a4f844c0 Yakir Yang       2016-03-29  1687  		}
3424e3a4f844c0 Yakir Yang       2016-03-29  1688  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1689  
3424e3a4f844c0 Yakir Yang       2016-03-29  1690  	dp->clock = devm_clk_get(&pdev->dev, "dp");
3424e3a4f844c0 Yakir Yang       2016-03-29  1691  	if (IS_ERR(dp->clock)) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1692  		dev_err(&pdev->dev, "failed to get clock\n");
6b2d8fd98d051f Jeffy Chen       2018-01-10  1693  		return ERR_CAST(dp->clock);
3424e3a4f844c0 Yakir Yang       2016-03-29  1694  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1695  
3424e3a4f844c0 Yakir Yang       2016-03-29  1696  	clk_prepare_enable(dp->clock);
3424e3a4f844c0 Yakir Yang       2016-03-29  1697  
3424e3a4f844c0 Yakir Yang       2016-03-29  1698  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
3424e3a4f844c0 Yakir Yang       2016-03-29  1699  
3424e3a4f844c0 Yakir Yang       2016-03-29  1700  	dp->reg_base = devm_ioremap_resource(&pdev->dev, res);
af6df465625fb3 Miaoqian Lin     2022-04-03  1701  	if (IS_ERR(dp->reg_base)) {
af6df465625fb3 Miaoqian Lin     2022-04-03  1702  		ret = PTR_ERR(dp->reg_base);
af6df465625fb3 Miaoqian Lin     2022-04-03  1703  		goto err_disable_clk;
af6df465625fb3 Miaoqian Lin     2022-04-03  1704  	}
6b2d8fd98d051f Jeffy Chen       2018-01-10 @1705  		return ERR_CAST(dp->reg_base);
3424e3a4f844c0 Yakir Yang       2016-03-29  1706  
5cff007c58b710 Yakir Yang       2016-02-15 @1707  	dp->force_hpd = of_property_read_bool(dev->of_node, "force-hpd");
5cff007c58b710 Yakir Yang       2016-02-15  1708  
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1709  	/* Try two different names */
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1710  	dp->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1711  	if (!dp->hpd_gpiod)
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1712  		dp->hpd_gpiod = devm_gpiod_get_optional(dev, "samsung,hpd",
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1713  							GPIOD_IN);
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1714  	if (IS_ERR(dp->hpd_gpiod)) {
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1715  		dev_err(dev, "error getting HDP GPIO: %ld\n",
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1716  			PTR_ERR(dp->hpd_gpiod));
af6df465625fb3 Miaoqian Lin     2022-04-03  1717  		ret = PTR_ERR(dp->hpd_gpiod);
af6df465625fb3 Miaoqian Lin     2022-04-03  1718  		goto err_disable_clk;
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1719  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1720  
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1721  	if (dp->hpd_gpiod) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1722  		/*
3424e3a4f844c0 Yakir Yang       2016-03-29  1723  		 * Set up the hotplug GPIO from the device tree as an interrupt.
3424e3a4f844c0 Yakir Yang       2016-03-29  1724  		 * Simply specifying a different interrupt in the device tree
3424e3a4f844c0 Yakir Yang       2016-03-29  1725  		 * doesn't work since we handle hotplug rather differently when
3424e3a4f844c0 Yakir Yang       2016-03-29  1726  		 * using a GPIO.  We also need the actual GPIO specifier so
3424e3a4f844c0 Yakir Yang       2016-03-29  1727  		 * that we can get the current state of the GPIO.
3424e3a4f844c0 Yakir Yang       2016-03-29  1728  		 */
5b038dcf9d0aa0 Linus Walleij    2019-06-10  1729  		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
3424e3a4f844c0 Yakir Yang       2016-03-29  1730  		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
3424e3a4f844c0 Yakir Yang       2016-03-29  1731  	} else {
3424e3a4f844c0 Yakir Yang       2016-03-29  1732  		dp->irq = platform_get_irq(pdev, 0);
3424e3a4f844c0 Yakir Yang       2016-03-29  1733  		irq_flags = 0;
3424e3a4f844c0 Yakir Yang       2016-03-29  1734  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1735  
3424e3a4f844c0 Yakir Yang       2016-03-29  1736  	if (dp->irq == -ENXIO) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1737  		dev_err(&pdev->dev, "failed to get irq\n");
af6df465625fb3 Miaoqian Lin     2022-04-03  1738  		ret = -ENODEV;
af6df465625fb3 Miaoqian Lin     2022-04-03  1739  		goto err_disable_clk;
3424e3a4f844c0 Yakir Yang       2016-03-29  1740  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1741  
7b4b7a8db439dc Yakir Yang       2016-02-15  1742  	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
7b4b7a8db439dc Yakir Yang       2016-02-15  1743  					analogix_dp_hardirq,
7b4b7a8db439dc Yakir Yang       2016-02-15  1744  					analogix_dp_irq_thread,
3424e3a4f844c0 Yakir Yang       2016-03-29  1745  					irq_flags, "analogix-dp", dp);
3424e3a4f844c0 Yakir Yang       2016-03-29  1746  	if (ret) {
3424e3a4f844c0 Yakir Yang       2016-03-29  1747  		dev_err(&pdev->dev, "failed to request irq\n");
af6df465625fb3 Miaoqian Lin     2022-04-03  1748  		goto err_disable_clk;
3424e3a4f844c0 Yakir Yang       2016-03-29  1749  	}
3424e3a4f844c0 Yakir Yang       2016-03-29  1750  	disable_irq(dp->irq);
3424e3a4f844c0 Yakir Yang       2016-03-29  1751  
152cce0006abf7 Marek Szyprowski 2020-03-10  1752  	return dp;
af6df465625fb3 Miaoqian Lin     2022-04-03  1753  
af6df465625fb3 Miaoqian Lin     2022-04-03  1754  err_disable_clk:
af6df465625fb3 Miaoqian Lin     2022-04-03  1755  	clk_disable_unprepare(dp->clock);
af6df465625fb3 Miaoqian Lin     2022-04-03  1756  	return ERR_PTR(ret);
152cce0006abf7 Marek Szyprowski 2020-03-10  1757  }
152cce0006abf7 Marek Szyprowski 2020-03-10  1758  EXPORT_SYMBOL_GPL(analogix_dp_probe);
152cce0006abf7 Marek Szyprowski 2020-03-10  1759  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
