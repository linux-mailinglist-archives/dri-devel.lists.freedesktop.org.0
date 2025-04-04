Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4DA7B998
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25E010E0FC;
	Fri,  4 Apr 2025 09:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wfui/rJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D8B10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743757629; x=1775293629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oT0xGefRN2yfCOOTBwl15RJqY1xRmGN76leFdFfO1Ds=;
 b=Wfui/rJXKXfxG+BUvJJp3Berq5CwTvXYEMxkJD071MRZhSGskXaLo8k1
 X3Dpv0Kv9iRPokMEY90870R9kTSadEQCgZ7TV49juq7n+aCO8ZswtZYbK
 QuVVjIiFrCGwwnM6V15K56jJ4v/MnjjACqOwx0r+LCRKUUtu9eNHBoZXz
 WKAcvr2KrQSTL4XhD37EtfA1SeZ+I6Y7fyWqE/d2xC5aqMHfVHhpuxzCu
 nrCMh7RRAHNu5AyOOEfV5nUa9MLN2UPI5o1kQzVMX4gBbovg8jeXKgquP
 UQQDlBKwURmL9Y7qllEN4KmIvtdTbpb/J314anhrCsNVH6BliWlj9OC8u w==;
X-CSE-ConnectionGUID: 5rmlI41tQ1KQwC8HEM/4ug==
X-CSE-MsgGUID: nH2cDQkHQf6WsXsnt4c39w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67663286"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="67663286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:07:08 -0700
X-CSE-ConnectionGUID: +nQSbk4hRaW2eZ/sUVYIHw==
X-CSE-MsgGUID: Nt7dQJ1kRHOwU4ksMw1Dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127066899"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 04 Apr 2025 02:07:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u0d0v-000175-1x;
 Fri, 04 Apr 2025 09:07:01 +0000
Date: Fri, 4 Apr 2025 17:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andyshrk@163.com>, dmitry.baryshkov@oss.qualcomm.com,
 heiko@sntech.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hjc@rock-chips.com,
 mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 3/9] drm/rockchip: Add RK3588 DPTX output support
Message-ID: <202504041655.rA3EV7B8-lkp@intel.com>
References: <20250403033748.245007-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-4-andyshrk@163.com>
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

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next drm-exynos/exynos-drm-next linus/master v6.14 next-20250404]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/dt-bindings-display-rockchip-Add-schema-for-RK3588-DPTX-Controller/20250403-114203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250403033748.245007-4-andyshrk%40163.com
patch subject: [PATCH v3 3/9] drm/rockchip: Add RK3588 DPTX output support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250404/202504041655.rA3EV7B8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041655.rA3EV7B8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041655.rA3EV7B8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-dp.c:1599:3: error: call to undeclared function 'drm_dp_link_power_down'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1599 |                 drm_dp_link_power_down(&dp->aux, dp->link.revision);
         |                 ^
>> drivers/gpu/drm/bridge/synopsys/dw-dp.c:1617:8: error: call to undeclared function 'drm_dp_link_power_up'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1617 |         ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
         |               ^
>> drivers/gpu/drm/bridge/synopsys/dw-dp.c:1790:19: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' with an expression of type 'void (struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-function-pointer-types]
    1790 |         .atomic_enable = dw_dp_bridge_atomic_enable,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-dp.c:1791:20: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_bridge_state *)' with an expression of type 'void (struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-function-pointer-types]
    1791 |         .atomic_disable = dw_dp_bridge_atomic_disable,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +1790 drivers/gpu/drm/bridge/synopsys/dw-dp.c

