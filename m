Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712782BEBC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 11:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE47B10E0FE;
	Fri, 12 Jan 2024 10:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C00210E0FE;
 Fri, 12 Jan 2024 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705056604; x=1736592604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vvWtGzOPgV+zoM7ORGA+Z5lSf/tg9Mu+gfWDoQfv6mg=;
 b=UsxuGN+hdX+/sqcDJbQL7cDJHRCYk+lmDThTs1kNIktGllQGdRiiIWnW
 OIa1EFCpbGa3wzBvkM3Sp2xMlfEyN/AFggQjyaY6oRKHEoXqLTwad066d
 +hku/ZWRrhysE5eNE9UVORdPfb0MsTOc9K7WJTrR8cGmp4G3NmPjlLM3Y
 3xZVUInalaE9qibyLThqV0ltcOWD7BMWRrfPHlvLye7zvjYKNVOQ/wDbm
 Yb11PUq2Sw0FBcqpCZRISJHufYMfIbV44AI51UxTa6Zxwsx6IeslwTC1C
 o8aV1v6mYdY0BZUFSAef5/9iGg8ZKjR1yNM945T+8NrLRVSdRlPIzSfVb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6511649"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6511649"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:50:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775977660"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="775977660"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 12 Jan 2024 02:50:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rOF6t-0009LC-2o;
 Fri, 12 Jan 2024 10:49:59 +0000
Date: Fri, 12 Jan 2024 18:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/imx: prefer snprintf over sprintf
Message-ID: <202401121801.3j6GnsGm-lkp@intel.com>
References: <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-nouveau-acr-ga102-remove-unused-but-set-variable/20240111-014206
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula%40intel.com
patch subject: [PATCH 4/6] drm/imx: prefer snprintf over sprintf
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401121801.3j6GnsGm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401121801.3j6GnsGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401121801.3j6GnsGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function 'imx_ldb_probe':
>> drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: warning: '_sel' directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Wformat-truncation=]
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                                                         ^~~~
   drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: 'snprintf' output between 8 and 18 bytes into a destination of size 16
     658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_sel +658 drivers/gpu/drm/imx/ipuv3/imx-ldb.c

   617	
   618	static int imx_ldb_probe(struct platform_device *pdev)
   619	{
   620		struct device *dev = &pdev->dev;
   621		struct device_node *np = dev->of_node;
   622		struct device_node *child;
   623		struct imx_ldb *imx_ldb;
   624		int dual;
   625		int ret;
   626		int i;
   627	
   628		imx_ldb = devm_kzalloc(dev, sizeof(*imx_ldb), GFP_KERNEL);
   629		if (!imx_ldb)
   630			return -ENOMEM;
   631	
   632		imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
   633		if (IS_ERR(imx_ldb->regmap)) {
   634			dev_err(dev, "failed to get parent regmap\n");
   635			return PTR_ERR(imx_ldb->regmap);
   636		}
   637	
   638		/* disable LDB by resetting the control register to POR default */
   639		regmap_write(imx_ldb->regmap, IOMUXC_GPR2, 0);
   640	
   641		imx_ldb->dev = dev;
   642		imx_ldb->lvds_mux = device_get_match_data(dev);
   643	
   644		dual = of_property_read_bool(np, "fsl,dual-channel");
   645		if (dual)
   646			imx_ldb->ldb_ctrl |= LDB_SPLIT_MODE_EN;
   647	
   648		/*
   649		 * There are three different possible clock mux configurations:
   650		 * i.MX53:  ipu1_di0_sel, ipu1_di1_sel
   651		 * i.MX6q:  ipu1_di0_sel, ipu1_di1_sel, ipu2_di0_sel, ipu2_di1_sel
   652		 * i.MX6dl: ipu1_di0_sel, ipu1_di1_sel, lcdif_sel
   653		 * Map them all to di0_sel...di3_sel.
   654		 */
   655		for (i = 0; i < 4; i++) {
   656			char clkname[16];
   657	
 > 658			snprintf(clkname, sizeof(clkname), "di%d_sel", i);
   659			imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
   660			if (IS_ERR(imx_ldb->clk_sel[i])) {
   661				ret = PTR_ERR(imx_ldb->clk_sel[i]);
   662				imx_ldb->clk_sel[i] = NULL;
   663				break;
   664			}
   665	
   666			imx_ldb->clk_parent[i] = clk_get_parent(imx_ldb->clk_sel[i]);
   667		}
   668		if (i == 0)
   669			return ret;
   670	
   671		for_each_child_of_node(np, child) {
   672			struct imx_ldb_channel *channel;
   673			int bus_format;
   674	
   675			ret = of_property_read_u32(child, "reg", &i);
   676			if (ret || i < 0 || i > 1) {
   677				ret = -EINVAL;
   678				goto free_child;
   679			}
   680	
   681			if (!of_device_is_available(child))
   682				continue;
   683	
   684			if (dual && i > 0) {
   685				dev_warn(dev, "dual-channel mode, ignoring second output\n");
   686				continue;
   687			}
   688	
   689			channel = &imx_ldb->channel[i];
   690			channel->ldb = imx_ldb;
   691			channel->chno = i;
   692	
   693			/*
   694			 * The output port is port@4 with an external 4-port mux or
   695			 * port@2 with the internal 2-port mux.
   696			 */
   697			ret = drm_of_find_panel_or_bridge(child,
   698							  imx_ldb->lvds_mux ? 4 : 2, 0,
   699							  &channel->panel, &channel->bridge);
   700			if (ret && ret != -ENODEV)
   701				goto free_child;
   702	
   703			/* panel ddc only if there is no bridge */
   704			if (!channel->bridge) {
   705				ret = imx_ldb_panel_ddc(dev, channel, child);
   706				if (ret)
   707					goto free_child;
   708			}
   709	
   710			bus_format = of_get_bus_format(dev, child);
   711			if (bus_format == -EINVAL) {
   712				/*
   713				 * If no bus format was specified in the device tree,
   714				 * we can still get it from the connected panel later.
   715				 */
   716				if (channel->panel && channel->panel->funcs &&
   717				    channel->panel->funcs->get_modes)
   718					bus_format = 0;
   719			}
   720			if (bus_format < 0) {
   721				dev_err(dev, "could not determine data mapping: %d\n",
   722					bus_format);
   723				ret = bus_format;
   724				goto free_child;
   725			}
   726			channel->bus_format = bus_format;
   727			channel->child = child;
   728		}
   729	
   730		platform_set_drvdata(pdev, imx_ldb);
   731	
   732		return component_add(&pdev->dev, &imx_ldb_ops);
   733	
   734	free_child:
   735		of_node_put(child);
   736		return ret;
   737	}
   738	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
