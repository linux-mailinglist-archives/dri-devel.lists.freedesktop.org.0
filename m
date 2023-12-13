Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1EF81239B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 00:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5390C10E889;
	Wed, 13 Dec 2023 23:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F16710E889
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 23:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702511838; x=1734047838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=poej8h3DeJjMomXJaNE+bWPiFUbNVUg3Mkr1BfGUJOQ=;
 b=lTz9xpNNyc/rAyVfGJx3cuZPI2UAaghQFUg9VFGomX0PASatLrBd84TU
 zmJVOvObUoStGcK2ATZiFcb+n9hFXzC/YKRnuAmeQLfkCvmhVI0z9jQ+Z
 s25oMwbF1r/GENa17a68c50KccDBUPlQh67Bhj27H7+ziLSSS8eyEdBDn
 6fiZNivthJPhaTBmYTITGN/Chpi6jD0Wkg+nT5iltbzzjRjTtEzP0ye7A
 a7sztBxUwG2MFsSW0ORw1sraANE9JfIuRw4Z0aVEHIGe6eaKfl/7QjJFD
 ajZgdg8p5ZDNwL7nvw/Ot7Xbirgr8AVijFkNRRK3+9uaXTmwYejZzwUjq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375197740"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="375197740"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 15:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844504622"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="844504622"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 15:57:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDZ6H-000LIZ-1s;
 Wed, 13 Dec 2023 23:57:13 +0000
Date: Thu, 14 Dec 2023 07:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <202312140733.2qj4HH0f-lkp@intel.com>
References: <20231213095023.3928703-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213095023.3928703-1-jani.nikula@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus drm-tip/drm-tip linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/ASoC-hdmi-codec-drop-drm-drm_edid-h-include/20231213-175633
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213095023.3928703-1-jani.nikula%40intel.com
patch subject: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
config: hexagon-randconfig-r063-20231213 (https://download.01.org/0day-ci/archive/20231214/202312140733.2qj4HH0f-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140733.2qj4HH0f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140733.2qj4HH0f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/lontium-lt9611.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/lontium-lt9611.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/lontium-lt9611.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/bridge/lontium-lt9611.c:346:8: error: call to undeclared function 'drm_hdmi_avi_infoframe_from_display_mode'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
                 ^
>> drivers/gpu/drm/bridge/lontium-lt9611.c:359:8: error: call to undeclared function 'drm_hdmi_vendor_infoframe_from_display_mode'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
                 ^
>> drivers/gpu/drm/bridge/lontium-lt9611.c:855:9: error: call to undeclared function 'drm_do_get_edid'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
                  ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:855:9: note: did you mean 'drm_bridge_get_edid'?
   include/drm/drm_bridge.h:891:14: note: 'drm_bridge_get_edid' declared here
   struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
                ^
   drivers/gpu/drm/bridge/lontium-lt9611.c:855:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct edid *' [-Wint-conversion]
           return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 4 errors generated.


vim +/drm_hdmi_avi_infoframe_from_display_mode +346 drivers/gpu/drm/bridge/lontium-lt9611.c

23278bf54afe18 Vinod Koul       2020-07-23  334  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  335  static void lt9611_hdmi_set_infoframes(struct lt9611 *lt9611,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  336  				       struct drm_connector *connector,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  337  				       struct drm_display_mode *mode)
23278bf54afe18 Vinod Koul       2020-07-23  338  {
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  339  	union hdmi_infoframe infoframe;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  340  	ssize_t len;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  341  	u8 iframes = 0x0a; /* UD1 infoframe */
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  342  	u8 buf[32];
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  343  	int ret;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  344  	int i;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  345  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18 @346  	ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  347  						       connector,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  348  						       mode);
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  349  	if (ret < 0)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  350  		goto out;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  351  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  352  	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  353  	if (len < 0)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  354  		goto out;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  355  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  356  	for (i = 0; i < len; i++)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  357  		regmap_write(lt9611->regmap, 0x8440 + i, buf[i]);
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  358  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18 @359  	ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  360  							  connector,
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  361  							  mode);
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  362  	if (ret < 0)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  363  		goto out;
23278bf54afe18 Vinod Koul       2020-07-23  364  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  365  	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  366  	if (len < 0)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  367  		goto out;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  368  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  369  	for (i = 0; i < len; i++)
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  370  		regmap_write(lt9611->regmap, 0x8474 + i, buf[i]);
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  371  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  372  	iframes |= 0x20;
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  373  
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  374  out:
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  375  	regmap_write(lt9611->regmap, 0x843d, iframes); /* UD1 infoframe */
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  376  }
84cf74d99f88bc Dmitry Baryshkov 2023-01-18  377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
