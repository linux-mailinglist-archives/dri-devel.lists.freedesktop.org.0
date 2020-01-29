Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF4214CF70
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DF56E402;
	Wed, 29 Jan 2020 17:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9083C6E402
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:18:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00THIScJ032758;
 Wed, 29 Jan 2020 11:18:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580318308;
 bh=nvr9vq/JzwPDiYmbUXo8cBqzCnvMA4Dq/PwGArn5lZ8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=a3fZTTYqg9R7TOMq95h5xoIEwmPdywTNjW2vSfEYj3rSbf/oWTdRqKk2V+fQUpjq/
 ndmJB6TK2aqiNXRHLmAhY14s6UaWJj1txBFqwPYUEKhvRbgT1NT2vpwcHEMH1Iz+Ft
 JpTmYWACcEHyDq2RtZsW15dH4zdg9Y3/zb2+aU2E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00THIS5d081013
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jan 2020 11:18:28 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 11:18:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 11:18:26 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00THIKp3041550;
 Wed, 29 Jan 2020 11:18:22 -0600
Subject: Re: [PATCH v3 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: Yuti Amonkar <yamonkar@cadence.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <maxime@cerno.tech>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
References: <1579690501-10698-1-git-send-email-yamonkar@cadence.com>
 <1579690501-10698-3-git-send-email-yamonkar@cadence.com>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <abf1f0be-1f7a-c930-92e4-1cf25aa8481d@ti.com>
Date: Wed, 29 Jan 2020 19:18:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579690501-10698-3-git-send-email-yamonkar@cadence.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: praneeth@ti.com, mparab@cadence.com, tomi.valkeinen@ti.com,
 sjakhade@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2020 12:55, Yuti Amonkar wrote:
> This patch adds new DRM driver for Cadence MHDP DPTX IP used on J721e SoC.
> MHDP DPTX IP is the component that complies with VESA DisplayPort (DP) and
> embedded Display Port (eDP) standards.It integrates uCPU running the
> embedded Firmware(FW) interfaced over APB interface.
> Basically, it takes a DPI stream as input and output it encoded in DP
> format. Currently, it supports only SST mode.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig     |   11 +
>  drivers/gpu/drm/bridge/Makefile    |    3 +
>  drivers/gpu/drm/bridge/cdns-mhdp.c | 2202 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp.h |  380 +++++++
>  4 files changed, 2596 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.h
> 
...
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp.c b/drivers/gpu/drm/bridge/cdns-mhdp.c
> new file mode 100644
> index 0000000..0bc7fba
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp.c
> @@ -0,0 +1,2202 @@
> +// SPDX-License-Identifier: GPL-2.0
...
> +
> +static int mhdp_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct resource *regs;
> +	struct cdns_mhdp_device *mhdp;
> +	struct clk *clk;
> +	int ret;
> +	unsigned long rate;
> +	int irq;
> +	u32 lanes_prop;
> +	unsigned int link_rate;
> +
> +	mhdp = devm_kzalloc(&pdev->dev, sizeof(struct cdns_mhdp_device),
> +			    GFP_KERNEL);
> +	if (!mhdp)
> +		return -ENOMEM;
> +
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(&pdev->dev, "couldn't get clk: %ld\n", PTR_ERR(clk));
> +		return PTR_ERR(clk);
> +	}
> +
> +	mhdp->clk = clk;
> +	mhdp->dev = &pdev->dev;
> +	mhdp->conn_bus_flags_defaults = DRM_BUS_FLAG_DE_HIGH;
> +	mutex_init(&mhdp->mbox_mutex);
> +	spin_lock_init(&mhdp->start_lock);
> +	dev_set_drvdata(&pdev->dev, mhdp);
> +
> +	drm_dp_aux_init(&mhdp->aux);
> +	mhdp->aux.dev = &pdev->dev;
> +	mhdp->aux.transfer = mhdp_transfer;
> +
> +	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	mhdp->regs = devm_ioremap_resource(&pdev->dev, regs);
> +	if (IS_ERR(mhdp->regs))
> +		return PTR_ERR(mhdp->regs);
> +
> +	mhdp->phy = devm_phy_get(&pdev->dev, "dpphy");
> +	if (IS_ERR(mhdp->phy)) {
> +		dev_err(&pdev->dev, "no PHY configured\n");
> +		return PTR_ERR(mhdp->phy);
> +	}
> +
> +	platform_set_drvdata(pdev, mhdp);
> +
> +	clk_prepare_enable(clk);
> +
> +	match = of_match_device(mhdp_ids, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;
> +	mhdp->ops = (struct mhdp_platform_ops *)match->data;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	ret = pm_runtime_get_sync(&pdev->dev);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "pm_runtime_get_sync failed\n");
> +		pm_runtime_disable(&pdev->dev);
> +		goto clk_disable;
> +	}
> +
> +	if (mhdp->ops && mhdp->ops->init) {
> +		ret = mhdp->ops->init(mhdp);
> +		if (ret != 0) {
> +			dev_err(&pdev->dev, "MHDP platform initialization failed: %d\n",
> +				ret);
> +			goto runtime_put;
> +		}
> +	}
> +
> +	rate = clk_get_rate(clk);
> +	writel(rate % 1000000, mhdp->regs + CDNS_SW_CLK_L);
> +	writel(rate / 1000000, mhdp->regs + CDNS_SW_CLK_H);
> +
> +	dev_dbg(&pdev->dev, "func clk rate %lu Hz\n", rate);
> +
> +	writel(~0, mhdp->regs + CDNS_MB_INT_MASK);
> +	writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_threaded_irq(mhdp->dev, irq, NULL, mhdp_irq_handler,
> +					IRQF_ONESHOT, "mhdp8546", mhdp);
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot install IRQ %d\n", irq);
> +		ret = -EIO;
> +		goto plat_fini;
> +	}
> +
> +	/* Read source capabilities, based on PHY's device tree properties. */
> +	ret = device_property_read_u32(&mhdp->phy->dev, "cdns,num-lanes",
> +				       &(lanes_prop));
> +	if (ret)
> +		mhdp->host.lanes_cnt = CDNS_LANE_4;
> +	else
> +		mhdp->host.lanes_cnt = lanes_prop;
> +
> +	ret = device_property_read_u32(&mhdp->phy->dev, "cdns,max-bit-rate",
> +				       &(link_rate));
> +	if (ret)
> +		link_rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
> +	else
> +		/* PHY uses Mb/s, DRM uses tens of kb/s. */
> +		link_rate *= 100;
> +
> +	mhdp->host.link_rate = link_rate;
> +	mhdp->host.volt_swing = CDNS_VOLT_SWING(3);
> +	mhdp->host.pre_emphasis = CDNS_PRE_EMPHASIS(3);
> +	mhdp->host.pattern_supp = CDNS_SUPPORT_TPS(1) |
> +				  CDNS_SUPPORT_TPS(2) | CDNS_SUPPORT_TPS(3) |
> +				  CDNS_SUPPORT_TPS(4);
> +	mhdp->host.lane_mapping = CDNS_LANE_MAPPING_NORMAL;
> +	mhdp->host.fast_link = false;
> +	mhdp->host.enhanced = true;
> +	mhdp->host.scrambler = true;
> +	mhdp->host.ssc = false;
> +
> +	/* The only currently supported format */
> +	mhdp->display_fmt.y_only = false;
> +	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
> +	mhdp->display_fmt.bpc = 8;
> +
> +	mhdp->bridge.of_node = pdev->dev.of_node;
> +	mhdp->bridge.funcs = &cdns_mhdp_bridge_funcs;
> +
> +	ret = phy_init(mhdp->phy);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
> +		goto runtime_put;
> +	}
> +
> +	drm_bridge_add(&mhdp->bridge);

