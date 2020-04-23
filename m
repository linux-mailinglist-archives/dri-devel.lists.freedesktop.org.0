Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590251B543B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 07:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007326E13C;
	Thu, 23 Apr 2020 05:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692246E135;
 Thu, 23 Apr 2020 05:28:34 +0000 (UTC)
IronPort-SDR: 0zCpSYxzeT2BaG8Em45DE03sNpzCobngQ5eo1c5oYGqJy8sWSdR+ozA+xziiJ8KlBzp2Ty8EG7
 bzugK0YD9zTg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 22:28:34 -0700
IronPort-SDR: 9QL7ZrOMoc0Bj55HfalcCkUtocQogTUvBLcCYpNgGDTc+fxVmLA9EFsw/LCbIdPp3kkiUQm0ug
 hUVB3WNHYf1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; 
 d="gz'50?scan'50,208,50";a="301122242"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2020 22:28:18 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jRUPK-0005Si-59; Thu, 23 Apr 2020 13:28:18 +0800
Date: Thu, 23 Apr 2020 13:27:31 +0800
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ofir Drang <ofir.drang@arm.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3] of_device: removed #include that caused a recursion
 in included headers
Message-ID: <202004231303.gnRgjLGr%lkp@intel.com>
References: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
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
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hadar,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on sparc/master]
[also build test ERROR on stm32/stm32-next linus/master v5.7-rc2 next-20200422]
[cannot apply to sparc-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Hadar-Gat/of_device-removed-include-that-caused-a-recursion-in-included-headers/20200423-040844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git master
config: arm64-defconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/firmware/ti_sci.c: In function 'ti_sci_probe':
>> drivers/firmware/ti_sci.c:3520:9: error: implicit declaration of function 'of_platform_populate' [-Werror=implicit-function-declaration]
    3520 |  return of_platform_populate(dev->of_node, NULL, NULL, dev);
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/firmware/ti_sci.c: In function 'ti_sci_remove':
>> drivers/firmware/ti_sci.c:3536:2: error: implicit declaration of function 'of_platform_depopulate' [-Werror=implicit-function-declaration]
    3536 |  of_platform_depopulate(dev);
         |  ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/firmware/tegra/bpmp.c: In function 'tegra_bpmp_get':
>> drivers/firmware/tegra/bpmp.c:51:9: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
      51 |  pdev = of_find_device_by_node(np);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         bus_find_device_by_fwnode
   drivers/firmware/tegra/bpmp.c:51:7: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      51 |  pdev = of_find_device_by_node(np);
         |       ^
   drivers/firmware/tegra/bpmp.c: In function 'tegra_bpmp_probe':
>> drivers/firmware/tegra/bpmp.c:759:8: error: implicit declaration of function 'of_platform_default_populate' [-Werror=implicit-function-declaration]
     759 |  err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c: In function 'sun8i_dw_hdmi_find_connector_pdev':
>> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:115:9: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'of_find_i2c_device_by_node'? [-Werror=implicit-function-declaration]
     115 |  pdev = of_find_device_by_node(remote);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         of_find_i2c_device_by_node
   drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:115:7: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     115 |  pdev = of_find_device_by_node(remote);
         |       ^
   cc1: some warnings being treated as errors

vim +/of_platform_populate +3520 drivers/firmware/ti_sci.c

aa276781a64a5f Nishanth Menon 2016-10-18  3385  
aa276781a64a5f Nishanth Menon 2016-10-18  3386  static int ti_sci_probe(struct platform_device *pdev)
aa276781a64a5f Nishanth Menon 2016-10-18  3387  {
aa276781a64a5f Nishanth Menon 2016-10-18  3388  	struct device *dev = &pdev->dev;
aa276781a64a5f Nishanth Menon 2016-10-18  3389  	const struct of_device_id *of_id;
aa276781a64a5f Nishanth Menon 2016-10-18  3390  	const struct ti_sci_desc *desc;
aa276781a64a5f Nishanth Menon 2016-10-18  3391  	struct ti_sci_xfer *xfer;
aa276781a64a5f Nishanth Menon 2016-10-18  3392  	struct ti_sci_info *info = NULL;
aa276781a64a5f Nishanth Menon 2016-10-18  3393  	struct ti_sci_xfers_info *minfo;
aa276781a64a5f Nishanth Menon 2016-10-18  3394  	struct mbox_client *cl;
aa276781a64a5f Nishanth Menon 2016-10-18  3395  	int ret = -EINVAL;
aa276781a64a5f Nishanth Menon 2016-10-18  3396  	int i;
912cffb4ed8612 Nishanth Menon 2016-10-18  3397  	int reboot = 0;
e69a35531589a2 Nishanth Menon 2018-08-28  3398  	u32 h_id;
aa276781a64a5f Nishanth Menon 2016-10-18  3399  
aa276781a64a5f Nishanth Menon 2016-10-18  3400  	of_id = of_match_device(ti_sci_of_match, dev);
aa276781a64a5f Nishanth Menon 2016-10-18  3401  	if (!of_id) {
aa276781a64a5f Nishanth Menon 2016-10-18  3402  		dev_err(dev, "OF data missing\n");
aa276781a64a5f Nishanth Menon 2016-10-18  3403  		return -EINVAL;
aa276781a64a5f Nishanth Menon 2016-10-18  3404  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3405  	desc = of_id->data;
aa276781a64a5f Nishanth Menon 2016-10-18  3406  
aa276781a64a5f Nishanth Menon 2016-10-18  3407  	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
aa276781a64a5f Nishanth Menon 2016-10-18  3408  	if (!info)
aa276781a64a5f Nishanth Menon 2016-10-18  3409  		return -ENOMEM;
aa276781a64a5f Nishanth Menon 2016-10-18  3410  
aa276781a64a5f Nishanth Menon 2016-10-18  3411  	info->dev = dev;
aa276781a64a5f Nishanth Menon 2016-10-18  3412  	info->desc = desc;
e69a35531589a2 Nishanth Menon 2018-08-28  3413  	ret = of_property_read_u32(dev->of_node, "ti,host-id", &h_id);
e69a35531589a2 Nishanth Menon 2018-08-28  3414  	/* if the property is not present in DT, use a default from desc */
e69a35531589a2 Nishanth Menon 2018-08-28  3415  	if (ret < 0) {
e69a35531589a2 Nishanth Menon 2018-08-28  3416  		info->host_id = info->desc->default_host_id;
e69a35531589a2 Nishanth Menon 2018-08-28  3417  	} else {
e69a35531589a2 Nishanth Menon 2018-08-28  3418  		if (!h_id) {
e69a35531589a2 Nishanth Menon 2018-08-28  3419  			dev_warn(dev, "Host ID 0 is reserved for firmware\n");
e69a35531589a2 Nishanth Menon 2018-08-28  3420  			info->host_id = info->desc->default_host_id;
e69a35531589a2 Nishanth Menon 2018-08-28  3421  		} else {
e69a35531589a2 Nishanth Menon 2018-08-28  3422  			info->host_id = h_id;
e69a35531589a2 Nishanth Menon 2018-08-28  3423  		}
e69a35531589a2 Nishanth Menon 2018-08-28  3424  	}
e69a35531589a2 Nishanth Menon 2018-08-28  3425  
912cffb4ed8612 Nishanth Menon 2016-10-18  3426  	reboot = of_property_read_bool(dev->of_node,
912cffb4ed8612 Nishanth Menon 2016-10-18  3427  				       "ti,system-reboot-controller");
aa276781a64a5f Nishanth Menon 2016-10-18  3428  	INIT_LIST_HEAD(&info->node);
aa276781a64a5f Nishanth Menon 2016-10-18  3429  	minfo = &info->minfo;
aa276781a64a5f Nishanth Menon 2016-10-18  3430  
aa276781a64a5f Nishanth Menon 2016-10-18  3431  	/*
aa276781a64a5f Nishanth Menon 2016-10-18  3432  	 * Pre-allocate messages
aa276781a64a5f Nishanth Menon 2016-10-18  3433  	 * NEVER allocate more than what we can indicate in hdr.seq
aa276781a64a5f Nishanth Menon 2016-10-18  3434  	 * if we have data description bug, force a fix..
aa276781a64a5f Nishanth Menon 2016-10-18  3435  	 */
aa276781a64a5f Nishanth Menon 2016-10-18  3436  	if (WARN_ON(desc->max_msgs >=
aa276781a64a5f Nishanth Menon 2016-10-18  3437  		    1 << 8 * sizeof(((struct ti_sci_msg_hdr *)0)->seq)))
aa276781a64a5f Nishanth Menon 2016-10-18  3438  		return -EINVAL;
aa276781a64a5f Nishanth Menon 2016-10-18  3439  
aa276781a64a5f Nishanth Menon 2016-10-18  3440  	minfo->xfer_block = devm_kcalloc(dev,
aa276781a64a5f Nishanth Menon 2016-10-18  3441  					 desc->max_msgs,
aa276781a64a5f Nishanth Menon 2016-10-18  3442  					 sizeof(*minfo->xfer_block),
aa276781a64a5f Nishanth Menon 2016-10-18  3443  					 GFP_KERNEL);
aa276781a64a5f Nishanth Menon 2016-10-18  3444  	if (!minfo->xfer_block)
aa276781a64a5f Nishanth Menon 2016-10-18  3445  		return -ENOMEM;
aa276781a64a5f Nishanth Menon 2016-10-18  3446  
a86854d0c599b3 Kees Cook      2018-06-12  3447  	minfo->xfer_alloc_table = devm_kcalloc(dev,
a86854d0c599b3 Kees Cook      2018-06-12  3448  					       BITS_TO_LONGS(desc->max_msgs),
a86854d0c599b3 Kees Cook      2018-06-12  3449  					       sizeof(unsigned long),
aa276781a64a5f Nishanth Menon 2016-10-18  3450  					       GFP_KERNEL);
aa276781a64a5f Nishanth Menon 2016-10-18  3451  	if (!minfo->xfer_alloc_table)
aa276781a64a5f Nishanth Menon 2016-10-18  3452  		return -ENOMEM;
aa276781a64a5f Nishanth Menon 2016-10-18  3453  	bitmap_zero(minfo->xfer_alloc_table, desc->max_msgs);
aa276781a64a5f Nishanth Menon 2016-10-18  3454  
aa276781a64a5f Nishanth Menon 2016-10-18  3455  	/* Pre-initialize the buffer pointer to pre-allocated buffers */
aa276781a64a5f Nishanth Menon 2016-10-18  3456  	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
aa276781a64a5f Nishanth Menon 2016-10-18  3457  		xfer->xfer_buf = devm_kcalloc(dev, 1, desc->max_msg_size,
aa276781a64a5f Nishanth Menon 2016-10-18  3458  					      GFP_KERNEL);
aa276781a64a5f Nishanth Menon 2016-10-18  3459  		if (!xfer->xfer_buf)
aa276781a64a5f Nishanth Menon 2016-10-18  3460  			return -ENOMEM;
aa276781a64a5f Nishanth Menon 2016-10-18  3461  
aa276781a64a5f Nishanth Menon 2016-10-18  3462  		xfer->tx_message.buf = xfer->xfer_buf;
aa276781a64a5f Nishanth Menon 2016-10-18  3463  		init_completion(&xfer->done);
aa276781a64a5f Nishanth Menon 2016-10-18  3464  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3465  
aa276781a64a5f Nishanth Menon 2016-10-18  3466  	ret = ti_sci_debugfs_create(pdev, info);
aa276781a64a5f Nishanth Menon 2016-10-18  3467  	if (ret)
aa276781a64a5f Nishanth Menon 2016-10-18  3468  		dev_warn(dev, "Failed to create debug file\n");
aa276781a64a5f Nishanth Menon 2016-10-18  3469  
aa276781a64a5f Nishanth Menon 2016-10-18  3470  	platform_set_drvdata(pdev, info);
aa276781a64a5f Nishanth Menon 2016-10-18  3471  
aa276781a64a5f Nishanth Menon 2016-10-18  3472  	cl = &info->cl;
aa276781a64a5f Nishanth Menon 2016-10-18  3473  	cl->dev = dev;
aa276781a64a5f Nishanth Menon 2016-10-18  3474  	cl->tx_block = false;
aa276781a64a5f Nishanth Menon 2016-10-18  3475  	cl->rx_callback = ti_sci_rx_callback;
aa276781a64a5f Nishanth Menon 2016-10-18  3476  	cl->knows_txdone = true;
aa276781a64a5f Nishanth Menon 2016-10-18  3477  
aa276781a64a5f Nishanth Menon 2016-10-18  3478  	spin_lock_init(&minfo->xfer_lock);
aa276781a64a5f Nishanth Menon 2016-10-18  3479  	sema_init(&minfo->sem_xfer_count, desc->max_msgs);
aa276781a64a5f Nishanth Menon 2016-10-18  3480  
aa276781a64a5f Nishanth Menon 2016-10-18  3481  	info->chan_rx = mbox_request_channel_byname(cl, "rx");
aa276781a64a5f Nishanth Menon 2016-10-18  3482  	if (IS_ERR(info->chan_rx)) {
aa276781a64a5f Nishanth Menon 2016-10-18  3483  		ret = PTR_ERR(info->chan_rx);
aa276781a64a5f Nishanth Menon 2016-10-18  3484  		goto out;
aa276781a64a5f Nishanth Menon 2016-10-18  3485  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3486  
aa276781a64a5f Nishanth Menon 2016-10-18  3487  	info->chan_tx = mbox_request_channel_byname(cl, "tx");
aa276781a64a5f Nishanth Menon 2016-10-18  3488  	if (IS_ERR(info->chan_tx)) {
aa276781a64a5f Nishanth Menon 2016-10-18  3489  		ret = PTR_ERR(info->chan_tx);
aa276781a64a5f Nishanth Menon 2016-10-18  3490  		goto out;
aa276781a64a5f Nishanth Menon 2016-10-18  3491  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3492  	ret = ti_sci_cmd_get_revision(info);
aa276781a64a5f Nishanth Menon 2016-10-18  3493  	if (ret) {
aa276781a64a5f Nishanth Menon 2016-10-18  3494  		dev_err(dev, "Unable to communicate with TISCI(%d)\n", ret);
aa276781a64a5f Nishanth Menon 2016-10-18  3495  		goto out;
aa276781a64a5f Nishanth Menon 2016-10-18  3496  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3497  
9e7d756da7a5b0 Nishanth Menon 2016-10-18  3498  	ti_sci_setup_ops(info);
9e7d756da7a5b0 Nishanth Menon 2016-10-18  3499  
912cffb4ed8612 Nishanth Menon 2016-10-18  3500  	if (reboot) {
912cffb4ed8612 Nishanth Menon 2016-10-18  3501  		info->nb.notifier_call = tisci_reboot_handler;
912cffb4ed8612 Nishanth Menon 2016-10-18  3502  		info->nb.priority = 128;
912cffb4ed8612 Nishanth Menon 2016-10-18  3503  
912cffb4ed8612 Nishanth Menon 2016-10-18  3504  		ret = register_restart_handler(&info->nb);
912cffb4ed8612 Nishanth Menon 2016-10-18  3505  		if (ret) {
912cffb4ed8612 Nishanth Menon 2016-10-18  3506  			dev_err(dev, "reboot registration fail(%d)\n", ret);
912cffb4ed8612 Nishanth Menon 2016-10-18  3507  			return ret;
912cffb4ed8612 Nishanth Menon 2016-10-18  3508  		}
912cffb4ed8612 Nishanth Menon 2016-10-18  3509  	}
912cffb4ed8612 Nishanth Menon 2016-10-18  3510  
aa276781a64a5f Nishanth Menon 2016-10-18  3511  	dev_info(dev, "ABI: %d.%d (firmware rev 0x%04x '%s')\n",
aa276781a64a5f Nishanth Menon 2016-10-18  3512  		 info->handle.version.abi_major, info->handle.version.abi_minor,
aa276781a64a5f Nishanth Menon 2016-10-18  3513  		 info->handle.version.firmware_revision,
aa276781a64a5f Nishanth Menon 2016-10-18  3514  		 info->handle.version.firmware_description);
aa276781a64a5f Nishanth Menon 2016-10-18  3515  
aa276781a64a5f Nishanth Menon 2016-10-18  3516  	mutex_lock(&ti_sci_list_mutex);
aa276781a64a5f Nishanth Menon 2016-10-18  3517  	list_add_tail(&info->node, &ti_sci_list);
aa276781a64a5f Nishanth Menon 2016-10-18  3518  	mutex_unlock(&ti_sci_list_mutex);
aa276781a64a5f Nishanth Menon 2016-10-18  3519  
aa276781a64a5f Nishanth Menon 2016-10-18 @3520  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
aa276781a64a5f Nishanth Menon 2016-10-18  3521  out:
aa276781a64a5f Nishanth Menon 2016-10-18  3522  	if (!IS_ERR(info->chan_tx))
aa276781a64a5f Nishanth Menon 2016-10-18  3523  		mbox_free_channel(info->chan_tx);
aa276781a64a5f Nishanth Menon 2016-10-18  3524  	if (!IS_ERR(info->chan_rx))
aa276781a64a5f Nishanth Menon 2016-10-18  3525  		mbox_free_channel(info->chan_rx);
aa276781a64a5f Nishanth Menon 2016-10-18  3526  	debugfs_remove(info->d);
aa276781a64a5f Nishanth Menon 2016-10-18  3527  	return ret;
aa276781a64a5f Nishanth Menon 2016-10-18  3528  }
aa276781a64a5f Nishanth Menon 2016-10-18  3529  
aa276781a64a5f Nishanth Menon 2016-10-18  3530  static int ti_sci_remove(struct platform_device *pdev)
aa276781a64a5f Nishanth Menon 2016-10-18  3531  {
aa276781a64a5f Nishanth Menon 2016-10-18  3532  	struct ti_sci_info *info;
aa276781a64a5f Nishanth Menon 2016-10-18  3533  	struct device *dev = &pdev->dev;
aa276781a64a5f Nishanth Menon 2016-10-18  3534  	int ret = 0;
aa276781a64a5f Nishanth Menon 2016-10-18  3535  
aa276781a64a5f Nishanth Menon 2016-10-18 @3536  	of_platform_depopulate(dev);
aa276781a64a5f Nishanth Menon 2016-10-18  3537  
aa276781a64a5f Nishanth Menon 2016-10-18  3538  	info = platform_get_drvdata(pdev);
aa276781a64a5f Nishanth Menon 2016-10-18  3539  
912cffb4ed8612 Nishanth Menon 2016-10-18  3540  	if (info->nb.notifier_call)
912cffb4ed8612 Nishanth Menon 2016-10-18  3541  		unregister_restart_handler(&info->nb);
912cffb4ed8612 Nishanth Menon 2016-10-18  3542  
aa276781a64a5f Nishanth Menon 2016-10-18  3543  	mutex_lock(&ti_sci_list_mutex);
aa276781a64a5f Nishanth Menon 2016-10-18  3544  	if (info->users)
aa276781a64a5f Nishanth Menon 2016-10-18  3545  		ret = -EBUSY;
aa276781a64a5f Nishanth Menon 2016-10-18  3546  	else
aa276781a64a5f Nishanth Menon 2016-10-18  3547  		list_del(&info->node);
aa276781a64a5f Nishanth Menon 2016-10-18  3548  	mutex_unlock(&ti_sci_list_mutex);
aa276781a64a5f Nishanth Menon 2016-10-18  3549  
aa276781a64a5f Nishanth Menon 2016-10-18  3550  	if (!ret) {
aa276781a64a5f Nishanth Menon 2016-10-18  3551  		ti_sci_debugfs_destroy(pdev, info);
aa276781a64a5f Nishanth Menon 2016-10-18  3552  
aa276781a64a5f Nishanth Menon 2016-10-18  3553  		/* Safe to free channels since no more users */
aa276781a64a5f Nishanth Menon 2016-10-18  3554  		mbox_free_channel(info->chan_tx);
aa276781a64a5f Nishanth Menon 2016-10-18  3555  		mbox_free_channel(info->chan_rx);
aa276781a64a5f Nishanth Menon 2016-10-18  3556  	}
aa276781a64a5f Nishanth Menon 2016-10-18  3557  
aa276781a64a5f Nishanth Menon 2016-10-18  3558  	return ret;
aa276781a64a5f Nishanth Menon 2016-10-18  3559  }
aa276781a64a5f Nishanth Menon 2016-10-18  3560  

:::::: The code at line 3520 was first introduced by commit
:::::: aa276781a64a5f15ecc21e920960c5b1f84e5fee firmware: Add basic support for TI System Control Interface (TI-SCI) protocol

:::::: TO: Nishanth Menon <nm@ti.com>
:::::: CC: Tero Kristo <t-kristo@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--x+6KMIRAuhnl3hBn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICGzooF4AAy5jb25maWcAnDzbctw2su/5iqn4JamteOcmWT6n9ACCIAcZ3gyAMyO/sCby
2FHFkrwjOYn/frsBXgAQVHzOVrLRdDdujQb6Cr764dWMfH1+vD8+390eP3/+Nvt0ejidj8+n
D7OPd59P/zuLy1lRqhmLuXoNxNndw9e//30831+uZxevL1/PZ9vT+eH0eUYfHz7effoKTe8e
H3549QP88wqA91+gl/P/zI7H8+3vl+tfPmP7Xz7d3s5+Sin9efb29er1HGhpWSQ8bShtuGwA
c/2tA8GPZseE5GVx/Xa+ms972owUaY+aW11siGyIzJu0VOXQkYXgRcYLNkLtiSianNxErKkL
XnDFScbfs3gg5OJdsy/FdoBENc9ixXPWKBJlrJGlUANWbQQjMYyXlPB/QCKxqeZNqhn9efZ0
ev76ZeAADtuwYtcQkTYZz7m6Xi2Rle1My7ziMIxiUs3unmYPj8/YQ9c6KynJOpb8+GMI3JDa
5oqefyNJpiz6mCWkzlSzKaUqSM6uf/zp4fHh9HNPIPekGvqQN3LHKzoC4H+pygZ4VUp+aPJ3
NatZGDpqQkUpZZOzvBQ3DVGK0A0ge37UkmU8CnCC1CCxQzcbsmPAUroxCByFZNYwHlTvEGz2
7Onrb0/fnp5P98MOpaxgglMtC5UoI2slNkpuyv00psnYjmVhPEsSRhXHCScJyKPchulyngqi
cKetZYoYUBI2qBFMsiION6UbXrlSHZc54UUI1mw4E8i6m3FfueRIOYkIdqtxZZ7X9ryLGKS6
HdDpEVskpaAsbk8TL1JL0ioiJGtb9FJhLzVmUZ0m0haRV7PTw4fZ40dvh4M8hmPA2+mJ8TL1
wd+NpKlDUzh4W9joQklL1FAK8bpRnG6bSJQkpkSqF1s7ZFo41d396fwUkk/dbVkwEDOr06Js
Nu/x+si1vPSsAmAFo5Uxp4FTZFpxWLzdxkCTOstcrtroQGcbnm5QKjXXhNQ9thsxWs3QWyUY
yysFvRYsOFxHsCuzulBE3ASGbmmsO6dtREtoMwKbM2VUWFX/Wx2f/pg9wxRnR5ju0/Px+Wl2
vL19/PrwfPfwyeM8NGgI1f0aSe0nuuNCeWjc68B0UfK0aDkd2VeZpBs4EGSX+qJvEGrDRE4y
XI+UtWCBMSIZ4/VFgQCHsZjgY5rdytJocB1JRWyBRhAcs4zceB1pxCEA4+UEiyrJgwf1O3ah
VxjAYC7LjNi7KGg9k4GjAtvdAG4sFwbYzwt+NuwAByWkdKXTg+7TAyHP3HGwQ2Bjlg1H0sIU
DPZQspRGGddHvmeEu5BeXrbmD+vW3PYLKqm9Er7dwB0Kxy9oPaA9kICC4om6Xryx4cjWnBxs
/HJgGi/UFoyIhPl9rPxLzcinvtq6zZG3v58+fAUzcfbxdHz+ej49mZPXaniw8/JK8zAoGoHW
zk0r66oCm0w2RZ2TJiJgNVLnPLXGHyxhsbzyrum+sY+d6syF94YUK9A4tJQxTUVZV9YhqkjK
zG1k6xmwe2jq/fSMrwE2HsXgtvAf63Rn23Z0fzbNXnDFIkK3I4zetQGaEC4aFzNYqAloK9CX
ex6rTfDChlvQahuQw3bQisfS6dmARZyTYL8tPoED+J6J6X43dcpUFlmLrMCMtG80PDQ4fIsZ
sSNmO07ZCAzU7mXXLYSJJLAQbZmElC5Y3GDXwP079FSjAFu/0bq2f8M0hQPA2du/C6bM72EW
G0a3VQmSjUpZlUEt0eoZcBk6kRk0zY2ErY4ZXJmUKHcjh71GtRDSPhmqjJ12d4TtYOFvkkPH
sqzB6LOcEhE36XvbbAVABIClA8ne58QBHN57+NL7vbYXFZUlGgX4d0iAaFOCdZCDU4g2qd7Y
EhRtQR37yCeT8EeIt56roxV7zePFpeNJAQ3oHsq0WQLqhdiSF1WOZE3qKK9bbdaizDgjIdd9
UzYxtq/vrfUmnKMC/N9NkXPb1bSuMpYlwGdhL4WAIY9GpTV4rdjB+wmS7bHMgGleHejGHqEq
7b4kTwuSJZas6TXYAG1r2wC5ca5Owi3ZARumFs7dT+Idl6xjocUc6CQiQnCb3VskucnlGNI4
/O+hmj14nNAzdES2SroxQ34wqrE9gUPe6SKk/9X2jVtAT+A6CCglGp6EruremRnWCJMpqLe3
4KM5VioQszgOXv56S/FgNb3jpM2BNs5Unc4fH8/3x4fb04z9eXoAI5CAIUDRDAQXYrDt3C76
kfWla5CwsmYHVjLYIkHL4jtH7Abc5Wa4TotbWyuzOjIjO9dEmVcE9kNsg1enzEgosIF92T2T
CHgvwHhot8+5ohGL+hDNyEbASS7zybEGQowigLkWvtHlpk4S8NW1waKZR0B3TExUm43gomMk
zblqFMubmCiC8TuecOrFMUABJzzrnIN2P9yI2SCB+eV6aHm5jmzZdqIMmtRM3DdhDQp+qBa1
diQ8z8G8EgUoHA6KOOfF9eLqJQJyuF6twgTdrvcdLb6DDvpbXPbsU2CiaT3Q2afWrZRlLEXH
D/U6nMUdyWp2Pf/7w+n4YW79bzDt6RZU+Lgj0z84l0lGUjnGd/a8c6lbwP6q6qYix2SbPePp
JhT5kHUegJKMRwJMDeNsDgTvywJgtt7vIKulvfvAXmMid/HETamqzF5AmEbAXzvrNpO5ZYVs
mShY1uRlzMDIsoU4AT3JiMhu4HfjKJIqNcFiHQSUnqz1Pketo4t+5Ejbplu8XhtQe308qPp8
fMZrCk7H59NtG4S32xGKR8zvjaQ8s1VsO4PiwH3CrHJC5hoY0Xx5tboYQ8E+NX6nA2ci445u
MWCuMOo3pVwiQXOpIn+PDjdF6S9mu/IAICUgeJRU/sSzdLH1QBsu/TXnLOYgbj4lWOf2NhvY
Dm53H3bwOfAODvVo/YKRDAaZWr8A6ZfEXypwd+sGcc3OjQReMqJU5q9fKowcHxZzH35TvAMf
xjZUNFyxVBCftrINd0O2qYt43NhA/ZnVBa82fES9AxsWo1Ye+IC3gAd77wvue5h+Xtk6I3As
bGsiGQIOGgxqYHY6n4/Px9lfj+c/jmdQ8h+eZn/eHWfPv59mx8+g8R+Oz3d/np5mH8/H+xNS
2QcNtQgmiAh4S3iJZ4wUcHGBF+WrISZgC+q8uVperhZvp7FvXsSu55fT2MXb9ZvlJHa1nL+5
mMaul8v5JHZ98eaFWa1X62nsYr5cv1lcTaLXi6v5ejSyxVNZMVq3ugUU5G6atYvF5cXFcpID
i4vV/O1yNYleXl1ezd98/0yKl6YCu7i6HHU2rPpytVxO7sbiYr10WErJjgO8wy+XK3srfexq
sV6/hL14AftmfXE5iV3NF4vxuOqwHNrbs8brr0lItgWfeBCH+WgHLBYLVsEF1qgs4v/Yjz/S
uziB8zHvSebzS2uysqSgD0GDDpceRn+5HQdCnZBxVN/9MJeLy/n8ar58eTZsMV8vbMcV/CtZ
DzOB2c4X9j31/7t4XLatt9q2ddwdg1lctqigRW9oLtf/TLMjxh5dvQ1qK5tkPTrhLeZ6feXC
q8kW1dBicJrAoYjQgyxAN4eMBiTIOOq8lsbach3MyqkPkbmdKBM66ne9vOgN7tZMRLhFV9sG
ZwHmn2xdh96pQAcTPE2ckY4LI1HDLaVpUjlMmRihyQ2BOWB1i4mADqWdZrAqBbhoFHSqZZds
yoxhkFobvtdueg9kLeRmv2+WF3OPdOWSer2EuwFGzV12bgQmwkY2ZWvVtg44SJp2HkdGBeZz
wVhurfBJ9ODtutZOxqjqTHe0yf34mrGhkwI9I2cr9l7EoFvSjRzm3kaOE9840fEVRDZVDuIE
/rM/cQyRaDOgwcoTHREMex2yAuHV3VSqTZJ0M2EUfULLiyCCYE7R3sQO5qcPA1u3ZQfmpIY0
AOQrCwUrqSBy08S1PYEDKzBlP3cg1q2HWXudNEKpLAVahoO3Wxfo6bbeE1zxLJvbW4URCLD9
SaFdHjDEqSrFiIBlSzAYESX9y0PKyNpeUepoA4YXA0kZ75qT+0apSMyBm2G3BIkUSVMMjcex
aIitnYzjbjmIOja/YVnVJb2HfnZXEwH0zhr98+r1Yoa1U3fPYL5+xfCHlSRzJgQSTJI4yn1G
VKTwQZlEg6XMOR2xDe+sF9DGxLHV1ksztFax/M5V1KQcb0gFB3pyI0AwwR1Uo0XSohpPdXIa
1lRX3znVSgnMjGysrTepxF5sSzjJhIIRo0Y0GI5GRC0KLUOuxyM1DbQdwWjCQSukGAURBENB
KrAhkyuwVrn+zlWSvO7Y640y2YM1ysV3jsLmle9MmnDleNjJLr3zvxsZ46APaoxcZipgI1WS
1XGJGYuApAmm45yuRjITxCQPxuZD8HZAwVJM3bi5DS0HqP4xmoeioq8x1DdAbt36LhptgbaK
0I9TJw77o0dYweMX9HiddHq7qbTiqCu2mKTG3ktahrIHNI91peSQhWMgf1LZIWiADD9infDp
p+bMwlKpujrQvyhtNYjKVAdq7SI3E+h6/Ot0nt0fH46fTvenB3uRXf81OGZ25VsL6DLDtn0f
gf7Bs4TZE8x8yzHSDUznsPrYhLSVW2SJqIyxyiVGSBswHJR0rjOqGhcuacrBpNiizG1DdRpV
7vU2lUkGFM22zoS6YKoptbOWu3/XVOUexIslCaecDRmjl9oHluxTlIkl9JgOsDQUkqYjQ62N
x/Xsx5yj5GNr0CYxVS0jo9NsvNV+iAxNyVFX9tVS5D1FX9UMOP7h88kqW8aaIydL2kFMprXC
2kbBd54B0BOl5a7JQAuEqxZsqpwV9WQXipWB9rEyFFpX9Ok0dDi7hcziMziWZ/dSxq7dNSGw
kpRbGMd/HXdnlW8ZjvX8S86n/3w9Pdx+mz3dHj87VXS4JDip71xmIkQvkihQu25Rho32y6l6
JC4/AO6MQWw7lc4P0uJZkXCBh0tRQk3QDtR1Hd/fpCxiBvMJZ+KCLQAHw+x0UOr7W2nHrVY8
qANs9rosClJ0jLm+D+J7Lky075Y8ub/D+iZG6BdzPdRwzj76Ajf74As9kBnGuHLSwsBsICpm
O+s8oBKlFWoyQwXzsfUsZkf3vCgwJV4XF3Pe91bsJg1a/JfEpFm9ORz6fr95/RqSq21HMNGV
NBOs3dOEmDap0pCdDBPw/GDzw1tYlxj5h/F1ZMxZszuIg9/sXSSY9RVc7+LGWsO9TaBzEst5
eP4auViuX8JeXY6x70rB3zl8t66wwKVlo0f6Qgtfcne+/+t4ti9Zh5eS5vwlE6zfyI7GXYpB
acXd19q7/WPMCROwiXfzDBYbd3xgAJhioOD1wSXF8v0oCVUZ2XuWcJHvTSCkb5zswX9Jx713
fcM0syE31eBBd+rsfAIh60EmtDQBN+0BOxjwZl9kJYlNnra9+gJTULB26vC67wtcNcEldHBo
xF6Fjm8bYIIRc0ppQHEme393jD7FSryg7lcMnIvioLyWaVmmoNE7Fo8CB2CSz35ifz+fHp7u
fgOF3Msgx5KVj8fb088z+fXLl8fzsy2OaNvvSLA0GFFM2gUACMFoUy7h5sUIeOwhBUaectbs
BakqJ/+PWFj8yI3ogHDjRA3ulm3QIZ6SSqJD1eOcqftvoqwiRLAXzOOhLTgUiqfaZgzSYkcx
l9oJqWBvRsWm7YH/v7C4D3npNVT2qnoQrt1dbFc6YC8Tr+VYVqGzAxhpV5i3gKZy6oElmMoy
7xSjOn06H2cfu6kbjWiVx+M12fCdJcoGFFVuljXcjx7i/beH/8zySj7S0E3Y9mrytsErw0ON
XZ1+Ei+O1BGNMJ6/0AZ6UbW7it5T+52Tk0ofQykBgXtXc+GFFhGpZ58Gj7rGy4qKpgszuE0Z
DT1lsimcaBECIhB5Jm58aK2UU7+AwIQUoxEVCdudZiXgm05NpH08UgrPKdLIHDRAyIbKeOSB
+25GM+NVMEqjccFkjVmPeRQTiMy3y8UzX1cg4LE/aR8X2NVpVuE1IrMypG7M8stCgeJ2vFe9
koAA0VqqEg0wtSlf2J0oDVYBaxzIZY2v6TCEro9UWWS+jLTJLbfTTU5CnRqtpwWwYv5pmAA1
6cYpbOrhwCtGRpzQKGknxgZwm+tJCM9q4e+bpmC8+HW0GIPBVNr07oGUYSW3Cd9NM9v8PX0u
uVM4Z64PFfugqlL+e9XtLscKPLfOx8Ykfi6xhTeirAOPxrZdiardDoF5blc297S59EutEYq+
Fhb3HYxZiYXpbm+7JNibqQXKoibJarnxqpx3VtyIC3WDz4j00+k29DmxzuimInbgvEfu9Czr
wrzi2JAitc3IvmUDniZJbXnD5FmNz769wB906k4XrTd8Hz2GVnbNqZ5pAWvCvOSQqhoeBWIf
+DojKF8Ga95Am2x2g/WdNPSkos16gPHtvHrXvzEnuby4bLxi2QF5sVi2yPsxctH1zYL9vojt
O0Z8oO/V1LD5ym43hC869LpHB7OVmirdYNJycnpUULWYxzyZniFhcoJpPSbUs40EiyB/mSCy
Y7QjAiwq1ST+3ECs4R/wgHXZ6ZhHVZndLFbzC40Px4IMYbGZJJ2aVCSv793vGFhJmdMvH05f
wOAKRudNItl9HmAyzy1syEeb+tfAdH6twSTMSMQcBw0jfHB/bBmm7FmWTHwjQd8RQ5C7LuC0
pwWmcill48vEL8I1UMFUEJHUha6zxVIftH+KXxn1n+gDmfMuZqhL0EXXm7LcekhwQrSVwNO6
rAOF1BLYoWO85oX8mEAj8T2MqTYJmEAJKCme3HTPrsYEW8Yq/7VWj0T/yijiCWR7AebE12Rt
hai+68Gxr4Fov+GKtQ9fHVKZo/vefsfC5zxoaRBOrMrTbp7ZTFDzPqPbpyjBTcNvbkw2dDIp
GrLZNxFM3Dyi83C6mATnFILrigAzT7eiYmCJI+IvYO0nQZ2Xl9cNeLgb1roSOu8VRONb4xBJ
u3VGUM273tHzKjOZ9ui0O4cZO59rpp35BMkELi7rcXJH19S0jyAwW2g+9NB92yTAk7Y+BgtY
nDe0U3CrJe5EBhvpId3cq3VFtyl8NzVblHaB8lRbP92rRDmy0/CoY2EiXgfbsRk38R0Bj+qf
vyHQXTkFVlWxtoIpsIVGGrC6aTc+v3Agu9IsRvEljyVoOvstdUkJPvdDSQ1cDxrVpcxDQztv
a7wOXNzwKCfQ2npQM9WJTeK9y3Ge0KmywoCiaZiRG7C2R1tY3XTXmrLfAtIMn6Zgqhl8r9hC
lPgZHp62KUurJradVIsnnjppsaslTFrvd4iDuG9G8ixDNwAbrmwFWkN11Vlif7AFeBLlN+/K
HwLNQ6hhvu1XjkSzCWHBIctWy64mI/CoBQUOtJFguEQ8a7aVgEl1+6Fe0G3rFgJjiC5YltJy
98tvx6fTh9kfpuLiy/nx412bvBxis0DWcuelnjWZeebGWl9oeOj2wkhdRxjjwG/zgH9A6fWP
n/71rx8dTuFnswyNbS84QGvKHRiEWSFn4F8BEhw0Gi1qPLbm6g9G5L7TNOxmB7dajk95baNK
v3qV+Ehz+MJXe6/YK2jFyVQcYnQ4wPqWptZ5gMnGBh1cuGV7TOGxHylo/6mtiS/kdJQ8HHdo
0XgKsC7sJRqsod03OZcStUD/5YCG5zqQGWxaF3BA4DK5yaMyC5PAIc07ui0+P57kpzQfPMnA
aLXtysitXcXn/jpxhJFRZlt23YcAIpkGgU5YcPhqAMahubp5AdWohVPe3BFgLWp4fzsKuLZL
pTKvatYha+uijFEiJsn2UditH77B0fBSHzkaPmsOIS2D/oyZNhZVJ9JfMO5fWf2XszdrkttW
2oTv51d0zMXMOTGvPxdZG2sifIEiWVVUc2uCVcXWDaMt9bE7jqRWtNrvsf/9hwS4AGAmWB5H
WFIhH2JfEolcmDELlRbV09v7Cyy/u/qv76bDlUG3CQza4aEfXUw8KrimBmW8XOjJo76NVaIx
Uya6YFD57AHEgZM0YH90ARMkl8OTRlKMHmG0W6f4LimUenokzmTT/Z9GvH/cmw9LPWF/eED3
OLO8YXcenFaJS1ViPH4xnmuWIeBnUGmEi8uV3HxozXmlkttWmfZSLjdM9bEYMMGT6BxudeVx
RhFltxO04RSVPvkiCZPKaCOEptgfV1f800n6yD4obwb9y+GIGBX41DPnn8+f/nh/guc3cFZ5
J83037VR3yf5IQPVcl0FrefxpiTxw5ZBSDtbuKONWuOCXaVdKHXZ8rBKSoPt6Ahip8b8rEEx
3U1wfGEkWiebnj1/fX37S1M2QNQgXbYQoyFFxvIzwyhjkrRCGRTZpKmLfQtQhZTS52CNFSPu
M4IfizESKIZkg/siB2JaqNo8pF3NlH5gvG6PE2kHCDKGb7WVpJqguw4bD1vDXBzzdaCsNmq1
l4H50MrKdw8ntb5RdglqPmJMvZWGeHsMpUiotexoytMjV2YJte0NYS8Y3tASBfRblCaN49rY
99NejlCWKGX1X1aL3cbo1GGTop5jJumjcdG1LBJ4l1bCMkwLwnlHxaiiT67s0TgOUVimfLbc
UKaUbfSGvOP2APa9MhU9vg/icl+Day5Utdp4YRM/HS9RAxV9ZQIq2I3xX7baw3lZFDj3+XF/
xhmgj3zqDaVn+jtBolRKgBetWK03za/KIa4qUxQkvTnhWkRR70Gkl3G47kqldPlgCh8OFQPX
m710ZeRelL2ddFGIX18EL7UXDNcpY4TjFXlph0dRwQmW0oET/ranV09KP5hxi6O36HFf1e0O
41r017EzBJGbfP78DmaeoKw42d3F/nAfW6ZfkNJGCcM6UzAa2lUbftm6UjLN/npcPsRNoTlU
mZRnolRo1H2MvVYlRuOTUp0vnYfTcZ6UAxMq3zRRzQkBKvPSyEz8bqNTOE0E/16lVQKkV6zC
VfHlsJSJi3iUainZucF8uUlEW5/zXBy/X41yM9ki3MnOIxwMxX1CmOOqbC91QlIPxdlFGytF
qPkBjuH++yQt5niXJKpqcIIRoz52hp4IE08bLYkLyz7ZzP4clfRElYiKXWcQQBWjBvJX/OoF
pYt/Hl23oAETnve65HOQE3b0X/7npz9+ffn0P83cs2jNUTdzYmQ35ly5bLrpDyzWAW8VgJTb
OQ7PYBEhxYDWb1xDu3GO7QYZXLMOWVJuaGqS4s4bJdGa0DqJJ/WkS0Rau6mwgZHkPBLMtmQO
68cyNhe9IKtp6GhHz/DKFxJimUggvY5VNePjpk2vc+VJmDiVQhpSlak7IzFA8lUIFxmVYtZR
n4HPBXgqsU9Fbdso6xKc7nOeHB713uy/FoynlECLszcr8SNdQO1nmCFpWGjGtalKomM8giaC
jPD17RkOSnFFen9+m4QhmBQyHrF6/TsidF+Sy8dDnG+ZQuVl9kZsWuAb0hRZ8APWe+AyMc8l
yzRunyJVOuhVhi/aGukIIk/BPOEFaxm2JD9koEB8hnFDBgg093QjeYM49clnkGEGifU0X5Nh
qs1D5Zqgal0rbe82CnV+QafwsCYo4iQSF7+YbAwDSxZ8wzNwh/qGVpyW/nIelVT4BmKAxJzY
JwW4lJ3H8vyWLi7LW5rAGeHE3URR7JYx/K4+q/uVhI95zmpj/YjfEGdBrGVbv1MQp9v/ZNk2
CtOrxDRSavPj7tPr119fvj1/vvv6CvJBQ8qqf+xYejoK2m4jjfLen95+e36ni6lZdQS2DmJd
zLSnx0rTBPDG99WdZ38uzLei/wBpjPODiNOH1wR8Io/HKfRv1QIurtJv7M1fpCjniCKL41w3
06fzCFWT25mNSMvY7b2ZH+ZPLh19y5k44sGjI2W5geJjpUx0Y69q63qmV0Q1bq4EaH81t892
wXhlxEMeARecPDyVl+Ri//r0/ul33ZGCtaPU4LQxiirJ+1ItV7B9iV8pEKh6jLoZnZ55fcta
6eCChRG8we3wPN8/1vQVGfuAZo+pDyAG09/54JY1OqJ7Zs6Za0ne5W0oMDE3Y+PL3xrN23Zg
hY1DXOMUgxK3TQQK6rx/azyU152b0TdPDMcdGEVXoIB+Kzz1Kc4Gwcb5kQizgKH/Tt9RN1EU
essR2mHltbqobq5HfrjhOjagrZuTEwqPnreCy/sadtJb4Q/noib4/in45hOwg8csxd14o+Dw
b2ypcNO5GQvRqW7PGbxP/B2wlGLd/kFFqWsg6FtP4w4t2L1bseelb0J783CXlMIQCnOiSwXp
YlRZaTuU//cG4ccBBJIVk0KklSUhUKMoKdRtSvE6TkgECioOOsghLAm7SexqNiZWMTwGWumi
EwQpKYfrlt49+aHnegjZpgahjicdU5VTkRMKrGtM008hOmmX1YKBk4U2TpvRkfljPuEyDZxx
jTU+xZleA+K4A1iVJNntvhPyY0qX0/GAxJXegLpHpeeNa0qGKqcNuzqoPA7PoBvmgIhZisl7
e20fx3rrFuR/b1xLEl96uLzcWHokpFt6G3xtjctoM5EYmolJuaEX1+aG1aVh4nOywfcCAwZ7
0jwKbkLzKIJ3MzDQYKW6M4/NbmjmzA6hI6lNXcPwylkkKtkwIdPNZjOz22xu3W421ErfuFfd
hlp2JsLayfRqUVuZjslLXAHZvRrR83FjnY/DHa17ikDb2b9SHNp473gt2s+cKOTlDfgCijOr
IkKFV9xRUAKrcebRvnZ0ybwux6E5iu1x/JXpP1Qf2L/b5JiJyudFURoGKB31krK8m7ZT+xT5
TMuZqSIBCeZtGZLAG6vYunfLpUexagMMfB/dBIK3VrDFmAUf+dWhINCjxN+zmPgWUFaTl60B
c8+xCKw6ogjjtLAlhQP1IZyvhxi73XJBPEloOP6Bed5iPYsTywyMPpB6y2kSLHxPcwE1prXH
S6W9z2iETBGG0iLBYcQYJ5Omod4T4qdPrB2W4p3f+HgDU1buUUJ5Kiir701aXEtG8EJxHEPj
1gSvDRu5HVZxbH+IRZSKcjB04QVECDfeXsVOwaQWOJpZIdbGRcx8cXah9Ivib8h7lnzoJJU0
spLQTMllIEO8yBPHZo/sE1lP5b7NyCpdwgkDlzjrkbTDPFS1dqLCr5ZnkZVSn3N7IeUhRx3J
6jE/q4MMsKvr5TYlFvJSvr5XSYE2WsOoVxjivaGtIHorf2zNuHj7B/2HHRtOqguBiYkKRW8q
pt29P/94t8yfZFXvayuusbneq6JssyJPrLhhw7E9yd4i6Apx2uCzTHAJCeYCM2S5Zj3PwHDp
aibsw8xMOF4Ni3qR8sHbmXEPVLPFOo2e//vlE+rgDb67hMRSlsTGReVpiMc4EDSYy0aNQ5aG
YLoIGkBGfFs4YtO4UZ1g5H+sXKXfXxjYKYNLlgPhgVKgGojT5mwFRO5yUMPtFo86ANREev3K
HeVnztzLmN0jLdCnQsgqa3KIFFWo3V9wki2IGAmSXhxsZ/vDJOGl2A9632CTSXJKlp7X0I0M
S39t03vZ0jTzodAz3zsKDcDaSUKIYuOMu+k8Ajp+VsoJ5v6+m2EuSBbumRMgR9gFOE/mh9Zx
VgeZXyqrKhXsF5cHIKt/2Eq1G80eojzGkXm6ig35AC9e+FVBfJHHGD8uKKckKvWpCUnEjQPe
n/FM0tiMriySMKcZOh3RQFe+xr/88fz++vr++91n1RcT16r7WvluNLtE33OhO2qTLnhQ4/cp
TPa1GDC76V2y8qmtzKeJfuuRe1PzWSdZzDWCqOoU+5jjR48in1lV222BNHBxafiU1Uin1bQY
SciL+wTnzjXQPiSe1TQMq09LurUSkiJtlYTlNamIy/AIkmPuLgAdCkmpULGqBoD5gX/KjpsG
30w1UFZdcJlRN6Jh5i+Wrlz2pTgNnIADtS8p+kX8T5FdtZuMm/FhfW9PRYsMrUd3M3Idaxeg
g2AjK0qycGjvQ8wxKsyV1PCtEx6OcIvxDLY5lUnSjyeYq+E7evchbMviAgueM6+sysWpi1rG
9OjOI6MMuwG2BPEx2k9rI80We88GAJHOhBBcr+BtcesjmTTV6SFhFTEtquo0j2vcYDfVjIV9
x1kpymGB7n+jJ1QhWG7xutJvGjp1MPK6BfXL//z68u3H+9vzl/b3d02lfYBmsXk9s+n2yTMQ
kG5Dc+e94RD15mfmKJ3muyrEayZVC2SsIhmaaTHmdU1EKnaTO9wnqXZgqd9948zEJC/Pxih3
6ccSPTPgkrQrzUvYrhwNn43blCA0jsvWrnSZlbEEfy0P4xK0BfDNKz/gy7/kTNzaybdSwcvj
NEyjvSNF4P3OjJ4pbruiekZ8dXmpjC8gUNDMIGGSgA2cZjPGkrS4GE6F61MtIL04whJAxuN1
WPI5k3tev++BT/Zsr0kqlZtcdtpbORr27PaPaUwOLbG3wDOJnaW0kRjDlrI/G0usd4oK3wAE
6erR8+Y4oCoJMcw0IG0cVpjNoPyc6+E++hQsVvlAc0dWMGGwg94EHsMWEBWFGFN2ddqIOOjU
B4QcXRL3V7wc06dmlyB9NQ3e2zUanFn33KqWy2FpmEjtkLQI+0A6wBSTWHC2TRLF3LfpGpXV
1jyNQ2aOdC/jj7OzOUHbpLjYbSornBOSNIbLtIBme0gb5zma2LtyRheGcta6x0dVB4Ylwbfp
IH4yJ49yuyE+/PT67f3t9cuX57fpPUlWg1XRhVX3k9moJC1tfsUZQ/j2UIs/8YCPQLbCOMtc
pfzDGB7lc9SKozIQxn0Iqx1RsBW9eUiaLIfYjhw+pskAHLCKUeI0I4iqPWmtSpyuQtm0LlC1
2C0yB3Uy0WMkGreRrPzEfrU6rA+iQW1IWbFPLnFibe5DPPSv/Zn04+W3b1dwaQ6TSyoaja79
jc3sauUUXXsHttaud5VdLYnkTEuyBlM5ABLwzHVhj3efajnNVYt4GqZddnsyGdQugroxpH00
FCv9Pqms/TSWObYqmrzRGukYn97NVbyQHf7kIhF9MHMawaxV2925XOOn5HVPn5+/fZLUZ23v
+HH3YxrAQRYUsigW5xw1hr3kajbbwXEPvmcN+1n87fP315dvdkXAX7F0jIkWb3w4ZPXjPy/v
n37Hd0jz4Lp2Lzp1HJL507npmYntDxcuV6xMrIv06PD25VPHBt4V0xh7Z+Vebqp83HO18aXO
St1Ark8Ri/5s+E+pwX4sNRdTpbIfQiLsz0ka9TzqEODgy6sYYS2Yw+E6CakxJElmORIZ6c5w
GnHDGkMyjHHuxq+0wKZYphoZ4mPL+Hr6whuRmKezETR63bCDOHRtHMQMykfjRXen07Po0k8a
TrNSx9dSJf6Vcdvw59RePlwRCh8KAPKMLhvBnWUFwaxKGOOPediDpYdhpE8gJvHpsYToOFz3
Ldo76ZC+QQXfJ7/HyZdzKn6wvTi060R358PFWbrXfQxX8dFwvKF+t4kfTtJ4mmTw7Vc7Xfel
O6Rl00TTD31fUvUw/RqCw4NUaSwLfCTLyMtyHh/MmwwQD3JXlC6WkT7tO0c5RS3KIi2Oj/qk
I5a9EoD/8aMTmeky7y7G1jEB2XRlnDlZ0dSoIsIYcT4tDR4Lwrlc4wSTrskgR/E+0WLS8wRu
4hCN0RjLLgxZFPuT9EbcHLhRx+4OK37l1O1PQY5oMI7+RITZWsdWRS5xIxd8FztB2z142mb9
DBwFk1r/akIKVTP7Ebkf0BzdT7La9P1YR3LhTR81Rn9135/eflhnEHzGqq30dEfIqwRC8xKI
uhkFTHFQZLtS7MBnchczHbyZYKiJy72+CbIN5x8QpkyZpN4xAa3fnr79+CKV4u7Sp79Mx3mi
pH16LzY5bfhUYmFt54Ribk4REpJSHSIyO84PEX4r5xn5kezpoqQ703bSZBAHf4bgBo3ZFm2y
TyuW/VwV2c+HL08/BMvx+8v36eVOTolDYo/0hziKQ2qrB4DYmlprK++yAt0c6fPD8IHbE/MC
WmUXB5S9YBoewWuRq9UATG8FHuMii+sKU/EECOzZe5bft9ckqk+tZ1bWovpO6mra0MRD0ny7
4QWq3jjg4alK8DxIH2cRr6NpuuDN2DS1iztprlSGyxQkraBpbM8ntjvd0nbMN+Uf8On7dy3I
JTgPVKinT2ITnexlwICJ1kNfl8RTilwIp0eeTadUl9y5VnR/q8IBo5+D11wmug9nj3TkMc6S
HBfBAEyFCbyAS3b8bJB5ievRZGB6110zvSe7jz9/+ddPcLl4kjb+Is/p87dZYhau1x7RPRGr
2SFl/GT3zkBor1VSSw/4lJ29CS8IhWG5psJT6S/v/TV2h5f7Ia/99WQi89Q1lcuTiyr+d5Hl
ceJDJ9pba/Ty498/Fd9+CmEAaFUr2fgiPC7REZ0fLL31OZPO4E0/hXIPyeOcoeoFw2dxGML1
9MSyTg3LyACBQLRIIkNwY5WrWLhkLntT/VKdRk//+Vkc+U/i0vvlTlb4X2qfGO/55rEkM4xi
CIWClqVIrSX3JFBRjeYRsgN1wkl6xqpLnE7mnKQBLz3X8cA6JocQ/T5rcJZhAEgO2A0B1ny9
WLmq0EmnkPIJlW2tgslMDSWvPZMJKcUaIPaL4xTRS1ndqE7INJl52cuPT/aqlB/AHzyZyVVc
wApcs3ecYwm/L3KQqtK8HASwsyaLrFNaRlF197/U3/5dGWZ3X5WTRmLHVh9g+8l8Vv/DrpF+
U9cSpc7BSvre6mKD9ewshJbrZHkPZxZx8+UCyEqcSTzHQhnnPT2ppQRBXLQwAVWtXe7NA1vc
V8TNriZiKwmqOHzq2ogmIxKV21CUdF/sPxgJ0WPOssSogHRkYeiPiDRDLiB+57pDSfE7i3Rh
QnGQYWDFFgPrJLMJoPxupME7ccoezRKsqIjiXmAbsvcU3R+ldEbZKSJI3YXBwWf59vr++un1
i/4ClJdmuNHOK71ebu+oPj+nKfxAh7gHgUyYc9iCknLpU2pRHfiMxyXvyam4Q01qJlOla2AZ
T+OXYJqtCh8GOGfpUbVHNff65u4Nhdw+md+73fnzJnDSKa4kjCCscXlfh9GFCLVZMzlPQI0A
qXcT593VWTkCjs2DXCODZBTXWlQ6H12EuGnV9+6mV9wcb6W8f8ni6RMRpCqW5+uk3wXJ0NMC
qHLjwCjfEwA5XTPiOJJkYtuSNNJRoSRKoz90WzbaNhxImmxuHLto7a+bNioLXLQVnbPsEfYY
/EXnxPKauLnVySGTPYkLPUK+W/p8tcAN1cRunxb8DJpqKvg5LrI4lW2S4ge5lAaGRZKDkgyN
AOfopB5fGfFdsPAZ5RyWp/5uQVh+KaKPK8mL+ywXh1xbC9B67cbsTx5lGdBDZEV3hA7mKQs3
yzWumx5xbxPgJDijRL8L9rpcduJJTARf6Y/AgzgT9HEOBtOvv4TREcq7p30eHez3rD6bS8ly
gkUMffsUUtER4hKECz/sla7Sxebla54VxsS1vtS75GnMURuRsWYTbHETuA6yW4YNbsU+AJpm
5UQkUd0Gu1MZc3zIO1gce4vFCt0grE7ROnG/9RaTZdtFSf/z6cddAjqPf4Af7x93P35/ehO3
yHeQm0I+d1/ErfLus9hqXr7DP/WNpgZJEVqX/4d8p0sgTfgSHmPwhay0HXjNymkIGAhU/+VO
cFqCjX17/vL0LkpG3pQv4nC3uMTRvtqRxZjDMc6vD/huGIcn4joCrntZKsbDvnSakKrmzQ0I
Sg/7xPYsZy3Dvz+DcR4uINJPFSUNAnu/TqQwWXIy9FFWaELEiiVRC9yw9loGKI39h28ik+GU
aVLdBbHCkDXoir57/+v7890/xMz593/dvT99f/6vuzD6Scz8f2rvUz1/ZHAl4alSqXTkIknG
BWvD14S+aU8mTEZl+8S/4dmbePmQkLQ4HindXwngYL4j31Lxbqr7FWbwBOpTCA4OA0Pnfgjn
EIn8cwIyyoG483IC/DVJT5O9+AshCI4TSZXqSdx8vFbEqsRq2svErJ74H2YXX1PQsDfeICWF
4s0UVT5JiWOQUONWI9wc90uFd4NWc6B93vgOzD72HcRuKi+vbSP+k0uSLulUEpb5kiry2DXE
3aoHiJGi6YxUQ1FkFrqrx5Jw66wAAHYzgN2qwRT4VPsTNdms6dcndxqXZpbZxdnm7HLOHGMr
3YGLmeRAwAs7vhFJeiyK94kXAMHRyD04j6+UrfKAIUOuD4hpx2RlvYTUr3aqD70lDQ2O8S+e
H2BfGXSr01QOjq0vY1VdPmCCWkk/H/gpjCZjpZIJCa+BGLUwJzmIO3PO3RLEARpdQ7GVoGAb
KsWqX5E8HCqUA6ZTIpx+LBizD1vfIwJw9Kg9cZR1m4K4nOO7oRqsxwrnO3oqEVMlzruDphMb
OEabuhR07EOz9Hae4/uDUjsnWSgJOkbENV+ddcSzuiLm8HDupDOPsKhWDaxjx6bFH7P1MgzE
7o1f5roKOvaIB8FLJGErFpqjEg8pmzuJonC5W//p2KugorstrkIqEddo6+0cbaXV/hVbmM0c
EWUWLAipg6QrUZOjfGsO6FyExfgO2kzS5gXEZFPdbZOVAYylGAxJypcBN76CF9B9ATGlq0qX
qQNJxnA1k2yNf1nUx7KIMHGbJJaSk+qiS4yKsf95ef9d4L/9xA+Hu29P7y///Tyajmu8viz0
pBsgyCRQ507jNpWmK2kSPo4BbYdP0M1VEkinRZKaZNi5LUlhfGGT3HAjZ0W6iGk2+YB+HpPk
yduUTrR0/2XaQ1ElD5NRUUXFgmMldAAkSmwZobfxiZWihlwwUzI3aoh5kvorc56IUe1HHQb4
kz3yn/748f769U7cyIxRHyU0kbgVSCpVrQdO6aqpOjXY2yJQ9pm6B6rKiRS8hhJmyDhhMieJ
o6fEIUwTM9zvj6TlDhpIWPCgepLcGZxYjU8IbS9FJE4YSbzgvuck8ZwSW7bcRwgr+o5Yx5xP
hUHl7d0vdzBG1EARM3y/VsSqJngLRa7FyDrpZbDZ4mMvAWEWbVYu+iMdfVoC4gMj7B3kbi5Y
2Q0uzRvoruoBvfEJo4wBgMugJd3aFC1iHfie62OgO77/kCVhRZmMyMWjtBloQB7XpIReAZL8
A7P9CRsAHmxXHi5zlYAijcjlrwCCf6W2LHVsR6G/8F3DBNueKIcGgE8m6hanAIQ6pyRSkiJF
hOfcCmJPObIXO8uG4O1K1+ai+I+Cn5K9o4PqKgHfSjSA2mQk8Zrk+wJRVCiT4qfXb1/+sjea
ye4i1/CC5N7VTHTPATWLHB0EkwTZywm2Tn1yQDkZNdwfbRdKhlXNv56+fPn16dO/736++/L8
29MnVDej7Bk7nCURxE6dn24VfafXpLS9iCgzHp6zqAW1bmLzyyIpScI7tCPiXHhPdH66WuN7
ahbNPMkKgLS5JgLNT4LYWl0QZdLOqNZN6kaa3j1R5riqCOI5l4FNKBeFmdIWoIg8ZyU/UY+2
WVufEqktfRHX/iKnhMRQChm1VxClqqUTERPKWJAz2GshXSlIWSLvLGZvgS9msJXiJbOfG0aQ
fbcbKR/jqrBydM8EOUApwycCEM+E8B8GT9qeUdRDyqxorzoVNFeJ6QcDS3uS7PpIDgphaJVJ
pd8jWcAQdYp4lj+cYbpMdiXwtnnnLXeru38cXt6er+L/f2KPZIekikmHSD0RFPKt2vXvaK5i
Bg0NGccPVAI0PbJEu2bmXQMNTRFxvJCLAFQcUArU9nimJNLxw1lwtR8dIX8p1Q4ZZIlhsr6M
heC31fBqc6mZ4eYsKQGC5nxpKAocBITB3Z5V8TnCWegjpTzNQk480QNDV+S8QB2ugYfQ0TuI
2S5Bay9y8KqCc9xh2yWuT5rvW6UVlJsBoPOU0rdhle33ttesfn97+fUPeLblyliWvX36/eX9
+dP7H2+oHvt+7fb3uw/FSj7gTGuPIfXABgDL6+ThBrfKWb1dL/HjcoBcgiDeLDYzKODmpan+
Pf+4W223t6OD7c7t2ljVoEGfVgYMD8P2EKdJgzlkvsGx9S0+lh9CFrg9R4PvkDq+bznxLjOU
Jurbu38mlQ9QcEa5JuvR3b27vfBwu2yalhNMHoXHHx96Y/sbJ/ygFVOfwBmYbhQESqVf9eET
52FUVO3SUv2+FBUlua4fy1NRYH5dtfxYxErBghiSOJUE6hzVwTpskAyOsXkUxLW39KhJ2H+U
slCyPoYZCgeLVNSa0vg0FdeZ3LS75ed8lbSxFUoK+7iOpbeRsbFhTD1tdFotNSpi0jPN2Ecz
0zhnw5jOfWs8kYmfged5tqLneKWA/dW8q49fts1Rt92DUnqZqDGdlUeUC5aLXjNx+ort0RTq
PtTJ7ISqjMkEYzI4KJn5EnqsMCxUWZ1SDtJTfKMCAjZekG74Xmfp3Bw9CxbabL5MafN9EKCu
b7SP91XBImup7leY4FWcZDAeht8WUDdAWxdSc7VOjkW+xLIXWTWari38bHmlXCP1iUcxSNZP
/P1VmliTQdVE5jPTXXRLaEW+3eeYRF/7prNN0PZGFu7NX9K24XSVUZoNuxig4U/NRgGX5KyJ
FnoHPKKv29IwStApFyxytg7YHxs8z0oSxjGVxbdUXOM0eTjb/kEmRLw2ehtPccpNp35dUlvj
C2kg44zYQMZfGkfybM0SHhbm5pnM7OLi8lEnubE0laUmuumO95DZ3TgyD0J5jzinc/tW1Ln0
GwtKfZz/EcdURPiG0/IDR2axMUX2sT9b9/hj5xlq7EiZ0uYl6Hnk4pyGoKdtPJvToYpjcPen
LblDrO0PYAB3EDmOKVHJGDyTslpMZLZYL5bBWq8JfFE+0EwZ0Bu565CQY8Jy6x1A+1hVoD6Z
lYRUn0oW6w0kKOG9SYTuCZEkscKwVNP4Z0xHctd6+FgUx9TYBY+XmUkxOOwYMzwlzfoU+W23
ew95SV2pg80MaeRysSJMSU45t5p00i3+gSyY4YOZEhucq0hZmr/aU5gejdaOqejuIMlmrnpP
nNk1Np3rJbNbRhL466ZB81MOw/V1gzu2g+TFmIP8qS2R5Lg3fiizFCPpYhwmiWDX0AECAmHU
AZQL7ko1WS2IjwSB+oaQAx4yb4HvYMkRn1Qfspn5O1rd9mfzxZxoGYgmdEcHl7I0fCuUDfM2
Acka8/sj+hR8/2jkAr8dcuMihAtC3fgtw7tsBNDBrIc202pjBioVt9ZCm5xZ2ogFqgupIME0
mpJJsh3WdwADaZTplyJt1rRQUlD51Uk+YG5G9TYkYWUuonseBCuciQXSGmc6FEmUiL9Xghgk
WE0U8fH6FJPzMA/94AMhoRHExl8JKk4WI7RdLWduDLJUHusOp6TARYXA6iTPxgvPhNr9minn
sTLN58Vvb0HEjDvELEX9ZWoZ5qzuqj1OY5WET3EeLAN/5gYk/hmLa4ZxL+Y+cbpfGnTxmtlV
RV6YznPzwwxrlpttkkpCf48ZCpa7hckT+vfz8y+/CK7cYFClxliEn7rah8W9UWOBL2ZOtpLJ
6J5xfkzy2HTGzAQLcMKH8DEGR3WHZOYyX8Y5Z+JfxrlVzJ62StlR/+ghZUtKb/whJa+1Ik9Q
UqXIDzEVg6qvyBlsezLjEvsQsq04ukmJX0+3wxcMZLD8ApZLW8hVNjuRqsjokGqzWM2soE5K
qn8VeMsdYRYBpLrAl1cVeJvdXGF5rLTLx9V6IrjEil00XkfPBCKxGYI5leIumrNMXIwMa0YO
jA5Ruv5lHD+gFeFFyqqD+N/YLigPBiIdHEeGc6ItwYEzcz8Ld/5iibnaMb4yezXhO0oROeHe
bmZSgJRb0/jMwp1nXBXjMglx/hW+3HkmWqat5rZyXoTglEx3WsXFXsp0VwaQID7h+kVRz6KW
h6OGrzO476nnprE+KrUPEIQaNSnIIJ7SX6SvQAGF/4eCE7NHYXrn0l/N5KR8CBabZpqng5Pr
AbzI7ezUVlGfRG1s0uDJ2UoXXX0oj2ySDHqxSGKQIL03ezrxc26eE2X5mMW24+A+U7E0Y8Jz
AUQBJPxj5QkWCkOvxGNelPzRWBswdE16nBXj1/HpXBsHpUqZ+Urjy+qkjdglyUETOTLlYjU4
Xhf8cHl6hImISfmS9n7ZsmyzVsj8zI1m1CkaTU+rysVkDsTPthK3WJyDAyrEoAnx0MZattfk
o/VWq1La65oyfhgAyzmRtrId1zPvrMlZM316sTFpKoaIwhyiiPBzn5TkIQ1m2iUdPJbvbfWv
nlkGcalScDCf20zPoSolzGw/8UP6OU8UE2AQknrP9KCIfcZtdm7wVKOQkaXXEUT4FgMjN6D2
6PnMrlIPyBJxwSOq1mnypHGju1iWiEE6btaNdvAE1BkRlMSozRYXH0uAvB1lCeXMSUIulMW1
JKvLOk2Xz4ZUz3Yie6s7LCsDlVaG2gYv9g0rQgwkaAwTv4oUvUPTOAIFz+MRfDGfjDWufIsk
yR2k027/+AFnClkEWmonXPsGngwtWk/p3v5aq6KsCYLtbrMnPhMzGYxD5Vf6a1aYBVuVjD8b
iQUQPh7FLkrnq+K9qo7Us+6e2Vx5B6sg8EhAmITg1Z8kq6cGkg6HiKv8qISrsu+k12Hg0RWU
OawCN32znaHviK49JE0c2cOchGU6HYyRLN1eNlf2SEJSsIqtvYXnhTSmqYlKdbLCbh5Zid7i
aBHUztfYeCmS6pqmpSmFGmuKjoR6MhI6BEQidm/lDB7FWUo2NG9EtqA3M10D/bqqg8WysTN+
6EvDrmCdBo3Vju4WR33UxwmxCpKaM1TteR17C8IABPQjxMJMQqrEXmvGKrBjCo5iY/Mr+BPf
otUI3vNgt1tT1gMlYRaLv9pBXE2p0SMd3xtMG5BCVuMHFhDv2RW/UgCxjI+M6y7puwiegbde
YIm+mQjixaBpzETxv9ILsCoPu7C3bSjCrvW2AZtSwyiUz6P6fNFobYy6ZNMReZhhH6sHmR5B
9l+fS7ZHvcsPQ5PtNgsPK4dXuy3K0mmAYLGYthzm93Ztd29P2SnKpLhjuvEXmG5CD8hhhwuQ
8mD33E+Ts5Bvg+UCK6vKo4RPgqggncfPey6lfRB0Cx3jDmKXAg5Ts/WGsPORiNzfopIAGck2
Tu91lXz5QZWJZXxu7FUUl2JD9oMAd4cnl1Lo44KOvh0f2bmSq2k6g5rAX3oL8hmox92zNCNM
YnrIg9hdr1dCnxdAJ46zuH0G4iBcew3+kgGYpDy5qskTeDJvKXUFgFxS6kFi6I/Tzp+BsIfQ
8zAh1TXVH/Hh16gVmFmSR5ES+GQumgqXqb51cry1Ceoaf2WUFNLaSFB35He7+/ZEbOIhq9Kd
R7h6E59u7nEJCKvWax/XgrkmYpMgDGlEjtQr6jXMlxtUUdfszMx8U5MJRFnbTbheTBxQIbni
mml480S6wyWbDDxCXfGAeMAFOXpteu0fhDR5l0/Kq0+JMYBGrYPkmq52G1xnWdCWuxVJuyYH
7H5oV7PipjN+2MiJQAbiAM4I45JyverC4eHkKuHZGlMh1KuDeLcWd6a4qglfLj1RGjRBFCac
FYOOINSMs2saYIJRo1ad/NQQI4g5u/DOeJ6C9ufCRaOc9wua76LReS6W9HfeGnue1FtYMVsL
rKr9BmVXjM+mbzySQSQsSRVti2QqKLDBRcahKeE7n9Dy6KjcSSXCYwN16y+Zk0posahGBLGz
XAdVnEOOcqG9+CADtWkaing1GRZssEwPP+Jnu0M13fWPzMCH4dXzZyeFKdq+pp5PqEsAiThG
POM6cU077RHtU6koYj2CWkTDCOEKl7b74eFFRoDAd+6PjxGb3K0+RqLleDOA5HkVpmOiZyuF
UnFuKn4+1Pmhe/Qglu8QtvxK+YU3ufArafyVVHVrnwjKBeq3p1+/PN9dXyCE9z/y5/f/vL79
GwJ7vKroXf+8e38V6Oe79997FCLEu6KvBvL9W5rkkd6dOzLi3Xmse9aA5QBKO5w/JDU/t8Sx
pHLn6KUNek2Ldj0enTxCX0AuBtshfral5Ve8cxn6/Y930stlH+Vc/2nFQ1dphwO4YE9j83VG
0coiTUWzCAEXIHjJKh7fZwwTJChIxuoqae5VqJoh5tWXp2+fR98txhB3nxVnHrsL/1A8WgCD
HF8sV+19ssVra71JBRVXX97Hj/tCHB9jF/YpgvM3VB209HK9Ji55FgjTPRgh9f3emNID5UHc
rwnnzQaGYOk1jO8Ral8DRipxt1FSbQKcGxyQ6f096j5+AMDTCNoeIMiJR9ikD8A6ZJuVhxvg
66Bg5c30v5qhMw3KgiVxvzEwyxmM2Na2y/VuBhTiu8wIKCtxGrj6l+cX3pbXSiSgExP3UqWT
Wx621Nd5fK0JDnzsejJGygApyjiHQ3SmtZ3uywyoLq7sShjSj6hzfk/46dcxq6RNK0b4Qhmr
L/Y0/Glu7ITMb+viHJ4oU/wB2dQzKwYk661pezHSWAmSc3cJ+xA7nbTdVnsDgJ9tyX0kqWVp
ybH0/WOEJYOam/i7LDEif8xZCbJxJ7HlmfnuPEA6v0gYCYKL3ktX78aFaqDHYNkcE14OtErE
cMVOiDfasTQ5yAkacG0AHYoQbjLhCW1t1gfaNEg8rhJC60QBWFmmsSzeARJjv6YcHipE+MgI
TQFFh+4izYsV5MLFzYG5MqEfxFVbhwF3FzTiqJftgUHgAkZo6UtIDTJibNQ6MvQrD6s41l0G
jIng3aSMqy5s75C3jmAR3waEK30Ttw0IW/cJDD8/TBhhA6ljKk8w/XZfY0CQqbVZYwjMUUBb
L29owlmc8EkTJrjTCh26P/vegvANNsH5890CL3sQ9z4J82BJ8AUUfk2Y9Bv4xyCss6NHiDtN
aF3zkrYomGJXt4EhZpOYlrO4E8tKfqIcpejIOK5xKbMBOrKUEUb2E5hrWzPQTbhcECJLHddd
z2Zxx6KICFbP6JokimPiOVeDicu+mHbz2UnNpVkU3/DH7Qa//RttOOcfbxiz+/rge/78aoyp
q7wJmp9PVwZKHlfSse0US+3yOlIwzJ4X3JClYJrXt0yVLOOeh5+EBixOD+D8OyFYPANLH7/G
NMiazTltaz7f6iSPG+KoNAq+33r4Y6VxRsV5BtHA5kc5qttDvW4W86dVxXi5j6vqsUzaA+70
U4fLf1fJ8TRfCfnvazI/J288Qq5RLTWrbplsUr+hyMqCJ/X8EpP/TmrKd6UB5aHc8uaHVCD9
ScAcEjd/Iinc/DZQZS0R5cPYo5I0Zvj9yYTRLJyBqz2feG03YdnhlsrZmooEqlrN7xICdWBh
vCQtYAxwE2zWNwxZyTfrBeHAUwd+jOuNT0gbDJw0mJof2uKUdRzSfJ7JA1+j4vLuopjwcCpT
E0ypR7iv7QCSQRTXVHqnVMB9xjxCnNWJ75bNQjSmpuQPXTV51l6SfcUsL88GqMyC3crrpSR/
TYigptlnYvg+U0VkLFg5q3osffwy1JNBt1jwGYTzNg0VxWERzcNkZZ2jkLRVnBV1jK+5QczJ
S3HZU0gXsKk/4Cx3Lz6+xlXGnHk8xvJN0IEIM2/hKgW846UwRGCjURMX9a79TekvGnEeuso7
y79czQoPwZq4S3eIazY/sACaG7DqPlisuwk6N/hVUbPqEWx0Z6YKi5p06VytSQYxZHBuuh8U
ZvPlBh1eXO73EfUg0z0eFGG3ksVVtCJEdwoaVRd/I4ZODTERCXFEbtY3I7cY0sBJPX05l9U2
MWRTZcn0SiZfE05Pb5//8/T2fJf8XNz1oa26ryQbYGiWQgL8ScSvVXSW7dm9aX6sCGUI4jXy
uzTZKzme9VnFCFftqjTl1svK2C6Z+2AS4cqmCmfyYOXeDVDSWDdGvRkQkDPNdx1ZFk8dNXX+
6bAxHGPtIW9v6g3r96e3p0/vz29anNP+lK21Q+aiPc6FylMlSCxznkpNaa4jewCW1vJUbDQj
5XRF0WNyu0+kF1JNTTFPml3QlvWjVqpSaSITu/DC3sYcCpa2uYoYF1EOS/PiY0GZzLdHToRx
rQQvJrhK4qCQsZdr1PArjWTwwjNEPGaafFrsTCrytIrj8Pz28vRFe2822yQjZoe6o5KOEPjr
BZoo8i+rOBRnXyR9dhsjquNUcGq7EyXJ26zXC9ZemEgiI/Bp+ANoWaHhlzTQZHIYlc4YUUsj
gopGiBtW4ZS8ksbh/JcVRq3E7Emy2AWJGzg14ojqnozlYiqK1TvfM+KuGouBuBDW6jqUn1gV
d+HM0byiuI7DmgxGbDSSY5rRRmZX0+hJI+3DzA+Wa6abxBmjzVNiEK9U1avaDwI0qJwGKtRD
PUGBVVaAQcyZAGX1Zr3d4jSx0ZSnJCYmjHwvnJBM7/UqZvbrt5/gC9ECuWpljE3ED3SXAxyc
Io+Fh3ErNsabVGAkaWvHLqPfIEDduwWLFEJLvYMrQ2i7JGWjQy3Q0QEAmq5WUrty0ycrradS
peKDIlPbOjzTFEdnZaxZkmHGdIhjqibZdFnAmzVdKrQ/taQ6Vl+cWo7scyp53M+8AAeQA6fI
5BnS0bG9t3MgPk10tPMDR8P3df3Ks+m04xlZd2lBfIzzaa8MFEdVeHJICHffPSIMc8JsakB4
m4RvqWCZ3RpV3OqHmh3tLZ6AzsGSQ7NpNo4do7POKrnMatI9JtnRR4JDdtWjKinOXhDBk15a
ouWPJHJsJSTJIWIKncVId7QhBL8XgkVpo+SYhILRIgJrdSNaVmi0t242QsgzvE8ViWpOcZ2e
hyLNqHYfJc/k9uxiwrpKe/0kkyQVCM9TTg7S5VfidASORGPHL2FnR2emKQZDS2j0B+YuAb06
yxxD7MW2c0Q/6aCkzBJxyc2jVNq16akR/C9lSxYcztxeeXW8NksKA/esk8gTRq7ScYBS+gch
qlUoN/xxqCSxVeA3daBeWR2eogJXAFKVgtt5cSDz2E/qhNRd3JEq8ONk2O8NiRD+EC6SGWoB
OMI6vm1s80iSz4BtlR993QBvpEvWCy17Gg5yApGhVZFMpfTi4mMkZaaPECxHLSOh83OAfVLf
Y8lx85jrjl20xpZ1bChbgx4LmImjY1ixa7eOkE6oQ/F/aWjNyiQimFRHoyX7HT3xw6k1EYIB
k5Dc8piu0/PzpaCk1YCjLZaA2udOAhoiYjLQQiLkLdAuNUS/rIqGCNIiIAeA1ISVwdCN9XL5
sfRX9IOPDcT16cUK7fbO4UtxiqaPYsNF5TNTSYs+XdSSrc68llHQ4fJvzh2l9SuqPFWd9jVX
JhDYSo5iIe7zx8RwVipSpWadGKLCTIY3RFZbaeJmqRSStUTl8UQ5sPjjy/vL9y/Pf4oWQb3C
31++Y9caOS2rvRJ6iUzTNM4Jt4ZdCbTa1QgQfzoRaR2ulsS7cI8pQ7ZbrzC1VBPxp3Go9KQk
hyPUWYAYAZIexbfmkqVNWNpR8rpJ5RwEvTWnOC3jSgqWzBFl6bHYJ3U/qpDJIEnc//FDG1EV
XS684xmk//76410LL4fZPqjsE2+9JGzxevoGf+Yb6ESkRknPoi0R1awjB5adrE1vs5J4XYJu
U+6YSXpCaXpIIhWAEIgQWI94k4E9WL6U0uUqX5RiHRCPHgLCE75eE+FlOvqGiH/TkXcbeo1R
oQk7mqXPJWeFjLlHTBMeZlMLHLnb/fXj/fnr3a9ixnWf3v3jq5h6X/66e/766/Pnz8+f737u
UD+9fvvpk1gA/zT2ximH0yXaXqBkMpi/1nt7wXfhCsgWh+ByifDopBY7T475lcmbsH5HtohY
fAYLwlNG3FHtvAhLa4DFWYyGCpE0yQKtzTrK68VXMxO5ocuwgOLQ/xCHxNM1LARd+tEliOue
cXDJ3a6TM5lbYL0hHviBeNmsmqaxv8kFaxolxKspHI60Fr8kE/ZBQLqmdmHikEAjB+mQhk2+
ath0LDX6KMow5u3DubRzqpIEu15J0v3S6nl+6oKJ27nwJKuJ4GSSXBLvI5L4mD+cxSWFGn9L
KjcktfsymzSnl7oSefXk9mB/CM5fWJ0Q4b9locr7F72rKTEITU7LHTkVu9DUynbwT8HnfRN3
dkH4WZ2XT5+fvr/T52SUFKCwfiZ4UllAsS/qw/njx7Ygr5/QSAZ2Fxf8XiIBSf5oK6LL6hTv
vys2oquytumaO2pn2gHB5/J4sh5UKCKeJpl1CmiYj42/22x1IQfJeFhTrT5jzhAkKVXOS008
JLZxDHHFHbvm/nyklZVHCDBLMxCK/ddZd+27JbZ0xYXDEFuVydTjhkbLGK+NVwpI0x4LxbGb
Pf2AyReO/FqEOJwT3yl5I1EQqzLwq7bcLhZ2/cBfJPytXFYT309OYi0RHo7s9PZB9YSe2jlj
/GoW7zqgVff15yJRNSWAnBQHyWJri5ARkYIK8DJ8WaJ7AmDASxgIJJHPCW4BSHBcWu2DeuDX
0J4aTequ3mfEv8LQ7NmBcAjtcqaHrUW+F2crIS4V9ELtLjRdHKz+iuyuojIurJBUpgvft/tO
nJ24iTwQBy+81kcV3X/yrJVzzeinB+PRsMeZZzIk82UIXIhdIA+9QPDYC1QiDnRxFPOkONhj
INJPlKxH0h3PFECmTuqeCA4kaQDhPbOjbSbzGD37zUnTJMSbgSBKPoDSbx8A/kKstJRxIkqI
DiO18yTKxQAAAGM+DEADzlxoKs0/SHJKvB0J2kfRj1nZHh+soR+3cO2qj70eQ0+bQpHh0/Lt
9f310+uX7hjQFUbknEhAzmPNQgi0Cs4HWvDZTXdoGm/8hngbhbwJDpeXmbFbZYl81xN/S2GR
8YDA0QjypWHAJn5Oj0glsCj53acvL8/f3n9g3QYfhmkCcSPupcQcbYqGkgo6cyB7cx9q8htE
qn96f32bClbqUtTz9dO/pwI+iDvlrYPADj5lprdRHZO0B7G1PgzcqfJsoTyv3oFjgzyur0Ul
PU/KdwMZdA9CP2suLp4+f34BxxeCq5X1/PH/Gf1olpdEdeCXhHH5FGt7GOx4pmmfDM1TcrOx
vZ3z957QHqvirJv9inTDW7OGBxnb4Sw+M7WeICfxL7wIRRhapFg/lzCvr5dU6cXVgwdIhu/f
PT0LS3/JF5hjmx6inYEWhYtRNS9/A6Xx1oRt2ACpswN27A41Y812u/EXWPZSNdiZOxklZwDo
T6ZDnbZ6AK8hdYel9vznhKBeusw31J6Wc78Te09Hii8JNxVDiXElToR2f1yFrpYZAhItUfAQ
Z5QQZBmRnhPpyFyQ6Q9Yw4DygAkzDECD5CkfvafJ3c2BlcFiQ1LD0vOQURtuHQ3SSUpDZDoy
Dj/kBiZwY5LyYbXw3OsV8XmOIbYrbN49bBZegLVANCzYEA5OdMxuDgO+Vz33yoN8mq2rBbIk
b0NVdLfdzH28Q5qvCMiEUIRgSngI+WqB5PQQHfwGmx+SZZf8BfAWWP0Vgu8Vwr3/hVvKidsA
ibINqoejAYIVsgWJFntrbCez9eh6QvdUTaTDqtkgHSUuF+UhnKaLxLYK2Ha7Yp6LundSQ6QB
A1XMVCfVlfNug3TZSN06cw6c1J2busbmjLxG8XAXuIdaBnjBPpc2AowwutdQa/yipiE2Ip8l
/gQ1QbUEczviAoEjbO4sFMXamahgiV8dprBb63YT7oQFzbYhbUUMjaBeloQ3zxG1g3rPDqBC
tZgwWx/mhYChq3WgtRVJPWG7SUdC9taBhGVpSeqNZM9Haqju3dixrb7Btn0l+2/An/aEpulc
T/pzEP2nkfvUHoCCrbsRydMI966B5ek+TUdkQ5j4IA3aYFJtBOchu6RG9pGB0OuzHLQ3nj+/
PNXP/777/vLt0/sbYksSJ+IiC2pS09OZSGyzwnjc1EklqxLksMpqf+v5WPpmi235kL7bYuni
3oHmE3jbJZ4e4Onrjs3pNSyojpoOp3rU8FwXM0uT3khuj80eWRFDKAyCFAi+BWOM5WesQTiH
geT6UkYdoj71sOUZP5yTNNlXyRm7OcDlyjAe6RLaA+N1CU7F0yRL6l/Wnt8jioN1JZMvzqBG
MM0lqR5soa+6lJO6RDIz/sgPmCWlJPYB5YYl8/X17a+7r0/fvz9/vpP5Io958svtqlHBmais
1TOLLnNTyVlUYvdEZTCrubCI9buXMswOQUGS20oNijbValDaWI5XE2XHrcKpUTWKrqyc5hon
judihWgYfowrlYIa/sLtX/RxQbUlFKByj/opvTpqJ+OcXrB3OUnO9sGGbxuri7MyDIwLiEo1
b8MqrbGHp0wXOvOrBlu9JluzlWVsHflixRV7XPFHwegHAkV3Do5YEiEaNFNSLQZhTPOCzaS+
mLhdp08NrGTyNYx2y5X2HChTrSBdY1rLp3PQIYhXdEISL4kgindQHdmCOtnBVvoaDhJy+xi0
nWTq85/fn759xrYVl3fWDpA72nW8thM9QmNmgq9P1Eh+JPvNpK+7dNvE0JjhoEe5tFdHl2pb
L3Y0cFrg6Oq6TEI/sK9Q2mO71ZdqCz9E0z42dspot9562fViTT5DstkP6DSzTkUymRvIfR0Q
r6xd45M2gSB0hLvYHhQrlI/zuGoficKl7zVoLyEVHZ6MZhogDjiPEK/1/bX0dna508mG31wV
IFwuA+KGpTog4QV3nCON2JRWiyXadKSJytUz32NN775CqHali/D+jC/BK6ZoLA1BWnbRWGMp
jwpLbVMcQnwlRVRkTA/Zo76vYh7XaCJ29Otk8py0QfDPmjJC08GgFkE2VEFsma1Gko0vqWAZ
GjCtQ3+3Jq5XGg6pNoK6CH7K9MuqU62TRyepw5JqjaK6rX10/EfspKxiMAgQM0s3eupyNmlD
njn4CtCJZPP5uSzTx2n9VTqpdWSATtfM6gKIvQgIfG123BuLwnbPasEHEwYdYuQc2YB5AsTW
hDNxQXgh7LJvI+5viZ3EgNyQCz7jekgaHwV3e8HETz2E741oHn0zRDKac8ZyhtCtTPcP/tbg
Pi1CZyMyqW9Pjur2LEZNdDnMHbQivS8ickAAEATt4Ryn7ZGdCROPvmRwk7hdEI7NLBDe533P
JbwEkBMjMgp29lFgYdIy2BLuJ3sIuVuO5cjRcpdTLzdE6I8eonw2yMA/jbfaEPYNPVo9YGR7
3HSqR4mhXnlr/EA2MDt8THSMv3b3E2C2hNGHhlkHM2WJRi1XeFH9FJEzTZ0GK3enVvVutXbX
Seq1ikO+xJnkHnYOubdA1bomW6FM6PVLT2b4SuUc4uld3AHQ8L9xzouKg6+6JaUfNUJWt0Dw
m8MIycC/8g0YvBdNDD5nTQz+rmpgiLcNHeMRXqg1zM4ndpoRU4tensesbsLM1VlgNpR/KA1D
6BaYmJmxIDUURkQoLjYzNW6S9sCkr4+6KjD70gEJ/kRCS9t1KAm82rgLqpvSXRVpVFvHGeWE
oUPxje9udsS9uVYn63vwpuLEHOBBeI1zdjom8A+4KeAIWi+3a8o1UIepeR2fazimnbhjuvYC
wjOVhvEXc5jtZoFbeWkI9zzubIRwfr4HnZLTxiNM0YbB2GcsdldXQEoinN0AAeHflQrGN6Dq
wL2jfAgJnqQHCC6p8vyZKZgmecwINmnAyIPNvcYVZkvaM9s4UrdYxxEns4YR3IR7/QDGJzRP
DIzv7kyJme+DlU9owpgYd52l9+6Z/RswmwURe9IAEYpDBmbjPpQBs3PPRilr2c50ogLNLDIB
2sztihKznG3YZjOzRCSGcEdrYG5q/cx0zcJyOcfa1CHlE3k8cEPSr083xTLClHkEzBzHAjCb
w8xSyGb4IQFwz7k0Iy7LGmCukkTALQ2ABbwcyTsjpLaWPrNXZLu5mu3W/tI9zhJD3CZMjLuR
ZRhslzObEmBWxLWzx+Q1mC7GVZbwmvRV1EHDWuwo7i4AzHZmEgnMNli4+xowO+LiPWDKMKOd
YSlMEYZtGcweX/JFYEeoOmWW2Z397TUDLkQz2+kI+puqurwhs46f6pljTCBmdheBWP45hwhn
8nBY9A98bRaLbd49n+IsnArGpxjfm8dsrlT8z6HSGQ9X2+w20MzqVrD9cuZI4OFpvZlZUxKz
dF9SeV3z7QyTw7NsM8MKiGPD84MomL1+823g34DZzlzWxKgEc1ebnFlWCAhAjzWrpS9938NW
SR0SPsYHwCkLZw78Oiu9mV1HQtzzUkLcHSkgq5mJC5A5liEr10QwjR7Svyy4QQnbBBv3VetS
QzzdGUjgz8hLrsFyu126r6KACTz3RR0wu1sw/g0Ydw9KiHuFCUi6DdakZ10dtSECM2oosXec
3Fd6BYpnUPLdSEc43aAM6xc8OE3E7B1IsgHMMLnvksRuxeqEE57he1CcxZWoFTjF7h6l2ihO
2WOb8V8WNriXZlrJxQEr/lolMjZdW1dJ6apCFCufIcfiIuocl+014TGWow48sKRSvo7RHsc+
AT/qEO+XCjiCfNK9xqZpEdqBOCbf0bVCgM52AgBs2uUfs2XizUKAVmPGcQzLszaPtMRDFT9g
M0yZ6XUEtIJRfNE/dk7As/IYj/UEoTEnLe2ReoGBlKtWvdKGo1rSLnLIezzupBb4pJOGh/jJ
B6CuheAhVSy35ZTUGTVN0kFXdgrOpE6aRpAbx/7t9enzp9evYJ759hXzBw8Gb1vPm9a3s4RD
CEpfAP2izfm0bpDOK2N4Om0JsnpKyeTp648/vv1G172zY0Eypj5VDyrSM9Zd/fzb2xOS+Tjn
pBI6L0JZADZjBw81WmcMdXAWM5aiP3Yjs1BW6OGPpy+imxzDKF/4ajggLDURadgE0nCxzsWM
0itI5jpWTukrO1bHoDk+GfXexek0pXdwNZQyEPLiyh6LM6aLMWCU21fpArGNczhPIqQIiMMs
7ZRFbuLYmhY1UeuVHX19ev/0++fX3+7Kt+f3l6/Pr3+83x1fRad8ezXnxpCPYN26YmBLpTOc
xGEfT/XiULsdwiqVRxfiGrEawsKhxM5zszODj0lSgRscDDTuR2I2QfSe6dBK2p4znTTkrVln
uivRKRu7KnGCSvJl6K+8BVIPmhJdMTiYX43pX42DYbOcq+9wejgqLE4gH0ZmLLQLRA5pX42T
antOS3IQ1V7jKEiudpVpX73BZEBvokFEmx6LbauO712FVWLT4ox3DRs+7ZOrj4xqR7ejOPIe
thRsLkmzOueglNIM1Y1haZJtvYVH9nayWS4WMd/bAOtstJovkreLZUDmmkGkYJ8utVGxHSeb
SBkmP/369OP587idhE9vn41dBGImhTN7RG05/Ov1GWczB4UHNPN+VERPlQXnyd7yps4xmyXR
TQyFA2FSP+nU5F9/fPsEniX6AEWT8y87RJbfREjpXOOLvT47GrrykhjWwW61JoJ7C4CywTyW
VOBpmQlfbok7d08mnl2UIxNQ1yYeAeX3rPaD7YJ2PCZBMhIhOJGifE2PqFMaOlojY6ovUL9J
kjyoPk+60kOVwiVNaoVZ46I0xQzvjlp6pZv9yZHtvMkpZ8NG0Rl4QcbHUPZwxHaLJS5dhs+B
vPbJB08NQsZv7yG4AKInE6/gAxmXcHRkKn6kJKc5pmcEpI4/TkvGDY1C2W+htwS9PlfLewwe
Th0Qp2SzEhtaZzhvEtbrZmJRf6rDVtQmCfHmAlkURpkgpKUgEw5zgUY504UKfWD5xzbMiojQ
zwPMvWCTiaKBHATibCGivIx0ehpI+oZwoKLmcuOt1lvs2asjT3ynjOmOKaIAAS7KHgGElG0A
BCsnINgRMXkHOqEVNtAJof1IxyW2kl5vKJm/JMf5wff2Gb6E44/SjzeuMCT3Hyf1kpRxJd2m
kxBxScCtsYBYhoe12ADozpWsXVViV1B5TmG+K2SpmGWHTq/XC0exVbiu1wGmqSyp98EimJSY
r+sNat4qKxqHk7ufTE9W203jPuR4tiak8ZJ6/xiIpUPvsfAuRBND0HGmnXuwfbNezBzCvM5K
TN7WMRIbMUJVmJmb5NQ0AFLrpGXZcil2z5qHLt4jLZc7x5IEbWXCEqwrJs0ck5KlGSOiTZR8
4y0IRWEVEZrQgXSGi5aVkgDHTqUAhC7HAPA9eisAQEApTvYdI7rOwTR0iDXxqqdVw9H9AAgI
9+kDYEd0pAZwcyYDyHXOC5A414h3ofqarhZLx+wXgM1iNbM8rqnnb5duTJot147tqA6X62Dn
6LCHrHHMnEsTOFi0tAhPOTsSRseSN62Sj0XOnL3dY1ydfc2ClYOJEOSlN2G5MMhMIcv1Yi6X
3Q5z6CT3cRlfPdp6gem0VKcJppie3mMGDhCvYct17OqEMzlZfdsCWI5x95QKO2sVG4IDKd3i
JTID9TgZ1D1zlHt0kblNqUcfrpsyhhoRh6SBsJ1FWrNjjGcCkZHOKgYZP1PuJkc4vPbIx55b
PxBs6JHaeEYU3I4DYoPTUNF6SXBlGigXf2He8jWIdUkcKeMkREjIdVQbDLbzie3TAmFml9qQ
sXy9XK/XWBU65xNIxupm5MxYQS7r5QLLWt2g8MwTnu6WxE3DQG38rYdfjkcYsBGEwogFwtkr
HRRs/bmJJU/OuaqnarO/AbXZ4lv+iIJb1TrAvM8ZmMnVyqAGm9VcbSSK0OUzUZZVKo6RPmmw
DMLSEyzQ3Fhk5XpF2IbroCBYz7ZLgGa3i6x82O4IQZaGEre0mdVWHs4fY29BjER5CYLFbB9L
FKGgaqF2mNhKw1wzbG32F7ITSeRZBACabng3Hon9rWpKEAcq3ifcz0q2cPcqYLjnERmss2C7
wTlmDZUe12Jc5nqVi4vYglBUMlCBv5qbVIIvXXub5dxUBx7Xp7RoTZhYNziDacOIO4oF826q
29pq6fQInzg50bgB6cT4K5a3U3FMgz1kWYi5Ke2QYX8r/6qn5EWdHMw62TCRYIV3TJMKkxRW
YReSszI8cidVm8cDCW2FgFTheh6ymYN8uMwWxIv8cRbD8sdiFnRiVTkHygTDdr+P5mBNNptT
ouxHZ3ooyzCMPkCXJIyN8akgWGQiZlJW1ETYk6q19Nd0kjMymqq3s00Vuzp6zwpPY3xdC2Y4
ITvjACFT75FugIy7OKFGYTURJqpyBsKEbo+jitVEaDoxUeoqZtlHQrQIDTkWVZmej662Hs+C
v6aodS0+JXpCDG/vwZ/6XLkAS7ApA9WXzkvNvlLhg8kG01Vp9kXTRhciglSFO76QT9XSyQSE
2fyqPRh+BZ98d59e356nzvLVVyHL5Ntg9/FfJlX0aVoc2/pCASAwdA3h4XXEeHuVmIqB752O
TFc/qugsYCtGMkBQ6M7bkQtplJuaPjNtmuh97LX2kkRx0arwD0bSZZX6om57CBXNdId7Ixn9
xHI0oSgsukxvzxZG3Z2zJAd2iOXHGNMhFY3oj6nhc0jLMmKZATGPseGRn7FG1I2VNZxd3kYn
RY85gxdGWSFj45RUGbyTxzJmgFhonIPXOLIG5zQmolNI75LIg7ccPbG6tbmjNI6ef/309HWI
IDt8AFDVj2Gq3gNxQpvk5blu44sR2RVAR16GhkNCSMzWG+IuIutWXxYbwrhHZpkGBN82FNju
Y8LX2ggJIVz7HKZMGH7LHTFRHXLqRWRExXWR4UzXiIEIx2UyV6cPMahmfZhDpf5isd6H+N44
4u5FmSG+TWigIk9C/LwYQRmr5hqYVTtwhzCXU34NiAfPEVNc1oQZrIEhTPIsTDuXU8lCn3io
NEDbpWNeayhC+2NE8ZiyI9Ew+U7UihCV2rC5/hQcTNLgDIMFmpt58MeauPLZqNkmShQu+LFR
uNzCRs32FqAIa24T5VGibA32sJuvPGBwibsBWs4PYX2/INy1GCDPI3zo6CixBRPCEA11zgWj
Obfo6w1hy6RBCiukI4o5lxYHjqEuwZq4X4+gS7hYEiJHDSR2PFwxasQ0CYRhuRfc7twO+jFc
Ok608opPgO6EFYcQ3aSP1XKzcuQtBvwa711t4b5PyFZV+QJTT5WU2benL6+/3QkKXDRGzsH6
uLxUgo5XXyFOkcA46HLGbuCpMKMufwp4LLYLc5PWKvrz55ffXt6fvsxWmJ0X1PNTNxyNv/SI
DleIOttYMi9ZTDRbA8nUEde2jtZe8L4Esry4tftzdIzx+TiCIiImL8+kp6o2qi5kDns/9DvN
wdJZXcYtq0uN1/wv6IZ/PBlj80/3yMSZb7k3VRYfr/96l9FdPz//6+Xb8+e7t6fPL69UVtA4
llS8xL0DAvkkLrcVboInmVee+NT5phhs8LPqun+JG83gZFp5HiI4JwBmotngdnEOJ/0aukAw
IjeVCndLF1D1urogi+7OsvBnDhpyXShi005BzCcgkhMqfFSPr4ekyog4qnL09+eDb4kSx3Tk
2ijTRb8VJUe/yKQF23D9l/elp2+fXr58eXr7a4wJ//7HN/H3f4nqfPvxCv948T+JX99f/uvu
X2+v396fv33+8U/7ggX320rcb891weNUsNe2HOAk6tGyPEzSlIHvRomfSBPqmoUn+4YM0ht/
qDe81fd1/f3l8+fnb3e//nX3v9kf768/nr88f3qftul/95EB2R+wTD4/f3r9LJv4/e1VrBVo
pYzd9/XlTzWWElxFfID2aZeXz8+vRCrk8GQUYNKfv5mp4dPX57enrpu1dSuJqUjVLrMy7fDl
6cfvNlDl/fJVNOW/n78+f3u/+/T7y/cfRot/VqBPrwIlmgvv9gZIzP47Oepmcvby49Oz6Mhv
z69/iL5+/vLdRvDR/vZvj4Waf5ADQxZR2ER+ECxUxGF7HenxJMwczOlUn/O46udNLRv4/1Db
aZYQ4b1MY91IZKTVEQt86XOFIm4bkugJqkdSd0GwxYlZLa47RLaNvDFRNLGtE3VtwhVJy8LV
igeLZd+5IBI7dJvD//uMAIHkj3exjp7ePt/948fTu5h9L+/P/xz3HQL6SUbh/D93Yg6ICf7+
9gIH6+QjUcmfuDtfgNRiC5zNJ+wKRcis5oKai5Pi9zsmlvjLp6dvP9+/vj0/fburx4x/DmWl
o/qC5JHw6IaKSJTZov9146c9Y6ah7l6/fflL7QM/fi7TdFjkgm/6pKKd95vP3b/EjiW7c9jM
Xr9+FdtKIkp5+9fTp+e7f8T5euH73j/7b7+Mq6//qH59/fIDAqOKbJ+/vH6/+/b8n2lVj29P
339/+fRjKqC+HFkX4tZMkNLIY3nWJZHKLuxU8NrT1omeCudxfBVnpGYMJw1Bxx9tlsB+xA2n
jJAeleLoa6Rb0ygm2EiASe+l4oA82KGANdC94B9OcVrKrctKP+x7kl5HkQzCZd0gfEIsBEuj
zn9vsTBrlRYsasXijlCOxG5nGGMCdCDWtdVbIqGNwIaJHeO2LAqzZ9tLxTK0pfAdln4UPCHY
RGFdAL1D0eA7fgKOEqNeMvM3D09xpHMb3cF9J+a8dQhqXwmgGH5xG9uYdYZ0nqTeZjVNh5j2
sK3vAiNK/YRsmyxooRmouqmdqMrQK5fI/xSlppxUn+QsFZM84YIhfrTrdV+IY4Ch1dFLMz+q
mGDj8GsskFkWicVKkvPifIkZTb8cCW+Wknifoa8fgtRFfewGOqzqcNJLnWHQIcmovlKI9Wq5
lM/G1tJT1O1AwjLPkoZ4j9ZAYCI/uY/EHUMpOc/928vn356tSdl9jWxYPQVTN9Top0hXvzFq
PQRz4n/8+hPiFUADHwnXNWYX47dzDVMVNelLRIPxkKXzPXrk1DY2RHweFTh6ZxXqtTNpRL8h
rizCKMcJ0dXqSJ2iHSk2Ncnzov9yfAPuqeklIlRaekR1xAUVI+B+udhsZBFkf50jwlEJrFwi
nr3cRY7s6BMyA6CHSVWdefsQm8YV+kCAz4/obO6bMjHMMiS17+YpBboKSQZHOzG861sHANiz
mnBl4trlbjRjpDhORgWCkuI8muS8UeNvJwcJ3iJFktsGRqhFCkiX7Yo+NPQ47ovwREhQYA9N
qhpiHpXUQEEUkq9WAsClI6XY3nqAWMXHhNfgwr84HpMc0wXvobJrT1FYmoMEJGPVaIltaTFx
A8EP8qwtT48EdeGkwrcQJJqGeCtXBh6avQoDZg2W4kspNXlAlCyPB/c10cuP71+e/rorxV39
y2QXllDpegLEWoJDTGkGT2H3RdyeElCv9bc7eu8ewfXFW3jXszisU0yBeARPV6JKH27USAFx
mkSsvY+W69ojHp1H8CFOmiRv78FrQZL5e0a8ThpfPILPqMPjYrvwV1Hib9hyMdfqJE3A90OS
7paE4TqCTcQN3qPPuQ4tdv1UXCbKxXb3kXiCHtEfoqRNa1HzLF6sKbXTEX4vFlvH2okeXey2
EeF2VBuymEVQ/bS+FwWcIi8gog1oo6kibbdptKMCk2j5C9x+sVw/zI4UII+rNeHWd8SBtmSe
BotVcEqJZ2cNXFykF4+8Xq7XhB0Eit4tCL3xEV2kSRY3rWC14Z/5WcxM/M1P+6RKOMQsObVF
DVbUu7kJUPAI/hfzvfbXwbZdLwnnfeMn4k8G79phe7k03uKwWK7y2Zmj+3eti7M4MMIqjmmu
vv/qMUrEvlBlm61HuJxF0YGLd+jQgo2RPfXhtFhvRQt2N3yS74u22ov1EhEevKezmG8ibxPd
jo6XJ+LxEkVvlh8WDeGHk/gg+xuVCQK2EFcsvlr78YHQPsA/ZGy2mDi5L9rV8no5eITO1oiV
2r7pg5iolceb+ZooPF8st5dtdL0dv1rWXhrP45O6At0OwaRst38PHexoEU8HBx1pFjYrf8Xu
CX26CXi9WbN7+iqrwHVZtHW08INaTP25Wnfg1TKrY0KpywKXRw+NFqvBqnP6qHbL3ba9PjTH
CfeigGKzK2MxlZqyXKzXoW+bRXViA4t30QvcV0l0jE12qeM5eorB/ozSx/E2bN45olzehmn5
Vnc0iqRcxo0ikcDItKAnTh/nWXxkcM0C98dR2YCHkGPc7oP14rJsD7jOthR4NGVb1vlyRaj8
qW4AoUpb8mDjZD8GlOMY5gnM7ySwAr0YiGS38CdCKkimPMArOjB13WBRQsNTkgv+8RRulqJL
PcGATXjhgp+SPVN2zVsiVCYCxHXXECCu+SCB4qg7lCtyRQg6zzdrMaOCzaTa4tsy8ny+IDye
ywt0L1BgebNZEk7wbeA2QD0PGbConIobWXTZrj0PEzV2pJadI9RvqI0TV11zWaI31S6xZae9
yhknJz53kaEsmzAITb5ON5LpLmBIe8PJBBNJcxf4uM7ZJbmY9egSMX+qciyqsDxSV2bpiFVM
wsxqm0y/T6okt2vZu5sjp8hHwvhEftzwA6a0rjJWphx2kjamRl7HzPPPS8KGsU7yR9mOJliu
t/glqsfAfcgnfN3omCURQELHrAiPBj0mS8SRuXwgfAZ2oCouWUmIDnuMOP/XM2UBi7BcY8Yg
ck8WV5LJGmxiLEy4PGfENXxyYT5UBa+nG07EKVl3CkfRoz1D6+iA63TJzvAIlTDZnUf6WnJJ
aBpnF0YeBcMFKM5r+Y7VPpyT6p73x/zh7enr892vf/zrX89vnZ9QTd592LdhFkEkqHFnEmnS
Pu9RT9J7oX/wks9fSLUgU/H/IUnTylBq6QhhUT6Kz9mEIEbtGO/Fvd+g8EeO5wUENC8g6HmN
NRe1Kqo4OeZtnIudAZs/fYmgEKRnGsUHcZGLo1Ya5Y/pEN+2eyLjVlkgNIIq1Jawbjowvz+9
fVa6adM3AegcKfZFJ4iglhnOzAgSq7IwJXT7ZYfjUxmKfBT3Vp+SjUDWggMSPYhvDjJvXmOv
tYIUHxKrp8CjLihtkW3kXiTdxVH0zh8yQa2SC0lLtgSXB2PLxAWGLNPxQgf9Uz9Sm4Gikk3F
b7VAmWwEBjUhey+PC7EcEpzrFvT7R0KtWtCW1H4naJeiiIoCP2iAXAv2mGxNLTjcmJ4/rMJP
bTnhyUxDMeMTwmoU+ugk1uteLMuWdFUJqIyHZ7rV1OMOTKa9OOqbekXpfQqIcphMdpnyz4Ks
G/DfqrQSxEGW1/AmYq6hLIbbdpGRjc/2YjhQLhiIzdLKT11EyD7iYkESpi6yC7cefnVFDyTl
T/7p07+/vPz2+/vd/7qDTatzkzNqsAwFgGxQ2ZMpy2KkSfBulCbHU20ANb/xA73zka65mh9I
4KFBYxhGgvKHnBLhREcci8C/BRVl2kARTsNGVJotN0vCJspCYZb4GqQMwPkL2jAyxLT2+WXt
L7YpLqAZYfto4xHzQ2t5FTZhju+hWol2P/ce/t0TxlCItY7pjtS9E3faWN9+vH4RR3B3JVJH
8VSBKjpnmRR28CLV5Sx6svg7PWc5/yVY4PSquPJf/PWwACuWxfvz4QBRoO2cEWIXorstK8Hn
VAaPiqGlEkBCnVVo9h2zU7P7GLSg0P6f6bG+/uJybfgxgt+tlOyLzZiQ7WuYy5F52PuYBgnT
c+37q1+0IA0TBbj+M16cc82pP7d+SL/+lZlU6r4Vu4Q2TqNpYhKHu3VgpkcZi/MjCGwm+Yhd
RGm1F4cDKJSZ1A/GI3uf0pnQWt6KgVpwDtpsSFf11evbZnx2qmQy8dnEEFmjgcagOHAj/svS
19M7m4a2SCPTeFvWoyrC9mDldAEfpzyWxAO3azhSk5xwlyCrSrz8yiwyBk/nds48fjhDVACy
9cqqwf5MrmWyHgw8H5DUrC4ZLglXFQIXB+3Z26ypWGWQR3leoU551EAndn1Z5AWEwytVYb4k
GBZFTtYrKg4d0OskaegGK7K8JxEBlAF0DgIqtnlHpsIZd2QqtiyQr0RMN6B9rJdLKuydoO/r
gHDXIxcwW3iEQakkZ4nlFd9csM3jkXgMlF/zlR/Q3S7IlPW7JNfNgS46YlXKHD16lCH6SHLK
Hp2fq+yJeHx99jRZZU/TxbFBRKsDInEPBFocngoq/JwgJ3mUHPEDaSQTDNIIiHDLZz0Hetj6
LGiE2OO9xT09Lzq6I4Oce0sqDvBAdxTAvd2SXjFApqJKC/IhC6jIh3AYRZzeSYBIbyGCvfcm
lw6b7phU4LgnDRq6X3oAXYX7ojp6vqMOaZHSkzNtNqvNipCBqPM25uKOR8QrlFO/YYQtIZDz
zF/Tm1UZNiciuq+gVklZCz6apmcxYU/dUXd0yZJK+NdWhyLhIlASQSfjkuwd/eaSNEjmIGGB
79hKO/rMESav7gWnd4dLQ4aaF9TH7IBFUDlFP0lztPH+oVaC8X7cJakZSrAFQJ+ozfWE0zWK
XeuOtVWsEpwgxZru45m8Sgj2Ii0oiHeDHiifikXREGqF5vtGpHrJuwHIk2PGrL4ioJZkHsXY
Lz4m1SG9tYDgaYYSqVpQwXg4+CUT6FiYGlC+ld3Ud8sFFam+A3YiFUe/qeiQHPwmdxEwZSC1
7vI2TPppd+uGvX2qYFCPOXhvynTZ/FAUzJ+0gIp/jH/ZrIybin07OfO9zTxLS3D7iXeCODPP
cawBImQJw30N9YgNGFM5EafkQAUUlcxqGJEi+z6LsiBC4o70kxtRi2lK2qz3oAsTFxlM1qj2
7NDsdpEwxCp03JcB1t+ZJ1c5QWMZhAtyXUUyqTpEzcw+9BbklfjcXtKCLOO2wdv79ZTwmjKZ
ULdRscnk8p1M4Cf7On8NO8tqMAs8vD0///j09OX5LizPPyz7wBH6+h38h/9APvm/hjF91x0H
nraMV4QHBw3EGX1TGDI6i03OdQx3WRGKQgamjBIidLGGim+pVZaEh4TexuVAZo2s/NnBdEPU
vMLqpz7ap2ugrGzEvDglG99b2ENucolJdX8timha5KTm9FkG9Kz2KSW8EbLZUuHqB0jgEdrB
OiSYg9yLu3J44dFkqjPowk4MJzuRff3y+tvLp7vvX57exe+vP+zJq1QpWIIpgmj0Bt6iD4V5
IGi0KooqilgXLmKUwUOxYBHq2AkChquCLdkBSnIHESKIElQpqJTyNRIB68iVA9Dp4ssow0hQ
Ynuuk5SjVMkDHNNzbO+OfURIreL0RUVhPR/8NbGJRiCFBD6rbuyC5fSTsHo30Rvr7Szn5+A0
0wcr5B1C7rwNmT0lieKuupml2tzMSGMHF6mNWEKS7WEdSZWYLEl+JL/k5JcMzHHIMtER4RAD
BBPc9wgeZcFqPc1yaktoU7DD2aCLqe0oeIDJBeLMKGPNjnDkPsFW9Xoj2zPN7n7pB0Gn1ze5
o0zBy92uPVbn7q1i0g2dvvmEA+rU0AXbRG/Vvaq6+wjuUK5TTKsIOKS/R2K+uPHzXICWrbtR
gM0LXDm4BxRRVST0jiTZxyqPmPnkbfFq+g5SPX97/vH0A6iTA0zW6LQSLEriGmmxR+rKmDeU
gxRTHMByMY0vjuusBJbV9Gzmdfby6e1Vehl5e/0GD2YiSVwYgTd50usi4X1Fb/9KcQBfvvzn
5Ru4kpk0cdJz0uqT1hHvMMHfwMyJBQR0vbgdu0rsdTGhj/tKf/w4OmA6UlJMM2WjJjOjfv5T
zIvk24/3tz/Ai9EwF5WjkAlVbOD69+idIWKXJA+TNguZKYkl6vDrK8TzvfvPy/vvdH3Gfri1
DdOK9XEMnHO8i0Y+t291MHmrHxm9Wz6Z37Sa+lAeGVmFj648PtJVF6TaeahJTfNBpNENLawQ
RKVw2PDC3XZuHQEsYmdv7qahQBuPjAs2AVIxxnTgdkEYOBogzxOHq3v7H3Cz1btfeYR5pw4h
ou9pkNV6FrJeYzHSNMDGW2L8BFBWM/1yv14SKtcaZD1XxzRcUyp8PWYf+aSa34CpWx5iNhKD
VKcLwiwnI9bkkC/XqUOQOWLcNVEY9/gqDK5jb2LcHQwPuOnMOEnMen7VKNwted1Qp5nrPmCI
6Gw6xPGEOEBua9h2fjMAWNPML1+BW3oOXYAeQ5hHGBBaY0JB1st0rqTGX1BRy8YTd+ubno8x
wG56DYgyXWuxT1VGOd0ysmgx33rLFZrurzxs2cU8WBIW2zrEnx+YDjY3zkdwiuseG+nhBbyw
zCw/dXczo9RikOV6O3kUG4jrmbNAgjZYVG0DsfO3ZBHLOembLMI90eRt29tA5MpZFtaCd8FG
nHhx+/I2Dl2UHrMNdrMTQeJ2dBRSGzc3YwAXbG7LD3A35LdcbOj4pjbOyg9Bia5j00XXUzo/
rWj+kn5Dhdee/+ctFZa4ufxAAOG7Vk2VivMe3S6qWuy9YpFHV9fn9XrtIbuQSpcMLJr1ejOz
EwFkSanF9QBU4iTSNyinBZTAtxuEwASjegvK825CrWdR/FinpOuSAaRsiZn4U8ZbmwFXh+5K
5BLIKlECITfjPPOp2KE6ZrOgg0bbuLlpLXCrNWG4PGBqRnny1yEOlUsFEVd7Im75cHdn3F/P
8GkSs5nHbGc4LIGx45kjiK2HSswlyaHC12HEPcN9ANaCPVkRIVYGzIHtgu0MJr0s/QVLQn85
O+Q6dm4aDVjSGf8U6Ter2+sg0bfX4qY6RGHjEWZpA5Ivme9vaWUABVJ88zzIodEhpS8R85Yz
1yYZNdu8NmGIFTodr1lAORLSITP3TAmZqaWAEBFLNMiWcIGkQxxawz2ECHtvQNw7F0Bm7ioA
mdm5JGS26+b2GwlxH8EACdw7m4AEi/n11cHmFhY8DxB+gAzI7KTYzXDYEjLbst12vqDt7LwR
1w7XKuIsCPBN/aMUau42pUPRsL9SbIngzAOm3iwdWv8DxN0aAaHiVveQnJ2D9cxul88YCAyY
mYYrzMyJVrKNYGNtd1S90ZMhVDXGRnFb1Pu5RjYJiuc6Vqw89VSjTtLys7P51Kuk9EOTaGqi
JhL1x0Hxs91LEfejDAuaH+sT2gMCSMVFPZ9QW3/Iujeg7F3bfn/+BJ7R4YNJZEHAsxU4ILMr
yMLwLF2kUTUTiOqMaZRJWlmm8SRLSCSigko6J9QyJfEMeoNEcfs4vU/ySR/HdVG2B1y2LwHJ
cQ+DeSCyDU/gK04zT5Rpifj1aJcVFhVnjraFxfnIaHLGQpb+/5RdW3PbOLL+K6p9mn2YGl2s
2zm1D+BFEscESRPUxXlheRNNxjVOnOM4tZt/f9ANkgKIbkrzMBOr+wMING4NoNGd0m+YgF+U
eZTcx4+8fAbsRZGtpVclh7hWwbg3uG3Uo2fLB2TdC7d5Bk792PxjcOzOSzpOBf2wxjDjnmVH
j02dVCPngxZJv7DbWAYJY+uC/E3Jf2ub5mWSD3TDXc7aPmP6PN/qSWUnpGS2d4iqFqsZz9aV
Gh559498Q+xDcJ5Er+XAP4q0Yp7DAfuQxEc04ecL/1jyj1cBkIQiop6AI6/yZoXfRVDy/bY6
JtmOdAxiJJWpRE+fuTf20xBNmtl8ubfihpflB67PgXSp+bKlw4+Clm8HYQYK8Mu9DNK4ENF0
CLVd342H+MddHKeDAxL9T0jd0/meJHVPKQfaWYrHTSrUjhEUxsPe2t7kMVECV0v5puqRYTkt
/cEs92mVDA+GrKI1UsMrmScSwM3LoaFciAycYukJge8pRZxpGWa06bUBVCJ9ZPxLIECvJpxH
GOTriRO9Nob8nISvzvlPlOCIgnkqhPw8DAVfBb2sDYmpsSHi+Xqx5JlFHIO7o4Hsq5gJgdhw
dT/X2g7z2ggxA9EusfqM33ic68A7rFAD66qSoqx+zx8HP6EXXvq1AjLzQsUDsxE4F9zyIqh2
5V5V5jk1vyiAHlkXjCsbREw3H2LG64xZNoaW6GOSyJxx3Qb8U6LHCcuFDw/K78NjpJXNgalI
6XUgL+vdno4VgPpjWvAfkKHeoU17m6vWuIrQn1GxhkiFpLpvXoZ4Kn/BmLs1cC/mTvP9/me6
kC7kt8HsBL5tGTt52O5Zj52rVZh8FyY1+MnSmozxy+XGBr8EIbeIjWntT7deaYzP/Sj7Snyl
kxZJHexVP6ssQ88nLlmUsLoKVe/CyOG4sN57e0yZZXqWDuM6i4+N5xn/BYgbKQ6k3jzvcBu2
eR5Vg+OSRFX9T7n+GZhq59W2n06T4A1LFacJE4+iRQUpOmJRFdvdW+RG8cFjdcMobJltXAKh
/4DIlh7EQ9zrqTqDVzQQT2fq5tUL73oZHK/f38EpSRs5K/Itn7C5F8vTeAytyhTgBP3RNLqT
EOlRsA0FFQGmQ5gO4VGbSJlkpvCYiJctQiTj+eICOMQB9WCiA6C5qV8w8yjUoccXAfSpZZ5j
R6iriuBWFXR5EwzK5xIjBekbRd8+dwB5om6j7JKCB0R/Noi7+g0lb2IakRJgmy0/7aeT8a7o
dyMHlKhiMlmcBjEbPXLgxdAQRmtbs7vpZKDL5mSL5V0t+l0y5yqeX6v4vgGwhVXpauIV1UGU
K7FYgCNsvj5lnMVKYIzhnZmAv/QWMF1EDGUrc3Lz52XSxqyCicK4HRuFL0/fv1P2kTgLMQbn
OOWX+PCH5R8jPm3lxmzCz2Zal/mfkYnCnZfg4+/T+RuE8xvB879QJaN//3gfBek9LCa1ikZf
nn62Zr5PL99fR/8+j76ez5/On/5XZ3p2ctqdX76hpe2X17fz6PnrH6/u+tLg+s3ckH2nOiRq
6Im2k5uoxEbwM12L22g9mNP/bFyiIi7kgQ3TfzMbDhuloqgc02fifRgTB92G/b6Xhdrl1z8r
UrHvR4cjYHkW8/tSG3gvSnk9uzaesm6Q8Hp76IFU74PFlLlmMg+gfRUHxlry5enz89fPXIxt
GYWrgRbE7ftAz4IIYjnzaBrX+ihjNiGYe7WnDO+QhZNMVIb9gWEY+YDShIit6EdX7yOivYDY
Gmnnkb9onqKNti8/zqP06ef5zR2q0ijD2clbRpFDObs2mibOebpTfHn9dLYbAJNpvVd3Lvcs
2FYwj+HMUzo1DXVpVgaIGJQSIgalhIgrUjIqXhtlvKc5Q3pqjUOGtySaIouCAsNJODx7J1iX
B4oEM9+0QZp8Hjwf9MhTQtRTT5AmxOvTp8/n99+iH08vv76BGz5o3dHb+f9+PL+dzYbCQLr3
Fu+4UJy/QgzdT/2BiB/Sm4yk2EHQU75Npk6bEHkwHq8uyQeXFIRUJXi6k4lSMZzobLiNDby7
S6K4J/qWqsXPMLzG7zj7KGQ40AguC9S75WJMEn1lzDAmzRc8PRHT6E+gYAc1SkCageNhCaQ3
gKBjYHdgFB/jgo6cy90tK5M+lglzT95wp7QJASpd0b5i3umboh1UzHedNN7mFXsKj4gBrbRd
EcPHZbjg14zwEUMX8C0U8afcqO9XUcJfT6EQ4NqyCapCghBQy43eOQlVQfxkxis0yizRe+ng
wPieR6HwMtHjMAvjQxKUbBBRrHN+FKXegPGIfujm3jZN6b6M2vwmOVX7gfU8UeARlokDA4BH
nZrvQPEHbIIT3z9ha6v/nc4nJyr2A0JUEsIfs/nYWxlb3t2CsThBgSfZPfi4gwD1Q3LRLZsr
vfSQY7H48+f3549PL0ZR8G/acWm34yZmeWE2/WGcHPrlhtOv+hAwZ6LtfDJjLPNR+zgp+B4j
MxOb0SkPKo1pkfgUvBRsTvycY0mmznZ6MzF61TPT5fDKY4Mg4gBzxu9DudWpQYFY4Ur7+K8p
wW1V7Gwva+OFV2ncpZnPb8/f/jy/6UpfTrb6Uy54QoFOe/WQYc84PcfylIPsdtN+04Yd1rgv
DHvW38oXJzFlfGxixzoMlgvYM+4YQWVmf9A7T9ZUnSUecXiaNFRyymQXRGGzfLuqKKl+Apg6
G5bRfD5bDFVJ7/SmXuSvPp+xYcSWzO/pyN84BW6nY37KaTrlgJN6FBKeR3ndyRvvJ9MPXP0O
/WB7x0P2KCe7fG9qxD839JazUXu/vZ0/vn759vr9/Gn08fXrH8+ff7w9tSfsTm7sTRQ2GOv7
C8XJmFKhMOts4BDJiHrDTzKbfRaC4cMARIJr+/akhy+Gr9L1NtlaJfG3Yr1Mrh16hZFxzpWr
hLmZM/mIEKL7DgDwDn6Avxu419rC+TxtDWHYxzgImQtenKfEkZSE1T2v9652IFSPhf0KD3/W
VVg4QQU6akg9IzLcDUyb46mfbB+SDiYMcxfNlJpNp2Pic4XS09zqRA6f6ue386/hSP54eX/+
9nL+7/ntt+hs/Rqp/zy/f/yT8uBgcpcQiDeZYaHn/Te7liT/7of6JRQv7+e3r0/v55GErS+x
HzHliYpapFX/oJgqCpOjs5KBf3x1TCo0yWkPUqS1ayyOpYof9E6HIPZPAzSmDtLcdvTekVqf
6zPr+kuBqeiec/IKSfsapTkBkuFvKvoNUt9ySwb5cN7UgSdKqf9J3DKjO6RIpi4V/YKAqx9b
GMiIdv0ckKQ3E2ALqndiuet4/YKgh8qFL8KCzLlIq42kGPlGV0kokdHfAzZajrBCv+CqNfUA
zcHE8Bf7pegYSrWj1tULDAzesjCmqoKZg0M7itle9VEyPYkDdRZ6QWzg39mYTi6TNIjFnjrK
s1oW3Pu75WqdhvVzNXRwy0fHVrS+rKSX+ETrVjg8ko2sFaUvYpZFQtev7zzHzlHii7nSbw4q
rwSji0VSDLRwYvzKZSJFoJtv6weln3cYLBn7eOAeEmEGIfPV6Oh+JTp2o8WdFY56btrHmyRO
OXloSP/QtSHvktlyvQoP0/HY493PiE/xA10zOzdhfroPtOqK4t3BP4z/FZTUPuCCIaD4e2Oz
x9SNt9ArBGXvjF9vDu/tdnvYhV5H2SnaUyz2tyYQKy+cxo2pNyxcCwKvjwelnnmqgJo4TnGW
c5OjFLS+Zc3HckE6OgFEfnRigMpYFyEJqYKCLQ1YkVzKhzYlGN7JzuJCrT1zURcUlHCYlMGh
3+4Ipy3ZNvZfWIDlLqFaYA4i02rZnAk3b74BPmOZl2IXAPOIxlSlHI8nd5MJfZ6EkDidzKfj
GfccGDGpnM0ZbxUXPr3nbPmcz5mOv2be2CKgCMW69wWb3dhf9TItZuu7gYoDn3ls2/Dn876Z
ncenz3o7PnOY3fBXc+ZMrOVznhsuMplfEdqCeTOKgEiEk+mdGpMvxkwWR+nJtYy3+5Q90jX9
MpquGN9LpmrVbL4eEF0VisWcCQBmAGk4X3NvcrsuOf8vz0/UbLJJZ5P1QB4NpvcGtjewjSez
l+evf/0y+SfuB8ptMGpM9n98/QRbEd8qc/TLxVz2n97UEMApL+WwC7laCQjdGRXJMj2VzAUH
8veK2YCbTMG48ZHZfBuZJ1qo+8Z2khRI9fb8+bNzkGxb7vkTbWvS58WQomG5nm17RhEULErU
PfspWVGqhwPZxXqLpBXSis2kiy53Lauw2LOZiLBKDgkTytNB9uPqkZVuLD2xX2CDPH97h7va
76N30yqX7pid3/94hs1qc/Yw+gUa7/3p7fP53e+LXSOVIlMJFwrDrbbQ7UmZzTmoQmRJyIon
iyvPyJjOBd4m0hdirrzZozizY0yCJOWaI9H/z7TelFGdJ9bTqG9mDFT3VxMTGoavG6YMmdyW
GZnbXeynwEsgFYqCHrOIqXb7LIpLeo5DBNheMU+aTMW0Nl4o5i0fIk7whpNnRzKcTymdtqx0
HRJLZQRCq5FZpF2otdZHmtiG5vzH2/vH8T9sgAKji13opmqIvVRdeQHCtQPwsoNWMdvxpQmj
5zbyvTXlAVBvwTZdO/fp7ka2I/eC8tn0ep/EdT88n1vq8kAf3oA9PZSUUELbdCII5h9ixtLp
AorzD7R92wVyWo2pN7YtwNsjtIxIQThY+6TR5dShnnb2JT02bSjzgN6CLJirkRaye5SrOXOD
32KkOC3WY65LN4jlcrFa+FUt71fjFVXTUs3D2ZXCJSqdTMe0uu9imJfsPRBtS9GCThpCmyq2
iCLcsF41HMx4QR0POZCZ60PJ4V1pD8QwIQa6FrmbVMytV9c9H2ZT2lawRSi9y1kzUXRbzEay
LgS7ptbjZDLUfTRgvpqQvUQnnQ43Siz1tpJWnbtcDhoy3I3Kw2o1Hmo0NZf96QrJkR6vK28a
Ak8cV6YhaCFmT+BArg7xGbPzcCDDMgTI3XBZEDIsZoCsh7sCTiWMZ7KuKdac+9xLr7ibMw72
LpAFF/PJmYHuhruFmfqG5auH43RyZVaQYbFcU7tOXPZ8b8TQf56+fiKWM0/ms+lsSi0xQK93
R2k/8nWLTK5AOFbW4dTr0t0F/pV+rXvBlHGma0HmjM8gG8I44bFXt9W83giZMM4ZLOSSOY65
QKZ3Y+rcrZtmNgk5/qv7ybISV3rR3aq6IhKAMF50bQjjhqaDKLmYXqlp8HDHnVV0faCYh1eG
IPSS4eH14TF7kNTbrxbQuDFuu/zr11/19vFa70rkKaLvu7sFSaX1ppLwVKCkjhQ6WeGtyUH/
vNw67yDGmpqBX8HQHzWaQXYB+tS0G2vpeDa0+AF/Qnxsny3IHicPA5nBc4ZIzFYnKmVzEzYs
vUr/Nb4ycxZydToNab7e3VlXeOa2yeLXB+rYsxNLdrBcBVm9olYhNZ3JarmYDmWIuzmqqOWy
Z8HXuRBS56/fIdYENS9HWv7mDaud54Xq77cwW3hwEHWPPtp9ut6L6i3tqY4zEYA3pJ3IMojJ
1rtQ14lrEwXOpWGQTZG26ZTLdS9+gYIW4JdTAtwo6yllGzFPZISEm5V0vKK32+KUcHd3QShr
pROXIrH8O0EZLtcxFtGMBat1o+NQ7hgQTfPs2gDtgavILlGYGX0WovtWj2dxVO87GFUU7JrF
glpN7me1SdD8lroD5mX/tx4Czj3PSTElkKdZneCZm0uok/JB/auL3pgfU/ezRTqbjete0YvU
q2jHgytdpgw41qfjWhRBP0fDmowhzBJjUt1c0Nay35Y+5MRCcAyzZW+iUVxhm+WKRX3gM4Bo
bjs1xA3ZngdcsFDR0qOli4YigZBu+yF1B72slltZUQxn+jl6Q6XPY1+iwA01V/qGB2kZ15qb
mqlXa+PqVAseXfdu8S1bWMO5WIglMJr2TgYXGkZdM0eGfXahkrQ/NUSFEFNvguim5vDlGcKt
2ApJNzmzwoGguYo6Mr/M12YC/Nl9KNhvfMcG+CEwsbYLrY5Ip0dMkxNTKs2qZa4VnSyvkg2t
OTcwFacbqAR9GtqAdrHoe+9ojMV6NbKEtz8NvdnYk+f/h02S10ku5R5N1SydCTl6tXvYRC7R
lhiCshwz4HJ3njq1lFpKURBkPdWfvA+0L8HJeiFCcsf8sFxrzSM5xKRvCmDbXjfMb63GZnuP
6NajozUn8h4rgJi/7g1bw8Eg1Wxh2iDC/VQSrXwkOA+KB1x6fHx7/f76x/to9/Pb+e3Xw+jz
j/P3dyqE1jUoYk/nr+0Nped4BbxCXippEVVY7oO6EFvUzExsZQcAp9HxQatbvYRwJRZnkUO0
T78BAwa+oqI4cJK/0324PCTKXv6Bp/+DNxCtE0uXuc0qc25u00qRVVhQDN1st4fFBo0P2ERj
an0yr9IA0P3ExQFcHyrSpSYJbORCfAVRunfrfuGW3+ysLQL4NKlPeiCZGa/pBET7XoqwLeNH
7kGOqoSea+mL4m2eRpuEdJMmN5G1RW2I4a7MZdyNckfJNzydoApI0zE/syaOD8Q0sPNpyGWh
dW8+Hzced0ssyrzKvdzuA3SqN3iR20UV2onS6WMtAxMGtluUlnMIiFrhRsfu+F250R/Ubh8Q
rP5VoYzTVGT5iZxX28TpPXR+Pbjv99Y8jXt5zYOY5oWwLQ7NjT7w2qW3CR4dvrx+/Gu0eXv6
cv7P69tfl/njkqKG2VlUiW2XDGRVrCZjl3SIT+aRZK7c9k1RX6SP3q0vtZcqN+DWd6RJiwUy
9zCECCAI83x+IlkqdE08bVYy58IC9VCMW2QXxRhsuSDGuMkFMW65LVAYhfFyfFWsAFtPr4g1
VBBDvg4LRkxEwHCi1FNZqMnE7T0PeZk8uKRUTcbTFWy50yjZki3Wnmb4HGPZRPTncM6UPYiW
kxVjcmRXMTnpmQWWfHpsouFHnim3LrAlVfPxmKAuSeq6T/VOCqwy9YynG3idqalPVKVLK4Uq
AnAtXFgRfJ3xorv0IjzMnAL1+GuOtViwqRZLluVbArsDGN6tWFsmeCEMZxoXmqq0mkOBLYZb
NjiJMzOkS9CTwt4VWCJPKykJWkbQCoL24NMeThYQIomAIX/qmDldqLDoBeAHR+993dfOZnLH
Wd0yXpPnT89P1fkviJ5JzvGtcxBS3BBIfjJlxoxh6qHDmpD44ERubwf/XmyjOLwdLzfbcEPr
PgRY3p7x4W8V4xBnfTSFXSyXa1aywLy1iIi9VbAGXMS3g0PxN4pxs6QM2pfUkDhubF4Ei310
UxuslwNtsF7e3gYae3sbaPDfkBSgb+tTcP7P1geY8Cz1pq8ieJdsbgffJvHVZDljpprVZDVj
Cw9MY+Z3U4kQfmvPRfCtjWfAxR5f9lzVv3r4q+qhhRcRbRLG5Z7RdpI+/NZxZMB/Q4Q3d2mD
vq1Lr7QCwvcKzSQ63iUmx+BySK6GcFFaxlvnGMwDgO+cKDkMIKRWXAfYxU6omFS5Gv5gagV/
wvf5DA7osjuth0spcvgRDiDi+Boi1L0vesy4D21PQUAyxIlW6zXdDHSydq4/LXMFXItCl6Le
xWlhn4A3zNnydHK1uy7Vary4GNy7zLCYTMYeE68ctpEKe6SykCEtI9eZF4LFfOY0LxKx5kWo
2gicBFvJCD5EcDTVCQMgiod6G4a13gbT20gASDmESJos7sZuCLceezGerJwrwe7LC3ozBYCU
AHjpl3fO2YiSht6LGdRnr93J4kJnHtsAIB0ERCaH9WJCW6wAIB0E6E8YWQ8VwpSSsXG1sliS
7+W6DNZ31ibmQl241CavPrkBrzwJFvuGc610LqLrpqrpSk6TqhBecxSaobfeTACnEBMO8rFs
Qwg9E8b5IEa3oFYVoAJ3TITKphNwAaughtW+TLJtfce4dwLIw0IpCAREG1+1H9GFsLasUSf+
O+fsAhhtzXrFthCNgIm0aSGU4tM2RZnMnWfdqpBJXYBXcTiHTCjjHHMpuzETXJfwvlCqPoXk
STHMX+bis3c2sRLL5Z2YUNSApIZjgrpe0FQqh/ViTlGXZA4rkrqmqe65E9DXYrzYjslnj8iH
6+FtnGkttth6iYEJfp30L/AHoWLKLaMlWchEj1Pv+Ke9mE4OC3L1amJqXHjmATcskos792y5
B9A6mTKnhvb6iaYVVDJkqBDCWbsMLIX7OLojmdorilOUcNrVmJWx3NUgd22fKZnv2cdBmjQf
J7UAQRD03YIjlw3jMqygJLVYzSrgUMMRAbuZl6OmRvGUIpcuEWpnXC8FhX0uZWioTm4clVNT
KIcCVt/wbR4vajd9xdDdVhxVkWSNc5OLYVJH9Z6O+4hGraIS9z0yWOdi6vXH28ezb8iGbxQd
p6CG4pqNGRqevzmCUmXYXg43xNYDgUlyocPhbo9kGqBH1MPLBJkYpMNdLUTtE5JF5Hn6/5Rd
TXPbONL+K6497R5mI5L6PMyBIimJMSnSBCUruai8tiZRlWVlbadqsr/+7QZAEgC76bw1VeOo
nwaIz0ajAXQf74vqNqyKnXm8Km+NVVVY74B9NJpP5obgQ2tqhrHlWhZv6o3kf9aHYOA3DJDB
wvd6g72Bd9vbbXG/tZPrIgrQwg2lBU+L9Xs7gT4ZIvPGD94gcppECg6X5uRR5+b0aNrGyrml
Wry6c4ljMMUsL8XBx6La9rqBvqll/5dpPR0v6TlCjci2omGaLYuD3V75xigafjq3WJpTQ81n
XHUL/JHkpbcCxi6puq9znhNnpY/hcXiWduC7HE1ZIut0sLl2STPrQw+nmnWK+06BnhHzcAt/
KnPkol3fSaBOARpi10mqiXsv66ydGm7I0jJyp+tGlL381L08kaU5SAi+hfAUpoyjgTofV1ly
qFQ/mPdA5eW6PL7jkupLfWmZOg0gl0G822pR1eWitNiHLi00hZ4idS9glYfp08vp9fx4o+4X
lQ/fTvI5ct/dYfORY7mu8Vpv//MNggqpdemLZGgvadF7SzcJjO39jLYMfVQFN1d9wj/w3TYe
DyjW9QYE7pq6aVGsFLvbEvbdwGYaOaxq9OkuUUhbCK149a58GTtvTLbPBXVFEeWLm2NDa942
x/VxmW5j2OVQRruWG/YcsvGXX7Al4E//slHLu7ed+8AI566syfnYNEfv5pabSD3iPV2u76cf
r9dH4klRgmHC9Mlp10QgVDuE3uzW8qoAV8IKEzYhqC4WdDfdTzrE2Bg2WBgLNl/JAAo8lSc0
M53hfSSonuoY0jLUFyOdfGFRo4p5H22hR8s0I6cU0d6qH35c3r4RXYBXfszWlwR5JYcotAKV
/U26Sd7KKLLGnHEZLFNZDxX42vtCwCKP+4VS44yutVW7VuaivnWfVkkTXQYW+pen+/PryXj6
0G0AGm51pZ7aAbQcUvNtMoVB+k/x6+39dLkpQN/+fv7xr5s3dEjyF4i22G1xVD/L/BjDQp5u
Rc9easONrA8vz9dvkJu4Ei9AtAU43O5DY2hqqrQQh2JnOUDTbt0wnna6XRUEYhXBApNkAMzN
PNveoUqvqgXNdHpyatUl66MSXr5eH54erxe6NRqFRQZ8NcZed8nChTCqeO/lvCYcy9ysCflp
FSToUH5avZ5Ob48PsIDdXV/TO7p8zeVvc3w3NAwxHd1yVweRawnqFu+WXL45GeS426VRpO+C
EyMcM1jvaqNfkYJu26z4e+ryOvwQTpgJ5K6iMicn6UdNpJyq/Ds/0A2H68K6jPY+Of7Ug6wd
dqbZYb3s1E1g4wCKevvXaHmUlReXx+2qCqPV2l02pVHuviK3zXrJUm42unvGVEFkSe5+PjzD
QGMGuVKMC1gH7kxDgjqLgNUNH/fGSwcA3TgF3c2lKkksqt5CsxZL+oWGRLOMtCRKLActJSvC
OOlnWkQg89n1ME+1QHTX2CqvV+JoLRfNmc/GqRCSSmv5aMgldUtYrzeJe6RDH/QgI97vrd1m
FDlsy3o00UuvpSO9qMMWllp39DaoMsN4kuPDlGg9c660SLQWTZfes/Ma5CVNjiyzdAeQz84N
2LQFm2TyK5Y12CDP6EzmNHnBkE0j/xcREc1gkJc02TR4d2SrliaZzMSqpUGe0ZnMafKCIRt5
VxjCxoo0qRgtUrvzWVcrgkqJXxxxnJ1axejpkUtzU9XSiKyl1VdUtoUNrWtyI+ahA2Pz7qWB
4UtADvPmUx5bjG0Mq6eg1c6UoAY9K+5x+lJYmZNZSTVkDaLEMQfLgtwG6JiTKCEAn2e+lxAF
tMyk8q4i1Z7qTRqek4XmcblOAbovPsFNdbpGAT2cn88vf3PrpX7RuCft5tok4ihdDdUsYPfy
ov81U0+Pjl9dN3pNdObf0sVbQ1iOj1hWVXLXVFP/vFlfgfHlar2zVtBxXey1n/BjsY0TXGpN
MWiywTqGtsCQewJv8WLziHD/MSd6GRRl+Dt5wtY/tXO0akn4FkejgJ6LMi6K5mRsluo27TGO
q+hDVjXmP+KqboNgsUCXZoOsXc8dk73jMa+VKHXU+epL/n5/vL40oUWJiit22P5Hx89hRD+V
0DwrES7GzDG2ZnEdCro4hugImDCVmqWstxOPieioWZRGgcfBeSpoS4nmrOr5YhYwTugUi8gn
kxF1EKrxJg6RKbMbIOo/NQI9qai+uJasMvNm/jEvyedKuHlIVz07ryk8U/P7KT4klDF5LPNR
Sz0yoTMNDnQsDLuYneMd02C8XaUryd4pnkjWPg/xhZMqwcXOX/2TjD1kJLfr0pREoOBoWXw7
Y9GELGerBhw6bW/ih4+Pp+fT6/VyenfnfZwKb+ozPlgalPYFE8aHLBhP8FXZIC6YiJQSh2Hx
Ec7lD3ti7lYJQD7jNQagMeOReZlHMPOk10r69mcccgF+4jBg/AzFeVjFzCMghdGtKzHGPYoc
NfolmyytthLzY6PWfEF4SGk7+u1BxHRJbg/R51tv5NFOkvIo8Bm3bLAfnY0n/ABpcG4AIM7d
+gFsPmacTAO2mDCvwRTGVOUQwdBgLpIdoqnPSG4RhayXb1HfzgOPLidiy9CV9Y0VzJ6zah6/
PDxfv2HE0Kfzt/P7wzP6mYUVrT+rZ6OFV9GlBdDzmZuJAC3osgLkT+lRjNCCEyAA8Rkyd9oA
Gs/Yb01HU1guQA8CPacKs4yZqxYnL2JmM75Ws+n8yNZrxkgChPjWmDGO+ACaz2mndwAtGKdv
CI054QwbQM5dTumPDqjysPB8zsJ4SCpfvfEcSQXbAp/Fo8iD2eKxeLLdJ1lR4oP+Ookcd+j2
vjG0o7Zu0vmY8W22OcwYAZ1uQ//ANweourOYRbM68sczxtc8YnO6OBJb0CNPYfRgAAXS45xQ
IuZ5XJQMCTJ3SAELSEei+OJ36lkOM/OoDPwRPbIQGzMeUhFbMF3QPIPDBzeT2Qy9doRkEDt9
Ax/mvd3x23A3m5NarNSV92Eccad/Uo9Ouf7tWPZ0iToGwCfGoVZjNdGFNT4r5HA65kU84O2/
lhmO5h5drgZmYkM08FiMmEALisPzvYAeExofzfEp8GAOczFi1mHNMfXElPGIKzngC8ztbQXP
Fsx2SMHzgHmureHpfKCGQoVp4BjqLBpPmNfn+9VUOpxiPEUp04g7jrvlfWgpNxf71ev15f0m
eXmyVnhU6qoEFA83KrWdvZFYnyf+eD7/de6pC/OAWQU3eTR23eK2p3ttXiqz76eLDAOrvNbZ
X6izEAPRapcMjPadTJk1NYrEnJPe4R2+7WKsBfjEm146sSBplaI0WZeM/ipKwSD7r3N3cW1u
lrmtYO30LMcUQsWnugxw9LaXTgZZCrJku876tp7N+alxHwgJ9aVQ85SVZlAn26JsICOduZ0Q
ZedcgzbI9bJQFig91mHYP6gRyimwk9GU01EnAbMnQIjVyiZjRhIiNOZ0QIA4/WoyWfj0SJZY
wGPMKwWApv64GlBWJ1M0Xg/Ai+nAbnwyY/YvEuJU8clsyrbbjO+j2WzENsCAfhww0xVE1Jwx
UsRlUWPAHRoU4zGz2QE1y+N2l6iCTZm1NZ/6AQeFh4nHKmeTOTMCQTUazxjn44gtGJUKFiio
92juu4GGHI7JhNFQFTzjTBcanjLbV7UA9lq+cck2NNVVBAUQO08/L5df2thvSqceJsHV6+m/
P08vj79uxK+X9++nt/P/MOJPHItPZZYBi3HdXN4xfHi/vn6Kz2/vr+f//ETfcLaQWfR87Fv3
g5kslJPq7w9vpz8yYDs93WTX64+bf0IR/nXzV1vEN6OI9mdXsEnhxBRgbmfpMv1/v9ik+6DR
LLn87dfr9e3x+uMEn+4v4tIaOGIlLKKch/4G5eSstDOyYv1QiTHTYst87THpVodQ+LAf4qxP
5S4YTUaswNR2s/WXqhgwm6X1GrZDtAmHb1W1RJ8ent+/G+pSQ319v6lUtNuX87vbCatkPOaE
pMSYV4zhIRgNbA4RpGMCkwUyQLMOqgY/L+en8/svcgzlfsAo+/GmZuTQBjcizJZzUwufEaub
escgIp1xdj6EXMtxU1e3XkqKgYx4xxhkl9PD28/X0+UEGvdPaCdi7nCGZ42y41+irKk7hQkw
YCSXMKc0rA6FmENjsOlbBi6H2/zAKAjpdo+TbDo4yQwe7gt6ImYin8aC1roHOkHFUDt/+/5O
jseohG1gRs/tMP4cHwW3OobxDm0xTJ9lAefbHCCQGIyj6zIWCy7QqQS5Z8zLjTfjRCRA3MYq
D3yPCXCBGKPnABQwJkmApszUQmhqm+WJrY10/ocPvaz3F+vSD8sRY4lQILTpaLQicm82S6nI
/AU+mTdtMRbGhG6RoMcoaJ9F6PmMhlSV1YiNdFlXbJDKPYydcUQPSpDVIOR5QY4gvWXZFiEb
n6Uoaxh2dHFKqKCMY8oJU88LmE02QNyr7vo2CJgZApN9t08F0+B1JIIx48ZPYkysp6ara+hN
LvCRxJiAR4jNmLwBG08Cun12YuLNfdqh6T7aZmxnKpCxZ++TPJuOOPOEBBkHhftsyh2bfoVh
4PcOg7WMtWWouk/78O3l9K6OqEjpest6VZAQsx29HS04S7E+os3D9XZgyet42KPFcB1wYXvy
PAom/pg/eoXxKTPntcJmrG3yaDIfB2xRXT6uuA1flcOc4VdTh62XW3P7mOo21aE/n9/PP55P
fzt7Fqx1vqPXXiuNVoken88vxLBoV2sClwxNnNObP27e3h9enmDf+HJyCyLDsFe7sqbuO9gd
hV5eaS5dFPqD1p7ox/UdtIkzeXli4jMCIRbenNHS0RIwHjAgjJn1WGGMdSEqxyPudAcwj5FN
iHFyS6bjlJi6zNgNA9NwZKNCo9uKcpaXC68nEZmcVWq1H389vaHmR4qhZTmajnL6dcUyL51L
HYRSsgwr6+52nG1AwNIyPS4Ft7BtSmZMpFHp8buzMvO8gVsUCnYmeweCnJtYB3hiMuXO4QAK
6BGm5Z70M0yPiAm3Ld2U/mhKl/1rGYKOOSU7u9ejnSb/cn75Rna0CBbuemmuXlY6PWyuf58v
uKnDIGhPZxQCj+Qgkkogq7GlcVjB/+vECSrUNe3S47Tpknv4U63i2WzMKL2iWjFbfXGAcjKa
FSSipcQ+mwTZ6NAfZW1vDDaUfvP5dn1GZ2+/cUHFF0wAP4Q8zqLywRfUGnK6/ECzHSMM0LS7
YFQ8ELFpfqw3SZUXUbEr3cO1hi07LEZTRgVVIHcum8MmhjkKRYieezWsY8zAkxCjXKJVx5tP
6NlFtZKxVajpK5T7PDk63u+bQWx6fYYfbpBeJLVXR3pk6V/ZkFGSLK+R0DMGYfVQjy5Key/V
yVOHbGMz3aTLPf2ADtE0PzA7JAUy9zI0Cmsm9QAKUXmtwS0rvhxDF1Jsns2tCZahjMLFlPTX
jqh8++F8s/FJVJfUjX7Joe81OJ3dPgGxsnO9wZjQbjs23F4jScVyc0pUp0kU8m0A8KaCf7AM
Xy2lVamn1d3N4/fzj370DkDsuuHd5XUa9QjHMu/TYL4dt9Wfnkvf+wTzPqBox7QWHN2OteJg
6rmmAWclhkTJheVWP4TRnzJh0majYH7MPGyD/mvYzLfpGBatXILaUhsPXzrXNcALC166TsyI
oHpoYRvbzzfl407jBvk+We6wbqVLS02nSopUxHnq0kqzwxRJJAZXJvAKu1UfIIlotdbt1Qyf
sKpT9CiP97IjM/iZ8ocAlYS/S2hn80I3UNtAYmEaJ6YHHXl7CTnsC/UyuzJ2mgUjq9WJlTdS
tzVsxKjnO1V/+Jpvezqw24e5E8HQdsowumVEvXyOtIGuVP7fgVpXRZZZr64/QJRs71F7YcxN
sr7v4qJ4P88c45oqo+Ot74niKwYlcn8RROX/FGq5NG5zSbh9feumazvQSaDeC7ncjkc1RVRd
1a8I0qUfVLYmhqcwki4DlHWgdiLW+O4n4wQ0IOXu33JkpnTozZcb8fM/b/L5VSdM0SVPhaJy
Y8SBMojHHL3lxBaMZCeyBJLkYoEPTnpk9K3TZmMuHQpeyFT04qA40FMWsFCXH2UZcUTMl9Lf
n/3xxmVC9hEWkJjnh3xCDQYy3p3NoQJJ6LboNrFAvS22KkvkY6usolNIvt/g4ZplK3yibEiV
4fOq2Cm0dOoX1iFB7vWqrqHO3iqYjit7rIuqcl5/kXzxUEs0TCJFT2lMReXbJBk6wm1yNYIP
IGXaAcjkoX1gEem1yyxniFoMKPhwlelNExlKNN1ui2YY2V0oBaxsc76bFQ//dbV2hgEe/0EZ
ekUw8V2dp73m0fj8oJMPfkc5fW6/Y+VUHsKjP9+Cgi5S2pJgcQ2ObunHbmhgyFCZjLepBj+I
waEFmnc5KHnysCw3BWpocQ5DgN4KI2MRJVkBa0ZSxQlfJO0p4G4+mo6HO12pLpLz8BucOAup
a9UtA/qhuPSpckxeiAx35Nu4DgbxsRFu9xvQQPcbXHIYfMzImLKQp3GYwFW+cxHbl4Md1pfw
Fha4TdTeGo8pXyIWR5Kb+r4FSamwQc34wuOU1LA5YpEOSLXOLQDWn/4QRs+M2I/wgke/7ohL
5WXZrqYGpdRtYOsDjU8BJ1asue6r7SrRPSrtBJHeKtYqVP1kJhS45WnBgRIprepArBESQccE
pU+7lkOmMJ9Oxh8JCeU+4D79SnKgg8lhwVkD6vkeZSuXcHpc5yl6msncOihtHEcsbVu0FEgj
Kb6N53b/uf3KV2mip9e/rq8XaZm8qLtKVpTPdgOTHyPpJYFuUYVTGrd8y2z6r9AEx1mt4WJP
sl/svGOxc7+t0UbdwKf1OqVG5HJvfVp54/EpYmAT681uGyfVwXcLo9xmDjWDKAm86baB1m73
DGHny+zl6fV6frI6YhtXRRqTuTfsppF9ud3HaU4L9jik/HJu95aHH/mzH/xRkeX2OqVsdB1e
REVduvm1gA5Z1o1R0BQS9BxC5KnWyVVZ2b6UdQnxQZGIQ6ow3QqgfZJ0O8YGgaKwtUD1mqyF
9rdiemxpJVdiuz/RHuEk0TxZanzB9ersVm+7F8esXJf00a1iolxcawbpd7j3EXX58P7m/fXh
UR709Ge+YGy/SkDVG3IkElm287VcWw7dtE/dsgIV68i+S8FUx3xdteyCv5/nsEZ7qmdbLlFX
YZ0etPubC5GPfpf04ffSKBkPXBts2PIw2hyK3ht+k21ZpfHa0BB0TVZVknxNOrQTSqqE0IZx
og5hqAegMusqWaemq89i5dDtAscr+qlwWxvtnAZ/04yCqmWdJI2Mg3/2nbYVpeIwfx7FBvbY
u1wGKlZhof/0jNMZI5920u2yOoXWOEhTj3tdg3Rnt8NnrevZwqero3HhjZlDQWRwXZoYUBuU
u38TpFf6EqROaQUvFSnpSRmdOC93hh84JGgPd+hniaBv13GDWTO6gn9vk4i2E8DQQha63oXr
RrG5gGD7kVGPEs7Ppxulu5hugyKYGQn6f4+l6wVhLTj7EE+M6wRGFJqZBT3EpUNhMxRWcqj9
o710adLxENY1/VC6DvpJAvnhQqQwACJ6UjRcIol2VVpT2wBgGR/NQz5N6HJ2PjvmMrSZpLtn
4nufl7G1ZcHfLDO6DVzKTrCNqik09goPTMjvf+ahAw+tV8LnsCLqgxpa1qok3ZhuKHQLtqh0
FyqH+JptyZa52qEdaAt80j0oXUrF3WtLBw8FNB49nbrPJSv02Z+u6GJt02ygsVY+38hYPlLH
c5qrHUnoNN0d+Yp2XKpIFyXVK6sU/Z0X0h+rofKAroqPtb+4uFm+ZBtVX0o8MuJqgC1DzqWV
0L6guzM2l5AqgnQE1lFXocvXULTcwdOrPBXCDo18tytqS3WRhOM2qaVfUCk+V46zsUaUV4Bq
/vuw2jrtoAB+KN2t8vq4pw/SFUa+48dcrePGcFcXK2ELIEWzSKglWnMscrRW7cacnKEF9FcW
flHpuyndUmG0x2kFS8wR/gym7zjD7D78AmUssqy4NxvOYE5hv8bEgeiYDjAgZI0/YswTaLqi
tIad0hMeHr/bzrBXQopMcvHT3Io9/gM2Lp/ifSzXv2756xZgUSzQuM3M5l286kHNd+i81f3B
QnxahfWnbe18tx37tbPa5QLS0L27b7mN1E0kgaiIE9TL/hwHMwpPC3SWLpL6z3+c367z+WTx
h/cPoyEN1l29ovWrbU2Iu0bVoGuq7Bxvp59P15u/qBaQrlnsJpCkW3c7YoL7XD5Fd9MosnY8
dox3OWmVRE48ozQnpySWMk5IAUtPUfXyho1qFlcJZWW5Taqt2S3OVaI6L+36ScIH6ozi4bSk
zW4Ngm9pfkWTZCXMnW++AmWzSixPwO2J+Dpdh9s6jZxU6o8jmJJVug+rpqsam0q/Z9tPpyKS
iw80R53kVgsUVbhdJ/zaGcYD2IrHErmeceiGTwiQDFbDwMuBsi4HijOkuA2oFVEV5qQEEHe7
UGyssaYpapnv6Y82rCT6QL5yCws7SpGikwYyI80hd3e0sYPi1FdS/q+yK2tuY9fRf8WVp5mq
3FOxYzvOVOWB3U1JHfXmXizZL12KrTiqEy9ly3NP5tcPQPbCBWj5PmQR8TV3ggAJgNMfcLN9
ANwkcUBWKrlhTEtHAL3rjGXTp8xj0VVNWy0OiNMlMp4AX4aLb+iDlAEr00BGkaSMzcYRK8U8
lSC5aM0MM/322RADJuT7NM6AtXACfjqxDAqedpmtTyep5zy1JArtmWtV5+ajD/o37kUJKpw4
hUpHG+0gMKYDmb4E6HGn78UtwnchL05P3oXDSUMCbZjRxulO8B/HcXIYAB/utj9/b/bbD16d
Qv0awlS18RWTKXop6FNJYPRXrPw0wSXLnJscIN7ji3TONtITnQ0Kf5uGeeq3dbulU9w91ySe
uvBqRT6ToMHtsVPaaWtetGU93wW5Nm9qh6J0OuMiUqETuTa/eHDLa5WFFrIFoSz94qgPgP3h
7+3L4/b3X08v9x+cFuN3aTwvhavp2aD+oAMKD6Rpt5bndZs5NxAztLeRw2tPGTl6HQjlI5kg
yO6u/vGnJiqMR8PMMigGCe3AWIqgmObG0T92pvtTD6dRYBdSbdw8m6w0H2zTv9u5uRS7tEDg
XYXIMvu2sKPy2mMoiwW7zcccIY8EL/4wa+Vr4YjRKuGAmKkxE2dmWWIOWmJwGEOLMMi9GtKC
GmINpkn7wjjt2CDG3dICXTA+5A6IviR2QO8q7h0Vv2Bc3h0QfaLggN5TccY32AHRApIDek8X
MJHXHBDj0m2CvjLRVWzQewb4K+O+YoOYyFh2xRn3XwTFVY4TvmV0YzOb45P3VBtQ/CQQVRhT
tzdmTY7dFdYT+O7oEfyc6RGHO4KfLT2CH+Aewa+nHsGP2tANhxvDOD9ZEL45yzy+aJm7355M
6zZITkWIArCgD1l7RChBTaKNxUZIVsumpDWZAVTmsM8fKuy6jJPkQHFzIQ9CSsn48/SIGNol
Mlp1GjBZE9On9Fb3HWpU3ZTLuFqwGPZYK0poebbJYlyrxCKM83Z1aZ6DWJdqOijh9vbtBf0P
n54xCpdx4rWU19Y+jb/bUl42suqUPVr4lmUVgwgMGiF8Ubova47nEV2W9LFS2UAWEQ/orgSm
IEBoo0WbQ4WURMmFFOikySiVlTLGr8uYPnzokIbM1aXY8syQY6cVTBdbiJp6UnUhriT8VUYy
gzbi1QSeNLciAYlROOd+HowscQZiK95eVHlTMs8d4ENccaiySWFC6afDpqtfpdzrHgOkztP8
mjnW6DGiKASUeaAwfAOtYHwXB9C1SOlr+bHOYoYuF66BlF8ayOb5KsMISdTa6q8JzaEYEtsq
nmcCljq5LAcU+sRYykTMVF5eUXXoT8LHSSwMNQHq/e0DRty7e/r348c/m4fNx99Pm7vn3ePH
183PLeSzu/u4e9xv75EBfPzx/POD5glLpaId/dq83G2Vb/fIG7r3/h6eXv4c7R53GBxq93+b
LgTg0Ly4xrkULtssz6zjuXkYtkXSzNGGHtZ4WCdSLNWEI1tNw4PrUs7+UzwuncPfQJ3xExKo
moV+TLgGh65n7iR7MJrjsNjh1UKyO3syPxpDVFiXh/cjsc5Lrb8b93Sius5gE1oPam1xiXYT
9mPNHghz8lCKBee91Uz48ud5/3R0+/SyPXp6Ofq1/f2sgk9aYOi9ufUWt5V84qdLEZGJPrRa
hnGxMO9wHYL/yUJUCzLRh5bmrfWYRgL986++4mxNBFf5ZVH4aEg0Ll67HPBwzYd678nb6Zbh
R0dylyP54TAzlPGDl/18dnxykTaJR8iahE6kalKof/m6qH+I+dHUCxAQzLvljuI+5OpMlDj1
M9OPu/aTvHj78Xt3+6+/t3+ObtV8v3/ZPP/6403zshJEeyJqq+/LCUNvTGUYLYhWyLCMKnqf
6DumKa/kydnZsaWVaHvht/0vjPJyu9lv747ko2oGcI2jf+/2v47E6+vT7U6Ros1+47UrDFOv
lnOV5lVhASKiOPlU5Mk1Gx9tWNDzuDq2w8Q5QyMv4yuifxYCOO1VPzqBii/78HS3ffVrHoTE
iIQzylmiJ9Yl1bCaOtYaahQQpSTlaqr5+Yz2aBpWQUA5l3fUdV0RlQTh13051+v0CDSVuqF1
ir45+OKdN4UWm9dfXC+DPOgN0yIVVN+vnXa59KvUjoHcRzravu79csvw8wk5wEiY6L212gPc
GgeJWMqTgOhYTZmYAVBgffwpimc+T+yK8sb3HSskjU4nWHJ0RmSbxrA6lB/lZC+XaXTMBGg0
EMxZ4Yg4cQOieIjPJ5SLS7++F+YrsWMiZEslnx2feGMGyZ/9xPQz0TUgHEoZ5MxReLdVzEvu
0aYOsSrO7ACVWgzaPf+y7JQHHlcR0xNSW+aCukdkTcCEw+sRZUgfGw1TNl/NuBOHftaKVCZJ
PL2piKqenKQIOOfHOJIUp5p5e7zHyxbiRtDKWj+eIqkEEzLW2Y4ms5FyuhhZFvTrmMNsOyWF
jslurVe5Ozp6Ij09PGOsLku3GrpS3bhSWw1jQdCRL04npzRnoDCSF5PMxDU/0PGrNo93Tw9H
2dvDj+1LH/2dapXIqrgNC0rUjsoArYSyhqYwO4ymiempr0AhadFhILxyv8d1LdFdvsyLa4+K
MnSLio4/HXrSwYoNwF6B4Ws4QLHvJopEzYnPBSvUqvfUbZXu9+7HywY01Jent/3ukdj1kzjo
+BuRDtyJqBKSDu6lnQHYlVRwvYQ9Fj+S+jAYTHEaNDm/EUWKzj5OczM/vd/NQQVAU5ivZCHv
2fLHKtNCtI9m9svFyl808grPMVZxltnPvRp0HR2ENAixURewaCXR5yZ56urZRR8qEr05QyHS
8emxKUw3kzCWhKx82dQCC7UC3oVl2jtkxflPUNjv5XS11CE6PZksXJzVE4oC0y3k3KC67/IA
dOi8aVixDA+D8BBlChQVQpxMjUMFtSkn1zqiOpf2kgkUaeZ3NqlLqfVUp+iNHU5ukCMQF+un
04NVDMODBafrqo04mLiKGxjGaQkLc8li2MnWbZhlZ2dr2kjeLFMAl0xgtOT0QQRi87CWeVav
31OLrr438cFWX5JOFBYgT5n9EMm9V++hcjrnRSEPcCXt70AuZBV6p2jYqTqTa+dpZGoegMrC
5KCc2Ct5cOL1uAl9eIBd+uc8Aw1GZ6omi4K89TBXQJrkGGVvvk6YzcdAsKxUVNdpKvG6Tt31
YVQM6wS7JxZNkHSYqgls2Prs01eYxHg1Fodow6jdBi0zzmVYXSiHUqRjLqxrIUK/oL92hXYT
dFZf1CEk5kNfP8VzvMorpDbJUy5fWDPHJE6LZ/g6x091kvd69BPDBOzuH3Xs0dtf29u/d4/3
o6im7RLNm9XS8sTy6dW3D4aJXkeX6xr9pcce4y7R8iwS5bVbHo3WWYM4GC6TuKppcO/G8o5G
dyGNOam1FHF03haXRly5LqUNZBaCMlEuDStI4fisBcApJQyM6bqvhFQlrlLUPjxbVZdZWFy3
s1JFyjGP5U1IIjOGmmEAujpO7KOEvIxiauPX995mbL8hThyGL7SdYFXl0QwyTIt1uNC2iaWc
OQh0x5gJDNWv/aatCHlx1jljWXEYwzLEuCB1bXKU8PjcRviHZmEb101r3aKEn51rAkjAyCgz
9mBfAWD5y+D6gvhUUzilV0FEueKmuUYEjFUIUBlzttA5sRmTvxjXt3HQnWpavDakTsm7Y0zD
YS+K60EdcpLVOOJtkWAhHnWoQCmyKE+nex39H1CPTCxvnhutNTmppnW8nar9Mtz0UzLdsmAf
p5lKNvADYX2DycY2oH6364tzL01Fyyl8bCzOT71EUaZUWr1o0sAjVLBB+PkG4Xezv7tUpqfH
trXzGzNEqUEIgHBCUpIb8zbXIKxvGHzOpBs90bMY01RlYA+1LPEWGY9fjYaLshTXmqGYG3iV
hzFwMMVYAWAyW+XCb0ag0Ulomt1aXA3TrTvrTMJmVM0xsQU+O68XDg0JGLMJjWFcXzSkCYwh
VLfnp0FssCakQI8kQrkuLNTBEME5K1k3hQLnRUXQaylKZXPCQ9TNPJJnedm5EB5CWUF2BwhS
YfwKor7VKs7rJLCbl+VZj2xTq5ORWkovqdsLCEqoRkTf52x/bt5+7zHc/H53//b09nr0oO0h
Ni/bzRG+qvg/xnkTfIyacJsG17Akvn0+8SgVXnloqsnuTTI6eaFrwpzh6lZWjL2RDSId6BEi
EpDn0A/i28X4rZpG6pCBFmyreaKXj7H1FU1b2v14ae7rSW7dO+LvKQ6dJejDZmSf3LS1MAYc
oykXuXlVnxaxdmvry49T6zf8mEXGHMrjSAWMAYHGWLpNWJ2gjGMJVEp46vnGVVQZXKZPncu6
jlOZzyKTEcxAraRcMjCdjEGA+It/LpwcLv4xhZEKI6TlRssrWOm660eJVbWA7GHjaQxH/rRt
q3rxXKU+v+we93/rNyAetq/3vjWmig6wbLETLI1CJ4cioeP5hNqNCoS5eQJSaTKYpnxhEZdN
LOtvp8O4d9qMl8PpWIsAXW+6qkQyEbRqE11nIo0JL5RBDUiDHDU1WZaANNia+qKFPyBXB3kX
navrZrbrhkuU3e/tv/a7h04/eFXQW53+YnT0WE9VGp6DE5WUmbJ6SRs0gsV4IcZcKqHSKnTD
t5NPpxf2bClgQ8MQaSnjeShFpDIWFX0hvwCAxBf1MtiYEuqwIC9gciBHirMkdqNH6DaBWqbc
sdK4SkUdUtYoLkS1p82z5NrZQlYCVo5ucpGrnb1yu6JL9+sBm1IIPYXGecCLW8/jtlf13jt4
avTUxdLutl9h0fbH2/092svFj6/7lzd8u9JYT6nA4wXQPM149UbiYLSnB/zbp3+OKRRoabGp
YPk0NF1pMCIyatN2L1QOC1T9upxHFivH39ThR7+NN0Elukg0OPgisY5UFJX4XH817k7GgnpX
P9ot0Z5z7npFz/p+m+9sHIfMzPWmnEzkupZZxYV40RkiUO2LJEZlA7ITY0uqyDAjqzzjziF0
KWUeiVpwEvegQdcYt8FixSpFZ8I4xekC8uC7DJmAQVXSBD2MMXRGBAqn1AanplE3JiAfoy2r
v/p6ykQVtfVuU3EiUgWsL+pQMos0J5zIj7ReHiVRjYnLuhGJX9+OQKo/ap7JFAMIocmt/3HH
X1CkZztMrzsBK4JckEItsBUISHPzijNUdddUQlFWBKLELjvsOjM0nbdAvCFZ4LsSnjkU4o/y
p+fXj0f4hvnbs2aRi83j/au9yDKYtcDYczo8k0VHU98GeJ5NVAJYU0PyOA/yWY3nRKjUyBpm
NWPCr4ntAqMD16Kip8rqEjYV2HIi1zBniBI31VbtzQK7xN0bbg0kp9HTlpU/FLW7/7a/8dbb
aHtNlOgOHXbcUkr2QbJupoJSnNo3JPocE20aRy78X6/Pu0e0c4ReeHjbb//Zwn+2+9u//vrr
v8ftTQXiUvnOlaDqy8hFmV8NAbfIaqk8sOVTzBIPAmu5ZuIjd1MXWo6ZTUAOZ7JaaRAwwHzl
es24tVpVkhG0NEA1jd9KNEjUOYqrVQJDdyCvWN9XDgoBXbYqFZYIuoV4+8u4DIaGTmoX/8Gs
MCVRYDt1KRgHICXrQbe0TYa2ULAa9HHfROuXejeb3ossyd3gWzoWwNHdZg+aPsgWt3iMT8ji
eCkwtXIO0JkwEZqogrrFIL2SGL0Rt0oiCHP1PKono1jsiWmSW2pYQvdmdey8ka7tpcKGZl9A
wP1sxs8dRHATzIDghqjUiIGnnxybdDVDrFNfSJSXZCTD/glBq9Le4r3sZP6SkPZtJU8tEpAG
8WyLOVeH2i/yGp129Cld/yISvegAkIXXdU7Fx1BzdNZkWudRzS4dGWCgzktRLGhMr9nO+o7j
ie0qrhd4MOIK/x05VQFUAYC3Og4Eo4GpQUOkUq7cTMLuQ53LSNR5hyqUh5XIbA4znkdUAkN7
TD5gBSOn4ndXisWupNEO7V3ZIcwS1TuoBs1bFZuXh/NTRoGIcdtWswBfIItoGUSU6flpx9BQ
U0Jsm89mlZziHSvaFKLbIVB/6hSGqTIleoyxixaDwVXxfEEzerfd5ilSvX3dI/dHKSh8+t/t
y+beetZ52WScx3LH9fCsJS+h975rvZ8Ed5H5KIw79Mswv/JkZBB4IbmbhIUtJQOBYlIwe4Ez
qT7DKdpZfo6LehkxIcfV5bq6RK5yJqaqgqQwYRaS8ZBQCPb7oN9D1Q49wYwDvOeYoKuriDzJ
8W0wFmVdmvAwHbiMp2thBp+xIaUKs+ELuXZjEjo9o08/tX8w48Dd4aqQcUfWRhCAqHN6hSmA
OlOkfT0VXZ/MTtJhlie0VbdCNA3jB6yo+mqKp2M00BmwOB5R4sVsjUdIEx3OGQIrahzRvEXP
9OXEMrhKeRFXNx7tglmPcd2DxVT3o8XGAk+PgWnTrCPOIhyF0bCCz20WlylIoBMdpcNhTrSH
P3zuJqRycOfDDqhJmeYTMwK2plDAxJwsBBUChvH2mbiAjgwURJjncZO83nMS1tcK/w/MBU9E
L0gDAA==

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--x+6KMIRAuhnl3hBn--
