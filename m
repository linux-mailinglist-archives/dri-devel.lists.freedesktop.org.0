Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976723E56F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 03:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539CF89CA0;
	Fri,  7 Aug 2020 01:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BD689CA0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 01:15:59 +0000 (UTC)
IronPort-SDR: 6aFF8PkgjxHY05X8S8nKCm/GAv2odJ+bsTDFtdlFKQox/72VN3O2CmggzwJkgG0NJkCppQ21tu
 jKau/3PPifAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="133045219"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
 d="gz'50?scan'50,208,50";a="133045219"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 18:15:59 -0700
IronPort-SDR: rkojL4fc1XlEt7dnhRrM5BRgE4t/6UxUWobwATqJPblCOyJThE/JkPMXYJKHtccoZy6r9O5EF+
 oHAHTOy86U1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
 d="gz'50?scan'50,208,50";a="276547249"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2020 18:15:54 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3qzB-0001vg-Vc; Fri, 07 Aug 2020 01:15:53 +0000
Date: Fri, 7 Aug 2020 09:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Swapnil Jakhade <sjakhade@cadence.com>, airlied@linux.ie,
 daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robh+dt@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 jonas@kwiboo.se, jernej.skrabec@siol.net,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Message-ID: <202008070932.PBdFFOaW%lkp@intel.com>
References: <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <1596713672-8146-3-git-send-email-sjakhade@cadence.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Swapnil,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v5.8 next-20200806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Swapnil-Jakhade/dt-bindings-drm-bridge-Document-Cadence-MHDP-bridge-bindings/20200807-011620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: mips-randconfig-r005-20200807 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:23,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/bridge/cdns-mhdp-core.c:14:
   drivers/gpu/drm/bridge/cdns-mhdp-core.c: In function 'cdns_mhdp_link_training_init':
   include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
      26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
         |                            ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
      39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cdns-mhdp-core.h:116:35: note: in expansion of macro 'GENMASK'
     116 | #define CDNS_DP_LANE_EN_LANES(x)  GENMASK((x) - 1, 0)
         |                                   ^~~~~~~
   drivers/gpu/drm/bridge/cdns-mhdp-core.c:892:8: note: in expansion of macro 'CDNS_DP_LANE_EN_LANES'
     892 |        CDNS_DP_LANE_EN_LANES(mhdp->link.num_lanes));
         |        ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
      26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))
         |                                        ^
   include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
      39 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cdns-mhdp-core.h:116:35: note: in expansion of macro 'GENMASK'
     116 | #define CDNS_DP_LANE_EN_LANES(x)  GENMASK((x) - 1, 0)
         |                                   ^~~~~~~
   drivers/gpu/drm/bridge/cdns-mhdp-core.c:892:8: note: in expansion of macro 'CDNS_DP_LANE_EN_LANES'
     892 |        CDNS_DP_LANE_EN_LANES(mhdp->link.num_lanes));
         |        ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cdns-mhdp-core.c: In function 'cdns_mhdp_fill_host_caps':
>> drivers/gpu/drm/bridge/cdns-mhdp-core.c:1382:2: error: implicit declaration of function 'phy_get_attrs' [-Werror=implicit-function-declaration]
    1382 |  phy_get_attrs(mhdp->phy, &attrs);
         |  ^~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cdns-mhdp-core.c:1388:19: error: 'struct phy_attrs' has no member named 'max_link_rate'
    1388 |  link_rate = attrs.max_link_rate;
         |                   ^
   cc1: some warnings being treated as errors

vim +/phy_get_attrs +1382 drivers/gpu/drm/bridge/cdns-mhdp-core.c

  1375	
  1376	static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
  1377	{
  1378		unsigned int link_rate;
  1379		struct phy_attrs attrs;
  1380	
  1381		/* Get source capabilities based on PHY attributes */
> 1382		phy_get_attrs(mhdp->phy, &attrs);
  1383	
  1384		mhdp->host.lanes_cnt = attrs.bus_width;
  1385		if (!mhdp->host.lanes_cnt)
  1386			mhdp->host.lanes_cnt = 4;
  1387	
> 1388		link_rate = attrs.max_link_rate;
  1389		if (!link_rate)
  1390			link_rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
  1391		else
  1392			/* PHY uses Mb/s, DRM uses tens of kb/s. */
  1393			link_rate *= 100;
  1394	
  1395		mhdp->host.link_rate = link_rate;
  1396		mhdp->host.volt_swing = CDNS_VOLT_SWING(3);
  1397		mhdp->host.pre_emphasis = CDNS_PRE_EMPHASIS(3);
  1398		mhdp->host.pattern_supp = CDNS_SUPPORT_TPS(1) |
  1399					  CDNS_SUPPORT_TPS(2) | CDNS_SUPPORT_TPS(3) |
  1400					  CDNS_SUPPORT_TPS(4);
  1401		mhdp->host.lane_mapping = CDNS_LANE_MAPPING_NORMAL;
  1402		mhdp->host.fast_link = false;
  1403		mhdp->host.enhanced = true;
  1404		mhdp->host.scrambler = true;
  1405		mhdp->host.ssc = false;
  1406	}
  1407	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--FL5UXtIhxfXey3p5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--FL5UXtIhxfXey3p5--
