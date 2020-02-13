Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34815BB79
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 10:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB296F57A;
	Thu, 13 Feb 2020 09:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434A6F57A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:19:26 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01D9JEOt127361;
 Thu, 13 Feb 2020 03:19:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581585554;
 bh=tYWMN2YveaXfn9+798tLoVElj0lt1lXVlJG0sJnmZRw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qf01HFCPxB0y9gPgQFI78RamWbqiZ4CcmB9T6fsEkQYbAMYf9dCD1PCsx3rD3Jgju
 pKKUBaq3IkWKH5SSaMiKgQSu4HZyNircT5D+cqUmH+KcK6zxOFVwWxq702UCH8eKEN
 ZsoDcojWrb7rDChXtGMENnAWagonOwS1hnV6u3i0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01D9JEGH067261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Feb 2020 03:19:14 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 03:19:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 03:19:13 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01D9J9tq094940;
 Thu, 13 Feb 2020 03:19:10 -0600
Subject: Re: [PATCH v5 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
To: Yuti Amonkar <yamonkar@cadence.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <maxime@cerno.tech>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <mark.rutland@arm.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>
References: <1581481604-24499-1-git-send-email-yamonkar@cadence.com>
 <1581481604-24499-3-git-send-email-yamonkar@cadence.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6c2188ce-a27a-bb76-4b38-5fda5f282f78@ti.com>
Date: Thu, 13 Feb 2020 11:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581481604-24499-3-git-send-email-yamonkar@cadence.com>
Content-Language: en-US
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
Cc: praneeth@ti.com, mparab@cadence.com, jsarha@ti.com, sjakhade@cadence.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2020 06:26, Yuti Amonkar wrote:
> This patch adds new DRM driver for Cadence MHDP DPTX IP used on J721e SoC.
> MHDP DPTX IP is the component that complies with VESA DisplayPort (DP) and
> embedded Display Port (eDP) standards. It integrates uCPU running the
> embedded Firmware(FW) interfaced over APB interface.
> Basically, it takes a DPI stream as input and output it encoded in DP
> format. Currently, it supports only SST mode.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig          |   11 +
>   drivers/gpu/drm/bridge/Makefile         |    3 +
>   drivers/gpu/drm/bridge/cdns-mhdp-core.c | 2206 +++++++++++++++++++++++
>   drivers/gpu/drm/bridge/cdns-mhdp-core.h |  380 ++++
>   4 files changed, 2600 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
>   create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 8397bf72d2f3..c66f2ef04f71 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -27,6 +27,17 @@ config DRM_CDNS_DSI
>   	  Support Cadence DPI to DSI bridge. This is an internal
>   	  bridge and is meant to be directly embedded in a SoC.
>   
> +config DRM_CDNS_MHDP
> +	tristate "Cadence DPI/DP bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	depends on OF
> +	help
> +	  Support Cadence DPI to DP bridge. This is an internal
> +	  bridge and is meant to be directly embedded in a SoC.
> +	  It takes a DPI stream as input and output it encoded
> +	  in DP format.
> +
>   config DRM_DUMB_VGA_DAC
>   	tristate "Dumb VGA DAC Bridge support"
>   	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 1eb5376c5d68..71019088d257 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -15,6 +15,9 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
>   obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>   obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>   obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> +obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
>   
>   obj-y += analogix/
>   obj-y += synopsys/
> +
> +cdns-mhdp-objs := cdns-mhdp-core.o

I think it's better to keep the two lines added in this change together, instead of having those 
other obj-y lines in between.

> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> new file mode 100644
> index 000000000000..51ed9cdee161
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> @@ -0,0 +1,2206 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence MHDP DP bridge driver.
> + *
> + * Copyright: 2019 Cadence Design Systems, Inc.
> + *
> + * Author: Quentin Schulz <quentin.schulz@free-electrons.com>

Author is Quentin, but there's no signed-off-by from him? There are also many names in 
MODULE_AUTHOR, without signed-off-bys.

I think the rule is that you should have signed-off-bys for people who have contributed. I'm not 
sure how strict that rule is, and what to do if the people cannot be reached anymore.

<snip>

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
> +	mhdp->phy = devm_of_phy_get_by_index(&pdev->dev, pdev->dev.of_node, 0);
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
> +	ret = load_firmware(mhdp);
> +	if (ret)
> +		goto phy_exit;
> +
> +	drm_bridge_add(&mhdp->bridge);
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

The sequence here does not match what's done at probe()'s error handling. It probably should.

The FIXME here sounds something that has to be fixed (or removed).

There were also a few FIXMEs in the code, I think think it would be good to review all those, and 
see if they're still valid, and perhaps add a bit more explanation to each.

> +/* mailbox */
> +#define MAILBOX_RETRY_US			1000
> +#define MAILBOX_TIMEOUT_US			5000000

This is 5 seconds. It sounds pretty long time to wait in a blocking function.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