There is a bug here. If the load_firmeare() bellow ever fails, the probe
fails, but leaves the bridge added. request_firmware_nowait() hardly
ever fails, but still this should be fixed by moving the
drm_bridge_add() couple of lines down just before "return 0;".

> +
> +	ret = load_firmware(mhdp);
> +	if (ret)
> +		goto phy_exit;
> +
> +	return 0;
> +
> +phy_exit:
> +	phy_exit(mhdp->phy);
> +plat_fini:
> +	if (mhdp->ops && mhdp->ops->exit)
> +		mhdp->ops->exit(mhdp);
> +runtime_put:
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +clk_disable:
> +	clk_disable_unprepare(mhdp->clk);
> +
> +	return ret;
> +}
> +
> +MODULE_FIRMWARE(FW_NAME);
> +
> +static int mhdp_remove(struct platform_device *pdev)
> +{
> +	struct cdns_mhdp_device *mhdp = dev_get_drvdata(&pdev->dev);
> +	unsigned int timeout = 10;
> +	bool stop_fw = false;
> +	int ret = 0;
> +
> +	if (mhdp->ops && mhdp->ops->exit)
> +		mhdp->ops->exit(mhdp);
> +
> +	drm_bridge_remove(&mhdp->bridge);
> +
> +wait_loading:
> +	spin_lock(&mhdp->start_lock);
> +	if (mhdp->hw_state == MHDP_HW_LOADING && timeout-- > 0) {
> +		spin_unlock(&mhdp->start_lock);
> +		msleep(100);
> +		goto wait_loading;
> +	} else if (mhdp->hw_state == MHDP_HW_READY) {
> +		stop_fw = true;
> +		timeout = 1; /* We were successful even if counter reached 0 */
> +	}
> +	mhdp->hw_state = MHDP_HW_STOPPED;
> +	spin_unlock(&mhdp->start_lock);
> +
> +	if (timeout == 0)
> +		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> +			__func__);
> +
> +	if (stop_fw) {
> +		ret = cdns_mhdp_set_firmware_active(mhdp, false);
> +		if (ret)
> +			dev_err(mhdp->dev, "%s: De-activate FW failed: %d\n",
> +				__func__, ret);
> +	}
> +
> +	phy_exit(mhdp->phy);
> +
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	clk_disable_unprepare(mhdp->clk);
> +
> +	/* FIXME: check for missing functions */
> +
> +	return ret;
> +}
> +
> +static struct platform_driver mhdp_driver = {
> +	.driver	= {
> +		.name		= "cdns-mhdp",
> +		.of_match_table	= of_match_ptr(mhdp_ids),
> +	},
> +	.probe	= mhdp_probe,
> +	.remove	= mhdp_remove,
> +};
> +module_platform_driver(mhdp_driver);
> +
> +MODULE_AUTHOR("Quentin Schulz <quentin.schulz@free-electrons.com>");
> +MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
> +MODULE_AUTHOR("Damian Kos <dkos@cadence.com>");
> +MODULE_AUTHOR("Piotr Sroka <piotrs@cadence.com>");
> +MODULE_AUTHOR("Swapnil Jakhade <sjakhade@cadence.com>");
> +MODULE_DESCRIPTION("Cadence MHDP DP bridge driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:cdns-mhdp");
...

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
