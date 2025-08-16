Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9BB28958
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 02:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE2710E26F;
	Sat, 16 Aug 2025 00:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ek6LIE4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11510E26F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755304586; x=1786840586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=benNazeuPaouG/+e8wLXd4fxOv6Us5y+9Sh2v9/dsfc=;
 b=ek6LIE4QKzGF8IPJOtx6T2XNyj+0k7m4iCixa6xpjZ0c7/sTj3CnmUDO
 pAK2ABKS0seDuWDbTEb1w3ecm/HxJKvcHTvF3JbCMOot43lW0LUBZbsY/
 mgiIHlZGPNxJqKblUyhKXjYZLd9DZwNhwwHJpJ89ZXKiB/gy+Xo9B3iQD
 QVq7GY2nwfpi0KTV+CZeyjfPVsZ6YefYunz6o8DPkSEcWyNDlrwRWNRbq
 agw3RnX0MLTG+45XrqoXiwRpNx5RmD4KKurQeD35SSbsm6No0MAqCxNgR
 t+WlvuL0ElnpFuXzupa5ub+c1VJ218aaLlmu+Z7IvWbekfHcP+PXqqd+1 A==;
X-CSE-ConnectionGUID: BPCf9yDCRwubLj5xL3aQzg==
X-CSE-MsgGUID: Mx8qfRKRT+O5xOfEdliiBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61465019"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61465019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:36:25 -0700
X-CSE-ConnectionGUID: XsfJWJHDRiucVH5KSe51BA==
X-CSE-MsgGUID: NSRhkyfJQCqWWqVNaOYoEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166309080"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 15 Aug 2025 17:36:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1un4u8-000CSI-05;
 Sat, 16 Aug 2025 00:36:16 +0000
Date: Sat, 16 Aug 2025 08:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Message-ID: <202508160857.yC3oMucJ-lkp@intel.com>
References: <20250814104753.195255-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-9-damon.ding@rock-chips.com>
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

Hi Damon,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on rockchip/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-9-damon.ding%40rock-chips.com
patch subject: [PATCH v4 08/13] drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
config: x86_64-randconfig-001-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160857.yC3oMucJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160857.yC3oMucJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `analogix_dp_finish_probe':
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1700: undefined reference to `devm_of_dp_aux_populate_bus'


vim +1700 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1695	
  1696	int analogix_dp_finish_probe(struct analogix_dp_device *dp)
  1697	{
  1698		int ret;
  1699	
> 1700		ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
  1701		if (ret) {
  1702			/*
  1703			 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
  1704			 * not be called because there are no EP devices. Then the callback function
  1705			 * analogix_dp_aux_done_probing() will be called directly in order to support
  1706			 * the other valid DT configurations.
  1707			 *
  1708			 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
  1709			 */
  1710			if (ret != -ENODEV) {
  1711				dev_err(dp->dev, "failed to populate aux bus\n");
  1712				return ret;
  1713			}
  1714	
  1715			return analogix_dp_aux_done_probing(&dp->aux);
  1716		}
  1717	
  1718		return 0;
  1719	}
  1720	EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
  1721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
