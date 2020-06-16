Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0011FA847
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 07:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFB86E5C5;
	Tue, 16 Jun 2020 05:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C238D6E5C5;
 Tue, 16 Jun 2020 05:31:40 +0000 (UTC)
IronPort-SDR: lueDwyrcwFsGn45NslvZzJm9SeqlrvrTDoWI54bl0N9YIWhYXNCG5QFFjhPsvgFIZyEwGTm4IY
 zCKIS7BghFnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 22:31:40 -0700
IronPort-SDR: vLeZW3l4xyMeeH6OQEii/0blYQju0pRhEQGqDWz4i1ugGOsm03/ymB9X4s1Xq1R+xDfO57z3Rf
 lquaaSpJheKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,517,1583222400"; d="scan'208";a="476303682"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.140])
 by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2020 22:31:38 -0700
Date: Tue, 16 Jun 2020 13:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v6 3/3] drm/i915/dp: Expose connector VRR
 monitor range via debugfs
Message-ID: <20200616054303.GI23105@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612230444.10121-4-manasi.d.navare@intel.com>
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
Cc: kbuild-all@lists.01.org, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manasi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next linus/master next-20200613]
[cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Manasi-Navare/VRR-capable-attach-prop-in-i915-DPCD-helper-VRR-debugfs/20200613-070517
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: Invalid number of character '{' when no macros are defined. [syntaxError]
   
   ^
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: Invalid number of character '{' when these macros are defined: 'CONFIG_DEBUG_FS'. [syntaxError]
   
   ^
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c:2258:0: warning: Invalid number of character '{' when these macros are defined: 'CONFIG_DRM_FBDEV_EMULATION'. [syntaxError]
   
   ^

# https://github.com/0day-ci/linux/commit/670af3cf7a3a36bb87776fbfd7f913cd33681bbc
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 670af3cf7a3a36bb87776fbfd7f913cd33681bbc
vim +2258 drivers/gpu/drm/i915/display/intel_display_debugfs.c

670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2202  
926b005cd8c4e3 Jani Nikula        2020-02-11  2203  /**
926b005cd8c4e3 Jani Nikula        2020-02-11  2204   * intel_connector_debugfs_add - add i915 specific connector debugfs files
926b005cd8c4e3 Jani Nikula        2020-02-11  2205   * @connector: pointer to a registered drm_connector
926b005cd8c4e3 Jani Nikula        2020-02-11  2206   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2207   * Cleanup will be done by drm_connector_unregister() through a call to
926b005cd8c4e3 Jani Nikula        2020-02-11  2208   * drm_debugfs_connector_remove().
926b005cd8c4e3 Jani Nikula        2020-02-11  2209   *
926b005cd8c4e3 Jani Nikula        2020-02-11  2210   * Returns 0 on success, negative error codes on error.
926b005cd8c4e3 Jani Nikula        2020-02-11  2211   */
926b005cd8c4e3 Jani Nikula        2020-02-11  2212  int intel_connector_debugfs_add(struct drm_connector *connector)
926b005cd8c4e3 Jani Nikula        2020-02-11  2213  {
926b005cd8c4e3 Jani Nikula        2020-02-11  2214  	struct dentry *root = connector->debugfs_entry;
926b005cd8c4e3 Jani Nikula        2020-02-11  2215  	struct drm_i915_private *dev_priv = to_i915(connector->dev);
926b005cd8c4e3 Jani Nikula        2020-02-11  2216  
926b005cd8c4e3 Jani Nikula        2020-02-11  2217  	/* The connector must have been registered beforehands. */
926b005cd8c4e3 Jani Nikula        2020-02-11  2218  	if (!root)
926b005cd8c4e3 Jani Nikula        2020-02-11  2219  		return -ENODEV;
926b005cd8c4e3 Jani Nikula        2020-02-11  2220  
926b005cd8c4e3 Jani Nikula        2020-02-11  2221  	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2222  		debugfs_create_file("i915_panel_timings", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2223  				    connector, &i915_panel_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2224  		debugfs_create_file("i915_psr_sink_status", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2225  				    connector, &i915_psr_sink_status_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2226  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2227  
926b005cd8c4e3 Jani Nikula        2020-02-11  2228  	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2229  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2230  	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
926b005cd8c4e3 Jani Nikula        2020-02-11  2231  		debugfs_create_file("i915_hdcp_sink_capability", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2232  				    connector, &i915_hdcp_sink_capability_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2233  	}
926b005cd8c4e3 Jani Nikula        2020-02-11  2234  
926b005cd8c4e3 Jani Nikula        2020-02-11  2235  	if (INTEL_GEN(dev_priv) >= 10 &&
926b005cd8c4e3 Jani Nikula        2020-02-11  2236  	    (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
926b005cd8c4e3 Jani Nikula        2020-02-11  2237  	     connector->connector_type == DRM_MODE_CONNECTOR_eDP))
926b005cd8c4e3 Jani Nikula        2020-02-11  2238  		debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
926b005cd8c4e3 Jani Nikula        2020-02-11  2239  				    connector, &i915_dsc_fec_support_fops);
926b005cd8c4e3 Jani Nikula        2020-02-11  2240  
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2241  		if (INTEL_GEN(dev_priv) >= 12)
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2242  			debugfs_create_file("vrr_range", S_IRUGO,
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2243  					    root, connector, &vrr_range_fops);
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2244  	}
670af3cf7a3a36 Bhanuprakash Modem 2020-06-12  2245  
8806211fe7b306 Anshuman Gupta     2020-04-15  2246  	/* Legacy panels doesn't lpsp on any platform */
8806211fe7b306 Anshuman Gupta     2020-04-15  2247  	if ((INTEL_GEN(dev_priv) >= 9 || IS_HASWELL(dev_priv) ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2248  	     IS_BROADWELL(dev_priv)) &&
8806211fe7b306 Anshuman Gupta     2020-04-15  2249  	     (connector->connector_type == DRM_MODE_CONNECTOR_DSI ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2250  	     connector->connector_type == DRM_MODE_CONNECTOR_eDP ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2251  	     connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2252  	     connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
8806211fe7b306 Anshuman Gupta     2020-04-15  2253  	     connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
8806211fe7b306 Anshuman Gupta     2020-04-15  2254  		debugfs_create_file("i915_lpsp_capability", 0444, root,
8806211fe7b306 Anshuman Gupta     2020-04-15  2255  				    connector, &i915_lpsp_capability_fops);
8806211fe7b306 Anshuman Gupta     2020-04-15  2256  
926b005cd8c4e3 Jani Nikula        2020-02-11  2257  	return 0;
926b005cd8c4e3 Jani Nikula        2020-02-11 @2258  }

:::::: The code at line 2258 was first introduced by commit
:::::: 926b005cd8c4e325ab918edea0fbdd1d25d1ba28 drm/i915: split out display debugfs to a separate file

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