d366451bed980ac Andy Yan 2025-04-03  1593  
d366451bed980ac Andy Yan 2025-04-03  1594  static void dw_dp_link_disable(struct dw_dp *dp)
d366451bed980ac Andy Yan 2025-04-03  1595  {
d366451bed980ac Andy Yan 2025-04-03  1596  	struct dw_dp_link *link = &dp->link;
d366451bed980ac Andy Yan 2025-04-03  1597  
d366451bed980ac Andy Yan 2025-04-03  1598  	if (dw_dp_hpd_detect(dp))
d366451bed980ac Andy Yan 2025-04-03 @1599  		drm_dp_link_power_down(&dp->aux, dp->link.revision);
d366451bed980ac Andy Yan 2025-04-03  1600  
d366451bed980ac Andy Yan 2025-04-03  1601  	dw_dp_phy_xmit_enable(dp, 0);
d366451bed980ac Andy Yan 2025-04-03  1602  
d366451bed980ac Andy Yan 2025-04-03  1603  	phy_power_off(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1604  
d366451bed980ac Andy Yan 2025-04-03  1605  	link->train.clock_recovered = false;
d366451bed980ac Andy Yan 2025-04-03  1606  	link->train.channel_equalized = false;
d366451bed980ac Andy Yan 2025-04-03  1607  }
d366451bed980ac Andy Yan 2025-04-03  1608  
d366451bed980ac Andy Yan 2025-04-03  1609  static int dw_dp_link_enable(struct dw_dp *dp)
d366451bed980ac Andy Yan 2025-04-03  1610  {
d366451bed980ac Andy Yan 2025-04-03  1611  	int ret;
d366451bed980ac Andy Yan 2025-04-03  1612  
d366451bed980ac Andy Yan 2025-04-03  1613  	ret = phy_power_on(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1614  	if (ret)
d366451bed980ac Andy Yan 2025-04-03  1615  		return ret;
d366451bed980ac Andy Yan 2025-04-03  1616  
d366451bed980ac Andy Yan 2025-04-03 @1617  	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
d366451bed980ac Andy Yan 2025-04-03  1618  	if (ret < 0)
d366451bed980ac Andy Yan 2025-04-03  1619  		return ret;
d366451bed980ac Andy Yan 2025-04-03  1620  
d366451bed980ac Andy Yan 2025-04-03  1621  	ret = dw_dp_link_train(dp);
d366451bed980ac Andy Yan 2025-04-03  1622  
d366451bed980ac Andy Yan 2025-04-03  1623  	return ret;
d366451bed980ac Andy Yan 2025-04-03  1624  }
d366451bed980ac Andy Yan 2025-04-03  1625  
d366451bed980ac Andy Yan 2025-04-03  1626  static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
d366451bed980ac Andy Yan 2025-04-03  1627  				       struct drm_atomic_state *state)
d366451bed980ac Andy Yan 2025-04-03  1628  {
d366451bed980ac Andy Yan 2025-04-03  1629  	struct dw_dp *dp = bridge_to_dp(bridge);
d366451bed980ac Andy Yan 2025-04-03  1630  	struct drm_connector *connector;
d366451bed980ac Andy Yan 2025-04-03  1631  	struct drm_connector_state *conn_state;
d366451bed980ac Andy Yan 2025-04-03  1632  	int ret;
d366451bed980ac Andy Yan 2025-04-03  1633  
d366451bed980ac Andy Yan 2025-04-03  1634  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
d366451bed980ac Andy Yan 2025-04-03  1635  	if (!connector) {
d366451bed980ac Andy Yan 2025-04-03  1636  		dev_err(dp->dev, "failed to get connector\n");
d366451bed980ac Andy Yan 2025-04-03  1637  		return;
d366451bed980ac Andy Yan 2025-04-03  1638  	}
d366451bed980ac Andy Yan 2025-04-03  1639  
d366451bed980ac Andy Yan 2025-04-03  1640  	conn_state = drm_atomic_get_new_connector_state(state, connector);
d366451bed980ac Andy Yan 2025-04-03  1641  	if (!conn_state) {
d366451bed980ac Andy Yan 2025-04-03  1642  		dev_err(dp->dev, "failed to get connector state\n");
d366451bed980ac Andy Yan 2025-04-03  1643  		return;
d366451bed980ac Andy Yan 2025-04-03  1644  	}
d366451bed980ac Andy Yan 2025-04-03  1645  
d366451bed980ac Andy Yan 2025-04-03  1646  	set_bit(0, dp->sdp_reg_bank);
d366451bed980ac Andy Yan 2025-04-03  1647  
d366451bed980ac Andy Yan 2025-04-03  1648  	ret = dw_dp_link_enable(dp);
d366451bed980ac Andy Yan 2025-04-03  1649  	if (ret < 0) {
d366451bed980ac Andy Yan 2025-04-03  1650  		dev_err(dp->dev, "failed to enable link: %d\n", ret);
d366451bed980ac Andy Yan 2025-04-03  1651  		return;
d366451bed980ac Andy Yan 2025-04-03  1652  	}
d366451bed980ac Andy Yan 2025-04-03  1653  
d366451bed980ac Andy Yan 2025-04-03  1654  	ret = dw_dp_video_enable(dp);
d366451bed980ac Andy Yan 2025-04-03  1655  	if (ret < 0) {
d366451bed980ac Andy Yan 2025-04-03  1656  		dev_err(dp->dev, "failed to enable video: %d\n", ret);
d366451bed980ac Andy Yan 2025-04-03  1657  		return;
d366451bed980ac Andy Yan 2025-04-03  1658  	}
d366451bed980ac Andy Yan 2025-04-03  1659  }
d366451bed980ac Andy Yan 2025-04-03  1660  
d366451bed980ac Andy Yan 2025-04-03  1661  static void dw_dp_reset(struct dw_dp *dp)
d366451bed980ac Andy Yan 2025-04-03  1662  {
d366451bed980ac Andy Yan 2025-04-03  1663  	int val;
d366451bed980ac Andy Yan 2025-04-03  1664  
d366451bed980ac Andy Yan 2025-04-03  1665  	disable_irq(dp->irq);
d366451bed980ac Andy Yan 2025-04-03  1666  	regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL, CONTROLLER_RESET,
d366451bed980ac Andy Yan 2025-04-03  1667  			   FIELD_PREP(CONTROLLER_RESET, 1));
d366451bed980ac Andy Yan 2025-04-03  1668  	udelay(10);
d366451bed980ac Andy Yan 2025-04-03  1669  	regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL, CONTROLLER_RESET,
d366451bed980ac Andy Yan 2025-04-03  1670  			   FIELD_PREP(CONTROLLER_RESET, 0));
d366451bed980ac Andy Yan 2025-04-03  1671  
d366451bed980ac Andy Yan 2025-04-03  1672  	dw_dp_init_hw(dp);
d366451bed980ac Andy Yan 2025-04-03  1673  	regmap_read_poll_timeout(dp->regmap, DW_DP_HPD_STATUS, val,
d366451bed980ac Andy Yan 2025-04-03  1674  				 FIELD_GET(HPD_HOT_PLUG, val), 200, 200000);
d366451bed980ac Andy Yan 2025-04-03  1675  	regmap_write(dp->regmap, DW_DP_HPD_STATUS, HPD_HOT_PLUG);
d366451bed980ac Andy Yan 2025-04-03  1676  	enable_irq(dp->irq);
d366451bed980ac Andy Yan 2025-04-03  1677  }
d366451bed980ac Andy Yan 2025-04-03  1678  
d366451bed980ac Andy Yan 2025-04-03  1679  static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
d366451bed980ac Andy Yan 2025-04-03  1680  					struct drm_atomic_state *state)
d366451bed980ac Andy Yan 2025-04-03  1681  {
d366451bed980ac Andy Yan 2025-04-03  1682  	struct dw_dp *dp = bridge_to_dp(bridge);
d366451bed980ac Andy Yan 2025-04-03  1683  
d366451bed980ac Andy Yan 2025-04-03  1684  	dw_dp_video_disable(dp);
d366451bed980ac Andy Yan 2025-04-03  1685  	dw_dp_link_disable(dp);
d366451bed980ac Andy Yan 2025-04-03  1686  	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
d366451bed980ac Andy Yan 2025-04-03  1687  	dw_dp_reset(dp);
d366451bed980ac Andy Yan 2025-04-03  1688  }
d366451bed980ac Andy Yan 2025-04-03  1689  
d366451bed980ac Andy Yan 2025-04-03  1690  static bool dw_dp_hpd_detect_link(struct dw_dp *dp)
d366451bed980ac Andy Yan 2025-04-03  1691  {
d366451bed980ac Andy Yan 2025-04-03  1692  	int ret;
d366451bed980ac Andy Yan 2025-04-03  1693  
d366451bed980ac Andy Yan 2025-04-03  1694  	ret = phy_power_on(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1695  	if (ret < 0)
d366451bed980ac Andy Yan 2025-04-03  1696  		return false;
d366451bed980ac Andy Yan 2025-04-03  1697  	ret = dw_dp_link_parse(dp);
d366451bed980ac Andy Yan 2025-04-03  1698  	phy_power_off(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1699  
d366451bed980ac Andy Yan 2025-04-03  1700  	return !ret;
d366451bed980ac Andy Yan 2025-04-03  1701  }
d366451bed980ac Andy Yan 2025-04-03  1702  
d366451bed980ac Andy Yan 2025-04-03  1703  static enum drm_connector_status dw_dp_bridge_detect(struct drm_bridge *bridge)
d366451bed980ac Andy Yan 2025-04-03  1704  {
d366451bed980ac Andy Yan 2025-04-03  1705  	struct dw_dp *dp = bridge_to_dp(bridge);
d366451bed980ac Andy Yan 2025-04-03  1706  
d366451bed980ac Andy Yan 2025-04-03  1707  	if (!dw_dp_hpd_detect(dp))
d366451bed980ac Andy Yan 2025-04-03  1708  		return connector_status_disconnected;
d366451bed980ac Andy Yan 2025-04-03  1709  
d366451bed980ac Andy Yan 2025-04-03  1710  	if (!dw_dp_hpd_detect_link(dp))
d366451bed980ac Andy Yan 2025-04-03  1711  		return connector_status_disconnected;
d366451bed980ac Andy Yan 2025-04-03  1712  
d366451bed980ac Andy Yan 2025-04-03  1713  	return connector_status_connected;
d366451bed980ac Andy Yan 2025-04-03  1714  }
d366451bed980ac Andy Yan 2025-04-03  1715  
d366451bed980ac Andy Yan 2025-04-03  1716  static const struct drm_edid *dw_dp_bridge_edid_read(struct drm_bridge *bridge,
d366451bed980ac Andy Yan 2025-04-03  1717  						     struct drm_connector *connector)
d366451bed980ac Andy Yan 2025-04-03  1718  {
d366451bed980ac Andy Yan 2025-04-03  1719  	struct dw_dp *dp = bridge_to_dp(bridge);
d366451bed980ac Andy Yan 2025-04-03  1720  	const struct drm_edid *edid;
d366451bed980ac Andy Yan 2025-04-03  1721  	int ret;
d366451bed980ac Andy Yan 2025-04-03  1722  
d366451bed980ac Andy Yan 2025-04-03  1723  	ret = phy_power_on(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1724  	if (ret)
d366451bed980ac Andy Yan 2025-04-03  1725  		return NULL;
d366451bed980ac Andy Yan 2025-04-03  1726  
d366451bed980ac Andy Yan 2025-04-03  1727  	edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
d366451bed980ac Andy Yan 2025-04-03  1728  
d366451bed980ac Andy Yan 2025-04-03  1729  	phy_power_off(dp->phy);
d366451bed980ac Andy Yan 2025-04-03  1730  
d366451bed980ac Andy Yan 2025-04-03  1731  	return edid;
d366451bed980ac Andy Yan 2025-04-03  1732  }
d366451bed980ac Andy Yan 2025-04-03  1733  
d366451bed980ac Andy Yan 2025-04-03  1734  static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
d366451bed980ac Andy Yan 2025-04-03  1735  						    struct drm_bridge_state *bridge_state,
d366451bed980ac Andy Yan 2025-04-03  1736  						    struct drm_crtc_state *crtc_state,
d366451bed980ac Andy Yan 2025-04-03  1737  						    struct drm_connector_state *conn_state,
d366451bed980ac Andy Yan 2025-04-03  1738  						    unsigned int *num_output_fmts)
d366451bed980ac Andy Yan 2025-04-03  1739  {
d366451bed980ac Andy Yan 2025-04-03  1740  	struct dw_dp *dp = bridge_to_dp(bridge);
d366451bed980ac Andy Yan 2025-04-03  1741  	struct dw_dp_link *link = &dp->link;
d366451bed980ac Andy Yan 2025-04-03  1742  	struct drm_display_info *di = &conn_state->connector->display_info;
d366451bed980ac Andy Yan 2025-04-03  1743  	struct drm_display_mode mode = crtc_state->mode;
d366451bed980ac Andy Yan 2025-04-03  1744  	const struct dw_dp_output_format *fmt;
d366451bed980ac Andy Yan 2025-04-03  1745  	u32 i, j = 0;
d366451bed980ac Andy Yan 2025-04-03  1746  	u32 *output_fmts;
d366451bed980ac Andy Yan 2025-04-03  1747  
d366451bed980ac Andy Yan 2025-04-03  1748  	*num_output_fmts = 0;
d366451bed980ac Andy Yan 2025-04-03  1749  
d366451bed980ac Andy Yan 2025-04-03  1750  	output_fmts = kcalloc(ARRAY_SIZE(dw_dp_output_formats), sizeof(*output_fmts), GFP_KERNEL);
d366451bed980ac Andy Yan 2025-04-03  1751  	if (!output_fmts)
d366451bed980ac Andy Yan 2025-04-03  1752  		return NULL;
d366451bed980ac Andy Yan 2025-04-03  1753  
d366451bed980ac Andy Yan 2025-04-03  1754  	for (i = 0; i < ARRAY_SIZE(dw_dp_output_formats); i++) {
d366451bed980ac Andy Yan 2025-04-03  1755  		fmt = &dw_dp_output_formats[i];
d366451bed980ac Andy Yan 2025-04-03  1756  
d366451bed980ac Andy Yan 2025-04-03  1757  		if (fmt->bpc > conn_state->max_bpc)
d366451bed980ac Andy Yan 2025-04-03  1758  			continue;
d366451bed980ac Andy Yan 2025-04-03  1759  
d366451bed980ac Andy Yan 2025-04-03  1760  		if (!(fmt->color_format & di->color_formats))
d366451bed980ac Andy Yan 2025-04-03  1761  			continue;
d366451bed980ac Andy Yan 2025-04-03  1762  
d366451bed980ac Andy Yan 2025-04-03  1763  		if (fmt->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
d366451bed980ac Andy Yan 2025-04-03  1764  		    !link->vsc_sdp_supported)
d366451bed980ac Andy Yan 2025-04-03  1765  			continue;
d366451bed980ac Andy Yan 2025-04-03  1766  
d366451bed980ac Andy Yan 2025-04-03  1767  		if (fmt->color_format != DRM_COLOR_FORMAT_YCBCR420 &&
d366451bed980ac Andy Yan 2025-04-03  1768  		    drm_mode_is_420_only(di, &mode))
d366451bed980ac Andy Yan 2025-04-03  1769  			continue;
d366451bed980ac Andy Yan 2025-04-03  1770  
d366451bed980ac Andy Yan 2025-04-03  1771  		if (!dw_dp_bandwidth_ok(dp, &mode, fmt->bpp, link->lanes, link->rate))
d366451bed980ac Andy Yan 2025-04-03  1772  			continue;
d366451bed980ac Andy Yan 2025-04-03  1773  
d366451bed980ac Andy Yan 2025-04-03  1774  		output_fmts[j++] = fmt->bus_format;
d366451bed980ac Andy Yan 2025-04-03  1775  	}
d366451bed980ac Andy Yan 2025-04-03  1776  
d366451bed980ac Andy Yan 2025-04-03  1777  	*num_output_fmts = j;
d366451bed980ac Andy Yan 2025-04-03  1778  
d366451bed980ac Andy Yan 2025-04-03  1779  	return output_fmts;
d366451bed980ac Andy Yan 2025-04-03  1780  }
d366451bed980ac Andy Yan 2025-04-03  1781  
d366451bed980ac Andy Yan 2025-04-03  1782  static const struct drm_bridge_funcs dw_dp_bridge_funcs = {
d366451bed980ac Andy Yan 2025-04-03  1783  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
d366451bed980ac Andy Yan 2025-04-03  1784  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
d366451bed980ac Andy Yan 2025-04-03  1785  	.atomic_reset = drm_atomic_helper_bridge_reset,
d366451bed980ac Andy Yan 2025-04-03  1786  	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
d366451bed980ac Andy Yan 2025-04-03  1787  	.atomic_get_output_bus_fmts = dw_dp_bridge_atomic_get_output_bus_fmts,
d366451bed980ac Andy Yan 2025-04-03  1788  	.atomic_check = dw_dp_bridge_atomic_check,
d366451bed980ac Andy Yan 2025-04-03  1789  	.mode_valid = dw_dp_bridge_mode_valid,
d366451bed980ac Andy Yan 2025-04-03 @1790  	.atomic_enable = dw_dp_bridge_atomic_enable,
d366451bed980ac Andy Yan 2025-04-03  1791  	.atomic_disable = dw_dp_bridge_atomic_disable,
d366451bed980ac Andy Yan 2025-04-03  1792  	.detect = dw_dp_bridge_detect,
d366451bed980ac Andy Yan 2025-04-03  1793  	.edid_read = dw_dp_bridge_edid_read,
d366451bed980ac Andy Yan 2025-04-03  1794  };
d366451bed980ac Andy Yan 2025-04-03  1795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
