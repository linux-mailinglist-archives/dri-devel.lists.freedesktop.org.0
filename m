Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C60576F08
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF9A10EA28;
	Sat, 16 Jul 2022 14:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1C10E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657908126; x=1689444126;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jHZoGwfY+YAWaEvmFIs9T/MUj4oMs56kBoAM3CyGWwU=;
 b=SRqv9Wou8ClTsFz4XYs0nZUkeHORyfK61qiPbQRmhqhHYrW+BR2hwVRn
 0ZRVs/6Q0b9bs7W9KiAIXi0b1CZFx4DD3JspZ62TpI6fKR8VXEkUrZbzY
 ieTcsbr7FA0GRPstphFzPJ69euF5IkWIo2CtkwQvusoxaI6Exmlj4c1tP
 xJF6SZ1PeqHMjNoSwSfXL67wLh0XrIyaNtHoXGZsmmgluL6fXPo5pFY6T
 zWvEIPf5vjpQInGKNwQYtoLygcVtkwGKGSXX1mGmMmXeRLLczgXbMaFKe
 ZJzE9wpqAHkuzdtf05H68FiAaMg9+2pLYdV8Fz6+xkNy0pQsLQ/7Ua01n A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="266275179"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="266275179"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 11:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="773060392"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 15 Jul 2022 11:01:40 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCPdD-0000c9-Gw;
 Fri, 15 Jul 2022 18:01:39 +0000
Date: Sat, 16 Jul 2022 02:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, deller@gmx.de,
 airlied@linux.ie
Subject: Re: [PATCH v14 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
Message-ID: <202207160102.zyueiI7S-lkp@intel.com>
References: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712111223.13080-6-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, kbuild-all@lists.01.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bo-Chen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next pza/reset/next linus/master v5.19-rc6 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Chen-Chen/drm-mediatek-Add-MT8195-DisplayPort-driver/20220712-191341
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220716/202207160102.zyueiI7S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a3869f524e16c38015e0f124c6597927fc6d26b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bo-Chen-Chen/drm-mediatek-Add-MT8195-DisplayPort-driver/20220712-191341
        git checkout a3869f524e16c38015e0f124c6597927fc6d26b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/ drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_train_tps_1':
>> drivers/gpu/drm/mediatek/mtk_dp.c:1092:12: warning: variable 'val' set but not used [-Wunused-but-set-variable]
    1092 |         u8 val;
         |            ^~~
   drivers/gpu/drm/mediatek/mtk_dp.c: In function 'mtk_dp_bridge_atomic_get_output_bus_fmts':
   drivers/gpu/drm/mediatek/mtk_dp.c:1865:26: error: 'MEDIA_BUS_FMT_FIXED' undeclared (first use in this function)
    1865 |         output_fmts[0] = MEDIA_BUS_FMT_FIXED;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1865:26: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/mediatek/mtk_dp.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dp.c:1870:9: error: 'MEDIA_BUS_FMT_RGB888_1X24' undeclared here (not in a function)
    1870 |         MEDIA_BUS_FMT_RGB888_1X24,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1871:9: error: 'MEDIA_BUS_FMT_YUV8_1X24' undeclared here (not in a function)
    1871 |         MEDIA_BUS_FMT_YUV8_1X24,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp.c:1872:9: error: 'MEDIA_BUS_FMT_YUYV8_1X16' undeclared here (not in a function)
    1872 |         MEDIA_BUS_FMT_YUYV8_1X16,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/val +1092 drivers/gpu/drm/mediatek/mtk_dp.c

  1087	
  1088	static int mtk_dp_train_tps_1(struct mtk_dp *mtk_dp, u8 target_lane_count,
  1089				      int *iteration_count, u8 *lane_adjust,
  1090				      int *status_control, u8 *prev_lane_adjust)
  1091	{
> 1092		u8 val;
  1093		u8 link_status[DP_LINK_STATUS_SIZE] = {};
  1094	
  1095		mtk_dp_training_set_scramble(mtk_dp, false);
  1096	
  1097		if (*status_control == 0) {
  1098			mtk_dp_train_set_pattern(mtk_dp, 1);
  1099			val = DP_LINK_SCRAMBLING_DISABLE |
  1100				DP_TRAINING_PATTERN_1;
  1101			drm_dp_dpcd_writeb(&mtk_dp->aux,
  1102					   DP_TRAINING_PATTERN_SET,
  1103					   DP_LINK_SCRAMBLING_DISABLE |
  1104					   DP_TRAINING_PATTERN_1);
  1105			drm_dp_dpcd_read(&mtk_dp->aux,
  1106					 DP_ADJUST_REQUEST_LANE0_1,
  1107					 lane_adjust,
  1108					 sizeof(*lane_adjust) * 2);
  1109	
  1110			mtk_dp_train_update_swing_pre(mtk_dp,
  1111						      target_lane_count, lane_adjust);
  1112			*status_control = 1;
  1113			(*iteration_count)++;
  1114		}
  1115	
  1116		drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux, mtk_dp->rx_cap);
  1117		drm_dp_dpcd_read_link_status(&mtk_dp->aux, link_status);
  1118	
  1119		if (drm_dp_clock_recovery_ok(link_status,
  1120					     target_lane_count)) {
  1121			mtk_dp->train_info.cr_done = true;
  1122			*iteration_count = 1;
  1123			dev_dbg(mtk_dp->dev, "Link train CR pass\n");
  1124			return 0;
  1125		} else if (*prev_lane_adjust == link_status[4]) {
  1126			(*iteration_count)++;
  1127			if (*prev_lane_adjust & DP_ADJUST_VOLTAGE_SWING_LANE0_MASK) {
  1128				dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
  1129				return -EINVAL;
  1130			}
  1131		} else {
  1132			*prev_lane_adjust = link_status[4];
  1133		}
  1134		return -EAGAIN;
  1135	}
  1136	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
