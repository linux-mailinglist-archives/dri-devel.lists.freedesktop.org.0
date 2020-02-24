Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03C16B0E8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 21:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08396E867;
	Mon, 24 Feb 2020 20:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DF66E867
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 20:25:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 12:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="231233867"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 12:24:57 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j6KHg-0001Dc-NC; Tue, 25 Feb 2020 04:24:56 +0800
Date: Tue, 25 Feb 2020 04:24:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 22/89] clk: bcm: rpi: Discover the firmware clocks
Message-ID: <202002250442.Rqp31Tng%lkp@intel.com>
References: <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, kbuild-all@lists.01.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next anholt/for-next v5.6-rc3 next-20200224]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-vc4-Support-BCM2711-Display-Pipeline/20200224-172730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse: sparse: incorrect type in argument 2 (different base types)
>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse:    expected unsigned int parent
>> drivers/clk/bcm/clk-raspberrypi.c:365:56: sparse:    got restricted __le32 [usertype] parent
   drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse: sparse: incorrect type in argument 3 (different base types)
>> drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse:    expected unsigned int id
>> drivers/clk/bcm/clk-raspberrypi.c:365:70: sparse:    got restricted __le32 [usertype] id
>> drivers/clk/bcm/clk-raspberrypi.c:369:31: sparse: sparse: restricted __le32 degrades to integer
   drivers/clk/bcm/clk-raspberrypi.c:370:33: sparse: sparse: restricted __le32 degrades to integer

vim +365 drivers/clk/bcm/clk-raspberrypi.c

   345	
   346	static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
   347					       struct clk_hw_onecell_data *data)
   348	{
   349		struct rpi_firmware_get_clocks_response *clks;
   350		size_t clks_size = NUM_FW_CLKS * sizeof(*clks);
   351		int ret;
   352	
   353		clks = devm_kzalloc(rpi->dev, clks_size, GFP_KERNEL);
   354		if (!clks)
   355			return -ENOMEM;
   356	
   357		ret = rpi_firmware_property(rpi->firmware, RPI_FIRMWARE_GET_CLOCKS,
   358					    clks, clks_size);
   359		if (ret)
   360			return ret;
   361	
   362		while (clks->id) {
   363			struct clk_hw *hw;
   364	
 > 365			hw = raspberrypi_clk_register(rpi, clks->parent, clks->id);
   366			if (IS_ERR(hw))
   367				return PTR_ERR(hw);
   368	
 > 369			data->hws[clks->id] = hw;
   370			data->num = clks->id + 1;
   371			clks++;
   372		}
   373	
   374		return 0;
   375	}
   376	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
