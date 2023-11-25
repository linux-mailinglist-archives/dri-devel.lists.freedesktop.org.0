Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE997F8BFF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 16:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086910E025;
	Sat, 25 Nov 2023 15:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78510E025
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700925455; x=1732461455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=139b8toziGYJ4TPz+C2NrbBA1ldTf5B8zRgPLW1YMts=;
 b=LS1eX3o/rgE3k/jzLQoCQjd+qb09NnD5Gjob42X7pPpmnwEAdmJHucQ6
 uIcrJHSjkBN20ZFXPz3bo3u88j10PhUd71Y3lA6F1x6qB8Qkw/J/IEFyR
 EJH87R0re806m8Tp/CQEmyQpi1Veaqw0m5gNpPq5EQngRWQleVb3HmooK
 LakKJerSn7/tyFlVeXBuEIUCOin3Av/pfoX8+T4oRoCf2MvYMvd3747F2
 JQO/dWlMhizQuLAFZtub54pJ6RfMLpeFuQrf1iTacqcA/X/lXmHoyIf+L
 4Hrt8jcvXOJXfFXO/5SGm3VMHq6d8lkfAKDNCEWlENJ7AUXyD7TJt/JiE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="5678452"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="5678452"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2023 07:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="838313048"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; d="scan'208";a="838313048"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2023 07:17:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6uPS-00047b-1k;
 Sat, 25 Nov 2023 15:17:30 +0000
Date: Sat, 25 Nov 2023 23:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Message-ID: <202311252324.TTPd9IXz-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 shuijing.li@mediatek.com, linux-mediatek@lists.infradead.org,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi mac.shen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc2]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mac-shen/drm-mediatek-dp-Add-the-HDCP-feature-for-DisplayPort/20231125-152640
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231124085346.26602-1-mac.shen%40mediatek.com
patch subject: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231125/202311252324.TTPd9IXz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252324.TTPd9IXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252324.TTPd9IXz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp.c:349:5: warning: no previous prototype for function 'mtk_dp_read' [-Wmissing-prototypes]
     349 | u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
         |     ^
   drivers/gpu/drm/mediatek/mtk_dp.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     349 | u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dp.c:376:5: warning: no previous prototype for function 'mtk_dp_update_bits' [-Wmissing-prototypes]
     376 | int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
         |     ^
   drivers/gpu/drm/mediatek/mtk_dp.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     376 | int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dp.c:2663:6: warning: no previous prototype for function 'mtk_dp_check_hdcp_version' [-Wmissing-prototypes]
    2663 | void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp.c:2663:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2663 | void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
         | ^
         | static 
   3 warnings generated.


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
