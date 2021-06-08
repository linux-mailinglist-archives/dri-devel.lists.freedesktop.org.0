Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E239F803
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 15:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C666EC01;
	Tue,  8 Jun 2021 13:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66A46EC01
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 13:42:16 +0000 (UTC)
IronPort-SDR: OHrIRkOjrACuSD4z9Pq2yYHCFviiongeeSDyjl7YYnCkkrfnge0jBj1f+1uGun+ty18+w4jhGA
 6cpoDlhOlCFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185218566"
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
 d="gz'50?scan'50,208,50";a="185218566"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 06:42:15 -0700
IronPort-SDR: dYKyoL5hmgJ9TGH2ASTINZqi5rd7zc8Qu0K5j6lsucc/VALgtnMnKSNF7rF/+qYSdRh3ZOv7mv
 3tQIu55oHBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,258,1616482800"; 
 d="gz'50?scan'50,208,50";a="476606882"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2021 06:42:12 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lqbzf-00092s-IV; Tue, 08 Jun 2021 13:42:11 +0000
Date: Tue, 8 Jun 2021 21:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V7 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
Message-ID: <202106082124.fPJEaw85-lkp@intel.com>
References: <20210608094046.22516-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20210608094046.22516-2-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 kbuild-all@lists.01.org, ch@denx.de, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next linus/master v5.13-rc5 next-20210608]
[cannot apply to drm-tip/drm-tip drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-drm-bridge-ti-sn65dsi83-Add-TI-SN65DSI83-and-SN65DSI84-bindings/20210608-174220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: microblaze-randconfig-s031-20210608 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/309f2f7d59a0ea5286482ddb0f6a8313317dbb8d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-drm-bridge-ti-sn65dsi83-Add-TI-SN65DSI83-and-SN65DSI84-bindings/20210608-174220
        git checkout 309f2f7d59a0ea5286482ddb0f6a8313317dbb8d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=microblaze 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/ti-sn65dsi83.c:429:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [assigned] [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:429:13: sparse:     expected unsigned short [assigned] [usertype] val
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:429:13: sparse:     got restricted __le16 [usertype]
>> drivers/gpu/drm/bridge/ti-sn65dsi83.c:432:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:432:13: sparse:     expected unsigned short [addressable] [assigned] [usertype] val
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:432:13: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:436:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:436:13: sparse:     expected unsigned short [addressable] [assigned] [usertype] val
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:436:13: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:438:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:438:13: sparse:     expected unsigned short [addressable] [assigned] [usertype] val
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:438:13: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:441:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:441:13: sparse:     expected unsigned short [addressable] [assigned] [usertype] val
   drivers/gpu/drm/bridge/ti-sn65dsi83.c:441:13: sparse:     got restricted __le16 [usertype]

vim +429 drivers/gpu/drm/bridge/ti-sn65dsi83.c

   366	
   367	static void sn65dsi83_enable(struct drm_bridge *bridge)
   368	{
   369		struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
   370		unsigned int pval;
   371		u16 val;
   372		int ret;
   373	
   374		/* Clear reset, disable PLL */
   375		regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
   376		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
   377	
   378		/* Reference clock derived from DSI link clock. */
   379		regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
   380			     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx)) |
   381			     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
   382		regmap_write(ctx->regmap, REG_DSI_CLK,
   383			     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
   384		regmap_write(ctx->regmap, REG_RC_DSI_CLK,
   385			     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
   386	
   387		/* Set number of DSI lanes and LVDS link config. */
   388		regmap_write(ctx->regmap, REG_DSI_LANE,
   389			     REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
   390			     REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
   391			     /* CHB is DSI85-only, set to default on DSI83/DSI84 */
   392			     REG_DSI_LANE_CHB_DSI_LANES(3));
   393		/* No equalization. */
   394		regmap_write(ctx->regmap, REG_DSI_EQ, 0x00);
   395	
   396		/* Set up sync signal polarity. */
   397		val = (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC ?
   398		       REG_LVDS_FMT_HS_NEG_POLARITY : 0) |
   399		      (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC ?
   400		       REG_LVDS_FMT_VS_NEG_POLARITY : 0);
   401	
   402		/* Set up bits-per-pixel, 18bpp or 24bpp. */
   403		if (ctx->lvds_format_24bpp) {
   404			val |= REG_LVDS_FMT_CHA_24BPP_MODE;
   405			if (ctx->lvds_dual_link)
   406				val |= REG_LVDS_FMT_CHB_24BPP_MODE;
   407		}
   408	
   409		/* Set up LVDS format, JEIDA/Format 1 or SPWG/Format 2 */
   410		if (ctx->lvds_format_jeida) {
   411			val |= REG_LVDS_FMT_CHA_24BPP_FORMAT1;
   412			if (ctx->lvds_dual_link)
   413				val |= REG_LVDS_FMT_CHB_24BPP_FORMAT1;
   414		}
   415	
   416		/* Set up LVDS output config (DSI84,DSI85) */
   417		if (!ctx->lvds_dual_link)
   418			val |= REG_LVDS_FMT_LVDS_LINK_CFG;
   419	
   420		regmap_write(ctx->regmap, REG_LVDS_FMT, val);
   421		regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
   422		regmap_write(ctx->regmap, REG_LVDS_LANE,
   423			     (ctx->lvds_dual_link_even_odd_swap ?
   424			      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
   425			     REG_LVDS_LANE_CHA_LVDS_TERM |
   426			     REG_LVDS_LANE_CHB_LVDS_TERM);
   427		regmap_write(ctx->regmap, REG_LVDS_CM, 0x00);
   428	
 > 429		val = cpu_to_le16(ctx->mode.hdisplay);
   430		regmap_bulk_write(ctx->regmap, REG_VID_CHA_ACTIVE_LINE_LENGTH_LOW,
   431				  &val, 2);
 > 432		val = cpu_to_le16(ctx->mode.vdisplay);
   433		regmap_bulk_write(ctx->regmap, REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW,
   434				  &val, 2);
   435		/* 32 + 1 pixel clock to ensure proper operation */
   436		val = cpu_to_le16(32 + 1);
   437		regmap_bulk_write(ctx->regmap, REG_VID_CHA_SYNC_DELAY_LOW, &val, 2);
   438		val = cpu_to_le16(ctx->mode.hsync_end - ctx->mode.hsync_start);
   439		regmap_bulk_write(ctx->regmap, REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW,
   440				  &val, 2);
   441		val = cpu_to_le16(ctx->mode.vsync_end - ctx->mode.vsync_start);
   442		regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSYNC_PULSE_WIDTH_LOW,
   443				  &val, 2);
   444		regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
   445			     ctx->mode.htotal - ctx->mode.hsync_end);
   446		regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,
   447			     ctx->mode.vtotal - ctx->mode.vsync_end);
   448		regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,
   449			     ctx->mode.hsync_start - ctx->mode.hdisplay);
   450		regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
   451			     ctx->mode.vsync_start - ctx->mode.vdisplay);
   452		regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
   453	
   454		/* Enable PLL */
   455		regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
   456		usleep_range(3000, 4000);
   457		ret = regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
   458					       pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
   459					       1000, 100000);
   460		if (ret) {
   461			dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
   462			/* On failure, disable PLL again and exit. */
   463			regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
   464			return;
   465		}
   466	
   467		/* Trigger reset after CSR register update. */
   468		regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
   469	
   470		/* Clear all errors that got asserted during initialization. */
   471		regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
   472		regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
   473	}
   474	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--M9NhX3UHpAaciwkO
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
jnLlGeH/H8o+c/usiAEA

--M9NhX3UHpAaciwkO--
