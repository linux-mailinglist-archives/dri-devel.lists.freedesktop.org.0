Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC697F8C8A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 17:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595510E036;
	Sat, 25 Nov 2023 16:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE6610E036
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700930947; x=1732466947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j+RZMWkVsz4TnTisBKidYmardSb7Xagc91ucf8D614s=;
 b=fBxxUgE5L2O61jtk8KLwjWuKm6eotixzIQwznd9Ygxvcd70ttwjtqV7F
 E76EbFYuE7Cf2ZKY737kp8D7iRKDJbFZKgkkkvBk/dUfLUJSBgiMCdxF0
 crR72909QeFDXlRutPc3dUn9dQ5o0lvR33fUbUCr6sD2jH79E1ioHYq5r
 UbcTUIgO2RQvlY0aQHw/MQroaLOR4GVR8LhsnUpp6NPIR19AjRQMqPfN0
 l5iDERplBJvbIhUilX3xm+tC+0pBiMU4kFtcpPun4+Wtt9YE7aD0CLwPy
 sBUBUUq4Gov9bwzqJLpWBur14dpr9aQPy2478/Bg5rV5nmMJ9voEnaHPX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395348472"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; d="scan'208";a="395348472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2023 08:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="802346296"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; d="scan'208";a="802346296"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 25 Nov 2023 08:49:03 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6vq1-0004DJ-0P;
 Sat, 25 Nov 2023 16:49:01 +0000
Date: Sun, 26 Nov 2023 00:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Message-ID: <202311252346.yBtdeeCP-lkp@intel.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mac.shen@mediatek.com, shuijing.li@mediatek.com,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi mac.shen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mac-shen/drm-mediatek-dp-Add-the-HDCP-feature-for-DisplayPort/20231125-152640
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231124085346.26602-1-mac.shen%40mediatek.com
patch subject: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311252346.yBtdeeCP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252346.yBtdeeCP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252346.yBtdeeCP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp.c:349:5: warning: no previous prototype for 'mtk_dp_read' [-Wmissing-prototypes]
     349 | u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
         |     ^~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dp.c:376:5: warning: no previous prototype for 'mtk_dp_update_bits' [-Wmissing-prototypes]
     376 | int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
         |     ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/drm/display/drm_dp_aux_bus.h:13,
                    from drivers/gpu/drm/mediatek/mtk_dp.c:7:
   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_hpd_sink_event':
>> include/drm/drm_print.h:456:54: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
     456 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                                      ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_info'
     456 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:460:9: note: in expansion of macro '__drm_printk'
     460 |         __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1905:17: note: in expansion of macro 'drm_info'
    1905 |                 drm_info(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);
         |                 ^~~~~~~~
>> include/drm/drm_print.h:456:54: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
     456 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |                                                      ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   include/drm/drm_print.h:456:9: note: in expansion of macro 'dev_info'
     456 |         dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
         |         ^~~~
   include/drm/drm_print.h:460:9: note: in expansion of macro '__drm_printk'
     460 |         __drm_printk((drm), info,, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1911:17: note: in expansion of macro 'drm_info'
    1911 |                 drm_info(mtk_dp->drm_dev,
         |                 ^~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_dp.c:2663:6: warning: no previous prototype for 'mtk_dp_check_hdcp_version' [-Wmissing-prototypes]
    2663 | void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c:38: warning: Function parameter or member 'dp_tee_priv' not described in 'dp_tee_op_send'
>> drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c:38: warning: Function parameter or member 'cmd_id' not described in 'dp_tee_op_send'
>> drivers/gpu/drm/mediatek/ca/tlcDpHdcp.c:38: warning: Excess function parameter 'chip' description in 'dp_tee_op_send'


vim +/mtk_dp_read +349 drivers/gpu/drm/mediatek/mtk_dp.c

   348	
 > 349	u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
   350	{
   351		return mtk_dp_reg_read(mtk_dp->regs, offset);
   352	}
   353	
   354	static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
   355	{
   356		int ret = regmap_write(mtk_dp->regs, offset, val);
   357	
   358		if (ret)
   359			dev_err(mtk_dp->dev,
   360				"Failed to write register 0x%x with value 0x%x\n",
   361				offset, val);
   362		return ret;
   363	}
   364	
   365	int mtk_dp_reg_update_bits(struct regmap *regs, u32 offset,
   366				   u32 val, u32 mask)
   367	{
   368		int ret = regmap_update_bits(regs, offset, mask, val);
   369	
   370		if (ret)
   371			pr_err("Failed to update register 0x%x with value 0x%x, mask 0x%x\n",
   372			       offset, val, mask);
   373		return ret;
   374	}
   375	
 > 376	int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
   377			       u32 val, u32 mask)
   378	{
   379		return mtk_dp_reg_update_bits(mtk_dp->regs, offset, val, mask);
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
