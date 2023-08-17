Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175577FAAF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC9910E4E2;
	Thu, 17 Aug 2023 15:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2353510E4DE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692285943; x=1723821943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dv1rWAggk6QsneHzEIlpHOBsevb6HNOlpyXK3ZrSojM=;
 b=jFyW2xuwnHXE7dgHiawWiiDVoG6byTOH7cY3Wh7kursmGoEO2DlIEO5U
 vc30ST80ZixKLUrYpIByszysfiEF8ccIJtV17mCrEHHkrB0jW5MSiSx51
 6Fyvp4m8mrQ6GcRius45OHHcPNaVVGmUhfrG2TYSNiUa3/JPKd/p21261
 t6k1NyltuZMt0VgtMLdT2HYNiCOBMp/bwvQdFFl+dmH5wSxToKBPDINzu
 TepR2NjL7NEVunIJgXHGoN2HMrplAbhpmK5N7BUce7k4xr+17l3aa+g6k
 bmn09ML9g3lAFUy1Y8hQoOgboCODhYOJ1G69JLM8UogFJi+VOYhsvRL0V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="372832648"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="372832648"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 08:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728175525"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="728175525"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 17 Aug 2023 08:25:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qWesD-0001Gs-0v;
 Thu, 17 Aug 2023 15:25:21 +0000
Date: Thu, 17 Aug 2023 23:24:29 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 lee@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] drm: atmel_hlcdc: Add support for XLCDC in atmel
 LCD driver
Message-ID: <202308172303.AgUIhGKY-lkp@intel.com>
References: <20230817091250.225512-6-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817091250.225512-6-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, llvm@lists.linux.dev,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Hari.PrasathGE@microchip.com, Dharma.B@microchip.com,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 oe-kbuild-all@lists.linux.dev, Varshini.Rajendran@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manikandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikandan-Muralidharan/mfd-atmel-hlcdc-Add-compatible-for-sam9x75-XLCD-controller/20230817-172003
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230817091250.225512-6-manikandan.m%40microchip.com
patch subject: [PATCH v3 5/8] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD driver
config: arm-randconfig-r046-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172303.AgUIhGKY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172303.AgUIhGKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172303.AgUIhGKY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1013:6: warning: no previous prototype for function 'hlcdc_irq_dbg' [-Wmissing-prototypes]
    1013 | void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         |      ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1013:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1013 | void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         | ^
         | static 
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1029:6: warning: no previous prototype for function 'xlcdc_irq_dbg' [-Wmissing-prototypes]
    1029 | void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         |      ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:1029:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1029 | void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
         | ^
         | static 
   2 warnings generated.


vim +/hlcdc_irq_dbg +1013 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c

  1012	
> 1013	void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
  1014			   const struct atmel_hlcdc_layer_desc *desc)
  1015	{
  1016		u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
  1017	
  1018		/*
  1019		 * There's not much we can do in case of overrun except informing
  1020		 * the user. However, we are in interrupt context here, hence the
  1021		 * use of dev_dbg().
  1022		 */
  1023		if (isr &
  1024		    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
  1025		     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
  1026			pr_warn("%s: overrun on plane %s\n", __func__, desc->name);
  1027	}
  1028	
> 1029	void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
  1030			   const struct atmel_hlcdc_layer_desc *desc)
  1031	{
  1032		u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
  1033	
  1034		/*
  1035		 * There's not much we can do in case of overrun except informing
  1036		 * the user. However, we are in interrupt context here, hence the
  1037		 * use of dev_dbg().
  1038		 */
  1039		if (isr &
  1040		    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
  1041		     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
  1042			pr_warn("%s: overrun on plane %s\n", __func__, desc->name);
  1043	}
  1044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
