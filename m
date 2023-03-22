Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E785E6C47C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B710E35A;
	Wed, 22 Mar 2023 10:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6B610E35A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679481456; x=1711017456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XkGOVyRSy98gXhWpcna0uMh4W2jt4i6i1uaI3PcxGiU=;
 b=aa+fZhTiylkbQp46hyLYNoFaywu93fnet33Qtqu6F8Ms9h3SOYMh+0CS
 znwbcFXC6RxFNZt6frXuKdLvOnwNx/E4/LlqmN6bMPyQyFZJlMO+YBe7A
 ne2zOuPzKjf4U+rM5PpQLUrg0sMaCvfosnByzYDWELGXT45G+G/mkTD0z
 ei7cU968gC6WcwRCi80cPURtmBjjntb3Lcd0piTrcWR4l3s15PW3lwGu/
 tae7t3GYWeETcE4FjnWRc2rulhLHgzOOiFtU2O9W5y9L5I2cCVcDSBipM
 4RmHn9mOk4WQKp6Ns62DN8ffqUlnCv02ddJVJSQYb0aoLIImvWRlfdoMm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="318824516"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="318824516"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 03:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631951833"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="631951833"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 03:37:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pevqW-000DBJ-1n;
 Wed, 22 Mar 2023 10:37:32 +0000
Date: Wed, 22 Mar 2023 18:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: ye.xingchen@zte.com.cn, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] drm: xlnx: zynqmp: Use dev_err_probe()
Message-ID: <202303221848.iqaTMWyX-lkp@intel.com>
References: <202303221625255005719@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303221625255005719@zte.com.cn>
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
Cc: hyun.kwon@xilinx.com, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/drm-xlnx-zynqmp-Use-dev_err_probe/20230322-162628
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/202303221625255005719%40zte.com.cn
patch subject: [PATCH] drm: xlnx: zynqmp: Use dev_err_probe()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221848.iqaTMWyX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/68f0f0c914304e81941645b5b2e06ca1424527f9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ye-xingchen-zte-com-cn/drm-xlnx-zynqmp-Use-dev_err_probe/20230322-162628
        git checkout 68f0f0c914304e81941645b5b2e06ca1424527f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221848.iqaTMWyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_probe':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:1704:61: warning: format '%ld' expects a matching 'long int' argument [-Wformat=]
    1704 |                                     "failed to get reset: %ld\n");
         |                                                           ~~^
         |                                                             |
         |                                                             long int


vim +1704 drivers/gpu/drm/xlnx/zynqmp_dp.c

  1664	
  1665	/* -----------------------------------------------------------------------------
  1666	 * Initialization & Cleanup
  1667	 */
  1668	
  1669	int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
  1670	{
  1671		struct platform_device *pdev = to_platform_device(dpsub->dev);
  1672		struct drm_bridge *bridge;
  1673		struct zynqmp_dp *dp;
  1674		struct resource *res;
  1675		int ret;
  1676	
  1677		dp = kzalloc(sizeof(*dp), GFP_KERNEL);
  1678		if (!dp)
  1679			return -ENOMEM;
  1680	
  1681		dp->dev = &pdev->dev;
  1682		dp->dpsub = dpsub;
  1683		dp->status = connector_status_disconnected;
  1684	
  1685		INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
  1686	
  1687		/* Acquire all resources (IOMEM, IRQ and PHYs). */
  1688		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
  1689		dp->iomem = devm_ioremap_resource(dp->dev, res);
  1690		if (IS_ERR(dp->iomem)) {
  1691			ret = PTR_ERR(dp->iomem);
  1692			goto err_free;
  1693		}
  1694	
  1695		dp->irq = platform_get_irq(pdev, 0);
  1696		if (dp->irq < 0) {
  1697			ret = dp->irq;
  1698			goto err_free;
  1699		}
  1700	
  1701		dp->reset = devm_reset_control_get(dp->dev, NULL);
  1702		if (IS_ERR(dp->reset)) {
  1703			ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
> 1704					    "failed to get reset: %ld\n");
  1705			goto err_free;
  1706		}
  1707	
  1708		ret = zynqmp_dp_reset(dp, false);
  1709		if (ret < 0)
  1710			goto err_free;
  1711	
  1712		ret = zynqmp_dp_phy_probe(dp);
  1713		if (ret)
  1714			goto err_reset;
  1715	
  1716		/* Initialize the bridge. */
  1717		bridge = &dp->bridge;
  1718		bridge->funcs = &zynqmp_dp_bridge_funcs;
  1719		bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
  1720			    | DRM_BRIDGE_OP_HPD;
  1721		bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
  1722		dpsub->bridge = bridge;
  1723	
  1724		/*
  1725		 * Acquire the next bridge in the chain. Ignore errors caused by port@5
  1726		 * not being connected for backward-compatibility with older DTs.
  1727		 */
  1728		ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
  1729						  &dp->next_bridge);
  1730		if (ret < 0 && ret != -ENODEV)
  1731			goto err_reset;
  1732	
  1733		/* Initialize the hardware. */
  1734		dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
  1735		zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
  1736	
  1737		zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
  1738				ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
  1739		zynqmp_dp_set(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
  1740		zynqmp_dp_write(dp, ZYNQMP_DP_FORCE_SCRAMBLER_RESET, 1);
  1741		zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
  1742		zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
  1743	
  1744		ret = zynqmp_dp_phy_init(dp);
  1745		if (ret)
  1746			goto err_reset;
  1747	
  1748		zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 1);
  1749	
  1750		/*
  1751		 * Now that the hardware is initialized and won't generate spurious
  1752		 * interrupts, request the IRQ.
  1753		 */
  1754		ret = devm_request_threaded_irq(dp->dev, dp->irq, NULL,
  1755						zynqmp_dp_irq_handler, IRQF_ONESHOT,
  1756						dev_name(dp->dev), dp);
  1757		if (ret < 0)
  1758			goto err_phy_exit;
  1759	
  1760		dpsub->dp = dp;
  1761	
  1762		dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
  1763			dp->num_lanes);
  1764	
  1765		return 0;
  1766	
  1767	err_phy_exit:
  1768		zynqmp_dp_phy_exit(dp);
  1769	err_reset:
  1770		zynqmp_dp_reset(dp, true);
  1771	err_free:
  1772		kfree(dp);
  1773		return ret;
  1774	}
  1775	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
