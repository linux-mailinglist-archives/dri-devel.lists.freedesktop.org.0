Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2316798CB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CF310E67E;
	Tue, 24 Jan 2023 12:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594F10E683;
 Tue, 24 Jan 2023 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674565085; x=1706101085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vh3ewC0bzSD54uzrUW+Ja1+iDTgLvZthe7PVj9TYz90=;
 b=ETs4Zv5U5w6EyEMmaR4JbNVoHk50Iu9q49aV4bl3LFWtJ5r0SQoV1gY8
 WqkZdbVYxIcWxZIpSdLwu0hARQfyH3GexDtCitKBuOUI4sp93cKY58gaz
 STFbf2qiN64yBALpjqS0Sdn+RER2u5Cs5yWYAEkry6KawYpiPXhGJS1P8
 kGqZmIM7K/i+a+SM/EG7W6GRQ+rDpBWydS5+UdyHl+LOuvAYb5uQqtftk
 wcct8+M6Ys4sbUnxbb7UN8V0C7DsjOjCALu/HevAzllR+sLc0R5zzJQJQ
 VXfgV7IMYL+l3nL1J2X0Ka/nb2CvM6XrYWPpTuzynpSyz+VuSlK49urKw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412518458"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="412518458"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 04:58:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725462266"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="725462266"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 04:57:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKIs8-0006UK-0p;
 Tue, 24 Jan 2023 12:57:56 +0000
Date: Tue, 24 Jan 2023 20:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio
 latencies to display info
Message-ID: <202301242053.vCYJQIUE-lkp@intel.com>
References: <20230124094154.2282778-3-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124094154.2282778-3-jani.nikula@intel.com>
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
Cc: Pan@freedesktop.org, Emma Anholt <emma@anholt.net>, llvm@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, amd-gfx@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-mediatek@lists.infradead.org, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>, Xinhui <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230124094154.2282778-3-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/connector: move ELD and video/audio latencies to display info
config: hexagon-randconfig-r045-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242053.vCYJQIUE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1e92b5478cfc1b0df66153652111117e9548b0d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-connector-move-HDR-sink-metadata-to-display-info/20230124-174322
        git checkout 1e92b5478cfc1b0df66153652111117e9548b0d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/bridge/ drivers/gpu/drm/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/bridge/sii902x.c:17:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/bridge/sii902x.c:736:33: error: no member named 'eld' in 'struct drm_connector'
           memcpy(buf, sii902x->connector.eld,
                       ~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/bridge/sii902x.c:737:39: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(sii902x->connector.eld), len));
                             ~~~~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:16: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                ^
   include/linux/minmax.h:20:21: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
   drivers/gpu/drm/bridge/sii902x.c:737:39: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(sii902x->connector.eld), len));
                             ~~~~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:43: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                                           ^
   include/linux/minmax.h:23:19: note: expanded from macro '__no_side_effects'
                   (__is_constexpr(x) && __is_constexpr(y))
                                   ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   6 warnings and 3 errors generated.
--
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/gpu/drm/i2c/tda998x_drv.c:10:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/gpu/drm/i2c/tda998x_drv.c:1156:30: error: no member named 'eld' in 'struct drm_connector'
           memcpy(buf, priv->connector.eld,
                       ~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i2c/tda998x_drv.c:1157:36: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(priv->connector.eld), len));
                             ~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:16: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                ^
   include/linux/minmax.h:20:21: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
   drivers/gpu/drm/i2c/tda998x_drv.c:1157:36: error: no member named 'eld' in 'struct drm_connector'
                  min(sizeof(priv->connector.eld), len));
                             ~~~~~~~~~~~~~~~ ^
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                                         ^
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                            ^
   include/linux/minmax.h:26:43: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                                           ^
   include/linux/minmax.h:23:19: note: expanded from macro '__no_side_effects'
                   (__is_constexpr(x) && __is_constexpr(y))
                                   ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   6 warnings and 3 errors generated.


vim +736 drivers/gpu/drm/bridge/sii902x.c

ff5781634c4116 Jyri Sarha 2019-05-27  728  
ff5781634c4116 Jyri Sarha 2019-05-27  729  static int sii902x_audio_get_eld(struct device *dev, void *data,
ff5781634c4116 Jyri Sarha 2019-05-27  730  				 uint8_t *buf, size_t len)
ff5781634c4116 Jyri Sarha 2019-05-27  731  {
ff5781634c4116 Jyri Sarha 2019-05-27  732  	struct sii902x *sii902x = dev_get_drvdata(dev);
ff5781634c4116 Jyri Sarha 2019-05-27  733  
ff5781634c4116 Jyri Sarha 2019-05-27  734  	mutex_lock(&sii902x->mutex);
ff5781634c4116 Jyri Sarha 2019-05-27  735  
ff5781634c4116 Jyri Sarha 2019-05-27 @736  	memcpy(buf, sii902x->connector.eld,
ff5781634c4116 Jyri Sarha 2019-05-27  737  	       min(sizeof(sii902x->connector.eld), len));
ff5781634c4116 Jyri Sarha 2019-05-27  738  
ff5781634c4116 Jyri Sarha 2019-05-27  739  	mutex_unlock(&sii902x->mutex);
ff5781634c4116 Jyri Sarha 2019-05-27  740  
ff5781634c4116 Jyri Sarha 2019-05-27  741  	return 0;
ff5781634c4116 Jyri Sarha 2019-05-27  742  }
ff5781634c4116 Jyri Sarha 2019-05-27  743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
