Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC431B01B1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F656E197;
	Mon, 20 Apr 2020 06:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A926E190;
 Mon, 20 Apr 2020 06:40:45 +0000 (UTC)
IronPort-SDR: Qw7/PEWPBopTDYnlHEqPwnB5knot3e4lN61du8kHWsvj/oU0/Hda9ASBpKIG1Y1UO4itAXGuwL
 Y3AMPxxcEUSQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 23:40:44 -0700
IronPort-SDR: Y+/+bXUBXAolLl7+Mr8S4BOFse8p/VRSKSp+A6OMcrNBv8pNdvpZhRd/0lpwrQGBWG6UQBA6Oh
 ir1xXf1M1DZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
 d="gz'50?scan'50,208,50";a="333826783"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 23:40:24 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jQQ6S-000Hzh-6r; Mon, 20 Apr 2020 14:40:24 +0800
Date: Mon, 20 Apr 2020 14:39:50 +0800
From: kbuild test robot <lkp@intel.com>
To: Hadar Gat <hadar.gat@arm.com>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, JC Kuo <jckuo@nvidia.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] of_device: removed #include that caused a recursion
 in included headers
Message-ID: <202004201403.6GizNbNA%lkp@intel.com>
References: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
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
Cc: linux-samsung-soc@vger.kernel.org, kbuild-all@lists.01.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Hadar Gat <hadar.gat@arm.com>, sparclinux@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hadar,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on stm32/stm32-next]
[also build test ERROR on sunxi/sunxi/for-next linus/master v5.7-rc1 next-20200416]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Hadar-Gat/of_device-removed-include-that-caused-a-recursion-in-included-headers/20200417-155422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
config: sparc64-defconfig (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=sparc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/sparc/kernel/sbus.c: In function 'sbus_init':
>> arch/sparc/kernel/sbus.c:669:32: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     669 |   struct platform_device *op = of_find_device_by_node(dp);
         |                                ^~~~~~~~~~~~~~~~~~~~~~
         |                                bus_find_device_by_fwnode
>> arch/sparc/kernel/sbus.c:669:32: error: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/pci.c: In function 'of_create_pci_dev':
>> arch/sparc/kernel/pci.c:276:7: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     276 |  op = of_find_device_by_node(node);
         |       ^~~~~~~~~~~~~~~~~~~~~~
         |       bus_find_device_by_fwnode
>> arch/sparc/kernel/pci.c:276:5: error: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     276 |  op = of_find_device_by_node(node);
         |     ^
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/pci_sabre.c: In function 'sabre_register_error_handlers':
>> arch/sparc/kernel/pci_sabre.c:324:7: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     324 |  op = of_find_device_by_node(dp);
         |       ^~~~~~~~~~~~~~~~~~~~~~
         |       bus_find_device_by_fwnode
   arch/sparc/kernel/pci_sabre.c:324:5: error: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     324 |  op = of_find_device_by_node(dp);
         |     ^
   cc1: all warnings being treated as errors
--
   arch/sparc/kernel/pci_schizo.c: In function 'tomatillo_register_error_handlers':
>> arch/sparc/kernel/pci_schizo.c:850:31: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     850 |  struct platform_device *op = of_find_device_by_node(pbm->op->dev.of_node);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               bus_find_device_by_fwnode
   arch/sparc/kernel/pci_schizo.c:850:31: error: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
   arch/sparc/kernel/pci_schizo.c: In function 'schizo_register_error_handlers':
   arch/sparc/kernel/pci_schizo.c:945:31: error: initialization of 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
     945 |  struct platform_device *op = of_find_device_by_node(pbm->op->dev.of_node);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +669 arch/sparc/kernel/sbus.c

8fae097debdf8a arch/sparc64/kernel/sbus.c David S. Miller 2006-06-20  663  
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  664  static int __init sbus_init(void)
576c352e89e57c arch/sparc64/kernel/sbus.c David S. Miller 2006-06-23  665  {
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  666  	struct device_node *dp;
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  667  
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  668  	for_each_node_by_name(dp, "sbus") {
cd4cd7306a403f arch/sparc/kernel/sbus.c   Grant Likely    2010-07-22 @669  		struct platform_device *op = of_find_device_by_node(dp);
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  670  
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  671  		sbus_iommu_init(op);
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  672  		of_propagate_archdata(op);
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  673  	}
576c352e89e57c arch/sparc64/kernel/sbus.c David S. Miller 2006-06-23  674  
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  675  	return 0;
576c352e89e57c arch/sparc64/kernel/sbus.c David S. Miller 2006-06-23  676  }
046e26a8ba10b8 arch/sparc64/kernel/sbus.c David S. Miller 2008-08-27  677  

:::::: The code at line 669 was first introduced by commit
:::::: cd4cd7306a403f62ef3ca783b9d1cf2a03e595ed sparc: remove references to of_device and to_of_device

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tThc/1wpZn/ma/RB
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
uzsBAA==

--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--tThc/1wpZn/ma/RB--
