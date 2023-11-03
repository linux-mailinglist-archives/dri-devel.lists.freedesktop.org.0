Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D47E0970
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B71D10EA86;
	Fri,  3 Nov 2023 19:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B310EA4C;
 Fri,  3 Nov 2023 19:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699039694; x=1730575694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ThhEdvjT1+j0oUILnpjOIFzFwnHfbfJKfong+lTksrA=;
 b=FcDAsNP2SGtWgFu7e2gp4MF0FE6n0CyvSR9WfBT8Rp2GW1Du42VW6qt7
 TyHFs2lQKBD5tNPiNUPxPA484L/ai1bqmHr9QOGgy5XyXHEbHs4We/Gpz
 NLX4yEoohJCx1xNXuYusB1xPMUJcHrtLNoV4xo48wTUrKnQVFscjXN2Ci
 JGYLJA1bjbW6gQYYMSEJkva1pNq96bohEYfC70VqTkacw5afnNFQw1Hnk
 YoKxBPA6llfgtqtEEXDshs38uGjnW9og07yet70P5g2anaQbzvxsuOLjI
 DRBAo5SgWgCfTCHwJKV1IY3vOGmAgiCXyksSCgaY3T1OHQKpUm0MeXZjL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453305924"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="453305924"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 12:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738169231"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="738169231"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 12:28:10 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qyzpw-0002sg-02;
 Fri, 03 Nov 2023 19:28:08 +0000
Date: Sat, 4 Nov 2023 03:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] drm/i915/dsi: Replace poking of CHV GPIOs
 behind the driver's back
Message-ID: <202311040312.Tf6bTkw0-lkp@intel.com>
References: <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, oe-kbuild-all@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/drm-i915-dsi-assume-BXT-gpio-works-for-non-native-GPIO/20231103-064642
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20231102151228.668842-15-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v3 14/15] drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311040312.Tf6bTkw0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040312.Tf6bTkw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040312.Tf6bTkw0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dsi_vbt.c:272:4: error: call to undeclared function 'soc_exec_opaque_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:03", "Panel SE",
                           ^
   drivers/gpu/drm/i915/display/intel_dsi_vbt.c:275:4: error: call to undeclared function 'soc_exec_opaque_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:00", "Panel SW",
                           ^
   drivers/gpu/drm/i915/display/intel_dsi_vbt.c:278:4: error: call to undeclared function 'soc_exec_opaque_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:02", "Panel E",
                           ^
   drivers/gpu/drm/i915/display/intel_dsi_vbt.c:281:4: error: call to undeclared function 'soc_exec_opaque_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
                           ^
   drivers/gpu/drm/i915/display/intel_dsi_vbt.c:299:3: error: call to undeclared function 'soc_exec_opaque_gpio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
                   ^
   5 errors generated.


vim +/soc_exec_opaque_gpio +272 drivers/gpu/drm/i915/display/intel_dsi_vbt.c

   263	
   264	static void chv_gpio_set_value(struct intel_connector *connector,
   265				       u8 gpio_source, u8 gpio_index, bool value)
   266	{
   267		struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
   268	
   269		if (connector->panel.vbt.dsi.seq_version >= 3) {
   270			if (gpio_index >= CHV_GPIO_IDX_START_SE) {
   271				/* XXX: it's unclear whether 255->57 is part of SE. */
 > 272				soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:03", "Panel SE",
   273						     gpio_index - CHV_GPIO_IDX_START_SW, value);
   274			} else if (gpio_index >= CHV_GPIO_IDX_START_SW) {
   275				soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:00", "Panel SW",
   276						     gpio_index - CHV_GPIO_IDX_START_SW, value);
   277			} else if (gpio_index >= CHV_GPIO_IDX_START_E) {
   278				soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:02", "Panel E",
   279						     gpio_index - CHV_GPIO_IDX_START_E, value);
   280			} else {
   281				soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
   282						     gpio_index - CHV_GPIO_IDX_START_N, value);
   283			}
   284		} else {
   285			/* XXX: The spec is unclear about CHV GPIO on seq v2 */
   286			if (gpio_source != 0) {
   287				drm_dbg_kms(&dev_priv->drm,
   288					    "unknown gpio source %u\n", gpio_source);
   289				return;
   290			}
   291	
   292			if (gpio_index >= CHV_GPIO_IDX_START_E) {
   293				drm_dbg_kms(&dev_priv->drm,
   294					    "invalid gpio index %u for GPIO N\n",
   295					    gpio_index);
   296				return;
   297			}
   298	
   299			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
   300					     gpio_index - CHV_GPIO_IDX_START_N, value);
   301		}
   302	}
   303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
