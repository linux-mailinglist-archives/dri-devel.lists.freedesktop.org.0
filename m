Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490AAB56FC3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 07:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930AB10E036;
	Mon, 15 Sep 2025 05:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrO2N/Fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B7710E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757915265; x=1789451265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uhq5A4HqOzycNT0EguqVROkMdKzAY8x3LE2Z7OEXVXw=;
 b=YrO2N/FiQbeNOJfR4qQJdbcF+L4ch2iAeSTrQW0uj55LPQBbu4/53ioz
 BnCLZ9IiXI/eRJ9NszYQyVik3nWIzG+bfeoGOJ7O6apT6ILpOeHT92gg6
 o3wQq5HSHrD+91yVIBRNaeoQ9OMY+JJOmccak1MlahxiQ00Fjb8pBJKTr
 8j9yfJtKfEmYJqJMMlGEb5HuUX6N1dmpOi7jGde/QXjsjCSGHUcwSSiHn
 IB73avXP84CbYiLvingBKbUEwKLMUO664XlAZ8jfvi4vvGYGhL+J/ChbU
 uRZqIAr0yhlcsiCMyZMyjqr+7cD624QN+U1rZu5UbnAtYtxP2hgxjeKdf Q==;
X-CSE-ConnectionGUID: pt+qFDwsQkmT5y3qQNuSNw==
X-CSE-MsgGUID: v6j7+x8uTTCm08f0bDDwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60264271"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60264271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2025 22:47:44 -0700
X-CSE-ConnectionGUID: gjM+2CUiQFKjW+x4di8vSw==
X-CSE-MsgGUID: sYKP41NqQxW0tIoaUO1RTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174598032"
Received: from lkp-server02.sh.intel.com (HELO 0f80bf6f8d53) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 14 Sep 2025 22:47:37 -0700
Received: from kbuild by 0f80bf6f8d53 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uy23O-00002V-38;
 Mon, 15 Sep 2025 05:47:10 +0000
Date: Mon, 15 Sep 2025 13:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <202509151319.M4lQXwA8-lkp@intel.com>
References: <20250906135345.241229-24-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906135345.241229-24-clamor95@gmail.com>
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

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.17-rc6]
[cannot apply to next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/clk-tegra-set-CSUS-as-vi_sensors-gate-for-Tegra20-Tegra30-and-Tegra114/20250906-215750
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250906135345.241229-24-clamor95%40gmail.com
patch subject: [PATCH v2 23/23] staging: media: tegra-video: add CSI support for Tegra20 and Tegra30
config: arm-randconfig-r131-20250915 (https://download.01.org/0day-ci/archive/20250915/202509151319.M4lQXwA8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509151319.M4lQXwA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509151319.M4lQXwA8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:366:9: note: previous definition is here
     366 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/staging/media/tegra-video/tegra20.c:909:6: warning: variable 'pp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     909 |         if (ret < 0) {
         |             ^~~~~~~
   drivers/staging/media/tegra-video/tegra20.c:923:53: note: uninitialized use occurs here
     923 |         tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, pp);
         |                                                            ^~
   drivers/staging/media/tegra-video/tegra20.c:909:2: note: remove the 'if' if its condition is always false
     909 |         if (ret < 0) {
         |         ^~~~~~~~~~~~~~
     910 |                 dev_warn(csi->dev, "MIPI calibration status timeout!\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     911 |                 goto exit;
         |                 ~~~~~~~~~~
     912 |         }
         |         ~
   drivers/staging/media/tegra-video/tegra20.c:900:6: warning: variable 'pp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     900 |         if (ret < 0) {
         |             ^~~~~~~
   drivers/staging/media/tegra-video/tegra20.c:923:53: note: uninitialized use occurs here
     923 |         tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, pp);
         |                                                            ^~
   drivers/staging/media/tegra-video/tegra20.c:900:2: note: remove the 'if' if its condition is always false
     900 |         if (ret < 0) {
         |         ^~~~~~~~~~~~~~
     901 |                 dev_warn(csi->dev, "MIPI calibration timeout!\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     902 |                 goto exit;
         |                 ~~~~~~~~~~
     903 |         }
         |         ~
   drivers/staging/media/tegra-video/tegra20.c:886:15: note: initialize the variable 'pp' to silence this warning
     886 |         u32 value, pp, cil;
         |                      ^
         |                       = 0
   3 warnings generated.


vim +909 drivers/staging/media/tegra-video/tegra20.c

   880	
   881	static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mipi)
   882	{
   883		struct tegra_csi *csi = mipi->csi;
   884		void __iomem *cil_status_reg = csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
   885		unsigned int port = mipi->pads;
   886		u32 value, pp, cil;
   887		int ret;
   888	
   889		/* This part is only for CSI */
   890		if (port > PORT_B) {
   891			pm_runtime_put(csi->dev);
   892	
   893			return 0;
   894		}
   895	
   896		guard(mutex)(&csi->mipi_lock);
   897	
   898		ret = readl_relaxed_poll_timeout(cil_status_reg, value,
   899						 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
   900		if (ret < 0) {
   901			dev_warn(csi->dev, "MIPI calibration timeout!\n");
   902			goto exit;
   903		}
   904	
   905		/* clear status */
   906		tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, value);
   907		ret = readl_relaxed_poll_timeout(cil_status_reg, value,
   908						 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
 > 909		if (ret < 0) {
   910			dev_warn(csi->dev, "MIPI calibration status timeout!\n");
   911			goto exit;
   912		}
   913	
   914		pp = tegra20_mipi_read(mipi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
   915		cil = tegra20_mipi_read(mipi, TEGRA_CSI_CSI_CIL_STATUS);
   916		if (pp | cil) {
   917			dev_warn(csi->dev, "Calibration status not been cleared!\n");
   918			ret = -EINVAL;
   919			goto exit;
   920		}
   921	
   922	exit:
   923		tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, pp);
   924	
   925		/* un-select to avoid interference with DSI */
   926		tegra20_mipi_write(mipi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
   927				   CSI_CIL_MIPI_CAL_HSPDOS(0) |
   928				   CSI_CIL_MIPI_CAL_HSPUOS(0) |
   929				   CSI_CIL_MIPI_CAL_TERMOS(4));
   930	
   931		tegra20_mipi_write(mipi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
   932				   CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
   933				   CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
   934				   CSI_CIL_MIPI_CAL_HSPDOS(0) |
   935				   CSI_CIL_MIPI_CAL_HSPUOS(0) |
   936				   CSI_CIL_MIPI_CAL_TERMOS(4));
   937	
   938		pm_runtime_put(csi->dev);
   939	
   940		return ret;
   941	}
   942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
